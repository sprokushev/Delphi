object f_NewMonth: Tf_NewMonth
  Left = 227
  Top = 112
  Width = 769
  Height = 469
  Caption = #1053#1086#1074#1072#1103' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pageTabs: TPageControl
    Left = 0
    Top = 0
    Width = 761
    Height = 435
    ActivePage = tabPlan
    Align = alClient
    TabOrder = 0
    OnChange = pageTabsChange
    OnChanging = pageTabsChanging
    object tabStart: TTabSheet
      Caption = #1057#1058#1040#1056#1058
      OnShow = tabStartShow
      object Splitter1: TSplitter
        Left = 417
        Top = 0
        Width = 5
        Height = 374
        Beveled = True
      end
      object Panel1: TPanel
        Left = 0
        Top = 374
        Width = 753
        Height = 33
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          753
          33)
        object btNext1: TBitBtn
          Left = 583
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Next
          Anchors = [akRight, akBottom]
          BiDiMode = bdRightToLeft
          Caption = #1044#1072#1083#1100#1096#1077
          ParentBiDiMode = False
          TabOrder = 1
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
            FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            000000000000000000000000000000000000000000000000FF000000FF000000
            FF000000FF000000FF000000000000000000FF00FF00FF00FF00000000000000
            FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
            FF000000FF000000FF000000FF000000FF000000000000000000000000000000
            000000000000000000000000000000000000000000000000FF000000FF000000
            FF000000FF000000FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
            FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btCancel1: TBitBtn
          Left = 416
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Cancel
          Anchors = [akRight, akBottom]
          Caption = #1054#1090#1084#1077#1085#1072
          TabOrder = 0
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            840000FFFF000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        end
      end
      object PanelR3: TPanel
        Left = 164
        Top = 0
        Width = 253
        Height = 374
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object DBEdit1: TDBEdit
          Left = 0
          Top = 0
          Width = 249
          Height = 21
          DataField = 'VBELN'
          DataSource = ds_NewMonth
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 0
          Top = 48
          Width = 249
          Height = 21
          DataField = 'IS_EXP_NAME'
          DataSource = ds_NewMonth
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 0
          Top = 72
          Width = 249
          Height = 21
          DataField = 'LOAD_NAME'
          DataSource = ds_NewMonth
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 0
          Top = 95
          Width = 249
          Height = 21
          DataField = 'PROD_NAME_NPR'
          DataSource = ds_NewMonth
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 0
          Top = 118
          Width = 249
          Height = 21
          DataField = 'LUK_DOG_NUMBER'
          DataSource = ds_NewMonth
          TabOrder = 4
        end
        object DBEdit7: TDBEdit
          Left = 0
          Top = 140
          Width = 249
          Height = 21
          DataField = 'NPO_DOG_NUMBER'
          DataSource = ds_NewMonth
          TabOrder = 5
        end
        object DBEdit8: TDBEdit
          Left = 0
          Top = 187
          Width = 249
          Height = 21
          DataField = 'PLAT_NAME'
          DataSource = ds_NewMonth
          TabOrder = 6
        end
        object DBEdit9: TDBEdit
          Left = 0
          Top = 210
          Width = 249
          Height = 21
          DataField = 'GROTP_NAME'
          DataSource = ds_NewMonth
          TabOrder = 7
        end
        object DBEdit10: TDBEdit
          Left = 0
          Top = 233
          Width = 105
          Height = 21
          DataField = 'KNANF'
          DataSource = ds_NewMonth
          TabOrder = 8
        end
        object DBEdit11: TDBEdit
          Left = 0
          Top = 256
          Width = 105
          Height = 21
          DataField = 'KNEND'
          DataSource = ds_NewMonth
          TabOrder = 9
        end
        object DBEdit13: TDBEdit
          Left = 0
          Top = 279
          Width = 249
          Height = 21
          DataField = 'POLUCH_NAME'
          DataSource = ds_NewMonth
          TabOrder = 10
        end
        object DBEdit14: TDBEdit
          Left = 0
          Top = 302
          Width = 249
          Height = 21
          DataField = 'POTREB_NAME'
          DataSource = ds_NewMonth
          TabOrder = 11
        end
        object DBEdit15: TDBEdit
          Left = 0
          Top = 325
          Width = 249
          Height = 21
          DataField = 'VETKA_NAME'
          DataSource = ds_NewMonth
          TabOrder = 12
        end
        object ed_PriceR3: TDBEdit
          Left = 0
          Top = 348
          Width = 249
          Height = 21
          DataField = 'R3_PRICE'
          DataSource = ds_R3_Price
          TabOrder = 13
        end
        object DBEdit6: TDBEdit
          Left = 0
          Top = 164
          Width = 249
          Height = 21
          DataField = 'DOG_NUMBER'
          DataSource = ds_NewMonth
          TabOrder = 14
        end
        object DBEdit16: TDBEdit
          Left = 0
          Top = 24
          Width = 249
          Height = 21
          DataField = 'DATE_RAZN'
          DataSource = ds_NewMonth
          TabOrder = 15
        end
        object DBMemo1: TDBMemo
          Left = 106
          Top = 232
          Width = 143
          Height = 45
          DataField = 'ROUTE_NAME'
          DataSource = ds_NewMonth
          TabOrder = 16
        end
      end
      object PanelNPO: TPanel
        Left = 422
        Top = 0
        Width = 331
        Height = 374
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object rb_Russian: TRadioButton
          Left = 16
          Top = 50
          Width = 89
          Height = 17
          Caption = #1055#1054' '#1056#1054#1057#1057#1048#1048
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = rb_RussianClick
        end
        object rb_Export: TRadioButton
          Left = 104
          Top = 50
          Width = 81
          Height = 17
          Caption = #1069#1050#1057#1055#1054#1056#1058
          TabOrder = 2
          OnClick = rb_ExportClick
        end
        object lc_Load_Abbr: TRxDBLookupCombo
          Left = 10
          Top = 72
          Width = 311
          Height = 21
          DropDownCount = 25
          DisplayEmpty = '-- '#1053#1045' '#1042#1067#1041#1056#1040#1053' --'
          EmptyValue = ' '
          LookupField = 'LOAD_ABBR'
          LookupDisplay = 'LOAD_NAME'
          LookupSource = ds_Load_Abbr
          TabOrder = 3
        end
        object lc_Prod: TRxDBLookupCombo
          Left = 10
          Top = 96
          Width = 311
          Height = 21
          DropDownCount = 25
          DisplayEmpty = '-- '#1053#1045' '#1042#1067#1041#1056#1040#1053' --'
          EmptyValue = ' '
          LookupField = 'ID_NPR'
          LookupDisplay = 'NAME_NPR'
          LookupSource = ds_Prod
          TabOrder = 4
        end
        object ed_LukDog: TComboEdit
          Left = 10
          Top = 119
          Width = 191
          Height = 21
          DirectInput = False
          GlyphKind = gkEllipsis
          ButtonWidth = 16
          NumGlyphs = 1
          TabOrder = 5
          OnButtonClick = ed_LukDogButtonClick
          OnChange = ed_LukDogChange
        end
        object ed_Dog: TComboEdit
          Left = 10
          Top = 165
          Width = 191
          Height = 21
          DirectInput = False
          GlyphKind = gkEllipsis
          ButtonWidth = 16
          NumGlyphs = 1
          TabOrder = 7
          OnButtonClick = ed_DogButtonClick
          OnChange = ed_DogChange
        end
        object ed_Plat: TComboEdit
          Left = 10
          Top = 187
          Width = 311
          Height = 21
          DirectInput = False
          GlyphKind = gkEllipsis
          ButtonWidth = 16
          NumGlyphs = 1
          TabOrder = 8
        end
        object ed_GrOtp: TComboEdit
          Left = 10
          Top = 209
          Width = 311
          Height = 21
          DirectInput = False
          GlyphKind = gkEllipsis
          ButtonWidth = 16
          NumGlyphs = 1
          TabOrder = 9
          OnButtonClick = ed_GrOtpButtonClick
        end
        object ed_StanOtp: TComboEdit
          Left = 112
          Top = 231
          Width = 209
          Height = 21
          DirectInput = False
          GlyphKind = gkEllipsis
          ButtonWidth = 16
          NumGlyphs = 1
          TabOrder = 11
          OnButtonClick = ed_StanOtpButtonClick
        end
        object ed_StanOtpKod: TEdit
          Left = 10
          Top = 232
          Width = 97
          Height = 21
          ReadOnly = True
          TabOrder = 10
        end
        object ed_Stan: TComboEdit
          Left = 112
          Top = 255
          Width = 209
          Height = 21
          DirectInput = False
          GlyphKind = gkEllipsis
          ButtonWidth = 16
          NumGlyphs = 1
          TabOrder = 13
          OnButtonClick = ed_StanButtonClick
        end
        object ed_StanKod: TEdit
          Left = 10
          Top = 256
          Width = 97
          Height = 21
          ReadOnly = True
          TabOrder = 12
        end
        object ed_Poluch: TComboEdit
          Left = 10
          Top = 278
          Width = 311
          Height = 21
          DirectInput = False
          GlyphKind = gkEllipsis
          ButtonWidth = 16
          NumGlyphs = 1
          TabOrder = 14
          OnButtonClick = ed_PoluchButtonClick
        end
        object ed_Potreb: TComboEdit
          Left = 10
          Top = 301
          Width = 311
          Height = 21
          DirectInput = False
          GlyphKind = gkEllipsis
          ButtonWidth = 16
          NumGlyphs = 1
          TabOrder = 15
          OnButtonClick = ed_PotrebButtonClick
        end
        object ed_Vetka: TComboEdit
          Left = 10
          Top = 324
          Width = 311
          Height = 21
          DirectInput = False
          GlyphKind = gkEllipsis
          ButtonWidth = 16
          NumGlyphs = 1
          TabOrder = 16
          OnButtonClick = ed_VetkaButtonClick
        end
        object ed_NpoDog: TComboEdit
          Left = 10
          Top = 141
          Width = 191
          Height = 21
          DirectInput = False
          GlyphKind = gkEllipsis
          ButtonWidth = 16
          NumGlyphs = 1
          TabOrder = 6
          OnButtonClick = ed_NpoDogButtonClick
          OnChange = ed_NpoDogChange
        end
        object ed_Date_Razn: TDateTimePicker
          Left = 9
          Top = 25
          Width = 128
          Height = 21
          Date = 37070.390091736100000000
          Time = 37070.390091736100000000
          TabOrder = 0
        end
      end
      object PanelTitle: TPanel
        Left = 0
        Top = 0
        Width = 164
        Height = 374
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
        object lb_VBELN: TLabel
          Left = 65
          Top = 4
          Width = 96
          Height = 13
          Alignment = taRightJustify
          Caption = #1056#1072#1079#1085#1072#1088#1103#1076#1082#1072' R3:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 77
          Top = 52
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 27
          Top = 75
          Width = 134
          Height = 13
          Alignment = taRightJustify
          Caption = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088#1086#1074#1082#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 107
          Top = 98
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1088#1086#1076#1091#1082#1090':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 2
          Top = 121
          Width = 159
          Height = 13
          Alignment = taRightJustify
          Caption = #1044#1086#1075#1086#1074#1086#1088' '#1051#1059#1050#1054#1049#1051'-'#1050#1083#1080#1077#1085#1090':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 28
          Top = 143
          Width = 133
          Height = 13
          Alignment = taRightJustify
          Caption = #1044#1086#1075#1086#1074#1086#1088' '#1053#1055#1054'-'#1050#1083#1080#1077#1085#1090':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 6
          Top = 190
          Width = 155
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 79
          Top = 213
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 27
          Top = 236
          Width = 134
          Height = 13
          Alignment = taRightJustify
          Caption = #1057#1090#1072#1085#1094#1080#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 34
          Top = 259
          Width = 127
          Height = 13
          Alignment = taRightJustify
          Caption = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 87
          Top = 282
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 79
          Top = 305
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 50
          Top = 328
          Width = 111
          Height = 13
          Alignment = taRightJustify
          Caption = #1042#1077#1090#1082#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_PriceR3: TLabel
          Left = 126
          Top = 351
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = #1062#1077#1085#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 20
          Top = 167
          Width = 141
          Height = 13
          Alignment = taRightJustify
          Caption = #1044#1086#1075#1086#1074#1086#1088' '#1074' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1077':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 52
          Top = 28
          Width = 109
          Height = 13
          Alignment = taRightJustify
          Caption = #1044#1072#1090#1072' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object tabPlan: TTabSheet
      Caption = #1055#1083#1072#1085' '#1087#1086#1089#1090#1072#1074#1086#1082
      ImageIndex = 3
      OnShow = tabPlanShow
      object Panel4: TPanel
        Left = 0
        Top = 374
        Width = 753
        Height = 33
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          753
          33)
        object btNext3: TBitBtn
          Left = 583
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Next
          Anchors = [akRight, akBottom]
          BiDiMode = bdRightToLeft
          Caption = #1044#1072#1083#1100#1096#1077
          ParentBiDiMode = False
          TabOrder = 0
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
            FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            000000000000000000000000000000000000000000000000FF000000FF000000
            FF000000FF000000FF000000000000000000FF00FF00FF00FF00000000000000
            FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
            FF000000FF000000FF000000FF000000FF000000000000000000000000000000
            000000000000000000000000000000000000000000000000FF000000FF000000
            FF000000FF000000FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
            FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btPrev3: TBitBtn
          Left = 498
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Back
          Anchors = [akRight, akBottom]
          Caption = #1053#1072#1079#1072#1076
          TabOrder = 1
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
            FF000000FF000000FF000000FF000000FF000000FF0000000000FF00FF00FF00
            FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
            0000000000000000000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btCancel3: TBitBtn
          Left = 412
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Cancel
          Anchors = [akRight, akBottom]
          Caption = #1054#1090#1084#1077#1085#1072
          TabOrder = 2
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            840000FFFF000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 753
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label36: TLabel
          Left = 5
          Top = 4
          Width = 111
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1083#1072#1085#1086#1074#1099#1081' '#1087#1077#1088#1080#1086#1076':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 7
          Top = 24
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = #1044#1086#1075#1086#1074#1086#1088':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText7: TDBText
          Left = 67
          Top = 25
          Width = 177
          Height = 13
          Color = clBtnFace
          DataField = 'DOG_NUMBER'
          DataSource = ds_Dog
          ParentColor = False
        end
        object Label23: TLabel
          Left = 257
          Top = 25
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1088#1086#1076#1091#1082#1090':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText8: TDBText
          Left = 314
          Top = 25
          Width = 335
          Height = 13
          Color = clBtnFace
          DataField = 'NAME_NPR'
          DataSource = ds_Prod
          ParentColor = False
        end
        object cbMonth: TComboBox
          Left = 120
          Top = 2
          Width = 105
          Height = 21
          Enabled = False
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            #1071#1085#1074#1072#1088#1100
            #1060#1077#1074#1088#1072#1083#1100
            #1052#1072#1088#1090
            #1040#1087#1088#1077#1083#1100
            #1052#1072#1081
            #1048#1102#1085#1100
            #1048#1102#1083#1100
            #1040#1074#1075#1091#1089#1090
            #1057#1077#1085#1090#1103#1073#1088#1100
            #1054#1082#1090#1103#1073#1088#1100
            #1053#1086#1103#1073#1088#1100
            #1044#1077#1082#1072#1073#1088#1100)
        end
        object edYear: TRxSpinEdit
          Left = 232
          Top = 2
          Width = 57
          Height = 21
          ButtonKind = bkStandard
          Decimal = 0
          MaxValue = 2050.000000000000000000
          MinValue = 2001.000000000000000000
          Value = 2001.000000000000000000
          Enabled = False
          MaxLength = 4
          TabOrder = 1
        end
      end
      object gridPlanStru: TDBGridEh
        Left = 0
        Top = 41
        Width = 753
        Height = 112
        Align = alTop
        AllowedOperations = []
        AllowedSelections = []
        Color = clBtnFace
        Ctl3D = False
        DataSource = ds_PlanStru
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        HorzScrollBar.Visible = False
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghClearSelection]
        ParentCtl3D = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        VertScrollBar.VisibleMode = sbNeverShowEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'LEVEL_POS'
            Footers = <>
            Width = 28
          end
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Width = 306
          end
          item
            EditButtons = <>
            FieldName = 'PLAN_VES'
            Footers = <>
            Title.Caption = #1042#1077#1089' ('#1090#1085'.)'
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = 'PLAN_SUM'
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072' ('#1088#1091#1073'.)'
            Width = 103
          end>
      end
      object gridPlanPost: TDBGridEh
        Left = 0
        Top = 153
        Width = 753
        Height = 221
        Align = alClient
        DataSource = ds_PlanPost
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        FrozenCols = 1
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        ReadOnly = True
        SumList.Active = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PLANSTRU_ID'
            Footers = <>
            Width = 38
          end
          item
            EditButtons = <>
            FieldName = 'PLANSTRU_NAME'
            Footers = <>
            Width = 231
          end
          item
            EditButtons = <>
            FieldName = 'PLAN_CENA'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072' ('#1088#1091#1073'/'#1090#1085'.)'
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'PLAN_VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1042#1077#1089' ('#1090#1085'.)'
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'PLAN_SUM'
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072' ('#1088#1091#1073'.)'
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'TONN_DECLARED'
            Footers = <>
            Width = 63
          end
          item
            EditButtons = <>
            FieldName = 'TONN_R'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'TONN_LOADED'
            Footers = <>
          end>
      end
    end
    object tabUslDog: TTabSheet
      Caption = #1059#1089#1083#1086#1074#1080#1103' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
      ImageIndex = 5
      OnShow = tabUslDogShow
      object Panel6: TPanel
        Left = 0
        Top = 374
        Width = 753
        Height = 33
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          753
          33)
        object btNext2: TBitBtn
          Left = 583
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Next
          Anchors = [akRight, akBottom]
          BiDiMode = bdRightToLeft
          Caption = #1044#1072#1083#1100#1096#1077
          ParentBiDiMode = False
          TabOrder = 0
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
            FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            000000000000000000000000000000000000000000000000FF000000FF000000
            FF000000FF000000FF000000000000000000FF00FF00FF00FF00000000000000
            FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
            FF000000FF000000FF000000FF000000FF000000000000000000000000000000
            000000000000000000000000000000000000000000000000FF000000FF000000
            FF000000FF000000FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
            FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btPrev2: TBitBtn
          Left = 498
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Back
          Anchors = [akRight, akBottom]
          Caption = #1053#1072#1079#1072#1076
          TabOrder = 1
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
            FF000000FF000000FF000000FF000000FF000000FF0000000000FF00FF00FF00
            FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
            0000000000000000000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btCancel2: TBitBtn
          Left = 412
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Cancel
          Anchors = [akRight, akBottom]
          Caption = #1054#1090#1084#1077#1085#1072
          TabOrder = 2
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            840000FFFF000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 753
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label51: TLabel
          Left = 3
          Top = 19
          Width = 145
          Height = 13
          Alignment = taRightJustify
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1089#1083#1086#1074#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText3: TDBText
          Left = 152
          Top = 20
          Width = 521
          Height = 13
          Color = clBtnFace
          DataField = 'USL_NAME'
          DataSource = ds_UslDog
          ParentColor = False
        end
        object Label52: TLabel
          Left = 47
          Top = 35
          Width = 101
          Height = 13
          Alignment = taRightJustify
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1094#1077#1085#1099':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText4: TDBText
          Left = 152
          Top = 36
          Width = 521
          Height = 13
          Color = clBtnFace
          DataField = 'CAT_CEN_NAME'
          DataSource = ds_UslDog
          ParentColor = False
        end
        object Label21: TLabel
          Left = 92
          Top = 3
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = #1044#1086#1075#1086#1074#1086#1088':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 152
          Top = 4
          Width = 177
          Height = 13
          Color = clBtnFace
          DataField = 'DOG_NUMBER'
          DataSource = ds_UslDog
          ParentColor = False
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 49
        Width = 753
        Height = 85
        Align = alTop
        Caption = ' '#1060#1080#1083#1100#1090#1088' '
        TabOrder = 2
        object Label53: TLabel
          Left = 401
          Top = 16
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = #1057' '#1076#1072#1090#1099':'
        end
        object Label54: TLabel
          Left = 528
          Top = 16
          Width = 12
          Height = 13
          Alignment = taCenter
          Caption = #1087#1086
        end
        object Label55: TLabel
          Left = 144
          Top = 40
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = #1054#1090#1089#1088#1086#1095#1082#1072':'
        end
        object Label56: TLabel
          Left = 6
          Top = 40
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = #1050#1072#1090'. '#1094#1077#1085#1099':'
        end
        object Label57: TLabel
          Left = 284
          Top = 40
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = '% '#1089#1090#1088#1072#1093#1086#1074#1082#1080':'
        end
        object Label58: TLabel
          Left = 435
          Top = 40
          Width = 116
          Height = 13
          Alignment = taRightJustify
          Caption = #1047#1072' '#1086#1088#1075'.'#1090#1088#1072#1085#1089#1087'.('#1088#1091#1073'./'#1090'.):'
        end
        object btRefreshUsl: TRxSpeedButton
          Left = 637
          Top = 12
          Width = 25
          Height = 25
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF008400000084000000840000008400
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0084000000840000008400000084000000840000008400
            00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00
            FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
            FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
            FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
            FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF008400
            0000FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF008400
            0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008400
            00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008400
            0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object Label41: TLabel
          Left = 7
          Top = 64
          Width = 136
          Height = 13
          Alignment = taRightJustify
          Caption = #1043#1088#1091#1087#1087#1072' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1094#1077#1085':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cb_Baz: TCheckBox
          Left = 8
          Top = 16
          Width = 113
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1041#1072#1079#1086#1074#1099#1077
          TabOrder = 0
        end
        object cb_Utv: TCheckBox
          Left = 120
          Top = 16
          Width = 145
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1059#1090#1074#1077#1088#1078#1076#1077#1085#1085#1099#1077
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object cb_Akt: TCheckBox
          Left = 272
          Top = 16
          Width = 129
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1072#1082#1090#1091#1072#1083#1100#1085#1099#1077
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object ed_BeginDate_flt: TDateTimePicker
          Left = 443
          Top = 13
          Width = 82
          Height = 21
          Date = 37070.390091736100000000
          Time = 37070.390091736100000000
          TabOrder = 3
        end
        object ed_EndDate_flt: TDateTimePicker
          Left = 547
          Top = 13
          Width = 82
          Height = 21
          Date = 37070.390091736100000000
          Time = 37070.390091736100000000
          TabOrder = 4
        end
        object ed_KolDn_flt: TRxCalcEdit
          Left = 200
          Top = 37
          Width = 73
          Height = 21
          AutoSize = False
          DisplayFormat = ',#'
          NumGlyphs = 2
          TabOrder = 5
        end
        object ed_CatCen_flt: TRxCalcEdit
          Left = 64
          Top = 37
          Width = 73
          Height = 21
          AutoSize = False
          DisplayFormat = ',#'
          NumGlyphs = 2
          TabOrder = 6
        end
        object ed_Strah_flt: TRxCalcEdit
          Left = 356
          Top = 37
          Width = 73
          Height = 21
          AutoSize = False
          DisplayFormat = ',#.##'
          NumGlyphs = 2
          TabOrder = 7
        end
        object ed_SumUsl_flt: TRxCalcEdit
          Left = 556
          Top = 37
          Width = 73
          Height = 21
          AutoSize = False
          DisplayFormat = ',#.##'
          NumGlyphs = 2
          TabOrder = 8
        end
        object lc_CatCenGrp: TRxDBLookupCombo
          Left = 145
          Top = 60
          Width = 311
          Height = 21
          DropDownCount = 25
          DisplayEmpty = '-- '#1053#1045' '#1042#1067#1041#1056#1040#1053#1040' --'
          EmptyValue = '-1'
          LookupField = 'ID_NPR'
          LookupDisplay = 'NAME_NPR'
          TabOrder = 9
        end
      end
      object gridUsl: TDBGridEh
        Left = 0
        Top = 134
        Width = 753
        Height = 240
        Align = alClient
        DataSource = ds_UslDog
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FrozenCols = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'USL_NUMBER'
            Footers = <>
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'PAYFORM_NAME'
            Footers = <>
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'CAT_CEN_ID'
            Footers = <>
            Width = 36
          end
          item
            EditButtons = <>
            FieldName = 'KOL_DN'
            Footers = <>
            Width = 39
          end
          item
            EditButtons = <>
            FieldName = 'PROC_INSURE'
            Footers = <>
            Width = 42
          end
          item
            EditButtons = <>
            FieldName = 'USL_SUM'
            Footers = <>
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'PROC_PRED'
            Footers = <>
            Width = 37
          end
          item
            EditButtons = <>
            FieldName = 'PROC_PENI'
            Footers = <>
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'NEUST'
            Footers = <>
            Width = 44
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'USL_BAZ'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Width = 35
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'USL_UTV'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Width = 33
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'USL_AKT'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Width = 32
          end
          item
            EditButtons = <>
            FieldName = 'USL_BEGIN_DATE'
            Footers = <>
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'USL_END_DATE'
            Footers = <>
            Width = 62
          end>
      end
    end
    object tabPrices: TTabSheet
      Caption = #1062#1077#1085#1072
      ImageIndex = 5
      OnShow = tabPricesShow
      object rb_SourceNPR: TRadioGroup
        Left = 0
        Top = 0
        Width = 753
        Height = 35
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = #1055#1088#1086#1076#1091#1082#1090' ('#1090#1086#1074#1072#1088')'
        Columns = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          #1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1081' '#1074#1099#1088#1072#1073#1086#1090#1082#1080
          #1055#1086#1082#1091#1087#1085#1086#1081' '#1087#1088#1086#1076#1091#1082#1090
          #1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100' '#1076#1088#1091#1075#1080#1093' '#1082#1086#1084#1087#1072#1085#1080#1081)
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        OnClick = rb_SourceNPRClick
      end
      object Panel13: TPanel
        Left = 0
        Top = 35
        Width = 753
        Height = 158
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object gb_Sobstv: TGroupBox
          Left = 0
          Top = 0
          Width = 337
          Height = 158
          Align = alLeft
          Caption = ' '#1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100' '
          TabOrder = 0
          object Label38: TLabel
            Left = 10
            Top = 16
            Width = 133
            Height = 13
            Alignment = taRightJustify
            Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1086#1090#1075#1088#1091#1079#1082#1080':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label39: TLabel
            Left = 10
            Top = 54
            Width = 113
            Height = 13
            Alignment = taRightJustify
            Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1085'/'#1087#1088':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label40: TLabel
            Left = 10
            Top = 92
            Width = 103
            Height = 13
            Alignment = taRightJustify
            Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082' '#1085'/'#1087#1088':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lc_Nazn_Otg: TRxDBLookupCombo
            Left = 8
            Top = 31
            Width = 321
            Height = 21
            DropDownCount = 25
            DisplayEmpty = '-- '#1053#1045' '#1042#1067#1041#1056#1040#1053' --'
            EmptyValue = '-1'
            LookupField = 'ID'
            LookupDisplay = 'NAZN_OTG_NAME'
            LookupSource = ds_Nazn_Otg
            TabOrder = 0
          end
          object ed_Owner: TComboEdit
            Left = 8
            Top = 69
            Width = 321
            Height = 21
            DirectInput = False
            GlyphKind = gkEllipsis
            ButtonWidth = 16
            NumGlyphs = 1
            TabOrder = 1
            OnChange = ed_OwnerChange
          end
          object ed_Post: TComboEdit
            Left = 8
            Top = 107
            Width = 321
            Height = 21
            DirectInput = False
            GlyphKind = gkEllipsis
            ButtonWidth = 16
            NumGlyphs = 1
            TabOrder = 2
            OnChange = ed_PostChange
          end
        end
        object gb_Price: TGroupBox
          Left = 337
          Top = 0
          Width = 416
          Height = 158
          Align = alClient
          Caption = ' '#1062#1077#1085#1072' '
          TabOrder = 1
          object Panel11: TPanel
            Left = 2
            Top = 15
            Width = 412
            Height = 35
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label42: TLabel
              Left = 7
              Top = 2
              Width = 101
              Height = 13
              Alignment = taRightJustify
              Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1094#1077#1085#1099':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText5: TDBText
              Left = 112
              Top = 3
              Width = 25
              Height = 12
              DataField = 'CAT_CEN_ID'
              DataSource = ds_Prices
            end
            object Label59: TLabel
              Left = 54
              Top = 18
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = #1055#1088#1086#1076#1091#1082#1090':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText6: TDBText
              Left = 112
              Top = 19
              Width = 265
              Height = 12
              DataField = 'NAME_NPR'
              DataSource = ds_Prices
            end
          end
          object gridPrices: TDBGridEh
            Left = 2
            Top = 50
            Width = 412
            Height = 106
            Align = alClient
            DataSource = ds_Prices
            Flat = False
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                EditButtons = <>
                FieldName = 'BEGIN_DATE'
                Footers = <>
                Title.TitleButton = True
                Width = 124
              end
              item
                DisplayFormat = '#0.00'
                EditButtons = <>
                FieldName = 'CENA'
                Footers = <>
                Title.TitleButton = True
                Width = 102
              end
              item
                DisplayFormat = '#0.00'
                EditButtons = <>
                FieldName = 'CENA_OTP'
                Footers = <>
                Title.TitleButton = True
                Width = 126
              end>
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 374
        Width = 753
        Height = 33
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 2
        DesignSize = (
          753
          33)
        object btNext4: TBitBtn
          Left = 583
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Next
          Anchors = [akRight, akBottom]
          BiDiMode = bdRightToLeft
          Caption = #1044#1072#1083#1100#1096#1077
          ParentBiDiMode = False
          TabOrder = 0
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
            FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            000000000000000000000000000000000000000000000000FF000000FF000000
            FF000000FF000000FF000000000000000000FF00FF00FF00FF00000000000000
            FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
            FF000000FF000000FF000000FF000000FF000000000000000000000000000000
            000000000000000000000000000000000000000000000000FF000000FF000000
            FF000000FF000000FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
            FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btPrev4: TBitBtn
          Left = 498
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Back
          Anchors = [akRight, akBottom]
          Caption = #1053#1072#1079#1072#1076
          TabOrder = 1
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
            FF000000FF000000FF000000FF000000FF000000FF0000000000FF00FF00FF00
            FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
            0000000000000000000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btCancel4: TBitBtn
          Left = 412
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Cancel
          Anchors = [akRight, akBottom]
          Caption = #1054#1090#1084#1077#1085#1072
          TabOrder = 2
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            840000FFFF000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        end
      end
    end
    object tabDop: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099
      ImageIndex = 2
      OnShow = tabDopShow
      object Panel3: TPanel
        Left = 0
        Top = 374
        Width = 753
        Height = 33
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          753
          33)
        object btNext5: TBitBtn
          Left = 583
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Next
          Anchors = [akRight, akBottom]
          BiDiMode = bdRightToLeft
          Caption = #1044#1072#1083#1100#1096#1077
          ParentBiDiMode = False
          TabOrder = 0
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
            FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            000000000000000000000000000000000000000000000000FF000000FF000000
            FF000000FF000000FF000000000000000000FF00FF00FF00FF00000000000000
            FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
            FF000000FF000000FF000000FF000000FF000000000000000000000000000000
            000000000000000000000000000000000000000000000000FF000000FF000000
            FF000000FF000000FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF000000FF000000
            FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btPrev5: TBitBtn
          Left = 498
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Back
          Anchors = [akRight, akBottom]
          Caption = #1053#1072#1079#1072#1076
          TabOrder = 1
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
            FF000000FF000000FF000000FF000000FF000000FF0000000000FF00FF00FF00
            FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
            0000000000000000000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btCancel5: TBitBtn
          Left = 412
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Cancel
          Anchors = [akRight, akBottom]
          Caption = #1054#1090#1084#1077#1085#1072
          TabOrder = 2
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            840000FFFF000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        end
      end
      object gb_GD: TGroupBox
        Left = 0
        Top = 0
        Width = 753
        Height = 189
        Align = alTop
        Caption = ' '#1046'/'#1076' '#1088#1077#1082#1074#1080#1079#1080#1090#1099' '
        TabOrder = 1
        object Label29: TLabel
          Left = 70
          Top = 16
          Width = 126
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1090#1072#1088#1080#1092#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 14
          Top = 40
          Width = 182
          Height = 13
          Alignment = taRightJustify
          Caption = #1050#1086#1076' '#1080#1089#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1090#1072#1088#1080#1092#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 318
          Top = 40
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'N '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 14
          Top = 88
          Width = 78
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 39
          Top = 112
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = #1043#1088#1072#1092#1072' 4:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 46
          Top = 64
          Width = 150
          Height = 13
          Alignment = taRightJustify
          Caption = #1059#1089#1083#1086#1074#1080#1103' '#1086#1087#1083#1072#1090#1099' '#1090#1072#1088#1080#1092#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 527
          Top = 40
          Width = 109
          Height = 13
          Alignment = taRightJustify
          Caption = #1058#1072#1088#1080#1092' '#1079#1072' 1 '#1090#1086#1085#1085#1091':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ed_TEX_PD: TEdit
          Left = 200
          Top = 12
          Width = 113
          Height = 21
          TabOrder = 0
          OnKeyDown = ed_TEX_PDKeyDown
        end
        object ed_K_TAR: TEdit
          Left = 200
          Top = 36
          Width = 113
          Height = 21
          TabOrder = 1
        end
        object ed_Transp: TEdit
          Left = 408
          Top = 36
          Width = 113
          Height = 21
          TabOrder = 2
        end
        object lc_Forma2: TRxDBLookupCombo
          Left = 200
          Top = 60
          Width = 321
          Height = 21
          DropDownCount = 25
          DisplayEmpty = '-- '#1053#1045' '#1042#1067#1041#1056#1040#1053#1054' --'
          EmptyValue = '-1'
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = ds_Forma2
          TabOrder = 3
        end
        object ed_Tarif1Tonn: TRxCalcEdit
          Left = 640
          Top = 37
          Width = 105
          Height = 21
          AutoSize = False
          DisplayFormat = ',#0.00'
          NumGlyphs = 2
          TabOrder = 4
        end
        object ed_Prim: TEdit
          Left = 93
          Top = 84
          Width = 650
          Height = 21
          TabOrder = 5
        end
        object ed_Gr4: TEdit
          Left = 93
          Top = 108
          Width = 650
          Height = 21
          TabOrder = 6
        end
        object rb_Sliv_V: TRadioGroup
          Left = 8
          Top = 153
          Width = 361
          Height = 30
          Columns = 2
          Ctl3D = False
          ItemIndex = 0
          Items.Strings = (
            #1058#1086#1083#1100#1082#1086' '#1089' '#1085#1080#1078#1085#1080#1084' '#1089#1083#1080#1074#1086#1084
            #1042#1086#1079#1084#1086#1078#1085#1072' '#1086#1090#1075#1088#1091#1079#1082#1072' '#1089' '#1074#1077#1088#1093#1085#1080#1084)
          ParentCtl3D = False
          TabOrder = 8
        end
        object rb_Obogr: TRadioGroup
          Left = 368
          Top = 129
          Width = 272
          Height = 30
          Columns = 2
          Ctl3D = False
          ItemIndex = 0
          Items.Strings = (
            #1042#1072#1075#1086#1085#1099' '#1073#1077#1079' '#1086#1073#1086#1075#1088#1077#1074#1072
            #1042#1072#1075#1086#1085#1099' '#1089' '#1086#1073#1086#1075#1088#1077#1074#1086#1084)
          ParentCtl3D = False
          TabOrder = 9
        end
        object rb_8_axis: TRadioGroup
          Left = 8
          Top = 129
          Width = 361
          Height = 30
          Columns = 2
          Ctl3D = False
          ItemIndex = 0
          Items.Strings = (
            #1058#1086#1083#1100#1082#1086' 4-'#1086#1089#1085#1099#1077' '#1074#1072#1075#1086#1085#1099
            #1042#1086#1079#1084#1086#1078#1085#1072' '#1086#1090#1075#1088#1091#1079#1082#1072' 8-'#1086#1089#1085#1099#1084#1080)
          ParentCtl3D = False
          TabOrder = 7
        end
        object lc_TEX_PD: TRxDBLookupCombo
          Left = 320
          Top = 12
          Width = 425
          Height = 21
          DropDownCount = 25
          DisplayEmpty = '-- '#1053#1045' '#1042#1067#1041#1056#1040#1053' --'
          EmptyValue = '-1'
          LookupField = 'ID'
          LookupDisplay = 'TEX_PD_NAME'
          LookupSource = ds_TEX_PD
          TabOrder = 10
          OnChange = lc_TEX_PDChange
        end
      end
      object Panel15: TPanel
        Left = 0
        Top = 189
        Width = 753
        Height = 185
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object gb_Gosprog: TGroupBox
          Left = 0
          Top = 0
          Width = 345
          Height = 185
          Align = alLeft
          Caption = ' '#1043#1086#1089#1087#1088#1086#1075#1088#1072#1084#1084#1072' '
          TabOrder = 0
          object Label37: TLabel
            Left = 6
            Top = 43
            Width = 182
            Height = 13
            Alignment = taRightJustify
            Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' '#1087#1086' '#1075#1086#1089#1087#1088#1086#1075#1088#1072#1084#1084#1077':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lc_Gosprog: TRxDBLookupCombo
            Left = 6
            Top = 17
            Width = 299
            Height = 21
            DropDownCount = 25
            DisplayEmpty = '-- '#1053#1045' '#1042#1067#1041#1056#1040#1053#1040' -'
            EmptyValue = '-1'
            LookupField = 'ID'
            LookupDisplay = 'GOSPROG_NAME'
            LookupSource = ds_Gosprog
            TabOrder = 0
          end
          object lc_GP_NAPR: TRxDBLookupCombo
            Left = 6
            Top = 57
            Width = 299
            Height = 21
            DropDownCount = 25
            DisplayEmpty = '-- '#1053#1045' '#1042#1067#1041#1056#1040#1053' --'
            EmptyValue = '-1'
            LookupField = 'ID'
            LookupDisplay = 'NAME'
            LookupSource = ds_GP_NAPR
            TabOrder = 1
          end
        end
      end
    end
    object tabFinish: TTabSheet
      Caption = #1060#1048#1053#1048#1064
      ImageIndex = 4
      OnShow = tabFinishShow
      object Panel5: TPanel
        Left = 0
        Top = 374
        Width = 753
        Height = 33
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          753
          33)
        object btFinish6: TBitBtn
          Left = 671
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Finish
          Anchors = [akRight, akBottom]
          BiDiMode = bdRightToLeft
          Caption = #1043#1086#1090#1086#1074#1086
          ParentBiDiMode = False
          TabOrder = 0
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000FF00FF00FF00FF00FF00FF000000
            000000BDBD0000BDBD0000000000FF00FF00FF00FF0000000000000000000000
            00000000000000BDBD0000BDBD0000000000FF00FF00FF00FF00FF00FF000000
            000000BDBD0000BDBD0000000000FF00FF00FF00FF0000000000000000000000
            00000000000000BDBD0000BDBD0000000000FF00FF00FF00FF00FF00FF000000
            000000BDBD0000BDBD0000000000FF00FF00FF00FF0000000000000000000000
            00000000000000BDBD0000BDBD0000000000FF00FF00FF00FF00FF00FF000000
            000000BDBD0000BDBD0000000000000000000000000000000000000000000000
            00000000000000BDBD0000BDBD0000000000FF00FF00FF00FF00FF00FF000000
            000000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BD
            BD0000BDBD0000BDBD0000BDBD0000000000FF00FF00FF00FF00FF00FF000000
            000000BDBD0000BDBD0000000000000000000000000000000000000000000000
            00000000000000BDBD0000BDBD0000000000FF00FF00FF00FF00FF00FF000000
            000000BDBD0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF000000000000BDBD0000000000FF00FF00FF00FF00FF00FF000000
            000000BDBD0000000000FFFFFF00FF000000FF000000FF000000FF000000FFFF
            FF00FFFFFF000000000000BDBD0000000000FF00FF00FF00FF00FF00FF000000
            000000BDBD0000000000FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
            FF00FFFFFF000000000000BDBD0000000000FF00FF00FF00FF00FF00FF000000
            000000BDBD00FF00FF00FFFFFF00FF000000FF000000FF000000FF000000FFFF
            FF00FFFFFF00000000000000000000000000FF00FF00FF00FF00FF00FF000000
            0000FF00FF00FF00FF00FF000000FF000000FF000000FFFFFF00FF000000FFFF
            FF00FFFFFF00000000008484840000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00
            FF0000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btPrev6: TBitBtn
          Left = 498
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Back
          Anchors = [akRight, akBottom]
          Caption = #1053#1072#1079#1072#1076
          TabOrder = 1
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
            FF000000FF000000FF000000FF000000FF000000FF0000000000FF00FF00FF00
            FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
            0000000000000000000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000FF000000FF000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btCancel6: TBitBtn
          Left = 412
          Top = 4
          Width = 75
          Height = 25
          Action = acNewMonth_Cancel
          Anchors = [akRight, akBottom]
          Caption = #1054#1090#1084#1077#1085#1072
          TabOrder = 2
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            840000FFFF000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF
            0000000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000840000008400000084000000840000008400000084000000
            8400000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        end
      end
      object gb_Summary: TGroupBox
        Left = 0
        Top = 54
        Width = 753
        Height = 320
        Align = alClient
        Caption = ' '#1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
        TabOrder = 1
        object lb_Summary: TListBox
          Left = 2
          Top = 15
          Width = 749
          Height = 310
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 753
        Height = 54
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLabel
          Left = 10
          Top = 8
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = #1054#1090#1075#1088#1091#1079#1080#1090#1100':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 337
          Top = 8
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = #1087#1086' '#1094#1077#1085#1077':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 392
          Top = 9
          Width = 89
          Height = 14
          DataField = 'CENA_OTP'
          DataSource = ds_Prices
        end
        object Label15: TLabel
          Left = 487
          Top = 8
          Width = 117
          Height = 13
          Alignment = taRightJustify
          Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1079#1072#1076#1072#1085#1080#1102':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 6
          Top = 31
          Width = 118
          Height = 13
          Alignment = taRightJustify
          Caption = #1053#1086#1084#1077#1088' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 187
          Top = 8
          Width = 18
          Height = 13
          Alignment = taRightJustify
          Caption = #1090#1085'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 284
          Top = 8
          Width = 20
          Height = 13
          Alignment = taRightJustify
          Caption = #1090'/'#1089
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText9: TDBText
          Left = 608
          Top = 9
          Width = 89
          Height = 14
          DataField = 'SUM_ZD'
          DataSource = ds_Prices
        end
        object ed_ves: TRxCalcEdit
          Left = 80
          Top = 5
          Width = 105
          Height = 21
          AutoSize = False
          DisplayFormat = ',#0.000'
          NumGlyphs = 2
          TabOrder = 0
          OnChange = ed_vesChange
        end
        object ed_Nom_zd: TEdit
          Left = 128
          Top = 28
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object btAutoGen: TButton
          Left = 257
          Top = 25
          Width = 232
          Height = 25
          Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1085#1086#1084#1077#1088#1072
          TabOrder = 2
        end
        object ed_cist: TRxCalcEdit
          Left = 208
          Top = 5
          Width = 73
          Height = 21
          AutoSize = False
          DisplayFormat = ',#0'
          NumGlyphs = 2
          TabOrder = 3
        end
      end
    end
  end
  object ActionManager1: TActionManager
    Left = 340
    Top = 272
    StyleName = 'XP Style'
    object acNewMonth_Cancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      ImageIndex = 12
      OnExecute = acNewMonth_CancelExecute
    end
    object acNewMonth_Finish: TAction
      Caption = #1043#1086#1090#1086#1074#1086
      Hint = #1042#1099#1093#1086#1076' '#1089' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077#1084' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      ImageIndex = 13
      OnExecute = acNewMonth_FinishExecute
    end
    object acNewMonth_Next: TAction
      Caption = #1044#1072#1083#1100#1096#1077
      Hint = #1044#1072#1083#1100#1096#1077
      ImageIndex = 19
      OnExecute = acNewMonth_NextExecute
    end
    object acNewMonth_Back: TAction
      Caption = #1053#1072#1079#1072#1076
      Hint = #1053#1072#1079#1072#1076
      ImageIndex = 18
      OnExecute = acNewMonth_BackExecute
    end
    object acEnterTab: TAction
      Caption = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1089#1090#1088#1072#1085#1080#1094#1091
    end
  end
  object ds_UslDog: TDataSource
    DataSet = q_UslDog
    Left = 332
    Top = 50
  end
  object q_Prices: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID,'
      '  A.CAT_CEN_ID,'
      '  B.NAME_NPR,'
      '  A.BEGIN_DATE,'
      '  A.CENA,'
      '  A.CENA_OTP'
      'FROM NPR_PRICES A, KLS_PROD B'
      'WHERE A.PROD_ID_NPR=B.ID_NPR '
      '  AND A.CAT_CEN_ID=0'
      '  AND A.PROD_ID_NPR='#39'00000'#39
      '  AND 1=1 -- OWNERSHIP_ID'
      '  AND A.SUPPLIER_ID=0'
      '  AND A.BEGIN_DATE<=A.END_DATE'
      '  AND A.END_DATE>=A.BEGIN_DATE'
      '  AND A.IS_ORIGINAL=1'
      'ORDER BY A.BEGIN_DATE')
    QBEDefinition.QBEFieldDefs = {
      03000000060000000A0000004341545F43454E5F494401000000000200000049
      4401000000000A000000424547494E5F4441544501000000000400000043454E
      4101000000000800000043454E415F4F54500100000000080000004E414D455F
      4E50520100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_PricesBeforeOpen
    OnCalcFields = q_PricesCalcFields
    Left = 228
    Top = 138
    object q_PricesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_PricesCAT_CEN_ID: TIntegerField
      DisplayLabel = #1050#1072#1090'. '#1094#1077#1085#1099
      FieldName = 'CAT_CEN_ID'
      Required = True
    end
    object q_PricesLONG_NAME_NPR: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1076#1091#1082#1090#1072
      FieldName = 'NAME_NPR'
      Required = True
      Size = 60
    end
    object q_PricesBEGIN_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
      FieldName = 'BEGIN_DATE'
      Required = True
    end
    object q_PricesCENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1073#1077#1079' '#1085#1072#1083#1086#1075#1086#1074
      FieldName = 'CENA'
      Required = True
    end
    object q_PricesCENA_OTP: TFloatField
      DisplayLabel = #1054#1090#1087#1091#1089#1082#1085#1072#1103' '#1094#1077#1085#1072
      FieldName = 'CENA_OTP'
      Required = True
    end
    object q_PricesSUM_ZD: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUM_ZD'
      Calculated = True
    end
  end
  object ds_Prices: TDataSource
    DataSet = q_Prices
    Left = 260
    Top = 138
  end
  object q_UslDog: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  D.DOG_NUMBER, D.DOG_DATE, A.*,'
      '  B.PAYFORM_NAME,'
      '  C.CAT_CEN_NAME'
      'FROM USL_DOG A, KLS_PAYFORM B, KLS_CAT_CEN C, KLS_DOG D'
      'WHERE A.PAYFORM_ID=B.ID  AND A.CAT_CEN_ID=C.ID AND A.DOG_ID=D.ID'
      '  AND 1=1 -- C.CAT_CEN_GROUP_ID'
      '  AND A.DOG_ID=787'
      '  AND A.USL_BEGIN_DATE<=A.USL_END_DATE'
      '  AND A.USL_END_DATE>=A.USL_BEGIN_DATE'
      '  AND 1=1 -- KOL_DN'
      '  AND 1=1 -- '#1041#1072#1079#1086#1074#1086#1077
      '  AND A.USL_AKT=1 -- '#1040#1082#1090#1091#1072#1083#1100#1085#1086#1077
      '  AND A.USL_UTV=1 -- '#1059#1090#1074#1077#1088#1078#1076#1077#1085#1085#1086#1077
      '  AND 1=1 -- PROC_INSURE'
      '  AND 1=1 -- USL_SUM'
      '  AND 1=1 -- CAT_CEN_ID'
      'ORDER BY A.USL_NUMBER  '
      '  ')
    QBEDefinition.QBEFieldDefs = {
      030000001900000006000000444F475F494401000000000A00000055534C5F4E
      554D42455201000000000800000055534C5F4E414D4501000000000E00000055
      534C5F424547494E5F4441544501000000000C00000055534C5F454E445F4441
      544501000000000A0000005649445F55534C5F494401000000000B0000005041
      5944454C41595F494401000000000D00000050415944454C41595F4441544501
      00000000060000004B4F4C5F444E01000000000700000055534C5F414B540100
      0000000700000055534C5F55545601000000000700000055534C5F42415A0100
      0000000900000050524F435F5052454401000000000900000050524F435F5045
      4E4901000000000B00000050524F435F494E535552450100000000050000004E
      4555535401000000000700000055534C5F53554D01000000000A000000504159
      464F524D5F494401000000000A0000004341545F43454E5F4944010000000002
      000000494401000000000D0000004E504F4341545F43454E5F49440100000000
      0C000000504159464F524D5F4E414D4501000000000C0000004341545F43454E
      5F4E414D4501000000000A000000444F475F4E554D4245520100000000080000
      00444F475F444154450100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_UslDogBeforeOpen
    Left = 364
    Top = 58
    object q_UslDogDOG_NUMBER: TStringField
      FieldName = 'DOG_NUMBER'
      Required = True
      Size = 30
    end
    object q_UslDogDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
      Required = True
    end
    object q_UslDogDOG_ID: TIntegerField
      FieldName = 'DOG_ID'
      Required = True
    end
    object q_UslDogUSL_NUMBER: TIntegerField
      FieldName = 'USL_NUMBER'
      Required = True
    end
    object q_UslDogUSL_NAME: TStringField
      FieldName = 'USL_NAME'
      Required = True
      Size = 75
    end
    object q_UslDogUSL_BEGIN_DATE: TDateTimeField
      FieldName = 'USL_BEGIN_DATE'
      Required = True
    end
    object q_UslDogUSL_END_DATE: TDateTimeField
      FieldName = 'USL_END_DATE'
    end
    object q_UslDogVID_USL_ID: TIntegerField
      FieldName = 'VID_USL_ID'
      Required = True
    end
    object q_UslDogPAYDELAY_ID: TIntegerField
      FieldName = 'PAYDELAY_ID'
      Required = True
    end
    object q_UslDogPAYDELAY_DATE: TDateTimeField
      FieldName = 'PAYDELAY_DATE'
    end
    object q_UslDogKOL_DN: TIntegerField
      FieldName = 'KOL_DN'
      Required = True
    end
    object q_UslDogUSL_AKT: TIntegerField
      FieldName = 'USL_AKT'
      Required = True
    end
    object q_UslDogUSL_UTV: TIntegerField
      FieldName = 'USL_UTV'
      Required = True
    end
    object q_UslDogUSL_BAZ: TIntegerField
      FieldName = 'USL_BAZ'
      Required = True
    end
    object q_UslDogPROC_PRED: TIntegerField
      FieldName = 'PROC_PRED'
      Required = True
    end
    object q_UslDogPROC_PENI: TFloatField
      FieldName = 'PROC_PENI'
    end
    object q_UslDogPROC_INSURE: TFloatField
      FieldName = 'PROC_INSURE'
    end
    object q_UslDogNEUST: TFloatField
      FieldName = 'NEUST'
    end
    object q_UslDogUSL_SUM: TFloatField
      FieldName = 'USL_SUM'
      Required = True
    end
    object q_UslDogPAYFORM_ID: TIntegerField
      FieldName = 'PAYFORM_ID'
      Required = True
    end
    object q_UslDogCAT_CEN_ID: TIntegerField
      FieldName = 'CAT_CEN_ID'
      Required = True
    end
    object q_UslDogID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_UslDogNPOCAT_CEN_ID: TIntegerField
      FieldName = 'NPOCAT_CEN_ID'
    end
    object q_UslDogPAYFORM_NAME: TStringField
      FieldName = 'PAYFORM_NAME'
      Required = True
    end
    object q_UslDogCAT_CEN_NAME: TStringField
      FieldName = 'CAT_CEN_NAME'
      Required = True
      Size = 70
    end
  end
  object ds_Prod: TDataSource
    DataSet = q_Prod
    Left = 332
    Top = 98
  end
  object q_Prod: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  A.ID_NPR,'
      '  A.NAME_NPR'
      'FROM KLS_PROD A WHERE A.FLG_ALLOWED=1'
      'ORDER BY A.ID_NPR')
    QBEDefinition.QBEFieldDefs = {
      0300000002000000080000004E414D455F4E505201000000000600000049445F
      4E50520100000000}
    Session = f_main.ora_Session
    Left = 364
    Top = 98
    object q_ProdID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object q_ProdNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 30
    end
  end
  object q_NewMonth: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_NEW_MONTH_R3_VBAK'
      'WHERE VBELN=0')
    QBEDefinition.QBEFieldDefs = {
      0300000063000000050000005642454C4E0100000000060000004E4F4D5F5A44
      01000000000600000049535F4558500100000000090000004C4F41445F414242
      5201000000000A000000564241505F4D41544E5201000000000B00000050524F
      445F49445F4E505201000000000E0000004C554B5F444F475F4E554D42455201
      000000000A0000004C554B5F444F475F494401000000000A000000444F475F4E
      554D424552010000000006000000444F475F494401000000000A000000564250
      415F4B554E4E52010000000009000000504C41545F4E414D4501000000000700
      0000504C41545F49440100000000080000004F545F4C49464E5201000000000A
      00000047524F54505F4E414D4501000000000800000047524F54505F49440100
      0000000A000000524F5554455F4E414D450100000000050000004B4E414E4601
      000000000B0000005354414E4F54505F4B4F4401000000000A0000005354414E
      4F54505F49440100000000050000004B4E454E44010000000008000000535441
      4E5F4B4F440100000000070000005354414E5F49440100000000080000005348
      5F4B554E4E5201000000000B000000504F4C5543485F4E414D45010000000009
      000000504F4C5543485F494401000000000B000000504F545245425F4E414D45
      010000000009000000504F545245425F494401000000000A0000005645544B41
      5F4E414D450100000000080000005645544B415F494401000000000900000044
      4154455F504C414E01000000000C0000004F574E4552534849505F4944010000
      00000B0000004E415A4E5F4F54475F49440100000000080000004E505F4F574E
      455201000000000A0000004F574E45525F4E414D450100000000080000004F57
      4E45525F494401000000000A00000054415249465F434F444501000000000A00
      00005452414E53505F4E554D010000000007000000464F524D415F3201000000
      00040000005052494D0100000000030000004752340100000000050000004F53
      4E5F3801000000000B00000049535F4558505F4E414D4501000000000D000000
      50524F445F4E414D455F4E5052010000000009000000444154455F52415A4E01
      00000000090000004C4F41445F4E414D4501000000000E0000004E504F5F444F
      475F4E554D42455201000000000A0000004E504F5F444F475F49440100000000
      02000000494401000000000C0000004C4F41445F545950455F49440100000000
      0A00000055534C5F4E554D4245520100000000090000005445585F50445F4944
      01000000000B000000535550504C4945525F4944010000000006000000534C49
      565F56010000000008000000444F505F434953540100000000050000004F424F
      475201000000000D000000544F4E4E5F4445434C4152454401000000000D0000
      00434953545F4445434C4152454401000000000A000000544F4E4E5F414C4C4F
      5701000000000A000000434953545F414C4C4F57010000000008000000544F4E
      4E5F4D494E010000000008000000434953545F4D494E01000000000A00000047
      4F5350524F475F494401000000000A00000047505F4E4150525F494401000000
      0008000000444154455F43454E01000000000400000043454E41010000000008
      00000043454E415F4F545001000000000600000053554D5F5A4401000000000A
      000000544152494631544F4E4E01000000000B000000504C414E535452555F49
      4401000000000B0000004C4F434B5F53544154555301000000000A0000005642
      414B5F565342454401000000000A00000056424B445F54524154590100000000
      0E0000005641474F4E545950455F4E414D4501000000000E000000545950455F
      4F5447525F4E414D4501000000000A000000564241505F524F55544501000000
      000C0000005354414E4F54505F4E414D450100000000090000005354414E5F4E
      414D4501000000000D000000504F4C5543485F47445F4B4F4401000000000A00
      00005642414B5F415541525401000000000F000000434F4E54524143544F525F
      4154545201000000000D0000004E415A4E5F4F54475F4E414D45010000000008
      0000004E505F50524F445201000000000A00000050524F44525F4E414D450100
      0000000800000050524F44525F494401000000000D000000535550504C494552
      5F4E414D450100000000050000004C474F424501000000000C000000464F524D
      415F325F4E414D4501000000000A00000056424B445F56534152540100000000
      0D0000005641474F574E45525F4E414D45010000000006000000544F4E4E5F52
      010000000006000000434953545F5201000000000B000000544F4E4E5F4C4F41
      44454401000000000B000000434953545F4C4F4144454401000000000C000000
      474F5350524F475F4E414D4501000000000C00000047505F4E4150525F4E414D
      4501000000000D000000504C414E535452555F4E414D4501000000000B000000
      5550444154455F4441544501000000000B0000005550444154455F46494C4501
      00000000}
    Session = f_main.ora_Session
    BeforeOpen = q_NewMonthBeforeOpen
    AfterOpen = q_NewMonthAfterOpen
    Left = 244
    Top = 64
    object q_NewMonthID: TStringField
      FieldName = 'ID'
      Required = True
      Size = 30
    end
    object q_NewMonthVBELN: TStringField
      FieldName = 'VBELN'
      Required = True
      Size = 30
    end
    object q_NewMonthNOM_ZD: TStringField
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_NewMonthDATE_RAZN: TDateTimeField
      FieldName = 'DATE_RAZN'
    end
    object q_NewMonthDATE_PLAN: TDateTimeField
      FieldName = 'DATE_PLAN'
    end
    object q_NewMonthIS_EXP_NAME: TStringField
      FieldName = 'IS_EXP_NAME'
      Size = 16
    end
    object q_NewMonthIS_EXP: TFloatField
      FieldName = 'IS_EXP'
    end
    object q_NewMonthLOAD_NAME: TStringField
      FieldName = 'LOAD_NAME'
      Size = 100
    end
    object q_NewMonthLOAD_ABBR: TStringField
      FieldName = 'LOAD_ABBR'
      Size = 3
    end
    object q_NewMonthLOAD_TYPE_ID: TFloatField
      FieldName = 'LOAD_TYPE_ID'
    end
    object q_NewMonthVBAP_MATNR: TStringField
      FieldName = 'VBAP_MATNR'
      Size = 10
    end
    object q_NewMonthPROD_NAME_NPR: TStringField
      FieldName = 'PROD_NAME_NPR'
      Size = 100
    end
    object q_NewMonthPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 5
    end
    object q_NewMonthLUK_DOG_NUMBER: TStringField
      FieldName = 'LUK_DOG_NUMBER'
      Size = 30
    end
    object q_NewMonthLUK_DOG_ID: TFloatField
      FieldName = 'LUK_DOG_ID'
    end
    object q_NewMonthNPO_DOG_NUMBER: TStringField
      FieldName = 'NPO_DOG_NUMBER'
      Size = 30
    end
    object q_NewMonthNPO_DOG_ID: TFloatField
      FieldName = 'NPO_DOG_ID'
    end
    object q_NewMonthDOG_NUMBER: TStringField
      FieldName = 'DOG_NUMBER'
      Size = 30
    end
    object q_NewMonthDOG_ID: TFloatField
      FieldName = 'DOG_ID'
    end
    object q_NewMonthUSL_NUMBER: TFloatField
      FieldName = 'USL_NUMBER'
    end
    object q_NewMonthVBPA_KUNNR: TStringField
      FieldName = 'VBPA_KUNNR'
      Size = 10
    end
    object q_NewMonthPLAT_NAME: TStringField
      FieldName = 'PLAT_NAME'
      Size = 110
    end
    object q_NewMonthPLAT_ID: TFloatField
      FieldName = 'PLAT_ID'
    end
    object q_NewMonthOT_LIFNR: TStringField
      FieldName = 'OT_LIFNR'
      Size = 10
    end
    object q_NewMonthGROTP_NAME: TStringField
      FieldName = 'GROTP_NAME'
      Size = 100
    end
    object q_NewMonthGROTP_ID: TFloatField
      FieldName = 'GROTP_ID'
    end
    object q_NewMonthROUTE_NAME: TStringField
      FieldName = 'ROUTE_NAME'
      Size = 100
    end
    object q_NewMonthKNANF: TStringField
      FieldName = 'KNANF'
      Size = 10
    end
    object q_NewMonthSTANOTP_KOD: TIntegerField
      FieldName = 'STANOTP_KOD'
    end
    object q_NewMonthSTANOTP_ID: TFloatField
      FieldName = 'STANOTP_ID'
    end
    object q_NewMonthKNEND: TStringField
      FieldName = 'KNEND'
      Size = 10
    end
    object q_NewMonthSTAN_KOD: TIntegerField
      FieldName = 'STAN_KOD'
    end
    object q_NewMonthSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
    object q_NewMonthSH_KUNNR: TStringField
      FieldName = 'SH_KUNNR'
      Size = 10
    end
    object q_NewMonthPOLUCH_NAME: TStringField
      FieldName = 'POLUCH_NAME'
      Size = 110
    end
    object q_NewMonthPOLUCH_ID: TFloatField
      FieldName = 'POLUCH_ID'
    end
    object q_NewMonthPOTREB_NAME: TStringField
      FieldName = 'POTREB_NAME'
      Size = 100
    end
    object q_NewMonthPOTREB_ID: TFloatField
      FieldName = 'POTREB_ID'
    end
    object q_NewMonthVETKA_NAME: TStringField
      FieldName = 'VETKA_NAME'
      Size = 100
    end
    object q_NewMonthVETKA_ID: TFloatField
      FieldName = 'VETKA_ID'
    end
    object q_NewMonthOWNERSHIP_ID: TFloatField
      FieldName = 'OWNERSHIP_ID'
    end
    object q_NewMonthNAZN_OTG_ID: TFloatField
      FieldName = 'NAZN_OTG_ID'
    end
    object q_NewMonthNP_OWNER: TStringField
      FieldName = 'NP_OWNER'
      Size = 10
    end
    object q_NewMonthOWNER_NAME: TStringField
      FieldName = 'OWNER_NAME'
      Size = 100
    end
    object q_NewMonthOWNER_ID: TFloatField
      FieldName = 'OWNER_ID'
    end
    object q_NewMonthSUPPLIER_ID: TFloatField
      FieldName = 'SUPPLIER_ID'
    end
    object q_NewMonthTARIF_CODE: TStringField
      FieldName = 'TARIF_CODE'
      Size = 10
    end
    object q_NewMonthTRANSP_NUM: TStringField
      FieldName = 'TRANSP_NUM'
    end
    object q_NewMonthFORMA_2: TFloatField
      FieldName = 'FORMA_2'
    end
    object q_NewMonthPRIM: TStringField
      FieldName = 'PRIM'
      Size = 100
    end
    object q_NewMonthGR4: TStringField
      FieldName = 'GR4'
      Size = 100
    end
    object q_NewMonthOSN_8: TFloatField
      FieldName = 'OSN_8'
    end
    object q_NewMonthSLIV_V: TFloatField
      FieldName = 'SLIV_V'
    end
    object q_NewMonthDOP_CIST: TFloatField
      FieldName = 'DOP_CIST'
    end
    object q_NewMonthOBOGR: TFloatField
      FieldName = 'OBOGR'
    end
    object q_NewMonthTONN_DECLARED: TFloatField
      FieldName = 'TONN_DECLARED'
      Required = True
    end
    object q_NewMonthCIST_DECLARED: TFloatField
      FieldName = 'CIST_DECLARED'
    end
    object q_NewMonthTONN_ALLOW: TFloatField
      FieldName = 'TONN_ALLOW'
      Required = True
    end
    object q_NewMonthCIST_ALLOW: TFloatField
      FieldName = 'CIST_ALLOW'
    end
    object q_NewMonthTONN_MIN: TFloatField
      FieldName = 'TONN_MIN'
    end
    object q_NewMonthCIST_MIN: TFloatField
      FieldName = 'CIST_MIN'
    end
    object q_NewMonthGOSPROG_ID: TFloatField
      FieldName = 'GOSPROG_ID'
    end
    object q_NewMonthGP_NAPR_ID: TFloatField
      FieldName = 'GP_NAPR_ID'
    end
    object q_NewMonthDATE_CEN: TDateTimeField
      FieldName = 'DATE_CEN'
    end
    object q_NewMonthCENA: TFloatField
      FieldName = 'CENA'
    end
    object q_NewMonthCENA_OTP: TFloatField
      FieldName = 'CENA_OTP'
    end
    object q_NewMonthSUM_ZD: TFloatField
      FieldName = 'SUM_ZD'
    end
    object q_NewMonthTARIF1TONN: TFloatField
      FieldName = 'TARIF1TONN'
    end
    object q_NewMonthPLANSTRU_ID: TFloatField
      FieldName = 'PLANSTRU_ID'
    end
    object q_NewMonthLOCK_STATUS: TStringField
      FieldName = 'LOCK_STATUS'
      Size = 5
    end
    object q_NewMonthVBAK_VSBED: TStringField
      FieldName = 'VBAK_VSBED'
      Size = 3
    end
    object q_NewMonthVBKD_TRATY: TStringField
      FieldName = 'VBKD_TRATY'
      Size = 5
    end
    object q_NewMonthVAGONTYPE_NAME: TStringField
      FieldName = 'VAGONTYPE_NAME'
      Size = 100
    end
    object q_NewMonthTYPE_OTGR_NAME: TStringField
      FieldName = 'TYPE_OTGR_NAME'
      Size = 100
    end
    object q_NewMonthTEX_PD_ID: TFloatField
      FieldName = 'TEX_PD_ID'
    end
    object q_NewMonthVBAP_ROUTE: TStringField
      FieldName = 'VBAP_ROUTE'
      Size = 10
    end
    object q_NewMonthSTANOTP_NAME: TStringField
      FieldName = 'STANOTP_NAME'
      Size = 50
    end
    object q_NewMonthSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Size = 50
    end
    object q_NewMonthPOLUCH_GD_KOD: TStringField
      FieldName = 'POLUCH_GD_KOD'
      Size = 10
    end
    object q_NewMonthVBAK_AUART: TStringField
      FieldName = 'VBAK_AUART'
      Size = 10
    end
    object q_NewMonthCONTRACTOR_ATTR: TIntegerField
      FieldName = 'CONTRACTOR_ATTR'
    end
    object q_NewMonthNAZN_OTG_NAME: TStringField
      FieldName = 'NAZN_OTG_NAME'
      Size = 1
    end
    object q_NewMonthNP_PRODR: TStringField
      FieldName = 'NP_PRODR'
      Size = 10
    end
    object q_NewMonthPRODR_NAME: TStringField
      FieldName = 'PRODR_NAME'
      Size = 100
    end
    object q_NewMonthPRODR_ID: TFloatField
      FieldName = 'PRODR_ID'
    end
    object q_NewMonthSUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 26
    end
    object q_NewMonthLGOBE: TStringField
      FieldName = 'LGOBE'
      Size = 100
    end
    object q_NewMonthFORMA_2_NAME: TStringField
      FieldName = 'FORMA_2_NAME'
      Size = 10
    end
    object q_NewMonthVBKD_VSART: TStringField
      FieldName = 'VBKD_VSART'
      Size = 3
    end
    object q_NewMonthVAGOWNER_NAME: TStringField
      FieldName = 'VAGOWNER_NAME'
      Size = 100
    end
    object q_NewMonthTONN_R: TFloatField
      FieldName = 'TONN_R'
    end
    object q_NewMonthCIST_R: TFloatField
      FieldName = 'CIST_R'
    end
    object q_NewMonthTONN_LOADED: TFloatField
      FieldName = 'TONN_LOADED'
    end
    object q_NewMonthCIST_LOADED: TFloatField
      FieldName = 'CIST_LOADED'
    end
    object q_NewMonthGOSPROG_NAME: TStringField
      FieldName = 'GOSPROG_NAME'
      Size = 1
    end
    object q_NewMonthGP_NAPR_NAME: TStringField
      FieldName = 'GP_NAPR_NAME'
      Size = 1
    end
    object q_NewMonthPLANSTRU_NAME: TStringField
      FieldName = 'PLANSTRU_NAME'
      Size = 1
    end
    object q_NewMonthUPDATE_DATE: TDateTimeField
      FieldName = 'UPDATE_DATE'
    end
    object q_NewMonthUPDATE_FILE: TStringField
      FieldName = 'UPDATE_FILE'
      Size = 50
    end
  end
  object q_R3_Price: TOracleDataSet
    SQL.Strings = (
      'SELECT NVL(MAX(R3_OA.KONV_KBETR),0) AS R3_PRICE'
      'FROM R3_OA, R3_KONV,'
      '  (SELECT VBAK_VBELN, MAX(VBAP_POSNR) AS VBAP_POSNR'
      '   FROM R3_OA'
      '   WHERE R3_OA.VBAK_VBELN=53059'
      '   GROUP BY VBAK_VBELN) B'
      'WHERE R3_OA.VBAK_VBELN=B.VBAK_VBELN'
      '  AND R3_OA.VBAP_POSNR=B.VBAP_POSNR'
      '  AND R3_OA.KONV_KSCHL=R3_KONV.KSCHL'
      '  AND R3_OA.VBAK_VBELN=53059'
      '  AND R3_KONV.FOX_ID=2')
    QBEDefinition.QBEFieldDefs = {03000000010000000800000052335F50524943450100000000}
    Session = f_main.ora_Session
    Left = 364
    Top = 152
    object q_R3_PriceR3_PRICE: TStringField
      FieldName = 'R3_PRICE'
      Size = 30
    end
  end
  object ds_NewMonth: TDataSource
    DataSet = q_NewMonth
    Left = 276
    Top = 64
  end
  object ds_R3_Price: TDataSource
    DataSet = q_R3_Price
    Left = 332
    Top = 152
  end
  object ds_R3_Strah: TDataSource
    DataSet = q_R3_Strah
    Left = 316
    Top = 192
  end
  object q_R3_Strah: TOracleDataSet
    SQL.Strings = (
      'SELECT NVL(MAX(R3_OA.KONV_KBETR),0) AS R3_STRAH'
      'FROM R3_OA, R3_KONV,'
      '  (SELECT VBAK_VBELN, MAX(VBAP_POSNR) AS VBAP_POSNR'
      '   FROM R3_OA'
      '   WHERE R3_OA.VBAK_VBELN=53059'
      '   GROUP BY VBAK_VBELN) B'
      'WHERE R3_OA.VBAK_VBELN=B.VBAK_VBELN'
      '  AND R3_OA.VBAP_POSNR=B.VBAP_POSNR'
      '  AND R3_OA.KONV_KSCHL=R3_KONV.KSCHL'
      '  AND R3_OA.VBAK_VBELN=53059'
      '  AND R3_KONV.FOX_ID=1')
    QBEDefinition.QBEFieldDefs = {03000000010000000800000052335F53545241480100000000}
    Session = f_main.ora_Session
    Left = 372
    Top = 184
    object q_R3_StrahR3_STRAH: TStringField
      FieldName = 'R3_STRAH'
      Size = 30
    end
  end
  object q_Load_Abbr: TOracleDataSet
    SQL.Strings = (
      
        'SELECT LOAD_ABBR,LOAD_ABBR || '#39'-'#39' || LOAD_NAME as LOAD_NAME, LOA' +
        'D_TYPE_ID FROM KLS_VID_OTGR'
      'ORDER BY LOAD_ABBR')
    QBEDefinition.QBEFieldDefs = {
      0300000003000000090000004C4F41445F414242520100000000090000004C4F
      41445F4E414D4501000000000C0000004C4F41445F545950455F494401000000
      00}
    Session = f_main.ora_Session
    Left = 68
    Top = 304
    object q_Load_AbbrLOAD_ABBR: TStringField
      FieldName = 'LOAD_ABBR'
      Required = True
      Size = 3
    end
    object q_Load_AbbrLOAD_NAME: TStringField
      FieldName = 'LOAD_NAME'
      Required = True
      Size = 45
    end
    object q_Load_AbbrLOAD_TYPE_ID: TIntegerField
      FieldName = 'LOAD_TYPE_ID'
      Required = True
    end
  end
  object ds_Load_Abbr: TDataSource
    DataSet = q_Load_Abbr
    Left = 108
    Top = 288
  end
  object q_Predpr: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,PREDPR_NAME,SHORT_NAME,INN,OKPO,GD_KOD FROM KLS_PREDPR'
      'WHERE ID<>0')
    QBEDefinition.QBEFieldDefs = {
      030000000600000002000000494401000000000B0000005052454450525F4E41
      4D4501000000000A00000053484F52545F4E414D45010000000003000000494E
      4E0100000000040000004F4B504F01000000000600000047445F4B4F44010000
      0000}
    Session = f_main.ora_Session
    Left = 68
    Top = 192
    object q_PredprID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_PredprPREDPR_NAME: TStringField
      FieldName = 'PREDPR_NAME'
      Required = True
      Size = 60
    end
    object q_PredprSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object q_PredprINN: TStringField
      FieldName = 'INN'
      Size = 12
    end
    object q_PredprOKPO: TStringField
      FieldName = 'OKPO'
      Size = 10
    end
    object q_PredprGD_KOD: TStringField
      FieldName = 'GD_KOD'
      Size = 12
    end
  end
  object q_Vetka: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_VETKA'
      'WHERE ID<>0')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000A0000005645544B415F4E414D4501000000000200000049
      440100000000}
    Session = f_main.ora_Session
    Left = 68
    Top = 256
    object q_VetkaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_VetkaVETKA_NAME: TStringField
      FieldName = 'VETKA_NAME'
      Required = True
      Size = 50
    end
  end
  object q_Gosprog: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_GOSPROG'
      'ORDER BY ID')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000C000000474F5350524F475F4E
      414D450100000000}
    Session = f_main.ora_Session
    AfterScroll = q_GosprogAfterScroll
    Left = 460
    Top = 213
    object q_GosprogID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_GosprogGOSPROG_NAME: TStringField
      FieldName = 'GOSPROG_NAME'
      Required = True
      Size = 30
    end
  end
  object ds_Gosprog: TDataSource
    DataSet = q_Gosprog
    Left = 492
    Top = 213
  end
  object q_Nazn_Otg: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_NAZN_OTG'
      'WHERE 1=1'
      'ORDER BY ID')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000D0000004E415A4E5F4F54475F
      4E414D450100000000}
    Session = f_main.ora_Session
    Left = 180
    Top = 296
    object q_Nazn_OtgID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_Nazn_OtgNAZN_OTG_NAME: TStringField
      FieldName = 'NAZN_OTG_NAME'
      Required = True
      Size = 50
    end
  end
  object ds_Nazn_Otg: TDataSource
    DataSet = q_Nazn_Otg
    Left = 236
    Top = 296
  end
  object q_Stan: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,STAN_KOD,STAN_NAME FROM KLS_STAN'
      'WHERE ID<>0')
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000080000005354414E5F4B4F4401
      00000000090000005354414E5F4E414D450100000000}
    Session = f_main.ora_Session
    Left = 68
    Top = 144
    object q_StanID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_StanSTAN_KOD: TIntegerField
      FieldName = 'STAN_KOD'
      Required = True
    end
    object q_StanSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Required = True
      Size = 50
    end
  end
  object q_PlanStru: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  PS.LEVEL_POS,'
      '  PS.NAME || '#39' ('#39' || TO_CHAR(PS.ID) || '#39')'#39' as NAME,'
      '  SUM(PP.PLAN_VES) as PLAN_VES,'
      '  SUM(PP.PLAN_SUM) as PLAN_SUM'
      'FROM V_PLAN_POST_UNI PP,'
      '('
      'SELECT'
      '  A.ID,'
      '  A.LEVEL_POS,'
      '  SUBSTR('#39'              '#39',1,(A.LEVEL_POS-1)*2) || A.NAME as NAME'
      'FROM kls_planstru A, '
      '('
      ' SELECT * FROM kls_planstru'
      ' WHERE ID=94'
      ') B '
      'WHERE A.LEVEL_POS<>0'
      '  AND (A.ID=B.ID '
      
        '       OR (A.LEVEL_POS<B.LEVEL_POS AND A.LEVEL_POS=1 AND A.KOD_S' +
        'GR=B.KOD_SGR)'
      
        '       OR (A.LEVEL_POS<B.LEVEL_POS AND A.LEVEL_POS=2 AND A.KOD_S' +
        'GR=B.KOD_SGR AND A.KOD_SPG=B.KOD_SPG)'
      
        '       OR (A.LEVEL_POS<B.LEVEL_POS AND A.LEVEL_POS=3 AND A.KOD_S' +
        'GR=B.KOD_SGR AND A.KOD_SPG=B.KOD_SPG AND A.KOD_RZD=B.KOD_RZD)'
      
        '       OR (A.LEVEL_POS<B.LEVEL_POS AND A.LEVEL_POS=4 AND A.KOD_S' +
        'GR=B.KOD_SGR AND A.KOD_SPG=B.KOD_SPG AND A.KOD_RZD=B.KOD_RZD AND' +
        ' A.KOD_PRZ=B.KOD_PRZ)'
      
        '       OR (A.LEVEL_POS<B.LEVEL_POS AND A.LEVEL_POS=5 AND A.KOD_S' +
        'GR=B.KOD_SGR AND A.KOD_SPG=B.KOD_SPG AND A.KOD_RZD=B.KOD_RZD AND' +
        ' A.KOD_PRZ=B.KOD_PRZ AND A.KOD_GRP=B.KOD_GRP)'
      
        '       OR (A.LEVEL_POS<B.LEVEL_POS AND A.LEVEL_POS>=6 AND A.KOD_' +
        'SGR=B.KOD_SGR AND A.KOD_SPG=B.KOD_SPG AND A.KOD_RZD=B.KOD_RZD AN' +
        'D A.KOD_PRZ=B.KOD_PRZ AND A.KOD_GRP=B.KOD_GRP AND A.KOD_PGR=B.KO' +
        'D_PGR)'
      #9'  )'
      ') PS,'
      'PLAN_PERIODS'
      'WHERE PP.PLANSTRU_ID=PS.ID'
      
        '  AND PP.PLAN_ID=PLAN_PERIODS.PLAN_ID AND PP.PLAN_PER_ID=PLAN_PE' +
        'RIODS.ID'
      '  AND PP.DOG_ID=0'
      '  AND PP.PROD_ID_NPR='#39'10305'#39
      '  AND PLAN_PERIODS.PLAN_ID=1'
      '  AND PLAN_PERIODS.DATE_PLAN=TO_DATE('#39'01.12.2002'#39','#39'dd.mm.yyyy'#39')'
      '  AND PLAN_PERIODS.BEGIN_DATE=TO_DATE('#39'01.12.2002'#39','#39'dd.mm.yyyy'#39')'
      '  AND PLAN_PERIODS.END_DATE=TO_DATE('#39'31.12.2002'#39','#39'dd.mm.yyyy'#39')'
      'GROUP BY'
      '  PS.LEVEL_POS,'
      '  PS.NAME || '#39' ('#39' || TO_CHAR(PS.ID) || '#39')'#39
      '')
    QBEDefinition.QBEFieldDefs = {
      0300000004000000090000004C4556454C5F504F530100000000040000004E41
      4D45010000000008000000504C414E5F564553010000000008000000504C414E
      5F53554D0100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_PlanStruBeforeOpen
    Left = 480
    Top = 112
    object q_PlanStruLEVEL_POS: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #8470#8470
      FieldName = 'LEVEL_POS'
      Required = True
    end
    object q_PlanStruNAME: TStringField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072
      FieldName = 'NAME'
      Size = 64
    end
    object q_PlanStruPLAN_VES: TFloatField
      DisplayLabel = #1042#1077#1089
      DisplayWidth = 15
      FieldName = 'PLAN_VES'
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_PlanStruPLAN_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 15
      FieldName = 'PLAN_SUM'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
  end
  object ds_PlanStru: TDataSource
    DataSet = q_PlanStru
    Left = 520
    Top = 112
  end
  object q_PlanPost: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  A.PLANSTRU_ID,'
      '  A.PLANSTRU_NAME,'
      '  A.PLAN_CENA,'
      '  A.PLAN_VES,'
      '  A.PLAN_SUM,'
      '  NVL(M.TONN_DECLARED,0) as TONN_DECLARED,'
      '  NVL(M.TONN_R,0) as TONN_R,'
      '  NVL(M.TONN_LOADED,0) as TONN_LOADED'
      'FROM V_PLAN_POST_VIEW_1 A, PLAN_PERIODS, '
      '('
      ' SELECT MONTH.PLANSTRU_ID,'
      '        SUM(MONTH.TONN_DECLARED) as TONN_DECLARED,'
      #9#9'SUM(MONTH.TONN_R) as TONN_R,'
      #9#9'SUM(MONTH.TONN_LOADED) as TONN_LOADED'
      '   FROM MONTH'
      '  WHERE PROD_ID_NPR='#39'10305'#39
      '    AND DOG_ID=787'
      '    AND DATE_PLAN = TO_DATE('#39'01.12.2002'#39','#39'dd.mm.yyyy'#39')'
      '    AND INPUT_DATE>=TO_DATE('#39'01.12.2002'#39','#39'dd.mm.yyyy'#39')'
      '    AND INPUT_DATE<=TO_DATE('#39'31.12.2002'#39','#39'dd.mm.yyyy'#39')'
      '  GROUP BY MONTH.PLANSTRU_ID'
      ') M'#9
      'WHERE A.PLAN_ID=PLAN_PERIODS.PLAN_ID'
      '  AND A.PLAN_PER_ID=PLAN_PERIODS.ID'
      '  AND A.PROD_ID_NPR='#39'10305'#39
      '  AND A.DOG_ID=787'
      '  AND PLAN_PERIODS.PLAN_ID=1'
      '  AND PLAN_PERIODS.DATE_PLAN=TO_DATE('#39'01.12.2002'#39','#39'dd.mm.yyyy'#39')'
      '  AND PLAN_PERIODS.BEGIN_DATE=TO_DATE('#39'01.12.2002'#39','#39'dd.mm.yyyy'#39')'
      '  AND PLAN_PERIODS.END_DATE=TO_DATE('#39'31.12.2002'#39','#39'dd.mm.yyyy'#39')'
      '  AND A.PLANSTRU_ID=M.PLANSTRU_ID(+)'
      '')
    QBEDefinition.QBEFieldDefs = {
      03000000080000000B000000504C414E535452555F494401000000000D000000
      504C414E535452555F4E414D45010000000009000000504C414E5F43454E4101
      0000000008000000504C414E5F564553010000000008000000504C414E5F5355
      4D01000000000D000000544F4E4E5F4445434C41524544010000000006000000
      544F4E4E5F5201000000000B000000544F4E4E5F4C4F414445440100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_PlanPostBeforeOpen
    AfterScroll = q_PlanPostAfterScroll
    Left = 620
    Top = 214
    object q_PlanPostPLANSTRU_ID: TFloatField
      FieldName = 'PLANSTRU_ID'
      Required = True
    end
    object q_PlanPostPLANSTRU_NAME: TStringField
      FieldName = 'PLANSTRU_NAME'
      Required = True
      Size = 50
    end
    object q_PlanPostPLAN_CENA: TFloatField
      FieldName = 'PLAN_CENA'
    end
    object q_PlanPostPLAN_VES: TFloatField
      FieldName = 'PLAN_VES'
    end
    object q_PlanPostPLAN_SUM: TFloatField
      FieldName = 'PLAN_SUM'
    end
    object q_PlanPostTONN_DECLARED: TFloatField
      FieldName = 'TONN_DECLARED'
    end
    object q_PlanPostTONN_R: TFloatField
      FieldName = 'TONN_R'
    end
    object q_PlanPostTONN_LOADED: TFloatField
      FieldName = 'TONN_LOADED'
    end
  end
  object ds_PlanPost: TDataSource
    DataSet = q_PlanPost
    Left = 672
    Top = 216
  end
  object q_TEX_PD: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_TEX_PD'
      'WHERE GROTP_ID=2641')
    QBEDefinition.QBEFieldDefs = {
      030000000A00000002000000494401000000000800000047524F54505F494401
      000000000A00000047524F54505F4F4B504F01000000000C000000504C415454
      415249465F494401000000000B0000005445585F50445F4E414D450100000000
      0400000042414E4B010000000002000000525301000000001000000047524F54
      505F53484F52545F4E414D45010000000012000000504C41545441525F53484F
      52545F4E414D450100000000110000004B5353535F504C415454415249465F49
      440100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_TEX_PDBeforeOpen
    Left = 244
    Top = 336
    object q_TEX_PDGROTP_ID: TIntegerField
      FieldName = 'GROTP_ID'
      Required = True
    end
    object q_TEX_PDGROTP_OKPO: TStringField
      FieldName = 'GROTP_OKPO'
      Size = 10
    end
    object q_TEX_PDPLATTARIF_ID: TIntegerField
      FieldName = 'PLATTARIF_ID'
      Required = True
    end
    object q_TEX_PDTEX_PD_NAME: TStringField
      FieldName = 'TEX_PD_NAME'
      Required = True
      Size = 50
    end
    object q_TEX_PDBANK: TStringField
      FieldName = 'BANK'
      Size = 60
    end
    object q_TEX_PDRS: TStringField
      FieldName = 'RS'
    end
    object q_TEX_PDID: TFloatField
      FieldName = 'ID'
    end
    object q_TEX_PDGROTP_SHORT_NAME: TStringField
      FieldName = 'GROTP_SHORT_NAME'
      Size = 50
    end
    object q_TEX_PDPLATTAR_SHORT_NAME: TStringField
      FieldName = 'PLATTAR_SHORT_NAME'
      Size = 50
    end
    object q_TEX_PDKSSS_PLATTARIF_ID: TStringField
      FieldName = 'KSSS_PLATTARIF_ID'
      Size = 10
    end
  end
  object ds_TEX_PD: TDataSource
    DataSet = q_TEX_PD
    Left = 300
    Top = 333
  end
  object q_Forma2: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_FORMA_2')
    QBEDefinition.QBEFieldDefs = {
      03000000070000000200000049440100000000040000004E414D450100000000
      0B000000464F585F464F524D415F3201000000000A0000004752555A315F4E41
      4D4501000000000A0000004752555A325F4E414D4501000000000B000000565A
      49534B315F4E414D4501000000000B000000565A49534B325F4E414D45010000
      0000}
    Session = f_main.ora_Session
    Left = 428
    Top = 301
    object q_Forma2ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_Forma2NAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object ds_Forma2: TDataSource
    DataSet = q_Forma2
    Left = 492
    Top = 301
  end
  object q_GP_NAPR: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_GP_NAPR'
      'where gosprog_id = :gosprog_id'
      'ORDER BY ID')
    Variables.Data = {
      03000000010000000B0000003A474F5350524F475F4944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000040000004E414D450100000000
      0A000000474F5350524F475F49440100000000}
    Master = q_Gosprog
    MasterFields = 'ID'
    DetailFields = 'GOSPROG_ID'
    Session = f_main.ora_Session
    Left = 596
    Top = 301
    object q_GP_NAPRID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_GP_NAPRNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object q_GP_NAPRGOSPROG_ID: TIntegerField
      FieldName = 'GOSPROG_ID'
      Required = True
    end
  end
  object ds_GP_NAPR: TDataSource
    DataSet = q_GP_NAPR
    Left = 644
    Top = 301
  end
  object q_CAT_CEN_GRP: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_CAT_CEN_GROUP'
      'ORDER BY ID')
    Session = f_main.ora_Session
    Left = 212
    Top = 208
  end
  object ds_CAT_CEN_GRP: TDataSource
    DataSet = q_CAT_CEN_GRP
    Left = 276
    Top = 192
  end
  object q_Dog: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_DOG'
      'WHERE DOG_ID<>0')
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000080000005354414E5F4B4F4401
      00000000090000005354414E5F4E414D450100000000}
    Session = f_main.ora_Session
    Left = 56
    Top = 80
  end
  object q_LukDog: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_DOG'
      'WHERE DOG_ID<>0')
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000080000005354414E5F4B4F4401
      00000000090000005354414E5F4E414D450100000000}
    Session = f_main.ora_Session
    Left = 132
    Top = 88
  end
  object q_NpoDog: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_DOG'
      'WHERE DOG_ID<>0')
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000080000005354414E5F4B4F4401
      00000000090000005354414E5F4E414D450100000000}
    Session = f_main.ora_Session
    Left = 132
    Top = 144
  end
  object ds_Dog: TDataSource
    DataSet = q_Dog
    Left = 12
    Top = 80
  end
end
