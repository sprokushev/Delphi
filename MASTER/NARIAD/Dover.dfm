object F_Dover: TF_Dover
  Left = 200
  Top = 154
  Width = 861
  Height = 600
  Caption = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grid_Dovers: TDBGridEh
    Left = 0
    Top = 57
    Width = 853
    Height = 497
    Align = alClient
    AllowedOperations = []
    DataSource = ds_Dovers
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    ReadOnly = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = grid_DoversDblClick
    OnSortMarkingChanged = grid_DoversSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DATE_DOVER'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.Value = #1048#1090#1086#1075#1086':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1076#1086#1074#1077#1088'.'
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'NUM_DOVER'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #8470' '
        Title.TitleButton = True
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'DATE_END'
        Footers = <>
        Title.Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1076#1086
        Title.TitleButton = True
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'FIO_DOVER'
        Footers = <>
        Title.Caption = #1060#1048#1054
        Title.TitleButton = True
        Width = 223
      end
      item
        EditButtons = <>
        FieldName = 'DOLJ_DOVER'
        Footers = <>
        Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        Title.TitleButton = True
        Width = 142
      end
      item
        EditButtons = <>
        FieldName = 'PREDPR_NAME'
        Footers = <>
        Title.Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 179
      end
      item
        EditButtons = <>
        FieldName = 'VES'
        Footer.FieldName = 'VES'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1042#1077#1089
        Title.TitleButton = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 853
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object cb_Pokup: TCheckBox
      Left = 8
      Top = 8
      Width = 89
      Height = 17
      Hint = #1058#1086#1083#1100#1082#1086' '#1087#1086' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1102
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = cb_PokupClick
    end
    object lcbox_Pokup: TDBLookupComboBox
      Left = 104
      Top = 6
      Width = 553
      Height = 21
      Hint = #1057#1087#1080#1089#1086#1082' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1077#1081
      DropDownRows = 15
      Enabled = False
      KeyField = 'ID'
      ListField = 'SHORT_NAME'
      ListSource = ds_ListPokupInDover
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = lcbox_PokupCloseUp
      OnCloseUp = lcbox_PokupCloseUp
    end
    object OracleNavigator1: TOracleNavigator
      Left = 663
      Top = 5
      Width = 100
      Height = 23
      Hint = #1055#1077#1088#1077#1073#1086#1088' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1077#1081
      DataSource = ds_Dovers
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        #1055#1077#1088#1074#1072#1103
        #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103
        #1057#1083#1077#1076#1091#1102#1097#1072#1103
        #1055#1086#1089#1083#1077#1076#1085#1103#1103)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 554
    Width = 853
    Height = 19
    Panels = <>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 853
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DockPos = -32
      FullSize = True
      Images = f_main.img_Common
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TBItem1: TTBItem
        Action = ac_NewDov
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = ac_ChangeDov
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = ac_DelDov
        DisplayMode = nbdmImageAndText
      end
      object TBItem4: TTBItem
        Action = ac_SeekDov
        DisplayMode = nbdmImageAndText
      end
      object TBItem5: TTBItem
        Action = ac_ChoosePeriodDov
        DisplayMode = nbdmImageAndText
      end
      object TBItem6: TTBItem
        Action = ac_RefreshDov
        DisplayMode = nbdmImageAndText
      end
      object TBSeparatorItem2: TTBSeparatorItem
        Blank = True
      end
      object TBSeparatorItem1: TTBSeparatorItem
        Blank = True
      end
      object TBItem7: TTBItem
        Caption = #1042#1099#1093#1086#1076
        Hint = #1042#1099#1093#1086#1076
        ImageIndex = 12
        OnClick = TBItem7Click
      end
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'master'
    LogonDatabase = 'DESIGN'
    Left = 44
    Top = 280
  end
  object q_Dovers: TOracleDataSet
    SQL.Strings = (
      
        'SELECT KLS_DOVER.ROWID, KLS_DOVER.*, KLS_PREDPR.SHORT_NAME AS PR' +
        'EDPR_NAME, V_DOV_SUM.VES AS VES'
      'FROM KLS_DOVER, KLS_PREDPR, V_DOV_SUM'
      'WHERE KLS_DOVER.PREDPR_ID = KLS_PREDPR.ID(+)'
      
        '  AND ((KLS_DOVER.DATE_DOVER BETWEEN TO_DATE('#39'01.01.2001'#39','#39'dd.mm' +
        '.yyyy'#39') AND TO_DATE('#39'31.12.2001'#39','#39'dd.mm.yyyy'#39')) OR'
      
        '      (KLS_DOVER.DATE_END BETWEEN TO_DATE('#39'01.01.2001'#39','#39'dd.mm.yy' +
        'yy'#39') AND TO_DATE('#39'31.12.2001'#39','#39'dd.mm.yyyy'#39')) OR'
      
        '      (TO_DATE('#39'01.01.2001'#39','#39'dd.mm.yyyy'#39') BETWEEN KLS_DOVER.DATE' +
        '_DOVER AND KLS_DOVER.DATE_END) OR'
      
        '      (TO_DATE('#39'31.12.2001'#39','#39'dd.mm.yyyy'#39') BETWEEN KLS_DOVER.DATE' +
        '_DOVER AND KLS_DOVER.DATE_END))'
      '  AND KLS_DOVER.PREDPR_ID = KLS_DOVER.PREDPR_ID'
      '  AND KLS_DOVER.ID = V_DOV_SUM.DOVER_ID(+)'
      'ORDER BY KLS_DOVER.DATE_DOVER DESC, KLS_DOVER.NUM_DOVER DESC'
      ''
      ''
      ''
      ''
      ''
      '')
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_DOVER'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      03000000090000000200000049440100000000090000004E554D5F444F564552
      01000000000A000000444154455F444F56455201000000000800000044415445
      5F454E4401000000000900000046494F5F444F56455201000000000A00000044
      4F4C4A5F444F5645520100000000090000005052454450525F49440100000000
      0B0000005052454450525F4E414D450100000000030000005645530100000000}
    UniqueFields = 'ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'KLS_DOVER'
    CommitOnPost = False
    CachedUpdates = True
    Session = ora_Session
    Left = 40
    Top = 208
    object q_DoversID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_DoversNUM_DOVER: TStringField
      FieldName = 'NUM_DOVER'
      Required = True
      Size = 15
    end
    object q_DoversDATE_DOVER: TDateTimeField
      FieldName = 'DATE_DOVER'
      Required = True
    end
    object q_DoversDATE_END: TDateTimeField
      FieldName = 'DATE_END'
      Required = True
    end
    object q_DoversFIO_DOVER: TStringField
      FieldName = 'FIO_DOVER'
      Size = 50
    end
    object q_DoversDOLJ_DOVER: TStringField
      FieldName = 'DOLJ_DOVER'
      Size = 30
    end
    object q_DoversPREDPR_ID: TIntegerField
      FieldName = 'PREDPR_ID'
      Required = True
    end
    object q_DoversPREDPR_NAME: TStringField
      FieldName = 'PREDPR_NAME'
      Size = 30
    end
    object q_DoversVES: TFloatField
      FieldName = 'VES'
      DisplayFormat = '0.000'
    end
  end
  object ds_Dovers: TDataSource
    DataSet = q_Dovers
    Left = 108
    Top = 208
  end
  object q_ListPokup: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_LIST_PLATEL')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A00000053484F52545F4E414D
      450100000000}
    Session = ora_Session
    Left = 120
    Top = 280
  end
  object ds_ListPokup: TDataSource
    DataSet = q_ListPokup
    Left = 184
    Top = 280
  end
  object q_ListPokupInDover: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_LIST_PLATEL_IN_DOVER')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A00000053484F52545F4E414D
      450100000000}
    Session = ora_Session
    Left = 136
    Top = 336
  end
  object ds_ListPokupInDover: TDataSource
    DataSet = q_ListPokupInDover
    Left = 144
    Top = 392
  end
  object q_Tmp: TOracleDataSet
    SQL.Strings = (
      #1063#1090#1086' '#1085#1080#1073#1091#1076#1100)
    Session = ora_Session
    Left = 192
    Top = 208
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 360
    Top = 328
    StyleName = 'XP Style'
    object ac_NewDov: TAction
      Category = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      Caption = #1053#1086#1074#1072#1103' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
      Hint = #1053#1086#1074#1072#1103' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
      ImageIndex = 0
      ShortCut = 45
      OnExecute = ac_NewDovExecute
    end
    object ac_ChangeDov: TAction
      Category = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
      ImageIndex = 8
      ShortCut = 115
      OnExecute = ac_ChangeDovExecute
    end
    object ac_DelDov: TAction
      Category = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
      ImageIndex = 5
      ShortCut = 46
      OnExecute = ac_DelDovExecute
    end
    object ac_SeekDov: TAction
      Category = #1055#1086#1080#1089#1082
      Caption = #1055#1086#1080#1089#1082
      Hint = #1055#1086#1080#1089#1082
      ImageIndex = 9
      ShortCut = 118
      OnExecute = ac_SeekDovExecute
    end
    object ac_ChoosePeriodDov: TAction
      Category = #1057#1077#1088#1074#1080#1089
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      ImageIndex = 10
      OnExecute = ac_ChoosePeriodDovExecute
    end
    object ac_RefreshDov: TAction
      Category = #1057#1077#1088#1074#1080#1089
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = ac_RefreshDovExecute
    end
  end
end
