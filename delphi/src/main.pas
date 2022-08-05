unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Threading, ShellApi, RootUnit,
  Vcl.WinXCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, FireDAC.Comp.Client, Data.DB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, PairConfiguration, Vcl.Menus, Vcl.Buttons, IniFiles,
  AeroButtons, Vcl.AppEvnts, AdvScrollControl, AdvRichEditorBase, AdvRichEditor,
  AdvMemo, AdvMemoStylerManager, AdvmPS, AdvmWS, AdvCodeList, AdvmCSS, Advmxml,
  AdvSearchList, AdvSearchEdit, AdvShapeButton, Vcl.Imaging.pngimage, AdvPanel,
  System.ImageList, Vcl.ImgList, PairAlertEntity, AdvGlowButton,
  Vcl.Imaging.jpeg;

type

  TfrmMain = class(TForm, IPairConfigurationUpdated)
    pnlFundo: TPanel;
    Panel1: TPanel;
    qryDados: TFDQuery;
    dbgDados: TDBGrid;
    dsDados: TDataSource;
    qryFast: TFDQuery;
    frmPair: TfrmPairConfiguration;
    btnAddPair: TButton;
    pmPair: TPopupMenu;
    pmmDeletePair: TMenuItem;
    Add1: TMenuItem;
    mmConsole: TMemo;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    About1: TMenuItem;
    pmmKey: TMenuItem;
    N1: TMenuItem;
    Close1: TMenuItem;
    rayIcon1: TMenuItem;
    ActivateALL1: TMenuItem;
    ActivateALL2: TMenuItem;
    InactivateALL1: TMenuItem;
    btnStart: TBitBtn;
    btnStop: TBitBtn;
    btnCopyToAll: TBitBtn;
    openDialog: TOpenDialog;
    fOpenDlg: TFileOpenDialog;
    edtLocate: TSearchBox;
    btnSaveConfig: TBitBtn;
    Bevel1: TBevel;
    rgFilter: TRadioGroup;
    TrayIcon: TTrayIcon;
    appEvents: TApplicationEvents;
    tmrTitle: TTimer;
    ChangeLog1: TMenuItem;
    pnlLog: TPanel;
    pnlLogHeader: TPanel;
    Label2: TLabel;
    edtLogSearch: TSearchBox;
    pnlLogBottom: TPanel;
    btnLogClear: TBitBtn;
    BitBtn2: TBitBtn;
    mmLog: TAdvMemo;
    btnLogExpand: TAdvShapeButton;
    pnlPathConfig: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    edtNodePath: TEdit;
    edtBotFolder: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    btnLogExpandAux: TAdvShapeButton;
    btnFimLog: TAdvShapeButton;
    pnlPIX: TPanel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure edtLocateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryDadosAfterScroll(DataSet: TDataSet);
    procedure edtLocateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAddPairClick(Sender: TObject);
    procedure qryDadosAfterOpen(DataSet: TDataSet);
    procedure pmmDeletePairClick(Sender: TObject);
    procedure pmPairPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSaveConfigClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure pmmKeyClick(Sender: TObject);
    procedure btnCopyToAllClick(Sender: TObject);
    procedure qryDadosBeforeDelete(DataSet: TDataSet);
    procedure ActivateALL1Click(Sender: TObject);
    procedure InactivateALL1Click(Sender: TObject);
    procedure edtNodePathClick(Sender: TObject);
    procedure edtBotFolderClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnLogClearClick(Sender: TObject);
    procedure rgFilterClick(Sender: TObject);
    procedure rayIcon1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure Restaurar1Click(Sender: TObject);
    procedure tmrTitleTimer(Sender: TObject);
    procedure mmLogSelectionChange(Sender: TObject);
    procedure mmLogCursorChange(Sender: TObject);
    procedure edtLogSearchInvokeSearch(Sender: TObject);
    procedure edtLocateInvokeSearch(Sender: TObject);
    procedure edtLogSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtLocateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ChangeLog1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLogExpandClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnFimLogClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure dbgDadosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }


    FFileMonitorTask : ITask;
    FBotStartTask    : ITask;
    FNodeMonitor     : ITask;
    FSelectedItem    : TItems;
    FLocating    : Boolean;
    FMonitoring  : Boolean;
    FLogClear    : Boolean;
    FNodeProcess : TProcessInformation;
    FConfigFile  : TRoot;
    FGridFocused : Boolean;

    FStopped   : Boolean;
    FClosing   : Boolean;
    FReloading : Boolean;

    FEncryptosBotPath : String;
    FNodePath         : String;

    FCustomStyle : TAdvCustomMemoStyler;

    FALerts : TPairList;

    procedure ToggleInactive();

    procedure LogFinder();
    procedure onNodeTerminated();
    function checkPaths() : Boolean;
    procedure SavePaths();

    procedure startNodeMonitor();
    function checkKey() : Boolean;
    procedure LogMonitor();
    procedure onFileTaskStop();
    procedure Monitoring(pMonitoring : Boolean);
    function doConfigFile() : boolean;
    procedure RestartBot();

    function getKeyFile() : TStringList;

    procedure Content();
    procedure LoadData();
    procedure onUpdated(pItem : TItems);

    procedure CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);

    procedure onTaskFinished();

    procedure setInactive(pInactive : Boolean);

    function isMonitoring(): Boolean;
    procedure onBotStartingDone;
    procedure stopBot();

    function getConfigFile(): TIniFile;
    procedure PoeAnd(var pStr : String);

    procedure ServiceStatusTitle();
  public
    { Public declarations }
    const VERSAO = 'v1.00.004';
    const CRT = '+------------------------------------------------------------+'+ #13 +
                '|               Bot Manager for Encryptos Bot                |'+ #13 +
                '+------------------------------------------------------------+'+ #13 +
                '|   Created by Eduardo Elethryck                             |'+ #13 +
                '|                                                            |'+ #13 +
                '|   Telegram : https://t.me/elethryck                        |'+ #13 +
                '|                                                            |'+ #13 +
                '| Donate                                                     |'+ #13 +
                '|                                                            |'+ #13 +
                '| PIX        : 54b2b96c-b1e4-49ce-92eb-ce69ac8f00a1          |'+ #13 +
                '| LTC address: LWuLWcfLfwa6hwJr5YmvQfEzGJs9k5Aw87            |'+ #13 +
                '| BNB address: 0x4d6282e42245dc4e73db3a9d775c3894b8b0403f    |'+ #13 +
                '+------------------------------------------------------------+';

  end;

var
  frmMain: TfrmMain;



implementation

uses
  DataModulo, PairAdd, REST.Json, FileCtrl, ChangeLOG, KeyForm, Vcl.Themes, PIX;

{$R *.dfm}

procedure TfrmMain.About1Click(Sender: TObject);
begin
    MessageBox(Self.Handle, 'Desenvolvido por Eduardo Elethryck', 'Author', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmMain.ActivateALL1Click(Sender: TObject);
begin
    setInactive(False);
end;

procedure TfrmMain.btnFimLogClick(Sender: TObject);
begin
    mmLog.ScrollToBottom;
    mmLog.GotoEnd;
    mmLog.CurX := 22;
end;

procedure TfrmMain.btnLogExpandClick(Sender: TObject);
begin
    pnlFundo.Visible := Not pnlFundo.Visible;

    if pnlFundo.Visible then
    begin
        btnLogExpand.Picture    := btnLogExpandAux.Picture;
        btnLogExpand.PictureHot := btnLogExpandAux.PictureHot;
        btnLogExpand.PictureDown:= btnLogExpandAux.PictureDown;
        Exit;
    end;

    btnLogExpand.Picture        := btnLogExpandAux.PictureDown;
    btnLogExpand.PictureHot     := btnLogExpandAux.PictureDisabled;
    btnLogExpand.PictureDown    := btnLogExpandAux.Picture;
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
    if not FileExists(edtNodePath.Text) then
    begin
        MessageBox(Self.Handle, 'Node.exe não foi encontrado.', 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
    end;

    if not DirectoryExists(edtBotFolder.Text) then
    begin
        MessageBox(Self.Handle, 'A pasta do bot é inválida', 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
    end;

    if Not FileExists(edtBotFolder.Text + '\.env') then
    begin
        MessageBox(Self.Handle, 'A pasta do bot é inválida', 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
    end;

    SavePaths();

    if checkPaths then
        Content();
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
var
    mCommand : String;
begin
    mCommand := '/c taskkill /f /im node.exe /im ' + ExtractFileName(ParamStr(0));
    ShellExecute(Handle, 'open', PWideChar('cmd.exe'), PWideChar( mCommand ),'', SW_HIDE);
    Close;
end;

procedure TfrmMain.btnAddPairClick(Sender: TObject);
begin
    try
        if frmAddPair = nil then
            Application.CreateForm(TfrmAddPair, frmAddPair);

        frmAddPair.edtPairName.Text := edtLocate.Text;

        if frmAddPair.ShowModal = mrOk then
        begin

            qryDados.Insert;
            qryDados.FieldByName('name').AsString := frmAddPair.Pair.Symbol;
            qryDados.FieldByName('json').AsString := frmAddPair.Pair.AsJson;
            qryDados.Post;

            LoadData;
        end;
    finally
        frmAddPair.Release;
        frmAddPair := Nil;
    end;
end;

procedure TfrmMain.CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
 const
   CReadBuffer = 2400;
 var
   saSecurity: TSecurityAttributes;
   hRead: THandle;
   hWrite: THandle;
   suiStartup: TStartupInfo;
   pBuffer: array[0..CReadBuffer] of AnsiChar;
   dRead: DWord;
   dRunning: DWord;
begin
    saSecurity.nLength := SizeOf(TSecurityAttributes);
    saSecurity.bInheritHandle := True;
    saSecurity.lpSecurityDescriptor := nil;

    if CreatePipe(hRead, hWrite, @saSecurity, 0) then
    begin
        FillChar(suiStartup, SizeOf(TStartupInfo), #0);
        suiStartup.cb := SizeOf(TStartupInfo);
        suiStartup.hStdInput := hRead;
        suiStartup.hStdOutput := hWrite;
        suiStartup.hStdError := hWrite;
        suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
        suiStartup.wShowWindow := SW_HIDE;

        if CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @saSecurity,
                         @saSecurity, True, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup, FNodeProcess)
        then
        begin
            startNodeMonitor();

            repeat
                dRunning  := WaitForSingleObject(FNodeProcess.hProcess, 100);
                Application.ProcessMessages();
                repeat
                    dRead := 0;
                    ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
                    pBuffer[dRead] := #0;

                    OemToAnsi(pBuffer, pBuffer);
                    AMemo.Lines.Add(String(pBuffer));

                    if String(pBuffer).Contains('Binance data loaded') then
                    begin
                        mmConsole.Clear;

                        mmCOnsole.Lines.Text := CRT;
                        pnlPIX.Visible       := True;
                        mmConsole.Lines.Add('Bot is running...');

                        Exit;
                    end;

                    if String(pBuffer).Contains('Invalid token') then
                    begin
                        FStopped    := True;
                        FMonitoring := False;
                    end;

                    if Not isMonitoring then
                        Break;
                until (dRead < CReadBuffer);

                if Not isMonitoring then
                    Break;

            until (dRunning <> WAIT_TIMEOUT);

            CloseHandle(FNodeProcess.hProcess);
            CloseHandle(FNodeProcess.hThread);
        end;

        hRead := OpenProcess(PROCESS_ALL_ACCESS, false, FNodeProcess.dwProcessId);

        TerminateProcess(hRead, 0);

        CloseHandle(hRead);
        CloseHandle(hWrite);
    end;
end;

procedure TfrmMain.ChangeLog1Click(Sender: TObject);
begin
    if frmChangeLog = nil then
        Application.CreateForm(TfrmChangeLog, frmChangeLog);

    try
        frmChangeLog.ShowModal;
    finally
        frmChangeLog.Release;
        frmChangeLog := Nil;
    end;
end;

function TfrmMain.checkKey : Boolean;
var
    mKeyFile : TStringList;
begin
    mKeyFile := getKeyFile;

    Result := mKeyFile.Count > 0;

    FreeAndNil(mKeyFile);
end;

function TfrmMain.checkPaths : Boolean;
var
    mCurrentDirectory : String;
    mDirectoryList : TDirectoryListBox;
    mDir : String;
    I : Integer;
begin
    Result := False;

    edtBotFolder.Color := clWindow;

    if FileExists('C:\Program Files\nodejs\node.exe') then
        edtNodePath.Text := 'C:\Program Files\nodejs\node.exe';

    with getConfigFile do
    begin
        if edtNodePath.Text = '' then
            edtNodePath.Text  := ReadString('Paths', 'node', '');

        edtBotFolder.Text := ReadString('Paths', 'bot', '');

        Free;
    end;

    FNodePath := edtNodePath.Text;

    if DirectoryExists(edtBotFolder.Text) then
    begin
        FEncryptosBotPath := edtBotFolder.Text;

        if not FileExists(FEncryptosBotPath + '\.env') then
        begin
            FEncryptosBotPath := '';
            edtBotFolder.Color := clRed;
        end;
    end;

    if FEncryptosBotPath.IsEmpty then
    begin
            mCurrentDirectory := ExtractFileDir(ParamStr(0));

            if FileExists(mCurrentDirectory + '\.env') then
            begin
                FEncryptosBotPath := mCurrentDirectory;
            end else
            begin
                mDirectoryList        := TDirectoryListBox.Create(nil);
                mDirectoryList.Parent := Self;

                mDirectoryList.Directory := ExtractFileDir(ExcludeTrailingPathDelimiter(mCurrentDirectory));


                for I := mDirectoryList.ItemIndex to Pred(mDirectoryList.Items.Count) do
                begin
                    mDir := mDirectoryList.GetItemPath(I);
                    if FileExists(mDir + '\.env') then
                    begin
                        FEncryptosBotPath := mDir;
                        Break;
                    end;
                end;

                if not FEncryptosBotPath.IsEmpty then
                begin
                    if Not FileExists(FEncryptosBotPath + '\.env') or
                       Not FileExists(FEncryptosBotPath + '\notification.log') then

                        FEncryptosBotPath := '';
                end;

                mDirectoryList.Free;

            end;
    end;

    mDir                  := '';
    edtBotFolder.Text     := FEncryptosBotPath;

    pnlPathConfig.Visible := FEncryptosBotPath.IsEmpty or FNodePath.IsEmpty;
    pnlFundo.Visible      := not pnlPathConfig.Visible;

    Result := pnlFundo.Visible;

    pnlLog.Visible := Result;

    if Result then
        SavePaths;
end;

procedure TfrmMain.Close1Click(Sender: TObject);
begin
    Close();
end;

procedure TfrmMain.Content;
begin
    if pnlFundo.Visible then
    begin
        pnlFundo.Top := 0;
        LoadData;

        if checkKey() then
            Exit;

        if MessageBox(Self.Handle, 'A Chave do bot não foi informada. Deseja informá-la?', 'Pendência encontrada', MB_YESNO + MB_DEFBUTTON1 + MB_ICONQUESTION) = ID_YES then
            pmmKey.Click;
    end;
end;

procedure TfrmMain.btnCopyToAllClick(Sender: TObject);
var
    mItem : TItems;
    mQry      : TFdQuery;
    mInactive : Integer;
    mSQL : String;
begin
    mItem        := TItems.Create;

    mItem.AsJson := qryDados.FieldByName('json').AsString;
    mInactive    := qryDados.FieldByName('inactive').AsInteger;

    qryDados.DisableControls;

    try
        mQry := TFdQuery.Create(nil);
        mQry.Connection := DM.conexao;

        mSQL := 'SELECT * ' +
                '  FROM pair;';

        mQry.Open(mSQL);

        mQry.First;

        while not mQry.Eof do
        begin
            mItem.Symbol := mQry.FieldByName('name').AsString;

            mQry.Edit;
            mQry.FieldByName('inactive').AsInteger := mInactive;
            mQry.FieldByName('json').AsString      := mItem.AsJson;
            mQry.Post;
            mQry.Next;
        end;
    finally
        mItem.Free;
        mQry.Free;
        qryDados.EnableControls;
    end;

    LoadData;
end;

procedure TfrmMain.btnLogClearClick(Sender: TObject);
begin
    if FMonitoring then
    begin
        FLogClear := True;
        Exit;
    end;

    try
        mmLog.Lines.Clear;
        mmLog.Lines.SaveToFile(FEncryptosBotPath + '\notification.log');
        mmLog.GotoBegin;
    except on E: Exception do
        mmLog.Lines.Add(E.Message);
    end;
end;

procedure TfrmMain.btnSaveConfigClick(Sender: TObject);
begin
    try
        btnSaveConfig.Enabled := False;

        if not doConfigFile() then
            Exit;

        if not FMonitoring then
            Exit;

        RestartBot();
    finally
        btnSaveConfig.Enabled := True;
    end;
end;

procedure TfrmMain.btnStartClick(Sender: TObject);
var
    mCommand : String;
    mOutPut : String;
begin
    FStopped := False;

    if Assigned(FBotStartTask) then
        Exit;

    if Not doConfigFile then
        Exit;

    mmConsole.Clear;
    mmConsole.Lines.Add('Bot ON, good trading!');
    pnlPIX.Visible := False;

    LogMonitor();

    FBotStartTask := TTask.Create(
        procedure
        begin
            CaptureConsoleOutput(
                    AnsiQuotedStr(FNodePath, Char(34) ),
                    AnsiQuotedStr(FEncryptosBotPath, Char(34)) +'\./src/index' ,
                    mmConsole
            );
            TThread.Synchronize(TThread.CurrentThread,
                procedure
                begin
                    onBotStartingDone();
                end
            );
        end
    );

    FBotStartTask.Start;
end;

procedure TfrmMain.btnStopClick(Sender: TObject);
begin
    FStopped := True;
    mmConsole.Lines.Add('Stopping BOT...');
    stopBot;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
    if not Assigned(FAlerts) then
        FALerts := TPairList.Create;

    FALerts.Add(mmLog.Selection);
end;

procedure TfrmMain.dbgDadosDblClick(Sender: TObject);
begin
    ToggleInactive;
end;

procedure TfrmMain.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

    TDbGrid(Sender).Canvas.font.Color:= $001CBD34;
    {
    if odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
            TDBGrid(Sender).Canvas.Brush.Color:= $00E0E0E0
    else
            TDBGrid(Sender).Canvas.Brush.Color:= clWindow;
    }
    if (qryDados.FieldByName('inactive').AsInteger > 0) then
    begin
        TDBGrid(Sender).Canvas.Font.Color  := clGray;

    end;

    if gdSelected in State then
    begin
        //TDbGrid(Sender).Canvas.Font.Style := [fsBold];
        TDBGrid(Sender).Canvas.Brush.Color := TDBGrid(Sender).Canvas.Brush.Color;
    end;

    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMain.dbgDadosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_SPACE then
    begin
        FGridFocused := True;
        ToggleInactive;
        FGridFocused := False;
    end;
end;

function TfrmMain.doConfigFile: boolean;
var
    mItem : TItems;
    mQry : TFDQuery;
    mSQL : String;
    mRoot : TRoot;
    mConfigFile : TStringList;

    mJSON : String;
begin
    Result := True;
    try
        mQry        := TFDQuery.Create(nil);
        mConfigFile := TStringList.Create;
        mRoot       := TRoot.Create;
        try
            mQry.Connection := DM.conexao;

            mSQL := 'SELECT name, ' +
                    '       json ' +
                    '  FROM pair ' +
                    ' WHERE inactive = 0 ' +
                    ' ORDER BY ordem, name;';

            mQry.Open(mSQL);

            mQry.First;

            while not mQry.Eof do
            begin
                mItem := TItems.Create;
                mItem.AsJson := mQry.FieldByName('json').AsString;
                //mItem.Symbol := mQry.FieldByName('name').AsString;

                if mItem.Interval.Count > 0 then
                    mRoot.Items.Add(mItem);

                mQry.Next;
            end;

            if mRoot.Items.Count <= 0 then
            begin
                MessageBox(Self.Handle, 'As configurações não foram salvas, verifique se os Pares habilitados possuem ao menos um intervalo.', 'Atenção', MB_OK + MB_ICONWARNING);
                Exit;
            end;

            mConfigFile.LoadFromFile(FEncryptosBotPath + '\config.json');

            mConfigFile.Clear;

            mJSON := mRoot.AsJson;

            mJSON := mJSON.Replace('{"items":','');
            mJSON := mJSON.Substring(0, Pred(Length(mJSON)));

            mConfigFile.Add(mRoot.PrettyPrintJSON(mJson));

            mConfigFile.SaveToFile(FEncryptosBotPath + '\config.json');

            Result := True;
        Except on E: Exception do
        begin
            mmLog.Lines.Add(E.Message);
            Result := False;
        end;
        end;
    finally
        FreeAndNil(mQry);
        FreeAndNil(mConfigFile);
        FreeAndNil(mRoot);
    end;

end;

procedure TfrmMain.pmmDeletePairClick(Sender: TObject);
begin
    qryDados.Delete;
end;

procedure TfrmMain.pmPairPopup(Sender: TObject);
begin
    pmmDeletePair.Enabled := qryDados.RecordCount > 0;
end;

procedure TfrmMain.PoeAnd(var pStr: String);
begin
    if pStr.IsEmpty then
        pStr := 'WHERE '
    else
        pStr := pStr + ' AND ';
end;

procedure TfrmMain.Fechar1Click(Sender: TObject);
begin
    Self.Close;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    with getConfigFile do
    begin
        try
            WriteInteger('main.rgFilter', 'ItemIndex', rgFilter.ItemIndex);
        except
        end;
        Free;
    end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if FMonitoring then
    begin
        FMonitoring := False;
        mmConsole.Clear;
        mmConsole.Lines.Add('Finalizando Threads...');
        Sleep(1000);
        CanClose := False;
        FClosing := True;
    end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
    mFile : TStringList;
begin
    //Self.WindowState := wsMaximized;

    mmConsole.Lines.Clear;
    mmConsole.Lines.Text := CRT;

    FCustomStyle := TAdvCustomMemoStyler.Create(nil);

    FCustomStyle.HighlightStyle.BkColor := $001CBD34;
    FCustomStyle.NumberStyle.BkColor    := clNone;
    FCustomStyle.NumberStyle.TextColor  := mmLog.Font.Color;
    FCustomStyle.NumberStyle.Style      := [];


    mmLog.SyntaxStyles := FCustomStyle;

    FMonitoring       := False;
    FReloading        := False;
    FClosing          := False;
    FSelectedItem     := Nil;
    FFileMonitorTask  := Nil;
    FBotStartTask     := Nil;

    frmPair.setCallBack(Self);

    with getConfigFile do
    begin
        try
            rgFilter.OnClick   := Nil;
            rgFilter.ItemIndex := ReadInteger('main.rgFilter', 'ItemIndex', 2);
            rgFilter.OnClick   := rgFilterClick;
        except
            rgFilter.ItemIndex := 2;
        end;
        Free;
    end;
    if checkPaths() then
        Content();
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
    FConfigFile.Free;
    FSelectedItem.Free;
    FCustomStyle.Free;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_F4 then
        edtLocate.SetFocus;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
    btnStop.Left    := btnStart.Left;
    btnStop.Top     := btnStart.Top;
    btnStop.Visible := False;

    if pnlPathConfig.Visible then
        Exit;

    mmLog.Lines.LoadFromFile(FEncryptosBotPath + '\notification.log');
    mmLog.GotoEnd;
    mmLog.CurX := 22;
end;

function TfrmMain.getConfigFile: TIniFile;
var
    mPath : String;
begin
    mPath  := ExtractFileDir(ParamStr(0));
    Result := TIniFile.Create(mPath + '\config.ini');
end;

function TfrmMain.getKeyFile: TStringList;
begin
    Result := nil;

    if not FileExists(FEncryptosBotPath + '\.env') then
    begin
        MessageBox(Self.Handle, 'Chave do Bot não encontrada', 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
    end;

    Result := TStringList.Create;

    Result.LoadFromFile(FEncryptosBotPath + '\.env');
end;

procedure TfrmMain.Image1Click(Sender: TObject);
begin
    if frmPIX = nil then
        Application.CreateForm(TfrmPix, frmPIX);

    try
        frmPIX.ShowModal;
    finally
        frmPIX.Release;
        frmPIX := Nil;
    end;
end;

procedure TfrmMain.InactivateALL1Click(Sender: TObject);
begin
    setInactive(True);
end;

function TfrmMain.isMonitoring: Boolean;
begin
    Result := FMonitoring;
end;

procedure TfrmMain.pmmKeyClick(Sender: TObject);
begin
    if FEncryptosBotPath.IsEmpty then
    begin
        MessageBox(Self.Handle, 'É necessário parametrizar os caminhos antes.', 'Informação', MB_OK + MB_ICONINFORMATION);
        Exit;
    end;

    TfrmKey.Key(FEncryptosBotPath);
end;

procedure TfrmMain.LoadData;
var
    mSQL : String;
    mWhere : String;
begin
    mWhere := '';

    if edtLocate.Text <> '' then
    begin
        PoeAnd(mWhere);
        mWhere := mWhere + ' name LIKE ' + QuotedStr('%' + edtLocate.Text + '%');
    end;

    if Not FLocating then

    if rgFilter.ItemIndex < 2 then
    begin
        PoeAnd(mWhere);
        mWhere := mWhere + ' inactive = ' + rgFilter.ItemIndex.ToString + ' ';
    end;

    mSQL := 'SELECT ' +
            '       name, ' +
            '       inactive, ' +
            '       json, ' +
            '       ordem ' +
            '  FROM pair ' +
             mWhere +
            ' ORDER BY ordem, name;';

    qryDados.Open(mSQL);
end;

procedure TfrmMain.mmLogCursorChange(Sender: TObject);
begin
    mmLog.HighlightText := mmLog.WordAtCursor;
end;

procedure TfrmMain.mmLogSelectionChange(Sender: TObject);
begin
    mmLog.HighlightText := mmLog.Selection;
end;

procedure TfrmMain.Monitoring(pMonitoring: Boolean);
begin
    btnStop.Visible  := pMonitoring;
    btnStart.Visible := Not pMonitoring;

    if not pMonitoring then
        mmConsole.Lines.Add('Bot OFF');
end;

procedure TfrmMain.onBotStartingDone;
begin
    FBotStartTask := Nil;
    onTaskFinished;
end;

procedure TfrmMain.onFileTaskStop;
begin
    FFileMonitorTask := Nil;
    FMonitoring      := False;
    onTaskFinished;
end;

procedure TfrmMain.onNodeTerminated();
begin
    FNodeMonitor := Nil;

    if FClosing or FReloading then
        Exit;

    stopBot;

    if Not FStopped then
    begin
        Sleep(1000);

        if mmConsole.Lines.Text.Contains('Invalid token') then
        begin
            mmConsole.Lines.Add('Providenciar uma Chave Válida para o BOT');
            Exit;
        end;

        mmConsole.Lines.Add('Bot Killed');
        mmConsole.Lines.Add('Trying to restart');

        Sleep(1000);

        btnStart.Click;
        Exit;
    end;

    FStopped := True;
end;

procedure TfrmMain.onTaskFinished;
var
    mNodeProcessHandle : THandle;
begin

    if Assigned(FBotStartTask) or Assigned(FFileMonitorTask) then
        Exit;

    mNodeProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, FNodeProcess.dwProcessId);

    TerminateProcess(mNodeProcessHandle, 0);
    CloseHandle(mNodeProcessHandle);

    if FClosing then
    begin
        Close;
        Exit;
    end;

    if FReloading then
    begin
        FReloading := False;
        Sleep(1000);
        btnStart.Click;
        Exit;
    end;

    Monitoring(False);
end;

procedure TfrmMain.onUpdated(pItem: TItems);
begin
    FSelectedItem := pItem;

    qryDados.Edit;
    qryDados.FieldByName('inactive').AsInteger := pItem.Inactive.ToInteger;
    qryDados.FieldByName('json').AsString      := pItem.AsJson;
    qryDados.Post;

    if Not FGridFocused then
        edtLocate.SetFocus;
end;

procedure TfrmMain.qryDadosAfterOpen(DataSet: TDataSet);
begin
    btnAddPair.Visible := DataSet.IsEmpty;
end;

procedure TfrmMain.qryDadosAfterScroll(DataSet: TDataSet);
begin
    if Assigned(FSelectedItem) then
    begin
        FSelectedItem.Free;
        FSelectedItem := Nil;
    end;

    if DataSet.RecordCount <= 0 then
        Exit;

    FSelectedItem := TItems.Create;

    FSelectedItem.AsJson   := DataSet.FieldByName('json').AsString;
    FSelectedItem.Inactive := DataSet.FieldByName('inactive').AsInteger > 0;

    frmPair.Fetch(FSelectedItem);
end;

procedure TfrmMain.qryDadosBeforeDelete(DataSet: TDataSet);
begin
    if qryDados.FieldByName('ordem').AsInteger < 3 then
    begin
        MessageBox(Self.Handle, 'BTC and ETH cannot be deleted.', 'Warning', MB_OK + MB_ICONWARNING);
        Abort;
    end;
end;

procedure TfrmMain.rayIcon1Click(Sender: TObject);
begin
    Self.Hide;
    Self.WindowState := wsMinimized;

    TrayIcon.Visible := True;
    TrayIcon.Animate := True;
    TrayIcon.ShowBalloonHint;
end;

procedure TfrmMain.rgFilterClick(Sender: TObject);
begin
    edtLocate.Clear;

    LoadData;

    edtLocate.SetFocus;
end;

procedure TfrmMain.RestartBot;
begin
    FReloading := True;
    FStopped   := True;
    stopBot;
    mmConsole.Lines.Add('Restarting...');
end;

procedure TfrmMain.Restaurar1Click(Sender: TObject);
begin
    TrayIconDblClick(Self);
end;

procedure TfrmMain.SavePaths;
begin
    with getConfigFile do
    begin
        WriteString('Paths', 'node', edtNodePath.Text);
        WriteString('Paths', 'bot', edtBotFolder.Text);
        Free;
    end;
end;

procedure TfrmMain.ServiceStatusTitle;
begin
    Self.Caption := 'Bot Manager ' + VERSAO + ' OFF';

    if FMonitoring then
        Self.Caption := 'Bot Manager ' + VERSAO + ' ON';
end;

procedure TfrmMain.setInactive(pInactive: Boolean);
var
    mSQL : String;
    mInactive : String;
begin
    mInactive := '0';

    if pInactive then
        mInactive := '1';

    mSQL := 'UPDATE pair SET inactive = ' + mInactive + ';';

    qryFast.ExecSQL(mSQL);

    LoadData;
end;

procedure TfrmMain.startNodeMonitor;
begin
    FNodeMonitor := TTask.Create(
        procedure
        begin
            WaitForSingleObject(FNodeProcess.hProcess, INFINITE);
            onNodeTerminated();
        end
    );

    FNodeMonitor.Start;
end;

procedure TfrmMain.stopBot;
begin
    FMonitoring := False;
end;

procedure TfrmMain.tmrTitleTimer(Sender: TObject);
begin
    ServiceStatusTitle;
end;

procedure TfrmMain.ToggleInactive;
begin
    if (qryDados.RecordCount > 0) then
        frmPair.ToggleInactive();
end;

procedure TfrmMain.TrayIconDblClick(Sender: TObject);
begin
    TrayIcon.Visible := False;
    Self.Show();
    Self.WindowState := wsNormal;
    Application.BringToFront();
end;

procedure TfrmMain.edtBotFolderClick(Sender: TObject);
begin
    fOpenDlg.Options := [fdoPickFolders];

    if not fOpenDlg.Execute then
        Exit;

    edtBotFolder.Text := fOpenDlg.FileName;
end;

procedure TfrmMain.edtLocateChange(Sender: TObject);
begin

    FLocating := Length(Trim(edtLocate.Text)) > 0;
    LoadData();
    FLocating := False;
end;

procedure TfrmMain.edtLocateInvokeSearch(Sender: TObject);
begin
    LoadData();
end;

procedure TfrmMain.edtLocateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (ssCtrl in Shift) And (Key = VK_I) then
    begin
        ToggleInactive();
        edtLocate.Clear;
    end;

    if (ssCtrl in Shift) And (Key = VK_L) then
        edtLocate.Clear;

    if (ssCtrl in Shift) And (Key in [83, 115]) then
        btnSaveConfig.Click;
end;

procedure TfrmMain.edtLocateKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then
    begin
        edtLocate.Clear;
    end;
end;

procedure TfrmMain.edtLogSearchInvokeSearch(Sender: TObject);
begin
    LogFinder();
end;

procedure TfrmMain.edtLogSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then
        edtLogSearch.Clear;
end;

procedure TfrmMain.edtNodePathClick(Sender: TObject);
begin
    if not openDialog.Execute then
        Exit;

    edtNodePath.Text := openDialog.FileName;
end;

procedure TfrmMain.LogFinder;
begin
    if mmLog.FindText(edtLogSearch.Text, [freFindNext, freDisableUpDown, freDisableWholeWord]) < 0 then
    begin
        mmLog.GotoEnd;
        mmLog.FindText(edtLogSearch.Text, [freFindNext, freDisableUpDown, freDisableWholeWord]);
    end;
end;

procedure TfrmMain.LogMonitor;
begin
    if Assigned(FFileMonitorTask) then
        Exit;

    Monitoring(True);
    FMonitoring      := True;
    FFileMonitorTask := TTask.Create(
        procedure
        var
            mFile : TStringList;
            mLastLine        : Integer;
            mLastLineContent : String;
            I: Integer;

            mFileStream : TFileStream;
        begin
            mFile := TStringList.Create;

            mFileStream := TFileStream.Create(FEncryptosBotPath + '\notification.log', fmOpenReadWrite or fmShareDenyNone);

            mLastLine         := 0;
            mLastLineContent  := '';
            mmLog.GotoEnd;

            mFile.LoadFromStream(mFileStream);
            //mFile.LoadFromFile(FEncryptosBotPath + '\notification.log');

            mLastLine := mFile.Count;

            try
                while isMonitoring do
                begin

                    try
                        if FLogClear then
                        begin

                            FLogClear := False;

                            mFileStream.Free;

                            mFileStream := TFileStream.Create(FEncryptosBotPath + '\notification.log', fmCreate or fmShareDenyNone);
                            mFileStream.Free;
                            mFileStream := TFileStream.Create(FEncryptosBotPath + '\notification.log', fmOpenRead or fmShareDenyNone);
                            mmLog.Clear;
                            mmLog.GotoBegin;

                        End;

                        mFile.LoadFromStream(mFileStream);
                        //mFile.LoadFromFile(FEncryptosBotPath + '\notification.log');
                    except on E: Exception do
                        begin
                            mmConsole.Lines.Add(E.Message);
                            Continue;
                        end;
                    end;

                    if mLastLine > mFile.Count then
                        mLastLine := mFile.Count;

                    TThread.Synchronize(TThread.CurrentThread,
                        procedure
                        begin
                            mmLog.BeginUpdate;
                            while mLastLine < mFile.Count do
                            begin

                                mmLog.Lines.Append(mFile.Strings[mLastLine]);
                                mLastLine := mLastLine + 1;
                            end;
                            mmLog.EndUpdate;
                        end
                    );

                    if Not isMonitoring then
                        Break;

                    Sleep(500);
                end;
            finally
                FreeAndNil(mFile);
                FreeAndNil(mFileStream);

                TThread.Synchronize(TThread.CurrentThread,
                procedure
                begin
                    onFileTaskStop;
                end);
            end;
        end
    );

    FFileMonitorTask.Start;
end;

end.
