object f_azsEff: Tf_azsEff
  Left = 49
  Top = 126
  Width = 975
  Height = 540
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1090#1095#1077#1090#1072' '#1087#1086' '#1040#1047#1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 967
    Height = 105
    Align = alTop
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 280
      Top = 5
      Width = 99
      Height = 17
      Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077':'
      TabOrder = 0
    end
    object TBDock1: TTBDock
      Left = 1
      Top = 1
      Width = 965
      Height = 26
      object TBToolbar1: TTBToolbar
        Left = 0
        Top = 0
        Caption = 'TBToolbar1'
        FullSize = True
        Images = f_main.img_Common
        TabOrder = 0
        object TBItem2: TTBItem
          Action = acCalc
          DisplayMode = nbdmImageAndText
        end
        object TBItem1: TTBItem
          Action = acAZStoXLS
          DisplayMode = nbdmImageAndText
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 27
      Width = 965
      Height = 78
      Align = alTop
      Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1099' '
      TabOrder = 2
      object Label1: TLabel
        Left = 515
        Top = 9
        Width = 91
        Height = 13
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1076#1072#1085#1085#1099#1093':'
      end
      object Label2: TLabel
        Left = 398
        Top = 9
        Width = 76
        Height = 13
        Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090':'
      end
      object Label3: TLabel
        Left = 800
        Top = 16
        Width = 15
        Height = 16
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 872
        Top = 16
        Width = 16
        Height = 16
        Caption = #1076#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
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
        Width = 105
        Height = 21
        Date = 37797.447570185180000000
        Time = 37797.447570185180000000
        TabOrder = 1
      end
      object DateTimePicker2: TDateTimePicker
        Left = 115
        Top = 35
        Width = 105
        Height = 21
        Date = 37797.447570185180000000
        Time = 37797.447570185180000000
        TabOrder = 2
      end
      object StaticText3: TStaticText
        Left = 117
        Top = 17
        Width = 83
        Height = 17
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072':'
        TabOrder = 3
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 262
        Top = 50
        Width = 115
        Height = 21
        DropDownCount = 8
        LookupField = 'AZS_NUMBER'
        LookupDisplay = 'AZS_NUMBER'
        LookupSource = DataSource1
        TabOrder = 4
        OnChange = RxDBLookupCombo1Change
      end
      object StaticText4: TStaticText
        Left = 225
        Top = 49
        Width = 28
        Height = 17
        Caption = #1040#1047#1057':'
        TabOrder = 5
      end
      object ComboBox1: TComboBox
        Left = 515
        Top = 34
        Width = 102
        Height = 21
        ItemHeight = 13
        TabOrder = 6
        Items.Strings = (
          #1048#1079' '#1041#1091#1092#1077#1088#1072
          #1048#1079' '#1055#1072#1088#1091#1089#1072)
      end
      object RadioGroup1: TRadioGroup
        Left = 632
        Top = 8
        Width = 161
        Height = 65
        Caption = #1057#1095#1080#1090#1072#1090#1100' ('#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1041#1091#1092#1077#1088#1072')'
        ItemIndex = 0
        Items.Strings = (
          #1054#1073#1098#1077#1084
          #1050#1086#1083'-'#1074#1086' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1081
          #1057#1091#1084#1084#1072)
        TabOrder = 7
      end
      object ComboBox2: TComboBox
        Left = 392
        Top = 34
        Width = 113
        Height = 21
        ItemHeight = 13
        TabOrder = 8
        Text = '%'
        Items.Strings = (
          '%'
          '%80%'
          '%76%'
          '%92%'
          '%95%'
          '%98%'
          '%'#1044#1048#1047'%'
          #1060#1040#1057#1054#1042#1050#1040)
      end
      object RxDBLookupCombo2: TRxDBLookupCombo
        Left = 262
        Top = 10
        Width = 115
        Height = 21
        DropDownCount = 8
        LookupField = 'RN'
        LookupDisplay = 'BUNIT_MNEMO'
        LookupSource = DataSource3
        TabOrder = 9
        OnChange = RxDBLookupCombo2Change
      end
      object StaticText5: TStaticText
        Left = 225
        Top = 17
        Width = 29
        Height = 17
        Caption = #1055#1041#1045':'
        TabOrder = 10
      end
      object RadioGroup2: TRadioGroup
        Left = 792
        Top = 40
        Width = 161
        Height = 33
        Caption = #1057#1095#1080#1090#1072#1090#1100' ('#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1041#1091#1092#1077#1088#1072')'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #1051#1080#1090#1088#1099
          #1056#1091#1073#1083#1080)
        TabOrder = 11
      end
      object Edit1: TEdit
        Left = 824
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 12
        Text = '1'
      end
      object Edit2: TEdit
        Left = 896
        Top = 16
        Width = 49
        Height = 21
        TabOrder = 13
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 967
    Height = 401
    Align = alClient
    TabOrder = 1
    object PaintBox1: TPaintBox
      Left = 1
      Top = 239
      Width = 232
      Height = 183
      PopupMenu = PopupMenu1
      OnPaint = PaintBox1Paint
    end
    object Splitter1: TSplitter
      Left = 1
      Top = 233
      Width = 965
      Height = 6
      Cursor = crVSplit
      Align = alTop
      Beveled = True
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 965
      Height = 232
      Align = alTop
      TabOrder = 0
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 963
        Height = 230
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        AllowedSelections = []
        DataSource = DataSource2
        FixedColor = clWindow
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        Columns = <
          item
            EditButtons = <>
            FieldName = 'azs'
            Footers = <>
            Title.Caption = #8470' '#1040#1047#1057
            Width = 40
          end
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
            Footers = <
              item
                FieldName = 'total'
                ValueType = fvtSum
              end
              item
                DisplayFormat = '#'
                FieldName = 'total'
                ValueType = fvtAvg
              end>
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
    object Chart1: TChart
      Left = 1
      Top = 239
      Width = 965
      Height = 161
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Text.Strings = (
        'TChart')
      Legend.Visible = False
      View3D = False
      View3DWalls = False
      Align = alClient
      TabOrder = 1
      object Series1: TBarSeries
        Marks.Arrow.Visible = False
        Marks.ArrowLength = 8
        Marks.Clip = True
        Marks.Frame.Visible = False
        Marks.Style = smsValue
        Marks.Transparent = True
        Marks.Visible = False
        SeriesColor = clRed
        BarWidthPercent = 100
        OffsetPercent = 50
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
  end
  object OracleSession1: TOracleSession
    DesignConnection = True
    Left = 688
    Top = 349
  end
  object azsListQ: TOracleDataSet
    SQL.Strings = (
      
        '(select rn, azs_number, store_type from azsazslistmt where store' +
        '_type = 1 )'
      'union all'
      '      select 0,'#39'BCE'#39',1 from dual'
      'order by azs_number')
    QBEDefinition.QBEFieldDefs = {
      040000000300000002000000524E0100000000000A000000415A535F4E554D42
      45520100000000000A00000053544F52455F54595045010000000000}
    Session = OracleSession1
    Left = 272
    Top = 361
    object azsListQAZS_NUMBER: TStringField
      FieldName = 'AZS_NUMBER'
      Required = True
    end
    object azsListQRN: TFloatField
      FieldName = 'RN'
      Required = True
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
    QBEDefinition.QBEFieldDefs = {
      0400000004000000010000005301000000000003000000444159010000000000
      010000004401000000000002000000484F010000000000}
    Session = buffer
    BeforeOpen = mainQueryBeforeOpen
    Left = 176
    Top = 369
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
    object mainQueryAZS: TStringField
      FieldName = 'AZS'
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel files|*.xls'
    Left = 384
    Top = 193
  end
  object ListRows: TOracleDataSet
    Session = OracleSession1
    BeforeOpen = ListRowsBeforeOpen
    OnCalcFields = ListRowsCalcFields
    Left = 224
    Top = 361
    object ListRowsazs: TStringField
      DisplayWidth = 10
      FieldName = 'azs'
      Size = 10
    end
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
    object ListRowsDAYN: TStringField
      FieldName = 'DAYN'
      Size = 1
    end
  end
  object OracleLogon1: TOracleLogon
    Session = OracleSession1
    Retries = 5
    Options = [ldDatabase, ldDatabaseList, ldLogonHistory]
    HistoryRegSection = 'Software\SNP\Master\LogonHistory'
    HistoryWithPassword = True
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1074#1086#1081' '#1051#1086#1075#1080#1085' '#1080' '#1055#1072#1088#1086#1083#1100' '#1074' '#1055#1050' "'#1055#1072#1088#1091#1089'"'
    Left = 584
    Top = 369
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 24
    Top = 433
    Bitmap = {
      494C010102000400040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008442210084422100844221008442210084422100844221008442
      2100844221008442210084422100844221008442210084422100844221008442
      2100844221008442210084422100844221008442210084422100844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073737300737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007373730073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730073737300737373007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000737373005263730073737300737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003184AD0018A5D600007BAD004242
      4200737373000000000000000000000000000000000000000000000000007373
      7300217BA500D6E7EF004A94B500737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000318CBD00D6F7FF0000CEFF00008C
      BD00314252005A4A420000000000000000000000000000000000737373003184
      AD00F7FFFF0063EFFF004A94B500737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A94B500DEEFF70018D6FF0008CE
      FF0018ADD600294A5A00524239000000000000000000426B84005A9CBD00DEF7
      FF0039DEFF0039D6F70029637B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004284
      420042844200428442004284420000000000FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A94B500ADEFFF0000CE
      FF0018D6FF0029BDDE002152730042393100295A7B007BB5CE00E7FFFF0018D6
      FF0000CEFF00218CC60073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF000000000084A5630084A5630084A5
      630084A5630084A5630084A5630084A5630084A56300000000004284420084A5
      420042E72100FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000398CB500EFF7F70008CE
      FF0008D6FF0031DEFF0042D6F700006B9C00A5C6DE00CEFFFF0052EFFF0021DE
      FF0000CEFF0021638C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF000000000084A542004284
      420042844200428442004284420042844200000000004284420084A5420042E7
      2100FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000010739C0084E7
      FF0000CEFF0021DEFF0042E7FF007BF7FF00D6FFFF0084FFFF0063EFFF0031DE
      FF0008ADDE007373730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084A5
      4200428442004284420042844200000000004284420084A5420042E72100FFFF
      FF00000000004284420000000000FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000010739C00F7FF
      FF0000CEFF0010D6FF0039DEFF005AEFFF0084F7FF0094FFFF0073F7FF0042E7
      FF00007BAD007373730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000084A5420042844200000000004284420084A5420042E72100FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006363630039739400ADCE
      DE005ADEFF0000CEFF0029DEFF004AE7FF0073F7FF0094FFFF0084F7FF0052E7
      F700186B94004A39310073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000004284420084A5420042E72100FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630039637B000084BD0000CE
      FF0021D6FF0000CEFF0018D6FF0039E7FF005AEFFF0084FFFF0094FFFF006BEF
      FF001894C60018638C004A393900737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000004284420084A5420042E72100FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A6B7B000873A50000BDEF0010D6FF0039E7
      FF0021DEFF0008CEFF0008CEFF0029DEFF004AE7FF0073F7FF0094FFFF007BF7
      FF0052EFFF0021CEF7000073A50031424A007373730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00004284420084A5420042E72100FFFFFF00000000004284420084A563000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000296B8C00008CC60000CEFF005AEFFF006BF7FF0052E7
      FF0031DEFF0018D6FF0000CEFF0018D6FF0042E7FF0063EFFF008CFFFF008CFF
      FF0063EFFF0039E7FF0010D6FF00009CCE00215A7B0073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000004284
      420084A5420042E72100FFFFFF000000000084A54200428442004284420084A5
      630000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000087BAD0000BDF70021D6FF0084FFFF0094FFFF007BF7FF0063EF
      FF005AE7FF0042DEFF0000CEFF0010D6FF0031DEFF0052EFFF0094FFFF00ADFF
      FF007BF7FF004AE7FF0021DEFF0000CEFF0018CEF700217BAD00737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00000000004284420084A5
      420042E72100FFFFFF0000000000FFFFFF000000000084A54200428442004284
      420084A5630000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000087BAD006BD6EF00B5F7FF00E7FFFF00EFFFFF00F7FFFF00EFFFFF00D6E7
      EF00A5DEEF00EFFFFF0010D6FF0000CEFF0021DEFF0042E7FF00A5E7EF00C6E7
      EF00DEF7F700E7FFFF00EFFFFF00D6F7FF00D6F7FF009CEFFF003984AD007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000000084A5420084A5
      420084A5420084A5420000000000FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000087BAD004A94B5004A94B5004A94B5004A94B5004A8CAD004284AD004284
      AD003984AD00D6E7EF0031DEFF0000CEFF0010D6FF0031D6F70021638C003173
      9C004284AD004284AD004284AD004284AD004284AD004284AD004284AD007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006B9C00BDF7FF0073E7FF0008D6FF0008CEFF0018B5DE00006B9C007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006B9C00C6DEEF00BDF7FF0018D6FF0000CEFF00007BAD00006B9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000217BAD00F7FFFF0021DEFF0000CEFF0018638C00737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000217BA500C6DEEF004AE7FF0010C6F700315A7300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084422100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000217BA50094EFFF0010A5CE0073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008442210084422100844221008442210084422100844221008442
      2100844221008442210084422100844221008442210084422100844221008442
      2100844221008442210084422100844221008442210084422100844221000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000217BA500D6FFFF001884B50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000217BA500217BA500217BA50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      F800001FFF9FF9FF0000000000000000F800001FFF0FF0FF0000000000000000
      F800001FFF07E0FF0000000000000000F800001FFF03C0FF0000000000000000
      F800001FFF0181FF0000000000000000F800001FFF8001FF0000000000000000
      F800001FFF8003FF0000000000000000F800001FFFC003FF0000000000000000
      F800001FFFC003FF0000000000000000F800001FFF8001FF0000000000000000
      F800001FFF0000FF0000000000000000F800001FFE00007F0000000000000000
      F800001FFC00003F0000000000000000F800001FF800001F0000000000000000
      F800001FF000000F0000000000000000F800001FF000000F0000000000000000
      F800001FFFF00FFF0000000000000000F800001FFFF01FFF0000000000000000
      F800001FFFF81FFF0000000000000000F800001FFFF83FFF0000000000000000
      F800001FFFFC3FFF0000000000000000F800001FFFFC7FFF0000000000000000
      FFFFFFFFFFFC7FFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 409
    object N1: TMenuItem
      Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1075#1088#1072#1092#1080#1082' '#1087#1086' '#1095#1072#1089#1072#1084
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1075#1088#1072#1092#1080#1082' '#1087#1086' '#1076#1085#1103#1084' '#1085#1077#1076#1077#1083#1080
      OnClick = N2Click
    end
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 520
    Top = 369
    StyleName = 'XP Style'
    object acCalc: TAction
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100
      ImageIndex = 37
      OnExecute = acCalcExecute
    end
    object acAZStoXLS: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' XLS'
      ImageIndex = 38
      OnExecute = acAZStoXLSExecute
    end
  end
  object InitQ: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      
        '  Dbms_Session.SET_NLS('#39'NLS_DATE_FORMAT'#39','#39#39#39'dd.mm.yyyy hh24:mi'#39#39 +
        #39');'
      '  Dbms_Session.SET_NLS('#39'NLS_LANGUAGE'#39','#39#39#39'RUSSIAN'#39#39#39');'
      'END;')
    Session = OracleSession1
    Left = 120
    Top = 361
  end
  object buffer: TOracleSession
    Cursor = crArrow
    DesignConnection = True
    LogonUsername = 'azsbuffer'
    LogonPassword = 'azsbuffer'
    LogonDatabase = 'BUH'
    Left = 688
    Top = 394
  end
  object OracleDataSet1: TOracleDataSet
    Session = buffer
    Left = 120
    Top = 402
  end
  object decMinsQ: TOracleDataSet
    SQL.Strings = (
      'select sum(volume*pl) as s, count(rn) as c, h as ho from'
      '('
      'select /*+ INDEX(azsrepout I_AZSREPOUT_REP_DATE_I) */'
      '   azsrepout.rn, '
      
        #9#9'decode(scriptcode, 0, volume, 3, 0, 10, -volume, 11, -volume, ' +
        'volume/100) as volume,'
      
        '--to_char(rep_date, '#39'day'#39') as day, to_char(rep_date, '#39'dd.mm.yyyy' +
        #39') as d, '
      'substr(to_char(rep_date, '#39'HH24:MI'#39'), 1, 4) as h, pl'
      'from azsrepout, files'
      'where rep_date >= :st'
      'and rep_date <= :en'
      'and azsrepout.prn = files.rn'
      'and files.azs = '#39'041'#39
      ''
      'and type <> '#39'F'#39
      'and scriptcode <> 3'
      'and snomen like '#39'%'#39
      ')'
      'group by h'
      '')
    Session = buffer
    BeforeOpen = decMinsQBeforeOpen
    Left = 185
    Top = 203
  end
  object pbeListQ: TOracleDataSet
    SQL.Strings = (
      
        'select rn, bunit_mnemo from dicbunts where bunit_mnemo not like ' +
        '('#39#1059#1055#1056'%'#39') order by bunit_mnemo')
    QBEDefinition.QBEFieldDefs = {
      040000000200000002000000524E0100000000000B00000042554E49545F4D4E
      454D4F010000000000}
    Session = OracleSession1
    Left = 320
    Top = 353
    object pbeListQRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object pbeListQBUNIT_MNEMO: TStringField
      FieldName = 'BUNIT_MNEMO'
      Required = True
    end
  end
  object DataSource3: TDataSource
    DataSet = pbeListQ
    Left = 584
    Top = 425
  end
  object azsINpbe: TOracleDataSet
    SQL.Strings = (
      'select rn, azs_number from azsazslistmt where store_type = 1'
      'and azs_pbe=:pbe '
      ''
      'order by azs_number')
    Variables.Data = {0300000001000000040000003A504245030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000002000000524E0100000000000A000000415A535F4E554D42
      4552010000000000}
    Session = OracleSession1
    Left = 384
    Top = 361
    object azsINpbeRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object azsINpbeAZS_NUMBER: TStringField
      FieldName = 'AZS_NUMBER'
      Required = True
    end
  end
end
