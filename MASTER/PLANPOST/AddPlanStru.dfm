object F_AddPlanStru: TF_AddPlanStru
  Left = 298
  Top = 336
  Width = 593
  Height = 322
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1079#1080#1094#1080#1080' '#1087#1083#1072#1085#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    585
    295)
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 8
    Top = 8
    Width = 51
    Height = 13
    Caption = #1056#1086#1076#1080#1090#1077#1083#1100':'
  end
  object Label8: TLabel
    Left = 8
    Top = 36
    Width = 157
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1079#1080#1094#1080#1080' '#1087#1083#1072#1085#1072':'
  end
  object Label1: TLabel
    Left = 8
    Top = 106
    Width = 55
    Height = 13
    Caption = 'KOD_SGR:'
  end
  object Label2: TLabel
    Left = 200
    Top = 106
    Width = 54
    Height = 13
    Caption = 'KOD_SPG:'
  end
  object Label3: TLabel
    Left = 392
    Top = 106
    Width = 55
    Height = 13
    Caption = 'KOD_RZD:'
  end
  object Label6: TLabel
    Left = 8
    Top = 130
    Width = 54
    Height = 13
    Caption = 'KOD_PRZ:'
  end
  object Label9: TLabel
    Left = 200
    Top = 130
    Width = 55
    Height = 13
    Caption = 'KOD_GRP:'
  end
  object Label10: TLabel
    Left = 392
    Top = 130
    Width = 55
    Height = 13
    Caption = 'KOD_PGR:'
  end
  object Label11: TLabel
    Left = 8
    Top = 80
    Width = 44
    Height = 13
    Caption = #1059#1088#1086#1074#1077#1085#1100
  end
  object Label12: TLabel
    Left = 200
    Top = 80
    Width = 109
    Height = 13
    Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1086#1090#1075#1088#1091#1079#1082#1080
  end
  object Label13: TLabel
    Left = 8
    Top = 156
    Width = 39
    Height = 13
    Caption = 'FOR_ID'
  end
  object Label14: TLabel
    Left = 200
    Top = 156
    Width = 59
    Height = 13
    Caption = 'FOR_NAME'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 192
    Width = 569
    Height = 57
    Anchors = [akLeft, akTop, akRight]
    Caption = ' '#1055#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103' '
    TabOrder = 0
    object Label4: TLabel
      Left = 146
      Top = 26
      Width = 38
      Height = 13
      Caption = #1057' '#1076#1072#1090#1099':'
    end
    object Label5: TLabel
      Left = 286
      Top = 27
      Width = 42
      Height = 13
      Caption = #1055#1086' '#1076#1072#1090#1091':'
    end
    object e_BegDate: TDateTimePicker
      Left = 193
      Top = 24
      Width = 81
      Height = 21
      Date = 37286.407412442100000000
      Time = 37286.407412442100000000
      TabOrder = 0
    end
    object e_EndDate: TDateTimePicker
      Left = 341
      Top = 24
      Width = 81
      Height = 21
      Date = 37286.407412442100000000
      Time = 37286.407412442100000000
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 179
    Top = 264
    Width = 100
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 307
    Top = 264
    Width = 100
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object lc_ParentStru: TRxDBLookupCombo
    Left = 64
    Top = 4
    Width = 513
    Height = 21
    DropDownCount = 8
    Anchors = [akLeft, akTop, akRight]
    LookupField = 'ID'
    LookupDisplay = 'NAME'
    LookupSource = ds_ParentStru
    TabOrder = 3
    OnChange = lc_ParentStruChange
  end
  object e_name: TEdit
    Left = 169
    Top = 32
    Width = 408
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Text = 'e_name'
  end
  object e_kod_sgr: TEdit
    Left = 72
    Top = 103
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 7
    Text = 'e_kod_sgr'
  end
  object e_kod_spg: TEdit
    Left = 264
    Top = 103
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 8
    Text = 'e_kod_spg'
  end
  object e_kod_rzd: TEdit
    Left = 456
    Top = 103
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 9
    Text = 'e_kod_rzd'
  end
  object e_kod_prz: TEdit
    Left = 72
    Top = 127
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 10
    Text = 'e_kod_prz'
  end
  object e_kod_grp: TEdit
    Left = 264
    Top = 127
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 11
    Text = 'e_kod_grp'
  end
  object e_kod_pgr: TEdit
    Left = 456
    Top = 127
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 12
    Text = 'e_kod_pgr'
  end
  object e_Level: TEdit
    Left = 72
    Top = 77
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 5
    Text = #1059#1088#1086#1074#1077#1085#1100
  end
  object lc_Nazn_Otg: TRxDBLookupCombo
    Left = 320
    Top = 76
    Width = 257
    Height = 21
    DropDownCount = 8
    DisplayEmpty = #1053#1077' '#1074#1099#1073#1088#1072#1085' ('#1080' '#1085#1077' '#1085#1072#1076#1086' :)'
    EmptyValue = '0'
    Anchors = [akLeft, akTop, akRight]
    LookupField = 'ID'
    LookupDisplay = 'NAZN_OTG_NAME'
    LookupSource = ds_nazn_otg
    TabOrder = 6
    OnChange = lc_ParentStruChange
  end
  object e_for_id: TEdit
    Left = 72
    Top = 153
    Width = 121
    Height = 21
    TabOrder = 13
    Text = 'e_for_id'
  end
  object e_for_name: TEdit
    Left = 264
    Top = 153
    Width = 313
    Height = 21
    TabOrder = 14
    Text = 'e_for_name'
  end
  object q_Tmp: TOracleDataSet
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    DesignActivation = False
    Active = False
    Left = 336
    Top = 16
  end
  object q_ParentStru: TOracleDataSet
    SQL.Strings = (
      'SELECT V_PLAN_STRU.* FROM V_PLAN_STRU'
      'WHERE TO_CHAR(BEGIN_DATE,'#39'YYYY'#39')='#39'2002'#39
      '   OR TO_CHAR(END_DATE,'#39'YYYY'#39')='#39'2002'#39
      'ORDER BY'
      '  V_PLAN_STRU.KOD_SGR,'
      '  V_PLAN_STRU.KOD_SPG,'
      '  V_PLAN_STRU.KOD_RZD,'
      '  V_PLAN_STRU.KOD_PRZ,'
      '  V_PLAN_STRU.KOD_GRP,'
      '  V_PLAN_STRU.KOD_PGR'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      030000000B0000000200000049440100000000040000004E414D450100000000
      0A000000424547494E5F44415445010000000008000000454E445F4441544501
      00000000090000004C4556454C5F504F530100000000070000004B4F445F5347
      520100000000070000004B4F445F5350470100000000070000004B4F445F525A
      440100000000070000004B4F445F50525A0100000000070000004B4F445F4752
      500100000000070000004B4F445F5047520100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    DesignActivation = False
    Active = False
    Left = 400
    Top = 16
    object q_ParentStruID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_ParentStruNAME: TStringField
      FieldName = 'NAME'
      Size = 156
    end
    object q_ParentStruBEGIN_DATE: TDateTimeField
      FieldName = 'BEGIN_DATE'
      Required = True
    end
    object q_ParentStruEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
      Required = True
    end
    object q_ParentStruLEVEL_POS: TIntegerField
      FieldName = 'LEVEL_POS'
      Required = True
    end
    object q_ParentStruKOD_SGR: TIntegerField
      FieldName = 'KOD_SGR'
      Required = True
    end
    object q_ParentStruKOD_SPG: TIntegerField
      FieldName = 'KOD_SPG'
      Required = True
    end
    object q_ParentStruKOD_RZD: TIntegerField
      FieldName = 'KOD_RZD'
      Required = True
    end
    object q_ParentStruKOD_PRZ: TIntegerField
      FieldName = 'KOD_PRZ'
      Required = True
    end
    object q_ParentStruKOD_GRP: TIntegerField
      FieldName = 'KOD_GRP'
      Required = True
    end
    object q_ParentStruKOD_PGR: TIntegerField
      FieldName = 'KOD_PGR'
      Required = True
    end
  end
  object ds_ParentStru: TDataSource
    DataSet = q_ParentStru
    Left = 428
    Top = 16
  end
  object q_nazn_otg: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_nazn_otg')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000D0000004E415A4E5F4F54475F
      4E414D450100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    DesignActivation = False
    Active = False
    Left = 400
    Top = 44
    object q_nazn_otgID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_nazn_otgNAZN_OTG_NAME: TStringField
      FieldName = 'NAZN_OTG_NAME'
      Required = True
      Size = 50
    end
  end
  object ds_nazn_otg: TDataSource
    DataSet = q_nazn_otg
    Left = 428
    Top = 44
  end
end
