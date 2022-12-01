object frmPairConfiguration: TfrmPairConfiguration
  Left = 0
  Top = 0
  Width = 312
  Height = 279
  TabOrder = 0
  object Bevel1: TBevel
    Left = 3
    Top = 3
    Width = 302
    Height = 270
  end
  object Label2: TLabel
    Left = 10
    Top = 36
    Width = 30
    Height = 13
    Caption = 'Profile'
  end
  object chkInactive: TCheckBox
    Left = 11
    Top = 9
    Width = 158
    Height = 17
    Caption = 'Inactive ( CTRL + i )'
    TabOrder = 0
    OnClick = chkInactiveClick
  end
  object gpTradeForce: TGroupBox
    Left = 8
    Top = 63
    Width = 289
    Height = 58
    Caption = 'Trade Force'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 25
      Height = 13
      Caption = 'Level'
    end
    object tbLevel: TTrackBar
      Left = 47
      Top = 22
      Width = 98
      Height = 33
      Max = 6
      Min = 1
      Position = 1
      PositionToolTip = ptRight
      TabOrder = 0
      OnChange = tbLevelChange
    end
    object chkTFUp: TCheckBox
      Left = 163
      Top = 23
      Width = 49
      Height = 17
      Caption = 'UP'
      TabOrder = 1
      OnClick = tbLevelChange
    end
    object chkTFDOWN: TCheckBox
      Left = 232
      Top = 23
      Width = 49
      Height = 17
      Caption = 'DOWN'
      TabOrder = 2
      OnClick = tbLevelChange
    end
  end
  object gpLSR: TGroupBox
    Left = 8
    Top = 127
    Width = 289
    Height = 58
    Caption = 'Long Short Ratio'
    TabOrder = 2
    object chkLSRUp: TCheckBox
      Left = 16
      Top = 30
      Width = 49
      Height = 17
      Caption = 'UP'
      TabOrder = 0
      OnClick = chkLSRUpClick
    end
    object chkLSRDown: TCheckBox
      Left = 104
      Top = 31
      Width = 49
      Height = 17
      Caption = 'DOWN'
      TabOrder = 1
      OnClick = chkLSRUpClick
    end
    object chkLSRCross: TCheckBox
      Left = 200
      Top = 31
      Width = 81
      Height = 17
      Caption = 'CrossTrade'
      TabOrder = 2
      OnClick = chkLSRUpClick
    end
  end
  object tbProfile: TTrackBar
    Left = 55
    Top = 32
    Width = 98
    Height = 33
    Max = 6
    Min = 1
    Position = 1
    PositionToolTip = ptRight
    TabOrder = 3
    OnChange = tbProfileChange
  end
  object gbInterval: TGroupBox
    Left = 8
    Top = 191
    Width = 289
    Height = 74
    Caption = ' Interval '
    TabOrder = 4
    object chk1m: TCheckBox
      Left = 16
      Top = 22
      Width = 49
      Height = 17
      Caption = '1m'
      TabOrder = 0
      OnClick = chk1mClick
    end
    object chk3m: TCheckBox
      Left = 72
      Top = 22
      Width = 49
      Height = 17
      Caption = '3m'
      TabOrder = 1
      OnClick = chk1mClick
    end
    object chk5m: TCheckBox
      Left = 123
      Top = 22
      Width = 49
      Height = 17
      Caption = '5m'
      TabOrder = 2
      OnClick = chk1mClick
    end
    object chk15m: TCheckBox
      Left = 174
      Top = 22
      Width = 49
      Height = 17
      Caption = '15m'
      TabOrder = 3
      OnClick = chk1mClick
    end
    object chk30m: TCheckBox
      Left = 229
      Top = 22
      Width = 49
      Height = 17
      Caption = '30m'
      TabOrder = 4
      OnClick = chk1mClick
    end
    object chk1h: TCheckBox
      Left = 16
      Top = 45
      Width = 49
      Height = 17
      Caption = '1h'
      TabOrder = 5
      OnClick = chk1mClick
    end
    object chk2h: TCheckBox
      Left = 72
      Top = 45
      Width = 49
      Height = 17
      Caption = '2h'
      TabOrder = 6
      OnClick = chk1mClick
    end
    object chk4h: TCheckBox
      Left = 123
      Top = 45
      Width = 49
      Height = 17
      Caption = '4h'
      TabOrder = 7
      OnClick = chk1mClick
    end
    object chk12h: TCheckBox
      Left = 174
      Top = 45
      Width = 49
      Height = 17
      Caption = '12h'
      TabOrder = 8
      OnClick = chk1mClick
    end
    object chk1D: TCheckBox
      Left = 229
      Top = 45
      Width = 49
      Height = 17
      Caption = '1D'
      TabOrder = 9
      OnClick = chk1mClick
    end
  end
  object chkSound: TCheckBox
    Left = 240
    Top = 40
    Width = 57
    Height = 17
    Caption = 'Sound'
    TabOrder = 5
    OnClick = chkSoundClick
  end
end
