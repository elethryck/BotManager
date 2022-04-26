unit PairConfiguration;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, RootUnit;

type
    IPairConfigurationUpdated = interface
        ['{CC842D15-6C8C-4EB9-BCDE-EB86255DC48E}']
        procedure onUpdated(pItem : TItems);
    end;

  TfrmPairConfiguration = class(TFrame)
    chkInactive: TCheckBox;
    gpTradeForce: TGroupBox;
    tbLevel: TTrackBar;
    Label1: TLabel;
    chkTFUp: TCheckBox;
    chkTFDOWN: TCheckBox;
    gpLSR: TGroupBox;
    chkLSRUp: TCheckBox;
    chkLSRDown: TCheckBox;
    chkLSRCross: TCheckBox;
    Label2: TLabel;
    tbProfile: TTrackBar;
    Bevel1: TBevel;
    gbInterval: TGroupBox;
    chk1m: TCheckBox;
    chk3m: TCheckBox;
    chk5m: TCheckBox;
    chk15m: TCheckBox;
    chk30m: TCheckBox;
    chk1h: TCheckBox;
    chk2h: TCheckBox;
    chk4h: TCheckBox;
    chk12h: TCheckBox;
    chk1D: TCheckBox;
    chkSound: TCheckBox;
    procedure chk1mClick(Sender: TObject);
    procedure chkLSRUpClick(Sender: TObject);
    procedure tbLevelChange(Sender: TObject);
    procedure tbProfileChange(Sender: TObject);
    procedure chkInactiveClick(Sender: TObject);
    procedure chkSoundClick(Sender: TObject);
  private
    { Private declarations }
    FItem : TItems;

    FisFetching : Boolean;
    FCallBack   : IPairConfigurationUpdated;
    procedure Clear();
    procedure setIntervals();
    procedure setLSR();
    procedure setTradeForce();
    procedure onUpdated();
  public
    { Public declarations }
    procedure Fetch(pItem : TItems);

    procedure setCallBack(pCallBack : IPairConfigurationUpdated);
    procedure ToggleInactive();
  end;

implementation

{$R *.dfm}

{ TfrmPairConfiguration }

procedure TfrmPairConfiguration.chk1mClick(Sender: TObject);
begin
    setIntervals;
end;

procedure TfrmPairConfiguration.chkInactiveClick(Sender: TObject);
begin
    if FisFetching then
        Exit;

    FItem.Inactive := chkInactive.Checked;

    onUpdated();
end;

procedure TfrmPairConfiguration.chkLSRUpClick(Sender: TObject);
begin
    setLSR;
end;

procedure TfrmPairConfiguration.chkSoundClick(Sender: TObject);
begin
    if FisFetching then
        Exit;

    FItem.Sound := chkSound.Checked;

    onUpdated();
end;

procedure TfrmPairConfiguration.Clear;
var
  I: Integer;
begin
    FisFetching         := True;
    chkInactive.Checked := False;
    tbProfile.Position  := 2;
    tbLevel.Position    := 3;

    for I := 0 to Self.ComponentCount - 1 do
    begin
        if Self.Components[I] is TCheckBox then
            TCheckBox(Self.Components[I]).Checked := False;
    end;

    FisFetching := False;
end;

procedure TfrmPairConfiguration.Fetch(pItem : TItems);
var
  I: Integer;
  s: String;
  mComponent : TComponent;
begin
    FItem := pItem;

    Clear();

    FisFetching         := True;
    chkInactive.Checked := Fitem.Inactive;
    tbProfile.Position  := FItem.Profile;
    chkSound.Checked    := FItem.Sound;

    for s in FItem.Interval do
    begin
        for I := 0 to Self.ComponentCount - 1 do
        begin
            mComponent := FindComponent('chk' + s );

            if Assigned(mComponent) then
                TCheckBox(mComponent).Checked := True;
        end;
    end;

    with FItem.LongShortRatio do
    begin
        chkLSRUp.Checked    := Up;
        chkLSRDown.Checked  := Down;
        chkLSRCross.Checked := CrossTrade;
    end;

    with FItem.TradeForce do
    begin
        tbLevel.Position := Level;
        chkTFUp.Checked  := Up;
        chkTFDOWN.Checked := Down;
    end;

    FisFetching := False;
end;

procedure TfrmPairConfiguration.onUpdated;
begin
    if Assigned(FCallback) then
        FCallback.onUpdated(FItem);
end;

procedure TfrmPairConfiguration.setCallBack(
  pCallBack: IPairConfigurationUpdated);
begin
    FCallBack := pCallBack;
end;

procedure TfrmPairConfiguration.setIntervals;
var
    mList : TStringList;
  I: Integer;
begin
    if FisFetching then
        Exit;

    mList := TStringList.Create;

    mList.CommaText := '1m,3m,5m,15m,30m,1h,2h,4h,12h,1D';

    FItem.Interval.Clear;

    for I := 0 to mList.Count - 1 do
    begin
        if TCheckBox(FindComponent('chk' + mList.Strings[I])).Checked then
            FItem.Interval.Add(mList.Strings[I]);
    end;

    FreeAndNil(mList);

    onUpdated();
end;

procedure TfrmPairConfiguration.setLSR;
begin
    if FisFetching then
        Exit;

    with FItem.LongShortRatio do
    begin
        Up         := chkLSRUp.Checked;
        Down       := chkLSRDown.Checked;
        CrossTrade := chkLSRCross.Checked;
    end;

    onUpdated();
end;

procedure TfrmPairConfiguration.setTradeForce;
begin
    if FisFetching then
        Exit;

    with FItem.TradeForce do
    begin
        Level := tbLevel.Position;
        Up    := chkTFUp.Checked;
        Down  := chkTFDOWN.Checked;
    end;

    onUpdated();
end;

procedure TfrmPairConfiguration.tbLevelChange(Sender: TObject);
begin
    if FisFetching then
        Exit;

    setTradeForce;
end;

procedure TfrmPairConfiguration.tbProfileChange(Sender: TObject);
begin
    if FisFetching then
        Exit;

    FItem.Profile := tbProfile.Position;

    onUpdated();
end;

procedure TfrmPairConfiguration.ToggleInactive;
begin
    chkInactive.Checked := not chkInactive.Checked;
end;

end.
