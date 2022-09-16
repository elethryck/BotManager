unit PairAlertEntity;

interface

uses
  System.Generics.Collections, System.Classes, RuleEntity;

type

    TPairAlert = class
        private
            FName  : String;

            FRules  : TRuleList;
            FAlerts : TStringList;

            procedure TestRules();
        public


            procedure Add(pContent : String);

            procedure setRules(const Value : TRuleList);

            constructor Create();
            destructor Destroy(); override;
    end;

    TPairList = class
        private
            FPares : TList<TPairAlert>;

            function getPairByName(pPairName : String) : TPairAlert;
        public
            constructor Create();
            destructor Destroy();
            procedure Add(pContent : String);
    end;

implementation

{ TPairAlert }

uses System.SysUtils;

procedure TPairAlert.Add(pContent: String);
begin

end;

constructor TPairAlert.Create;
begin
    FAlerts := TStringList.Create;
end;

destructor TPairAlert.Destroy;
begin
    inherited;
    FreeAndNil(FAlerts);
end;

procedure TPairAlert.setRules(const Value: TRuleList);
begin
    FRules := Value;
end;

procedure TPairAlert.TestRules;
begin
    if not Assigned(FRules) then
        Exit;

end;

{ TPairList }

procedure TPairList.Add(pContent: String);
var
    mContent : Tarray<String>;

    mList : TStringList;

    mUD : String;

    mLevel : String;

    mPairAlert : TPairAlert;
begin
    pContent := pContent.Replace('  ', ' ');

    mContent := pContent.Split([' ']);

    mList := TStringList.Create;

    mList.AddStrings(mContent);

    if Not (mContent[2].Contains('USDT') or mContent[2].Contains('BUSD')) then
        Exit;

    mPairAlert := getPairByName(mContent[2]);

    if pContent.Contains('Ratio') then
    begin
        mUD := mList.Strings[mList.IndexOf('Ratio') + 1];

        mPairAlert.Add('LSR' + mUD);
    end;

    if pContent.Contains('Trade') then
    begin
        mUD     := mList.Strings[mList.IndexOf('Trade') + 1];
        mLevel  := mList.Strings[mList.IndexOf('Level:') + 1];

        mPairAlert.Add('Trade ' + mUD + ' L' + mLevel);
    end;

    FreeAndNil(mList);

    mPairAlert.TestRules();
end;

constructor TPairList.Create;
begin
    FPares := TList<TPairAlert>.Create();
end;

destructor TPairList.Destroy;
begin
    FPares.Free;
end;

function TPairList.getPairByName(pPairName: String): TPairAlert;
var
    mPairAlert : TPairAlert;
begin
    for mPairAlert in FPares do
    begin
        if mPairAlert.FName = pPairName then
        begin
            Result := mPairAlert;
            Exit;
        end;
    end;

    Result       := TPairAlert.Create;
    Result.FName := pPairName;
end;

end.
