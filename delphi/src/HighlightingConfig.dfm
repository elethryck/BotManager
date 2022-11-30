object frmHighlighting: TfrmHighlighting
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = 'Highlighting'
  ClientHeight = 490
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 490
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      398
      490)
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 382
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object colorSelector: TAdvOfficeColorSelector
        Left = 3
        Top = 16
        Width = 25
        Height = 24
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Rounded = False
        ShowCaption = True
        Transparent = True
        Version = '1.6.3.3'
        TabOrder = 0
        AllowFloating = False
        CloseOnSelect = False
        CaptionAppearance.BorderColor = clNone
        CaptionAppearance.Color = 16250613
        CaptionAppearance.ColorTo = clNone
        CaptionAppearance.Direction = gdHorizontal
        CaptionAppearance.TextColor = clBlack
        CaptionAppearance.TextColorHot = clBlack
        CaptionAppearance.TextColorDown = clBlack
        CaptionAppearance.ButtonAppearance.Color = clWhite
        CaptionAppearance.ButtonAppearance.ColorTo = clWhite
        CaptionAppearance.ButtonAppearance.ColorChecked = 16111818
        CaptionAppearance.ButtonAppearance.ColorCheckedTo = 16367008
        CaptionAppearance.ButtonAppearance.ColorDisabled = 15921906
        CaptionAppearance.ButtonAppearance.ColorDisabledTo = 15921906
        CaptionAppearance.ButtonAppearance.ColorDown = 16111818
        CaptionAppearance.ButtonAppearance.ColorDownTo = 16367008
        CaptionAppearance.ButtonAppearance.ColorHot = 16117985
        CaptionAppearance.ButtonAppearance.ColorHotTo = 16372402
        CaptionAppearance.ButtonAppearance.ColorMirror = clSilver
        CaptionAppearance.ButtonAppearance.ColorMirrorTo = clWhite
        CaptionAppearance.ButtonAppearance.ColorMirrorHot = 16107693
        CaptionAppearance.ButtonAppearance.ColorMirrorHotTo = 16775412
        CaptionAppearance.ButtonAppearance.ColorMirrorDown = 16102556
        CaptionAppearance.ButtonAppearance.ColorMirrorDownTo = 16768988
        CaptionAppearance.ButtonAppearance.ColorMirrorChecked = 16102556
        CaptionAppearance.ButtonAppearance.ColorMirrorCheckedTo = 16768988
        CaptionAppearance.ButtonAppearance.ColorMirrorDisabled = 11974326
        CaptionAppearance.ButtonAppearance.ColorMirrorDisabledTo = 15921906
        DragGripAppearance.BorderColor = clGray
        DragGripAppearance.Color = 16250613
        DragGripAppearance.ColorTo = 16250613
        DragGripAppearance.ColorMirror = 16250613
        DragGripAppearance.ColorMirrorTo = 16250613
        DragGripAppearance.Gradient = ggVertical
        DragGripAppearance.GradientMirror = ggVertical
        DragGripAppearance.BorderColorHot = 16371364
        DragGripAppearance.ColorHot = 16250613
        DragGripAppearance.ColorHotTo = 16250613
        DragGripAppearance.ColorMirrorHot = 16250613
        DragGripAppearance.ColorMirrorHotTo = 16250613
        DragGripAppearance.GradientHot = ggRadial
        DragGripAppearance.GradientMirrorHot = ggRadial
        DragGripPosition = gpTop
        Appearance.BorderColor = 15000546
        Appearance.BorderColorHot = 16371364
        Appearance.BorderColorDown = 14983778
        Appearance.BorderColorChecked = 14327846
        Appearance.BorderColorDisabled = 13948116
        Appearance.Color = 16250613
        Appearance.ColorTo = clNone
        Appearance.ColorChecked = 14327846
        Appearance.ColorCheckedTo = clNone
        Appearance.ColorDisabled = 16250871
        Appearance.ColorDisabledTo = clNone
        Appearance.ColorDown = 16244937
        Appearance.ColorDownTo = clNone
        Appearance.ColorHot = 16248808
        Appearance.ColorHotTo = clNone
        Appearance.ColorMirror = 16250613
        Appearance.ColorMirrorTo = clNone
        Appearance.ColorMirrorHot = 16248808
        Appearance.ColorMirrorHotTo = clNone
        Appearance.ColorMirrorDown = 16244937
        Appearance.ColorMirrorDownTo = clNone
        Appearance.ColorMirrorChecked = 14327846
        Appearance.ColorMirrorCheckedTo = clNone
        Appearance.ColorMirrorDisabled = 16250871
        Appearance.ColorMirrorDisabledTo = clNone
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        Appearance.TextColorDown = clWindowText
        Appearance.TextColorHot = clWindowText
        SelectedColor = clAqua
        ShowRGBHint = True
        BorderDropDownColor = 14474202
        ColorDropDown = 16251129
        ColorDropDownFloating = 16374724
        SelectionAppearance.BorderColor = 15000546
        SelectionAppearance.BorderColorHot = 16371364
        SelectionAppearance.BorderColorDown = 14983778
        SelectionAppearance.BorderColorChecked = 14327846
        SelectionAppearance.Color = 16250613
        SelectionAppearance.ColorTo = clNone
        SelectionAppearance.ColorChecked = 14327846
        SelectionAppearance.ColorCheckedTo = clNone
        SelectionAppearance.ColorDisabled = 16250871
        SelectionAppearance.ColorDisabledTo = clNone
        SelectionAppearance.ColorDown = 16244937
        SelectionAppearance.ColorDownTo = clNone
        SelectionAppearance.ColorHot = 16248808
        SelectionAppearance.ColorHotTo = clNone
        SelectionAppearance.ColorMirror = 16250613
        SelectionAppearance.ColorMirrorTo = clNone
        SelectionAppearance.ColorMirrorHot = 16248808
        SelectionAppearance.ColorMirrorHotTo = clNone
        SelectionAppearance.ColorMirrorDown = 16244937
        SelectionAppearance.ColorMirrorDownTo = clNone
        SelectionAppearance.ColorMirrorChecked = 14327846
        SelectionAppearance.ColorMirrorCheckedTo = clNone
        SelectionAppearance.ColorMirrorDisabled = 16250871
        SelectionAppearance.ColorMirrorDisabledTo = clNone
        SelectionAppearance.GradientHot = ggVertical
        SelectionAppearance.GradientMirrorHot = ggVertical
        SelectionAppearance.GradientDown = ggVertical
        SelectionAppearance.GradientMirrorDown = ggVertical
        SelectionAppearance.GradientChecked = ggVertical
        SelectionAppearance.TextColorChecked = 4474440
        SelectionAppearance.TextColorDown = 4474440
        SelectionAppearance.TextColorHot = 4474440
        SelectionAppearance.TextColorDisabled = clGray
        SelectionAppearance.TextColor = clBlack
        SelectionAppearance.Rounded = False
        Tools = <
          item
            BackGroundColor = clBlack
            Caption = 'Automatic'
            CaptionAlignment = taCenter
            Enable = True
            Hint = 'Automatic'
            ImageIndex = -1
            ItemType = itFullWidthButton
          end
          item
            BackGroundColor = clBlack
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 13209
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 13107
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 13056
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 6697728
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clNavy
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 3486515
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 3355443
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clMaroon
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 26367
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clOlive
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clGreen
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clTeal
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clBlue
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 10053222
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clGray
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clRed
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 39423
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 52377
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 6723891
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 13421619
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 16737843
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clPurple
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 10066329
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clFuchsia
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 52479
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clYellow
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clLime
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clAqua
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 16763904
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 6697881
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clSilver
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 13408767
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 10079487
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 10092543
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 13434828
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 16777164
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 16764057
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = 16751052
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = clWhite
            CaptionAlignment = taCenter
            Enable = True
            ImageIndex = -1
          end
          item
            BackGroundColor = -2
            Caption = 'More Colors...'
            CaptionAlignment = taCenter
            Enable = True
            Hint = 'More Colors'
            ImageIndex = -1
            ItemType = itFullWidthButton
          end>
        UIStyle = tsWindows10
      end
      object edtString: TEdit
        Left = 34
        Top = 16
        Width = 283
        Height = 24
        TabOrder = 1
        TextHint = 'Ex: TRADE UP'
        OnChange = edtStringChange
      end
      object btnAdd: TcxButton
        Left = 323
        Top = 10
        Width = 41
        Height = 36
        Enabled = False
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
          617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
          2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
          77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
          22307078222076696577426F783D2230203020333220333222207374796C653D
          22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
          3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
          303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
          63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
          3B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A234646
          423131353B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
          233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
          6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
          696C6C3A234431314331433B7D262331333B262331303B2623393B2E7374307B
          6F7061636974793A302E37353B7D262331333B262331303B2623393B2E737431
          7B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C672069643D2241
          6464223E0D0A09093C7061746820636C6173733D22477265656E2220643D224D
          32372C3134682D39563563302D302E352D302E352D312D312D31682D32632D30
          2E352C302D312C302E352D312C3176394835632D302E352C302D312C302E352D
          312C31763263302C302E352C302E352C312C312C316839763920202623393B26
          23393B63302C302E352C302E352C312C312C31683263302E352C302C312D302E
          352C312D31762D39683963302E352C302C312D302E352C312D31762D32433238
          2C31342E352C32372E352C31342C32372C31347A222F3E0D0A093C2F673E0D0A
          3C2F7376673E0D0A}
        TabOrder = 2
        OnClick = btnAddClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 71
      Width = 382
      Height = 370
      Caption = '  Defini'#231#245'es  '
      TabOrder = 1
      object btnMoveUP: TcxButton
        Left = 8
        Top = 23
        Width = 41
        Height = 36
        Enabled = False
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
          617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
          2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
          77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
          22307078222076696577426F783D2230203020333220333222207374796C653D
          22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
          3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
          303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
          63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
          3B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A234646
          423131353B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
          233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
          6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
          696C6C3A234431314331433B7D262331333B262331303B2623393B2E7374307B
          6F7061636974793A302E37353B7D262331333B262331303B2623393B2E737431
          7B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C672069643D2241
          72726F77335570223E0D0A09093C706F6C79676F6E20636C6173733D2259656C
          6C6F772220706F696E74733D2231362C3820332C323120362C32342031362C31
          342032362C32342032392C3231202623393B222F3E0D0A093C2F673E0D0A3C2F
          7376673E0D0A}
        TabOrder = 0
        OnClick = btnMoveUPClick
      end
      object btnMoveDown: TcxButton
        Left = 8
        Top = 65
        Width = 41
        Height = 36
        Enabled = False
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
          617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
          2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
          77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
          22307078222076696577426F783D2230203020333220333222207374796C653D
          22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
          3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
          303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
          63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
          3B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A234646
          423131353B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
          233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
          6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
          696C6C3A234431314331433B7D262331333B262331303B2623393B2E7374307B
          6F7061636974793A302E37353B7D262331333B262331303B2623393B2E737431
          7B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C672069643D2241
          72726F7733446F776E223E0D0A09093C706F6C79676F6E20636C6173733D2259
          656C6C6F772220706F696E74733D2232392C31312032362C382031362C313820
          362C3820332C31312031362C3234202623393B222F3E0D0A093C2F673E0D0A3C
          2F7376673E0D0A}
        TabOrder = 1
        OnClick = btnMoveDownClick
      end
      object btnDel: TcxButton
        Left = 8
        Top = 107
        Width = 41
        Height = 36
        Enabled = False
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000029744558745469746C650052656D6F76653B44656C6574
          653B426172733B526962626F6E3B5374616E646172643B635648300000003849
          444154785EEDCEA11500200C05318663932EDD6D3E03A07945449C39959564B4
          6B00000000000074EDBCE86B00C06800000000000000079F51C8FEAC1BD7F300
          00000049454E44AE426082}
        OptionsImage.Spacing = 0
        TabOrder = 2
        OnClick = btnDelClick
      end
      object lvDados: TListView
        Left = 55
        Top = 23
        Width = 309
        Height = 338
        Columns = <
          item
            Width = 280
          end>
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 3
        ViewStyle = vsReport
        OnCustomDrawItem = lvDadosCustomDrawItem
        OnSelectItem = lvDadosSelectItem
      end
    end
    object btnClose: TcxButton
      Left = 272
      Top = 447
      Width = 118
      Height = 34
      Caption = 'Fechar'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F40000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C00000023744558745469746C650043616E63656C3B53746F703B
        457869743B426172733B526962626F6E3B4C9696B2000000F549444154785EED
        D7310AC240108561B31750922BD9A44802F1081E554451B4F62AA9D6090CAC84
        98C7CC63D122C56BF7FF8A8DAC9B18E34FF79F8015F03AEE994DCF0A5EC05676
        92D51E80C61BD959B63301347E9345D960447CC6073DE3FE0D31170FAA8E3A0F
        22C5757A6601018A38243D42E0B8623AEB1DE801828863004470710C3020709C
        0060048A93008C00711A801138CE033022C547686E40B300A83300707C8AC805
        680C97B066009678B7F489D2001CC7BF132400C7ED080C40F1364509040018E2
        1C622E5EC82E20EE415C2D0F9252F670C6C7C014F19455D63B50AABA251EA5BD
        9E5179BF8290FB59BEFE335A016F69850D637E4FD7AD0000000049454E44AE42
        6082}
      OptionsImage.Spacing = 0
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object cxButton1: TcxButton
      Left = 148
      Top = 447
      Width = 118
      Height = 34
      Caption = 'Salvar'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
        617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
        2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
        77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
        22307078222076696577426F783D2230203020333220333222207374796C653D
        22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
        3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
        303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
        63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
        3B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A234646
        423131353B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
        233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
        6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
        696C6C3A234431314331433B7D262331333B262331303B2623393B2E7374307B
        6F7061636974793A302E37353B7D262331333B262331303B2623393B2E737431
        7B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C672069643D2243
        6865636B223E0D0A09093C706F6C79676F6E20636C6173733D22477265656E22
        20706F696E74733D2232372C352031312C323120352C313520322C3138203131
        2C32372033302C38202623393B222F3E0D0A093C2F673E0D0A3C2F7376673E0D
        0A}
      OptionsImage.Spacing = 0
      TabOrder = 3
      OnClick = cxButton1Click
    end
  end
end
