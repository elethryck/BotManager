unit HighlightingDTO;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TItemsDTO = class
  private
    [JSONName('bold')]
    FBold: Boolean;
    [JSONName('color')]
    FColor: string;
    [JSONName('astring')]
    FAString: string;
  published
    property Bold: Boolean read FBold write FBold;
    property Color: string read FColor write FColor;
    property Astring: string read FAString write FAString;
  end;

  THighlightingRootDTO = class(TJsonDTO)
  private
    [JSONName('items'), JSONMarshalled(False)]
    FItemsArray: TArray<TItemsDTO>;
    [GenericListReflect]
    FItems: TObjectList<TItemsDTO>;
    function GetItems: TObjectList<TItemsDTO>;
  protected
    function GetAsJson: string; override;
  published
    property Items: TObjectList<TItemsDTO> read GetItems;
  public
    destructor Destroy; override;
  end;

implementation

{ THighlightingRootDTO }

destructor THighlightingRootDTO.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function THighlightingRootDTO.GetItems: TObjectList<TItemsDTO>;
begin
  Result := ObjectList<TItemsDTO>(FItems, FItemsArray);
end;

function THighlightingRootDTO.GetAsJson: string;
begin
  RefreshArray<TItemsDTO>(FItems, FItemsArray);
  Result := inherited;
end;

end.
