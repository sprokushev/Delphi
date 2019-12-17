object f_ChooseCounter: Tf_ChooseCounter
  Left = 288
  Top = 217
  Width = 651
  Height = 453
  Caption = #1042#1099#1073#1086#1088' '#1090#1080#1087#1072' '#1089#1095#1077#1090#1095#1080#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 643
    Height = 426
    Align = alClient
    Color = clMenu
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'COUNTER_NAME'
        Footers = <>
        Width = 416
      end>
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 166
    Top = 269
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '* FROM kls_counter')
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
      030000000A00000002000000494401000000000C000000434F554E5445525F4E
      414D4501000000000E000000434F554E5445525F51554553525901000000000C
      00000044455441494C5F51554552590100000000080000005843415054494F4E
      0100000000080000005943415054494F4E01000000001000000044455441494C
      494E464F5F51554552590100000000050000004C4F47494E0100000000080000
      0050415353574F524401000000000800000044415441424153450100000000}
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
    Left = 134
    Top = 269
    object OracleDataSet1ID: TFloatField
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet1COUNTER_NAME: TStringField
      DisplayLabel = #1057#1095#1077#1090#1095#1080#1082
      FieldName = 'COUNTER_NAME'
      Size = 50
    end
    object OracleDataSet1COUNTER_QUESRY: TStringField
      FieldName = 'COUNTER_QUESRY'
      Size = 1024
    end
    object OracleDataSet1DETAIL_QUERY: TStringField
      FieldName = 'DETAIL_QUERY'
      Size = 1024
    end
    object OracleDataSet1XCAPTION: TStringField
      FieldName = 'XCAPTION'
      Size = 50
    end
    object OracleDataSet1YCAPTION: TStringField
      FieldName = 'YCAPTION'
      Size = 50
    end
    object OracleDataSet1DETAILINFO_QUERY: TStringField
      FieldName = 'DETAILINFO_QUERY'
      Size = 1024
    end
    object OracleDataSet1LOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 30
    end
    object OracleDataSet1PASSWORD: TStringField
      FieldName = 'PASSWORD'
      Size = 30
    end
    object OracleDataSet1DATABASE: TStringField
      FieldName = 'DATABASE'
      Size = 30
    end
  end
end
