object frmRules: TfrmRules
  Left = 0
  Top = 0
  BorderWidth = 5
  Caption = 'Alert Rules'
  ClientHeight = 456
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 456
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 32
    ExplicitTop = 8
    ExplicitWidth = 625
    ExplicitHeight = 353
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 106
      Height = 13
      Caption = 'Rules to keep on eyes'
    end
    object Label2: TLabel
      Left = 8
      Top = 213
      Width = 111
      Height = 13
      Caption = 'Rules to Windows Alert'
    end
    object Label3: TLabel
      Left = 8
      Top = 419
      Width = 204
      Height = 13
      Caption = 'PAIR = n [LSR, TRADE[up,down] TF] + ...'
    end
    object Label4: TLabel
      Left = 8
      Top = 438
      Width = 256
      Height = 13
      Caption = 'ADA = 5 LSR UP + 5 TRADE UP 1m + 1 TRADE UP 5m'
    end
    object Edit1: TEdit
      Left = 8
      Top = 27
      Width = 294
      Height = 21
      TabOrder = 0
      Text = '3 LSR'
    end
    object Edit2: TEdit
      Left = 8
      Top = 232
      Width = 294
      Height = 21
      TabOrder = 1
      Text = 'BTC = 3 LSR + 1 TRADE UP 5m'
    end
    object DBGrid2: TDBGrid
      Left = 8
      Top = 259
      Width = 505
      Height = 154
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Pair'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Rule'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 400
          Visible = True
        end>
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 53
      Width = 505
      Height = 154
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'name'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Pair'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Rule'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 400
          Visible = True
        end>
    end
  end
end
