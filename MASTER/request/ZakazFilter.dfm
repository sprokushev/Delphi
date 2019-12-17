object f_ZakazFilter: Tf_ZakazFilter
  Left = 202
  Top = 212
  Width = 760
  Height = 430
  Caption = #1047#1072#1082#1072#1079#1099' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1077#1081': '#1054#1090#1073#1086#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 648
    Top = 0
    Width = 104
    Height = 403
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object btOk: TBitBtn
      Left = 8
      Top = 24
      Width = 83
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = btOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btCancel: TBitBtn
      Left = 8
      Top = 56
      Width = 83
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
    object btClear: TBitBtn
      Left = 8
      Top = 88
      Width = 83
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 2
      OnClick = btClearClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 648
    Height = 403
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 640
        Height = 89
        Align = alTop
        TabOrder = 0
        object Label4: TLabel
          Left = 18
          Top = 16
          Width = 72
          Height = 13
          Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#8470
        end
        object Label5: TLabel
          Left = 216
          Top = 14
          Width = 15
          Height = 13
          Caption = #1087#1086':'
        end
        object Label6: TLabel
          Left = 338
          Top = 14
          Width = 26
          Height = 13
          Caption = #1044#1072#1090#1072
        end
        object Label7: TLabel
          Left = 488
          Top = 15
          Width = 15
          Height = 13
          Caption = #1087#1086':'
        end
        object Label10: TLabel
          Left = 18
          Top = 39
          Width = 65
          Height = 13
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#8470
        end
        object Label11: TLabel
          Left = 216
          Top = 40
          Width = 15
          Height = 13
          Caption = #1087#1086':'
        end
        object Label12: TLabel
          Left = 338
          Top = 38
          Width = 26
          Height = 13
          Caption = #1044#1072#1090#1072
        end
        object Label13: TLabel
          Left = 488
          Top = 38
          Width = 15
          Height = 13
          Caption = #1087#1086':'
        end
        object Label17: TLabel
          Left = 18
          Top = 62
          Width = 135
          Height = 13
          Caption = #8470' '#1079#1072#1103#1074#1082#1080' '#1080#1079' '#1060#1048#1053#1040#1053#1057#1054#1042':'
        end
        object Label18: TLabel
          Left = 104
          Top = 15
          Width = 9
          Height = 13
          Caption = #1089':'
        end
        object Label19: TLabel
          Left = 376
          Top = 14
          Width = 9
          Height = 13
          Caption = #1089':'
        end
        object Label20: TLabel
          Left = 104
          Top = 38
          Width = 9
          Height = 13
          Caption = #1089':'
        end
        object Label21: TLabel
          Left = 376
          Top = 38
          Width = 9
          Height = 13
          Caption = #1089':'
        end
        object edClientNumFrom: TEdit
          Left = 120
          Top = 10
          Width = 89
          Height = 21
          TabOrder = 0
        end
        object edClientNumTo: TEdit
          Left = 240
          Top = 10
          Width = 89
          Height = 21
          TabOrder = 1
        end
        object edInputNumFrom: TEdit
          Left = 120
          Top = 34
          Width = 89
          Height = 21
          TabOrder = 2
        end
        object edInputNumTo: TEdit
          Left = 240
          Top = 34
          Width = 89
          Height = 21
          TabOrder = 3
        end
        object edNomZd: TEdit
          Left = 160
          Top = 58
          Width = 169
          Height = 21
          TabOrder = 4
        end
        object edClientDatFrom: TDateEdit
          Left = 392
          Top = 10
          Width = 89
          Height = 21
          DialogTitle = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099
          NumGlyphs = 2
          Weekends = [Sun, Sat]
          YearDigits = dyFour
          TabOrder = 5
        end
        object edClientDatTo: TDateEdit
          Left = 512
          Top = 10
          Width = 89
          Height = 21
          DialogTitle = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099
          NumGlyphs = 2
          Weekends = [Sun, Sat]
          YearDigits = dyFour
          TabOrder = 6
        end
        object edInputDatFrom: TDateEdit
          Left = 392
          Top = 34
          Width = 89
          Height = 21
          DialogTitle = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099
          NumGlyphs = 2
          Weekends = [Sun, Sat]
          YearDigits = dyFour
          TabOrder = 7
        end
        object edInputDatTo: TDateEdit
          Left = 512
          Top = 34
          Width = 89
          Height = 21
          DialogTitle = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099
          NumGlyphs = 2
          Weekends = [Sun, Sat]
          YearDigits = dyFour
          TabOrder = 8
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 89
        Width = 640
        Height = 130
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 17
          Top = 20
          Width = 47
          Height = 13
          Caption = #1060#1080#1083#1080#1072#1083': '
        end
        object Label2: TLabel
          Left = 17
          Top = 43
          Width = 99
          Height = 13
          Caption = #1053#1077#1092#1090#1077#1073#1072#1079#1072' ('#1089#1082#1083#1072#1076'):'
        end
        object Label15: TLabel
          Left = 17
          Top = 66
          Width = 45
          Height = 13
          Caption = #1057#1090#1072#1085#1094#1080#1103':'
        end
        object Label16: TLabel
          Left = 17
          Top = 89
          Width = 89
          Height = 13
          Caption = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100':'
        end
        object btPoluch: TRxSpeedButton
          Left = 609
          Top = 84
          Width = 22
          Height = 22
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C1F7C1F7C000000000000
            000000001F7C0000FF7F0000000000001F7C1F7C1F7C1F7C1F7C0000FF7F0000
            000000001F7C0000FF7F0000000000001F7C1F7C1F7C1F7C1F7C0000FF7F0000
            000000001F7C00000000000000000000000000001F7C00000000000000000000
            000000001F7C00000000FF7F000000000000000000000000FF7F000000000000
            000000001F7C00000000FF7F0000000000001F7C00000000FF7F000000000000
            000000001F7C00000000FF7F0000000000001F7C00000000FF7F000000000000
            000000001F7C1F7C000000000000000000000000000000000000000000000000
            00001F7C1F7C1F7C1F7C0000FF7F0000000000001F7C0000FF7F000000000000
            1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C00000000000000000000
            1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C0000000000001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00001F7C1F7C1F7C0000FF7F00001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C0000000000001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
          OnClick = btPoluchClick
        end
        object DBText1: TDBText
          Left = 118
          Top = 109
          Width = 513
          Height = 17
          DataField = 'PREDPR_NAME'
          DataSource = dsPoluch
        end
        object cbFilial: TRxDBLookupCombo
          Left = 119
          Top = 15
          Width = 514
          Height = 21
          Hint = #1060#1080#1083#1080#1072#1083
          DropDownCount = 20
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1080#1083#1080#1072#1083'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = dsFilial
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object cbNeftebasa: TRxDBLookupCombo
          Left = 119
          Top = 39
          Width = 514
          Height = 21
          Hint = #1060#1080#1083#1080#1072#1083
          DropDownCount = 20
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1077#1092#1090#1077#1073#1072#1079#1091' ('#1089#1082#1083#1072#1076')>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = dsNeftebasa
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object edStanKod: TEdit
          Left = 119
          Top = 62
          Width = 90
          Height = 21
          TabOrder = 2
          OnChange = edStanKodChange
        end
        object cbStan: TRxDBLookupCombo
          Left = 212
          Top = 62
          Width = 421
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1090#1072#1085#1094#1080#1102'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'STAN_NAME'
          LookupSource = dsStan
          TabOrder = 3
          OnChange = cbStanChange
        end
        object cbPoluch: TRxDBLookupCombo
          Left = 118
          Top = 85
          Width = 483
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'SHORT_NAME'
          LookupSource = dsPoluch
          TabOrder = 4
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 219
        Width = 640
        Height = 110
        Align = alTop
        TabOrder = 2
        object Label3: TLabel
          Left = 16
          Top = 16
          Width = 64
          Height = 13
          Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090': '
        end
        object Label8: TLabel
          Left = 16
          Top = 62
          Width = 47
          Height = 13
          Caption = #1044#1086#1075#1086#1074#1086#1088':'
        end
        object Label14: TLabel
          Left = 16
          Top = 85
          Width = 80
          Height = 13
          Caption = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072':'
        end
        object btPlat: TRxSpeedButton
          Left = 609
          Top = 11
          Width = 22
          Height = 22
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C1F7C1F7C000000000000
            000000001F7C0000FF7F0000000000001F7C1F7C1F7C1F7C1F7C0000FF7F0000
            000000001F7C0000FF7F0000000000001F7C1F7C1F7C1F7C1F7C0000FF7F0000
            000000001F7C00000000000000000000000000001F7C00000000000000000000
            000000001F7C00000000FF7F000000000000000000000000FF7F000000000000
            000000001F7C00000000FF7F0000000000001F7C00000000FF7F000000000000
            000000001F7C00000000FF7F0000000000001F7C00000000FF7F000000000000
            000000001F7C1F7C000000000000000000000000000000000000000000000000
            00001F7C1F7C1F7C1F7C0000FF7F0000000000001F7C0000FF7F000000000000
            1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C00000000000000000000
            1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C0000000000001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00001F7C1F7C1F7C0000FF7F00001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C0000000000001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
          OnClick = btPlatClick
        end
        object DBText2: TDBText
          Left = 118
          Top = 37
          Width = 513
          Height = 17
          DataField = 'PREDPR_NAME'
          DataSource = dsPlat
        end
        object cbPlat: TRxDBLookupCombo
          Left = 117
          Top = 11
          Width = 484
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'SHORT_NAME'
          LookupSource = dsPlat
          TabOrder = 0
        end
        object edDog: TEdit
          Left = 117
          Top = 58
          Width = 132
          Height = 21
          TabOrder = 1
        end
        object cbPlanStru: TRxDBLookupCombo
          Left = 117
          Top = 81
          Width = 516
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1079#1080#1094#1080#1102' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1086#1082'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = dsPlanstru
          TabOrder = 2
        end
        object cbDog: TRxDBLookupCombo
          Left = 256
          Top = 58
          Width = 377
          Height = 21
          DropDownCount = 8
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1086#1075#1086#1074#1086#1088'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'DOG_NUMBER'
          LookupSource = dsDog
          TabOrder = 3
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 329
        Width = 640
        Height = 46
        Align = alClient
        TabOrder = 3
        object Label9: TLabel
          Left = 17
          Top = 16
          Width = 45
          Height = 13
          Caption = #1055#1088#1086#1076#1091#1082#1090':'
        end
        object Label22: TLabel
          Left = 17
          Top = 40
          Width = 66
          Height = 13
          Caption = #1047#1072#1074#1103#1083#1077#1085#1086', '#1090#1085
        end
        object Label23: TLabel
          Left = 17
          Top = 64
          Width = 72
          Height = 13
          Caption = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077', '#1090#1085
        end
        object Label24: TLabel
          Left = 328
          Top = 39
          Width = 12
          Height = 13
          Caption = #1074#1094
        end
        object Label26: TLabel
          Left = 17
          Top = 88
          Width = 72
          Height = 13
          Caption = #1054#1090#1075#1088#1091#1078#1077#1085#1086', '#1090#1085
        end
        object Label28: TLabel
          Left = 100
          Top = 39
          Width = 9
          Height = 13
          Caption = #1089':'
        end
        object Label29: TLabel
          Left = 204
          Top = 39
          Width = 15
          Height = 13
          Caption = #1087#1086':'
        end
        object Label36: TLabel
          Left = 348
          Top = 39
          Width = 9
          Height = 13
          Caption = #1089':'
        end
        object Label37: TLabel
          Left = 444
          Top = 63
          Width = 15
          Height = 13
          Caption = #1087#1086':'
        end
        object Label30: TLabel
          Left = 100
          Top = 63
          Width = 9
          Height = 13
          Caption = #1089':'
        end
        object Label31: TLabel
          Left = 204
          Top = 63
          Width = 15
          Height = 13
          Caption = #1087#1086':'
        end
        object Label32: TLabel
          Left = 328
          Top = 63
          Width = 12
          Height = 13
          Caption = #1074#1094
        end
        object Label33: TLabel
          Left = 348
          Top = 63
          Width = 9
          Height = 13
          Caption = #1089':'
        end
        object Label34: TLabel
          Left = 100
          Top = 87
          Width = 9
          Height = 13
          Caption = #1089':'
        end
        object Label35: TLabel
          Left = 204
          Top = 87
          Width = 15
          Height = 13
          Caption = #1087#1086':'
        end
        object Label38: TLabel
          Left = 328
          Top = 87
          Width = 12
          Height = 13
          Caption = #1074#1094
        end
        object Label39: TLabel
          Left = 348
          Top = 87
          Width = 9
          Height = 13
          Caption = #1089':'
        end
        object Label25: TLabel
          Left = 444
          Top = 39
          Width = 15
          Height = 13
          Caption = #1087#1086':'
        end
        object Label27: TLabel
          Left = 444
          Top = 87
          Width = 15
          Height = 13
          Caption = #1087#1086':'
        end
        object cbProd: TRxDBLookupCombo
          Left = 116
          Top = 12
          Width = 517
          Height = 21
          DropDownCount = 12
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1086#1076#1091#1082#1090'>'
          EmptyValue = '0'
          LookupField = 'ID_NPR'
          LookupDisplay = 'NAME_NPR'
          LookupSource = dsProd
          TabOrder = 0
        end
      end
    end
  end
  object oraSes: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'BUH'
    Left = 680
    Top = 152
  end
  object oraFilial: TOracleDataSet
    SQL.Strings = (
      
        'SELECT /*+ RULE */ DISTINCT org_structure.ID,org_structure.NAME,' +
        ' org_structure.plan_real'
      'FROM ORG_STRUCTURE, zakaz m'
      'WHERE org_structure.PLAN_REAL<>0'
      '  AND m.filial_id=org_structure.id'
      '  AND m.date_plan BETWEEN :BEGIN_DATE AND :END_DATE'
      'ORDER BY org_structure.plan_real')
    Variables.Data = {
      03000000020000000B0000003A424547494E5F444154450C0000000000000000
      000000090000003A454E445F444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = oraSes
    BeforeOpen = oraFilialBeforeOpen
    Left = 566
    Top = 121
    object oraFilialID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object oraFilialNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
  end
  object dsFilial: TDataSource
    DataSet = oraFilial
    Left = 601
    Top = 121
  end
  object oraNeftebasa: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT m.NEFTEBASA as ID, m.NEFTEBASA as NAME'
      'FROM zakaz_parus m'
      'WHERE m.NEFTEBASA IS NOT NULL'
      '  AND m.date_plan BETWEEN :BEGIN_DATE AND :END_DATE'
      'order by NAME')
    Variables.Data = {
      03000000020000000B0000003A424547494E5F444154450C0000000000000000
      000000090000003A454E445F444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    DetailFields = 'id'
    QueryAllRecords = False
    Session = oraSes
    Left = 568
    Top = 162
    object oraNeftebasaID: TStringField
      FieldName = 'ID'
      Size = 50
    end
    object oraNeftebasaNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object dsNeftebasa: TDataSource
    DataSet = oraNeftebasa
    Left = 597
    Top = 162
  end
  object oraStan: TOracleDataSet
    SQL.Strings = (
      
        'SELECT DISTINCT kls_stan.ID, kls_stan.stan_name, kls_stan.stan_k' +
        'od'
      'FROM kls_stan, zakaz m'
      'WHERE kls_stan.ID<>0'
      '  AND m.stan_id=kls_stan.id'
      '  AND m.date_plan BETWEEN :BEGIN_DATE AND :END_DATE'
      'ORDER BY kls_stan.stan_name ASC')
    Variables.Data = {
      03000000020000000B0000003A424547494E5F444154450C0000000000000000
      000000090000003A454E445F444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000090000005354414E5F4E414D45
      0100000000080000005354414E5F4B4F440100000000}
    QueryAllRecords = False
    Session = oraSes
    Left = 564
    Top = 204
    object oraStanID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object oraStanSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Required = True
      Size = 50
    end
    object oraStanSTAN_KOD: TIntegerField
      FieldName = 'STAN_KOD'
      Required = True
    end
  end
  object dsStan: TDataSource
    DataSet = oraStan
    Left = 596
    Top = 204
  end
  object oraPoluch: TOracleDataSet
    SQL.Strings = (
      'select DISTINCT kls_predpr.id,'
      '       kls_predpr.short_name,'
      '       kls_predpr.predpr_name'
      'from kls_predpr, zakaz m'
      'WHERE kls_predpr.is_block<>1'
      '  AND m.poluch_id=kls_predpr.id'
      '  AND m.date_plan BETWEEN :BEGIN_DATE AND :END_DATE'
      'order by short_name'
      '')
    Variables.Data = {
      03000000020000000B0000003A424547494E5F444154450C0000000000000000
      000000090000003A454E445F444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000300000002000000494401000000000A00000053484F52545F4E414D
      4501000000000B0000005052454450525F4E414D450100000000}
    QueryAllRecords = False
    Session = oraSes
    Left = 676
    Top = 249
    object oraPoluchID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object oraPoluchSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object oraPoluchPREDPR_NAME: TStringField
      FieldName = 'PREDPR_NAME'
      Required = True
      Size = 60
    end
  end
  object dsPoluch: TDataSource
    DataSet = oraPoluch
    Left = 716
    Top = 249
  end
  object dsPlat: TDataSource
    DataSet = oraPlat
    Left = 718
    Top = 295
  end
  object oraPlat: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  kls.ID, kls.short_name, kls.predpr_name'
      'FROM kls_predpr kls, zakaz m'
      'WHERE is_block<>1'
      '  AND m.plat_id=kls.id'
      '  AND m.date_plan BETWEEN :BEGIN_DATE AND :END_DATE'
      'order by kls.short_name')
    Variables.Data = {
      03000000020000000B0000003A424547494E5F444154450C0000000000000000
      000000090000003A454E445F444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000300000002000000494401000000000A00000053484F52545F4E414D
      4501000000000B0000005052454450525F4E414D450100000000}
    DetailFields = 'id'
    QueryAllRecords = False
    Session = oraSes
    BeforeOpen = oraPlatBeforeOpen
    Left = 678
    Top = 295
  end
  object oraDog: TOracleDataSet
    SQL.Strings = (
      
        'SELECT kls_dog.ID, kls_dog.dog_number,kls_dog.dog_date,kls_dog.u' +
        'sl_opl_id'
      '  FROM kls_predpr kls, kls_dog kls_dog'
      ' WHERE ((kls.ID = kls_dog.predpr_id))'
      'and kls.id=:id')
    Variables.Data = {0300000001000000030000003A4944050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000400000002000000494401000000000A000000444F475F4E554D4245
      52010000000008000000444F475F4441544501000000000A00000055534C5F4F
      504C5F49440100000000}
    Master = oraPlat
    MasterFields = 'id'
    Session = oraSes
    BeforeOpen = oraDogBeforeOpen
    Left = 568
    Top = 341
  end
  object dsDog: TDataSource
    DataSet = oraDog
    Left = 597
    Top = 341
  end
  object oraPlanStru: TOracleDataSet
    SQL.Strings = (
      '-- '#1055#1086#1079#1080#1094#1080#1080' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1086#1082
      'Select /*+ RULE */ distinct a.id,a.name,a.region_id'
      'from v_plan_stru a, zakaz m'
      'where a.has_child=0'
      '  AND m.planstru_id=a.id'
      '  AND m.date_plan BETWEEN :BEGIN_DATE AND :END_DATE')
    Variables.Data = {
      03000000020000000B0000003A424547494E5F444154450C0000000000000000
      000000090000003A454E445F444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000040000004E414D450100000000
      09000000524547494F4E5F49440100000000}
    QueryAllRecords = False
    Session = oraSes
    Left = 670
    Top = 209
    object oraPlanStruID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object oraPlanStruNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object oraPlanStruREGION_ID: TFloatField
      FieldName = 'REGION_ID'
    end
  end
  object dsPlanstru: TDataSource
    DataSet = oraPlanStru
    Left = 713
    Top = 209
  end
  object oraProd: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      'DISTINCT kls_prod.id_npr, kls_prod.long_name_npr as name_npr'
      'FROM zakaz m, kls_prod'
      'WHERE m.prod_id_npr = kls_prod.id_npr'
      '  AND m.date_plan BETWEEN :BEGIN_DATE AND :END_DATE'
      'ORDER BY kls_prod.long_name_npr ASC')
    Variables.Data = {
      03000000020000000B0000003A424547494E5F444154450C0000000000000000
      000000090000003A454E445F444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E50520100000000080000004E414D455F
      4E50520100000000}
    Session = oraSes
    BeforeOpen = oraProdBeforeOpen
    Left = 666
    Top = 345
  end
  object dsProd: TDataSource
    DataSet = oraProd
    Left = 698
    Top = 345
  end
end
