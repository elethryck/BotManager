unit PairAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  PairConfiguration, Vcl.ExtCtrls, RootUnit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmAddPair = class(TForm, IPairConfigurationUpdated)
    frmPairConfiguration: TfrmPairConfiguration;
    Label1: TLabel;
    edtPairName: TEdit;
    btnConfirm: TBitBtn;
    BitBtn2: TBitBtn;
    panel1: TPanel;
    qryAux: TFDQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPairNameChange(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
  private
    { Private declarations }
    FPair : TItems;

    function Validate() : Boolean;

    procedure onUpdated(pItem : TItems);
  public
    { Public declarations }

    property Pair : TItems read FPair;
  end;

var
  frmAddPair: TfrmAddPair;

implementation

{$R *.dfm}

uses DataModulo;

procedure TfrmAddPair.btnConfirmClick(Sender: TObject);
begin
    if Not Validate() then
        Exit;

    ModalResult := mrOK;
end;

procedure TfrmAddPair.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmAddPair.edtPairNameChange(Sender: TObject);
begin
    FPair.Symbol := edtPairName.Text;
end;

procedure TfrmAddPair.FormCreate(Sender: TObject);
begin
    FPair := TItems.Create;

    FPair.AsJson := '{' +
                    '    "profile": 2,' +
                    '    "symbol": "",' +
                    '    "interval": ["5m","1h","4h"],' +
                    '    "tradeForce": { "level": 3, "up": true, "down": true },' +
                    '    "longShortRatio": { "up": true, "down": true, "crossTrade": false},' +
                    '    "sound": false' +
                    '}';

     frmPairConfiguration.Fetch(FPair);
     frmPairConfiguration.setCallBack(Self);
end;

procedure TfrmAddPair.FormDestroy(Sender: TObject);
begin
    FPair.Free;
end;

procedure TfrmAddPair.FormShow(Sender: TObject);
begin
    edtPairName.SetFocus;
end;

procedure TfrmAddPair.onUpdated(pItem: TItems);
begin
    FPair := pItem;
end;

function TfrmAddPair.Validate: Boolean;
var
    mSQL : String;
begin
    Result := False;

    if FPair.Symbol.IsEmpty then
    begin
        MessageBox(Self.Handle, 'Preencha o nome do Par', 'Atenção', MB_OK + MB_ICONWARNING);
        edtPairName.SetFocus;
        Exit;
    end;

    if FPair.Interval.Count = 0 then
    begin
        MessageBox(Self.Handle, 'Selecione ao menos um Intervalo', 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
    end;

    mSQL := 'SELECT name ' +
            '  FROM pair ' +
            ' WHERE name = ' + QuotedStr(edtPairName.Text) + ';';

    qryAux.Open(mSQL);

    if qryAux.RecordCount > 0 then
    begin
        MessageBox(Self.Handle, PChar(edtPairName.Text +  ' já cadastrado no sistema.'), 'Atenção', MB_OK + MB_ICONWARNING);
        edtPairName.SetFocus;
        Exit;
    end;

    Result := True;
end;

end.
