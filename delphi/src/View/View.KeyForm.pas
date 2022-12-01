unit View.KeyForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  AdvMetroButton, System.ImageList, Vcl.ImgList;

type
  TfrmKey = class(TForm)
    Panel1: TPanel;
    mmKey: TMemo;
    btnClose: TBitBtn;
    btnSaveKey: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveKeyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    FEncryptosBotPath : String;
    procedure Salvar();

  public
    { Public declarations }
    class procedure Key(pBotPath : String);

    procedure setBotPath(pBotPath : String);
  end;


implementation

{$R *.dfm}

procedure TfrmKey.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmKey.btnSaveKeyClick(Sender: TObject);
begin
    if Trim(mmKey.Text).IsEmpty then
    begin
        MessageBox(Self.Handle, 'A chave não pode ser vazia.', 'Atenção', MB_OK + MB_ICONWARNING);
        mmKey.SetFocus;
        Abort;
    end;

    Salvar();
end;

procedure TfrmKey.FormCreate(Sender: TObject);
begin
    mmKey.Clear;

end;

procedure TfrmKey.FormShow(Sender: TObject);
begin
    mmKey.Lines.LoadFromFile(FEncryptosBotPath + '\.env');
end;

class procedure TfrmKey.Key(pBotPath: String);
var
    mFormKey : TFrmKey;
begin
    Application.CreateForm(TfrmKey, mFormKey);

    try
        mFormKey.setBotPath(pBotPath);
        mFormKey.ShowModal;
    finally
        FreeAndNIl(mFormKey);
    end;

end;

procedure TfrmKey.Salvar;
begin
    try
        mmKey.Lines.SaveToFile(FEncryptosBotPath + '\.env');
        ModalResult := mrOk;
    except on E : Exception do
    begin
        MessageBox(Self.Handle, PChar(E.Message), 'Error', MB_OK + MB_ICONERROR);
        Exit;
    end;
    end;
end;

procedure TfrmKey.setBotPath(pBotPath: String);
begin
    FEncryptosBotPath := pBotPath;
end;

end.
