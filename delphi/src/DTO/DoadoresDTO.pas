unit DoadoresDTO;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TDoacaoDTO = class
  private
    [JSONName('currency')]
    FCurrency: string;
    [SuppressZero, JSONName('date')]
    FDate: TDateTime;
    [JSONName('name')]
    FName: string;
    [JSONName('value')]
    FValue: Double;
    [JSONName('valueUSD')]
    FValueUSD: Double;
  published
    property Currency: string read FCurrency write FCurrency;
    property Date: TDateTime read FDate write FDate;
    property Name: string read FName write FName;
    property Value: Double read FValue write FValue;
    property ValueUSD: Double read FValueUSD write FValueUSD;
  end;

  TDoacoesRootDTO = class(TJsonDTO)
  private
    [JSONName('Items'), JSONMarshalled(False)]
    FItemsArray: TArray<TDoacaoDTO>;
    [GenericListReflect]
    FItems: TObjectList<TDoacaoDTO>;
    function GetItems: TObjectList<TDoacaoDTO>;
  protected
    function GetAsJson: string; override;
  published
    property Items: TObjectList<TDoacaoDTO> read GetItems;
  public
    destructor Destroy; override;
  end;

implementation

{ TDoacoesRootDTO }

destructor TDoacoesRootDTO.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TDoacoesRootDTO.GetItems: TObjectList<TDoacaoDTO>;
begin
  Result := ObjectList<TDoacaoDTO>(FItems, FItemsArray);
end;

function TDoacoesRootDTO.GetAsJson: string;
begin
  RefreshArray<TDoacaoDTO>(FItems, FItemsArray);
  Result := inherited;
end;

end.
