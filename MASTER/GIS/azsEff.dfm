object azsEffDlg: TazsEffDlg
  Left = 280
  Top = 184
  Width = 651
  Height = 352
  Caption = #1069#1092#1092#1077#1082#1090#1080#1074#1085#1086#1089#1090#1100' '#1088#1072#1073#1086#1090#1099' '#1040#1047#1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 23
    Width = 643
    Height = 302
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnGetCellParams = DBGridEh1GetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DD'
        Footer.Value = #1048#1090#1086#1075#1086
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'AI80V'
        Footer.FieldName = 'AI80V'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1040#1048'-80|'#1054#1073#1098#1077#1084
      end
      item
        EditButtons = <>
        FieldName = 'AI80S'
        Footer.FieldName = 'AI80S'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1040#1048'-80|'#1057#1090#1086#1080#1084#1086#1089#1090#1100
      end
      item
        EditButtons = <>
        FieldName = 'AI92V'
        Footer.FieldName = 'AI92V'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1040#1048'-92|'#1054#1073#1098#1077#1084
      end
      item
        EditButtons = <>
        FieldName = 'AI92S'
        Footer.FieldName = 'AI92S'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1040#1048'-92|'#1057#1090#1086#1080#1084#1086#1089#1090#1100
      end
      item
        EditButtons = <>
        FieldName = 'AI95V'
        Footer.FieldName = 'AI95V'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1040#1048'-95|'#1054#1073#1098#1077#1084
      end
      item
        EditButtons = <>
        FieldName = 'AI95S'
        Footer.FieldName = 'AI95S'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1040#1048'-95|'#1057#1090#1086#1080#1084#1086#1089#1090#1100
      end
      item
        EditButtons = <>
        FieldName = 'DISV'
        Footer.FieldName = 'DISV'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1044#1047#1059'|'#1054#1073#1098#1077#1084
      end
      item
        EditButtons = <>
        FieldName = 'DISS'
        Footer.FieldName = 'DISS'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1044#1047#1059'|'#1057#1090#1086#1080#1084#1086#1089#1090#1100
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 643
    Height = 23
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      FullSize = True
      TabOrder = 0
      object TBItem1: TTBItem
        Caption = #1055#1077#1095#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099
        OnClick = TBItem1Click
      end
      object TBControlItem1: TTBControlItem
        Control = Label1
      end
      object Label1: TLabel
        Left = 96
        Top = 3
        Width = 32
        Height = 13
        Caption = 'Label1'
        Visible = False
      end
    end
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 23
    Width = 643
    Height = 302
    Align = alClient
    TabOrder = 2
    ControlData = {
      4C00000075420000361F00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object DataSource1: TDataSource
    Left = 240
    Top = 152
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = DBGridEh1
    Options = []
    Page.BottomMargin = 2.000000000000000000
    Page.LeftMargin = 2.000000000000000000
    Page.RightMargin = 2.000000000000000000
    Page.TopMargin = 2.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 352
    Top = 152
  end
  object src: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE*/ azsazslistmt.AZS_NAME, dicnomns.nomen_code, '
      #9'   to_char(azssreportmain.DATE_SMENA, '#39'dd.mm.yyyy'#39') as dd,'
      #9'   sum(azsrepout.volume) as vol, sum(azsrepout.summ) as summ'
      
        'from azsrepout, azssreportmain, azsazslistmt, dicnomns, agnList,' +
        ' dicgnomn'
      
        'where azssreportmain.date_smena >= to_date(:startDate, '#39'dd.mm.yy' +
        'yy'#39')'
      'and agnlist.RN = azsazslistmt.AZS_AGENT'
      'and azssreportmain.date_smena <= to_date(:endDate, '#39'dd.mm.yyyy'#39')'
      'and azsrepout.company =2'
      'and azsrepout.prn = azssreportmain.rn'
      'and azssreportmain.azs_number = azsazslistmt.rn'
      'and dicnomns.RN=azsrepout.nomen'
      'and dicgnomn.rn = dicnomns.group_code'
      'and azsazslistMt.azs_agent = :ID'
      'group by azssreportmain.DATE_SMENA, '
      'azsazslistmt.azs_name, '
      'azsazslistmt.azs_number, dicnomns.nomen_code'
      
        'order by azsazslistmt.azs_number, azssreportmain.DATE_SMENA, dic' +
        'nomns.nomen_code')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000030000000A0000003A53544152544441544505000000000000000000
      0000080000003A454E4444415445050000000000000000000000030000003A49
      44030000000000000000000000}
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
      030000002400000002000000524E01000000000300000043524E010000000007
      00000056455253494F4E01000000000A0000004E4F4D454E5F434F4445010000
      00000A0000004E4F4D454E5F4E414D4501000000000A000000554D4541535F4D
      41494E010000000009000000554D4541535F414C540100000000050000004551
      55414C0100000000090000005349474E5F41434E540100000000090000005349
      474E5F444F435301000000000A00000047524F55505F434F444501000000000A
      0000005349474E5F554D45415301000000000A0000004E4F4D454E5F54595045
      01000000000B0000005349474E5F53455249414C01000000000A000000534947
      4E5F504152545901000000000A0000005349474E5F4D4F444946010000000004
      0000004F4B4450010000000007000000434E54524E444D010000000007000000
      4D5444524E444D010000000007000000434E54524E4453010000000007000000
      4D5444524E44530100000000090000005441585F47524F555001000000000800
      00005349474E5F53455401000000000F0000005349474E5F5345545F44495649
      4445010000000005000000574944544801000000000600000048454947485401
      00000000060000004C454E475448010000000006000000574549474854010000
      0000070000004D555F53495A450100000000090000004D555F57454947485401
      000000000900000054454D505F46524F4D01000000000700000054454D505F54
      4F01000000000A00000048554D49445F46524F4D01000000000800000048554D
      49445F544F01000000000E000000434F4D4D4F4E5F50525F5349474E01000000
      000C0000004E414C5441585F47524F55500100000000}
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
    Top = 176
  end
end
