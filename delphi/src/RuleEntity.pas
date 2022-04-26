unit RuleEntity;

interface

uses
  System.Generics.Collections, System.SysUtils;

type
    TRule = class(TList<String>)
    private

        FPairName : String;

    public
        constructor Create(pRuleString : String);

    end;

    TRuleList = class(TList<TRule>)

    end;

implementation

uses
  System.Classes;

{ TRule }

constructor TRule.Create(pRuleString: String);
var
    mST : TStringList;
begin
    pRuleString := pRuleString.Replace('  ', ' ');

    mST := TStringList.Create();
    mST.Delimiter := ' ';

    if pRuleString.Contains('=') then
        FPairName := mST.Strings[ mST.IndexOf('=') - 1];


    FreeAndNil(mST);
end;

end.
