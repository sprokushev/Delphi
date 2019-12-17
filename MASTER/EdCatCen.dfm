object f_EdCatCen: Tf_EdCatCen
  Left = 362
  Top = 235
  BorderStyle = bsDialog
  Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1094#1077#1085#1099
  ClientHeight = 255
  ClientWidth = 495
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 66
    Height = 13
    Caption = #8470' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
  end
  object Label2: TLabel
    Left = 120
    Top = 10
    Width = 82
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1094#1077#1085#1099
  end
  object Label3: TLabel
    Left = 8
    Top = 114
    Width = 91
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
  end
  object Label4: TLabel
    Left = 8
    Top = 162
    Width = 128
    Height = 13
    Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
  end
  object Label5: TLabel
    Left = 8
    Top = 65
    Width = 90
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
  end
  object e_CatCen: TEdit
    Left = 40
    Top = 29
    Width = 97
    Height = 21
    TabOrder = 0
  end
  object btOk: TBitBtn
    Left = 170
    Top = 216
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object e_CatCenName: TEdit
    Left = 144
    Top = 29
    Width = 337
    Height = 21
    TabOrder = 2
  end
  object lc_GroupDog: TRxDBLookupCombo
    Left = 40
    Top = 130
    Width = 321
    Height = 21
    DropDownCount = 12
    DisplayEmpty = '<'#1053#1077#1090' '#1076#1072#1085#1085#1099#1093'>'
    EmptyValue = '0'
    LookupField = 'ID'
    LookupDisplay = 'GROUPDOG_NAME'
    LookupSource = ds_GroupDog
    TabOrder = 4
  end
  object lc_Predpr: TRxDBLookupCombo
    Left = 40
    Top = 178
    Width = 321
    Height = 21
    DropDownCount = 12
    DisplayEmpty = '<'#1053#1077#1090' '#1076#1072#1085#1085#1099#1093'>'
    EmptyValue = '0'
    LookupField = 'ID'
    LookupDisplay = 'SHORT_NAME'
    LookupSource = ds_Predpr
    TabOrder = 5
  end
  object btCancel: TBitBtn
    Left = 258
    Top = 216
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    Kind = bkCancel
  end
  object lc_Cat_Cen_Group: TRxDBLookupCombo
    Left = 40
    Top = 81
    Width = 321
    Height = 21
    DropDownCount = 12
    LookupField = 'ID'
    LookupDisplay = 'CAT_CEN_group_name'
    LookupSource = ds_cat_cen_group
    TabOrder = 3
  end
  object ds_GroupDog: TDataSource
    DataSet = q_GroupDog
    Left = 424
    Top = 88
  end
  object ds_Predpr: TDataSource
    DataSet = q_Predpr
    Left = 452
    Top = 88
  end
  object q_GroupDog: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_groupdog')
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
    Left = 424
    Top = 60
  end
  object q_Predpr: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT kls_predpr.id,kls_predpr.short_name '
      '  FROM kls_predpr,kls_dog '
      '  WHERE kls_dog.predpr_id=kls_predpr.id'
      '  GROUP BY kls_predpr.id,kls_predpr.short_name'
      '  ORDER BY 2')
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
    Left = 452
    Top = 60
  end
  object q_cat_cen_group: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_cat_cen_group')
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
    Left = 396
    Top = 60
  end
  object ds_cat_cen_group: TDataSource
    DataSet = q_cat_cen_group
    Left = 396
    Top = 88
  end
end
