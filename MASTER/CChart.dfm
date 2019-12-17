object f_CounterChart: Tf_CounterChart
  Left = 273
  Top = 149
  Width = 696
  Height = 480
  Caption = #1043#1088#1072#1092#1080#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Legend.Visible = False
    Align = alClient
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
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
    Session = f_main.ora_Session
    DesignActivation = False
    Active = False
    Left = 320
    Top = 272
    object OracleDataSet1HOURS: TStringField
      FieldName = 'HOURS'
      Size = 2
    end
    object OracleDataSet1VALUE: TFloatField
      FieldName = 'VALUE'
    end
  end
end
