inherited f_VedOsmotr: Tf_VedOsmotr
  Left = 200
  Top = 202
  Width = 1007
  Height = 525
  Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1080' '#1055#1056#1045#1044#1042#1040#1056#1048#1058#1045#1051#1068#1053#1054#1043#1054' '#1086#1089#1084#1086#1090#1088#1072
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 234
    Width = 999
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clBtnFace
    ParentColor = False
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 40
    Width = 999
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object bRefresh: TTBItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 11
        OnClick = bRefreshClick
      end
      object TBItem3: TTBItem
        Action = acMOVedOsmotrAdd
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acMOVedOsmotrEdit
        DisplayMode = nbdmImageAndText
      end
      object TBItem4: TTBItem
        Action = acMOVedOsmotrCopy
        DisplayMode = nbdmImageAndText
      end
      object TBItem1: TTBItem
        Action = acMOVedOsmotrDel
        DisplayMode = nbdmImageAndText
      end
      object TBSubmenuItem3: TTBSubmenuItem
        Caption = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1077#1090#1086#1074
        DisplayMode = nbdmImageAndText
        ImageIndex = 6
        Images = f_main.img_Common
        object TBItem22: TTBItem
          Action = acReportLastGruz
        end
        object TBItem10: TTBItem
          Action = acPrint
        end
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 999
    Height = 40
    Align = alTop
    Caption = ' '#1060#1080#1083#1100#1090#1088' '
    TabOrder = 1
    object Label1: TLabel
      Left = 50
      Top = 18
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1089
    end
    object Label2: TLabel
      Left = 291
      Top = 18
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object Date1: TDateTimePicker
      Left = 203
      Top = 13
      Width = 82
      Height = 22
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      TabOrder = 0
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
    object Date2: TDateTimePicker
      Left = 387
      Top = 13
      Width = 82
      Height = 22
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      TabOrder = 1
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
    object time1: TDateTimePicker
      Left = 128
      Top = 13
      Width = 70
      Height = 22
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      Kind = dtkTime
      TabOrder = 2
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
    object time2: TDateTimePicker
      Left = 312
      Top = 13
      Width = 70
      Height = 22
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      Kind = dtkTime
      TabOrder = 3
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
  end
  object GridTitle: TDBGridEh
    Left = 0
    Top = 66
    Width = 999
    Height = 168
    Align = alTop
    DataSource = ds_title
    EvenRowColor = clWindow
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = [fsBold]
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind]
    ParentFont = False
    PopupMenu = PopupTitle
    RowSizingAllowed = True
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnExit = GridTitleExit
    OnSortMarkingChanged = GridTitleSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'VED_NUM'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'VED_DATE'
        Footers = <>
        Title.TitleButton = True
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'FROM_DATE'
        Footers = <>
        Title.TitleButton = True
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'TO_DATE'
        Footers = <>
        Title.TitleButton = True
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'KOL'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'SIGN1'
        Footers = <>
        Title.TitleButton = True
        Width = 149
      end
      item
        EditButtons = <>
        FieldName = 'FIO1'
        Footers = <>
        Title.TitleButton = True
        Width = 149
      end
      item
        EditButtons = <>
        FieldName = 'FIO2'
        Footers = <>
        Title.TitleButton = True
        Width = 163
      end
      item
        EditButtons = <>
        FieldName = 'FIO3'
        Footers = <>
        Title.TitleButton = True
        Width = 166
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Title.TitleButton = True
      end>
  end
  object gbRows: TGroupBox
    Left = 0
    Top = 239
    Width = 999
    Height = 252
    Align = alClient
    Caption = ' '#1055#1086#1079#1080#1094#1080#1080' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '
    TabOrder = 3
    object GridRows: TDBGridEh
      Left = 2
      Top = 67
      Width = 995
      Height = 183
      Align = alClient
      AllowedOperations = [alopUpdateEh, alopAppendEh]
      DataSource = ds_rows
      EvenRowColor = clInfoBk
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      FrozenCols = 4
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDialogFind]
      ParentFont = False
      PopupMenu = PopupRows
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnExit = GridRowsExit
      OnGetCellParams = GridRowsGetCellParams
      OnKeyDown = GridRowsKeyDown
      OnSortMarkingChanged = GridRowsSortMarkingChanged
      Columns = <
        item
          EditButtons = <>
          FieldName = 'POD_POS'
          Footers = <>
          Title.TitleButton = True
          Width = 36
        end
        item
          ButtonStyle = cbsNone
          EditButtons = <>
          FieldName = 'POD_DATE'
          Footers = <>
          Title.TitleButton = True
          Width = 62
        end
        item
          EditButtons = <>
          FieldName = 'VAGONTYPE_NAME'
          Footers = <>
          Title.TitleButton = True
          Width = 43
        end
        item
          EditButtons = <>
          FieldName = 'NUM_CIST'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.TitleButton = True
          Width = 78
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'BAD_NUM'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Title.TitleButton = True
          Width = 22
        end
        item
          EditButtons = <>
          FieldName = 'GOST1510'
          Footers = <>
          Title.TitleButton = True
          Width = 34
        end
        item
          EditButtons = <>
          FieldName = 'KALIBR_ID'
          Footers = <>
          Title.TitleButton = True
          Width = 41
        end
        item
          EditButtons = <>
          FieldName = 'VES_CIST'
          Footers = <>
          Title.TitleButton = True
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'CAPACITY'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'VAGOWNER_NAME'
          Footers = <>
          Title.TitleButton = True
          Width = 279
        end
        item
          EditButtons = <>
          FieldName = 'RAZMET_PER'
          Footers = <>
          Title.TitleButton = True
          Width = 94
        end
        item
          EditButtons = <>
          FieldName = 'LAST_PROD_NAME'
          Footers = <>
          Title.TitleButton = True
          Width = 179
        end
        item
          ButtonStyle = cbsNone
          EditButtons = <>
          FieldName = 'PROD_NAME'
          Footers = <>
          Title.TitleButton = True
          Width = 143
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'F_OST'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          PickList.Strings = (
            #1044#1072
            #1053#1077#1090)
          Title.TitleButton = True
          Width = 39
        end
        item
          EditButtons = <>
          FieldName = 'PRIM'
          Footers = <>
          Title.TitleButton = True
          Width = 220
        end
        item
          EditButtons = <>
          FieldName = 'VED_POD_NUM'
          Footers = <>
          Title.TitleButton = True
          Width = 136
        end
        item
          EditButtons = <>
          FieldName = 'VED_ID'
          Footers = <>
          Title.TitleButton = True
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Title.TitleButton = True
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'VED_OSMOTR_NUM'
          Footers = <>
          Title.TitleButton = True
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'VAG_STATUS_NAME'
          Footers = <>
          Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1074#1072#1075#1086#1085#1072
        end>
    end
    object TBDock2: TTBDock
      Left = 2
      Top = 15
      Width = 995
      Height = 26
      object TBToolbar2: TTBToolbar
        Left = 0
        Top = 0
        Caption = 'TBToolbar2'
        Images = f_main.img_Common
        TabOrder = 0
        object bRefreshRows: TTBItem
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          DisplayMode = nbdmImageAndText
          ImageIndex = 11
          Images = f_main.img_Common
          OnClick = bRefreshRowsClick
        end
        object TBItem5: TTBItem
          Action = acMOVedOsmotrRowsAdd
          DisplayMode = nbdmImageAndText
        end
        object TBItem6: TTBItem
          Action = acMOVedOsmotrRowsEdit
          DisplayMode = nbdmImageAndText
        end
        object TBItem7: TTBItem
          Action = acMOVedOsmotrRowsCopy
          DisplayMode = nbdmImageAndText
        end
        object TBItem8: TTBItem
          Action = acMOVedOsmotrRowsDel
          DisplayMode = nbdmImageAndText
        end
        object TBItem20: TTBItem
          Action = acRowsSprav
          DisplayMode = nbdmImageAndText
        end
        object TBItem19: TTBItem
          Action = acRowsPost
          DisplayMode = nbdmImageAndText
        end
        object TBItem18: TTBItem
          Action = acRowsCancel
          DisplayMode = nbdmImageAndText
        end
      end
    end
    object TBDock5: TTBDock
      Left = 2
      Top = 41
      Width = 995
      Height = 26
      object TBToolbar5: TTBToolbar
        Left = 0
        Top = 0
        Caption = 'TBToolbar2'
        DockPos = -16
        Images = f_main.img_Common
        TabOrder = 0
        object TBItem28: TTBItem
          Action = acVedOsmotrMoveVagon
          DisplayMode = nbdmImageAndText
        end
        object TBItem32: TTBItem
          Action = acFind
          DisplayMode = nbdmImageAndText
        end
        object TBItem21: TTBItem
          Action = acLastReis
          DisplayMode = nbdmImageAndText
        end
      end
    end
  end
  object ActionManager1: TActionManager
    ActionBars.SessionCount = 45
    ActionBars = <
      item
        AutoSize = False
      end
      item
        Items = <
          item
            Caption = '&Common'
          end>
        AutoSize = False
      end>
    Images = f_main.img_Common
    Left = 56
    Top = 168
    StyleName = 'XP Style'
    object acToXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      ImageIndex = 42
      OnExecute = acToXLSExecute
    end
    object acMOVedOsmotrAdd: TAction
      Category = 'TITLE'
      Caption = #1053#1086#1074#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      ImageIndex = 0
      OnExecute = acMOVedOsmotrAddExecute
    end
    object acMOVedOsmotrEdit: TAction
      Category = 'TITLE'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      OnExecute = acMOVedOsmotrEditExecute
    end
    object acMOVedOsmotrCopy: TAction
      Category = 'TITLE'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      OnExecute = acMOVedOsmotrCopyExecute
    end
    object acMOVedOsmotrDel: TAction
      Category = 'TITLE'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acMOVedOsmotrDelExecute
    end
    object acMOVedOsmotrRowsAdd: TAction
      Category = 'ROWS'
      Caption = 'F2-'#1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1072#1075#1086#1085
      ImageIndex = 0
      ShortCut = 113
      OnExecute = acMOVedOsmotrRowsAddExecute
    end
    object acMOVedOsmotrRowsEdit: TAction
      Category = 'ROWS'
      Caption = 'F4-'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      ShortCut = 115
      OnExecute = acMOVedOsmotrRowsEditExecute
    end
    object acMOVedOsmotrRowsCopy: TAction
      Category = 'ROWS'
      Caption = 'F6-'#1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      ShortCut = 117
      OnExecute = acMOVedOsmotrRowsCopyExecute
    end
    object acMOVedOsmotrRowsDel: TAction
      Category = 'ROWS'
      Caption = 'F8-'#1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 119
      OnExecute = acMOVedOsmotrRowsDelExecute
    end
    object acPrint: TAction
      Category = 'FOR_ALL'
      Caption = 'CTRL+F6-'#1055#1077#1095#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      ImageIndex = 6
      ShortCut = 16501
      OnExecute = acPrintExecute
    end
    object acFilter: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100'...'
      ImageIndex = 9
      OnExecute = acFilterExecute
    end
    object acNoFilter: TAction
      Category = 'FOR_ALL'
      Caption = #1059#1073#1088#1072#1090#1100' '#1086#1090#1073#1086#1088
      ImageIndex = 16
      OnExecute = acNoFilterExecute
    end
    object acRowsPost: TAction
      Category = 'FOR_ALL'
      Caption = 'F10-'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      ShortCut = 121
      OnExecute = acRowsPostExecute
    end
    object acRowsCancel: TAction
      Category = 'FOR_ALL'
      Caption = 'ESC-'#1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 14
      OnExecute = acRowsCancelExecute
    end
    object acRowsSprav: TAction
      Category = 'FOR_ALL'
      Caption = 'F3-'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      ImageIndex = 30
      ShortCut = 114
      OnExecute = acRowsSpravExecute
    end
    object acVedOsmotrMoveVagon: TAction
      Category = 'ROWS'
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1074#1072#1075#1086#1085
      ImageIndex = 21
      OnExecute = acVedOsmotrMoveVagonExecute
    end
    object acReportLastGruz: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1075#1088#1091#1079
      ImageIndex = 27
      OnExecute = acReportLastGruzExecute
    end
    object acFind: TAction
      Category = 'FOR_ALL'
      Caption = 'F5-'#1055#1086#1080#1089#1082
      ImageIndex = 9
      ShortCut = 116
      OnExecute = acFindExecute
    end
    object acLastReis: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' '#1088#1077#1081#1089#1099
      ImageIndex = 22
      OnExecute = acLastReisExecute
    end
  end
  object PopupTitle: TTBPopupMenu
    Images = f_main.img_Common
    Left = 291
    Top = 101
    object TBItem16: TTBItem
      Action = acFilter
    end
    object TBItem17: TTBItem
      Action = acNoFilter
    end
    object tbTitleFilterTitle: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object tbTitleFilterEdit: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = tbTitleFilterEditAcceptText
    end
    object tbTitleFilterSelection: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      ImageIndex = 3
      OnClick = tbTitleFilterSelectionClick
    end
    object tbTitleFilterClear: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 16
      OnClick = tbTitleFilterClearClick
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object tbTitleWinEdit: TTBItem
      Caption = #1042' '#1086#1082#1085#1077
      OnClick = tbTitleWinEditClick
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = acMOVedOsmotrAdd
      DisplayMode = nbdmImageAndText
    end
    object TBItem11: TTBItem
      Action = acMOVedOsmotrEdit
      DisplayMode = nbdmImageAndText
    end
    object TBItem12: TTBItem
      Action = acMOVedOsmotrCopy
      DisplayMode = nbdmImageAndText
    end
    object TBItem13: TTBItem
      Action = acMOVedOsmotrDel
      DisplayMode = nbdmImageAndText
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBSubmenuItem1: TTBSubmenuItem
      Caption = #1057#1074#1103#1079#1080
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem14: TTBItem
      Action = acPrint
      DisplayMode = nbdmImageAndText
    end
    object TBItem15: TTBItem
      Action = acToXLS
      DisplayMode = nbdmImageAndText
    end
  end
  object PopupRows: TTBPopupMenu
    Images = f_main.img_Common
    Left = 291
    Top = 349
    object tbRowsFilterTitle: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object tbRowsFilterEdit: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = tbRowsFilterEditAcceptText
    end
    object tbRowsFilterSelection: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      ImageIndex = 3
      OnClick = tbRowsFilterSelectionClick
    end
    object tbRowsFilterClear: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 16
      OnClick = tbRowsFilterClearClick
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
    object tbRowsWinEdit: TTBItem
      Caption = #1042' '#1086#1082#1085#1077
      OnClick = tbRowsWinEditClick
    end
    object TBSeparatorItem6: TTBSeparatorItem
    end
    object TBItem24: TTBItem
      Action = acMOVedOsmotrRowsAdd
      DisplayMode = nbdmImageAndText
    end
    object TBItem25: TTBItem
      Action = acMOVedOsmotrRowsEdit
      DisplayMode = nbdmImageAndText
    end
    object TBItem26: TTBItem
      Action = acMOVedOsmotrRowsCopy
      DisplayMode = nbdmImageAndText
    end
    object TBItem27: TTBItem
      Action = acMOVedOsmotrRowsDel
      DisplayMode = nbdmImageAndText
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBSubmenuItem2: TTBSubmenuItem
      Caption = #1057#1074#1103#1079#1080
    end
    object TBSeparatorItem8: TTBSeparatorItem
    end
    object TBItem29: TTBItem
      Action = acToXLS
      DisplayMode = nbdmImageAndText
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    Connected = True
    Left = 95
    Top = 97
  end
  object q_title: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */ '
      'a.*'
      'FROM VED_OSMOTR a'
      'WHERE MESTO_ID=:MESTO_ID'
      '  AND LOAD_TYPE_ID=:LOAD_TYPE_ID'
      '  AND( (1=1'
      '  AND 1=1 /* '#1089' '#1076#1072#1090#1099' */'
      '  AND 1=1 /* '#1087#1086' '#1076#1072#1090#1091' */'
      '  AND 1=1'
      '  AND 1=1'
      '  AND 1=1'
      '  AND 1=1'
      '  AND 1=1'
      '  AND 1=1'
      '  AND 1=1'
      '  ) OR (a.ID=:TITLE_ID))'
      'ORDER BY ved_date DESC, ved_num DESC')
    Variables.Data = {
      0300000003000000090000003A4D4553544F5F49440300000000000000000000
      000D0000003A4C4F41445F545950455F49440300000000000000000000000900
      00003A5449544C455F49440400000008000000000000000000000000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000D0000000200000049440100000000070000005645445F4E554D0100
      000000080000005645445F4441544501000000000900000046524F4D5F444154
      45010000000007000000544F5F4441544501000000000400000046494F310100
      0000000400000046494F3201000000000400000046494F330100000000050000
      005349474E310100000000080000004D4553544F5F4944010000000003000000
      4B4F4C01000000000A0000005645445F50524546495801000000000C0000004C
      4F41445F545950455F49440100000000}
    UniqueFields = 'ID'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    UpdatingTable = 'VED_OSMOTR'
    Session = ora_Session
    BeforeOpen = q_titleBeforeOpen
    AfterOpen = q_titleAfterOpen
    AfterScroll = q_titleAfterScroll
    OnFilterRecord = q_titleFilterRecord
    Left = 232
    Top = 160
    object q_titleID: TFloatField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object q_titleVED_NUM: TFloatField
      DisplayLabel = #8470' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      FieldName = 'VED_NUM'
      Required = True
    end
    object q_titleVED_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      FieldName = 'VED_DATE'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_titleFROM_DATE: TDateTimeField
      DisplayLabel = 'c'
      FieldName = 'FROM_DATE'
      DisplayFormat = 'hh:nn'
    end
    object q_titleTO_DATE: TDateTimeField
      DisplayLabel = #1076#1086
      FieldName = 'TO_DATE'
      DisplayFormat = 'hh:nn'
    end
    object q_titleSIGN1: TStringField
      DisplayLabel = #1055#1086#1076#1087#1080#1089#1100
      FieldName = 'SIGN1'
      Size = 50
    end
    object q_titleFIO1: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088' 1'
      FieldName = 'FIO1'
      Size = 50
    end
    object q_titleFIO2: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088' 2'
      FieldName = 'FIO2'
      Size = 50
    end
    object q_titleFIO3: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088' 3'
      FieldName = 'FIO3'
      Size = 50
    end
    object q_titleMESTO_ID: TFloatField
      FieldName = 'MESTO_ID'
      Required = True
    end
    object q_titleVED_PREFIX: TStringField
      FieldName = 'VED_PREFIX'
      Size = 10
    end
    object q_titleLOAD_TYPE_ID: TFloatField
      FieldName = 'LOAD_TYPE_ID'
      Required = True
    end
    object q_titleKOL: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074#1072#1075#1086#1085#1086#1074
      FieldName = 'KOL'
      Required = True
    end
  end
  object ds_title: TDataSource
    DataSet = q_title
    Left = 288
    Top = 160
  end
  object q_rows: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */ a.*,a.rowid,'
      'p.ID_NPR as LAST_PROD_ID_NPR, s.VS_NAME as VAG_STATUS_NAME,'
      
        'Trim(FOR_CIST.LAST_PROD_DATE(:VED_DATE,a.NUM_CIST,:MESTO_ID,:LOA' +
        'D_TYPE_ID)||'#39'-'#39'||p.ABBR_NPR) as LAST_PROD_NAME,'
      '(CASE'
      '   WHEN c.VEDPOD_ID IS NULL THEN '#39#39
      
        '   ELSE c.VEDPOD_NUM||'#39' '#1086#1090' '#39'||TO_CHAR(c.VEDPOD_DATE,'#39'dd.mm.yyyy'#39 +
        ')'
      ' END) as VED_POD_NUM,'
      
        ':VED_NUM||'#39' '#1086#1090' '#39'||TO_CHAR(:VED_DATE,'#39'dd.mm.yyyy'#39') as VED_OSMOTR_' +
        'NUM'
      'FROM VED_OSMOTR_ROW a,'
      
        #9' (SELECT VED_OSMOTR_ROW_ID as VEDOSMOTR_ROW_ID, VED_POD_ID as V' +
        'EDPOD_ID FROM VED_POD_ROW) b,'
      
        '   (SELECT ID as VEDPOD_ID, POD_NUM as VEDPOD_NUM, POD_DATE as V' +
        'EDPOD_DATE FROM VED_POD) c,'
      '   (SELECT ID_NPR,ABBR_NPR FROM KLS_PROD) p,'
      #9' (SELECT ID as VS_ID, NAME as VS_NAME FROM KLS_VAG_STATUS) s'
      'WHERE a.VED_ID=:VED_ID'
      '  AND a.ID=b.VEDOSMOTR_ROW_ID(+)'
      '  AND b.VEDPOD_ID=c.VEDPOD_ID(+)'
      '  AND a.VAG_STATUS_ID=s.VS_ID(+)'
      
        '  AND FOR_CIST.LAST_PROD_ID_NPR(:VED_DATE,a.NUM_CIST,:MESTO_ID,:' +
        'LOAD_TYPE_ID)=p.ID_NPR(+)'
      'ORDER BY a.pod_pos')
    Variables.Data = {
      0300000005000000070000003A5645445F494404000000000000000000000009
      0000003A4D4553544F5F49440400000000000000000000000D0000003A4C4F41
      445F545950455F4944040000000000000000000000080000003A5645445F4E55
      4D040000000000000000000000090000003A5645445F444154450C0000000000
      000000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      03000000180000000200000049440100000000080000004E554D5F4349535401
      00000000090000004B414C4942525F49440100000000060000005645445F4944
      010000000008000000504F445F4441544501000000000A00000052415A4D4554
      5F504552010000000005000000465F4F53540100000000040000005052494D01
      0000000007000000504F445F504F5301000000000B00000050524F445F49445F
      4E505201000000000B0000005641474F574E45525F4944010000000008000000
      43415041434954590100000000080000004E43495354444F5001000000000400
      0000415845530100000000080000005645535F4349535401000000000C000000
      5641474F4E545950455F49440100000000070000004241445F4E554D01000000
      000E0000004C4153545F50524F445F4E414D450100000000100000004C415354
      5F50524F445F49445F4E505201000000000B0000005645445F504F445F4E554D
      01000000000E0000005645445F4F534D4F54525F4E554D01000000000D000000
      5641475F5354415455535F494401000000000F0000005641475F535441545553
      5F4E414D45010000000008000000474F5354313531300100000000}
    UniqueFields = 'ID'
    Master = q_title
    MasterFields = 'ID'
    DetailFields = 'VED_ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'VED_OSMOTR_ROW'
    Session = ora_Session
    BeforeOpen = q_rowsBeforeOpen
    AfterInsert = q_rowsAfterInsert
    BeforePost = q_rowsBeforePost
    AfterPost = q_rowsAfterPost
    AfterDelete = q_rowsAfterDelete
    BeforeScroll = q_rowsBeforeScroll
    AfterScroll = q_rowsAfterScroll
    OnFilterRecord = q_rowsFilterRecord
    Left = 248
    Top = 408
    object q_rowsID: TFloatField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object q_rowsVED_ID: TFloatField
      FieldName = 'VED_ID'
      ReadOnly = True
      Required = True
    end
    object q_rowsPOD_DATE: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1086#1076#1093#1086#1076#1072
      FieldName = 'POD_DATE'
      DisplayFormat = 'hh:nn'
    end
    object q_rowsNUM_CIST: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1074#1072#1075#1086#1085#1072
      FieldName = 'NUM_CIST'
      Required = True
      OnChange = q_rowsNUM_CISTChange
      Size = 9
    end
    object q_rowsKALIBR_ID: TStringField
      DisplayLabel = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
      FieldName = 'KALIBR_ID'
      Size = 5
    end
    object q_rowsRAZMET_PER: TStringField
      DisplayLabel = #1056#1072#1079#1084#1077#1090#1082#1072' '#1087#1086' '#1087#1077#1088#1077#1089#1099#1083#1082#1077
      FieldName = 'RAZMET_PER'
      OnValidate = q_rowsRAZMET_PERValidate
      Size = 30
    end
    object q_rowsF_OST: TIntegerField
      DisplayLabel = #1054#1089#1090#1072'- '#1090#1086#1082' ?'
      FieldName = 'F_OST'
    end
    object q_rowsPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 50
    end
    object q_rowsPOD_POS: TFloatField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'POD_POS'
    end
    object q_rowsPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 6
    end
    object q_rowsVAGOWNER_ID: TFloatField
      FieldName = 'VAGOWNER_ID'
    end
    object q_rowsCAPACITY: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086'- '#1087#1086#1076#1098#1077#1084'- '#1085#1086#1089#1090#1100
      FieldName = 'CAPACITY'
      Size = 10
    end
    object q_rowsNCISTDOP: TIntegerField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1076#1086#1088#1086#1075' '#1057#1053#1043
      FieldName = 'NCISTDOP'
    end
    object q_rowsAXES: TIntegerField
      DisplayLabel = #1054#1089#1080
      FieldName = 'AXES'
    end
    object q_rowsVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072
      DisplayWidth = 10
      FieldName = 'VES_CIST'
    end
    object q_rowsVAGONTYPE_ID: TFloatField
      FieldName = 'VAGONTYPE_ID'
    end
    object q_rowsBAD_NUM: TIntegerField
      DisplayLabel = '?'
      FieldName = 'BAD_NUM'
      ReadOnly = True
    end
    object q_rowsPROD_NAME: TStringField
      DisplayLabel = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103' '#1088#1072#1079#1084#1077#1090#1082#1072
      FieldKind = fkLookup
      FieldName = 'PROD_NAME'
      LookupDataSet = q_Prod
      LookupKeyFields = 'ID_NPR'
      LookupResultField = 'NAME_NPR'
      KeyFields = 'PROD_ID_NPR'
      Size = 40
      Lookup = True
    end
    object q_rowsVAGOWNER_NAME: TStringField
      DisplayLabel = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1074#1072#1075#1086#1085#1072
      FieldKind = fkLookup
      FieldName = 'VAGOWNER_NAME'
      LookupDataSet = q_VagOwner
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VAGOWNER_ID'
      Size = 50
      Lookup = True
    end
    object q_rowsVAGONTYPE_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1074#1072#1075#1086'- '#1085#1072
      FieldKind = fkLookup
      FieldName = 'VAGONTYPE_NAME'
      LookupDataSet = q_VagonType
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VAGONTYPE_ID'
      Lookup = True
    end
    object q_rowsLAST_PROD_NAME: TStringField
      DisplayLabel = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1075#1088#1091#1079
      FieldName = 'LAST_PROD_NAME'
      ReadOnly = True
      Size = 32
    end
    object q_rowsLAST_PROD_ID_NPR: TStringField
      FieldName = 'LAST_PROD_ID_NPR'
      ReadOnly = True
      Size = 5
    end
    object q_rowsVED_POD_NUM: TStringField
      DisplayLabel = #1057#1074#1103#1079#1072#1085' '#1089' '#1074#1077#1076#1086#1084#1086#1089#1090#1100#1102' '#1087#1086#1076#1072#1095#1080
      FieldName = 'VED_POD_NUM'
      ReadOnly = True
      Size = 54
    end
    object q_rowsVED_OSMOTR_NUM: TStringField
      DisplayLabel = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1086#1089#1084#1086#1090#1088#1072
      FieldName = 'VED_OSMOTR_NUM'
      ReadOnly = True
      Size = 54
    end
    object q_rowsVAG_STATUS_ID: TFloatField
      FieldName = 'VAG_STATUS_ID'
      Required = True
    end
    object q_rowsVAG_STATUS_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'VAG_STATUS_NAME'
      LookupDataSet = q_VagStatus
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VAG_STATUS_ID'
      Lookup = True
    end
    object q_rowsGOST1510: TIntegerField
      DisplayLabel = #1043#1054#1057#1058' 1510'
      FieldName = 'GOST1510'
    end
  end
  object ds_rows: TDataSource
    DataSet = q_rows
    Left = 296
    Top = 408
  end
  object pkgFOR_VED_OSMOTR: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_VED_OSMOTR'
    Left = 200
    Top = 343
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'gbRows.GridRows.<P>.Columns.ColumnsIndex'
      'gbRows.GridRows.<P>.Columns.<ForAllItems>.Width'
      'GridTitle.<P>.Columns.ColumnsIndex'
      'GridTitle.<P>.Columns.<ForAllItems>.Width'
      'GridTitle.<P>.Height')
    Left = 384
    Top = 144
  end
  object pkgFOR_CIST: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_CIST'
    Left = 144
    Top = 399
  end
  object q_Prod: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  kls_prod.ID_NPR,'
      '  kls_prod.NAME_NPR as NAME_NPR'
      'from kls_prod'
      'ORDER BY ID_NPR')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E50520100000000080000004E414D455F
      4E50520100000000}
    Session = ora_Session
    Active = True
    Left = 427
    Top = 425
    object q_ProdID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object q_ProdNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
  end
  object q_VagonType: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  a.ID,'
      '  a.ABBR_NAME as NAME'
      'from kls_vagontype a'
      'where a.id<>0'
      'ORDER BY a.ID')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Active = True
    Left = 419
    Top = 361
    object q_VagonTypeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_VagonTypeNAME: TStringField
      FieldName = 'NAME'
      Size = 3
    end
  end
  object q_VagOwner: TOracleDataSet
    SQL.Strings = (
      'select '
      '  ID,'
      '  kls_vagowner.DISPLAY_NAME as NAME,'
      '  sortby'
      'from kls_vagowner'
      'where LOAD_TYPE_ID=:LOAD_TYPE_ID and (id=0 or SOBSTV_ID<>0)'
      'ORDER BY sortby')
    Variables.Data = {
      03000000010000000D0000003A4C4F41445F545950455F494403000000040000
      000100000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000040000004E414D450100000000
      06000000534F525442590100000000}
    Session = ora_Session
    Active = True
    Left = 507
    Top = 329
    object q_VagOwnerID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_VagOwnerNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object q_VagOwnerSORTBY: TFloatField
      FieldName = 'SORTBY'
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 336
    Top = 336
  end
  object q_cist_deni: TOracleDataSet
    SQL.Strings = (
      'select * from kls_cist_deni'
      'where num_cist=:NUM_CIST'
      'order by beg_deni desc')
    Variables.Data = {
      0300000001000000090000003A4E554D5F434953540500000000000000000000
      00}
    Session = ora_Session
    Left = 600
    Top = 375
  end
  object q_VagStatus: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  a.ID,'
      '  a.NAME as NAME'
      'from kls_vag_status a'
      'ORDER BY a.ID')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Active = True
    Left = 723
    Top = 345
    object q_VagStatusID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_VagStatusNAME: TStringField
      FieldName = 'NAME'
      Required = True
    end
  end
  object ds_VagStatus: TDataSource
    DataSet = q_VagStatus
    Left = 724
    Top = 402
  end
  object q_razmet: TOracleDataSet
    SQL.Strings = (
      'select r.*, p.abbr_npr from kls_prod_razmet r,kls_prod p'
      'where r.prod_id_npr=p.id_npr(+)')
    QBEDefinition.QBEFieldDefs = {
      03000000040000000600000052415A4D455401000000000B00000050524F445F
      49445F4E505201000000000C00000049535F4155544F5F4C494E4B0100000000
      08000000414242525F4E50520100000000}
    Session = ora_Session
    Active = True
    Left = 856
    Top = 391
  end
end
