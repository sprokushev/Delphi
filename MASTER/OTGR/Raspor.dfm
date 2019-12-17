inherited f_Raspor: Tf_Raspor
  Left = 215
  Top = 171
  Width = 865
  Height = 587
  Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1103' '#1085#1072' '#1086#1090#1075#1088#1091#1079#1082#1091
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 249
    Width = 857
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
    Width = 857
    Height = 41
    Align = alTop
    Caption = ' '#1060#1080#1083#1100#1090#1088' '
    TabOrder = 0
    object Label3: TLabel
      Left = 9
      Top = 18
      Width = 103
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103': '#1089
    end
    object Label4: TLabel
      Left = 203
      Top = 18
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object Date1: TDateTimePicker
      Left = 120
      Top = 14
      Width = 80
      Height = 21
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      TabOrder = 0
      OnChange = CheckDate
    end
    object Date2: TDateTimePicker
      Left = 223
      Top = 14
      Width = 79
      Height = 21
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      TabOrder = 1
    end
  end
  object pageTitle: TPageControl
    Left = 0
    Top = 41
    Width = 857
    Height = 208
    ActivePage = tabTitleDetail
    Align = alTop
    TabOrder = 1
    object tabTitleDetail: TTabSheet
      Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1103
      object TBDock1: TTBDock
        Left = 0
        Top = 0
        Width = 849
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
            Action = acRasporAdd
            DisplayMode = nbdmImageAndText
          end
          object TBItem2: TTBItem
            Action = acRasporEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem1: TTBItem
            Action = acRasporDel
            DisplayMode = nbdmImageAndText
          end
          object TBItem10: TTBItem
            Action = acPrint
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object GridTitle: TDBGridEh
        Left = 0
        Top = 26
        Width = 849
        Height = 154
        Align = alClient
        DataSource = ds_title
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
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind]
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
        OnGetCellParams = GridTitleGetCellParams
        OnSortMarkingChanged = GridTitleSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NUM_NAR'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'DATE_NAR'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'DATE_BEG'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'DATE_END'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            Title.TitleButton = True
          end>
      end
    end
  end
  object pageRows: TPageControl
    Left = 0
    Top = 254
    Width = 857
    Height = 306
    ActivePage = tabRowsDetail
    Align = alClient
    TabOrder = 2
    object tabRowsDetail: TTabSheet
      Caption = #1055#1086#1079#1080#1094#1080#1080' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103
      object TBDock2: TTBDock
        Left = 0
        Top = 0
        Width = 849
        Height = 26
        object TBToolbar2: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar2'
          DockPos = -16
          Images = f_main.img_Common
          TabOrder = 0
          object bRefreshRows: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            ImageIndex = 11
            Images = f_main.img_Common
            OnClick = bRefreshRowsClick
          end
          object TBItem8: TTBItem
            Action = acRasporRowsDel
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object GridRows: TDBGridEh
        Left = 0
        Top = 26
        Width = 849
        Height = 252
        Align = alClient
        AllowedOperations = [alopUpdateEh, alopAppendEh]
        DataSource = ds_rows
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
        FrozenCols = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
        ParentFont = False
        PopupMenu = PopupRows
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnExit = GridRowsExit
        OnSortMarkingChanged = GridRowsSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NOM_ZD'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'FACT_KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'FACT_VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'OST_KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'OST_VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'STAN_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 190
          end
          item
            EditButtons = <>
            FieldName = 'PROD_NAME'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'PREDPR_NAME'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            Title.TitleButton = True
          end>
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
    Left = 43
    Top = 165
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
      ImageIndex = 11
      OnExecute = acRowsCancelExecute
    end
    object acRowsPost: TAction
      Category = 'FOR_ALL'
      Caption = 'F10-'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      ShortCut = 121
      OnExecute = acRowsPostExecute
    end
    object acRasporAdd: TAction
      Category = 'TITLE'
      Caption = #1053#1086#1074#1086#1077' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1077
      ImageIndex = 0
      OnExecute = acRasporAddExecute
    end
    object acRasporEdit: TAction
      Category = 'TITLE'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      OnExecute = acRasporEditExecute
    end
    object acRasporCopy: TAction
      Category = 'TITLE'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      OnExecute = acRasporCopyExecute
    end
    object acRasporDel: TAction
      Category = 'TITLE'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acRasporDelExecute
    end
    object acRasporRowsDel: TAction
      Category = 'ROWS'
      Caption = 'F8-'#1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 119
      OnExecute = acRasporRowsDelExecute
    end
    object acPrint: TAction
      Category = 'FOR_ALL'
      Caption = 'CTRL+F6-'#1055#1077#1095#1072#1090#1100
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
  end
  object PopupTitle: TTBPopupMenu
    Images = f_main.img_Common
    Left = 267
    Top = 109
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
      Action = acRasporAdd
      DisplayMode = nbdmImageAndText
    end
    object TBItem11: TTBItem
      Action = acRasporEdit
      DisplayMode = nbdmImageAndText
    end
    object TBItem13: TTBItem
      Action = acRasporDel
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
    Left = 219
    Top = 413
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
    object TBItem27: TTBItem
      Action = acRasporRowsDel
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
    Left = 103
    Top = 137
  end
  object q_title: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  a.*'
      'FROM KLS_NARIAD a'
      'WHERE a.MESTO_ID=:MESTO_ID AND a.LOAD_TYPE_ID=:LOAD_TYPE_ID'
      '/* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' */ '
      '   AND a.DATE_NAR>=TO_DATE('#39'01.06.2005'#39','#39'dd.mm.yyyy'#39')'
      '   AND a.DATE_NAR<TO_DATE('#39'31.12.2005'#39','#39'dd.mm.yyyy'#39')+1'
      'ORDER BY date_nar DESC, TO_NUMBER(num_nar) DESC')
    Variables.Data = {
      0300000002000000090000003A4D4553544F5F49440300000004000000010000
      00000000000D0000003A4C4F41445F545950455F494403000000040000000100
      000000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      03000000090000000200000049440100000000080000004D4553544F5F494401
      000000000C0000004C4F41445F545950455F49440100000000070000004E554D
      5F4E4152010000000008000000444154455F4E41520100000000080000004441
      54455F454E44010000000008000000444F5645525F4944010000000009000000
      49535F4C4F41444544010000000008000000444154455F4245470100000000}
    UniqueFields = 'ID'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    UpdatingTable = 'KLS_NARIAD'
    Session = ora_Session
    BeforeOpen = q_titleBeforeOpen
    AfterOpen = q_titleAfterOpen
    AfterScroll = q_titleAfterScroll
    OnFilterRecord = q_titleFilterRecord
    Left = 248
    Top = 160
    object q_titleID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_titleNUM_NAR: TStringField
      DisplayLabel = 'N '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103
      FieldName = 'NUM_NAR'
      Required = True
      Size = 15
    end
    object q_titleDATE_NAR: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103
      FieldName = 'DATE_NAR'
      Required = True
    end
    object q_titleDATE_END: TDateTimeField
      DisplayLabel = #1087#1086' '#1076#1072#1090#1091
      FieldName = 'DATE_END'
      Required = True
    end
    object q_titleDOVER_ID: TFloatField
      FieldName = 'DOVER_ID'
    end
    object q_titleMESTO_ID: TIntegerField
      FieldName = 'MESTO_ID'
      Required = True
    end
    object q_titleIS_LOADED: TIntegerField
      FieldName = 'IS_LOADED'
      Required = True
    end
    object q_titleLOAD_TYPE_ID: TFloatField
      FieldName = 'LOAD_TYPE_ID'
    end
    object q_titleDATE_BEG: TDateTimeField
      DisplayLabel = #1057' '#1076#1072#1090#1099
      FieldName = 'DATE_BEG'
    end
  end
  object ds_title: TDataSource
    DataSet = q_title
    Left = 288
    Top = 160
  end
  object q_rows: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      'a.*,a.rowid,'
      'a.KOL-a.FACT_KOL as OST_KOL,'
      'a.VES-a.FACT_VES as OST_VES,'
      's.STAN_NAME, '
      'pr.PROD_NAME, '
      'pol.PREDPR_NAME'
      'FROM KLS_NAR_LINE a, '
      
        '     (SELECT NOM_ZD as NZD,STAN_ID,PROD_ID_NPR,POLUCH_ID FROM MO' +
        'NTH) m, '
      #9' (SELECT ID as STAN_ID,STAN_NAME FROM KLS_STAN) s, '
      #9' (SELECT ID_NPR,ABBR_NPR as PROD_NAME FROM KLS_PROD) pr, '
      
        #9' (SELECT ID as PREDPR_ID, SHORT_NAME as PREDPR_NAME FROM KLS_PR' +
        'EDPR) pol'
      'WHERE a.NARIAD_ID=:NARIAD_ID'
      '  AND a.NOM_ZD=m.NZD(+)'
      '  AND M.STAN_ID=s.STAN_ID(+)'
      '  AND M.PROD_ID_NPR=pr.ID_NPR(+)'
      '  AND M.POLUCH_ID=pol.PREDPR_ID(+)'
      'ORDER BY a.NOM_ZD')
    Variables.Data = {
      03000000010000000A0000003A4E41524941445F494404000000000000000000
      0000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_NARIAD'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000D000000020000004944010000000003000000564553010000000009
      0000004E41524941445F49440100000000060000004E4F4D5F5A440100000000
      0900000049535F4C4F414445440100000000030000004B4F4C01000000000800
      0000464143545F564553010000000008000000464143545F4B4F4C0100000000
      070000004F53545F4B4F4C0100000000070000004F53545F5645530100000000
      090000005354414E5F4E414D4501000000000900000050524F445F4E414D4501
      000000000B0000005052454450525F4E414D450100000000}
    UniqueFields = 'ID'
    Master = q_title
    MasterFields = 'ID'
    DetailFields = 'NARIAD_ID'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'KLS_NAR_LINE'
    Session = ora_Session
    AfterDelete = q_rowsAfterDelete
    OnFilterRecord = q_rowsFilterRecord
    Left = 24
    Top = 376
    object q_rowsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_rowsNARIAD_ID: TFloatField
      FieldName = 'NARIAD_ID'
      Required = True
    end
    object q_rowsNOM_ZD: TStringField
      DisplayLabel = 'N '#1079#1072#1076#1072#1085#1080#1103
      FieldName = 'NOM_ZD'
      Required = True
      Size = 12
    end
    object q_rowsIS_LOADED: TIntegerField
      FieldName = 'IS_LOADED'
      Required = True
    end
    object q_rowsVES: TFloatField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077', '#1090#1085
      FieldName = 'VES'
      Required = True
      DisplayFormat = '#0.000'
    end
    object q_rowsKOL: TIntegerField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077', '#1094#1089
      FieldName = 'KOL'
      Required = True
      DisplayFormat = '#0'
    end
    object q_rowsFACT_VES: TFloatField
      DisplayLabel = #1054#1090#1075#1088#1091#1078#1077#1085#1086', '#1090#1085
      FieldName = 'FACT_VES'
      Required = True
      DisplayFormat = '#0.000'
    end
    object q_rowsFACT_KOL: TIntegerField
      DisplayLabel = #1054#1090#1075#1088#1091#1078#1077#1085#1086', '#1094#1089
      FieldName = 'FACT_KOL'
      Required = True
      DisplayFormat = '#0'
    end
    object q_rowsOST_KOL: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1083#1086#1089#1100', '#1094#1089
      FieldName = 'OST_KOL'
      DisplayFormat = '#0'
    end
    object q_rowsOST_VES: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1083#1086#1089#1100', '#1090#1085
      FieldName = 'OST_VES'
      DisplayFormat = '#0.000'
    end
    object q_rowsSTAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103
      FieldName = 'STAN_NAME'
      Size = 50
    end
    object q_rowsPROD_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'PROD_NAME'
    end
    object q_rowsPREDPR_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'PREDPR_NAME'
      Size = 30
    end
  end
  object ds_rows: TDataSource
    DataSet = q_rows
    Left = 24
    Top = 424
  end
  object pkgFOR_RASPOR: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_RASPOR'
    Left = 120
    Top = 415
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'pageRows.tabRowsDetail.GridRows.<P>.Columns.ColumnsIndex'
      'pageRows.tabRowsDetail.GridRows.<P>.Columns.<ForAllItems>.Width'
      'pageTitle.<P>.Height'
      'pageTitle.tabTitleDetail.GridTitle.<P>.Columns.ColumnsIndex'
      
        'pageTitle.tabTitleDetail.GridTitle.<P>.Columns.<ForAllItems>.Wid' +
        'th')
    Left = 384
    Top = 144
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 304
    Top = 296
  end
end
