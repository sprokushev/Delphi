object Form1: TForm1
  Left = 255
  Top = 104
  Width = 754
  Height = 535
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1090#1095#1077#1090#1072' '#1087#1086' '#1040#1047#1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 746
    Height = 97
    Align = alTop
    TabOrder = 0
    object Bevel1: TBevel
      Left = 1
      Top = 37
      Width = 744
      Height = 44
      Align = alTop
    end
    object StaticText1: TStaticText
      Left = 280
      Top = 5
      Width = 99
      Height = 17
      Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077':'
      TabOrder = 0
    end
    object DateTimePicker1: TDateTimePicker
      Left = 5
      Top = 57
      Width = 186
      Height = 21
      Date = 37797.447570185180000000
      Time = 37797.447570185180000000
      TabOrder = 1
    end
    object StaticText2: TStaticText
      Left = 7
      Top = 39
      Width = 89
      Height = 17
      Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072':'
      TabOrder = 2
    end
    object StaticText3: TStaticText
      Left = 199
      Top = 39
      Width = 83
      Height = 17
      Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072':'
      TabOrder = 3
    end
    object DateTimePicker2: TDateTimePicker
      Left = 197
      Top = 57
      Width = 186
      Height = 21
      Date = 37797.447570185180000000
      Time = 37797.447570185180000000
      TabOrder = 4
    end
    object StaticText4: TStaticText
      Left = 390
      Top = 39
      Width = 28
      Height = 17
      Caption = #1040#1047#1057':'
      TabOrder = 5
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 387
      Top = 56
      Width = 145
      Height = 21
      DropDownCount = 8
      LookupField = 'AZS_NAME'
      LookupSource = DataSource1
      TabOrder = 6
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 744
      Height = 36
      ButtonHeight = 32
      ButtonWidth = 33
      Caption = 'ToolBar1'
      Flat = True
      TabOrder = 7
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = 'ToolButton1'
        ImageIndex = 0
        OnClick = ToolButton1Click
      end
      object ToolButton2: TToolButton
        Left = 33
        Top = 0
        Caption = 'ToolButton2'
        ImageIndex = 1
        OnClick = ToolButton2Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 746
    Height = 411
    Align = alClient
    TabOrder = 1
    object PaintBox1: TPaintBox
      Left = 1
      Top = 239
      Width = 744
      Height = 171
      Align = alClient
      OnPaint = PaintBox1Paint
    end
    object Splitter1: TSplitter
      Left = 1
      Top = 233
      Width = 744
      Height = 6
      Cursor = crVSplit
      Align = alTop
      Beveled = True
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 744
      Height = 232
      Align = alTop
      TabOrder = 0
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 742
        Height = 230
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        AllowedSelections = []
        DataSource = DataSource2
        FixedColor = clWindow
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 2
        OptionsEh = [dghHighlightFocus, dghClearSelection]
        SumList.Active = True
        SumList.VirtualRecords = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        VertScrollBar.VisibleMode = sbNeverShowEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DAY'
            Footers = <
              item
                FieldName = 'D'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Value = #1048#1058#1054#1043#1054' '#1079#1072' 1 '#1095#1072#1089
                ValueType = fvtStaticText
                WordWrap = True
              end
              item
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Value = #1057#1088#1077#1076#1085#1077#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
                ValueType = fvtStaticText
              end>
            Title.Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080
            Width = 117
          end
          item
            EditButtons = <>
            FieldName = 'D'
            Footers = <>
            Title.Caption = #1063#1080#1089#1083#1086
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'ho1'
            Footers = <
              item
                FieldName = 'ho1'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho1'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|1'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'ho2'
            Footers = <
              item
                FieldName = 'ho2'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho2'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|2'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'ho3'
            Footers = <
              item
                FieldName = 'ho3'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho3'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|3'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'ho4'
            Footers = <
              item
                FieldName = 'ho4'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho4'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|4'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'ho5'
            Footers = <
              item
                FieldName = 'ho5'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho5'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|5'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'ho6'
            Footers = <
              item
                FieldName = 'ho6'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho6'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|6'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'ho7'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho7'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho7'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|7'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'ho8'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho8'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho8'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|8'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'ho9'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho9'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho9'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|9'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'ho10'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho10'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho10'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|10'
          end
          item
            EditButtons = <>
            FieldName = 'ho11'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho11'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho11'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|11'
          end
          item
            EditButtons = <>
            FieldName = 'ho12'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho12'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho12'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|12'
          end
          item
            EditButtons = <>
            FieldName = 'ho13'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho13'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho13'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|13'
          end
          item
            EditButtons = <>
            FieldName = 'ho14'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho14'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho14'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|14'
          end
          item
            EditButtons = <>
            FieldName = 'ho15'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho15'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho15'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|15'
          end
          item
            EditButtons = <>
            FieldName = 'ho16'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho16'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho16'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|16'
          end
          item
            EditButtons = <>
            FieldName = 'ho17'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho17'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho17'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|17'
          end
          item
            EditButtons = <>
            FieldName = 'ho18'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho18'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho18'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|18'
          end
          item
            EditButtons = <>
            FieldName = 'ho19'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho19'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho19'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|19'
          end
          item
            EditButtons = <>
            FieldName = 'ho20'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho20'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho20'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|20'
          end
          item
            EditButtons = <>
            FieldName = 'ho21'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho21'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho21'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|21'
          end
          item
            EditButtons = <>
            FieldName = 'ho22'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho22'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho22'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|22'
          end
          item
            EditButtons = <>
            FieldName = 'ho23'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho23'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho23'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|23'
          end
          item
            EditButtons = <>
            FieldName = 'ho24'
            Footers = <
              item
                DisplayFormat = '#'
                FieldName = 'ho24'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'ho24'
                ValueType = fvtAvg
              end>
            Title.Caption = #1063#1072#1089#1099'|24'
          end
          item
            DisplayFormat = '#'
            EditButtons = <>
            FieldName = 'total'
            Footers = <>
            Title.Caption = #1048#1090#1086#1075#1086' '#1079#1072' '#1076#1077#1085#1100
            WordWrap = True
          end
          item
            DisplayFormat = '#'
            EditButtons = <>
            FieldName = 'avgTotal'
            Footers = <>
            Title.Caption = #1057#1088#1077#1076#1085#1077#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
            WordWrap = True
          end>
      end
    end
  end
  object OracleSession1: TOracleSession
    Cursor = crHourGlass
    DesignConnection = False
    LogonUsername = 'lavrova'
    LogonPassword = 'z'
    LogonDatabase = 'P5'
    ConnectAs = caNormal
    ThreadSafe = False
    Preferences.FloatPrecision = 0
    Preferences.IntegerPrecision = 0
    Preferences.SmallIntPrecision = -1
    Preferences.UseOCI7 = False
    Preferences.ConvertCRLF = True
    Preferences.TrimStringFields = True
    Preferences.MaxStringFieldSize = 0
    Preferences.ZeroDateIsNull = True
    Preferences.NullLOBIsEmpty = False
    Pooling = spNone
    MTSOptions = [moImplicit, moUniqueServer]
    Connected = True
    RollbackOnDisconnect = False
    NullValue = nvUnAssigned
    SQLTrace = stUnchanged
    OptimizerGoal = ogUnchanged
    IsolationLevel = ilUnchanged
    BytesPerCharacter = bc1Byte
    Left = 616
    Top = 317
  end
  object azsListQ: TOracleDataSet
    SQL.Strings = (
      'select rn, azs_name from azsazslistmt order by azs_name')
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
      030000000200000002000000524E010000000008000000415A535F4E414D4501
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
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 640
    Top = 433
    object azsListQRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object azsListQAZS_NAME: TStringField
      FieldName = 'AZS_NAME'
      Required = True
      Size = 80
    end
  end
  object DataSource1: TDataSource
    DataSet = azsListQ
    Left = 640
    Top = 401
  end
  object DataSource2: TDataSource
    DataSet = ListRows
    Left = 360
    Top = 417
  end
  object mainQuery: TOracleDataSet
    SQL.Strings = (
      'select round(sum(volume)) as s, day, d, h + 1 as ho from'
      
        '(select volume,  to_char(rep_date, '#39'day'#39') as day, to_char(rep_da' +
        'te, '#39'dd.mm.yyyy'#39') as d, to_char(rep_date, '#39'HH24'#39') as h'
      'from azsrepout, azssreportmain'
      'where rep_date >= to_date(:startdate, '#39'dd.mm.yyyy'#39')'
      'and rep_date < to_date(:enddate) + 1'
      'and azsrepout.company =2'
      'and azsrepout.prn = azssreportmain.rn'
      'and azssreportmain.azs_number = :azsID'
      ')'
      'group by day, d, h'
      'order by to_date(d), h')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000030000000A0000003A53544152544441544505000000000000000000
      0000080000003A454E4444415445050000000000000000000000060000003A41
      5A534944050000000000000000000000}
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
      0300000004000000010000005301000000000300000044415901000000000100
      000044010000000002000000484F0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 256
    Top = 377
    object mainQueryS: TFloatField
      FieldName = 'S'
    end
    object mainQueryDAY: TStringField
      FieldName = 'DAY'
      Size = 11
    end
    object mainQueryD: TStringField
      FieldName = 'D'
      Size = 10
    end
    object mainQueryHO: TFloatField
      FieldName = 'HO'
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel files|*.xls'
    Left = 680
    Top = 41
  end
  object ListRows: TOracleDataSet
    SQL.Strings = (
      
        'select distinct to_char(rep_date, '#39'day'#39') as day, to_char(rep_dat' +
        'e, '#39'dd.mm.yyyy'#39') as d'
      'from azsrepout, azssreportmain'
      'where rep_date >= to_date(:startDate, '#39'dd.mm.yyyy'#39')'
      'and rep_date < to_date(:endDate) + 1'
      'and azsrepout.company =2'
      'and azsrepout.prn = azssreportmain.rn'
      'and azssreportmain.azs_number = :azsID'
      'order by d')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000030000000A0000003A53544152544441544505000000000000000000
      0000080000003A454E4444415445050000000000000000000000060000003A41
      5A534944050000000000000000000000}
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
    QBEDefinition.QBEFieldDefs = {030000000200000003000000444159010000000001000000440100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = False
    OnCalcFields = ListRowsCalcFields
    Left = 344
    Top = 361
    object ListRowsDAY: TStringField
      FieldName = 'DAY'
      Size = 11
    end
    object ListRowsD: TStringField
      FieldName = 'D'
      Size = 10
    end
    object ListRowsho1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho1'
      Calculated = True
    end
    object ListRowsho2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho2'
      Calculated = True
    end
    object ListRowsho3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho3'
      Calculated = True
    end
    object ListRowsho4: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho4'
      Calculated = True
    end
    object ListRowsho5: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho5'
      Calculated = True
    end
    object ListRowsho6: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho6'
      Calculated = True
    end
    object ListRowsho7: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho7'
      Calculated = True
    end
    object ListRowsho8: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho8'
      Calculated = True
    end
    object ListRowsho9: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho9'
      Calculated = True
    end
    object ListRowsho10: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho10'
      Calculated = True
    end
    object ListRowsho11: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho11'
      Calculated = True
    end
    object ListRowsho12: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho12'
      Calculated = True
    end
    object ListRowsho13: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho13'
      Calculated = True
    end
    object ListRowsho14: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho14'
      Calculated = True
    end
    object ListRowsho15: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho15'
      Calculated = True
    end
    object ListRowsho16: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho16'
      Calculated = True
    end
    object ListRowsho17: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho17'
      Calculated = True
    end
    object ListRowsho18: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho18'
      Calculated = True
    end
    object ListRowsho19: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho19'
      Calculated = True
    end
    object ListRowsho20: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho20'
      Calculated = True
    end
    object ListRowsho21: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho21'
      Calculated = True
    end
    object ListRowsho22: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho22'
      Calculated = True
    end
    object ListRowsho23: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho23'
      Calculated = True
    end
    object ListRowsho24: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ho24'
      Calculated = True
    end
    object ListRowstotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
    object ListRowsavgTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'avgTotal'
      Calculated = True
    end
  end
end
