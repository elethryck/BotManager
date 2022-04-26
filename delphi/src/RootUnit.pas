unit RootUnit;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TLongShortRatio = class;
  TTradeForce = class;

  TLongShortRatio = class
  private
    FCrossTrade: Boolean;
    FDown: Boolean;
    FUp: Boolean;
  published
    property CrossTrade: Boolean read FCrossTrade write FCrossTrade;
    property Down: Boolean read FDown write FDown;
    property Up: Boolean read FUp write FUp;
  end;
  
  TTradeForce = class
  private
    FDown: Boolean;
    FLevel: Integer;
    FUp: Boolean;
  published
    property Down: Boolean read FDown write FDown;
    property Level: Integer read FLevel write FLevel;
    property Up: Boolean read FUp write FUp;
  end;
  
  TItems = class(TJsonDTO)
  private
    [JSONMarshalledAttribute(False)]
    FInactive : Boolean;
    [JSONName('interval')]
    FIntervalArray: TArray<string>;
    [JSONMarshalled(False)]
    FInterval: TList<string>;
    FLongShortRatio: TLongShortRatio;
    FProfile: Integer;
    FSound: Boolean;
    FSymbol: string;
    FTradeForce: TTradeForce;
    function GetInterval: TList<string>;
  protected
    function GetAsJson: string; override;
  published
    property Interval: TList<string> read GetInterval;
    property LongShortRatio: TLongShortRatio read FLongShortRatio;
    property Profile: Integer read FProfile write FProfile;
    property Sound: Boolean read FSound write FSound;
    property Symbol: string read FSymbol write FSymbol;
    property TradeForce: TTradeForce read FTradeForce;
    property Inactive : Boolean read FInactive write FInactive;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
  TRoot = class(TJsonDTO)
  private
    [JSONName('Items'), JSONMarshalled(False)]
    FItemsArray: TArray<TItems>;
    [GenericListReflect]
    FItems: TObjectList<TItems>;
    function GetItems: TObjectList<TItems>;
  protected
    function GetAsJson: string; override;
  published
    property Items: TObjectList<TItems> read GetItems;
    property ArrayItems : TArray<TItems> read FItemsArray;
  public
    destructor Destroy; override;
  end;
  
implementation

{ TItems }

constructor TItems.Create;
begin
  inherited;
  FTradeForce := TTradeForce.Create;
  FLongShortRatio := TLongShortRatio.Create;
end;

destructor TItems.Destroy;
begin
  FTradeForce.Free;
  FLongShortRatio.Free;
  GetInterval.Free;
  inherited;
end;

function TItems.GetInterval: TList<string>;
begin
  Result := List<string>(FInterval, FIntervalArray);
end;

function TItems.GetAsJson: string;
begin
  RefreshArray<string>(FInterval, FIntervalArray);
  Result := inherited;
end;

{ TRoot }

destructor TRoot.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TRoot.GetItems: TObjectList<TItems>;
begin
  Result := ObjectList<TItems>(FItems, FItemsArray);
end;

function TRoot.GetAsJson: string;
begin
  RefreshArray<TItems>(FItems, FItemsArray);
  Result := inherited;
end;

end.
