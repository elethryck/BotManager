unit View.ChangeLOG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvMemo, Vcl.ExtCtrls;

type
  TfrmChangeLog = class(TForm)
    Panel1: TPanel;
    AdvMemo1: TAdvMemo;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChangeLog: TfrmChangeLog;

implementation

{$R *.dfm}

procedure TfrmChangeLog.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then
        ModalResult := mrCancel;
end;

end.
