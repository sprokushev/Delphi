object f_oper_ree: Tf_oper_ree
  Left = 407
  Top = 294
  Width = 873
  Height = 612
  Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1086#1090#1075#1088#1091#1079#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 217
    Top = 26
    Height = 529
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 857
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object TBSubmenuItem1: TTBSubmenuItem
        Caption = #1055#1077#1095#1072#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 6
        object TBItem2: TTBItem
          Action = acOperReePrintTable
          Caption = #1058#1072#1073#1083#1080#1094#1072
          DisplayMode = nbdmImageAndText
        end
        object TBItem4: TTBItem
          Action = acOperReePrintPasp
        end
        object TBItem1: TTBItem
          Action = acOperReePrintSved
          DisplayMode = nbdmImageAndText
          Options = [tboDefault]
        end
      end
      object TBItem5: TTBItem
        Action = acOperReeToXLS
        DisplayMode = nbdmImageAndText
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem3: TTBItem
        Action = acOperReeByCist
        DisplayMode = nbdmImageAndText
        Images = f_main.img_Common
      end
      object TBItem8: TTBItem
        Action = acSNP
        DisplayMode = nbdmImageAndText
      end
      object TBSeparatorItem2: TTBSeparatorItem
      end
      object TBItem7: TTBItem
        Action = acOperReeFilter
        DisplayMode = nbdmImageAndText
      end
      object TBItem6: TTBItem
        Action = acOperReeNoFilter
        DisplayMode = nbdmImageAndText
      end
      object TBItem22: TTBItem
        Action = acLastReis
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 555
    Width = 857
    Height = 19
    Panels = <
      item
        Width = 180
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel3: TPanel
    Left = 251
    Top = 26
    Width = 606
    Height = 529
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 2
    object grRee: TDBGridEh
      Left = 0
      Top = 193
      Width = 606
      Height = 336
      Align = alClient
      ColumnDefValues.Title.TitleButton = True
      Ctl3D = False
      DataGrouping.GroupLevels = <>
      DataSource = ds_oper_ree
      EvenRowColor = clInfoBk
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      FrozenCols = 3
      IndicatorOptions = [gioShowRowIndicatorEh]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghColumnResize, dghColumnMove]
      ParentCtl3D = False
      PopupMenu = TBPopupMenu1
      RowDetailPanel.Color = clBtnFace
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnDblClick = acOperReePrintSvedExecute
      Columns = <
        item
          Checkboxes = False
          EditButtons = <>
          FieldName = 'ABBR_NPR'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.Value = #1048#1090#1086#1075#1086
          Footer.ValueType = fvtStaticText
          Footers = <>
          Width = 117
        end
        item
          EditButtons = <>
          FieldName = 'SVED_NUM'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Width = 49
        end
        item
          EditButtons = <>
          FieldName = 'NUM_CIST'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = 'VAGOWNER_NAME'
          Footers = <>
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'KOL'
          Footer.FieldName = 'KOL'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'NOM_ZD'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'KOD_ISU'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'VES_BRUTTO'
          Footer.FieldName = 'VES_BRUTTO'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = 'VES_CIST'
          Footer.FieldName = 'VES_CIST'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'KALIBR_ID'
          Footers = <>
          Width = 44
        end
        item
          EditButtons = <>
          FieldName = 'CAPACITY'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 52
        end
        item
          EditButtons = <>
          FieldName = 'DATE_OTGR'
          Footers = <>
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'BEG_NALIV_TIME'
          Footers = <>
          Width = 98
        end
        item
          EditButtons = <>
          FieldName = 'END_NALIV_TIME'
          Footers = <>
          Width = 97
        end
        item
          EditButtons = <>
          FieldName = 'DATE_OFORML'
          Footers = <>
          Width = 97
        end
        item
          EditButtons = <>
          FieldName = 'SHORT_NAME'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Width = 175
        end
        item
          EditButtons = <>
          FieldName = 'DOG_NUMBER'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'NAME_STAN'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Width = 145
        end
        item
          EditButtons = <>
          FieldName = 'REGION_NAME'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'POLUCH_NAME'
          Footers = <>
          Width = 225
        end
        item
          EditButtons = <>
          FieldName = 'NAME_POLUCH'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Width = 190
        end
        item
          EditButtons = <>
          FieldName = 'POTREB_NAME'
          Footers = <>
          Width = 201
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'PASP'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'VZLIV'
          Footers = <>
          Width = 47
        end
        item
          EditButtons = <>
          FieldName = 'TEMPER'
          Footers = <>
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'FAKT_PL'
          Footers = <>
          Width = 51
        end
        item
          EditButtons = <>
          FieldName = 'NOM_SF'
          Footers = <>
          Width = 58
        end
        item
          EditButtons = <>
          FieldName = 'KOL_DN'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DATE_CENA'
          Footers = <>
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'CENA'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'CENA_OTP'
          Footers = <>
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'SUM_PROD'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUM_PROD_NDS'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUM_AKCIZ'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DATE_KVIT'
          Footers = <>
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'NUM_KVIT'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TARIF'
          Footer.FieldName = 'TARIF'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'TARIF_NDS'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TARIF_GUARD'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TARIF_GUARD_NDS'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUM_VOZN'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUM_VOZN_NDS'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUM_STRAH'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PLANSTRU_NAME'
          Footers = <>
          Width = 349
        end
        item
          EditButtons = <>
          FieldName = 'TEX_PD_NAME'
          Footers = <>
          Width = 313
        end
        item
          EditButtons = <>
          FieldName = 'EXPED_NAME'
          Footers = <>
          Width = 161
        end
        item
          EditButtons = <>
          FieldName = 'CLIENT_NUMBER'
          Footers = <>
          Width = 89
        end
        item
          EditButtons = <>
          FieldName = 'CLIENT_DATE'
          Footers = <>
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'INPUT_NUMBER'
          Footers = <>
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'INPUT_DATE'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'NUM_EXP_MAR'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'GU12_NOM_Z'
          Footers = <>
          Width = 79
        end
        item
          EditButtons = <>
          FieldName = 'UPAK_NAME'
          Footers = <>
          Width = 128
        end
        item
          EditButtons = <>
          FieldName = 'UPAK_VES'
          Footers = <>
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'VES_ED'
          Footers = <>
          Width = 62
        end
        item
          EditButtons = <>
          FieldName = 'KOL_ED'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'FULL_VAGOWNER_NAME'
          Footers = <>
          Width = 238
        end
        item
          EditButtons = <>
          FieldName = 'NPO_SF'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'CENA_BN_OTP_SNP'
          Footers = <>
          Width = 77
        end
        item
          EditButtons = <>
          FieldName = 'CENA_OTP_SNP'
          Footers = <>
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          ReadOnly = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'TEX_PD_ID'
          Footers = <>
          Width = 73
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 606
      Height = 193
      Align = alTop
      Caption = ' '#1060#1080#1083#1100#1090#1088' '
      TabOrder = 1
      object rg_Type_Otgr: TRadioGroup
        Left = 303
        Top = 13
        Width = 186
        Height = 78
        Caption = ' '#1058#1080#1087' '#1086#1090#1075#1088#1091#1079#1082#1080' '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #1042#1089#1077' '#1086#1090#1075#1088#1091#1079#1082#1080
          #1046#1044' '#1086#1090#1075#1088#1091#1079#1082#1080
          #1050#1086#1085#1090#1077#1081#1085#1077#1088#1099
          #1057#1072#1084#1086#1074#1099#1074#1086#1079
          #1056#1077#1079#1077#1088#1074#1091#1072#1088)
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 5
        Top = 92
        Width = 708
        Height = 96
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label3: TLabel
          Left = 23
          Top = 8
          Width = 64
          Height = 13
          Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
        end
        object Label4: TLabel
          Left = 28
          Top = 50
          Width = 59
          Height = 13
          Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        end
        object Label5: TLabel
          Left = 359
          Top = 30
          Width = 158
          Height = 13
          Caption = #1047#1072#1103#1074#1082#1072' ('#1084#1086#1078#1085#1086' '#1087#1077#1088#1074#1099#1077' '#1094#1080#1092#1088#1099')'
        end
        object Label6: TLabel
          Left = 360
          Top = 52
          Width = 42
          Height = 13
          Caption = #1057#1090#1072#1085#1094#1080#1103
        end
        object Label7: TLabel
          Left = 21
          Top = 29
          Width = 66
          Height = 13
          Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
        end
        object Label8: TLabel
          Left = 360
          Top = 7
          Width = 69
          Height = 13
          Caption = #1042#1083#1072#1076#1077#1083#1077#1094' '#1085'/'#1087
        end
        object sbNotPlat: TSpeedButton
          Left = 96
          Top = 3
          Width = 20
          Height = 20
          Caption = '='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = sbNotPlatClick
        end
        object sbNotGrOtp: TSpeedButton
          Left = 96
          Top = 25
          Width = 20
          Height = 20
          Caption = '='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = sbNotGrOtpClick
        end
        object sbNotPoluch: TSpeedButton
          Left = 96
          Top = 47
          Width = 20
          Height = 20
          Caption = '='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = sbNotPoluchClick
        end
        object sbNotSobstv: TSpeedButton
          Left = 433
          Top = 3
          Width = 20
          Height = 20
          Caption = '='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = sbNotSobstvClick
        end
        object sbNotStan: TSpeedButton
          Left = 406
          Top = 47
          Width = 20
          Height = 20
          Caption = '='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = sbNotStanClick
        end
        object Label9: TLabel
          Left = 11
          Top = 74
          Width = 77
          Height = 13
          Caption = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072
        end
        object sbNotPlanStru: TSpeedButton
          Left = 96
          Top = 71
          Width = 20
          Height = 20
          Caption = '='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = sbNotPlanStruClick
        end
        object lc_plat: TRxDBLookupCombo
          Left = 120
          Top = 3
          Width = 235
          Height = 21
          DropDownCount = 8
          DisplayEmpty = '<'#1042#1089#1077' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1080'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'SHORT_NAME'
          LookupSource = ds_Plat
          TabOrder = 0
        end
        object lc_Poluch: TRxDBLookupCombo
          Left = 120
          Top = 47
          Width = 235
          Height = 21
          DropDownCount = 8
          DisplayEmpty = '<'#1042#1089#1077' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1080'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'SHORT_NAME'
          LookupSource = ds_Poluch
          TabOrder = 1
        end
        object e_Nom_zd: TEdit
          Left = 533
          Top = 26
          Width = 172
          Height = 21
          TabOrder = 2
        end
        object e_stan: TEdit
          Left = 429
          Top = 48
          Width = 70
          Height = 21
          TabOrder = 3
          OnChange = e_stanChange
        end
        object lc_stan: TRxDBLookupCombo
          Left = 504
          Top = 48
          Width = 202
          Height = 21
          DropDownCount = 8
          DisplayEmpty = '<'#1042#1089#1077' '#1089#1090#1072#1085#1094#1080#1080'>'
          EmptyValue = '0'
          LookupField = 'STAN_KOD'
          LookupDisplay = 'STAN_NAME'
          LookupSource = ds_stan
          TabOrder = 4
          OnChange = lc_stanChange
        end
        object lc_GrOtp: TRxDBLookupCombo
          Left = 120
          Top = 25
          Width = 235
          Height = 21
          DropDownCount = 8
          DisplayEmpty = '<'#1042#1089#1077' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1080'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'SHORT_NAME'
          LookupSource = ds_GrOtp
          TabOrder = 5
        end
        object lc_Sobstv: TRxDBLookupCombo
          Left = 456
          Top = 3
          Width = 251
          Height = 21
          DropDownCount = 8
          DisplayEmpty = '<'#1042#1089#1077' '#1074#1083#1072#1076#1077#1083#1100#1094#1099'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'SHORT_NAME'
          LookupSource = ds_Sobstv
          TabOrder = 6
        end
        object lc_PlanStru: TRxDBLookupCombo
          Left = 120
          Top = 69
          Width = 441
          Height = 21
          DropDownCount = 8
          DisplayEmpty = '<'#1042#1089#1077' '#1087#1086#1079#1080#1094#1080#1080'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = dsPlanStru
          TabOrder = 7
        end
        object cb_TreePlanStru: TCheckBox
          Left = 568
          Top = 72
          Width = 137
          Height = 17
          Caption = #1042#1082#1083#1102#1095#1072#1103' '#1087#1086#1076#1087#1086#1079#1080#1094#1080#1080
          Checked = True
          State = cbChecked
          TabOrder = 8
        end
      end
      object GroupBox2: TGroupBox
        Left = 107
        Top = 13
        Width = 194
        Height = 78
        Caption = ' '#1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '
        TabOrder = 2
        object Label1: TLabel
          Left = 9
          Top = 24
          Width = 6
          Height = 13
          Caption = #1089
        end
        object Label2: TLabel
          Left = 9
          Top = 54
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object Time2: TDateTimePicker
          Left = 27
          Top = 49
          Width = 70
          Height = 21
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          Kind = dtkTime
          TabOrder = 0
        end
        object time1: TDateTimePicker
          Left = 27
          Top = 21
          Width = 70
          Height = 21
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          Kind = dtkTime
          TabOrder = 1
        end
        object Date2: TDateTimePicker
          Left = 104
          Top = 49
          Width = 82
          Height = 21
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          TabOrder = 2
        end
        object Date1: TDateTimePicker
          Left = 104
          Top = 21
          Width = 82
          Height = 21
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          TabOrder = 3
        end
      end
      object Panel2: TPanel
        Left = 594
        Top = 17
        Width = 76
        Height = 74
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 3
        object sbOperReeRefresh: TSpeedButton
          Left = 4
          Top = 4
          Width = 67
          Height = 66
          Action = acOperReeRefresh
          Flat = True
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
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = False
        end
      end
      object rg_Export: TRadioGroup
        Left = 491
        Top = 13
        Width = 101
        Height = 78
        Caption = ' '#1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '
        ItemIndex = 0
        Items.Strings = (
          #1042#1089#1077' '#1086#1090#1075#1088#1091#1079#1082#1080
          #1055#1086' '#1056#1086#1089#1089#1080#1080
          #1069#1082#1089#1087#1086#1088#1090)
        TabOrder = 4
      end
      object rg_KindOfDate: TRadioGroup
        Left = 5
        Top = 13
        Width = 100
        Height = 78
        Caption = ' '#1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '
        ItemIndex = 0
        Items.Strings = (
          #1054#1092#1086#1088#1084#1083#1077#1085#1080#1103
          #1050#1074#1080#1090#1072#1085#1094#1080#1080
          #1057#1074#1077#1076#1077#1085#1080#1103)
        TabOrder = 5
        OnClick = rg_KindOfDateClick
      end
    end
  end
  object Panel4: TPanel
    Left = 220
    Top = 26
    Width = 31
    Height = 529
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 4
      Top = 4
      Width = 23
      Height = 22
      Hint = #1057#1087#1088#1103#1090#1072#1090#1100' '#1087#1072#1085#1077#1083#1100' "'#1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1099'"'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333333333333333333333333333FF333333333333
        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
        000033333373FF77777733333330003333333333333777333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 4
      Top = 28
      Width = 23
      Height = 22
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1085#1077#1083#1100' "'#1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1099'"'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButton2Click
    end
    object btYesOrNot: TSpeedButton
      Left = 4
      Top = 51
      Width = 23
      Height = 22
      Caption = '='
      Flat = True
      OnClick = btYesOrNotClick
    end
  end
  object ehProd: TDBGridEh
    Left = 0
    Top = 26
    Width = 217
    Height = 529
    Align = alLeft
    AllowedOperations = []
    AutoFitColWidths = True
    DataGrouping.GroupLevels = <>
    DataSource = ds_ProdTree
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    IndicatorOptions = []
    Options = [dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    RowDetailPanel.Color = clBtnFace
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        ImageList = f_main.img_Common
        ShowImageAndText = True
        OnGetCellParams = ehProdColumns0GetCellParams
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    Connected = True
    Left = 487
    Top = 353
  end
  object q_oper_ree: TOracleDataSet
    SQL.Strings = (
      
        'SELECT /* ORDERED USE_NL(kvit, MONTH,bills,poluch,potreb,kls_dog' +
        ',plat,kls_vagowner,kls_upak,gu12_a,orig_dog,kls_stan,kls_gdor,kl' +
        's_prod,kls_vid_otgr,sved,kls_pasp,v_plan_stru,kls_region,kls_tex' +
        '_pd,exped,z1,z2,a) */'
      
        '  MAX(KVIT.DATE_OFORML) AS date_oforml, MAX(kvit.date_otgr) as d' +
        'ate_otgr, PLAT.SHORT_NAME, PLAT.EMAIL,MAX(kvit.num_exp_mar) as n' +
        'um_exp_mar,'
      
        '  sum(kvit.sum_prod) as sum_prod, sum(kvit.sum_akciz) as sum_akc' +
        'iz, sum(kvit.sum_prod_nds) as sum_prod_nds, sum(kvit.sum_vozn11+' +
        'kvit.sum_vozn12) as sum_vozn, sum(kvit.sum_vozn11_nds+kvit.sum_v' +
        'ozn12_nds) as sum_vozn_nds, sum(kvit.sum_strah) as sum_strah,'
      
        '  MAX(DECODE(kvit.num_kvit,99999,0,kvit.num_kvit)) as NUM_KVIT, ' +
        'MAX(kvit.date_kvit) as date_kvit,MAX(kvit.vzliv) as vzliv, MAX(k' +
        'vit.temper) as temper, MAX(kvit.fakt_pl) as fakt_pl,'
      '  KLS_STAN.STAN_NAME || '#39' '#39' || kls_gdor.SHORT_NAME AS name_stan,'
      
        '  poluch.PREDPR_NAME || '#39' '#39' || month.gr4 as name_poluch, poluch.' +
        'PREDPR_NAME as POLUCH_NAME, potreb.PREDPR_NAME as POTREB_NAME, D' +
        'ECODE(kvit.exped_id,0,NULL,exped.PREDPR_NAME) as EXPED_NAME,'
      
        '  kls_prod.ABBR_NPR,KLS_DOG.DOG_NUMBER,GU12_A.NOM_Z as GU12_NOM_' +
        'Z,Z1.CLIENT_NUMBER,Z1.CLIENT_DATE,Z1.INPUT_NUMBER,Z1.INPUT_DATE,'
      
        '  kvit.SVED_NUM,kvit.mesto_id,sved.BEG_NALIV_TIME,sved.END_NALIV' +
        '_TIME,'
      '  kvit.NUM_CIST,'
      '  TO_NUMBER(kvit.ID) as ID,'
      '  kvit.SVED_ID,'
      
        '  month.nom_zd,kls_pasp.PASP_NUM as pasp,KVIT.PASP_ID,MAX(kvit.d' +
        'ate_cena) as date_cena, MAX(kvit.cena) as cena, MAX(kvit.cena_ot' +
        'p) as cena_otp, KLS_REGION.REGION_NAME, KLS_TEX_PD.TEX_PD_NAME, ' +
        ' SUM(kvit.kol_ed) as kol_ed, MAX(kvit.ves_ed) as ves_ed, SUM(kvi' +
        't.VES_BRUTTO) AS ves_brutto, SUM(ORA_CHAR_TO_NUM(kvit.CAPACITY))' +
        ' as CAPACITY, MAX(kvit.KALIBR_ID) as KALIBR_ID,'
      
        '  MAX(NVL((select max(k2n.npo_sf) from KTU_2_NPO_SF k2n where k2' +
        'n.NOM_DOK=kvit.bill_id),'#39#39')) as npo_sf, MAX(NVL((select max(bp.c' +
        'ena_bn) from KTU_2_NPO_SF k2n, bills_parus b, bill_pos_parus bp ' +
        'where k2n.NOM_DOK=kvit.bill_id and k2n.NPO_SF=b.NPO_SF and b.NOM' +
        '_DOK=bp.NOM_DOK and bp.bill_pos_parus_id=1 and bp.ves<>0),0)) as' +
        ' cena_bn_otp_snp, MAX(NVL((select max(bp.cena) from KTU_2_NPO_SF' +
        ' k2n, bills_parus b, bill_pos_parus bp where k2n.NOM_DOK=kvit.bi' +
        'll_id and k2n.NPO_SF=b.NPO_SF and b.NOM_DOK=bp.NOM_DOK and bp.bi' +
        'll_pos_parus_id=1 and bp.ves<>0),0)) as cena_otp_snp,'
      '  COUNT(*) as kol,'
      
        '  MAX(kls_upak.name) as UPAK_NAME, SUM(kvit.upak_ves) as upak_ve' +
        's, SUM(kvit.VES_CIST) AS ves_cist,kls_vid_otgr.load_type_id,bill' +
        's.NOM_SF,bills.KOL_DN,sum(kvit.TARIF) AS tarif,sum(kvit.tarif_nd' +
        's) as tarif_nds, sum(kvit.TARIF_GUARD) AS tarif_guard,sum(kvit.t' +
        'arif_guard_nds) as tarif_guard_nds, kls_vagowner.SHORT_NAME AS v' +
        'agowner_name,kls_vagowner.DISPLAY_NAME AS full_vagowner_name, MO' +
        'NTH.PLANSTRU_ID, v_plan_stru.NAME as PLANSTRU_NAME,MAX(kvit.BILL' +
        '_ID) as BILL_ID, kvit.tex_pd_id, zh1.kod_isu'
      'FROM'
      
        '  KVIT,MONTH,BILLS,KLS_PREDPR POLUCH,KLS_PREDPR POTREB,ZAKAZ z1,' +
        'ZAKAZ z2,KLS_DOG,KLS_PREDPR PLAT,kls_vagowner,kls_upak, GU12_A, ' +
        'KLS_DOG ORIG_DOG, zakaz_hist zh1,'
      
        '  KLS_STAN ,KLS_GDOR, kls_prod, kls_vid_otgr,SVED, KLS_PASP,v_pl' +
        'an_stru,KLS_REGION, KLS_TEX_PD, KLS_PREDPR exped,'
      
        '  (SELECT DISTINCT DECODE(app_users.unp+app_users.mnos,0,TO_DATE' +
        '('#39'31.12.2004'#39','#39'dd.mm.yyyy'#39'),TO_DATE('#39'01.01.2200'#39','#39'dd.mm.yyyy'#39')) ' +
        'AS EndDate FROM app_users WHERE app_users.NETNAME=For_Init.GetCu' +
        'rrUser) a'
      'WHERE'
      
        '  (POLUCH.ID(+) = MONTH.POLUCH_ID) AND (MONTH.POTREB_ID=POTREB.I' +
        'D(+)) AND (MONTH.PLANSTRU_ID=v_plan_stru.ID(+)) AND (kvit.exped_' +
        'id=exped.id(+)) AND (kvit.upak_id=KLS_UPAK.ID(+)) AND (month.GU1' +
        '2_A_ID=GU12_A.ID(+)) AND'
      
        '  (MONTH.NOM_ZD = KVIT.NOM_ZD) AND (KVIT.TEX_PD_ID=KLS_TEX_PD.ID' +
        '(+) AND KVIT.GROTP_ID=KLS_TEX_PD.GROTP_ID(+)) AND'
      '  (KLS_DOG.ID (+) = MONTH.DOG_ID) AND'
      
        '  (PLAT.ID (+) = KLS_DOG.PREDPR_ID) AND (month.ZAKAZ_ID=z1.ID(+)' +
        ') AND (z1.LINK_ID=z2.ID(+)) AND ORIG_DOG.ID(+)=MONTH.DOG_ID AND ' +
        'month.zakaz_hist_id=zh1.id(+) and'
      
        '  (KLS_STAN.ID (+) = MONTH.STAN_ID) AND (KLS_STAN.REGION_ID=KLS_' +
        'REGION.ID(+)) AND'
      '  (KLS_GDOR.ID (+) = KLS_STAN.GDOR_ID) AND'
      '  (kls_prod.ID_NPR (+) =kvit.PROD_ID_NPR) AND'
      '  (kls_vid_otgr.load_abbr (+) =month.load_abbr) AND'
      
        '  (sved.id(+)=kvit.sved_id) AND (bills.nom_dok(+)=kvit.bill_id) ' +
        'AND'
      
        '  (kls_pasp.id(+)=kvit.pasp_id) AND (kls_vagowner.ID (+) =kvit.V' +
        'AGOWNER_ID) AND (KVIT.DATE_OTGR<=a.EndDate or ORIG_DOG.predpr_id' +
        '=(CASE when kvit.date_otgr<to_date('#39'01.03.2009'#39','#39'dd.mm.yyyy'#39') th' +
        'en 2641 else 10 end)) AND'
      
        '  kvit.date_oforml>=TO_DATE('#39'01.08.2004 06:00'#39','#39'dd.mm.yyyy hh24:' +
        'mi'#39') And'
      
        '  kvit.date_oforml<=TO_DATE('#39'03.08.2004 06:00'#39','#39'dd.mm.yyyy hh24:' +
        'mi'#39')'
      ''
      'GROUP BY'
      
        '  kvit.mesto_id,KLS_DOG.DOG_NUMBER,PLAT.SHORT_NAME,PLAT.EMAIL,KL' +
        'S_STAN.STAN_NAME || '#39' '#39' || kls_gdor.SHORT_NAME,kls_vagowner.SHOR' +
        'T_NAME,kls_vagowner.DISPLAY_NAME,GU12_A.NOM_Z,Z1.CLIENT_NUMBER,Z' +
        '1.CLIENT_DATE,Z1.INPUT_NUMBER,Z1.INPUT_DATE,sved.BEG_NALIV_TIME,' +
        'sved.END_NALIV_TIME,'
      
        '  poluch.PREDPR_NAME, poluch.PREDPR_NAME || '#39' '#39' || month.gr4,pot' +
        'reb.PREDPR_NAME,kls_prod.ABBR_NPR,kvit.SVED_NUM,kvit.SVED_ID,mon' +
        'th.nom_zd,kvit.PASP_ID,kls_pasp.PASP_NUM,kls_vid_otgr.load_type_' +
        'id,bills.NOM_SF, bills.KOL_DN, MONTH.PLANSTRU_ID, v_plan_stru.NA' +
        'ME, KLS_REGION.REGION_NAME, KLS_TEX_PD.TEX_PD_NAME, kvit.exped_i' +
        'd,exped.PREDPR_NAME, kvit.tex_pd_id, zh1.kod_isu'
      '  ,kvit.num_cist, kvit.id'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000450000000B000000444154455F4F464F524D4C010000000000090000
      00444154455F4F5447520100000000000A00000053484F52545F4E414D450100
      0000000005000000454D41494C0100000000000B0000004E554D5F4558505F4D
      41520100000000000800000053554D5F50524F44010000000000090000005355
      4D5F414B43495A0100000000000C00000053554D5F50524F445F4E4453010000
      0000000800000053554D5F564F5A4E0100000000000C00000053554D5F564F5A
      4E5F4E44530100000000000900000053554D5F53545241480100000000000800
      00004E554D5F4B56495401000000000009000000444154455F4B564954010000
      00000005000000565A4C49560100000000000600000054454D50455201000000
      00000700000046414B545F504C010000000000090000004E414D455F5354414E
      0100000000000B0000004E414D455F504F4C5543480100000000000B00000050
      4F4C5543485F4E414D450100000000000A00000045585045445F4E414D450100
      0000000008000000414242525F4E50520100000000000A000000444F475F4E55
      4D4245520100000000000A000000475531325F4E4F4D5F5A0100000000000D00
      0000434C49454E545F4E554D4245520100000000000B000000434C49454E545F
      444154450100000000000C000000494E5055545F4E554D424552010000000000
      0A000000494E5055545F4441544501000000000008000000535645445F4E554D
      010000000000080000004D4553544F5F49440100000000000E0000004245475F
      4E414C49565F54494D450100000000000E000000454E445F4E414C49565F5449
      4D45010000000000080000004E554D5F43495354010000000000020000004944
      01000000000007000000535645445F4944010000000000060000004E4F4D5F5A
      44010000000000040000005041535001000000000007000000504153505F4944
      01000000000009000000444154455F43454E410100000000000400000043454E
      410100000000000800000043454E415F4F54500100000000000B000000524547
      494F4E5F4E414D450100000000000B0000005445585F50445F4E414D45010000
      000000060000004B4F4C5F4544010000000000060000005645535F4544010000
      0000000A0000005645535F42525554544F010000000000080000004341504143
      495459010000000000090000004B414C4942525F494401000000000003000000
      4B4F4C010000000000090000005550414B5F4E414D4501000000000008000000
      5550414B5F564553010000000000080000005645535F43495354010000000000
      0C0000004C4F41445F545950455F4944010000000000060000004E4F4D5F5346
      0100000000000500000054415249460100000000000900000054415249465F4E
      44530100000000000B00000054415249465F47554152440100000000000F0000
      0054415249465F47554152445F4E44530100000000000D0000005641474F574E
      45525F4E414D450100000000001200000046554C4C5F5641474F574E45525F4E
      414D450100000000000B000000504C414E535452555F49440100000000000D00
      0000504C414E535452555F4E414D450100000000000700000042494C4C5F4944
      0100000000000B000000504F545245425F4E414D45010000000000060000004B
      4F4C5F444E0100000000000F00000043454E415F424E5F4F54505F534E500100
      000000000C00000043454E415F4F54505F534E50010000000000060000004E50
      4F5F5346010000000000090000005445585F50445F4944010000000000070000
      004B4F445F495355010000000000}
    ReadOnly = True
    QueryAllRecords = False
    Session = ora_Session
    BeforeOpen = q_oper_reeBeforeOpen
    AfterOpen = q_oper_reeAfterOpen
    AfterScroll = q_oper_reeAfterScroll
    OnFilterRecord = q_oper_reeFilterRecord
    Left = 515
    Top = 353
    object q_oper_reeDATE_OFORML: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
      FieldName = 'DATE_OFORML'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object q_oper_reeSHORT_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object q_oper_reeEMAIL: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMAIL'
      Size = 40
    end
    object q_oper_reeNAME_STAN: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103
      FieldName = 'NAME_STAN'
      Size = 44
    end
    object q_oper_reeNAME_POLUCH: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' + '#1043#1088'4'
      FieldName = 'NAME_POLUCH'
      Required = True
      Size = 60
    end
    object q_oper_reeABBR_NPR: TStringField
      DisplayLabel = #1053'/'#1087#1088
      FieldName = 'ABBR_NPR'
    end
    object q_oper_reeNUM_CIST: TStringField
      DisplayLabel = #8470' '#1062#1080#1089#1090#1077#1088#1085#1099
      FieldName = 'NUM_CIST'
      Size = 10
    end
    object q_oper_reeNOM_ZD: TStringField
      DisplayLabel = #8470' '#1079#1072#1076#1072#1085#1080#1103
      FieldName = 'NOM_ZD'
      Required = True
      Size = 12
    end
    object q_oper_reePASP: TStringField
      DisplayLabel = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP'
      Size = 15
    end
    object q_oper_reePASP_ID: TStringField
      FieldName = 'PASP_ID'
      Size = 9
    end
    object q_oper_reeVES_BRUTTO: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'VES_BRUTTO'
      DisplayFormat = '#0.000'
    end
    object q_oper_reeKOL: TFloatField
      DisplayLabel = #1050#1086#1083'.'
      FieldName = 'KOL'
    end
    object q_oper_reeVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1090#1072#1088#1099
      FieldName = 'VES_CIST'
      DisplayFormat = '#0.0'
    end
    object q_oper_reeMESTO_ID: TIntegerField
      FieldName = 'MESTO_ID'
      Required = True
    end
    object q_oper_reeLOAD_TYPE_ID: TIntegerField
      DisplayLabel = #1042#1080#1076' '#1086#1090#1075#1088'.'
      FieldName = 'LOAD_TYPE_ID'
      Required = True
    end
    object q_oper_reeNOM_SF: TIntegerField
      DisplayLabel = #8470' '#1089'/'#1092' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      FieldName = 'NOM_SF'
    end
    object q_oper_reeTARIF: TFloatField
      DisplayLabel = #1046#1044' '#1090#1072#1088#1080#1092
      FieldName = 'TARIF'
      DisplayFormat = '#0.00'
    end
    object q_oper_reeDOG_NUMBER: TStringField
      DisplayLabel = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
      FieldName = 'DOG_NUMBER'
      Required = True
      Size = 30
    end
    object q_oper_reeVAGOWNER_NAME: TStringField
      DisplayLabel = #1042#1083#1072#1076#1077#1083#1077#1094' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VAGOWNER_NAME'
      Size = 10
    end
    object q_oper_reeDATE_OTGR: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'DATE_OTGR'
    end
    object q_oper_reeCAPACITY: TFloatField
      DisplayLabel = #1043#1088#1091#1079#1086'- '#1087#1086#1076#1098#1077#1084'- '#1085#1086#1089#1090#1100
      FieldName = 'CAPACITY'
      DisplayFormat = '#0.0'
    end
    object q_oper_reeKALIBR_ID: TStringField
      DisplayLabel = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
      FieldName = 'KALIBR_ID'
      Size = 5
    end
    object q_oper_reePLANSTRU_ID: TFloatField
      FieldName = 'PLANSTRU_ID'
    end
    object q_oper_reePLANSTRU_NAME: TStringField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1086#1082
      FieldName = 'PLANSTRU_NAME'
      Required = True
      Size = 156
    end
    object q_oper_reeSVED_ID: TStringField
      FieldName = 'SVED_ID'
      Size = 9
    end
    object q_oper_reeID: TFloatField
      FieldName = 'ID'
    end
    object q_oper_reePOLUCH_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'POLUCH_NAME'
      Required = True
      Size = 60
    end
    object q_oper_reeCENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072' '#1073#1077#1079' '#1053#1044#1057
      FieldName = 'CENA'
      DisplayFormat = '#0.00'
    end
    object q_oper_reeCENA_OTP: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072' '#1089' '#1053#1044#1057
      FieldName = 'CENA_OTP'
      DisplayFormat = '#0.00'
    end
    object q_oper_reeREGION_NAME: TStringField
      DisplayLabel = #1056#1077#1075#1080#1086#1085
      FieldName = 'REGION_NAME'
      Size = 30
    end
    object q_oper_reeNUM_EXP_MAR: TStringField
      DisplayLabel = #8470' '#1101#1082#1089#1087'. '#1084#1072#1088#1096#1088#1091#1090#1072
      FieldName = 'NUM_EXP_MAR'
      Size = 10
    end
    object q_oper_reeSUM_PROD: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1079#1072' '#1087#1088#1086#1076#1091#1082#1090
      FieldName = 'SUM_PROD'
      DisplayFormat = '#0.00'
    end
    object q_oper_reeSUM_AKCIZ: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1072#1082#1094#1080#1079#1072
      FieldName = 'SUM_AKCIZ'
      DisplayFormat = '#0.00'
    end
    object q_oper_reeSUM_PROD_NDS: TFloatField
      DisplayLabel = #1053#1044#1057' '#1079#1072' '#1087#1088#1086#1076#1091#1082#1090
      FieldName = 'SUM_PROD_NDS'
      DisplayFormat = '#0.00'
    end
    object q_oper_reeSUM_VOZN: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074#1086#1079#1085#1072#1075#1088#1072#1078#1076#1077#1085#1080#1103
      FieldName = 'SUM_VOZN'
      DisplayFormat = '#0.00'
    end
    object q_oper_reeSUM_VOZN_NDS: TFloatField
      DisplayLabel = #1053#1044#1057' '#1074#1086#1079#1085#1072#1075#1088#1072#1078#1076#1077#1085#1080#1103
      FieldName = 'SUM_VOZN_NDS'
      DisplayFormat = '#0.00'
    end
    object q_oper_reeSUM_STRAH: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089#1090#1088#1072#1093#1086#1074#1082#1080
      FieldName = 'SUM_STRAH'
      DisplayFormat = '#0.00'
    end
    object q_oper_reeNUM_KVIT: TFloatField
      DisplayLabel = #8470' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
      FieldName = 'NUM_KVIT'
    end
    object q_oper_reeDATE_KVIT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
      FieldName = 'DATE_KVIT'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_oper_reeVZLIV: TFloatField
      DisplayLabel = #1042#1079#1083#1080#1074' / '#1086#1073#1098#1077#1084
      FieldName = 'VZLIV'
    end
    object q_oper_reeTEMPER: TFloatField
      DisplayLabel = #1058#1077#1084#1087#1077'- '#1088#1072#1090#1091#1088#1072
      FieldName = 'TEMPER'
    end
    object q_oper_reeFAKT_PL: TFloatField
      DisplayLabel = #1060#1072#1082#1090'. '#1087#1083#1086#1090#1085'.'
      FieldName = 'FAKT_PL'
      DisplayFormat = '#0.0000'
    end
    object q_oper_reeEXPED_NAME: TStringField
      DisplayLabel = #1069#1082#1089#1087#1077#1076#1080#1090#1086#1088
      FieldName = 'EXPED_NAME'
      Size = 60
    end
    object q_oper_reeGU12_NOM_Z: TStringField
      DisplayLabel = #8470' '#1069#1058#1056#1040#1053
      FieldName = 'GU12_NOM_Z'
      Size = 15
    end
    object q_oper_reeCLIENT_NUMBER: TStringField
      DisplayLabel = #1048#1089#1093' '#8470' '#1079#1072#1082#1072#1079#1072' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'CLIENT_NUMBER'
      Size = 50
    end
    object q_oper_reeCLIENT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072
      FieldName = 'CLIENT_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_oper_reeINPUT_NUMBER: TStringField
      DisplayLabel = #1042#1093' '#8470' '#1085#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'INPUT_NUMBER'
      Size = 50
    end
    object q_oper_reeINPUT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072
      FieldName = 'INPUT_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_oper_reeBEG_NALIV_TIME: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1085#1072#1083#1080#1074#1072
      FieldName = 'BEG_NALIV_TIME'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object q_oper_reeEND_NALIV_TIME: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1085#1072#1083#1080#1074#1072
      FieldName = 'END_NALIV_TIME'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object q_oper_reeDATE_CENA: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1094#1077#1085#1099' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      FieldName = 'DATE_CENA'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_oper_reeTEX_PD_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1090#1072#1088#1080#1092#1072' / '#1043#1088#1091#1079#1086#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
      FieldName = 'TEX_PD_NAME'
      Size = 50
    end
    object q_oper_reeKOL_ED: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1077#1076'-'#1094
      FieldName = 'KOL_ED'
    end
    object q_oper_reeVES_ED: TFloatField
      DisplayLabel = #1042#1077#1089' 1 '#1077#1076
      FieldName = 'VES_ED'
      DisplayFormat = '#0.000'
    end
    object q_oper_reeUPAK_NAME: TStringField
      DisplayLabel = #1059#1087#1072#1082#1086#1074#1082#1072
      FieldName = 'UPAK_NAME'
      Size = 30
    end
    object q_oper_reeUPAK_VES: TFloatField
      DisplayLabel = #1042#1077#1089' '#1091#1087#1072#1082#1086#1074#1082#1080
      FieldName = 'UPAK_VES'
      DisplayFormat = '#0.000000'
    end
    object q_oper_reeTARIF_NDS: TFloatField
      DisplayLabel = #1058#1072#1088#1080#1092' ('#1053#1044#1057')'
      FieldName = 'TARIF_NDS'
      DisplayFormat = '#0.00'
    end
    object q_oper_reeTARIF_GUARD: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1090#1072' '#1086#1093#1088#1072#1085#1099
      FieldName = 'TARIF_GUARD'
      DisplayFormat = '#0.00'
    end
    object q_oper_reeTARIF_GUARD_NDS: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1090#1072' '#1086#1093#1088#1072#1085#1099' ('#1053#1044#1057')'
      FieldName = 'TARIF_GUARD_NDS'
      DisplayFormat = '#0.00'
    end
    object q_oper_reeFULL_VAGOWNER_NAME: TStringField
      DisplayLabel = #1042#1083#1072#1076#1077#1083#1077#1094' '#1074#1072#1075#1086#1085#1072' ('#1087#1086#1083#1085#1086#1089#1090#1100#1102')'
      FieldName = 'FULL_VAGOWNER_NAME'
      Size = 50
    end
    object q_oper_reeBILL_ID: TFloatField
      FieldName = 'BILL_ID'
    end
    object q_oper_reePOTREB_NAME: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
      FieldName = 'POTREB_NAME'
      Size = 60
    end
    object q_oper_reeKOL_DN: TIntegerField
      DisplayLabel = #1054#1090#1089#1088#1086#1095#1082#1072', '#1076#1085
      FieldName = 'KOL_DN'
    end
    object q_oper_reeCENA_BN_OTP_SNP: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1057#1053#1055' '#1073#1077#1079' '#1053#1044#1057
      FieldName = 'CENA_BN_OTP_SNP'
    end
    object q_oper_reeCENA_OTP_SNP: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1057#1053#1055' '#1074#1082#1083'.'#1053#1044#1057
      FieldName = 'CENA_OTP_SNP'
    end
    object q_oper_reeNPO_SF: TStringField
      DisplayLabel = #8470' '#1080#1089#1093#1086#1076#1103#1097#1077#1075#1086' '#1089'/'#1092' '#1057#1053#1055
      FieldName = 'NPO_SF'
    end
    object q_oper_reeKOD_ISU: TStringField
      DisplayLabel = #1047#1072#1103#1074#1082#1072' '#1080#1079' '#1048#1057#1059' (301)'
      FieldName = 'KOD_ISU'
      Size = 15
    end
    object q_oper_reeTEX_PD_ID: TFloatField
      DisplayLabel = #1050#1086#1076' '#1058#1045#1061' '#1055#1044
      FieldName = 'TEX_PD_ID'
    end
    object q_oper_reeSVED_NUM: TFloatField
      DisplayLabel = #8470' '#1057#1074#1077#1076'.'
      FieldName = 'SVED_NUM'
    end
  end
  object ds_oper_ree: TDataSource
    DataSet = q_oper_ree
    Left = 515
    Top = 381
  end
  object q_ProdGr: TOracleDataSet
    SQL.Strings = (
      'select '
      '  kls_prod.id_npr,'
      '  kls_prod.NAME_NPR '
      'from kls_prod where kls_prod.ID_GROUP_NPR='#39'00000'#39
      'ORDER BY 1')
    Session = ora_Session
    Left = 543
    Top = 353
    object q_ProdGrID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object q_ProdGrNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
  end
  object ds_ProdGr: TDataSource
    DataSet = q_ProdGr
    Left = 543
    Top = 381
  end
  object q_Prod: TOracleDataSet
    SQL.Strings = (
      'select '
      '  kls_prod.id_npr,'
      '  kls_prod.NAME_NPR '
      'from kls_prod where kls_prod.ID_GROUP_NPR<>'#39'00000'#39
      'ORDER BY 1')
    Session = ora_Session
    Left = 571
    Top = 353
    object StringField1: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object StringField2: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
  end
  object ds_Prod: TDataSource
    DataSet = q_Prod
    Left = 571
    Top = 381
  end
  object q_Plat: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  kls_predpr.id,'
      '  kls_predpr.short_name'
      '  FROM kls_predpr,kls_dog'
      '  WHERE kls_dog.predpr_id=kls_predpr.id'
      '  ORDER BY 2')
    Session = ora_Session
    Left = 599
    Top = 353
    object q_PlatID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_PlatSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object ds_Plat: TDataSource
    DataSet = q_Plat
    Left = 599
    Top = 381
  end
  object q_Poluch: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  kls_predpr.id,'
      '  kls_predpr.short_name'
      '  FROM kls_predpr'
      '  ORDER BY 2')
    Session = ora_Session
    Left = 627
    Top = 353
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object ds_Poluch: TDataSource
    DataSet = q_Poluch
    Left = 627
    Top = 381
  end
  object q_stan: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  stan_kod,'
      '  stan_name'
      '  FROM kls_stan'
      '  ORDER BY 2')
    Session = ora_Session
    Left = 655
    Top = 353
    object q_stanSTAN_KOD: TIntegerField
      FieldName = 'STAN_KOD'
      Required = True
    end
    object q_stanSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Required = True
      Size = 35
    end
  end
  object ds_stan: TDataSource
    DataSet = q_stan
    Left = 655
    Top = 381
  end
  object PrintDBGridEh1: TPrintDBGridEh
    Options = [pghFitGridToPageWidth, pghRowAutoStretch, pghFitingByColWidths, pghOptimalColWidths]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = RUSSIAN_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -8
    PageHeader.Font.Name = 'Times New Roman'
    PageHeader.Font.Style = []
    PrintFontName = 'MS Sans Serif'
    Units = MM
    Left = 459
    Top = 353
  end
  object ActionManager1: TActionManager
    ActionBars.SessionCount = 45
    ActionBars = <
      item
        Items = <
          item
            Action = acOperReePrintTable
            ImageIndex = 6
          end
          item
            Action = acOperReePrintSved
            ImageIndex = 6
          end>
        AutoSize = False
      end
      item
        Items = <
          item
            Items = <
              item
                Action = acOperReePrintTable
                ImageIndex = 6
              end
              item
                Action = acOperReePrintSved
                ImageIndex = 6
              end>
            Caption = '&Common'
          end>
        AutoSize = False
      end>
    Images = f_main.img_Common
    Left = 459
    Top = 381
    StyleName = 'XP Style'
    object acOperReePrint: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 6
    end
    object acOperReePrintTable: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099
      ImageIndex = 0
      OnExecute = acOperReePrintTableExecute
    end
    object acOperReePrintSved: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1074#1077#1076#1077#1085#1080#1103
      ImageIndex = 0
      OnExecute = acOperReePrintSvedExecute
    end
    object acOperReePrintPasp: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100' '#1087#1072#1089#1087#1086#1088#1090#1072
      ImageIndex = 0
      OnExecute = acOperReePrintPaspExecute
    end
    object acOperReeByCist: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1086' '#1094#1080#1089#1090#1077#1088#1085#1072#1084
      ImageIndex = 7
      OnExecute = acOperReeByCistExecute
    end
    object acSNP: TAction
      Category = 'FOR_ALL'
      Caption = #1058#1088#1072#1085#1079#1080#1090' '#1057#1077#1074#1077#1088#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072
      ImageIndex = 4
      OnExecute = acSNPExecute
    end
    object acOperReeFilter: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100'...'
      ImageIndex = 9
      OnExecute = acOperReeFilterExecute
    end
    object acOperReeNoFilter: TAction
      Category = 'FOR_ALL'
      Caption = #1059#1073#1088#1072#1090#1100' '#1086#1090#1073#1086#1088
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 16
      OnExecute = acOperReeNoFilterExecute
    end
    object acOperReeRefresh: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      ShortCut = 119
      OnExecute = acOperReeRefreshExecute
    end
    object acOperReeToXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      ImageIndex = 42
      OnExecute = acOperReeToXLSExecute
    end
    object acOperReeStream: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1086#1090#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 7
      OnExecute = acOperReeStreamExecute
    end
    object acOperReeLinkSF: TAction
      Category = 'FOR_ALL'
      Caption = #1057#1095#1077#1090#1072'-'#1092#1072#1082#1090#1091#1088#1072
      ImageIndex = 19
      OnExecute = acOperReeLinkSFExecute
    end
    object acOperReeLinkMon: TAction
      Category = 'FOR_ALL'
      Caption = #1056#1072#1079#1085#1072#1088#1103#1076#1082#1072
      ImageIndex = 18
      OnExecute = acOperReeLinkMonExecute
    end
    object acLastReis: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' '#1088#1077#1081#1089#1099
      ImageIndex = 22
      OnExecute = acLastReisExecute
    end
  end
  object Crpe1: TCrpe
    About = 'Version and Credits...'
    DesignControls = 'Design-Time Window Controls'
    Version.Crpe.Major = 0
    Version.Crpe.Minor = 0
    Version.Crpe.Release = 0
    Version.Crpe.Build = 0
    Version.Report.Major = 0
    Version.Report.Minor = 0
    Version.Report.Letter = #0
    Version.Windows.Platform = 'NT'
    Version.Windows.Major = 6
    Version.Windows.Minor = 1
    Version.Windows.Build = '7601'
    ReportName = 'U:\Master\by_detail.rpt'
    CrpePath = 'C:\WINDOWS\System32\'
    TempPath = 'd:\temp\'
    Margins.Left = 341
    Margins.Right = 341
    Margins.Top = 240
    Margins.Bottom = 240
    PrintDate.Day = 26
    PrintDate.Month = 8
    PrintDate.Year = 2005
    Subreports.Number = 0
    Subreports.Item.Top = -1
    Subreports.Item.Left = -1
    Subreports.Item.Width = -1
    Subreports.Item.Height = -1
    Subreports.Item.Border.Left = lsNone
    Subreports.Item.Border.Right = lsNone
    Subreports.Item.Border.Top = lsNone
    Subreports.Item.Border.Bottom = lsNone
    Subreports.Item.Border.TightHorizontal = False
    Subreports.Item.Border.DropShadow = False
    Subreports.Item.Border.ForeColor = clNone
    Subreports.Item.Border.BackgroundColor = clNone
    Subreports.Item.NLinks = 0
    GroupSortFields.Number = -1
    Groups.Number = -1
    Groups.Item.CustomizeGroupName = False
    ParamFields.AllowDialog = True
    ParamFields.Item.Top = -1
    ParamFields.Item.Left = -1
    ParamFields.Item.Width = -1
    ParamFields.Item.Height = -1
    ParamFields.Item.Border.Left = lsNone
    ParamFields.Item.Border.Right = lsNone
    ParamFields.Item.Border.Top = lsNone
    ParamFields.Item.Border.Bottom = lsNone
    ParamFields.Item.Border.TightHorizontal = False
    ParamFields.Item.Border.DropShadow = False
    ParamFields.Item.Border.ForeColor = clNone
    ParamFields.Item.Border.BackgroundColor = clNone
    ParamFields.Item.Format.Alignment = haDefault
    ParamFields.Item.Format.SuppressIfDuplicated = False
    ParamFields.Item.Format.CanGrow = False
    ParamFields.Item.Format.MaxNLines = 0
    ParamFields.Item.Format.Field.Number.CurrencySymbol = '$'
    ParamFields.Item.Format.Field.Number.ThousandSymbol = ','
    ParamFields.Item.Format.Field.Number.DecimalSymbol = '.'
    ParamFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    ParamFields.Item.Format.Field.Date.FirstSeparator = '/'
    ParamFields.Item.Format.Field.Date.SecondSeparator = '/'
    ParamFields.Item.Format.Field.Time.AMString = 'AM'
    ParamFields.Item.Format.Field.Time.PMString = 'PM'
    ParamFields.Item.Format.Field.Time.HourMinSeparator = ':'
    ParamFields.Item.Format.Field.Time.MinSecSeparator = ':'
    ParamFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    ParamFields.Item.Font.Charset = DEFAULT_CHARSET
    ParamFields.Item.Font.Color = clWindowText
    ParamFields.Item.Font.Height = -11
    ParamFields.Item.Font.Name = 'MS Sans Serif'
    ParamFields.Item.Font.Style = []
    ParamFields.Item.HiliteConditions.Item.FontColor = clNone
    ParamFields.Item.HiliteConditions.Item.Background = clNone
    ParamFields.Item.ParamType = pfNoValue
    ParamFields.Item.ParamSource = psReport
    ParamFields.Item.Info.AllowNull = True
    ParamFields.Item.Info.AllowEditing = True
    ParamFields.Item.Info.AllowMultipleValues = False
    ParamFields.Item.Info.ValueType = vtDiscrete
    ParamFields.Item.Info.PartOfGroup = False
    ParamFields.Item.Info.MutuallyExclusiveGroup = True
    ParamFields.Item.Info.GroupNum = -1
    ParamFields.Item.ValueLimit = False
    ParamFields.Item.Ranges.Item.Bounds = IncludeStartAndEnd
    ParamFields.Item.NeedsCurrentValue = False
    Formulas.Item.Top = -1
    Formulas.Item.Left = -1
    Formulas.Item.Width = -1
    Formulas.Item.Height = -1
    Formulas.Item.Border.Left = lsNone
    Formulas.Item.Border.Right = lsNone
    Formulas.Item.Border.Top = lsNone
    Formulas.Item.Border.Bottom = lsNone
    Formulas.Item.Border.TightHorizontal = False
    Formulas.Item.Border.DropShadow = False
    Formulas.Item.Border.ForeColor = clNone
    Formulas.Item.Border.BackgroundColor = clNone
    Formulas.Item.Format.Alignment = haDefault
    Formulas.Item.Format.SuppressIfDuplicated = False
    Formulas.Item.Format.CanGrow = False
    Formulas.Item.Format.MaxNLines = 0
    Formulas.Item.Format.Field.Number.CurrencySymbol = '$'
    Formulas.Item.Format.Field.Number.ThousandSymbol = ','
    Formulas.Item.Format.Field.Number.DecimalSymbol = '.'
    Formulas.Item.Format.Field.Number.ShowZeroValueAs = '0'
    Formulas.Item.Format.Field.Date.FirstSeparator = '/'
    Formulas.Item.Format.Field.Date.SecondSeparator = '/'
    Formulas.Item.Format.Field.Time.AMString = 'AM'
    Formulas.Item.Format.Field.Time.PMString = 'PM'
    Formulas.Item.Format.Field.Time.HourMinSeparator = ':'
    Formulas.Item.Format.Field.Time.MinSecSeparator = ':'
    Formulas.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    Formulas.Item.Font.Charset = DEFAULT_CHARSET
    Formulas.Item.Font.Color = clWindowText
    Formulas.Item.Font.Height = -11
    Formulas.Item.Font.Name = 'MS Sans Serif'
    Formulas.Item.Font.Style = []
    Formulas.Item.HiliteConditions.Item.FontColor = clNone
    Formulas.Item.HiliteConditions.Item.Background = clNone
    AreaFormat.Item.NSections = 0
    SectionSize.Item.Height = -1
    SectionSize.Item.Width = -1
    Connect.ServerName = 'buh'
    Connect.UserID = 'master'
    SQLExpressions.Item.Top = -1
    SQLExpressions.Item.Left = -1
    SQLExpressions.Item.Width = -1
    SQLExpressions.Item.Height = -1
    SQLExpressions.Item.Border.Left = lsNone
    SQLExpressions.Item.Border.Right = lsNone
    SQLExpressions.Item.Border.Top = lsNone
    SQLExpressions.Item.Border.Bottom = lsNone
    SQLExpressions.Item.Border.TightHorizontal = False
    SQLExpressions.Item.Border.DropShadow = False
    SQLExpressions.Item.Border.ForeColor = clNone
    SQLExpressions.Item.Border.BackgroundColor = clNone
    SQLExpressions.Item.Format.Alignment = haDefault
    SQLExpressions.Item.Format.SuppressIfDuplicated = False
    SQLExpressions.Item.Format.CanGrow = False
    SQLExpressions.Item.Format.MaxNLines = 0
    SQLExpressions.Item.Format.Field.Number.CurrencySymbol = '$'
    SQLExpressions.Item.Format.Field.Number.ThousandSymbol = ','
    SQLExpressions.Item.Format.Field.Number.DecimalSymbol = '.'
    SQLExpressions.Item.Format.Field.Number.ShowZeroValueAs = '0'
    SQLExpressions.Item.Format.Field.Date.FirstSeparator = '/'
    SQLExpressions.Item.Format.Field.Date.SecondSeparator = '/'
    SQLExpressions.Item.Format.Field.Time.AMString = 'AM'
    SQLExpressions.Item.Format.Field.Time.PMString = 'PM'
    SQLExpressions.Item.Format.Field.Time.HourMinSeparator = ':'
    SQLExpressions.Item.Format.Field.Time.MinSecSeparator = ':'
    SQLExpressions.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    SQLExpressions.Item.Font.Charset = DEFAULT_CHARSET
    SQLExpressions.Item.Font.Color = clWindowText
    SQLExpressions.Item.Font.Height = -11
    SQLExpressions.Item.Font.Name = 'MS Sans Serif'
    SQLExpressions.Item.Font.Style = []
    SQLExpressions.Item.HiliteConditions.Item.FontColor = clNone
    SQLExpressions.Item.HiliteConditions.Item.Background = clNone
    LogOnInfo.Item.Table = -1
    SessionInfo.Table = -1
    SessionInfo.Item.Propagate = True
    ExportOptions.Excel.Constant = 9.000000000000000000
    ExportOptions.Excel.Area = 'D'
    ExportOptions.HTML.PageNavigator = True
    ExportOptions.HTML.SeparatePages = True
    ExportOptions.CharSepDelimiter = '"'
    ExportOptions.CharSepSeparator = ','
    PrintOptions.StartPage = 1
    PrintOptions.StopPage = 65535
    Lines.Item.LineStyle = lsNone
    Lines.Item.Left = -1
    Lines.Item.Right = -1
    Lines.Item.Width = -1
    Lines.Item.Top = -1
    Lines.Item.Bottom = -1
    Lines.Item.Color = clNone
    Lines.Item.Extend = False
    Lines.Item.Suppress = False
    Boxes.Number = -1
    Pictures.Item.Top = -1
    Pictures.Item.Left = -1
    Pictures.Item.Width = -1
    Pictures.Item.Height = -1
    Pictures.Item.Border.Left = lsNone
    Pictures.Item.Border.Right = lsNone
    Pictures.Item.Border.Top = lsNone
    Pictures.Item.Border.Bottom = lsNone
    Pictures.Item.Border.TightHorizontal = False
    Pictures.Item.Border.DropShadow = False
    Pictures.Item.Border.ForeColor = clNone
    Pictures.Item.Border.BackgroundColor = clNone
    Pictures.Item.CropLeft = -1
    Pictures.Item.CropRight = -1
    Pictures.Item.CropTop = -1
    Pictures.Item.CropBottom = -1
    TextObjects.Item.Top = -1
    TextObjects.Item.Left = -1
    TextObjects.Item.Width = -1
    TextObjects.Item.Height = -1
    TextObjects.Item.Border.Left = lsNone
    TextObjects.Item.Border.Right = lsNone
    TextObjects.Item.Border.Top = lsNone
    TextObjects.Item.Border.Bottom = lsNone
    TextObjects.Item.Border.TightHorizontal = False
    TextObjects.Item.Border.DropShadow = False
    TextObjects.Item.Border.ForeColor = clNone
    TextObjects.Item.Border.BackgroundColor = clNone
    TextObjects.Item.Format.Alignment = haDefault
    TextObjects.Item.Format.SuppressIfDuplicated = False
    TextObjects.Item.Format.CanGrow = False
    TextObjects.Item.Format.MaxNLines = 0
    TextObjects.Item.Format.Paragraph.LineSpacing = 1.000000000000000000
    TextObjects.Item.Font.Charset = DEFAULT_CHARSET
    TextObjects.Item.Font.Color = clWindowText
    TextObjects.Item.Font.Height = -11
    TextObjects.Item.Font.Name = 'MS Sans Serif'
    TextObjects.Item.Font.Style = []
    TextObjects.Item.Paragraphs.Item.Alignment = haDefault
    TextObjects.Item.Paragraphs.Item.IndentFirstLine = 0
    TextObjects.Item.Paragraphs.Item.IndentLeft = 0
    TextObjects.Item.Paragraphs.Item.IndentRight = 0
    TextObjects.Item.Paragraphs.Item.TextStart = 0
    TextObjects.Item.Paragraphs.Item.TextEnd = 0
    TextObjects.Item.Paragraphs.Item.TabStops.Item.Alignment = haDefault
    TextObjects.Item.Paragraphs.Item.TabStops.Item.Offset = -1
    TextObjects.Item.EmbeddedFields.Item.FieldObjectType = oftNone
    TextObjects.Item.EmbeddedFields.Item.FieldType = fvUnknown
    TextObjects.Item.EmbeddedFields.Item.TextStart = 0
    TextObjects.Item.EmbeddedFields.Item.TextEnd = 0
    TextObjects.Item.EmbeddedFields.Item.Format.Alignment = haDefault
    TextObjects.Item.EmbeddedFields.Item.Format.SuppressIfDuplicated = False
    TextObjects.Item.EmbeddedFields.Item.Format.CanGrow = False
    TextObjects.Item.EmbeddedFields.Item.Format.MaxNLines = 0
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.CurrencySymbol = '$'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.ThousandSymbol = ','
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.DecimalSymbol = '.'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Date.FirstSeparator = '/'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Date.SecondSeparator = '/'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.AMString = 'AM'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.PMString = 'PM'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.HourMinSeparator = ':'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Time.MinSecSeparator = ':'
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    TextObjects.Item.EmbeddedFields.Item.Border.Left = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.Right = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.Top = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.Bottom = lsNone
    TextObjects.Item.EmbeddedFields.Item.Border.TightHorizontal = False
    TextObjects.Item.EmbeddedFields.Item.Border.DropShadow = False
    TextObjects.Item.EmbeddedFields.Item.Border.ForeColor = clNone
    TextObjects.Item.EmbeddedFields.Item.Border.BackgroundColor = clNone
    TextObjects.Item.TextSize = -1
    TextObjects.Item.TextHeight = -1
    OleObjects.Item.Top = -1
    OleObjects.Item.Left = -1
    OleObjects.Item.Width = -1
    OleObjects.Item.Height = -1
    OleObjects.Item.Border.Left = lsNone
    OleObjects.Item.Border.Right = lsNone
    OleObjects.Item.Border.Top = lsNone
    OleObjects.Item.Border.Bottom = lsNone
    OleObjects.Item.Border.TightHorizontal = False
    OleObjects.Item.Border.DropShadow = False
    OleObjects.Item.Border.ForeColor = clNone
    OleObjects.Item.Border.BackgroundColor = clNone
    CrossTabs.Item.Top = -1
    CrossTabs.Item.Left = -1
    CrossTabs.Item.Width = -1
    CrossTabs.Item.Height = -1
    CrossTabs.Item.Border.Left = lsNone
    CrossTabs.Item.Border.Right = lsNone
    CrossTabs.Item.Border.Top = lsNone
    CrossTabs.Item.Border.Bottom = lsNone
    CrossTabs.Item.Border.TightHorizontal = False
    CrossTabs.Item.Border.DropShadow = False
    CrossTabs.Item.Border.ForeColor = clNone
    CrossTabs.Item.Border.BackgroundColor = clNone
    Maps.Item.Top = -1
    Maps.Item.Left = -1
    Maps.Item.Width = -1
    Maps.Item.Height = -1
    Maps.Item.Border.Left = lsNone
    Maps.Item.Border.Right = lsNone
    Maps.Item.Border.Top = lsNone
    Maps.Item.Border.Bottom = lsNone
    Maps.Item.Border.TightHorizontal = False
    Maps.Item.Border.DropShadow = False
    Maps.Item.Border.ForeColor = clNone
    Maps.Item.Border.BackgroundColor = clNone
    OLAPCubes.Item.Top = -1
    OLAPCubes.Item.Left = -1
    OLAPCubes.Item.Width = -1
    OLAPCubes.Item.Height = -1
    OLAPCubes.Item.Border.Left = lsNone
    OLAPCubes.Item.Border.Right = lsNone
    OLAPCubes.Item.Border.Top = lsNone
    OLAPCubes.Item.Border.Bottom = lsNone
    OLAPCubes.Item.Border.TightHorizontal = False
    OLAPCubes.Item.Border.DropShadow = False
    OLAPCubes.Item.Border.ForeColor = clNone
    OLAPCubes.Item.Border.BackgroundColor = clNone
    DatabaseFields.Item.Top = -1
    DatabaseFields.Item.Left = -1
    DatabaseFields.Item.Width = -1
    DatabaseFields.Item.Height = -1
    DatabaseFields.Item.Border.Left = lsNone
    DatabaseFields.Item.Border.Right = lsNone
    DatabaseFields.Item.Border.Top = lsNone
    DatabaseFields.Item.Border.Bottom = lsNone
    DatabaseFields.Item.Border.TightHorizontal = False
    DatabaseFields.Item.Border.DropShadow = False
    DatabaseFields.Item.Border.ForeColor = clNone
    DatabaseFields.Item.Border.BackgroundColor = clNone
    DatabaseFields.Item.Format.Alignment = haDefault
    DatabaseFields.Item.Format.SuppressIfDuplicated = False
    DatabaseFields.Item.Format.CanGrow = False
    DatabaseFields.Item.Format.MaxNLines = 0
    DatabaseFields.Item.Format.Field.Number.CurrencySymbol = '$'
    DatabaseFields.Item.Format.Field.Number.ThousandSymbol = ','
    DatabaseFields.Item.Format.Field.Number.DecimalSymbol = '.'
    DatabaseFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    DatabaseFields.Item.Format.Field.Date.FirstSeparator = '/'
    DatabaseFields.Item.Format.Field.Date.SecondSeparator = '/'
    DatabaseFields.Item.Format.Field.Time.AMString = 'AM'
    DatabaseFields.Item.Format.Field.Time.PMString = 'PM'
    DatabaseFields.Item.Format.Field.Time.HourMinSeparator = ':'
    DatabaseFields.Item.Format.Field.Time.MinSecSeparator = ':'
    DatabaseFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    DatabaseFields.Item.Font.Charset = DEFAULT_CHARSET
    DatabaseFields.Item.Font.Color = clWindowText
    DatabaseFields.Item.Font.Height = -11
    DatabaseFields.Item.Font.Name = 'MS Sans Serif'
    DatabaseFields.Item.Font.Style = []
    DatabaseFields.Item.HiliteConditions.Item.FontColor = clNone
    DatabaseFields.Item.HiliteConditions.Item.Background = clNone
    SummaryFields.Item.Top = -1
    SummaryFields.Item.Left = -1
    SummaryFields.Item.Width = -1
    SummaryFields.Item.Height = -1
    SummaryFields.Item.Border.Left = lsNone
    SummaryFields.Item.Border.Right = lsNone
    SummaryFields.Item.Border.Top = lsNone
    SummaryFields.Item.Border.Bottom = lsNone
    SummaryFields.Item.Border.TightHorizontal = False
    SummaryFields.Item.Border.DropShadow = False
    SummaryFields.Item.Border.ForeColor = clNone
    SummaryFields.Item.Border.BackgroundColor = clNone
    SummaryFields.Item.Format.Alignment = haDefault
    SummaryFields.Item.Format.SuppressIfDuplicated = False
    SummaryFields.Item.Format.CanGrow = False
    SummaryFields.Item.Format.MaxNLines = 0
    SummaryFields.Item.Format.Field.Number.CurrencySymbol = '$'
    SummaryFields.Item.Format.Field.Number.ThousandSymbol = ','
    SummaryFields.Item.Format.Field.Number.DecimalSymbol = '.'
    SummaryFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    SummaryFields.Item.Format.Field.Date.FirstSeparator = '/'
    SummaryFields.Item.Format.Field.Date.SecondSeparator = '/'
    SummaryFields.Item.Format.Field.Time.AMString = 'AM'
    SummaryFields.Item.Format.Field.Time.PMString = 'PM'
    SummaryFields.Item.Format.Field.Time.HourMinSeparator = ':'
    SummaryFields.Item.Format.Field.Time.MinSecSeparator = ':'
    SummaryFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    SummaryFields.Item.Font.Charset = DEFAULT_CHARSET
    SummaryFields.Item.Font.Color = clWindowText
    SummaryFields.Item.Font.Height = -11
    SummaryFields.Item.Font.Name = 'MS Sans Serif'
    SummaryFields.Item.Font.Style = []
    SummaryFields.Item.HiliteConditions.Item.FontColor = clNone
    SummaryFields.Item.HiliteConditions.Item.Background = clNone
    SpecialFields.Number = -1
    SpecialFields.Item.Top = -1
    SpecialFields.Item.Left = -1
    SpecialFields.Item.Width = -1
    SpecialFields.Item.Height = -1
    SpecialFields.Item.Border.Left = lsNone
    SpecialFields.Item.Border.Right = lsNone
    SpecialFields.Item.Border.Top = lsNone
    SpecialFields.Item.Border.Bottom = lsNone
    SpecialFields.Item.Border.TightHorizontal = False
    SpecialFields.Item.Border.DropShadow = False
    SpecialFields.Item.Border.ForeColor = clNone
    SpecialFields.Item.Border.BackgroundColor = clNone
    SpecialFields.Item.Format.Alignment = haDefault
    SpecialFields.Item.Format.SuppressIfDuplicated = False
    SpecialFields.Item.Format.CanGrow = False
    SpecialFields.Item.Format.MaxNLines = 0
    SpecialFields.Item.Format.Field.Number.CurrencySymbol = '$'
    SpecialFields.Item.Format.Field.Number.ThousandSymbol = ','
    SpecialFields.Item.Format.Field.Number.DecimalSymbol = '.'
    SpecialFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    SpecialFields.Item.Format.Field.Date.FirstSeparator = '/'
    SpecialFields.Item.Format.Field.Date.SecondSeparator = '/'
    SpecialFields.Item.Format.Field.Time.AMString = 'AM'
    SpecialFields.Item.Format.Field.Time.PMString = 'PM'
    SpecialFields.Item.Format.Field.Time.HourMinSeparator = ':'
    SpecialFields.Item.Format.Field.Time.MinSecSeparator = ':'
    SpecialFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    SpecialFields.Item.Font.Charset = DEFAULT_CHARSET
    SpecialFields.Item.Font.Color = clWindowText
    SpecialFields.Item.Font.Height = -11
    SpecialFields.Item.Font.Name = 'MS Sans Serif'
    SpecialFields.Item.Font.Style = []
    SpecialFields.Item.HiliteConditions.Item.FontColor = clNone
    SpecialFields.Item.HiliteConditions.Item.Background = clNone
    GroupNameFields.Number = -1
    GroupNameFields.Item.Top = -1
    GroupNameFields.Item.Left = -1
    GroupNameFields.Item.Width = -1
    GroupNameFields.Item.Height = -1
    GroupNameFields.Item.Border.Left = lsNone
    GroupNameFields.Item.Border.Right = lsNone
    GroupNameFields.Item.Border.Top = lsNone
    GroupNameFields.Item.Border.Bottom = lsNone
    GroupNameFields.Item.Border.TightHorizontal = False
    GroupNameFields.Item.Border.DropShadow = False
    GroupNameFields.Item.Border.ForeColor = clNone
    GroupNameFields.Item.Border.BackgroundColor = clNone
    GroupNameFields.Item.Format.Alignment = haDefault
    GroupNameFields.Item.Format.SuppressIfDuplicated = False
    GroupNameFields.Item.Format.CanGrow = False
    GroupNameFields.Item.Format.MaxNLines = 0
    GroupNameFields.Item.Format.Field.Number.CurrencySymbol = '$'
    GroupNameFields.Item.Format.Field.Number.ThousandSymbol = ','
    GroupNameFields.Item.Format.Field.Number.DecimalSymbol = '.'
    GroupNameFields.Item.Format.Field.Number.ShowZeroValueAs = '0'
    GroupNameFields.Item.Format.Field.Date.FirstSeparator = '/'
    GroupNameFields.Item.Format.Field.Date.SecondSeparator = '/'
    GroupNameFields.Item.Format.Field.Time.AMString = 'AM'
    GroupNameFields.Item.Format.Field.Time.PMString = 'PM'
    GroupNameFields.Item.Format.Field.Time.HourMinSeparator = ':'
    GroupNameFields.Item.Format.Field.Time.MinSecSeparator = ':'
    GroupNameFields.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    GroupNameFields.Item.Font.Charset = DEFAULT_CHARSET
    GroupNameFields.Item.Font.Color = clWindowText
    GroupNameFields.Item.Font.Height = -11
    GroupNameFields.Item.Font.Name = 'MS Sans Serif'
    GroupNameFields.Item.Font.Style = []
    GroupNameFields.Item.HiliteConditions.Item.FontColor = clNone
    GroupNameFields.Item.HiliteConditions.Item.Background = clNone
    RunningTotals.Number = -1
    RunningTotals.Item.Top = -1
    RunningTotals.Item.Left = -1
    RunningTotals.Item.Width = -1
    RunningTotals.Item.Height = -1
    RunningTotals.Item.Border.Left = lsNone
    RunningTotals.Item.Border.Right = lsNone
    RunningTotals.Item.Border.Top = lsNone
    RunningTotals.Item.Border.Bottom = lsNone
    RunningTotals.Item.Border.TightHorizontal = False
    RunningTotals.Item.Border.DropShadow = False
    RunningTotals.Item.Border.ForeColor = clNone
    RunningTotals.Item.Border.BackgroundColor = clNone
    RunningTotals.Item.Format.Alignment = haDefault
    RunningTotals.Item.Format.SuppressIfDuplicated = False
    RunningTotals.Item.Format.CanGrow = False
    RunningTotals.Item.Format.MaxNLines = 0
    RunningTotals.Item.Format.Field.Number.CurrencySymbol = '$'
    RunningTotals.Item.Format.Field.Number.ThousandSymbol = ','
    RunningTotals.Item.Format.Field.Number.DecimalSymbol = '.'
    RunningTotals.Item.Format.Field.Number.ShowZeroValueAs = '0'
    RunningTotals.Item.Format.Field.Date.FirstSeparator = '/'
    RunningTotals.Item.Format.Field.Date.SecondSeparator = '/'
    RunningTotals.Item.Format.Field.Time.AMString = 'AM'
    RunningTotals.Item.Format.Field.Time.PMString = 'PM'
    RunningTotals.Item.Format.Field.Time.HourMinSeparator = ':'
    RunningTotals.Item.Format.Field.Time.MinSecSeparator = ':'
    RunningTotals.Item.Format.Field.Paragraph.LineSpacing = 1.000000000000000000
    RunningTotals.Item.Font.Charset = DEFAULT_CHARSET
    RunningTotals.Item.Font.Color = clWindowText
    RunningTotals.Item.Font.Height = -11
    RunningTotals.Item.Font.Name = 'MS Sans Serif'
    RunningTotals.Item.Font.Style = []
    RunningTotals.Item.HiliteConditions.Item.FontColor = clNone
    RunningTotals.Item.HiliteConditions.Item.Background = clNone
    WindowZoom.Preview = pwDefault
    WindowZoom.Magnification = -1
    WindowCursor.GroupArea = wcDefault
    WindowCursor.GroupAreaField = wcMagnify
    WindowCursor.DetailArea = wcDefault
    WindowCursor.DetailAreaField = wcDefault
    WindowCursor.Graph = wcMagnify
    WindowCursor.OnDemandSubreport = wcMagnify
    WindowCursor.HyperLink = wcMagnify
    Graphs.Number = -1
    Graphs.Item.Top = -1
    Graphs.Item.Left = -1
    Graphs.Item.Width = -1
    Graphs.Item.Height = -1
    Graphs.Item.Border.Left = lsNone
    Graphs.Item.Border.Right = lsNone
    Graphs.Item.Border.Top = lsNone
    Graphs.Item.Border.Bottom = lsNone
    Graphs.Item.Border.TightHorizontal = False
    Graphs.Item.Border.DropShadow = False
    Graphs.Item.Border.ForeColor = clNone
    Graphs.Item.Border.BackgroundColor = clNone
    Graphs.Item.Style = unknownGraphType
    Graphs.Item.Text.TitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.TitleFont.Color = clWindowText
    Graphs.Item.Text.TitleFont.Height = -11
    Graphs.Item.Text.TitleFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.TitleFont.Style = []
    Graphs.Item.Text.SubTitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.SubTitleFont.Color = clWindowText
    Graphs.Item.Text.SubTitleFont.Height = -11
    Graphs.Item.Text.SubTitleFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.SubTitleFont.Style = []
    Graphs.Item.Text.FootNoteFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.FootNoteFont.Color = clWindowText
    Graphs.Item.Text.FootNoteFont.Height = -11
    Graphs.Item.Text.FootNoteFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.FootNoteFont.Style = []
    Graphs.Item.Text.GroupsTitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.GroupsTitleFont.Color = clWindowText
    Graphs.Item.Text.GroupsTitleFont.Height = -11
    Graphs.Item.Text.GroupsTitleFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.GroupsTitleFont.Style = []
    Graphs.Item.Text.DataTitleFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.DataTitleFont.Color = clWindowText
    Graphs.Item.Text.DataTitleFont.Height = -11
    Graphs.Item.Text.DataTitleFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.DataTitleFont.Style = []
    Graphs.Item.Text.LegendFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.LegendFont.Color = clWindowText
    Graphs.Item.Text.LegendFont.Height = -11
    Graphs.Item.Text.LegendFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.LegendFont.Style = []
    Graphs.Item.Text.GroupLabelsFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.GroupLabelsFont.Color = clWindowText
    Graphs.Item.Text.GroupLabelsFont.Height = -11
    Graphs.Item.Text.GroupLabelsFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.GroupLabelsFont.Style = []
    Graphs.Item.Text.DataLabelsFont.Charset = DEFAULT_CHARSET
    Graphs.Item.Text.DataLabelsFont.Color = clWindowText
    Graphs.Item.Text.DataLabelsFont.Height = -11
    Graphs.Item.Text.DataLabelsFont.Name = 'MS Sans Serif'
    Graphs.Item.Text.DataLabelsFont.Style = []
    Graphs.Item.Options.Max = -1.000000000000000000
    Graphs.Item.Options.Min = -1.000000000000000000
    Graphs.Item.Options.DataValues = False
    Graphs.Item.Options.GridLines = True
    Graphs.Item.Options.Legend = True
    Graphs.Item.Options.BarDirection = bdVertical
    Graphs.Item.Data.RowGroupN = -1
    Graphs.Item.Data.ColGroupN = -1
    Graphs.Item.Data.SummarizedFieldN = -1
    Graphs.Item.Data.Direction = Unknown
    Graphs.Item.Axis.GridLineX = gglNone
    Graphs.Item.Axis.GridLineY = gglMajor
    Graphs.Item.Axis.GridLineY2 = gglNone
    Graphs.Item.Axis.GridLineZ = gglNone
    Graphs.Item.Axis.DataValuesY = gdvAutomatic
    Graphs.Item.Axis.DataValuesY2 = gdvAutomatic
    Graphs.Item.Axis.DataValuesZ = gdvAutomatic
    Graphs.Item.Axis.MinY = -1.000000000000000000
    Graphs.Item.Axis.MaxY = -1.000000000000000000
    Graphs.Item.Axis.MinY2 = -1.000000000000000000
    Graphs.Item.Axis.MaxY2 = -1.000000000000000000
    Graphs.Item.Axis.MinZ = -1.000000000000000000
    Graphs.Item.Axis.MaxZ = -1.000000000000000000
    Graphs.Item.Axis.NumberFormatY = gnfNoDecimal
    Graphs.Item.Axis.NumberFormatY2 = gnfNoDecimal
    Graphs.Item.Axis.NumberFormatZ = gnfNoDecimal
    Graphs.Item.Axis.DivisionTypeY = gdvAutomatic
    Graphs.Item.Axis.DivisionTypeY2 = gdvAutomatic
    Graphs.Item.Axis.DivisionTypeZ = gdvAutomatic
    Graphs.Item.Axis.DivisionsY = -1
    Graphs.Item.Axis.DivisionsY2 = -1
    Graphs.Item.Axis.DivisionsZ = -1
    SummaryInfo.SavePreviewPicture = False
    ReportOptions.SaveDataWithReport = False
    ReportOptions.SaveSummariesWithReport = False
    ReportOptions.AsyncQuery = True
    ReportOptions.PromptMode = pmNone
    ReportOptions.AlwaysSortLocally = False
    Left = 432
    Top = 353
  end
  object ImageList1: TImageList
    Left = 431
    Top = 381
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000008484840000000000008484000084
      8400000000000000000000848400008484000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000008484000084
      8400000000000000000000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000000
      0000008484000084840000000000000000000084840000848400000000000000
      0000000000000000000000000000000000000000000000848400848484000000
      0000008484000084840000000000000000000084840000848400000000000000
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
      0000840000008400000084000000000000000000000084848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000000000000000000084848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF0000008400000000000000848484000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF0000008400000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084000000FF00
      0000FF000000FF000000FF000000FF000000FF00000084000000000000008484
      840000848400008484000000000000000000000000000000000084000000FF00
      0000FF000000FF000000FF000000FF000000FF00000084000000000000008484
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000084000000840000000000
      0000848484000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000084000000840000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FFFF
      FF00FF000000FF000000FF000000FF000000FF00000084000000840000008400
      0000000000000000000000848400008484000000000000000000FF000000FFFF
      FF00FF000000FF000000FF000000FF000000FF00000084000000840000008400
      0000000000000000000000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084000000FFFF
      FF00FF000000FF000000FF000000FF00000084000000FF000000840000008400
      000084000000000000000000000000000000000000000000000084000000FFFF
      FF00FF000000FF000000FF000000FF00000084000000FF000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FFFFFF00FFFFFF00FF000000FF000000FF00000084000000FF0000008400
      000084000000840000000000000084848400000000000000000000000000FF00
      0000FFFFFF00FFFFFF00FF000000FF000000FF00000084000000FF0000008400
      0000840000008400000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000FF00000084000000FF000000FF000000FF00000084000000FF00
      0000840000008400000000000000000000000000000000000000000000000000
      000084000000FF00000084000000FF000000FF000000FF00000084000000FF00
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000840000008400000084000000FF000000FF0000008400
      0000FF0000008400000000000000000000000000000000000000000000000000
      00000000000000000000840000008400000084000000FF000000FF0000008400
      0000FF0000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000840000008400000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000FF00FF0000000099FF99FF00000000
      803F803F00000000C47FC47F00000000C00FC00F00000000E01FE01F00000000
      C003C00300000000C007C00700000000C000C00000000000C001C00100000000
      E000E00000000000F001F00100000000FC03FC0300000000FC03FC0300000000
      FC07FC0700000000FF87FF870000000000000000000000000000000000000000
      000000000000}
  end
  object q_GrOtp: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  KLS_PREDPR.ID,'
      '  KLS_PREDPR.short_name'
      '  FROM KLS_PREDPR, KLS_TEX_PD'
      'WHERE KLS_TEX_PD.GROTP_ID=KLS_PREDPR.ID  '
      '  ORDER BY 2')
    Session = ora_Session
    Left = 715
    Top = 361
    object IntegerField2: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object ds_GrOtp: TDataSource
    DataSet = q_GrOtp
    Left = 715
    Top = 389
  end
  object q_Sobstv: TOracleDataSet
    SQL.Strings = (
      
        'SELECT A.ID,A.SHORT_NAME,B.FOX_KOD FROM KLS_PREDPR A,PREDPR_ROLE' +
        ' B'
      'WHERE A.ID=B.PREDPR_ID'
      'AND B.KLS_ROLE_ID=1'
      'ORDER BY A.ID'
      '')
    Session = ora_Session
    Left = 763
    Top = 361
    object IntegerField3: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField5: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object ds_Sobstv: TDataSource
    DataSet = q_Sobstv
    Left = 763
    Top = 389
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 704
    Top = 312
  end
  object TBPopupMenu1: TTBPopupMenu
    Images = f_main.img_Common
    Left = 552
    Top = 264
    object TBItem11: TTBItem
      Action = acOperReeFilter
    end
    object TBItem12: TTBItem
      Action = acOperReeNoFilter
    end
    object TBItem15: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem1: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem1AcceptText
    end
    object TBItem17: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem17Click
    end
    object TBItem18: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem18Click
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem21: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem21Click
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBSubmenuItem2: TTBSubmenuItem
      Caption = #1057#1074#1103#1079#1080
      object TBItem19: TTBItem
        Action = acOperReeLinkMon
      end
      object TBItem20: TTBItem
        Action = acOperReeLinkSF
      end
      object TBSeparatorItem6: TTBSeparatorItem
      end
      object TBItem13: TTBItem
        Action = acOperReeStream
      end
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = acOperReePrintTable
    end
    object TBItem10: TTBItem
      Action = acOperReePrintSved
    end
    object TBItem16: TTBItem
      Action = acOperReePrintPasp
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItem14: TTBItem
      Action = acOperReeToXLS
    end
  end
  object t_ProdTree: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM ('
      'SELECT'
      ' -1 AS prev,0 as kod,'#39#1042#1089#1077' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1099#39' as Name from dual'
      'UNION ALL'
      'SELECT DISTINCT'
      
        ' 0 AS prev,TO_NUMBER(kls_prod.id_npr)*10000,'#39#39' || kls_prod.NAME_' +
        'NPR|| '#39' '#39' || kls_prod.gost_npr  from kls_prod where'
      '   kls_prod.ID_GROUP_NPR='#39'00000'#39
      'UNION ALL'
      'SELECT DISTINCT'
      
        '  to_number(kls_prod.ID_GROUP_NPR)*10000,kls_prod_plan.ID*100,'#39#39 +
        ' || kls_prod_plan.NAME_NPR'
      '  from kls_prod,kls_prod_plan'
      '  where kls_prod.PROD_PLAN_ID=kls_prod_plan.ID'
      'UNION ALL'
      'SELECT'
      
        '  kls_prod.PROD_PLAN_ID*100,to_number(kls_prod.id_npr),'#39#39' || kls' +
        '_prod.NAME_NPR|| '#39' '#39' || kls_prod.gost_npr'
      '    from kls_prod,kls_prod_plan'
      '    where kls_prod.PROD_PLAN_ID=kls_prod_plan.ID'
      ') ORDER BY prev,kod,name')
    Session = ora_Session
    Left = 579
    Top = 449
    object t_ProdTreePREV: TFloatField
      FieldName = 'PREV'
    end
    object t_ProdTreeKOD: TFloatField
      FieldName = 'KOD'
    end
    object t_ProdTreeNAME: TStringField
      FieldName = 'NAME'
      Size = 40
    end
  end
  object ds_ProdTree: TDataSource
    DataSet = mteProd
    Left = 643
    Top = 453
  end
  object q_PlanStru: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name'
      'FROM v_plan_stru'
      'WHERE IS_SNP=1'
      '  AND BEGIN_DATE<=TO_DATE('#39'30.09.2004'#39','#39'dd.mm.yyyy'#39')'
      '  AND END_DATE>=TO_DATE('#39'01.09.2004'#39','#39'dd.mm.yyyy'#39')'
      'ORDER BY kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp,kod_pgr')
    Session = ora_Session
    BeforeOpen = q_PlanStruBeforeOpen
    Left = 339
    Top = 353
    object q_PlanStruNAME: TStringField
      FieldName = 'NAME'
      Size = 156
    end
    object q_PlanStruID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object dsPlanStru: TDataSource
    DataSet = q_PlanStru
    Left = 339
    Top = 381
  end
  object mteProd: TMemTableEh
    FieldDefs = <>
    FetchAllOnOpen = True
    IndexDefs = <
      item
        Name = 'mteProdIndex1'
        Fields = 'kod'
      end>
    Params = <>
    DataDriver = dsdProd
    StoreDefs = True
    TreeList.Active = True
    TreeList.KeyFieldName = 'Kod'
    TreeList.RefParentFieldName = 'Prev'
    Left = 714
    Top = 450
    object mteProdPREV: TFloatField
      FieldName = 'PREV'
    end
    object mteProdKOD: TFloatField
      FieldName = 'KOD'
    end
    object mteProdNAME: TStringField
      DisplayLabel = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1099
      FieldName = 'NAME'
      Size = 40
    end
  end
  object dsdProd: TDataSetDriverEh
    KeyFields = 'kod'
    ProviderDataSet = t_ProdTree
    Left = 786
    Top = 450
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'ehProd.<P>.Width'
      'Panel3.grRee.<P>.Columns.ColumnsIndex'
      'Panel3.grRee.<P>.Columns.<ForAllItems>.Width')
    Left = 312
    Top = 280
  end
end