program bot_manager;

uses
  Vcl.Forms,
  main in 'src\main.pas' {frmMain},
  PairConfiguration in 'src\PairConfiguration.pas' {frmPairConfiguration: TFrame},
  Pkg.Json.DTO in 'src\Pkg.Json.DTO.pas',
  RootUnit in 'src\RootUnit.pas',
  PairAdd in 'src\PairAdd.pas' {frmAddPair},
  DataModulo in 'src\DataModulo.pas' {DM: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  Rules in 'src\Rules.pas' {frmRules},
  PairAlertEntity in 'src\PairAlertEntity.pas',
  RuleEntity in 'src\RuleEntity.pas',
  ChangeLOG in 'src\ChangeLOG.pas' {frmChangeLog},
  KeyForm in 'src\KeyForm.pas' {frmKey},
  AlertTypes in 'src\AlertTypes.pas',
  PIX in 'src\PIX.pas' {frmPIX},
  BotNotification in 'src\BotNotification.pas',
  DoadoresDTO in 'src\DoadoresDTO.pas';

{$R *.res}

begin
    ReportMemoryLeaksOnShutdown := DebugHook > 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Win10IDE_Dark');
  Application.CreateForm(TDM, DM);
  if DM.conexao.Connected then
  begin
        Application.CreateForm(TfrmMain, frmMain);
        Application.Run;
  end;

  DM.Free;
end.
