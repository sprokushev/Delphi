object RemainsDlg: TRemainsDlg
  Left = 236
  Top = 108
  Width = 487
  Height = 294
  Caption = #1054#1089#1090#1072#1090#1082#1080' '#1087#1086' '#1040#1047#1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 479
    Height = 267
    Align = alClient
    TabOrder = 0
    ControlData = {
      4C00000082310000981B00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object src: TOracleDataSet
    SQL.Strings = (
      
        'select /*+ ORDERED*/ agnList.rn, agnList.agnabbr, dicNomns.NOMEN' +
        '_CODE,  '
      #9'   b.DATE_SMENA as tim, d.SM_BEGIN, d.SM_END,'
      #9'   d.SM_NUMBER, stplcells.NUMB, azssreportrelate.fact_volume'
      
        'from agnList, azsazslistmt, azssreportmain b, azssreportrelate, ' +
        'stplcells, dicnomns, azsazssmlist d'
      'where'
      'azsazslistmt.azs_agent = agnList.rn'
      'and d.PRN = azsazslistmt.rn'
      'and d.RN = b.AZS_SMENA'
      'and azssreportrelate.prn = b.rn'
      'and dicNomns.RN = azssreportrelate.NOMEN'
      'and stplcells.rn = azssreportrelate.CELL'
      'and b.AZS_NUMBER = azsazslistmt.rn'
      
        'and b.date_smena + 1 = (select max(date_smena) from azssreportma' +
        'in a where a.AZS_NUMBER = b.azs_number)'
      'and agnList.rn = :ID'
      ''
      
        'order by tim desc, d.SM_BEGIN desc, agnList.AGNABBR, stplcells.n' +
        'umb')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
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
    Session = MainForm.OracleSession2
    DesignActivation = False
    Active = False
    Left = 296
    Top = 80
  end
end
