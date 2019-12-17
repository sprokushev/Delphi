object Form1: TForm1
  Left = 210
  Top = 102
  Width = 733
  Height = 521
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 297
    Width = 725
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 23
    Width = 725
    Height = 61
    Align = alTop
    Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1099' '
    TabOrder = 0
    object StaticText2: TStaticText
      Left = 10
      Top = 17
      Width = 89
      Height = 17
      Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072':'
      TabOrder = 0
    end
    object DateTimePicker1: TDateTimePicker
      Left = 8
      Top = 35
      Width = 186
      Height = 21
      Date = 37797.447570185180000000
      Time = 37797.447570185180000000
      TabOrder = 1
    end
    object DateTimePicker2: TDateTimePicker
      Left = 200
      Top = 35
      Width = 186
      Height = 21
      Date = 37797.447570185180000000
      Time = 37797.447570185180000000
      TabOrder = 2
    end
    object StaticText3: TStaticText
      Left = 202
      Top = 17
      Width = 83
      Height = 17
      Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072':'
      TabOrder = 3
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 725
    Height = 23
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      TabOrder = 0
      object TBItem1: TTBItem
        Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100
        OnClick = TBItem1Click
      end
      object TBItem2: TTBItem
        Caption = #1069#1082#1089#1087#1086#1088#1090
        OnClick = TBItem2Click
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 84
    Width = 725
    Height = 213
    Align = alTop
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 723
      Height = 211
      Align = alClient
      DataSource = DataSource1
      FixedColor = clWhite
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnCellClick = DBGridEh1CellClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'AZS_NAME'
          Footers = <>
          Title.Caption = #8470' '#1040#1047#1057
          Width = 113
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 300
    Width = 725
    Height = 194
    Align = alClient
    TabOrder = 3
    object PaintBox1: TPaintBox
      Left = 1
      Top = 1
      Width = 723
      Height = 192
      Align = alClient
      OnPaint = PaintBox1Paint
    end
  end
  object Oracle: TOracleSession
    DesignConnection = True
    LogonUsername = 'pvz'
    LogonDatabase = 'P5'
    Left = 528
    Top = 124
  end
  object OracleLogon1: TOracleLogon
    Session = Oracle
    Left = 504
    Top = 196
  end
  object data: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE*/ azsazslistmt.AZS_NAME,'#9'   '
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'01'#39', azsrep' +
        'out.volume, 0)) m1,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'02'#39', azsrep' +
        'out.volume, 0)) m2,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'03'#39', azsrep' +
        'out.volume, 0)) m3,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'04'#39', azsrep' +
        'out.volume, 0)) m4,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'05'#39', azsrep' +
        'out.volume, 0)) m5,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'06'#39', azsrep' +
        'out.volume, 0)) m6,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'07'#39', azsrep' +
        'out.volume, 0)) m7,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'08'#39', azsrep' +
        'out.volume, 0)) m8,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'09'#39', azsrep' +
        'out.volume, 0)) m9,'#9'   '#9'   '
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'10'#39', azsrep' +
        'out.volume, 0)) m10,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'11'#39', azsrep' +
        'out.volume, 0)) m11,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'12'#39', azsrep' +
        'out.volume, 0)) m12,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'13'#39', azsrep' +
        'out.volume, 0)) m13,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'14'#39', azsrep' +
        'out.volume, 0)) m14,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'15'#39', azsrep' +
        'out.volume, 0)) m15,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'16'#39', azsrep' +
        'out.volume, 0)) m16,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'17'#39', azsrep' +
        'out.volume, 0)) m17,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'18'#39', azsrep' +
        'out.volume, 0)) m18,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'19'#39', azsrep' +
        'out.volume, 0)) m19,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'20'#39', azsrep' +
        'out.volume, 0)) m20,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'21'#39', azsrep' +
        'out.volume, 0)) m21,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'22'#39', azsrep' +
        'out.volume, 0)) m22,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'23'#39', azsrep' +
        'out.volume, 0)) m23,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'24'#39', azsrep' +
        'out.volume, 0)) m24,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'25'#39', azsrep' +
        'out.volume, 0)) m25,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'26'#39', azsrep' +
        'out.volume, 0)) m26,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'27'#39', azsrep' +
        'out.volume, 0)) m27,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'28'#39', azsrep' +
        'out.volume, 0)) m28,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'29'#39', azsrep' +
        'out.volume, 0)) m29,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'30'#39', azsrep' +
        'out.volume, 0)) m30,'
      
        #9'   sum ( decode(to_char(azsrepout.rep_date, '#39'DD'#39'), '#39'31'#39', azsrep' +
        'out.volume, 0)) m31'
      'from azsrepout, azssreportmain, azsazslistmt '
      'where rep_date >= to_date(:startDate, '#39'dd.mm.yyyy'#39')'
      'and rep_date < to_date(:endDate, '#39'dd.mm.yyyy'#39') + 1'
      'and azsrepout.company =2'
      'and azsrepout.prn = azssreportmain.rn'
      'and azssreportmain.azs_number = azsazslistmt.rn'
      'group by azsazslistmt.azs_name, azsazslistmt.azs_number'
      'order by azsazslistmt.azs_number')
    Variables.Data = {
      03000000020000000A0000003A535441525444415445050000000B0000003031
      2E30362E323030330000000000080000003A454E4444415445050000000B0000
      0033302E30362E323030330000000000}
    QBEDefinition.QBEFieldDefs = {
      030000002000000008000000415A535F4E414D450100000000020000004D3101
      00000000020000004D320100000000020000004D330100000000020000004D34
      0100000000020000004D350100000000020000004D360100000000020000004D
      370100000000020000004D380100000000020000004D39010000000003000000
      4D31300100000000030000004D31310100000000030000004D31320100000000
      030000004D31330100000000030000004D31340100000000030000004D313501
      00000000030000004D31360100000000030000004D3137010000000003000000
      4D31380100000000030000004D31390100000000030000004D32300100000000
      030000004D32310100000000030000004D32320100000000030000004D323301
      00000000030000004D32340100000000030000004D3235010000000003000000
      4D32360100000000030000004D32370100000000030000004D32380100000000
      030000004D32390100000000030000004D33300100000000030000004D333101
      00000000}
    Session = Oracle
    AfterScroll = dataAfterScroll
    OnCalcFields = dataCalcFields
    Left = 384
    Top = 204
    object dataAZS_NAME: TStringField
      FieldName = 'AZS_NAME'
      Required = True
      Size = 80
    end
    object dataM1: TFloatField
      FieldName = 'M1'
    end
    object dataM2: TFloatField
      FieldName = 'M2'
    end
    object dataM3: TFloatField
      FieldName = 'M3'
    end
    object dataM4: TFloatField
      FieldName = 'M4'
    end
    object dataM5: TFloatField
      FieldName = 'M5'
    end
    object dataM6: TFloatField
      FieldName = 'M6'
    end
    object dataM7: TFloatField
      FieldName = 'M7'
    end
    object dataM8: TFloatField
      FieldName = 'M8'
    end
    object dataM9: TFloatField
      FieldName = 'M9'
    end
    object dataM10: TFloatField
      FieldName = 'M10'
    end
    object dataM11: TFloatField
      FieldName = 'M11'
    end
    object dataM12: TFloatField
      FieldName = 'M12'
    end
    object dataM13: TFloatField
      FieldName = 'M13'
    end
    object dataM14: TFloatField
      FieldName = 'M14'
    end
    object dataM15: TFloatField
      FieldName = 'M15'
    end
    object dataM16: TFloatField
      FieldName = 'M16'
    end
    object dataM17: TFloatField
      FieldName = 'M17'
    end
    object dataM18: TFloatField
      FieldName = 'M18'
    end
    object dataM19: TFloatField
      FieldName = 'M19'
    end
    object dataM20: TFloatField
      FieldName = 'M20'
    end
    object dataM21: TFloatField
      FieldName = 'M21'
    end
    object dataM22: TFloatField
      FieldName = 'M22'
    end
    object dataM23: TFloatField
      FieldName = 'M23'
    end
    object dataM24: TFloatField
      FieldName = 'M24'
    end
    object dataM25: TFloatField
      FieldName = 'M25'
    end
    object dataM26: TFloatField
      FieldName = 'M26'
    end
    object dataM27: TFloatField
      FieldName = 'M27'
    end
    object dataM28: TFloatField
      FieldName = 'M28'
    end
    object dataM29: TFloatField
      FieldName = 'M29'
    end
    object dataM30: TFloatField
      FieldName = 'M30'
    end
    object dataM31: TFloatField
      FieldName = 'M31'
    end
    object dataavgTotal: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'avgTotal'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = data
    Left = 328
    Top = 204
  end
end
