object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 267
  Width = 433
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 64
    Top = 91
  end
  object FDTransaction1: TFDTransaction
    Connection = conexao
    Left = 160
    Top = 43
  end
  object conexao: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=d:\Desktop\EncryptosManager\base.db')
    LoginPrompt = False
    Left = 64
    Top = 35
  end
  object qryAux: TFDQuery
    Connection = conexao
    Left = 200
    Top = 120
  end
end
