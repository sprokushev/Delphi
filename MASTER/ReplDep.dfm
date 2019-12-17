object f_ReplDep: Tf_ReplDep
  Left = 247
  Top = 117
  Width = 748
  Height = 509
  Caption = #1056#1077#1087#1083#1080#1082#1072#1094#1080#1080', '#1086#1090' '#1082#1086#1090#1086#1088#1099#1093' '#1079#1072#1074#1080#1089#1080#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gridReplDep: TDBGridEh
    Left = 0
    Top = 26
    Width = 740
    Height = 456
    Align = alClient
    AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
    DataSource = ds_ReplDep
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FrozenCols = 2
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SORTBY'
        Footers = <>
        Width = 60
      end
      item
        AlwaysShowEditButton = True
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'CHILD_NAME'
        Footers = <>
        Width = 284
        OnEditButtonClick = gridRSColumns1EditButtonClick
      end
      item
        EditButtons = <>
        FieldName = 'CHILD_TAG'
        Footers = <>
        ReadOnly = True
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'CHILD_CNT'
        Footers = <>
      end
      item
        Checkboxes = True
        DblClickNextVal = True
        EditButtons = <>
        FieldName = 'IS_ACTIVE'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        ReadOnly = True
        Width = 70
      end
      item
        Checkboxes = True
        DblClickNextVal = True
        EditButtons = <>
        FieldName = 'IS_TRACKING'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'LASTDATE'
        Footers = <>
        ReadOnly = True
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'LASTTIME'
        Footers = <>
        ReadOnly = True
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'LASTSIZE'
        Footers = <>
        ReadOnly = True
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'CHECK_MODE_NAME'
        Footers = <>
        ReadOnly = True
        Width = 294
      end>
  end
  object TBDock2: TTBDock
    Left = 0
    Top = 0
    Width = 740
    Height = 26
    object TBToolbar2: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DockPos = 0
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acReplDepAdd
        DisplayMode = nbdmImageAndText
      end
      object TBItem5: TTBItem
        Action = acReplDepDel
        DisplayMode = nbdmImageAndText
      end
      object TBItem6: TTBItem
        Action = acReplDepEdit
        DisplayMode = nbdmImageAndText
      end
      object TBItem9: TTBItem
        Action = acReplDepPost
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acReplDepRefresh
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 584
    Top = 97
    StyleName = 'XP Style'
    object acReplDepAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1102
      ImageIndex = 20
      OnExecute = acReplDepAddExecute
    end
    object acReplDepRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1081
      ImageIndex = 11
      OnExecute = acReplDepRefreshExecute
    end
    object acReplDepEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1102
      ImageIndex = 8
      OnExecute = acReplDepEditExecute
    end
    object acReplDepDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1102
      ImageIndex = 5
      OnExecute = acReplDepDelExecute
    end
    object acReplDepPost: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 13
      OnExecute = acReplDepPostExecute
    end
  end
  object q_ReplDep: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  REPL_DEPENDENCE.rowid,'
      '  REPL_DEPENDENCE.*'
      'FROM REPL_DEPENDENCE'
      'WHERE REPL_DEPENDENCE.REPL_PARENT=0'
      'ORDER BY REPL_DEPENDENCE.SORTBY')
    QBEDefinition.QBEFieldDefs = {
      030000000C000000020000004944010000000006000000534F52544259010000
      00000B0000005245504C5F504152454E5401000000000A0000005245504C5F43
      48494C4401000000000A0000004348494C445F4E414D45010000000009000000
      4348494C445F54414701000000000900000049535F4143544956450100000000
      0B00000049535F545241434B494E470100000000080000004C41535444415445
      0100000000080000004C41535454494D450100000000080000004C4153545349
      5A4501000000000F000000434845434B5F4D4F44455F4E414D450100000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    UpdatingTable = 'REPL_DEPENDENCE'
    Session = f_main.ora_Session
    BeforeOpen = q_ReplDepBeforeOpen
    AfterInsert = q_ReplDepAfterInsert
    BeforePost = q_ReplDepBeforePost
    BeforeDelete = q_ReplDepBeforeDelete
    Left = 192
    Top = 136
    object q_ReplDepID: TFloatField
      FieldName = 'ID'
    end
    object q_ReplDepSORTBY: TFloatField
      DisplayLabel = #1055#1086#1088#1103#1076#1086#1082
      FieldName = 'SORTBY'
    end
    object q_ReplDepREPL_PARENT: TFloatField
      FieldName = 'REPL_PARENT'
      Required = True
    end
    object q_ReplDepREPL_CHILD: TFloatField
      FieldName = 'REPL_CHILD'
      Required = True
    end
    object q_ReplDepCHILD_TAG: TStringField
      DisplayLabel = #1058#1045#1043
      FieldKind = fkLookup
      FieldName = 'CHILD_TAG'
      LookupDataSet = q_Repl
      LookupKeyFields = 'ID'
      LookupResultField = 'TAG'
      KeyFields = 'REPL_CHILD'
      Lookup = True
    end
    object q_ReplDepCHILD_NAME: TStringField
      DisplayLabel = #1056#1077#1087#1083#1080#1082#1072#1094#1080#1103
      FieldKind = fkLookup
      FieldName = 'CHILD_NAME'
      LookupDataSet = q_Repl
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'REPL_CHILD'
      Size = 50
      Lookup = True
    end
    object q_ReplDepIS_ACTIVE: TIntegerField
      DisplayLabel = #1040#1082#1090#1080#1074#1085#1072#1103' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1103
      FieldKind = fkLookup
      FieldName = 'IS_ACTIVE'
      LookupDataSet = q_Repl
      LookupKeyFields = 'ID'
      LookupResultField = 'IS_ACTIVE'
      KeyFields = 'REPL_CHILD'
      Lookup = True
    end
    object q_ReplDepIS_TRACKING: TIntegerField
      DisplayLabel = #1059#1095#1072#1089#1090#1074#1091#1077#1090' '#1074' '#1072#1074#1090'. '#1086#1087#1088#1086#1089#1077
      FieldKind = fkLookup
      FieldName = 'IS_TRACKING'
      LookupDataSet = q_Repl
      LookupKeyFields = 'ID'
      LookupResultField = 'IS_TRACKING'
      KeyFields = 'REPL_CHILD'
      Lookup = True
    end
    object q_ReplDepLASTDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' (DBF)'
      FieldKind = fkLookup
      FieldName = 'LASTDATE'
      LookupDataSet = q_Repl
      LookupKeyFields = 'ID'
      LookupResultField = 'LASTDATE'
      KeyFields = 'REPL_CHILD'
      Lookup = True
    end
    object q_ReplDepLASTTIME: TStringField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' (DBF)'
      FieldKind = fkLookup
      FieldName = 'LASTTIME'
      LookupDataSet = q_Repl
      LookupKeyFields = 'ID'
      LookupResultField = 'LASTTIME'
      KeyFields = 'REPL_CHILD'
      Size = 10
      Lookup = True
    end
    object q_ReplDepLASTSIZE: TFloatField
      DisplayLabel = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1088#1072#1079#1084#1077#1088' (DBF)'
      FieldKind = fkLookup
      FieldName = 'LASTSIZE'
      LookupDataSet = q_Repl
      LookupKeyFields = 'ID'
      LookupResultField = 'LASTSIZE'
      KeyFields = 'REPL_CHILD'
      Lookup = True
    end
    object q_ReplDepCHECK_MODE_NAME: TStringField
      DisplayLabel = #1056#1077#1078#1080#1084' '#1079#1072#1087#1091#1089#1082#1072
      FieldKind = fkLookup
      FieldName = 'CHECK_MODE_NAME'
      LookupDataSet = q_Repl
      LookupKeyFields = 'ID'
      LookupResultField = 'CHECK_MODE_NAME'
      KeyFields = 'REPL_CHILD'
      Size = 50
      Lookup = True
    end
    object q_ReplDepCHILD_CNT: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' "'#1076#1086#1095#1077#1082'"'
      FieldKind = fkLookup
      FieldName = 'CHILD_CNT'
      LookupDataSet = q_ReplDepCnt
      LookupKeyFields = 'REPL_PARENT'
      LookupResultField = 'CHILD_CNT'
      KeyFields = 'REPL_CHILD'
      Lookup = True
    end
  end
  object ds_ReplDep: TDataSource
    DataSet = q_ReplDep
    Left = 240
    Top = 136
  end
  object q_Repl: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  REPL_LIST.rowid,'
      '  REPL_LIST.ID,'
      '  REPL_LIST.NAME,'
      '  REPL_LIST.TAG,'
      '  REPL_LIST.IS_ACTIVE,'
      '  REPL_LIST.IS_TRACKING,'
      '  LASTDATE,LASTTIME,LASTSIZE,'
      '  REPL_CHECK_MODES.NAME as CHECK_MODE_NAME'
      'FROM REPL_LIST,REPL_CHECK_MODES'
      'WHERE REPL_LIST.CHECK_MODE=REPL_CHECK_MODES.ID'
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000900000002000000494401000000000900000049535F414354495645
      01000000000B00000049535F545241434B494E470100000000080000004C4153
      54444154450100000000080000004C41535454494D450100000000080000004C
      41535453495A4501000000000F000000434845434B5F4D4F44455F4E414D4501
      00000000040000004E414D450100000000030000005441470100000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    UpdatingTable = 'REPL_LIST'
    Session = f_main.ora_Session
    Left = 192
    Top = 200
    object q_ReplID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_ReplNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object q_ReplTAG: TStringField
      FieldName = 'TAG'
      Required = True
    end
    object q_ReplIS_ACTIVE: TIntegerField
      FieldName = 'IS_ACTIVE'
      Required = True
    end
    object q_ReplIS_TRACKING: TIntegerField
      FieldName = 'IS_TRACKING'
      Required = True
    end
    object q_ReplLASTDATE: TDateTimeField
      FieldName = 'LASTDATE'
    end
    object q_ReplLASTTIME: TStringField
      FieldName = 'LASTTIME'
      Size = 8
    end
    object q_ReplLASTSIZE: TFloatField
      FieldName = 'LASTSIZE'
    end
    object q_ReplCHECK_MODE_NAME: TStringField
      FieldName = 'CHECK_MODE_NAME'
      Required = True
      Size = 50
    end
  end
  object ds_Repl: TDataSource
    DataSet = q_Repl
    Left = 248
    Top = 200
  end
  object q_ReplDepCnt: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  REPL_DEPENDENCE.REPL_PARENT,'
      '  COUNT(*) as CHILD_CNT       '
      'FROM REPL_DEPENDENCE'
      'GROUP BY REPL_DEPENDENCE.REPL_PARENT')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000B0000005245504C5F504152454E54010000000009000000
      4348494C445F434E540100000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    Session = f_main.ora_Session
    Left = 192
    Top = 272
    object q_ReplDepCntREPL_PARENT: TFloatField
      FieldName = 'REPL_PARENT'
      Required = True
    end
    object q_ReplDepCntCHILD_CNT: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' "'#1076#1086#1095#1077#1082'"'
      FieldName = 'CHILD_CNT'
    end
  end
  object ds_ReplDepCnt: TDataSource
    DataSet = q_ReplDepCnt
    Left = 240
    Top = 272
  end
end
