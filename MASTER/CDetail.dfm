object f_DetailInfo: Tf_DetailInfo
  Left = 268
  Top = 183
  Width = 696
  Height = 480
  Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 288
    Top = 272
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  TO_CHAR(calltime,'#39'hh24'#39') AS hours,'
      '  count(*) AS value'
      '  FROM tel.atslog'
      '  WHERE '
      'calltime>=trunc(sysdate) AND'
      '(SUBSTR(atslog.tonumber,1,1)='#39'8'#39') AND'
      '(atslog.FROMNUMBER BETWEEN '#39'6100'#39' AND '#39'6299'#39' OR '
      '  atslog.FROMNUMBER BETWEEN '#39'6500'#39' AND '#39'6699'#39' OR'
      '   atslog.FROMNUMBER BETWEEN '#39'703'#39'  AND '#39'703'#39') AND'
      'atslog.CALLLENGTH>=0.3'
      'GROUP BY TO_CHAR(calltime,'#39'hh24'#39')')
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
      030000000200000005000000484F55525301000000000500000056414C554501
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
    DesignActivation = False
    Active = False
    Left = 320
    Top = 272
  end
end
