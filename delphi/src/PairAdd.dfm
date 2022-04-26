object frmAddPair: TfrmAddPair
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 1
  Caption = 'Pair : NEW'
  ClientHeight = 365
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panel1: TPanel
    Left = 8
    Top = 8
    Width = 321
    Height = 348
    BorderWidth = 5
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 48
      Height = 13
      Caption = 'Pair Name'
    end
    inline frmPairConfiguration: TfrmPairConfiguration
      Left = 8
      Top = 35
      Width = 312
      Height = 279
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 35
      inherited Bevel1: TBevel
        Left = 0
        Top = 4
        ExplicitLeft = 0
        ExplicitTop = 4
      end
      inherited Label2: TLabel
        Left = 8
        Top = 33
        ExplicitLeft = 8
        ExplicitTop = 33
      end
      inherited chkInactive: TCheckBox
        Left = 8
        Top = 10
        ExplicitLeft = 8
        ExplicitTop = 10
      end
      inherited tbProfile: TTrackBar
        Left = 56
        ExplicitLeft = 56
      end
    end
    object edtPairName: TEdit
      Left = 64
      Top = 9
      Width = 113
      Height = 21
      TabOrder = 1
      OnChange = edtPairNameChange
    end
    object btnConfirm: TBitBtn
      Left = 8
      Top = 315
      Width = 129
      Height = 25
      Caption = 'Confirm'
      TabOrder = 2
      OnClick = btnConfirmClick
    end
    object BitBtn2: TBitBtn
      Left = 181
      Top = 315
      Width = 129
      Height = 25
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object qryAux: TFDQuery
    Connection = DM.conexao
    Left = 243
    Top = 16
  end
end
