unit HighlightingRepository;

interface

uses HighlightingDTO, System.Classes;

type
    THighlightingRepository = class
        private

            function getConfigFile() : TStringList;
        public
            function getRootDTO : THighlightingRootDTO;
            function Save(pObj : THighlightingRootDTO): Boolean;
    end;

    const DEFAUL_HIGHLIGHTING = '{' +
                                '    "items":[' +
                                '      {' +
                                '        "bold":false,' +
                                '        "color":"$000909FF",' +
                                '        "astring":"TRADE DOWN"' +
                                '      },' +
                                '      {' +
                                '        "bold":false,' +
                                '        "color":"clLime",' +
                                '        "astring":"TRADE UP"' +
                                '      },' +
                                '      {' +
                                '        "bold":false,' +
                                '        "color":"clAqua",' +
                                '        "astring":"X_"' +
                                '      },' +
                                '      {' +
                                '        "bold":false,' +
                                '        "color":"$00999999",' +
                                '        "astring":"L\/S"' +
                                '      },' +
                                '      {' +
                                '        "bold":false,' +
                                '        "color":"clFuchsia",' +
                                '        "astring":"BTCUSDT"' +
                                '      }' +
                                '    ]' +
                                '}';


implementation

uses
  Vcl.Graphics, System.SysUtils, DataModulo;

{ THightlightingRepository }

function THighlightingRepository.getConfigFile: TStringList;
begin
    Result := TStringList.Create;

    if Not FileExists(DM.HighlightingFile) then
        Result.Text := DEFAUL_HIGHLIGHTING
    else
        Result.LoadFromFile(DM.HighlightingFile);
end;

function THighlightingRepository.getRootDTO: THighlightingRootDTO;
var
  mConfig : TStringList;
  I: Integer;
  mItemDTO : TItemsDTO;
  mColor : TColor;
begin
    Result  := THighlightingRootDTO.Create;

    mConfig := getConfigFile();

    if mConfig = nil then
        Exit;

    try
        Result.AsJson := mConfig.Text;
    finally
        mConfig.Free;
    end;

end;

function THighlightingRepository.Save(pObj: THighlightingRootDTO): Boolean;
var
    mConfig : TStringList;
begin
    mConfig := getConfigFile();

    mConfig.Clear;

    try
        mConfig.Text := pObj.PrettyPrintJSON(pObj.AsJson);
        mConfig.SaveToFile(DM.HighlightingFile, TEncoding.UTF8);

        Result := True;
    finally
        mConfig.Free;
    end;
end;

end.
