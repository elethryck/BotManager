object frmKey: TfrmKey
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  BorderWidth = 5
  Caption = 'Chave do Bot'
  ClientHeight = 229
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 548
    Height = 229
    Align = alClient
    TabOrder = 0
    DesignSize = (
      548
      229)
    object mmKey: TMemo
      Left = 8
      Top = 8
      Width = 529
      Height = 180
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        'mmKey')
      TabOrder = 0
    end
    object btnClose: TBitBtn
      Left = 421
      Top = 193
      Width = 118
      Height = 29
      Anchors = [akRight, akBottom]
      Caption = 'Fechar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object btnSaveKey: TBitBtn
      Left = 297
      Top = 193
      Width = 118
      Height = 29
      Anchors = [akRight, akBottom]
      Caption = 'Salvar'
      Kind = bkAll
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnSaveKeyClick
    end
  end
end
