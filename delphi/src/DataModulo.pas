unit DataModulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.ImageList, Vcl.ImgList, Vcl.Controls,
  cxImageList, cxGraphics;

type
  TDM = class(TDataModule)
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDTransaction1: TFDTransaction;
    conexao: TFDConnection;
    qryAux: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FHighlightingFile: String;
    { Private declarations }
  public
    { Public declarations }
  published
    property HighlightingFile: String read FHighlightingFile;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
    mSQL : String;
begin
    conexao.Params.Database := ExtractFileDir(ParamStr(0)) + '\base.db';
    FHighlightingFile       := ExtractFileDir(ParamStr(0)) + '\highlighting.cnf';

    conexao.Connected := True;

    if Not conexao.Connected then
        Exit;

    mSQL := 'CREATE TABLE IF NOT EXISTS donates(' +
            'id     INTEGER     AUTO_INCREMENT PRIMARY KEY, ' +
            'name   STRING      DEFAULT NULL, ' +
            'date   DATE        DEFAULT NULL,' +
            'value  STRING      DEFAULT NULL, ' +
            'currency STRING    DEFAULT NULL, ' +
            'valueUSD DECIMAL(12,2) DEFAULT 0);';

    qryAux.ExecSQL(mSQL);
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
    conexao.Connected := False;
end;

end.
