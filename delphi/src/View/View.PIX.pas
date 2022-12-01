unit View.PIX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  TfrmPIX = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    edtChave: TEdit;
    Button1: TButton;
    pnlToast: TPanel;
    tmrToast: TTimer;
    Shape1: TShape;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure tmrToastTimer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Toast(pVisible : Boolean);
  public
    { Public declarations }
  end;

var
  frmPIX: TfrmPIX;

implementation

uses Vcl.Clipbrd, Winapi.ShellAPI;

{$R *.dfm}

procedure TfrmPIX.Button1Click(Sender: TObject);
begin
    Clipboard.AsText := edtChave.Text;
    Toast(True);
end;

procedure TfrmPIX.Image1Click(Sender: TObject);
begin
    ShellExecute(Handle,
               'open',
               'https://nubank.com.br/pagar/3s4bc/KxNQs3r5Z3',
               nil,
               nil,
               SW_SHOWMAXIMIZED);
end;

procedure TfrmPIX.tmrToastTimer(Sender: TObject);
begin
    Toast(False);
end;

procedure TfrmPIX.Toast(pVisible : Boolean);
begin
    tmrToast.Enabled := pVisible;
    pnlToast.Visible := pVisible;
end;

end.
