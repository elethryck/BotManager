unit AlertTypes;

interface

uses System.SysUtils;

type
    TDirection = (dUP, dDOWN);

    TTradeEntity = class
        FLevel : Integer;
        FDirection : TDirection;
        FSpeed : Integer;
    end;

    TLSREntiy = class
        FDirection : TDirection;
    end;

implementation

end.
