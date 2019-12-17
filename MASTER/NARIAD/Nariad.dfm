object F_Nariad: TF_Nariad
  Left = 182
  Top = 112
  Width = 800
  Height = 600
  Caption = #1053#1072#1088#1103#1076#1099
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
  object grid_Nariad: TDBGridEh
    Left = 0
    Top = 113
    Width = 792
    Height = 441
    Align = alClient
    AllowedOperations = []
    DataSource = ds_Nariad
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
    OnDblClick = grid_NariadDblClick
    OnSortMarkingChanged = grid_NariadSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DATE_NAR'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.Value = #1048#1090#1086#1075#1086':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1088#1103#1076#1072
        Title.TitleButton = True
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'NUM_NAR'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #8470' '#1085#1072#1088#1103#1076#1072
        Title.TitleButton = True
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'DATE_END'
        Footers = <>
        Title.Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1076#1086
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'DATE_DOVER'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1076#1086#1074#1077#1088'.'
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'NUM_DOVER'
        Footers = <>
        Title.Caption = #8470' '#1076#1086#1074#1077#1088'.'
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PREDPR_NAME'
        Footers = <>
        Title.Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 291
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
        Width = 80
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 792
    Height = 87
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object cb_Pokup: TCheckBox
      Left = 8
      Top = 40
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
      Left = 120
      Top = 38
      Width = 529
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
    object cb_Dover: TCheckBox
      Left = 8
      Top = 64
      Width = 105
      Height = 17
      Hint = #1058#1086#1083#1100#1082#1086' '#1087#1086' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
      Caption = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100':'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = cb_DoverClick
    end
    object lcbox_Dover: TDBLookupComboBox
      Left = 120
      Top = 62
      Width = 529
      Height = 21
      Hint = #1057#1087#1080#1089#1086#1082' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1077#1081
      DropDownRows = 15
      Enabled = False
      KeyField = 'ID'
      ListField = 'NUM_DOVER; DATE_DOVER'
      ListSource = ds_ListDoverInNariad
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = lcbox_DoverCloseUp
      OnCloseUp = lcbox_DoverCloseUp
    end
    object OracleNavigator1: TOracleNavigator
      Left = 659
      Top = 61
      Width = 100
      Height = 23
      Hint = #1055#1077#1088#1077#1073#1086#1088' '#1085#1072#1088#1103#1076#1086#1074
      DataSource = ds_Nariad
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        #1055#1077#1088#1074#1099#1081
        #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081
        #1057#1083#1077#1076#1091#1102#1097#1080#1081
        #1055#1086#1089#1083#1077#1076#1085#1080#1081)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object rg_Mesto: TRadioGroup
      Left = 120
      Top = 0
      Width = 529
      Height = 33
      Columns = 5
      Ctl3D = True
      ItemIndex = 2
      Items.Strings = (
        #1062#1077#1085#1090#1088'-'#1086#1092#1080#1089
        #1069#1057#1058#1040#1050#1040#1044#1040
        #1040#1074#1090#1086#1085#1072#1083#1080#1074
        #1041#1080#1090#1091#1084#1085#1072#1103)
      ParentCtl3D = False
      TabOrder = 5
      OnClick = rg_MestoClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 554
    Width = 792
    Height = 19
    Panels = <>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 792
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      FullSize = True
      Images = f_main.img_Common
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tb_NewNar: TTBItem
        Action = ac_NewNar
        DisplayMode = nbdmImageAndText
        Images = f_main.img_Common
      end
      object tb_ChangeNar: TTBItem
        Action = ac_ChangeNar
        DisplayMode = nbdmImageAndText
        Images = f_main.img_Common
      end
      object tb_DelNar: TTBItem
        Action = ac_DelNar
        DisplayMode = nbdmImageAndText
        Images = f_main.img_Common
      end
      object tb_SeekNar: TTBItem
        Action = ac_SeekNar
        DisplayMode = nbdmImageAndText
        Images = f_main.img_Common
      end
      object tb_ChoosePeriod: TTBItem
        Action = ac_ChoosePeriodNar
        DisplayMode = nbdmImageAndText
        Images = f_main.img_Common
      end
      object tb_Refresh: TTBItem
        Action = ac_RefreshNar
        DisplayMode = nbdmImageAndText
        Images = f_main.img_Common
      end
      object N7: TTBSeparatorItem
        Blank = True
      end
      object tb_NarToDbf: TTBItem
        Action = ac_NarToDbf
        DisplayMode = nbdmImageAndText
        Images = f_main.img_Common
      end
      object TBSeparatorItem1: TTBSeparatorItem
        Blank = True
      end
      object tb_Close: TTBItem
        Caption = #1042#1099#1093#1086#1076
        Hint = #1042#1099#1093#1086#1076
        ImageIndex = 12
        Images = f_main.img_Common
        OnClick = tb_CloseClick
      end
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Left = 44
    Top = 280
  end
  object q_Nariad: TOracleDataSet
    SQL.Strings = (
      'SELECT KLS_NARIAD.ROWID,KLS_NARIAD.*,'
      
        '       KLS_DOVER.DATE_DOVER, KLS_DOVER.NUM_DOVER, KLS_DOVER.PRED' +
        'PR_ID,'
      
        '       KLS_PREDPR.SHORT_NAME AS PREDPR_NAME, V_NAR_SUM.VES AS VE' +
        'S'
      'FROM KLS_NARIAD, KLS_DOVER, KLS_PREDPR, V_NAR_SUM'
      'WHERE KLS_DOVER.PREDPR_ID = KLS_PREDPR.ID(+)'
      '  AND KLS_NARIAD.DOVER_ID = KLS_DOVER.ID(+)'
      '  AND KLS_NARIAD.ID = V_NAR_SUM.NARIAD_ID(+)'
      
        '  AND ((KLS_NARIAD.DATE_NAR BETWEEN TO_DATE('#39'01.01.2001'#39','#39'dd.mm.' +
        'yyyy'#39') AND TO_DATE('#39'31.12.2001'#39','#39'dd.mm.yyyy'#39')) OR'
      
        '       (KLS_NARIAD.DATE_END BETWEEN TO_DATE('#39'01.01.2001'#39','#39'dd.mm.' +
        'yyyy'#39') AND TO_DATE('#39'31.12.2001'#39','#39'dd.mm.yyyy'#39')) OR'
      
        '       (TO_DATE('#39'01.01.2001'#39','#39'dd.mm.yyyy'#39') BETWEEN KLS_NARIAD.DA' +
        'TE_NAR AND KLS_NARIAD.DATE_END) OR'
      
        '       (TO_DATE('#39'31.12.2001'#39','#39'dd.mm.yyyy'#39') BETWEEN KLS_NARIAD.DA' +
        'TE_NAR AND KLS_NARIAD.DATE_END))'
      '  AND KLS_DOVER.PREDPR_ID = KLS_DOVER.PREDPR_ID'
      '  AND KLS_NARIAD.DOVER_ID = KLS_NARIAD.DOVER_ID'
      '  AND KLS_NARIAD.MESTO_ID = KLS_NARIAD.MESTO_ID'
      
        'ORDER BY KLS_NARIAD.DATE_NAR DESC, KLS_NARIAD.NUM_NAR DESC, KLS_' +
        'NARIAD.DOVER_ID DESC'
      ''
      ''
      ''
      ''
      ''
      '')
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_NARIAD'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000B0000000200000049440100000000090000004E554D5F444F564552
      01000000000A000000444154455F444F56455201000000000800000044415445
      5F454E440100000000090000005052454450525F494401000000000B00000050
      52454450525F4E414D450100000000030000005645530100000000070000004E
      554D5F4E4152010000000008000000444154455F4E4152010000000008000000
      444F5645525F49440100000000080000004D4553544F5F49440100000000}
    UniqueFields = 'ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'KLS_NARIAD'
    CommitOnPost = False
    CachedUpdates = True
    Session = ora_Session
    Left = 40
    Top = 208
    object q_NariadID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_NariadNUM_NAR: TStringField
      FieldName = 'NUM_NAR'
      Required = True
      Size = 15
    end
    object q_NariadDATE_NAR: TDateTimeField
      FieldName = 'DATE_NAR'
      Required = True
    end
    object q_NariadDATE_END: TDateTimeField
      FieldName = 'DATE_END'
      Required = True
    end
    object q_NariadDOVER_ID: TFloatField
      FieldName = 'DOVER_ID'
      Required = True
    end
    object q_NariadDATE_DOVER: TDateTimeField
      FieldName = 'DATE_DOVER'
    end
    object q_NariadNUM_DOVER: TStringField
      FieldName = 'NUM_DOVER'
      Size = 15
    end
    object q_NariadPREDPR_ID: TIntegerField
      FieldName = 'PREDPR_ID'
    end
    object q_NariadPREDPR_NAME: TStringField
      FieldName = 'PREDPR_NAME'
      Size = 30
    end
    object q_NariadVES: TFloatField
      FieldName = 'VES'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object q_NariadMESTO_ID: TIntegerField
      FieldName = 'MESTO_ID'
      Required = True
    end
  end
  object ds_Nariad: TDataSource
    DataSet = q_Nariad
    Left = 108
    Top = 208
  end
  object q_ListDover: TOracleDataSet
    SQL.Strings = (
      'SELECT KLS_DOVER.*, KLS_PREDPR.SHORT_NAME '
      'FROM KLS_DOVER, KLS_PREDPR'
      'WHERE KLS_DOVER.PREDPR_ID=KLS_PREDPR.ID'
      'ORDER BY KLS_DOVER.ID DESC'
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000800000002000000494401000000000A00000053484F52545F4E414D
      450100000000090000004E554D5F444F56455201000000000A00000044415445
      5F444F564552010000000008000000444154455F454E44010000000009000000
      46494F5F444F56455201000000000A000000444F4C4A5F444F56455201000000
      00090000005052454450525F49440100000000}
    Session = ora_Session
    Left = 120
    Top = 280
  end
  object ds_ListDover: TDataSource
    DataSet = q_ListDover
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
  object q_ListDoverInNariad: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_LIST_DOVER_IN_NARIAD'
      'WHERE'
      
        ' ((DATE_DOVER BETWEEN TO_DATE('#39'01.01.2001'#39','#39'dd.mm.yyyy'#39') AND TO_' +
        'DATE('#39'31.12.2001'#39','#39'dd.mm.yyyy'#39')) OR'
      
        '  (DATE_END BETWEEN TO_DATE('#39'01.01.2001'#39','#39'dd.mm.yyyy'#39') AND TO_DA' +
        'TE('#39'31.12.2001'#39','#39'dd.mm.yyyy'#39')) OR'
      
        '  (TO_DATE('#39'01.01.2001'#39','#39'dd.mm.yyyy'#39') BETWEEN DATE_DOVER AND DAT' +
        'E_END) OR'
      
        '  (TO_DATE('#39'31.12.2001'#39','#39'dd.mm.yyyy'#39') BETWEEN DATE_DOVER AND DAT' +
        'E_END))'
      ' AND 1=1'
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000900000002000000494401000000000A000000444154455F444F5645
      520100000000090000004E554D5F444F56455201000000000900000050524544
      50525F494401000000000B0000005052454450525F4E414D4501000000000800
      0000444154455F454E4401000000000900000046494F5F444F56455201000000
      000A000000444F4C4A5F444F56455201000000000A00000053484F52545F4E41
      4D450100000000}
    Session = ora_Session
    Left = 256
    Top = 336
  end
  object ds_ListDoverInNariad: TDataSource
    DataSet = q_ListDoverInNariad
    Left = 248
    Top = 392
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 392
    Top = 216
    StyleName = 'XP Style'
    object ac_NewNar: TAction
      Category = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      Caption = #1053#1086#1074#1099#1081' '#1085#1072#1088#1103#1076
      Hint = #1053#1086#1074#1099#1081' '#1085#1072#1088#1103#1076
      ImageIndex = 0
      ShortCut = 45
      OnExecute = ac_NewNarExecute
    end
    object ac_ChangeNar: TAction
      Category = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1088#1103#1076
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1088#1103#1076
      ImageIndex = 8
      ShortCut = 115
      OnExecute = ac_ChangeNarExecute
    end
    object ac_DelNar: TAction
      Category = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1088#1103#1076
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1088#1103#1076
      ImageIndex = 5
      ShortCut = 46
      OnExecute = ac_DelNarExecute
    end
    object ac_SeekNar: TAction
      Category = #1055#1086#1080#1089#1082
      Caption = #1055#1086#1080#1089#1082
      Hint = #1055#1086#1080#1089#1082
      ImageIndex = 9
      ShortCut = 118
      OnExecute = ac_SeekNarExecute
    end
    object ac_ChoosePeriodNar: TAction
      Category = #1057#1077#1088#1074#1080#1089
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      ImageIndex = 10
      OnExecute = ac_ChoosePeriodNarExecute
    end
    object ac_RefreshNar: TAction
      Category = #1057#1077#1088#1074#1080#1089
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = ac_RefreshNarExecute
    end
    object ac_NarToDbf: TAction
      Category = #1057#1077#1088#1074#1080#1089
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1085#1072#1088#1103#1076#1099' '#1074' DBF'
      Hint = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1085#1072#1088#1103#1076#1099' '#1074' DBF'
      ImageIndex = 13
      OnExecute = ac_NarToDbfExecute
    end
  end
end
