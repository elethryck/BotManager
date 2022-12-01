program bot_manager;

uses
  Vcl.Forms,
  View.Principal in 'src\View\View.Principal.pas' {frmMain},
  Frame.PairConfiguration in 'src\View\Frame.PairConfiguration.pas' {frmPairConfiguration: TFrame},
  Pkg.Json.DTO in 'src\DTO\Pkg.Json.DTO.pas',
  BotConfigRootDTO in 'src\DTO\BotConfigRootDTO.pas',
  View.PairAdd in 'src\View\View.PairAdd.pas' {frmAddPair},
  DataModulo in 'src\DataModulo.pas' {DM: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  View.ChangeLOG in 'src\View\View.ChangeLOG.pas' {frmChangeLog},
  View.KeyForm in 'src\View\View.KeyForm.pas' {frmKey},
  View.PIX in 'src\View\View.PIX.pas' {frmPIX},
  Resource.BotNotification in 'src\Resource\Resource.BotNotification.pas',
  DoadoresDTO in 'src\DTO\DoadoresDTO.pas',
  View.HighlightingConfig in 'src\View\View.HighlightingConfig.pas' {frmHighlighting},
  HighlightingDTO in 'src\DTO\HighlightingDTO.pas',
  HighlightingRepository in 'src\Repository\HighlightingRepository.pas';

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
