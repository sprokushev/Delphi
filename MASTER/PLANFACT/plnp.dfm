object f_plnp: Tf_plnp
  Left = 249
  Top = 225
  Width = 394
  Height = 114
  Caption = #1042#1099#1073#1086#1088' '#1086#1090#1089#1099#1083#1072#1077#1084#1086#1075#1086' '#1087#1083#1072#1085#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 11
    Top = 8
    Width = 29
    Height = 13
    Caption = #1055#1083#1072#1085':'
  end
  object lc_Plans: TRxDBLookupCombo
    Left = 48
    Top = 4
    Width = 321
    Height = 21
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'PLAN_TYP_ID'
    LookupDisplay = 'PLAN_TYP_NAME'
    LookupSource = ds_Plans
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 40
    Width = 89
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 40
    Width = 83
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object q_Plans: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  1 as PLAN_TYP_ID,'
      '  '#39#1055#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1087#1083#1072#1085#39' as PLAN_TYP_NAME,'
      '  TO_DATE('#39'01.01.2004'#39','#39'dd.mm.yyyy'#39') as FROM_DATE'
      'FROM dual'
      'UNION ALL'
      'SELECT'
      '  DECODE(PLAN_ID,3,3,2) as PLAN_TYP_ID,'
      '  '#39#1058#1077#1082#1091#1097#1080#1081' '#1087#1083#1072#1085' ('#1089' '#1091#1095#1077#1090#1086#1084' '#1054#1041#1056' '#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1081')'#39' as PLAN_TYP_NAME,'
      '  BEGIN_DATE as FROM_DATE'
      'FROM'
      '('
      '    SELECT * FROM PLAN_PERIODS WHERE ID IN'
      '       ( '
      #9'     SELECT MAX(A.ID) as max_id    '
      '          FROM PLAN_PERIODS A'
      '         WHERE A.DATE_PLAN=TO_DATE('#39'01.12.2003'#39','#39'dd.mm.yyyy'#39')'
      #9'         AND A.BEGIN_DATE<=TO_DATE('#39'31.12.2003'#39','#39'dd.mm.yyyy'#39')'
      '           AND A.PLAN_ID IN (3,4)'
      '        )'
      ')'
      'ORDER BY PLAN_TYP_ID DESC')
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
      03000000030000000900000046524F4D5F4441544501000000000B000000504C
      414E5F5459505F494401000000000D000000504C414E5F5459505F4E414D4501
      00000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = f_main.ora_Session
    DesignActivation = False
    Active = False
    Left = 144
    object q_PlansPLAN_TYP_ID: TFloatField
      FieldName = 'PLAN_TYP_ID'
    end
    object q_PlansPLAN_TYP_NAME: TStringField
      FieldName = 'PLAN_TYP_NAME'
      Size = 39
    end
    object q_PlansFROM_DATE: TDateTimeField
      FieldName = 'FROM_DATE'
    end
  end
  object ds_Plans: TDataSource
    DataSet = q_Plans
    Left = 192
  end
end
