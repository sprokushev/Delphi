object f_OneSF: Tf_OneSF
  Left = 187
  Top = 128
  Width = 812
  Height = 558
  Caption = ' '#1057#1095#1077#1090'-'#1092#1072#1082#1090#1091#1088#1072' '
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
  object gr_KvitList: TGroupBox
    Left = 0
    Top = 26
    Width = 804
    Height = 115
    Align = alTop
    Caption = #1044#1072#1090#1072'  '#8470#8470' '#1082#1074#1080#1090#1072#1085#1094#1080#1081'/'#1072#1082#1090#1086#1074' '
    TabOrder = 0
    object Edit1: TEdit
      Left = 150
      Top = 19
      Width = 121
      Height = 21
      BevelInner = bvSpace
      BevelOuter = bvRaised
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 286
      Top = 19
      Width = 121
      Height = 21
      TabOrder = 2
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit4: TEdit
      Left = 558
      Top = 19
      Width = 121
      Height = 21
      TabOrder = 4
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit7: TEdit
      Left = 149
      Top = 51
      Width = 121
      Height = 21
      TabOrder = 7
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit8: TEdit
      Left = 285
      Top = 51
      Width = 121
      Height = 21
      TabOrder = 8
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit9: TEdit
      Left = 421
      Top = 51
      Width = 121
      Height = 21
      TabOrder = 9
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit10: TEdit
      Left = 557
      Top = 51
      Width = 121
      Height = 21
      TabOrder = 10
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit11: TEdit
      Left = 688
      Top = 51
      Width = 121
      Height = 21
      TabOrder = 11
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit12: TEdit
      Left = 13
      Top = 83
      Width = 121
      Height = 21
      TabOrder = 12
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit13: TEdit
      Left = 149
      Top = 83
      Width = 121
      Height = 21
      TabOrder = 13
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit14: TEdit
      Left = 285
      Top = 83
      Width = 121
      Height = 21
      TabOrder = 14
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit15: TEdit
      Left = 421
      Top = 83
      Width = 121
      Height = 21
      TabOrder = 15
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit16: TEdit
      Left = 557
      Top = 83
      Width = 121
      Height = 21
      TabOrder = 16
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit17: TEdit
      Left = 689
      Top = 83
      Width = 121
      Height = 21
      TabOrder = 17
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit3: TEdit
      Left = 422
      Top = 19
      Width = 121
      Height = 21
      TabOrder = 3
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit5: TEdit
      Left = 688
      Top = 19
      Width = 121
      Height = 21
      TabOrder = 5
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit6: TEdit
      Left = 13
      Top = 51
      Width = 121
      Height = 21
      TabOrder = 6
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object e_DateKvit: TDateTimePicker
      Left = 14
      Top = 19
      Width = 122
      Height = 21
      Date = 37809.509151875000000000
      Time = 37809.509151875000000000
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 141
    Width = 804
    Height = 95
    Align = alTop
    Caption = ' '#1056#1077#1082#1074#1080#1079#1080#1090#1099' '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 70
      Height = 13
      Caption = ' '#8470' '#1044#1086#1075#1086#1074#1086#1088#1072' '
    end
    object DBText1: TDBText
      Left = 88
      Top = 24
      Width = 77
      Height = 14
      DataField = 'DOG_NUMBER'
      DataSource = ds_Rekvizits
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 168
      Top = 24
      Width = 11
      Height = 13
      Caption = #1086#1090
    end
    object DBText2: TDBText
      Left = 190
      Top = 24
      Width = 77
      Height = 14
      DataField = 'DOG_DATE'
      DataSource = ds_Rekvizits
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 352
      Top = 24
      Width = 457
      Height = 14
      DataField = 'PLAT_NAME'
      DataSource = ds_Rekvizits
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 272
      Top = 24
      Width = 64
      Height = 13
      Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
    end
    object Label4: TLabel
      Left = 12
      Top = 72
      Width = 42
      Height = 13
      Caption = #1057#1090#1072#1085#1094#1080#1103
    end
    object DBText4: TDBText
      Left = 88
      Top = 72
      Width = 167
      Height = 14
      DataField = 'STAN_NAME'
      DataSource = ds_Rekvizits
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 272
      Top = 48
      Width = 59
      Height = 13
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
    end
    object DBText5: TDBText
      Left = 352
      Top = 48
      Width = 457
      Height = 14
      DataField = 'POLUCH_NAME'
      DataSource = ds_Rekvizits
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 272
      Top = 72
      Width = 66
      Height = 13
      Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
    end
    object DBText6: TDBText
      Left = 352
      Top = 72
      Width = 457
      Height = 14
      DataField = 'POTR_NAME'
      DataSource = ds_Rekvizits
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 12
      Top = 48
      Width = 56
      Height = 13
      Caption = #8470' '#1079#1072#1076#1072#1085#1080#1103
    end
    object DBText10: TDBText
      Left = 88
      Top = 48
      Width = 73
      Height = 14
      DataField = 'NOM_ZD'
      DataSource = ds_Rekvizits
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 164
      Top = 48
      Width = 55
      Height = 13
      Caption = #8470' '#1091#1089#1083#1086#1074#1080#1103
    end
    object DBText11: TDBText
      Left = 228
      Top = 48
      Width = 35
      Height = 14
      DataField = 'USL_NUMBER'
      DataSource = ds_Rekvizits
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 236
    Width = 804
    Height = 295
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 2
    object GroupBox2: TGroupBox
      Left = 0
      Top = 0
      Width = 337
      Height = 295
      Align = alLeft
      Caption = ' '#1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090'/'#1094#1077#1085#1072' '
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 115
        Top = 72
        Height = 221
      end
      object DBGridEh1: TDBGridEh
        Left = 118
        Top = 72
        Width = 217
        Height = 221
        Align = alClient
        DataSource = ds_Prices
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
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
            Checkboxes = True
            EditButtons = <>
            FieldName = 'SELECTED'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Width = 22
          end
          item
            EditButtons = <>
            FieldName = 'CENA'
            Footers = <>
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'CENA_OTP'
            Footers = <>
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'BEGIN_DATE'
            Footers = <>
            Width = 62
          end
          item
            EditButtons = <>
            FieldName = 'END_DATE'
            Footers = <>
          end>
      end
      object Panel3: TPanel
        Left = 2
        Top = 15
        Width = 333
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object DBText9: TDBText
          Left = 132
          Top = 25
          Width = 198
          Height = 28
          DataField = 'CAT_CEN_NAME'
          DataSource = ds_Rekvizits
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object DBText8: TDBText
          Left = 98
          Top = 25
          Width = 28
          Height = 14
          DataField = 'CAT_CEN_ID'
          DataSource = ds_Rekvizits
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 11
          Top = 25
          Width = 82
          Height = 13
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1094#1077#1085#1099
        end
        object DBText7: TDBText
          Left = 11
          Top = 1
          Width = 318
          Height = 14
          DataField = 'LONG_NAME_NPR'
          DataSource = ds_Rekvizits
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object DBGridEh3: TDBGridEh
        Left = 2
        Top = 72
        Width = 113
        Height = 221
        Align = alLeft
        DataSource = ds_PricesGroup
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        HorzScrollBar.Visible = False
        TabOrder = 2
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
            FieldName = 'ABBR_NPR'
            Footers = <>
          end>
      end
    end
    object Panel2: TPanel
      Left = 337
      Top = 0
      Width = 467
      Height = 295
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 467
        Height = 72
        Align = alTop
        Caption = ' '#1057#1090#1088#1072#1093#1086#1074#1082#1072'/'#1042#1086#1079#1085#1072#1075#1088#1072#1078#1076#1077#1085#1080#1077' '
        TabOrder = 0
        object Label7: TLabel
          Left = 16
          Top = 16
          Width = 262
          Height = 13
          Caption = #1042#1086#1079#1085#1072#1075#1088#1072#1078#1076#1077#1085#1080#1077' '#1079#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088#1086#1074#1082#1080
        end
        object Label11: TLabel
          Left = 296
          Top = 16
          Width = 42
          Height = 13
          Caption = '0 '#1088'/'#1090#1085'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 16
          Top = 32
          Width = 457
          Height = 13
          AutoSize = False
          Caption = 
            '----------------------------------------------------------------' +
            '-----------------'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 16
          Top = 48
          Width = 457
          Height = 13
          AutoSize = False
          Caption = 
            '----------------------------------------------------------------' +
            '-----------------'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 72
        Width = 467
        Height = 223
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = ds_TempBillKvit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        ParentFont = False
        PopupMenu = PopupMenu1
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Visible = False
        OnGetCellParams = DBGridEh2GetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NUM_KVIT'
            Footer.Value = #1048#1090#1086#1075#1086
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #8470' '#1050#1074#1080#1090#1072#1085#1094#1080#1080
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'NUM_CIST'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #8470' '#1062#1080#1089#1090#1077#1088#1085#1099' / '#1072#1074#1090#1086#1084#1072#1096#1080#1085#1099
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footer.FieldName = 'VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1042#1077#1089
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'CENA'
            Footer.FieldName = 'CENA'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072' '#1073'/'#1085
          end
          item
            EditButtons = <>
            FieldName = 'SUM_PROD'
            Footer.FieldName = 'SUM_PROD'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072' '#1079#1072' '#1087#1088#1086#1076#1091#1082#1090
          end
          item
            EditButtons = <>
            FieldName = 'SUM_AKCIZ'
            Footer.FieldName = 'SUM_AKCIZ'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1040#1082#1094#1080#1079
          end
          item
            EditButtons = <>
            FieldName = 'SUM_PROD_NDS'
            Footer.FieldName = 'SUM_PROD_NDS'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1053#1044#1057' '#1079#1072' '#1087#1088#1086#1076#1091#1082#1090
          end
          item
            EditButtons = <>
            FieldName = 'TARIF'
            Footer.FieldName = 'TARIF'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1058#1072#1088#1080#1092
          end
          item
            EditButtons = <>
            FieldName = 'TARIF_NDS'
            Footer.FieldName = 'TARIF_NDS'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1053#1044#1057' '#1058#1072#1088#1080#1092
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'TARIF_GUARD'
            Footer.FieldName = 'TARIF_GUARD'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'TARIF_GUARD_NDS'
            Footer.FieldName = 'TARIF_GUARD_NDS'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'TARIF19'
            Footer.FieldName = 'TARIF19'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1058#1072#1088#1080#1092' 19'#1089#1093
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'SUM_VOZN11'
            Footer.FieldName = 'SUM_VOZN11'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1042#1086#1079#1085' '#1052#1055#1057
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'SUM_VOZN11_NDS'
            Footer.FieldName = 'SUM_VOZN11_NDS'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1053#1044#1057' '#1042#1086#1079#1085' '#1052#1055#1057
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'SUM_VOZN12'
            Footer.FieldName = 'SUM_VOZN12'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1042#1086#1079#1085' '#1089#1086#1073#1089#1090#1074
          end
          item
            EditButtons = <>
            FieldName = 'SUM_VOZN12_NDS'
            Footer.FieldName = 'SUM_VOZN12_NDS'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1053#1044#1057' '#1042#1086#1079#1085' '#1089#1086#1073#1089#1090#1074
          end
          item
            EditButtons = <>
            FieldName = 'SUM_STRAH'
            Footer.FieldName = 'SUM_STRAH'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1090#1088#1072#1093#1086#1074#1082#1072
          end
          item
            EditButtons = <>
            FieldName = 'TOTAL_SUM'
            Footer.FieldName = 'TOTAL_SUM'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            EditButtons = <>
            FieldName = 'SVED_NUM'
            Footers = <>
            Title.Caption = #1057#1074#1077#1076#1077#1085#1080#1077
          end>
      end
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 804
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem3: TTBItem
        Action = acNewSF
        DisplayMode = nbdmImageAndText
        ImageIndex = 0
        Images = f_main.img_Common
      end
      object TBItem1: TTBItem
        Action = acSFCalc
        DisplayMode = nbdmImageAndText
        ImageIndex = 37
        Images = f_main.img_Common
      end
      object TBItem2: TTBItem
        Action = acWriteSF
        DisplayMode = nbdmImageAndText
        ImageIndex = 8
        Images = f_main.img_Common
      end
    end
  end
  object q_FillTempBillKvit: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      
        '  FILL_TEMP_BILLS_KVIT (TO_DATE('#39'03.07.2003'#39','#39'dd.mm.yyyy'#39'),95422' +
        '2);'
      'END;')
    Session = ora_Session
    Left = 488
    Top = 144
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Left = 456
    Top = 144
  end
  object t_TempGroupByKvit: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_TEMP_BILL_KVIT_GROUP_BY_KVIT')
    Session = ora_Session
    Left = 488
    Top = 176
  end
  object op_ForBills: TOraclePackage
    Session = ora_Session
    PackageName = 'for_bills'
    Left = 520
    Top = 144
  end
  object ds_Rekvizits: TDataSource
    DataSet = t_Rekvizits
    Left = 592
    Top = 144
  end
  object t_Rekvizits: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_TEMP_BILL_KVIT_REKVIZITS')
    ReadBuffer = 1
    QBEDefinition.QBEFieldDefs = {
      030000000C0000000A000000444F475F4E554D42455201000000000800000044
      4F475F44415445010000000009000000504C41545F4E414D4501000000000B00
      0000504F4C5543485F4E414D45010000000009000000504F54525F4E414D4501
      00000000090000005354414E5F4E414D4501000000000D0000004C4F4E475F4E
      414D455F4E505201000000000A0000004341545F43454E5F494401000000000A
      00000055534C5F4E554D42455201000000000C0000004341545F43454E5F4E41
      4D4501000000000600000049445F4E50520100000000060000004E4F4D5F5A44
      0100000000}
    Session = ora_Session
    Left = 560
    Top = 145
    object t_RekvizitsDOG_NUMBER: TStringField
      FieldName = 'DOG_NUMBER'
      Required = True
      Size = 30
    end
    object t_RekvizitsDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
      Required = True
    end
    object t_RekvizitsPLAT_NAME: TStringField
      FieldName = 'PLAT_NAME'
      Required = True
      Size = 60
    end
    object t_RekvizitsPOLUCH_NAME: TStringField
      FieldName = 'POLUCH_NAME'
      Required = True
      Size = 60
    end
    object t_RekvizitsPOTR_NAME: TStringField
      FieldName = 'POTR_NAME'
      Required = True
      Size = 60
    end
    object t_RekvizitsSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Size = 95
    end
    object t_RekvizitsID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object t_RekvizitsLONG_NAME_NPR: TStringField
      FieldName = 'LONG_NAME_NPR'
      Required = True
      Size = 250
    end
    object t_RekvizitsCAT_CEN_ID: TIntegerField
      FieldName = 'CAT_CEN_ID'
      Required = True
    end
    object t_RekvizitsUSL_NUMBER: TIntegerField
      FieldName = 'USL_NUMBER'
      Required = True
    end
    object t_RekvizitsCAT_CEN_NAME: TStringField
      FieldName = 'CAT_CEN_NAME'
      Required = True
      Size = 70
    end
    object t_RekvizitsNOM_ZD: TStringField
      FieldName = 'NOM_ZD'
      Required = True
      Size = 12
    end
  end
  object t_Prices: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_TEMP_BILL_KVIT_PRICES'
      ''
      'ORDER BY begin_date DESC')
    QBEDefinition.QBEFieldDefs = {
      03000000080000000400000043454E4101000000000800000043454E415F4F54
      5001000000000A000000424547494E5F44415445010000000008000000454E44
      5F444154450100000000020000004944010000000008000000414242525F4E50
      5201000000000600000049445F4E505201000000000800000053454C45435445
      440100000000}
    Session = ora_Session
    BeforeOpen = t_PricesBeforeOpen
    Left = 562
    Top = 176
    object t_PricesCENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1073'/'#1085
      DisplayWidth = 10
      FieldName = 'CENA'
      Required = True
      DisplayFormat = '#.00'
    end
    object t_PricesCENA_OTP: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 10
      FieldName = 'CENA_OTP'
      Required = True
      DisplayFormat = '#.00'
    end
    object t_PricesBEGIN_DATE: TDateTimeField
      DisplayLabel = #1057
      DisplayWidth = 12
      FieldName = 'BEGIN_DATE'
      Required = True
    end
    object t_PricesEND_DATE: TDateTimeField
      DisplayLabel = #1055#1086
      DisplayWidth = 13
      FieldName = 'END_DATE'
    end
    object t_PricesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object t_PricesABBR_NPR: TStringField
      DisplayLabel = #1053'/'#1087#1088
      FieldName = 'ABBR_NPR'
    end
    object t_PricesID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object t_PricesSELECTED: TFloatField
      DisplayLabel = '+'
      FieldName = 'SELECTED'
    end
  end
  object ds_Prices: TDataSource
    DataSet = t_Prices
    Left = 592
    Top = 176
  end
  object t_TempBillKvit: TOracleDataSet
    SQL.Strings = (
      
        'SELECT V_TEMP_BILL_KVIT.rowid,V_TEMP_BILL_KVIT.* FROM V_TEMP_BIL' +
        'L_KVIT')
    QBEDefinition.QBEFieldDefs = {
      0300000023000000070000004B5649545F49440100000000080000004E554D5F
      4B56495401000000000D0000005445524D494E414C5F4E414D4501000000000B
      0000004F53555345525F4E414D450100000000080000004E554D5F4349535401
      0000000003000000564553010000000005000000544152494601000000000700
      000054415249463139010000000008000000535645445F4E554D010000000008
      00000053554D5F50524F4401000000000900000053554D5F414B43495A010000
      00000C00000053554D5F50524F445F4E44530100000000090000005441524946
      5F4E445301000000000A00000053554D5F564F5A4E313101000000000E000000
      53554D5F564F5A4E31315F4E445301000000000A00000053554D5F564F5A4E31
      3201000000000E00000053554D5F564F5A4E31325F4E44530100000000090000
      0053554D5F535452414801000000000400000043454E41010000000008000000
      43454E415F4F5450010000000009000000444154455F43454E41010000000009
      000000444154455F4B56495401000000000900000050524F544F5F4E554D0100
      0000000A00000050524F544F5F4441544501000000000900000043454E415F56
      4F5A4E01000000000B00000054415249465F475541524401000000000F000000
      54415249465F47554152445F4E44530100000000070000004E4143454E4B4101
      00000000070000004E554D5F414B5401000000000B00000042494C4C5F504F53
      5F49440100000000080000004E4F5F414B43495A01000000000D0000004E5052
      5F5052494345535F494401000000000A0000004341545F43454E5F4944010000
      00000600000049445F4E5052010000000008000000414242525F4E5052010000
      0000}
    UniqueFields = 'kvit_id'
    CountAllRecords = True
    UpdatingTable = 'temp_bill_kvit'
    Session = ora_Session
    OnCalcFields = t_TempBillKvitCalcFields
    Left = 632
    Top = 144
    object t_TempBillKvitKVIT_ID: TFloatField
      FieldName = 'KVIT_ID'
    end
    object t_TempBillKvitNUM_KVIT: TFloatField
      FieldName = 'NUM_KVIT'
    end
    object t_TempBillKvitTERMINAL_NAME: TStringField
      FieldName = 'TERMINAL_NAME'
      Size = 30
    end
    object t_TempBillKvitOSUSER_NAME: TStringField
      FieldName = 'OSUSER_NAME'
      Size = 30
    end
    object t_TempBillKvitNUM_CIST: TStringField
      FieldName = 'NUM_CIST'
      Size = 10
    end
    object t_TempBillKvitVES: TFloatField
      FieldName = 'VES'
      Required = True
      DisplayFormat = '#0.000'
    end
    object t_TempBillKvitTARIF: TFloatField
      FieldName = 'TARIF'
      Required = True
      DisplayFormat = '#0.00'
    end
    object t_TempBillKvitTARIF19: TFloatField
      FieldName = 'TARIF19'
      Required = True
      DisplayFormat = '#0.00'
    end
    object t_TempBillKvitSVED_NUM: TIntegerField
      FieldName = 'SVED_NUM'
    end
    object t_TempBillKvitSUM_PROD: TFloatField
      FieldName = 'SUM_PROD'
      Required = True
      DisplayFormat = '#0.00'
    end
    object t_TempBillKvitSUM_AKCIZ: TFloatField
      FieldName = 'SUM_AKCIZ'
      Required = True
      DisplayFormat = '#0.00'
    end
    object t_TempBillKvitSUM_PROD_NDS: TFloatField
      FieldName = 'SUM_PROD_NDS'
      Required = True
      DisplayFormat = '#0.00'
    end
    object t_TempBillKvitTARIF_NDS: TFloatField
      FieldName = 'TARIF_NDS'
      Required = True
      DisplayFormat = '#0.00'
    end
    object t_TempBillKvitSUM_VOZN11: TFloatField
      FieldName = 'SUM_VOZN11'
      Required = True
      DisplayFormat = '#0.00'
    end
    object t_TempBillKvitSUM_VOZN11_NDS: TFloatField
      FieldName = 'SUM_VOZN11_NDS'
      Required = True
      DisplayFormat = '#0.00'
    end
    object t_TempBillKvitSUM_VOZN12: TFloatField
      FieldName = 'SUM_VOZN12'
      Required = True
      DisplayFormat = '#0.00'
    end
    object t_TempBillKvitSUM_VOZN12_NDS: TFloatField
      FieldName = 'SUM_VOZN12_NDS'
      Required = True
      DisplayFormat = '#0.00'
    end
    object t_TempBillKvitSUM_STRAH: TFloatField
      FieldName = 'SUM_STRAH'
      Required = True
      DisplayFormat = '#0.00'
    end
    object t_TempBillKvitCENA: TFloatField
      FieldName = 'CENA'
      DisplayFormat = '#.00'
    end
    object t_TempBillKvitCENA_OTP: TFloatField
      FieldName = 'CENA_OTP'
      DisplayFormat = '#.00'
    end
    object t_TempBillKvitDATE_CENA: TDateTimeField
      FieldName = 'DATE_CENA'
    end
    object t_TempBillKvitTOTAL_SUM: TFloatField
      DisplayLabel = #1048#1090#1086#1075#1086
      FieldKind = fkCalculated
      FieldName = 'TOTAL_SUM'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object t_TempBillKvitDATE_KVIT: TDateTimeField
      FieldName = 'DATE_KVIT'
    end
    object t_TempBillKvitPROTO_NUM: TStringField
      FieldName = 'PROTO_NUM'
      Size = 15
    end
    object t_TempBillKvitPROTO_DATE: TDateTimeField
      FieldName = 'PROTO_DATE'
    end
    object t_TempBillKvitCENA_VOZN: TFloatField
      FieldName = 'CENA_VOZN'
    end
    object t_TempBillKvitTARIF_GUARD: TFloatField
      DisplayLabel = #1054#1093#1088#1072#1085#1072
      FieldName = 'TARIF_GUARD'
    end
    object t_TempBillKvitTARIF_GUARD_NDS: TFloatField
      DisplayLabel = #1053#1044#1057' '#1054#1093#1088#1072#1085#1072
      FieldName = 'TARIF_GUARD_NDS'
    end
    object t_TempBillKvitNACENKA: TFloatField
      FieldName = 'NACENKA'
    end
    object t_TempBillKvitNUM_AKT: TFloatField
      FieldName = 'NUM_AKT'
    end
    object t_TempBillKvitBILL_POS_ID: TFloatField
      FieldName = 'BILL_POS_ID'
    end
    object t_TempBillKvitNO_AKCIZ: TIntegerField
      FieldName = 'NO_AKCIZ'
    end
    object t_TempBillKvitNPR_PRICES_ID: TFloatField
      FieldName = 'NPR_PRICES_ID'
    end
    object t_TempBillKvitCAT_CEN_ID: TFloatField
      FieldName = 'CAT_CEN_ID'
    end
    object t_TempBillKvitID_NPR: TStringField
      FieldName = 'ID_NPR'
      Size = 5
    end
    object t_TempBillKvitABBR_NPR: TStringField
      FieldName = 'ABBR_NPR'
    end
  end
  object ds_TempBillKvit: TDataSource
    DataSet = t_TempBillKvit
    Left = 664
    Top = 144
  end
  object ActionManager1: TActionManager
    Left = 696
    Top = 147
    StyleName = 'XP Style'
    object acSFCalc: TAction
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1089#1091#1084#1084#1099' <F5>'
      ShortCut = 116
      OnExecute = acSFCalcExecute
    end
    object acWriteSF: TAction
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100' <F9>'
      Enabled = False
      ShortCut = 120
      OnExecute = acWriteSFExecute
    end
    object acNewSF: TAction
      Caption = #1053#1086#1074#1099#1081' '#1089#1095#1077#1090' <F2>'
      ShortCut = 113
      OnExecute = acNewSFExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 632
    Top = 179
    object N1: TMenuItem
      Action = acSFCalc
    end
  end
  object t_PricesGroup: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT id_npr,abbr_npr FROM V_TEMP_BILL_KVIT_PRICES')
    QBEDefinition.QBEFieldDefs = {
      030000000200000008000000414242525F4E505201000000000600000049445F
      4E50520100000000}
    Session = ora_Session
    BeforeOpen = t_PricesBeforeOpen
    AfterScroll = t_PricesGroupAfterScroll
    Left = 562
    Top = 207
    object t_PricesGroupID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object t_PricesGroupABBR_NPR: TStringField
      DisplayLabel = #1053'/'#1087#1088
      FieldName = 'ABBR_NPR'
    end
  end
  object ds_PricesGroup: TDataSource
    DataSet = t_PricesGroup
    Left = 592
    Top = 207
  end
end
