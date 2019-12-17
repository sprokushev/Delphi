object f_trkEff: Tf_trkEff
  Left = 205
  Top = 102
  Width = 797
  Height = 576
  Caption = #1040#1085#1072#1083#1080#1079' '#1088#1072#1073#1086#1090#1099' '#1058#1056#1050
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 329
    Width = 789
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 23
    Width = 789
    Height = 61
    Align = alTop
    Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1099' '
    TabOrder = 0
    object Label1: TLabel
      Left = 544
      Top = 17
      Width = 92
      Height = 13
      Caption = #1064#1080#1088#1080#1085#1072' '#1089#1090#1086#1083#1073#1094#1086#1074':'
    end
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
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 390
      Top = 34
      Width = 145
      Height = 21
      DropDownCount = 8
      LookupField = 'AZS_NUMBER'
      LookupSource = DataSource1
      TabOrder = 4
    end
    object StaticText4: TStaticText
      Left = 393
      Top = 17
      Width = 28
      Height = 17
      Caption = #1040#1047#1057':'
      TabOrder = 5
    end
    object UpDown1: TUpDown
      Left = 664
      Top = 30
      Width = 16
      Height = 24
      Min = 1
      Max = 200
      Position = 150
      TabOrder = 6
      OnClick = UpDown1Click
    end
    object Edit1: TComboBox
      Left = 544
      Top = 34
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 7
      Text = '150'
      OnChange = Edit1Change
      Items.Strings = (
        '15'
        '50'
        '100'
        '150'
        '200')
    end
  end
  object grid: TStringGrid
    Left = 0
    Top = 84
    Width = 789
    Height = 245
    Align = alTop
    ColCount = 26
    Ctl3D = False
    DefaultColWidth = 100
    DefaultRowHeight = 16
    FixedCols = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goThumbTracking]
    ParentCtl3D = False
    TabOrder = 1
    OnDrawCell = gridDrawCell
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 789
    Height = 23
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DefaultDock = TBDock1
      FullSize = True
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem2: TTBItem
        Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100
        DisplayMode = nbdmImageAndText
        OnClick = TBItem2Click
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 332
    Width = 789
    Height = 217
    Align = alClient
    TabOrder = 3
    object Splitter2: TSplitter
      Left = 481
      Top = 1
      Height = 215
    end
    object Chart1: TChart
      Left = 1
      Top = 1
      Width = 480
      Height = 215
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Text.Strings = (
        '')
      Title.Visible = False
      Legend.Visible = False
      View3D = False
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Series1: TBarSeries
        Marks.ArrowLength = 20
        Marks.Font.Charset = DEFAULT_CHARSET
        Marks.Font.Color = clBlack
        Marks.Font.Height = -9
        Marks.Font.Name = 'Arial'
        Marks.Font.Style = []
        Marks.Frame.Visible = False
        Marks.Style = smsValue
        Marks.Transparent = True
        Marks.Visible = True
        SeriesColor = clGreen
        BarStyle = bsRectGradient
        Dark3D = False
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
      object Series2: TBarSeries
        Marks.ArrowLength = 20
        Marks.Font.Charset = DEFAULT_CHARSET
        Marks.Font.Color = clBlack
        Marks.Font.Height = -9
        Marks.Font.Name = 'Arial'
        Marks.Font.Style = []
        Marks.Frame.Visible = False
        Marks.Transparent = True
        Marks.Visible = True
        SeriesColor = clRed
        ShowInLegend = False
        BarStyle = bsRectGradient
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
    end
    object Panel2: TPanel
      Left = 484
      Top = 1
      Width = 304
      Height = 215
      Align = alClient
      TabOrder = 1
      object Label2: TLabel
        Left = 9
        Top = 12
        Width = 90
        Height = 13
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1058#1056#1050':'
      end
      object Label3: TLabel
        Left = 8
        Top = 36
        Width = 188
        Height = 13
        Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1090#1086#1081' '#1058#1056#1050' ('#1095#1072#1089#1086#1074'):'
      end
      object trkCombo: TComboBox
        Left = 102
        Top = 8
        Width = 59
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = trkComboChange
      end
      object GroupBox2: TGroupBox
        Left = 1
        Top = 58
        Width = 302
        Height = 156
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1058#1056#1050
        TabOrder = 1
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 298
          Height = 139
          Align = alClient
          DataSource = DataSource2
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object Edit2: TEdit
        Left = 199
        Top = 32
        Width = 41
        Height = 21
        ReadOnly = True
        TabOrder = 2
        Text = '1'
      end
      object UpDown3: TUpDown
        Left = 240
        Top = 30
        Width = 16
        Height = 24
        Min = 1
        Max = 50
        Position = 1
        TabOrder = 3
        OnClick = UpDown3Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = azsListQ
    Left = 352
    Top = 257
  end
  object OracleSession1: TOracleSession
    DesignConnection = True
    LogonDatabase = 'P5'
    Left = 384
    Top = 261
  end
  object azsListQ: TOracleDataSet
    SQL.Strings = (
      
        'select rn, azs_number, store_type from azsazslistmt where store_' +
        'type = 1 order by azs_number')
    QBEDefinition.QBEFieldDefs = {
      030000000300000002000000524E01000000000A000000415A535F4E554D4245
      5201000000000A00000053544F52455F545950450100000000}
    Session = OracleSession1
    Left = 320
    Top = 257
    object azsListQAZS_NUMBER: TStringField
      FieldName = 'AZS_NUMBER'
      Required = True
    end
    object azsListQRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
  end
  object OracleLogon1: TOracleLogon
    Session = OracleSession1
    Retries = 5
    Options = [ldAuto, ldDatabase, ldDatabaseList, ldLogonHistory]
    HistoryRegSection = 'Software\SNP\Master\LogonHistory'
    HistoryWithPassword = True
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1074#1086#1081' '#1051#1086#1075#1080#1085' '#1080' '#1055#1072#1088#1086#1083#1100' '#1074' '#1055#1050' "'#1055#1072#1088#1091#1089'"'
    Left = 424
    Top = 257
  end
  object MainDataQ: TOracleDataSet
    SQL.Strings = (
      'select dat, m, count(m)'
      'from('
      
        'select to_date(to_char(a.ddate, '#39'dd.mm.yyyy HH24'#39'), '#39'dd.mm.yyyy ' +
        'HH24'#39') dat, a.smech m'
      'from v_azsrepout a, v_azssreportmain b'
      'where a.nprn = b.nrn'
      'and a.ddate >= :st'
      'and b.ddate_smena <= :e'
      'and b.sazs_number = :azs'
      'order by a.ddate, m'
      ')'
      'group by dat, m')
    Variables.Data = {
      0300000003000000040000003A415A5305000000000000000000000003000000
      3A53540C0000000000000000000000020000003A450C00000000000000000000
      00}
    Session = OracleSession1
    Left = 288
    Top = 256
  end
  object trkListQ: TOracleDataSet
    SQL.Strings = (
      'select distinct a.strk_number m'
      'from v_azssreportmech a, v_azssreportmain b'
      'where a.nprn = b.nrn'
      'and b.ddate_smena > :st'
      'and b.ddate_smena < :en'
      'and b.sazs_number = :azs')
    Variables.Data = {
      0300000003000000030000003A53540C0000000000000000000000030000003A
      454E0C0000000000000000000000040000003A415A5305000000000000000000
      0000}
    Session = OracleSession1
    Left = 240
    Top = 256
  end
  object DataSource2: TDataSource
    DataSet = trkListQ
    Left = 541
    Top = 463
  end
end
