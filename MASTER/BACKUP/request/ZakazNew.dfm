object f_ZakazNew: Tf_ZakazNew
  Left = 422
  Top = 178
  Width = 713
  Height = 586
  Caption = #1053#1086#1074#1072#1103' '#1047#1072#1087#1080#1089#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 614
    Top = 0
    Width = 91
    Height = 559
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 8
      Top = 24
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = acSaveExecute
    end
    object BitBtn2: TBitBtn
      Left = 8
      Top = 56
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1042#1099#1093#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = acExitExecute
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 614
    Height = 559
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 606
        Height = 62
        Align = alTop
        TabOrder = 0
        object Label20: TLabel
          Left = 8
          Top = 15
          Width = 41
          Height = 13
          Caption = #1057#1090#1072#1090#1091#1089
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 290
          Top = 16
          Width = 43
          Height = 13
          Caption = #1052#1077#1089#1103#1094':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 431
          Top = 15
          Width = 79
          Height = 13
          Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1089':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 8
          Top = 38
          Width = 84
          Height = 13
          Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#8470
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 338
          Top = 37
          Width = 76
          Height = 13
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#8470
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cbStatusZakaz: TRxDBLookupCombo
          Left = 57
          Top = 12
          Width = 232
          Height = 21
          DropDownCount = 12
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1090#1072#1090#1091#1089'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = ds_status_zakaz
          TabOrder = 0
        end
        object edDatePlan: TDateTimePicker
          Left = 337
          Top = 12
          Width = 88
          Height = 21
          Date = 37839.812709131950000000
          Time = 37839.812709131950000000
          TabOrder = 1
          OnChange = edDatePlanChange
        end
        object edBeginDate: TDateTimePicker
          Left = 513
          Top = 12
          Width = 88
          Height = 21
          Date = 37839.812709131950000000
          Time = 37839.812709131950000000
          TabOrder = 2
        end
        object edClientNum: TEdit
          Left = 97
          Top = 35
          Width = 96
          Height = 21
          TabOrder = 3
        end
        object edClientDat: TDateTimePicker
          Left = 199
          Top = 34
          Width = 90
          Height = 21
          Date = 37839.812709131950000000
          Time = 37839.812709131950000000
          TabOrder = 4
        end
        object edNum: TEdit
          Left = 417
          Top = 34
          Width = 89
          Height = 21
          TabOrder = 5
        end
        object edDat: TDateTimePicker
          Left = 513
          Top = 34
          Width = 88
          Height = 21
          Date = 37839.812709131950000000
          Time = 37839.812709131950000000
          TabOrder = 6
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 62
        Width = 606
        Height = 169
        Align = alTop
        TabOrder = 1
        object Label14: TLabel
          Left = 5
          Top = 12
          Width = 48
          Height = 13
          Caption = #1060#1080#1083#1080#1072#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 245
          Top = 12
          Width = 69
          Height = 13
          Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText3: TDBText
          Left = 8
          Top = 31
          Width = 465
          Height = 17
          DataField = 'PREDPR_NAME'
          DataSource = dsPlat
        end
        object Label2: TLabel
          Left = 5
          Top = 53
          Width = 151
          Height = 13
          Caption = #1044#1086#1075#1086#1074#1086#1088' '#1089' '#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 479
          Top = 34
          Width = 28
          Height = 13
          Caption = #1048#1053#1053
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText5: TDBText
          Left = 511
          Top = 32
          Width = 78
          Height = 17
          DataField = 'INN'
          DataSource = dsPlat
        end
        object Label15: TLabel
          Left = 299
          Top = 101
          Width = 105
          Height = 13
          Caption = #1062#1077#1085#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 530
          Top = 99
          Width = 33
          Height = 13
          Caption = #1088#1091#1073'/'#1090#1085
        end
        object Label8: TLabel
          Left = 357
          Top = 52
          Width = 70
          Height = 13
          Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 250
          Top = 122
          Width = 71
          Height = 13
          Caption = #1059#1089#1083' '#1086#1087#1083#1072#1090#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 5
          Top = 127
          Width = 154
          Height = 13
          Caption = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1086#1082':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RxSpeedButton1: TRxSpeedButton
          Left = 579
          Top = 8
          Width = 22
          Height = 22
          Action = acSeekPlat
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
        end
        object Label31: TLabel
          Left = 7
          Top = 101
          Width = 83
          Height = 13
          Caption = #1062#1077#1085#1072' '#1082#1083#1080#1077#1085#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 211
          Top = 100
          Width = 33
          Height = 13
          Caption = #1088#1091#1073'/'#1090#1085
        end
        object Label33: TLabel
          Left = 5
          Top = 77
          Width = 150
          Height = 13
          Caption = #1044#1086#1075#1086#1074#1086#1088' '#1089' '#1055#1086#1089#1090#1072#1074#1097#1080#1082#1086#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cbFilial: TRxDBLookupCombo
          Left = 62
          Top = 8
          Width = 179
          Height = 21
          DropDownCount = 12
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1080#1083#1080#1072#1083'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = dsFilial
          TabOrder = 0
        end
        object cbPlat: TRxDBLookupCombo
          Left = 318
          Top = 8
          Width = 259
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'SHORT_NAME'
          LookupSource = dsPlat
          TabOrder = 1
        end
        object cbDog: TRxDBLookupCombo
          Left = 166
          Top = 49
          Width = 147
          Height = 21
          DropDownCount = 8
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1086#1075#1086#1074#1086#1088'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'DOG_NUMBER'
          LookupSource = dsDog
          TabOrder = 2
          OnChange = cbDogChange
          OnExit = cbDogExit
        end
        object edPrice: TRxCalcEdit
          Left = 414
          Top = 96
          Width = 107
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00'
          FormatOnEditing = True
          NumGlyphs = 2
          TabOrder = 4
        end
        object cbPayForm: TRxDBLookupCombo
          Left = 430
          Top = 48
          Width = 163
          Height = 21
          DropDownCount = 8
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1080#1076' '#1086#1087#1083#1072#1090#1099'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'PAYFORM_NAME'
          LookupSource = dsPayform
          TabOrder = 5
        end
        object cbUslOpl: TRxDBLookupCombo
          Left = 328
          Top = 118
          Width = 273
          Height = 21
          DropDownCount = 8
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1091#1089#1083' '#1086#1087#1083#1072#1090#1099'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = dsUslOpl
          TabOrder = 6
        end
        object cbPlanStru: TRxDBLookupCombo
          Left = 6
          Top = 142
          Width = 595
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1079#1080#1094#1080#1102' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1086#1082'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = dsPlanstru
          TabOrder = 7
          OnChange = cbPlanStruChange
        end
        object edPriceClient: TRxCalcEdit
          Left = 96
          Top = 97
          Width = 113
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00'
          FormatOnEditing = True
          NumGlyphs = 2
          TabOrder = 8
        end
        object cbLukDog: TRxDBLookupCombo
          Left = 166
          Top = 73
          Width = 427
          Height = 21
          DropDownCount = 8
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1086#1075#1086#1074#1086#1088'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'DOG_NUMBER'
          LookupSource = dsLukDog
          TabOrder = 3
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 231
        Width = 606
        Height = 64
        Align = alTop
        TabOrder = 2
        object Label3: TLabel
          Left = 9
          Top = 16
          Width = 50
          Height = 13
          Caption = #1055#1088#1086#1076#1091#1082#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 7
          Top = 40
          Width = 58
          Height = 13
          Caption = #1047#1072#1103#1074#1083#1077#1085#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 211
          Top = 38
          Width = 11
          Height = 13
          Caption = #1090#1085
        end
        object Label26: TLabel
          Left = 308
          Top = 37
          Width = 12
          Height = 13
          Caption = #1074#1094
        end
        object Label24: TLabel
          Left = 326
          Top = 32
          Width = 71
          Height = 26
          Caption = #1074' '#1090'.'#1095'. '#1089#1088#1086#1095'. '#1087#1077#1088#1077#1074#1086#1079#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label25: TLabel
          Left = 491
          Top = 37
          Width = 11
          Height = 13
          Caption = #1090#1085
        end
        object Label22: TLabel
          Left = 570
          Top = 37
          Width = 12
          Height = 13
          Caption = #1074#1094
        end
        object cbProd: TRxDBLookupCombo
          Left = 87
          Top = 11
          Width = 479
          Height = 21
          DropDownCount = 12
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1086#1076#1091#1082#1090'>'
          EmptyValue = '0'
          LookupField = 'ID_NPR'
          LookupDisplay = 'LONG_NAME_NPR'
          LookupSource = dsProd
          TabOrder = 0
        end
        object edVes: TRxCalcEdit
          Left = 87
          Top = 36
          Width = 120
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.000'
          FormatOnEditing = True
          NumGlyphs = 2
          TabOrder = 1
          OnChange = edVesChange
        end
        object edKol: TRxCalcEdit
          Left = 230
          Top = 35
          Width = 72
          Height = 21
          AutoSize = False
          DisplayFormat = ',0'
          FormatOnEditing = True
          NumGlyphs = 2
          TabOrder = 2
        end
        object edSpeedVes: TRxCalcEdit
          Left = 398
          Top = 35
          Width = 90
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.000'
          FormatOnEditing = True
          NumGlyphs = 2
          TabOrder = 3
          OnChange = edSpeedVesChange
        end
        object edSpeedKol: TRxCalcEdit
          Left = 510
          Top = 34
          Width = 56
          Height = 21
          AutoSize = False
          DisplayFormat = ',0'
          FormatOnEditing = True
          NumGlyphs = 2
          TabOrder = 4
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 295
        Width = 606
        Height = 229
        Align = alTop
        TabOrder = 3
        object Label4: TLabel
          Left = 6
          Top = 12
          Width = 50
          Height = 13
          Caption = #1057#1090#1072#1085#1094#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 432
          Top = 12
          Width = 40
          Height = 13
          Caption = #1054#1050#1055#1054':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 476
          Top = 12
          Width = 89
          Height = 17
          DataField = 'OKPO'
          DataSource = dsPoluch
        end
        object Label10: TLabel
          Left = 6
          Top = 36
          Width = 70
          Height = 13
          Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbPoluch: TRxSpeedButton
          Left = 543
          Top = 29
          Width = 22
          Height = 22
          Action = acSeekPoluch
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
        end
        object DBText2: TDBText
          Left = 86
          Top = 55
          Width = 515
          Height = 17
          DataField = 'PREDPR_NAME'
          DataSource = dsPoluch
        end
        object Label11: TLabel
          Left = 6
          Top = 72
          Width = 78
          Height = 13
          Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbPotreb: TRxSpeedButton
          Left = 542
          Top = 66
          Width = 22
          Height = 22
          Action = acSeekPotreb
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
        end
        object DBText4: TDBText
          Left = 87
          Top = 93
          Width = 514
          Height = 17
          DataField = 'PREDPR_NAME'
          DataSource = dsPotreb
        end
        object Label17: TLabel
          Left = 6
          Top = 110
          Width = 78
          Height = 13
          Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 6
          Top = 133
          Width = 36
          Height = 13
          Caption = #1042#1077#1090#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 341
          Top = 133
          Width = 80
          Height = 13
          Caption = #1042#1080#1076' '#1086#1090#1075#1088#1091#1079#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 6
          Top = 157
          Width = 74
          Height = 13
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 6
          Top = 181
          Width = 49
          Height = 13
          Caption = #1043#1088#1072#1092#1072' 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 6
          Top = 205
          Width = 88
          Height = 13
          Caption = #1043#1086#1089#1087#1088#1086#1075#1088#1072#1084#1084#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 246
          Top = 205
          Width = 80
          Height = 13
          Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText6: TDBText
          Left = 5
          Top = 54
          Width = 77
          Height = 17
          DataField = 'GD_KOD'
          DataSource = dsPoluch
        end
        object edStanKod: TEdit
          Left = 86
          Top = 9
          Width = 120
          Height = 21
          TabOrder = 0
          OnChange = edStanKodChange
        end
        object cbStan: TRxDBLookupCombo
          Left = 212
          Top = 9
          Width = 217
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1090#1072#1085#1094#1080#1102'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'STAN_NAME'
          LookupSource = dsStan
          TabOrder = 1
          OnChange = cbStanChange
        end
        object cbPoluch: TRxDBLookupCombo
          Left = 86
          Top = 32
          Width = 451
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'SHORT_NAME'
          LookupSource = dsPoluch
          TabOrder = 2
        end
        object cbPotreb: TRxDBLookupCombo
          Left = 86
          Top = 69
          Width = 451
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1103'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'SHORT_NAME'
          LookupSource = dsPotreb
          TabOrder = 3
        end
        object edPotreb: TEdit
          Left = 85
          Top = 107
          Width = 516
          Height = 21
          MaxLength = 100
          TabOrder = 4
        end
        object cbVetka: TRxDBLookupCombo
          Left = 85
          Top = 130
          Width = 252
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1077#1090#1082#1091'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'VETKA_NAME'
          LookupSource = dsVetka
          TabOrder = 5
        end
        object cbVidOtgr: TRxDBLookupCombo
          Left = 440
          Top = 130
          Width = 161
          Height = 21
          DropDownCount = 8
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1080#1076' '#1086#1090#1075#1088#1091#1079#1082#1080'>'
          EmptyValue = '0'
          LookupField = 'LOAD_ABBR'
          LookupDisplay = 'LOAD_NAME'
          LookupSource = dsVidOtgr
          TabOrder = 6
        end
        object edPrim: TEdit
          Left = 84
          Top = 153
          Width = 517
          Height = 21
          MaxLength = 100
          TabOrder = 7
        end
        object edGR4: TEdit
          Left = 84
          Top = 176
          Width = 517
          Height = 21
          MaxLength = 100
          TabOrder = 8
        end
        object cbGosprog: TRxDBLookupCombo
          Left = 101
          Top = 202
          Width = 140
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1075#1086#1089#1087#1088#1086#1075#1088#1072#1084#1084#1091'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'GOSPROG_NAME'
          LookupSource = dsGosprog
          TabOrder = 9
        end
        object cbGpNapr: TRxDBLookupCombo
          Left = 333
          Top = 202
          Width = 268
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = dsGpNapr
          TabOrder = 10
        end
      end
      object Panel2: TPanel
        Left = 515
        Top = 524
        Width = 91
        Height = 7
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 4
      end
    end
  end
  object oraTSes: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Connected = True
    Left = 102
    Top = 65533
  end
  object oraPlat: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  kls.ID, kls.short_name, kls.predpr_name, kls.inn'
      'FROM kls_predpr kls'
      'WHERE is_block<>1  '
      'order by kls.short_name')
    QBEDefinition.QBEFieldDefs = {
      030000000400000002000000494401000000000A00000053484F52545F4E414D
      4501000000000B0000005052454450525F4E414D45010000000003000000494E
      4E0100000000}
    DetailFields = 'id'
    QueryAllRecords = False
    Session = oraTSes
    Left = 262
    Top = 65535
    object oraPlatID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object oraPlatSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object oraPlatPREDPR_NAME: TStringField
      FieldName = 'PREDPR_NAME'
      Required = True
      Size = 60
    end
    object oraPlatINN: TStringField
      FieldName = 'INN'
      Size = 12
    end
  end
  object dsPlat: TDataSource
    DataSet = oraPlat
    Left = 302
    Top = 65535
  end
  object oraDog: TOracleDataSet
    SQL.Strings = (
      
        'SELECT kls_dog.ID, kls_dog.dog_number,kls_dog.dog_date,kls_dog.u' +
        'sl_opl_id,kls_dog.lukdog_id, kls_dog.IS_AGENT,kls_dog.AGENT_ID'
      '  FROM kls_predpr kls, kls_dog kls_dog'
      ' WHERE ((kls.ID = kls_dog.predpr_id))'
      'and kls.id=:id')
    Variables.Data = {0300000001000000030000003A494403000000040000003305000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000700000002000000494401000000000A000000444F475F4E554D4245
      52010000000008000000444F475F4441544501000000000A00000055534C5F4F
      504C5F49440100000000090000004C554B444F475F4944010000000008000000
      49535F4147454E540100000000080000004147454E545F49440100000000}
    Master = oraPlat
    MasterFields = 'id'
    Session = oraTSes
    AfterScroll = oraDogAfterScroll
    Left = 613
    Top = 309
    object oraDogID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object oraDogDOG_NUMBER: TStringField
      FieldName = 'DOG_NUMBER'
      Required = True
      Size = 30
    end
    object oraDogDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
      Required = True
    end
    object oraDogUSL_OPL_ID: TFloatField
      FieldName = 'USL_OPL_ID'
      Required = True
    end
    object oraDogLUKDOG_ID: TIntegerField
      FieldName = 'LUKDOG_ID'
      Required = True
    end
    object oraDogIS_AGENT: TFloatField
      FieldName = 'IS_AGENT'
    end
    object oraDogAGENT_ID: TFloatField
      FieldName = 'AGENT_ID'
    end
  end
  object dsDog: TDataSource
    DataSet = oraDog
    Left = 653
    Top = 309
  end
  object oraProd: TOracleDataSet
    SQL.Strings = (
      'SELECT id_npr,NAME_NPR AS long_name_npr,normotgr'
      'FROM KLS_PROD'
      'WHERE EXISTS '
      '(SELECT NULL '
      '  FROM KLS_PROD_GROUPS_DESC A, KLS_PROD_GROUPS B '
      ' WHERE A.PROD_GROUPS_ID=B.ID'
      '   AND B.PROD_TYPE_GRP_ID =4'
      '   AND A.PROD_ID_NPR=KLS_PROD.ID_NPR'
      '   )'
      'order by id_npr'
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      03000000030000000600000049445F4E505201000000000D0000004C4F4E475F
      4E414D455F4E50520100000000080000004E4F524D4F5447520100000000}
    QueryAllRecords = False
    Session = oraTSes
    Left = 642
    Top = 177
    object oraProdID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object oraProdLONG_NAME_NPR: TStringField
      FieldName = 'LONG_NAME_NPR'
      Required = True
      Size = 40
    end
    object oraProdNORMOTGR: TFloatField
      FieldName = 'NORMOTGR'
    end
  end
  object dsProd: TDataSource
    DataSet = oraProd
    Left = 674
    Top = 177
  end
  object oraStan: TOracleDataSet
    SQL.Strings = (
      'SELECT   kls_stan.ID, kls_stan.stan_name, kls_stan.stan_kod'
      '    FROM kls_stan '
      'ORDER BY kls_stan.stan_name ASC')
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000090000005354414E5F4E414D45
      0100000000080000005354414E5F4B4F440100000000}
    QueryAllRecords = False
    Session = oraTSes
    Left = 620
    Top = 348
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
    Left = 660
    Top = 348
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 133
    StyleName = 'XP Style'
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnExecute = acSaveExecute
    end
    object acExit: TAction
      Caption = #1042#1099#1093#1086#1076
      OnExecute = acExitExecute
    end
    object acSeekPlat: TAction
      Caption = 'acSeekPlat'
      ImageIndex = 9
      OnExecute = acSeekPlatExecute
    end
    object acSeekPoluch: TAction
      Caption = 'acSeekPoluch'
      ImageIndex = 9
      OnExecute = acSeekPoluchExecute
    end
    object acSeekPotreb: TAction
      Caption = 'acSeekPotreb'
      ImageIndex = 9
      OnExecute = acSeekPotrebExecute
    end
  end
  object oraPayform: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       payform_name'
      '  from kls_payform'
      'order by payform_name')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000C000000504159464F524D5F4E
      414D450100000000}
    Session = oraTSes
    Left = 644
    Top = 394
    object oraPayformID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object oraPayformPAYFORM_NAME: TStringField
      FieldName = 'PAYFORM_NAME'
      Required = True
    end
  end
  object dsPayform: TDataSource
    DataSet = oraPayform
    Left = 676
    Top = 394
  end
  object oraVidOtgr: TOracleDataSet
    SQL.Strings = (
      'select load_abbr,'
      '       load_name'
      '  from kls_vid_otgr'
      'order by load_name')
    QBEDefinition.QBEFieldDefs = {
      0300000002000000090000004C4F41445F414242520100000000090000004C4F
      41445F4E414D450100000000}
    Session = oraTSes
    Left = 348
    Top = 65535
    object oraVidOtgrLOAD_ABBR: TStringField
      FieldName = 'LOAD_ABBR'
      Required = True
      Size = 3
    end
    object oraVidOtgrLOAD_NAME: TStringField
      FieldName = 'LOAD_NAME'
      Required = True
      Size = 45
    end
  end
  object dsVidOtgr: TDataSource
    DataSet = oraVidOtgr
    Left = 388
    Top = 65535
  end
  object oraVetka: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       vetka_name'
      '  from kls_vetka'
      'order by vetka_name')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A0000005645544B415F4E414D
      450100000000}
    QueryAllRecords = False
    Session = oraTSes
    Left = 644
    Top = 437
    object oraVetkaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object oraVetkaVETKA_NAME: TStringField
      FieldName = 'VETKA_NAME'
      Required = True
      Size = 50
    end
  end
  object dsVetka: TDataSource
    DataSet = oraVetka
    Left = 676
    Top = 437
  end
  object oraPotreb: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       short_name,predpr_name'
      '  from kls_predpr  WHERE is_block<>1'
      'order by short_name')
    QBEDefinition.QBEFieldDefs = {
      030000000300000002000000494401000000000A00000053484F52545F4E414D
      4501000000000B0000005052454450525F4E414D450100000000}
    QueryAllRecords = False
    Session = oraTSes
    Left = 620
    Top = 220
    object oraPotrebID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object oraPotrebSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object oraPotrebPREDPR_NAME: TStringField
      FieldName = 'PREDPR_NAME'
      Required = True
      Size = 60
    end
  end
  object dsPotreb: TDataSource
    DataSet = oraPotreb
    Left = 652
    Top = 220
  end
  object oraPoluch: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       short_name,predpr_name,okpo,gd_kod'
      '  from kls_predpr  WHERE is_block<>1'
      'order by short_name'
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000500000002000000494401000000000A00000053484F52545F4E414D
      4501000000000B0000005052454450525F4E414D450100000000040000004F4B
      504F01000000000600000047445F4B4F440100000000}
    QueryAllRecords = False
    Session = oraTSes
    Left = 428
    Top = 1
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
    object oraPoluchOKPO: TStringField
      FieldName = 'OKPO'
      Size = 10
    end
    object oraPoluchGD_KOD: TStringField
      FieldName = 'GD_KOD'
      Size = 12
    end
  end
  object dsPoluch: TDataSource
    DataSet = oraPoluch
    Left = 468
    Top = 1
  end
  object oraUslOpl: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       name'
      '  from kls_usl_opl'
      'order by kol_dn,name')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = oraTSes
    Left = 615
    Top = 262
    object oraUslOplID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object oraUslOplNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 40
    end
  end
  object dsUslOpl: TDataSource
    DataSet = oraUslOpl
    Left = 655
    Top = 262
  end
  object oraFilial: TOracleDataSet
    SQL.Strings = (
      '-- '#1060#1080#1083#1080#1072#1083#1099
      'SELECT id,name FROM ORG_STRUCTURE WHERE PLAN_REAL<>0'
      'ORDER BY plan_real')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = oraTSes
    Left = 638
    Top = 137
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
    Left = 673
    Top = 137
  end
  object oraPlanStru: TOracleDataSet
    SQL.Strings = (
      '-- '#1055#1086#1079#1080#1094#1080#1080' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1086#1082
      'Select id,name,region_id'
      'from v_plan_stru'
      'where has_child=0'
      'and end_date>=TRUNC(:DATE_PLAN,'#39'MONTH'#39')'
      'and begin_date<=LAST_DAY(:DATE_PLAN)')
    Variables.Data = {
      03000000010000000A0000003A444154455F504C414E0C000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000040000004E414D450100000000
      09000000524547494F4E5F49440100000000}
    QueryAllRecords = False
    Session = oraTSes
    Left = 182
    Top = 1
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
    Left = 217
    Top = 1
  end
  object q_status_zakaz: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,NAME  FROM kls_status_zakaz'
      'WHERE 1=1'
      'ORDER BY id')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = oraTSes
    Left = 636
    Top = 92
    object q_status_zakazID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_status_zakazNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
  end
  object ds_status_zakaz: TDataSource
    DataSet = q_status_zakaz
    Left = 672
    Top = 90
  end
  object pkgFOR_ZAKAZ: TOraclePackage
    Session = oraTSes
    PackageName = 'FOR_ZAKAZ'
    Left = 524
    Top = 65534
  end
  object oraLukDog: TOracleDataSet
    SQL.Strings = (
      
        'SELECT kls_dog.ID, kls_dog.dog_number||decode(kls_dog.plat_dog_n' +
        'umber,null,'#39#39','#39' ('#39'||kls_dog.plat_dog_number||'#39')'#39')||'#39' - '#39'||agent.' +
        'short_name as dog_number, kls.short_name, kls_dog_main.is_agent'
      
        '  FROM kls_predpr kls, kls_dog kls_dog, kls_dog_main, kls_predpr' +
        ' agent'
      ' WHERE kls.ID = kls_dog.predpr_id'
      '   AND kls_dog.agent_id=agent.id'
      '   AND kls_dog.id=kls_dog_main.dog_id'
      
        '   AND (kls_dog_main.IS_AGENT=:IS_AGENT OR (:IS_AGENT=2 AND kls_' +
        'dog_main.IS_AGENT=8))'
      
        '   AND :DATE_PLAN BETWEEN kls_dog_main.FROM_DATE AND kls_dog_mai' +
        'n.TO_DATE'
      '')
    Variables.Data = {
      0300000002000000090000003A49535F4147454E540300000000000000000000
      000A0000003A444154455F504C414E0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000400000002000000494401000000000A000000444F475F4E554D4245
      5201000000000A00000053484F52545F4E414D4501000000000800000049535F
      4147454E540100000000}
    Session = oraTSes
    Left = 621
    Top = 485
    object oraLukDogID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object oraLukDogDOG_NUMBER: TStringField
      FieldName = 'DOG_NUMBER'
      Required = True
      Size = 60
    end
    object oraLukDogSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object oraLukDogIS_AGENT: TIntegerField
      FieldName = 'IS_AGENT'
      Required = True
    end
  end
  object dsLukDog: TDataSource
    DataSet = oraLukDog
    Left = 661
    Top = 485
  end
  object dsGpNapr: TDataSource
    DataSet = oraGpNapr
    Left = 509
    Top = 461
  end
  object oraGpNapr: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,NAME'
      '  FROM kls_gp_napr'
      ' WHERE gosprog_id=:ID')
    Variables.Data = {0300000001000000030000003A494403000000040000003305000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Master = oraGosprog
    MasterFields = 'id'
    Session = oraTSes
    AfterScroll = oraDogAfterScroll
    Left = 453
    Top = 453
    object oraGpNaprID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object oraGpNaprNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
  end
  object oraGosprog: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  id,gosprog_name'
      'FROM kls_gosprog'
      'ORDER BY id'
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000C000000474F5350524F475F4E
      414D450100000000}
    QueryAllRecords = False
    Session = oraTSes
    Left = 342
    Top = 423
    object oraGosprogID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object oraGosprogGOSPROG_NAME: TStringField
      FieldName = 'GOSPROG_NAME'
      Required = True
      Size = 30
    end
  end
  object dsGosprog: TDataSource
    DataSet = oraGosprog
    Left = 390
    Top = 431
  end
end
