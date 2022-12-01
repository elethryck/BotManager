unit View.HighlightingConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, AdvOfficeSelectors,
  Vcl.ExtCtrls, dxSkinsCore, dxSkinOffice2013DarkGray,
  dxSkinVisualStudio2013Light, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.DBCGrids, Vcl.StdCtrls, cxButtons,
  Vcl.ComCtrls, HighlightingDTO, Vcl.Mask, AdvDropDown, AdvColorPickerDropDown,
  cxControls, cxContainer, cxEdit, dxCore, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, dxColorEdit, dxDBColorEdit, HighlightingRepository;

type
  TfrmHighlighting = class(TForm)
    pnlFundo: TPanel;
    GroupBox1: TGroupBox;
    colorSelector: TAdvOfficeColorSelector;
    edtString: TEdit;
    btnAdd: TcxButton;
    GroupBox2: TGroupBox;
    btnMoveUP: TcxButton;
    btnMoveDown: TcxButton;
    btnDel: TcxButton;
    btnClose: TcxButton;
    btnSave: TcxButton;
    lvDados: TListView;
    procedure btnAddClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure lvDadosCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvDadosSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtStringChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnMoveUPClick(Sender: TObject);
    procedure btnMoveDownClick(Sender: TObject);
  private
    { Private declarations }
    FHighlightingRoot : THighlightingRootDTO;
    HighlightingFile: string;

    FHighlightingRepository : THighlightingRepository;

    procedure MoveItem(pItem : TListItem; pBy : Integer);
  public
    { Public declarations }
  end;

var
  frmHighlighting: TfrmHighlighting;

implementation

uses DataModulo;

{$R *.dfm}

procedure TfrmHighlighting.btnAddClick(Sender: TObject);
begin
    lvDados.AddItem(edtString.Text, TObject(colorSelector.SelectedColor) );
end;

procedure TfrmHighlighting.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmHighlighting.btnDelClick(Sender: TObject);
begin
    if Assigned(lvDados.Selected) then
        lvDados.DeleteSelected;
end;

procedure TfrmHighlighting.btnMoveDownClick(Sender: TObject);
begin
    MoveItem(lvDados.Selected, 2);
end;

procedure TfrmHighlighting.btnMoveUPClick(Sender: TObject);
begin
    MoveItem(lvDados.Selected, -1);
end;

procedure TfrmHighlighting.btnSaveClick(Sender: TObject);
var
    mItem : TItemsDTO;
  I: Integer;
begin
    FHighlightingRoot.Items.Clear;

    try

        for I := 0 to Pred(lvDados.Items.Count) do
        begin
            with lvDados.Items.Item[I] do
            begin
                mItem := TItemsDTO.Create;

                mItem.AString := Caption;
                mItem.Color   := ColorToString(TColor(Data));
            end;

            FHighlightingRoot.Items.Add(mItem);
        end;

        if FHighlightingRepository.Save(FHighlightingRoot) then
            ModalResult := mrOK;
    except
        Exit;
    end;


end;

procedure TfrmHighlighting.edtStringChange(Sender: TObject);
begin
    btnAdd.Enabled := edtString.Text <> '';
end;

procedure TfrmHighlighting.FormCreate(Sender: TObject);
var
  I: Integer;
  mItemDTO : TItemsDTO;
  mColor : TColor;
begin
    FHighlightingRepository := THighlightingRepository.Create();

    FHighlightingRoot := FHighlightingRepository.getRootDTO();

    for mItemDTO in FHighlightingRoot.Items.ToArray do
    begin
        try
            lvDados.AddItem(mItemDTO.AString, TObject(StringToColor(mItemDTO.Color) ));
        except
        end;
    end;

end;

procedure TfrmHighlighting.FormDestroy(Sender: TObject);
begin
    FHighlightingRoot.Free;
    FHighlightingRepository.Free;
end;

procedure TfrmHighlighting.lvDadosCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
    with Sender.Canvas do
    begin
        Font.Color := TColor(Item.Data);
        Brush.Color := clBackground;
    end;
end;

procedure TfrmHighlighting.lvDadosSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
    btnDel.Enabled := Selected;

    btnMoveUP.Enabled := Selected And (Item.Index > 0);
    btnMoveDown.Enabled := Selected And (Item.Index < Pred(lvDados.Items.Count));
end;

procedure TfrmHighlighting.MoveItem(pItem : TListItem; pBy: Integer);
var
  Source, Target: TListItem;
begin
  lvDados.Items.BeginUpdate;
  try
    Source := lvDados.Items[pItem.Index];
    Target := lvDados.Items.Insert(pItem.Index + pBy);
    Target.Assign(Source);
    Source.Free;
  finally
    lvDados.Items.EndUpdate;
  end;
end;

end.
