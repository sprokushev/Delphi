object f_ZakazHistNew: Tf_ZakazHistNew
  Left = 304
  Top = 185
  Width = 754
  Height = 548
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
    Left = 655
    Top = 0
    Width = 91
    Height = 514
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
    Width = 655
    Height = 514
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      object gbNum: TGroupBox
        Left = 0
        Top = 0
        Width = 647
        Height = 89
        Align = alTop
        TabOrder = 0
        object lbClient: TLabel
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
        object lbInput: TLabel
          Left = 298
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
        object Label29: TLabel
          Left = 7
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
        object Label7: TLabel
          Left = 8
          Top = 62
          Width = 107
          Height = 13
          Caption = #8470' '#1079#1072#1103#1074#1082#1080' '#1080#1079' '#1048#1057#1059
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edBeginDate: TDateTimePicker
          Left = 97
          Top = 12
          Width = 88
          Height = 21
          Date = 37839.812709131950000000
          Time = 37839.812709131950000000
          TabOrder = 0
          OnChange = edBeginDateChange
        end
        object edClientNum: TEdit
          Left = 97
          Top = 35
          Width = 96
          Height = 21
          TabOrder = 1
        end
        object edClientDat: TDateTimePicker
          Left = 199
          Top = 34
          Width = 90
          Height = 21
          Date = 37839.812709131950000000
          Time = 37839.812709131950000000
          TabOrder = 2
        end
        object edNum: TEdit
          Left = 377
          Top = 34
          Width = 89
          Height = 21
          TabOrder = 3
        end
        object edDat: TDateTimePicker
          Left = 473
          Top = 34
          Width = 88
          Height = 21
          Date = 37839.812709131950000000
          Time = 37839.812709131950000000
          TabOrder = 4
        end
        object edISU: TEdit
          Left = 121
          Top = 59
          Width = 160
          Height = 21
          TabOrder = 5
        end
      end
      object gbProd: TGroupBox
        Left = 0
        Top = 89
        Width = 647
        Height = 86
        Align = alTop
        TabOrder = 1
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
        object lbVesName: TLabel
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
          Left = 195
          Top = 38
          Width = 11
          Height = 13
          Caption = #1090#1085
        end
        object Label26: TLabel
          Left = 292
          Top = 37
          Width = 12
          Height = 13
          Caption = #1074#1094
        end
        object lbSpeedName: TLabel
          Left = 310
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
        object lbSpeedTN: TLabel
          Left = 475
          Top = 37
          Width = 11
          Height = 13
          Caption = #1090#1085
        end
        object lbSpeedVC: TLabel
          Left = 554
          Top = 37
          Width = 12
          Height = 13
          Caption = #1074#1094
        end
        object Label15: TLabel
          Left = 10
          Top = 63
          Width = 31
          Height = 13
          Caption = #1062#1077#1085#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 188
          Top = 63
          Width = 33
          Height = 13
          Caption = #1088#1091#1073'/'#1090#1085
        end
        object Label2: TLabel
          Left = 318
          Top = 64
          Width = 56
          Height = 13
          Caption = #1054#1090#1075#1088#1091#1079#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label5: TLabel
          Left = 475
          Top = 61
          Width = 11
          Height = 13
          Caption = #1090#1085
        end
        object Label6: TLabel
          Left = 554
          Top = 61
          Width = 12
          Height = 13
          Caption = #1074#1094
        end
        object cbProd: TRxDBLookupCombo
          Left = 79
          Top = 11
          Width = 490
          Height = 21
          DropDownCount = 12
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1086#1076#1091#1082#1090'>'
          EmptyValue = '0'
          LookupField = 'ID_NPR'
          LookupDisplay = 'LONG_NAME_NPR'
          LookupSource = dsProd
          TabOrder = 0
          OnChange = cbProdChange
        end
        object edVes: TRxCalcEdit
          Left = 79
          Top = 36
          Width = 114
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.000'
          FormatOnEditing = True
          NumGlyphs = 2
          TabOrder = 1
          OnChange = edVesChange
        end
        object edKol: TRxCalcEdit
          Left = 214
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
          Left = 382
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
          Left = 494
          Top = 34
          Width = 56
          Height = 21
          AutoSize = False
          DisplayFormat = ',0'
          FormatOnEditing = True
          NumGlyphs = 2
          TabOrder = 4
        end
        object edPrice: TRxCalcEdit
          Left = 79
          Top = 60
          Width = 107
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00'
          FormatOnEditing = True
          NumGlyphs = 2
          TabOrder = 5
        end
        object edFactVes: TRxCalcEdit
          Left = 382
          Top = 59
          Width = 90
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.000'
          FormatOnEditing = True
          NumGlyphs = 2
          TabOrder = 6
          OnChange = edFactVesChange
        end
        object edFactKol: TRxCalcEdit
          Left = 494
          Top = 58
          Width = 56
          Height = 21
          AutoSize = False
          DisplayFormat = ',0'
          FormatOnEditing = True
          NumGlyphs = 2
          TabOrder = 7
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 175
        Width = 647
        Height = 136
        Align = alTop
        TabOrder = 2
        object Label4: TLabel
          Left = 6
          Top = 36
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
          Top = 36
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
          Top = 36
          Width = 89
          Height = 17
          DataField = 'OKPO'
          DataSource = dsPoluch
        end
        object Label10: TLabel
          Left = 6
          Top = 60
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
          Top = 53
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
          Top = 79
          Width = 475
          Height = 17
          DataField = 'PREDPR_NAME'
          DataSource = dsPoluch
        end
        object Label11: TLabel
          Left = 6
          Top = 96
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
          Top = 90
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
          Top = 117
          Width = 474
          Height = 17
          DataField = 'PREDPR_NAME'
          DataSource = dsPotreb
        end
        object Label1: TLabel
          Left = 6
          Top = 12
          Width = 128
          Height = 13
          Caption = #1047#1072#1103#1074#1082#1072' '#1085#1072' '#1087#1077#1088#1077#1074#1086#1079#1082#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edStanKod: TEdit
          Left = 86
          Top = 33
          Width = 120
          Height = 21
          TabOrder = 0
          OnChange = edStanKodChange
        end
        object cbStan: TRxDBLookupCombo
          Left = 212
          Top = 33
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
          Top = 56
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
          Top = 93
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
        object edEtran: TEdit
          Left = 142
          Top = 9
          Width = 120
          Height = 21
          TabOrder = 4
          OnChange = edEtranChange
        end
        object cbEtran: TRxDBLookupCombo
          Left = 267
          Top = 8
          Width = 294
          Height = 21
          DropDownCount = 20
          EscapeClear = False
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1079#1072#1082#1072#1079' '#1085#1072' '#1087#1077#1088#1077#1074#1086#1079#1082#1091'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'NOM_Z'
          LookupSource = dsEtran
          TabOrder = 5
          OnChange = cbEtranChange
        end
        object btGrafik: TButton
          Left = 568
          Top = 8
          Width = 73
          Height = 41
          Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1075#1088#1072#1092#1080#1082
          TabOrder = 6
          WordWrap = True
          OnClick = btGrafikClick
        end
      end
      object gbGrafik: TGroupBox
        Left = 0
        Top = 311
        Width = 647
        Height = 175
        Align = alClient
        Caption = ' '#1043#1088#1072#1092#1080#1082' '#1086#1090#1075#1088#1091#1079#1082#1080' '
        TabOrder = 3
        object gridGrafik: TDBGridEh
          Left = 418
          Top = 15
          Width = 227
          Height = 158
          Align = alRight
          AllowedOperations = [alopUpdateEh]
          DataSource = dsGrafik
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FooterRowCount = 1
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = btDelGrafikClick
          OnExit = gridGrafikExit
          Columns = <
            item
              EditButtons = <>
              FieldName = 'DATE_LOAD'
              Footers = <>
              Width = 63
            end
            item
              EditButtons = <>
              FieldName = 'TONN_LOAD'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clWindowText
              Footer.Font.Height = -11
              Footer.Font.Name = 'MS Sans Serif'
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Width = 74
            end
            item
              EditButtons = <>
              FieldName = 'CIST_LOAD'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clWindowText
              Footer.Font.Height = -11
              Footer.Font.Name = 'MS Sans Serif'
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Width = 48
            end>
        end
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 416
          Height = 158
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel3: TPanel
            Left = 388
            Top = 0
            Width = 28
            Height = 158
            Align = alRight
            TabOrder = 0
            object btAddGrafik: TSpeedButton
              Left = 3
              Top = 64
              Width = 23
              Height = 22
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333FF3333333333333003333
                3333333333773FF3333333333309003333333333337F773FF333333333099900
                33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
                99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
                33333333337F3F77333333333309003333333333337F77333333333333003333
                3333333333773333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              OnClick = btAddGrafikClick
            end
            object btDelGrafik: TSpeedButton
              Left = 3
              Top = 90
              Width = 23
              Height = 22
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333FF3333333333333003333333333333F77F33333333333009033
                333333333F7737F333333333009990333333333F773337FFFFFF330099999000
                00003F773333377777770099999999999990773FF33333FFFFF7330099999000
                000033773FF33777777733330099903333333333773FF7F33333333333009033
                33333333337737F3333333333333003333333333333377333333333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              OnClick = btDelGrafikClick
            end
          end
          object edGrafik: TMonthCalendar
            Left = 0
            Top = 0
            Width = 388
            Height = 158
            Align = alClient
            CalColors.TrailingTextColor = clInactiveCaption
            MultiSelect = True
            Date = 38322.535745381950000000
            EndDate = 38322.000000000000000000
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            OnDblClick = btAddGrafikClick
          end
        end
      end
    end
  end
  object oraTSes: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Left = 102
    Top = 65533
  end
  object oraProd: TOracleDataSet
    SQL.Strings = (
      'SELECT id_npr,NAME_NPR AS long_name_npr,normotgr,prod_gu12_id'
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
      04000000040000000600000049445F4E50520100000000000D0000004C4F4E47
      5F4E414D455F4E5052010000000000080000004E4F524D4F5447520100000000
      000C00000050524F445F475531325F4944010000000000}
    QueryAllRecords = False
    Session = oraTSes
    Left = 346
    Top = 1
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
    object oraProdPROD_GU12_ID: TStringField
      FieldName = 'PROD_GU12_ID'
      Size = 10
    end
  end
  object dsProd: TDataSource
    DataSet = oraProd
    Left = 386
    Top = 1
  end
  object oraStan: TOracleDataSet
    SQL.Strings = (
      'SELECT   kls_stan.ID, kls_stan.stan_name, kls_stan.stan_kod'
      '    FROM kls_stan '
      'ORDER BY kls_stan.stan_name ASC')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000090000005354414E5F4E414D
      45010000000000080000005354414E5F4B4F44010000000000}
    QueryAllRecords = False
    Session = oraTSes
    Left = 572
    Top = 4
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
    Left = 612
    Top = 4
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
  object oraPotreb: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       short_name,predpr_name'
      '  from kls_predpr  WHERE is_block<>1'
      'order by short_name')
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000A00000053484F52545F4E41
      4D450100000000000B0000005052454450525F4E414D45010000000000}
    QueryAllRecords = False
    Session = oraTSes
    Left = 428
    Top = 4
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
    Left = 468
    Top = 4
  end
  object oraPoluch: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       short_name,predpr_name,okpo'
      '  from kls_predpr  WHERE is_block<>1'
      'order by short_name'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000200000049440100000000000A00000053484F52545F4E41
      4D450100000000000B0000005052454450525F4E414D45010000000000040000
      004F4B504F010000000000}
    QueryAllRecords = False
    Session = oraTSes
    Left = 260
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
  end
  object dsPoluch: TDataSource
    DataSet = oraPoluch
    Left = 300
    Top = 1
  end
  object oraEtran: TOracleDataSet
    SQL.Strings = (
      '-- '#1047#1072#1103#1074#1082#1080' '#1080#1079' '#1069#1058#1056#1040#1053
      'Select'
      'distinct gu12_a.id,gu12_a.nom_z'
      'from gu12_a, gu12_b'
      'where gu12_a.ID=gu12_b.ID_A'
      'and ((gu12_a.prod_id=:PROD_GU12_ID'
      'and gu12_b.stan_id=:STAN_ID'
      'AND gu12_b.plat_id=:PLAT_ID'
      'and gu12_a.to_date>=TRUNC(:BEGIN_DATE,'#39'MONTH'#39'))'
      'or gu12_a.id=:ID)'
      'order by gu12_a.nom_z'
      '')
    Variables.Data = {
      03000000050000000D0000003A50524F445F475531325F494405000000070000
      003232313036360000000000080000003A5354414E5F49440300000004000000
      750A000000000000080000003A504C41545F494403000000040000000A000000
      00000000030000003A4944030000000400000000000000000000000B0000003A
      424547494E5F444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000050000004E4F4D5F5A010000
      000000}
    Session = oraTSes
    Left = 182
    Top = 1
    object oraEtranID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object oraEtranNOM_Z: TStringField
      FieldName = 'NOM_Z'
      Size = 15
    end
  end
  object dsEtran: TDataSource
    DataSet = oraEtran
    Left = 217
    Top = 1
  end
  object pkgFOR_ZAKAZ: TOraclePackage
    Session = oraTSes
    PackageName = 'FOR_ZAKAZ'
    Left = 524
    Top = 65534
  end
  object oraGrafik: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.rowid,A.date_load,A.tonn_load,A.cist_load'
      'FROM V_ZAKAZ_GRAFIK_TEMP A'
      'ORDER BY date_load')
    QBEDefinition.QBEFieldDefs = {
      040000000300000009000000444154455F4C4F41440100000000000900000054
      4F4E4E5F4C4F414401000000000009000000434953545F4C4F41440100000000
      00}
    QueryAllRecords = False
    UpdatingTable = 'ZAKAZ_GRAFIK_TEMP'
    Session = oraTSes
    Left = 586
    Top = 105
    object oraGrafikDATE_LOAD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATE_LOAD'
      ReadOnly = True
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object oraGrafikTONN_LOAD: TFloatField
      DisplayLabel = #1058#1053
      FieldName = 'TONN_LOAD'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object oraGrafikCIST_LOAD: TFloatField
      DisplayLabel = #1042#1062
      FieldName = 'CIST_LOAD'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
  end
  object dsGrafik: TDataSource
    DataSet = oraGrafik
    Left = 626
    Top = 105
  end
  object q_tmp: TOracleDataSet
    Session = oraTSes
    Left = 687
    Top = 104
  end
end
