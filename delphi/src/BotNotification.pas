unit BotNotification;

interface

uses
  System.Notification, System.SysUtils;

type
    TBotNotificationCenter = class(TNotificationCenter)
        public
            function CreateNotification(pLogLine : String): TNotification; overload;
    end;

implementation

uses
  System.Classes;


{ TBotNotification }


{ TBotNotification }

function TBotNotificationCenter.CreateNotification(pLogLine: String): TNotification;
var
    mPairName : String;
    mMessage : String;

    mSplited : TArray<String>;

    mLista : TStringList;

    I: Integer;
begin
    Result := inherited CreateNotification;

    if Not Assigned(Result) then
        Exit;

    mSplited := pLogLine.Replace('  ', ' ').Replace(':', '').Split([' ']);

    mPairName        := mSplited[2];
    Result.AlertBody := '';

    if pLogLine.Contains('Trade') then
    begin
        Result.Title     := mPairName + ' Trade ' + mSplited[4];

        mLista := TStringList.Create;
        mLista.AddStrings(mSplited);

        for I := 5 to Pred(mLista.Count) do
            Result.AlertBody := Result.AlertBody + ' ' + mLista.Strings[I];

        FreeAndNil(mLista);
    end;

    

    if pLogLine.Contains('S Ratio') then
    begin
        Result.Title := '';//'LSR ' + mSplited[5] + ' ' + mSplited[6];
        Result.AlertBody := mPairName + ' LSR ' + mSplited[5] + ' ' + mSplited[6];
    end;
    Result.FireDate  := Now;
end;

end.
