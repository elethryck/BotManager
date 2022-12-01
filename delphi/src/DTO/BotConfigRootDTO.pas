unit BotConfigRootDTO;

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
  
  TUnitDTO = class(TJsonDTO)
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
  
  TBotConfigRootDTO = class(TJsonDTO)
  private
    [JSONName('Items'), JSONMarshalled(False)]
    FItemsArray: TArray<TUnitDTO>;
    [GenericListReflect]
    FItems: TObjectList<TUnitDTO>;
    function GetItems: TObjectList<TUnitDTO>;
  protected
    function GetAsJson: string; override;
  published
    property Items: TObjectList<TUnitDTO> read GetItems;
    property ArrayItems : TArray<TUnitDTO> read FItemsArray;
  public
    destructor Destroy; override;
  end;
  
implementation

{ TItems }

constructor TUnitDTO.Create;
begin
  inherited;
  FTradeForce := TTradeForce.Create;
  FLongShortRatio := TLongShortRatio.Create;
end;

destructor TUnitDTO.Destroy;
begin
  FTradeForce.Free;
  FLongShortRatio.Free;
  GetInterval.Free;
  inherited;
end;

function TUnitDTO.GetInterval: TList<string>;
begin
  Result := List<string>(FInterval, FIntervalArray);
end;

function TUnitDTO.GetAsJson: string;
begin
  RefreshArray<string>(FInterval, FIntervalArray);
  Result := inherited;
end;

{ TRoot }

destructor TBotConfigRootDTO.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TBotConfigRootDTO.GetItems: TObjectList<TUnitDTO>;
begin
  Result := ObjectList<TUnitDTO>(FItems, FItemsArray);
end;

function TBotConfigRootDTO.GetAsJson: string;
begin
  RefreshArray<TUnitDTO>(FItems, FItemsArray);
  Result := inherited;
end;

end.
