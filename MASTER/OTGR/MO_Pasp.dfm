object f_Pasp: Tf_Pasp
  Left = 247
  Top = 219
  Width = 936
  Height = 640
  Caption = #1055#1072#1089#1087#1086#1088#1090#1072' '#1085#1072' '#1086#1090#1075#1088#1091#1079#1082#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000EEEEEEE00000E00000EEEEEEEEEEE00000E
    EE000000EEE000000EEEEEEE00000000E0000000EEE0000000EEEEE000000000
    E000000EEEE0000000EEEEE000000000E000000EEEEE000000EEEEE000000000
    E000000EEEEE000000EEEEE000000000E00000EEEEEEE00000EEEEE000000000
    E00000EEEEE0E00000EEEEE000000000E0000EEEEEE0E00000EEEEE000000000
    E0000EEEEE000E0000EEEEE000000000E0000EEEEE000E0000EEEEE000000000
    E000EEEEEE0000E000EEEEE000000000E000EEEEE00000E000EEEEE000000000
    E00EEEEEE00000E000EEEEE000000000E00EEEEE0000000E00EEEEE000000000
    E0EEEEEE0000000E00EEEEE000000000E0EEEEE000000000E0EEEEE000000000
    E0EEEEE000000000E0EEEEE000000000EEEEEEE0000000000EEEEEE00000000E
    EEEEEE00000000000EEEEEEE00000EEEEEEEEE000000000000EEEEEEEE000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFF80FBE003E3F1F80FF7F1FC1FF7E1FC1FF7E0FC1FF7E0
    FC1FF7C07C1FF7C17C1FF7817C1FF783BC1FF783BC1FF703DC1FF707DC1FF607
    DC1FF60FEC1FF40FEC1FF41FF41FF41FF41FF01FF81FE03FF80F803FFC03FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 247
    Width = 928
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clBtnFace
    ParentColor = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 928
    Height = 39
    Align = alTop
    Caption = ' '#1060#1080#1083#1100#1090#1088' '
    TabOrder = 0
    DesignSize = (
      928
      39)
    object lbProdName: TLabel
      Left = 247
      Top = 16
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1088#1086#1076#1091#1082#1090':'
    end
    object Label3: TLabel
      Left = 9
      Top = 18
      Width = 35
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089
    end
    object Label4: TLabel
      Left = 139
      Top = 18
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object lc_Prod: TRxDBLookupCombo
      Left = 296
      Top = 13
      Width = 391
      Height = 21
      DropDownCount = 8
      DisplayEmpty = '< '#1042#1057#1045' >'
      Anchors = [akLeft, akTop, akRight]
      LookupField = 'ID_NPR'
      LookupDisplay = 'NAME_NPR'
      LookupSource = ds_Prod
      TabOrder = 0
    end
    object Date1: TDateTimePicker
      Left = 56
      Top = 14
      Width = 80
      Height = 21
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      TabOrder = 1
      OnCloseUp = CheckDate
      OnChange = CheckDate
      OnExit = CheckDate
    end
    object Date2: TDateTimePicker
      Left = 159
      Top = 14
      Width = 79
      Height = 21
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      TabOrder = 2
      OnCloseUp = CheckDate
      OnChange = CheckDate
      OnExit = CheckDate
    end
  end
  object pageTitle: TPageControl
    Left = 0
    Top = 39
    Width = 928
    Height = 208
    ActivePage = tabTitleDetail
    Align = alTop
    TabOrder = 1
    object tabTitleDetail: TTabSheet
      Caption = #1055#1072#1089#1087#1086#1088#1090#1072
      object TBDock1: TTBDock
        Left = 0
        Top = 0
        Width = 920
        Height = 26
        object TBToolbar1: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          Images = f_main.img_Common
          TabOrder = 0
          object bRefresh: TTBItem
            Action = acMOPaspRefresh
            DisplayMode = nbdmImageAndText
          end
          object TBItem3: TTBItem
            Action = acMOPaspAdd
            DisplayMode = nbdmImageAndText
          end
          object TBItem2: TTBItem
            Action = acMOPaspEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem4: TTBItem
            Action = acMOPaspCopy
            DisplayMode = nbdmImageAndText
          end
          object TBItem6: TTBItem
            Action = acMOPaspFind
            DisplayMode = nbdmImageAndText
          end
          object TBItem1: TTBItem
            Action = acMOPaspDel
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object GridTitle: TDBGridEh
        Left = 0
        Top = 26
        Width = 920
        Height = 154
        Align = alClient
        DataSource = ds_title
        EvenRowColor = clInfoBk
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
        FrozenCols = 2
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind]
        ParentFont = False
        PopupMenu = PopupTitle
        RowSizingAllowed = True
        SumList.Active = True
        TabOrder = 1
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
            FieldName = 'PASP_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1087#1072#1089#1087#1086#1088#1090#1072
            Title.TitleButton = True
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'DATE_VIR'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
            Title.TitleButton = True
            Width = 88
          end
          item
            EditButtons = <>
            FieldName = 'PASP_NUM'
            Footers = <>
            Title.Caption = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
            Title.TitleButton = True
            Width = 62
          end
          item
            EditButtons = <>
            FieldName = 'REZ_NUM'
            Footers = <>
            Title.Caption = #8470' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072
            Title.TitleButton = True
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'ABBR_NPR'
            Footers = <>
            Title.Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
            Title.TitleButton = True
            Width = 178
          end
          item
            EditButtons = <>
            FieldName = 'INSPEKTOR'
            Footers = <>
            Title.Caption = #1048#1085#1089#1087#1077#1082#1090#1086#1088
            Title.TitleButton = True
            Width = 107
          end
          item
            EditButtons = <>
            FieldName = 'PRIM'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'PL15'
            Footers = <>
            Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080' 15'#39#1057', '#1075'/'#1089#1084'3'
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'PL20'
            Footers = <>
            Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080' 20'#39#1057', '#1075'/'#1089#1084'3'
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'SHORT_NAME'
            Footers = <>
            Title.Caption = #1055#1077#1088#1077#1088#1072#1073#1086#1090#1095#1080#1082
            Title.TitleButton = True
            Width = 200
          end
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            Title.TitleButton = True
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'PROD_ID_NPR'
            Footers = <>
            Title.TitleButton = True
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'IS_PASP_UNP'
            Footers = <>
            Width = 86
          end>
      end
    end
  end
  object pageRows: TPageControl
    Left = 0
    Top = 252
    Width = 928
    Height = 361
    ActivePage = tabRowsDetail
    Align = alClient
    TabOrder = 2
    object tabRowsDetail: TTabSheet
      Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1080' '#1087#1072#1089#1087#1086#1088#1090#1072
      object GridRows: TDBGridEh
        Left = 0
        Top = 26
        Width = 920
        Height = 307
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = ds_rows
        EvenRowColor = clInfoBk
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
        OnKeyDown = GridRowsKeyDown
        OnSortMarkingChanged = GridRowsSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DISPLAY_NAME'
            Footers = <>
            Title.Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1082#1072#1095#1077#1089#1090#1074#1072
            Title.TitleButton = True
            Width = 385
          end
          item
            EditButtons = <>
            FieldName = 'NORMTU'
            Footers = <>
            Title.Caption = #1053#1086#1088#1084#1072' '#1087#1086' '#1058#1059
            Width = 131
          end
          item
            EditButtons = <>
            FieldName = 'QUAL'
            Footers = <>
            Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
            Title.TitleButton = True
            Width = 91
          end
          item
            EditButtons = <>
            FieldName = 'KODIF_ID'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PASP_ID'
            Footers = <>
          end>
      end
      object TBDock5: TTBDock
        Left = 0
        Top = 0
        Width = 920
        Height = 26
        object TBToolbar5: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar2'
          DockPos = -16
          Images = f_main.img_Common
          TabOrder = 0
          object btRefreshRows: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            ImageIndex = 11
            Images = f_main.img_Common
            OnClick = btRefreshRowsClick
          end
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
    Left = 72
    Top = 160
    StyleName = 'XP Style'
    object acToXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      ImageIndex = 42
      OnExecute = acToXLSExecute
    end
    object acRowsCancel: TAction
      Category = 'FOR_ALL'
      Caption = 'ESC-'#1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 14
      OnExecute = acRowsCancelExecute
    end
    object acRowsPost: TAction
      Category = 'FOR_ALL'
      Caption = 'F10-'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      ShortCut = 121
      OnExecute = acRowsPostExecute
    end
    object acMOPaspAdd: TAction
      Category = 'TITLE'
      Caption = #1053#1086#1074#1099#1081' '#1087#1072#1089#1087#1086#1088#1090
      ImageIndex = 0
      OnExecute = acMOPaspAddExecute
    end
    object acMOPaspEdit: TAction
      Category = 'TITLE'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      OnExecute = acMOPaspEditExecute
    end
    object acMOPaspCopy: TAction
      Category = 'TITLE'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      OnExecute = acMOPaspCopyExecute
    end
    object acMOPaspDel: TAction
      Category = 'TITLE'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acMOPaspDelExecute
    end
    object acPrint: TAction
      Category = 'FOR_ALL'
      Caption = 'CTRL+F6-'#1055#1077#1095#1072#1090#1100
      ImageIndex = 6
      ShortCut = 16501
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
    end
    object acMOPaspFind: TAction
      Category = 'FOR_ALL'
      Caption = 'F5-'#1055#1086#1080#1089#1082
      ImageIndex = 3
      ShortCut = 116
      OnExecute = acMOPaspFindExecute
    end
    object acMOPaspRefresh: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acMOPaspRefreshExecute
    end
    object acMOPaspView: TAction
      Category = 'TITLE'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 1
      OnExecute = acMOPaspViewExecute
    end
  end
  object PopupTitle: TTBPopupMenu
    Images = f_main.img_Common
    Left = 555
    Top = 181
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
    end
    object tbTitleFilterSelection: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      ImageIndex = 3
    end
    object tbTitleFilterClear: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 16
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object tbTitleWinEdit: TTBItem
      Caption = #1042' '#1086#1082#1085#1077
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = acMOPaspAdd
      DisplayMode = nbdmImageAndText
    end
    object TBItem11: TTBItem
      Action = acMOPaspEdit
      DisplayMode = nbdmImageAndText
    end
    object TBItem12: TTBItem
      Action = acMOPaspCopy
      DisplayMode = nbdmImageAndText
    end
    object TBItem13: TTBItem
      Action = acMOPaspDel
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
    object TBSeparatorItem9: TTBSeparatorItem
    end
    object TBItem7: TTBItem
      Caption = #1058#1077#1082#1089#1090' '#1079#1072#1087#1088#1086#1089#1072
      OnClick = TBItem7Click
    end
  end
  object PopupRows: TTBPopupMenu
    Images = f_main.img_Common
    Left = 612
    Top = 407
    object tbRowsFilterTitle: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object tbRowsFilterEdit: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object tbRowsFilterSelection: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      ImageIndex = 3
    end
    object tbRowsFilterClear: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 16
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
    object tbRowsWinEdit: TTBItem
      Caption = #1042' '#1086#1082#1085#1077
    end
    object TBSeparatorItem6: TTBSeparatorItem
    end
    object TBItem24: TTBItem
      Caption = 'F2-'#1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1082#1072#1079#1072#1090#1077#1083#1080
      DisplayMode = nbdmImageAndText
      ImageIndex = 0
      ShortCut = 113
      OnClick = acMOSvedRowsAddExecute
    end
    object TBItem25: TTBItem
      Caption = 'F4-'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      DisplayMode = nbdmImageAndText
      ImageIndex = 8
      ShortCut = 115
      OnClick = acMOSvedRowsEditExecute
    end
    object TBItem26: TTBItem
      Caption = 'F6-'#1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      DisplayMode = nbdmImageAndText
      ImageIndex = 4
      ShortCut = 117
      OnClick = acMOPokCopyExecute
    end
    object TBItem19: TTBItem
      Action = acRowsPost
    end
    object TBItem27: TTBItem
      Caption = 'F8-'#1059#1076#1072#1083#1080#1090#1100
      DisplayMode = nbdmImageAndText
      ImageIndex = 5
      ShortCut = 119
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
    object TBSeparatorItem10: TTBSeparatorItem
    end
    object TBItem5: TTBItem
      Caption = #1058#1077#1082#1089#1090' '#1079#1072#1087#1088#1086#1089#1072
      OnClick = TBItem5Click
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    Connected = True
    Left = 153
    Top = 160
  end
  object q_title: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */'
      '  V_PASP.*, KLS_PREDPR.SHORT_NAME, KLS_PROD.ABBR_NPR,'
      '  FOR_PASP.GET_PASP_VALUE_AS_NUM(V_PASP.ID,1,NULL) AS PL20,'
      '  FOR_PASP.GET_PASP_VALUE_AS_NUM(V_PASP.ID,602,NULL) AS PL15'
      'from V_PASP, KLS_PREDPR, KLS_PROD'
      'where V_PASP.perer_id=KLS_PREDPR.id(+)'
      '      and V_PASP.PROD_ID_NPR=KLS_PROD.ID_NPR(+)'
      '      and (('
      '      1=1'
      '      and 1=1'
      '      and 1=1'
      '      )'
      '       OR (V_PASP.ID=:TITLE_ID))'
      'ORDER BY pasp_date DESC, abbr_npr')
    Variables.Data = {
      0300000001000000090000003A5449544C455F49440500000002000000300000
      000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000F0000000200000049440100000000080000004D4553544F5F494401
      0000000008000000504153505F4E554D01000000000700000052455A5F4E554D
      010000000009000000504153505F44415445010000000009000000494E535045
      4B544F5201000000000B00000050524F445F49445F4E50520100000000080000
      00444154455F56495201000000000800000050455245525F494401000000000A
      00000053484F52545F4E414D45010000000008000000414242525F4E50520100
      00000004000000504C3230010000000004000000504C31350100000000040000
      005052494D01000000000B00000049535F504153505F554E500100000000}
    ReadOnly = True
    Session = ora_Session
    BeforeOpen = q_titleBeforeOpen
    AfterOpen = q_titleAfterOpen
    AfterScroll = q_titleAfterScroll
    OnFilterRecord = q_titleFilterRecord
    Left = 240
    Top = 145
    object q_titleID: TStringField
      FieldName = 'ID'
      Size = 40
    end
    object q_titlePASP_NUM: TStringField
      FieldName = 'PASP_NUM'
      Size = 15
    end
    object q_titleREZ_NUM: TStringField
      FieldName = 'REZ_NUM'
      Size = 40
    end
    object q_titlePASP_DATE: TDateTimeField
      FieldName = 'PASP_DATE'
    end
    object q_titleINSPEKTOR: TStringField
      FieldName = 'INSPEKTOR'
      Size = 30
    end
    object q_titlePROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 5
    end
    object q_titleDATE_VIR: TDateTimeField
      FieldName = 'DATE_VIR'
    end
    object q_titlePERER_ID: TFloatField
      FieldName = 'PERER_ID'
    end
    object q_titleMESTO_ID: TFloatField
      FieldName = 'MESTO_ID'
    end
    object q_titlePRIM: TStringField
      FieldName = 'PRIM'
      Size = 19
    end
    object q_titleIS_PASP_UNP: TFloatField
      FieldName = 'IS_PASP_UNP'
    end
    object q_titleSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object q_titleABBR_NPR: TStringField
      FieldName = 'ABBR_NPR'
    end
    object q_titlePL20: TFloatField
      FieldName = 'PL20'
    end
    object q_titlePL15: TFloatField
      FieldName = 'PL15'
    end
  end
  object ds_title: TDataSource
    DataSet = q_title
    Left = 248
    Top = 192
  end
  object q_rows: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM'
      'V_VALPASP'
      'WHERE PASP_ID=:PASP_ID'
      'ORDER BY SORTBY')
    Variables.Data = {
      0300000001000000080000003A504153505F4944050000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000E00000007000000504153505F49440100000000080000004B4F4449
      465F49440100000000040000005155414C0100000000040000004E414D450100
      000000060000004E4F524D545501000000000A0000004E4F524D54555F4E554D
      0100000000080000005155414C5F4E554D0100000000030000004E5050010000
      000006000000534F5254425901000000000C000000444953504C41595F4E414D
      4501000000000A0000004649454C445F5356454401000000000A000000464945
      4C445F545950450100000000090000004649454C445F4C454E01000000000900
      00004649454C445F4445430100000000}
    AutoCalcFields = False
    ReadOnly = True
    Session = ora_Session
    AfterInsert = q_rowsAfterInsert
    AfterPost = q_rowsAfterPost
    AfterDelete = q_rowsAfterDelete
    BeforeScroll = q_rowsBeforeScroll
    AfterScroll = q_rowsAfterScroll
    OnFilterRecord = q_rowsFilterRecord
    Left = 24
    Top = 376
  end
  object ds_rows: TDataSource
    DataSet = q_rows
    Left = 24
    Top = 424
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'pageTitle.<P>.Height'
      'pageTitle.tabTitleDetail.GridTitle.<P>.Columns.ColumnsIndex'
      
        'pageTitle.tabTitleDetail.GridTitle.<P>.Columns.<ForAllItems>.Wid' +
        'th')
    Left = 624
    Top = 181
  end
  object ds_Prod: TDataSource
    DataSet = q_Prod
    Left = 291
    Top = 192
  end
  object q_Prod: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */'
      '  kls_prod.ID_NPR,'
      '  kls_prod.SF_NAME as NAME_NPR'
      'from kls_prod'
      'WHERE id_npr>='#39'10100'#39
      'ORDER BY ID_NPR')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E50520100000000080000004E414D455F
      4E50520100000000}
    Session = ora_Session
    Left = 291
    Top = 145
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
  object pkgFor_environment: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_ENVIRONMENT'
    Left = 184
    Top = 470
  end
  object pkgFor_init: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_INIT'
    Left = 274
    Top = 470
  end
  object q_kodif: TOracleDataSet
    SQL.Strings = (
      '/*+RULE*/'
      'select * '
      'from kls_kodif'
      'order by NAME')
    QBEDefinition.QBEFieldDefs = {
      03000000060000000200000049440100000000040000004E414D450100000000
      0A0000004649454C445F545950450100000000090000004649454C445F4C454E
      0100000000090000004649454C445F44454301000000000A0000004649454C44
      5F535645440100000000}
    Session = ora_Session
    Left = 348
    Top = 149
  end
  object q_perer: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      'FROM kls_predpr p,predpr_role r'
      'where p.ID=r.PREDPR_ID(+) '
      'AND r.kls_role_ID=2')
    QBEDefinition.QBEFieldDefs = {
      030000002700000002000000494401000000000B0000005052454450525F4E41
      4D4501000000000A00000053484F52545F4E414D45010000000003000000494E
      4E01000000000B000000504F5354494E4445585F4A01000000000B000000504F
      5354494E4445585F50010000000006000000434954595F500100000000060000
      00434954595F4A010000000009000000414444524553535F5001000000000900
      0000414444524553535F4A0100000000050000004F4B4F4E4801000000000400
      00004F4B504F010000000005000000454D41494C010000000003000000464158
      01000000000500000050484F4E4501000000000900000042414E4B5F4B4F5253
      010000000009000000524547494F4E5F494401000000000A000000484F4C4449
      4E475F494401000000000A000000504552545950455F49440100000000090000
      0054414C4741525F494401000000000600000047445F4B4F4401000000000200
      0000525301000000000800000042414E4B535F49440100000000090000005354
      415445535F4944010000000008000000434C4153535F49440100000000070000
      0045585F5356494401000000000800000049535F424C4F434B01000000000500
      00004F4B5645440100000000030000005441470100000000040000004F47524E
      01000000000E0000004B5353535F5052454450525F4944010000000006000000
      554E505F49440100000000030000004B505001000000000B000000524547494F
      4E5F505F494401000000000700000053465F4E414D4501000000000900000050
      52454450525F494401000000000B0000004B4C535F524F4C455F494401000000
      0007000000464F585F4B4F4401000000000A0000004B4F445F4D4F53434F5701
      00000000}
    Session = ora_Session
    Left = 444
    Top = 149
  end
  object ds_perer: TDataSource
    DataSet = q_perer
    Left = 444
    Top = 197
  end
  object pkgFor_pasp: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_PASP'
    Left = 89
    Top = 470
  end
end
