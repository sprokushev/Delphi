object f_Rep: Tf_Rep
  Left = 514
  Top = 232
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1077#1090#1099' '#1076#1083#1103' '#1051#1059#1050#1054#1049#1051'-'#1057#1053#1055
  ClientHeight = 466
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 353
    Top = 0
    Width = 397
    Height = 466
    Align = alClient
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
    TabOrder = 0
    object gb_TipRep: TGroupBox
      Left = 2
      Top = 15
      Width = 393
      Height = 39
      Align = alTop
      Caption = #1043#1088#1091#1087#1087#1072' '#1086#1090#1095#1077#1090#1086#1074
      TabOrder = 1
      object lc_ReportGroups: TDBLookupComboboxEh
        Left = 8
        Top = 14
        Width = 337
        Height = 21
        Alignment = taLeftJustify
        EditButtons = <>
        KeyField = 'REPORT_GROUP'
        ListField = 'REPORT_GROUP_NAME'
        ListSource = ds_rep_grp
        TabOrder = 0
        Visible = True
        OnChange = lc_ReportGroupsChange
      end
    end
    object ParamPages: TPageControl
      Left = 2
      Top = 118
      Width = 393
      Height = 316
      ActivePage = tabKons
      Align = alClient
      TabOrder = 3
      object tabEMPTY: TTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        ImageIndex = 2
      end
      object tabDIAGRAM: TTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        ImageIndex = 5
        object gridDiagramKind: TDBGridEh
          Left = 0
          Top = 0
          Width = 385
          Height = 288
          Align = alClient
          DataSource = ds_DiagramKind
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ICON_NUM'
              Footers = <>
              KeyList.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16'
                '17'
                '18'
                '19'
                '20'
                '21'
                '22'
                '23'
                '24'
                '25'
                '26'
                '27'
                '28'
                '29'
                '30'
                '31'
                '32'
                '33'
                '34'
                '35'
                '36')
              NotInKeyListIndex = 1
              Title.Caption = ' '
              Width = 21
            end
            item
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Title.Caption = #1042#1080#1076' '#1076#1080#1072#1075#1088#1072#1084#1084#1099
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
            end>
        end
      end
      object tabMAIN: TTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        ImageIndex = 5
        object rg_Prod: TRadioGroup
          Left = 0
          Top = 0
          Width = 385
          Height = 84
          Align = alTop
          Caption = ' '#1055#1088#1086#1076#1091#1082#1090' '
          ItemIndex = 0
          Items.Strings = (
            #1042#1089#1077' '#1087#1088#1086#1076#1091#1082#1090#1099
            #1043#1088#1091#1087#1087#1072
            #1055#1088#1086#1076#1091#1082#1090)
          TabOrder = 0
          OnClick = rg_ProdClick
        end
        object gb_Other: TGroupBox
          Left = 0
          Top = 84
          Width = 385
          Height = 185
          Align = alTop
          Caption = ' '#1055#1088#1086#1095#1077#1077' '
          TabOrder = 3
          object Label1: TLabel
            Left = 6
            Top = 38
            Width = 64
            Height = 13
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
            FocusControl = lc_plat
          end
          object Label2: TLabel
            Left = 6
            Top = 62
            Width = 59
            Height = 13
            Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
            FocusControl = lc_Poluch
          end
          object Label7: TLabel
            Left = 8
            Top = 87
            Width = 42
            Height = 13
            Caption = #1057#1090#1072#1085#1094#1080#1103
            FocusControl = lc_Stan
          end
          object Label8: TLabel
            Left = 10
            Top = 113
            Width = 67
            Height = 13
            Caption = #1042#1080#1076' '#1086#1090#1075#1088#1091#1079#1082#1080
            FocusControl = lc_Load_type
          end
          object Label10: TLabel
            Left = 3
            Top = 137
            Width = 74
            Height = 13
            Caption = #1053#1072#1079#1085'.'#1086#1090#1075#1088#1091#1079#1082#1080
            FocusControl = lc_Nazn_Otg
          end
          object Label6: TLabel
            Left = 6
            Top = 16
            Width = 66
            Height = 13
            Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
            FocusControl = lc_Otpr
          end
          object Label11: TLabel
            Left = 219
            Top = 14
            Width = 41
            Height = 13
            Caption = #1058#1045#1061' '#1055#1044
            FocusControl = lc_Tex_pd
          end
          object Label22: TLabel
            Left = 11
            Top = 161
            Width = 66
            Height = 13
            Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
            FocusControl = lc_Sobstv
          end
          object lc_plat: TRxDBLookupCombo
            Left = 82
            Top = 35
            Width = 287
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1080'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'SHORT_NAME'
            LookupSource = ds_Plat
            TabOrder = 2
          end
          object lc_Poluch: TRxDBLookupCombo
            Left = 82
            Top = 59
            Width = 287
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1080'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'SHORT_NAME'
            LookupSource = ds_poluch
            TabOrder = 3
          end
          object lc_Stan: TRxDBLookupCombo
            Left = 82
            Top = 84
            Width = 287
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1089#1090#1072#1085#1094#1080#1080'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'STAN_NAME'
            LookupSource = ds_stan
            TabOrder = 4
          end
          object lc_Load_type: TRxDBLookupCombo
            Left = 82
            Top = 110
            Width = 287
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1074#1080#1076#1099' '#1086#1090#1075#1088#1091#1079#1086#1082'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'TYPE_OTGR_NAME'
            LookupSource = ds_Load_Type
            TabOrder = 5
          end
          object lc_Nazn_Otg: TRxDBLookupCombo
            Left = 82
            Top = 134
            Width = 287
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103' '#1086#1090#1075#1088#1091#1079#1086#1082'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'NAZN_OTG_NAME'
            LookupSource = ds_Nazn_Otg
            TabOrder = 6
          end
          object lc_Otpr: TRxDBLookupCombo
            Left = 82
            Top = 11
            Width = 135
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1080'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'SHORT_NAME'
            LookupSource = ds_otpr
            TabOrder = 0
          end
          object lc_Tex_pd: TRxDBLookupCombo
            Left = 264
            Top = 11
            Width = 104
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1058#1045#1061' '#1055#1044'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'ID'
            LookupSource = ds_tex_pd
            TabOrder = 1
          end
          object lc_Sobstv: TRxDBLookupCombo
            Left = 82
            Top = 158
            Width = 287
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1080'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'SHORT_NAME'
            LookupSource = ds_Sobstv
            TabOrder = 7
          end
        end
        object rg_FromWho: TRadioGroup
          Left = 0
          Top = 269
          Width = 385
          Height = 31
          Align = alTop
          Caption = ' '#1054#1090#1075#1088#1091#1079#1082#1072' '
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            #1051#1059#1050#1054#1049#1051
            #1057#1077#1074#1077#1088#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090)
          TabOrder = 4
        end
        object lc_Prod: TRxDBLookupCombo
          Left = 80
          Top = 58
          Width = 232
          Height = 21
          DropDownCount = 8
          EmptyValue = '*'
          Enabled = False
          LookupField = 'ID_NPR'
          LookupDisplay = 'NAME_NPR'
          LookupSource = ds_Prod
          TabOrder = 2
        end
        object lc_ProdGr: TRxDBLookupCombo
          Left = 80
          Top = 34
          Width = 232
          Height = 21
          DropDownCount = 8
          EmptyValue = '*'
          Enabled = False
          LookupField = 'ID_NPR'
          LookupDisplay = 'NAME_NPR'
          LookupSource = ds_ProdGr
          TabOrder = 1
        end
      end
      object tabADD: TTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        ImageIndex = 2
        object Label18: TLabel
          Left = 6
          Top = 82
          Width = 39
          Height = 13
          Caption = #1056#1077#1075#1080#1086#1085':'
        end
        object Label25: TLabel
          Left = 6
          Top = 106
          Width = 73
          Height = 13
          Caption = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072':'
          FocusControl = Date_ree
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 385
          Height = 265
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label5: TLabel
            Left = 5
            Top = 10
            Width = 131
            Height = 13
            Hint = 
              #1055#1077#1088#1074#1099#1077' '#1094#1080#1092#1088#1099' '#1079#1072#1103#1074#1082#1080'.'#13#10#1044#1083#1103' '#1086#1090#1076#1077#1083#1077#1085#1080#1103' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1084#1077#1089#1103#1094#1072#13#10#1084#1086#1078#1085#1086' ' +
              #1085#1072#1073#1088#1072#1090#1100' '#1087#1077#1088#1074#1099#1077' '#1044#1042#1045' '#1094#1080#1092#1088#1099' '#1079#1072#1103#1074#1082#1080','#13#10#1085#1072#1087#1088#1080#1084#1077#1088', 08 - '#1072#1074#1075#1091#1089#1090', 09 - '#1089#1077 +
              #1085#1090#1103#1073#1088#1100' '#1080' '#1090'.'#1076'.'
            Caption = #1047#1072#1103#1074#1082#1080', '#1085#1072#1095#1080#1085#1072#1102#1097#1080#1077#1089#1103' '#1089':'
            FocusControl = ed_Nom_zd
            ParentShowHint = False
            ShowHint = True
          end
          object Label14: TLabel
            Left = 89
            Top = 35
            Width = 47
            Height = 13
            Caption = #1044#1086#1075#1086#1074#1086#1088':'
            FocusControl = ed_Dog
          end
          object Label20: TLabel
            Left = 87
            Top = 58
            Width = 50
            Height = 13
            Caption = #1050#1072#1090'.'#1094#1077#1085#1099':'
            FocusControl = ed_CatCen
          end
          object Label12: TLabel
            Left = 6
            Top = 82
            Width = 39
            Height = 13
            Caption = #1056#1077#1075#1080#1086#1085':'
            FocusControl = lc_Region
          end
          object Label19: TLabel
            Left = 6
            Top = 154
            Width = 98
            Height = 13
            Caption = #1043#1088#1072#1092#1080#1082' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1089':'
            FocusControl = GRAFIK_FROM
          end
          object Label23: TLabel
            Left = 6
            Top = 130
            Width = 62
            Height = 13
            Caption = #1044#1072#1090#1072' '#1087#1083#1072#1085#1072':'
            FocusControl = Date_plan
          end
          object Label26: TLabel
            Left = 198
            Top = 154
            Width = 12
            Height = 13
            Caption = #1087#1086
            FocusControl = GRAFIK_TO
          end
          object Label27: TLabel
            Left = 6
            Top = 106
            Width = 73
            Height = 13
            Caption = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072':'
            FocusControl = Date_ree
          end
          object Label28: TLabel
            Left = 6
            Top = 178
            Width = 63
            Height = 13
            Caption = #1069#1082#1089#1087#1077#1076#1080#1090#1086#1088':'
            FocusControl = lc_Exped
          end
          object Label29: TLabel
            Left = 5
            Top = 202
            Width = 96
            Height = 13
            Caption = #1042#1083#1072#1076#1077#1083#1077#1094' '#1074#1072#1075#1086#1085#1086#1074':'
            FocusControl = lc_vagowner
          end
          object ed_Nom_zd: TEdit
            Left = 140
            Top = 7
            Width = 121
            Height = 21
            Hint = 
              #1055#1077#1088#1074#1099#1077' '#1094#1080#1092#1088#1099' '#1079#1072#1103#1074#1082#1080'.'#13#10#1044#1083#1103' '#1086#1090#1076#1077#1083#1077#1085#1080#1103' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1084#1077#1089#1103#1094#1072#13#10#1084#1086#1078#1085#1086' ' +
              #1085#1072#1073#1088#1072#1090#1100' '#1087#1077#1088#1074#1099#1077' '#1044#1042#1045' '#1094#1080#1092#1088#1099' '#1079#1072#1103#1074#1082#1080','#13#10#1085#1072#1087#1088#1080#1084#1077#1088', 08 - '#1072#1074#1075#1091#1089#1090', 09 - '#1089#1077 +
              #1085#1090#1103#1073#1088#1100' '#1080' '#1090'.'#1076'.'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object ed_Dog: TEdit
            Left = 140
            Top = 31
            Width = 121
            Height = 21
            Hint = 
              #1055#1077#1088#1074#1099#1077' '#1094#1080#1092#1088#1099' '#1079#1072#1103#1074#1082#1080'.'#13#10#1044#1083#1103' '#1086#1090#1076#1077#1083#1077#1085#1080#1103' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1084#1077#1089#1103#1094#1072#13#10#1084#1086#1078#1085#1086' ' +
              #1085#1072#1073#1088#1072#1090#1100' '#1087#1077#1088#1074#1099#1077' '#1044#1042#1045' '#1094#1080#1092#1088#1099' '#1079#1072#1103#1074#1082#1080','#13#10#1085#1072#1087#1088#1080#1084#1077#1088', 08 - '#1072#1074#1075#1091#1089#1090', 09 - '#1089#1077 +
              #1085#1090#1103#1073#1088#1100' '#1080' '#1090'.'#1076'.'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object ed_CatCen: TEdit
            Left = 140
            Top = 55
            Width = 121
            Height = 21
            Hint = 
              #1055#1077#1088#1074#1099#1077' '#1094#1080#1092#1088#1099' '#1079#1072#1103#1074#1082#1080'.'#13#10#1044#1083#1103' '#1086#1090#1076#1077#1083#1077#1085#1080#1103' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1084#1077#1089#1103#1094#1072#13#10#1084#1086#1078#1085#1086' ' +
              #1085#1072#1073#1088#1072#1090#1100' '#1087#1077#1088#1074#1099#1077' '#1044#1042#1045' '#1094#1080#1092#1088#1099' '#1079#1072#1103#1074#1082#1080','#13#10#1085#1072#1087#1088#1080#1084#1077#1088', 08 - '#1072#1074#1075#1091#1089#1090', 09 - '#1089#1077 +
              #1085#1090#1103#1073#1088#1100' '#1080' '#1090'.'#1076'.'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object lc_Region: TRxDBLookupCombo
            Left = 56
            Top = 79
            Width = 305
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1088#1077#1075#1080#1086#1085#1099'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'REGION_NAME'
            LookupSource = ds_Region
            TabOrder = 3
          end
          object Date_ree: TDateTimePicker
            Left = 81
            Top = 103
            Width = 82
            Height = 21
            Date = 37088.641009456000000000
            Time = 37088.641009456000000000
            TabOrder = 4
          end
          object Date_plan: TDateTimePicker
            Left = 81
            Top = 127
            Width = 82
            Height = 21
            Date = 37088.641009456000000000
            Time = 37088.641009456000000000
            TabOrder = 5
          end
          object GRAFIK_FROM: TDateTimePicker
            Left = 113
            Top = 151
            Width = 82
            Height = 21
            Date = 37088.641009456000000000
            Time = 37088.641009456000000000
            TabOrder = 6
          end
          object GRAFIK_TO: TDateTimePicker
            Left = 217
            Top = 151
            Width = 82
            Height = 21
            Date = 37088.641009456000000000
            Time = 37088.641009456000000000
            TabOrder = 7
          end
          object lc_Exped: TRxDBLookupCombo
            Left = 74
            Top = 175
            Width = 287
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1101#1082#1089#1087#1077#1076#1080#1090#1086#1088#1099'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'SHORT_NAME'
            LookupSource = ds_Exped
            TabOrder = 8
          end
          object lc_vagowner: TRxDBLookupCombo
            Left = 106
            Top = 199
            Width = 255
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1074#1083#1072#1076#1077#1083#1100#1094#1099'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'VAGOWNER_NAME'
            LookupSource = ds_vagOwner
            TabOrder = 9
          end
          object is_crt: TCheckBox
            Left = 8
            Top = 224
            Width = 361
            Height = 17
            Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1093' '#1086#1090#1095#1077#1090#1086#1074
            TabOrder = 10
          end
        end
      end
      object tabFIN_SNP: TTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        object rg_Source: TRadioGroup
          Left = 0
          Top = 0
          Width = 385
          Height = 57
          Align = alTop
          Caption = ' '#1048#1089#1090#1086#1095#1085#1080#1082' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '
          ItemIndex = 0
          Items.Strings = (
            #1050#1086#1084#1087#1083#1077#1082#1089' "'#1060#1048#1053#1040#1053#1057#1067'"'
            '"'#1055#1040#1056#1059#1057'"')
          TabOrder = 0
        end
        object rg_ProdUsl: TRadioGroup
          Left = 0
          Top = 57
          Width = 385
          Height = 57
          Align = alTop
          ItemIndex = 0
          Items.Strings = (
            #1055#1088#1086#1076#1091#1082#1090' '#1080' '#1091#1089#1083#1091#1075#1080' '#1074#1084#1077#1089#1090#1077
            #1055#1088#1086#1076#1091#1082#1090' '#1080' '#1091#1089#1083#1091#1075#1080' '#1088#1072#1079#1076#1077#1083#1100#1085#1086)
          TabOrder = 1
        end
        object rg_Days: TRadioGroup
          Left = 0
          Top = 114
          Width = 385
          Height = 57
          Align = alTop
          ItemIndex = 0
          Items.Strings = (
            #1053#1072#1088#1072#1089#1090#1072#1102#1097#1080#1084' '#1080#1090#1086#1075#1086#1084
            #1055#1086' '#1076#1072#1090#1072#1084)
          TabOrder = 2
        end
      end
      object tabTRAFFIC: TTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        ImageIndex = 6
        object Label21: TLabel
          Left = 4
          Top = 10
          Width = 103
          Height = 13
          Hint = 
            #1055#1077#1088#1074#1099#1077' '#1094#1080#1092#1088#1099' '#1079#1072#1103#1074#1082#1080'.'#13#10#1044#1083#1103' '#1086#1090#1076#1077#1083#1077#1085#1080#1103' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1084#1077#1089#1103#1094#1072#13#10#1084#1086#1078#1085#1086' ' +
            #1085#1072#1073#1088#1072#1090#1100' '#1087#1077#1088#1074#1099#1077' '#1044#1042#1045' '#1094#1080#1092#1088#1099' '#1079#1072#1103#1074#1082#1080','#13#10#1085#1072#1087#1088#1080#1084#1077#1088', 08 - '#1072#1074#1075#1091#1089#1090', 09 - '#1089#1077 +
            #1085#1090#1103#1073#1088#1100' '#1080' '#1090'.'#1076'.'
          Caption = #1058#1077#1083#1077#1092#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088':'
          FocusControl = lc_Tel
          ParentShowHint = False
          ShowHint = True
        end
        object lc_Tel: TRxDBLookupCombo
          Left = 111
          Top = 6
          Width = 265
          Height = 21
          DropDownCount = 8
          DisplayEmpty = #1042#1089#1077' '#1085#1086#1084#1077#1088#1072
          LookupField = 'INSIDE_NUMBER'
          LookupDisplay = 'FIO'
          LookupSource = ds_Tel
          TabOrder = 0
        end
      end
      object tabKons: TTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        ImageIndex = 6
        object rg_prodKons: TRadioGroup
          Left = 0
          Top = 0
          Width = 385
          Height = 84
          Align = alTop
          Caption = ' '#1055#1088#1086#1076#1091#1082#1090' '
          ItemIndex = 0
          Items.Strings = (
            #1042#1089#1077' '#1087#1088#1086#1076#1091#1082#1090#1099
            #1043#1088#1091#1087#1087#1072
            #1055#1088#1086#1076#1091#1082#1090)
          TabOrder = 0
          OnClick = rg_prodKonsClick
        end
        object lc_ProdGrKons: TRxDBLookupCombo
          Left = 88
          Top = 34
          Width = 281
          Height = 21
          DropDownCount = 8
          EmptyValue = '*'
          Enabled = False
          LookupField = 'ID_GR'
          LookupDisplay = 'NAME'
          LookupSource = ds_ProdGrKons
          TabOrder = 1
        end
        object lc_ProdKons: TRxDBLookupCombo
          Left = 88
          Top = 58
          Width = 281
          Height = 21
          DropDownCount = 8
          EmptyValue = '*'
          Enabled = False
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = ds_ProdKons
          TabOrder = 2
        end
        object gb_OtherKons: TGroupBox
          Left = 0
          Top = 84
          Width = 385
          Height = 109
          Align = alTop
          Caption = ' '#1055#1088#1086#1095#1077#1077' '
          TabOrder = 3
          object Label13: TLabel
            Left = 52
            Top = 16
            Width = 41
            Height = 13
            Caption = #1060#1080#1083#1080#1072#1083
            FocusControl = lc_Orgstru_fil
          end
          object Label15: TLabel
            Left = 12
            Top = 64
            Width = 80
            Height = 13
            Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
            FocusControl = LC_ORGSTRU_AZC
          end
          object Label16: TLabel
            Left = 22
            Top = 86
            Width = 70
            Height = 13
            Caption = #1058#1080#1087' '#1086#1087#1077#1088#1072#1094#1080#1081
            FocusControl = lc_tip_op_kons
          end
          object Label17: TLabel
            Left = 28
            Top = 40
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
            FocusControl = lc_Org_kind_grp
          end
          object lc_Orgstru_fil: TRxDBLookupCombo
            Left = 96
            Top = 11
            Width = 273
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1092#1080#1083#1080#1072#1083#1099'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'NAME'
            LookupSource = ds_Orgstru_fil
            TabOrder = 0
            OnChange = lc_Orgstru_filChange
          end
          object LC_ORGSTRU_AZC: TRxDBLookupCombo
            Left = 96
            Top = 59
            Width = 273
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'NAME'
            LookupSource = ds_Orgstru_azc
            TabOrder = 2
          end
          object lc_tip_op_kons: TRxDBLookupCombo
            Left = 96
            Top = 83
            Width = 273
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'NAME'
            LookupSource = ds_tip_op_kons
            TabOrder = 3
          end
          object lc_Org_kind_grp: TRxDBLookupCombo
            Left = 96
            Top = 35
            Width = 273
            Height = 21
            DropDownCount = 8
            DisplayEmpty = '<'#1042#1089#1077' '#1086#1073#1098#1077#1082#1090#1099'>'
            EmptyValue = '*'
            LookupField = 'ID'
            LookupDisplay = 'NAME'
            LookupSource = ds_org_kind_grp
            TabOrder = 1
            OnChange = lc_Org_kind_grpChange
          end
        end
      end
      object TabParus: TTabSheet
        Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1099' '
        ImageIndex = 7
        object Label24: TLabel
          Left = 12
          Top = 8
          Width = 41
          Height = 13
          Caption = #1060#1080#1083#1080#1072#1083
          FocusControl = lc_filial_parus
        end
        object lc_filial_parus: TRxDBLookupCombo
          Left = 64
          Top = 3
          Width = 273
          Height = 21
          DropDownCount = 8
          DisplayEmpty = '<'#1042#1089#1077' '#1092#1080#1083#1080#1072#1083#1099'>'
          EmptyValue = '*'
          LookupField = 'SDEP_READY'
          LookupDisplay = 'SDEP_READY'
          LookupSource = ds_filial_parus
          TabOrder = 0
        end
      end
    end
    object gb_TipDate: TGroupBox
      Left = 2
      Top = 54
      Width = 393
      Height = 64
      Align = alTop
      Caption = ' '#1044#1072#1090#1072'/'#1074#1088#1077#1084#1103
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 41
        Width = 6
        Height = 13
        Caption = #1089
      end
      object Label4: TLabel
        Left = 176
        Top = 41
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Label9: TLabel
        Left = 24
        Top = 15
        Width = 50
        Height = 13
        Caption = #1058#1080#1087' '#1076#1072#1090#1099':'
      end
      object Time_Beg: TDateTimePicker
        Left = 18
        Top = 37
        Width = 70
        Height = 21
        Date = 37088.641009456000000000
        Time = 37088.641009456000000000
        Kind = dtkTime
        TabOrder = 0
      end
      object Time_End: TDateTimePicker
        Left = 194
        Top = 37
        Width = 70
        Height = 21
        Date = 37088.641009456000000000
        Time = 37088.641009456000000000
        Kind = dtkTime
        TabOrder = 1
      end
      object cb_tipdate: TComboBox
        Left = 88
        Top = 12
        Width = 257
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        OnChange = cb_tipdateChange
      end
      object Date_Beg: TDateTimePicker
        Left = 90
        Top = 38
        Width = 79
        Height = 21
        Date = 37896.756732175930000000
        Time = 37896.756732175930000000
        TabOrder = 3
        OnChange = Date_BegChange
      end
      object Date_End: TDateTimePicker
        Left = 266
        Top = 36
        Width = 79
        Height = 21
        Date = 37896.756732175930000000
        Time = 37896.756732175930000000
        TabOrder = 4
        OnChange = Date_EndChange
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 434
      Width = 393
      Height = 30
      Align = alBottom
      Caption = 'Panel1'
      TabOrder = 0
      DesignSize = (
        393
        30)
      object btRep: TBitBtn
        Left = 4
        Top = 3
        Width = 386
        Height = 25
        Hint = #1053#1072#1095#1072#1090#1100' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1090#1095#1077#1090#1072
        Anchors = [akLeft, akRight]
        Caption = '&'#1054#1090#1095#1077#1090
        ModalResult = 8
        TabOrder = 0
        OnClick = btRepClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333377F3333333333000033334224333333333333
          337337F3333333330000333422224333333333333733337F3333333300003342
          222224333333333373333337F3333333000034222A22224333333337F337F333
          7F33333300003222A3A2224333333337F3737F337F33333300003A2A333A2224
          33333337F73337F337F33333000033A33333A222433333337333337F337F3333
          0000333333333A222433333333333337F337F33300003333333333A222433333
          333333337F337F33000033333333333A222433333333333337F337F300003333
          33333333A222433333333333337F337F00003333333333333A22433333333333
          3337F37F000033333333333333A223333333333333337F730000333333333333
          333A333333333333333337330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 353
    Height = 466
    Align = alLeft
    Caption = #1054#1090#1095#1077#1090#1099
    TabOrder = 1
    object ll_reports: TDBLookupListBox
      Left = 2
      Top = 15
      Width = 349
      Height = 446
      Align = alClient
      KeyField = 'REPORT_FILE'
      ListField = 'REPORT_NAME'
      ListSource = ds_rep
      TabOrder = 0
      OnDblClick = btRepClick
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Preferences.UseOCI7 = True
    Left = 32
    Top = 40
  end
  object ds_rep: TDataSource
    DataSet = q_reports
    Left = 144
    Top = 40
  end
  object ado_conn: TADOConnection
    ConnectionString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=PF'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 32
    Top = 144
  end
  object q_cmn: TADOQuery
    Connection = ado_conn
    Parameters = <>
    Left = 72
    Top = 144
  end
  object ds_rep_grp: TDataSource
    DataSet = q_report_groups
    Left = 256
    Top = 120
  end
  object q_reports: TOracleDataSet
    SQL.Strings = (
      'select'
      
        '  SUBSTR('#39'                                                    '#39',' +
        '1,SORTBY) || REPORT_FILE AS REPORT_FILE,'
      
        '  ID, REPORT_NAME, REPORT_GROUP, SORTBY, PARAM1, IS_MSSQL, COPY_' +
        'FILE, REPORT_TYPE, DIAGRAM_TYPE,'
      
        '  DIAGRAM_KIND, AXES_X_NAME, COUNT_COLS_X, AXES_Y_NAME, COUNT_CO' +
        'LS_Y,'
      '  PROC_PACKET,PROC_NAME,DEF_BEG_VAL,DEF_END_VAL,DEF_BEG_TIME,'
      '  DEF_END_TIME,VIEW_TIME,TIP_DATE,'
      '  PARUS_PROC, REP_FORM,ASK_RUN_PROC,ASK_RUN_TEXT'
      'from reports where'
      'report_group='#39'FIN_SNP'#39
      'AND 1=1'
      'order by sortby')
    QBEDefinition.QBEFieldDefs = {
      040000001B0000000200000049440100000000000B0000005245504F52545F4E
      414D450100000000000B0000005245504F52545F46494C450100000000000C00
      00005245504F52545F47524F555001000000000006000000534F525442590100
      0000000006000000504152414D310100000000000800000049535F4D5353514C
      01000000000009000000434F50595F46494C450100000000000B000000524550
      4F52545F545950450100000000000C0000004449414752414D5F545950450100
      000000000C0000004449414752414D5F4B494E440100000000000B0000004158
      45535F585F4E414D450100000000000C000000434F554E545F434F4C535F5801
      00000000000B000000415845535F595F4E414D450100000000000C000000434F
      554E545F434F4C535F590100000000000B00000050524F435F5041434B455401
      00000000000900000050524F435F4E414D450100000000000B0000004445465F
      4245475F56414C0100000000000B0000004445465F454E445F56414C01000000
      00000C0000004445465F4245475F54494D450100000000000C0000004445465F
      454E445F54494D4501000000000009000000564945575F54494D450100000000
      00080000005449505F444154450100000000000A00000050415255535F50524F
      43010000000000080000005245505F464F524D0100000000000C00000041534B
      5F52554E5F50524F430100000000000C00000041534B5F52554E5F5445585401
      0000000000}
    Session = ora_Session
    AfterScroll = q_reportsAfterScroll
    Left = 88
    Top = 40
    object q_reportsREPORT_FILE: TStringField
      FieldName = 'REPORT_FILE'
      Size = 82
    end
    object q_reportsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_reportsREPORT_NAME: TStringField
      FieldName = 'REPORT_NAME'
      Required = True
      Size = 80
    end
    object q_reportsREPORT_GROUP: TStringField
      FieldName = 'REPORT_GROUP'
      Size = 15
    end
    object q_reportsSORTBY: TIntegerField
      FieldName = 'SORTBY'
    end
    object q_reportsPARAM1: TStringField
      FieldName = 'PARAM1'
      Size = 15
    end
    object q_reportsIS_MSSQL: TIntegerField
      FieldName = 'IS_MSSQL'
      Required = True
    end
    object q_reportsCOPY_FILE: TStringField
      FieldName = 'COPY_FILE'
      Size = 100
    end
    object q_reportsREPORT_TYPE: TStringField
      FieldName = 'REPORT_TYPE'
      Size = 7
    end
    object q_reportsDIAGRAM_TYPE: TStringField
      FieldName = 'DIAGRAM_TYPE'
      Size = 10
    end
    object q_reportsDIAGRAM_KIND: TStringField
      FieldName = 'DIAGRAM_KIND'
      Size = 30
    end
    object q_reportsAXES_X_NAME: TStringField
      FieldName = 'AXES_X_NAME'
      Size = 30
    end
    object q_reportsCOUNT_COLS_X: TIntegerField
      FieldName = 'COUNT_COLS_X'
    end
    object q_reportsAXES_Y_NAME: TStringField
      FieldName = 'AXES_Y_NAME'
      Size = 30
    end
    object q_reportsCOUNT_COLS_Y: TIntegerField
      FieldName = 'COUNT_COLS_Y'
    end
    object q_reportsPROC_PACKET: TStringField
      FieldName = 'PROC_PACKET'
      Size = 30
    end
    object q_reportsPROC_NAME: TStringField
      FieldName = 'PROC_NAME'
      Size = 30
    end
    object q_reportsDEF_BEG_VAL: TStringField
      FieldName = 'DEF_BEG_VAL'
      Size = 30
    end
    object q_reportsDEF_END_VAL: TStringField
      FieldName = 'DEF_END_VAL'
      Size = 30
    end
    object q_reportsDEF_BEG_TIME: TStringField
      FieldName = 'DEF_BEG_TIME'
      Size = 8
    end
    object q_reportsDEF_END_TIME: TStringField
      FieldName = 'DEF_END_TIME'
      Size = 8
    end
    object q_reportsVIEW_TIME: TIntegerField
      FieldName = 'VIEW_TIME'
    end
    object q_reportsTIP_DATE: TStringField
      FieldName = 'TIP_DATE'
      Size = 30
    end
    object q_reportsPARUS_PROC: TStringField
      FieldName = 'PARUS_PROC'
      Size = 30
    end
    object q_reportsREP_FORM: TStringField
      FieldName = 'REP_FORM'
      Size = 30
    end
    object q_reportsASK_RUN_PROC: TIntegerField
      FieldName = 'ASK_RUN_PROC'
      Required = True
    end
    object q_reportsASK_RUN_TEXT: TStringField
      FieldName = 'ASK_RUN_TEXT'
      Size = 50
    end
  end
  object q_report_groups: TOracleDataSet
    SQL.Strings = (
      'select'
      '*'
      'from report_groups'
      'where'
      'rep_kind='#39'SNP'#39
      'order by sortby'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000050000000200000049440100000000000C0000005245504F52545F47
      524F5550010000000000110000005245504F52545F47524F55505F4E414D4501
      000000000006000000534F52544259010000000000080000004954454D4E414D
      45010000000000}
    Session = ora_Session
    Left = 168
    Top = 120
  end
  object q_ProdGr: TOracleDataSet
    SQL.Strings = (
      'select '
      '  kls_prod.id_npr,'
      '  kls_prod.NAME_NPR '
      'from kls_prod where kls_prod.ID_GROUP_NPR='#39'00000'#39
      'ORDER BY 1')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000080000004E414D455F4E5052010000000000060000004944
      5F4E5052010000000000}
    Session = ora_Session
    Left = 39
    Top = 257
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
  object q_Prod: TOracleDataSet
    SQL.Strings = (
      'select '
      '  kls_prod.id_npr,'
      '  kls_prod.NAME_NPR '
      'from kls_prod where kls_prod.ID_GROUP_NPR<>'#39'00000'#39
      'ORDER BY 1')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000080000004E414D455F4E5052010000000000060000004944
      5F4E5052010000000000}
    Session = ora_Session
    Left = 67
    Top = 257
    object StringField1: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object StringField2: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 30
    end
  end
  object q_Plat: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  kls_predpr.id,'
      '  kls_predpr.short_name'
      '  FROM kls_predpr,kls_dog'
      '  WHERE kls_dog.predpr_id=kls_predpr.id'
      '  ORDER BY 2')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000A00000053484F52545F4E41
      4D45010000000000}
    Session = ora_Session
    Left = 95
    Top = 257
    object q_PlatID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_PlatSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object q_poluch: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  kls_predpr.id,'
      '  kls_predpr.short_name'
      '  FROM kls_predpr'
      '  ORDER BY 2')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000A00000053484F52545F4E41
      4D45010000000000}
    Session = ora_Session
    Left = 123
    Top = 257
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object q_stan: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  kls_stan.id,'
      '  kls_stan.stan_name || '#39' '#39' || kls_gdor.short_name AS stan_name'
      'FROM kls_stan,kls_gdor'
      'WHERE kls_stan.gdor_id=kls_gdor.id'
      'ORDER BY 2')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000090000005354414E5F4E414D
      45010000000000}
    Session = ora_Session
    Left = 151
    Top = 257
    object q_stanID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_stanSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Size = 44
    end
  end
  object ds_ProdGr: TDataSource
    DataSet = q_ProdGr
    Left = 39
    Top = 285
  end
  object ds_Prod: TDataSource
    DataSet = q_Prod
    Left = 67
    Top = 285
  end
  object ds_Plat: TDataSource
    DataSet = q_Plat
    Left = 95
    Top = 285
  end
  object ds_poluch: TDataSource
    DataSet = q_poluch
    Left = 123
    Top = 285
  end
  object ds_Load_Type: TDataSource
    DataSet = q_Load_Type
    Left = 179
    Top = 285
  end
  object q_Nazn_Otg: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM kls_nazn_otg'
      '  ORDER BY 1')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000D0000004E415A4E5F4F5447
      5F4E414D45010000000000}
    Session = ora_Session
    Left = 43
    Top = 345
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
    Left = 43
    Top = 373
  end
  object q_Load_Type: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM kls_load_type'
      '  ORDER BY 1')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000E000000545950455F4F5447
      525F4E414D45010000000000}
    Session = ora_Session
    Left = 179
    Top = 257
    object q_Load_TypeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_Load_TypeTYPE_OTGR_NAME: TStringField
      FieldName = 'TYPE_OTGR_NAME'
      Required = True
      Size = 30
    end
  end
  object ds_stan: TDataSource
    DataSet = q_stan
    Left = 151
    Top = 285
  end
  object q_otpr: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  0 as ID,'
      '  '#39#1053#1045' '#1046'/'#1044' '#1054#1058#1043#1056#1059#1047#1050#1040#39' AS short_name'
      'FROM dual'
      'UNION ALL'
      'SELECT * FROM'
      '( '
      'SELECT DISTINCT'
      '  kls_predpr.id,'
      '  kls_predpr.short_name'
      'FROM kls_predpr, kls_tex_pd'
      'WHERE kls_tex_pd.GROTP_ID=kls_predpr.ID'
      '  AND kls_tex_pd.GROTP_ID<>0'
      'ORDER BY 2'
      ')'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000A00000053484F52545F4E41
      4D45010000000000}
    Session = ora_Session
    Left = 147
    Top = 353
    object q_otprID: TFloatField
      FieldName = 'ID'
    end
    object q_otprSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object ds_otpr: TDataSource
    DataSet = q_otpr
    Left = 147
    Top = 381
  end
  object q_tex_pd: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  ID'
      'FROM kls_tex_pd'
      'ORDER BY 1'
      '')
    QBEDefinition.QBEFieldDefs = {0400000001000000020000004944010000000000}
    Session = ora_Session
    Left = 211
    Top = 353
    object q_tex_pdID: TFloatField
      FieldName = 'ID'
    end
  end
  object ds_tex_pd: TDataSource
    DataSet = q_tex_pd
    Left = 211
    Top = 381
  end
  object q_Tel: TOracleDataSet
    SQL.Strings = (
      
        'SELECT inside_number,inside_number || '#39' - '#39' || fio AS fio FROM t' +
        'el.kls_phones'
      'WHERE inside_number BETWEEN '#39'6100'#39' AND '#39'6299'#39
      'ORDER BY 1')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000D000000494E534944455F4E554D42455201000000000003
      00000046494F010000000000}
    Session = ora_Session
    Left = 207
    Top = 257
    object q_TelINSIDE_NUMBER: TStringField
      FieldName = 'INSIDE_NUMBER'
      Required = True
      Size = 10
    end
    object q_TelFIO: TStringField
      FieldName = 'FIO'
      Size = 50
    end
  end
  object ds_Tel: TDataSource
    DataSet = q_Tel
    Left = 207
    Top = 285
  end
  object q_Sobstv: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  KLS_PREDPR.ID,'
      '  KLS_PREDPR.short_name'
      '  FROM KLS_PREDPR,PREDPR_ROLE'
      '  WHERE PREDPR_ROLE.predpr_id=KLS_PREDPR.ID AND KLS_PREDPR.ID<>0'
      '  ORDER BY 2')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000A00000053484F52545F4E41
      4D45010000000000}
    Session = ora_Session
    Left = 239
    Top = 257
    object IntegerField2: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object ds_Sobstv: TDataSource
    DataSet = q_Sobstv
    Left = 239
    Top = 285
  end
  object q_rep_param: TOracleDataSet
    SQL.Strings = (
      'select *'
      'from reports_param '
      'where reports_id=0'
      '    and param_order<>0'
      'order by param_order')
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000200000049440100000000000A0000005245504F5254535F
      49440100000000000A000000504152414D5F4E414D450100000000000B000000
      504152414D5F4F524445520100000000000D000000504152414D5F5649534942
      4C450100000000000F00000050524F435F504152414D5F4E414D450100000000
      001000000050524F435F504152414D5F4F524445520100000000000A0000004D
      41535445525F5441470100000000001500000050415255535F50524F435F5041
      52414D5F4E414D450100000000001600000050415255535F50524F435F504152
      414D5F4F52444552010000000000}
    Session = ora_Session
    Left = 88
    Top = 88
    object q_rep_paramID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_rep_paramREPORTS_ID: TFloatField
      FieldName = 'REPORTS_ID'
      Required = True
    end
    object q_rep_paramPARAM_NAME: TStringField
      FieldName = 'PARAM_NAME'
      Size = 30
    end
    object q_rep_paramPARAM_ORDER: TFloatField
      FieldName = 'PARAM_ORDER'
    end
    object q_rep_paramPARAM_VISIBLE: TIntegerField
      FieldName = 'PARAM_VISIBLE'
    end
    object q_rep_paramPROC_PARAM_NAME: TStringField
      FieldName = 'PROC_PARAM_NAME'
      Size = 30
    end
    object q_rep_paramPROC_PARAM_ORDER: TFloatField
      FieldName = 'PROC_PARAM_ORDER'
    end
    object q_rep_paramMASTER_TAG: TStringField
      FieldName = 'MASTER_TAG'
      Size = 30
    end
    object q_rep_paramPARUS_PROC_PARAM_NAME: TStringField
      FieldName = 'PARUS_PROC_PARAM_NAME'
      Size = 30
    end
    object q_rep_paramPARUS_PROC_PARAM_ORDER: TFloatField
      FieldName = 'PARUS_PROC_PARAM_ORDER'
    end
  end
  object ds_rep_param: TDataSource
    DataSet = q_rep_param
    Left = 144
    Top = 88
  end
  object q_Region: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  KLS_REGION.ID,'
      '  KLS_REGION.REGION_NAME'
      'FROM KLS_REGION'
      
        'WHERE KLS_REGION.ID<>0 AND KLS_REGION.ID<>998 AND KLS_REGION.ID<' +
        '>999'
      'ORDER BY KLS_REGION.REGION_NAME')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000B000000524547494F4E5F4E
      414D45010000000000}
    Session = ora_Session
    Left = 271
    Top = 257
    object q_RegionID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_RegionREGION_NAME: TStringField
      FieldName = 'REGION_NAME'
      Required = True
      Size = 30
    end
  end
  object ds_Region: TDataSource
    DataSet = q_Region
    Left = 271
    Top = 285
  end
  object q_DiagramKind: TOracleDataSet
    SQL.Strings = (
      'SELECT * '
      'FROM KLS_DIAGRAM_KIND'
      'WHERE DIAGRAM_TYPE='#39'GRAPH'#39
      'ORDER BY SORTBY')
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000030000005441470100000000
      000C0000004449414752414D5F54595045010000000000040000004E414D4501
      000000000006000000534F525442590100000000000800000049434F4E5F4E55
      4D010000000000}
    Session = ora_Session
    Left = 159
    Top = 185
    object q_DiagramKindID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_DiagramKindTAG: TStringField
      FieldName = 'TAG'
      Size = 30
    end
    object q_DiagramKindDIAGRAM_TYPE: TStringField
      FieldName = 'DIAGRAM_TYPE'
      Size = 10
    end
    object q_DiagramKindNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object q_DiagramKindSORTBY: TFloatField
      FieldName = 'SORTBY'
    end
    object q_DiagramKindICON_NUM: TIntegerField
      FieldName = 'ICON_NUM'
    end
  end
  object ds_DiagramKind: TDataSource
    DataSet = q_DiagramKind
    Left = 159
    Top = 213
  end
  object q_rep_tip_dates: TOracleDataSet
    SQL.Strings = (
      'select *'
      'from report_tip_dates'
      'where rep_kind='#39#39
      'order by sortby')
    QBEDefinition.QBEFieldDefs = {
      0400000008000000020000004944010000000000080000005245505F4B494E44
      01000000000006000000534F52544259010000000000080000005449505F4441
      5445010000000000070000004445465F5449500100000000000B000000444546
      5F4245475F56414C0100000000000B0000004445465F454E445F56414C010000
      00000009000000564945575F54494D45010000000000}
    Session = ora_Session
    Left = 208
    Top = 40
    object q_rep_tip_datesID: TFloatField
      FieldName = 'ID'
    end
    object q_rep_tip_datesREP_KIND: TStringField
      FieldName = 'REP_KIND'
      Required = True
      Size = 30
    end
    object q_rep_tip_datesSORTBY: TFloatField
      FieldName = 'SORTBY'
    end
    object q_rep_tip_datesTIP_DATE: TStringField
      FieldName = 'TIP_DATE'
      Required = True
      Size = 60
    end
    object q_rep_tip_datesDEF_TIP: TIntegerField
      FieldName = 'DEF_TIP'
      Required = True
    end
    object q_rep_tip_datesDEF_BEG_VAL: TStringField
      FieldName = 'DEF_BEG_VAL'
      Size = 30
    end
    object q_rep_tip_datesDEF_END_VAL: TStringField
      FieldName = 'DEF_END_VAL'
      Size = 30
    end
    object q_rep_tip_datesVIEW_TIME: TIntegerField
      FieldName = 'VIEW_TIME'
      Required = True
    end
  end
  object ds_rep_tip_dates: TDataSource
    DataSet = q_rep_tip_dates
    Left = 272
    Top = 40
  end
  object q_proc_param: TOracleDataSet
    SQL.Strings = (
      'select *'
      'from reports_param '
      'where reports_id=0'
      'order by proc_param_order')
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000200000049440100000000000A0000005245504F5254535F
      49440100000000000A000000504152414D5F4E414D450100000000000B000000
      504152414D5F4F524445520100000000000D000000504152414D5F5649534942
      4C450100000000000F00000050524F435F504152414D5F4E414D450100000000
      001000000050524F435F504152414D5F4F524445520100000000000A0000004D
      41535445525F5441470100000000001500000050415255535F50524F435F5041
      52414D5F4E414D450100000000001600000050415255535F50524F435F504152
      414D5F4F52444552010000000000}
    Session = ora_Session
    Left = 32
    Top = 200
    object q_proc_paramID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_proc_paramREPORTS_ID: TFloatField
      FieldName = 'REPORTS_ID'
      Required = True
    end
    object q_proc_paramPARAM_NAME: TStringField
      FieldName = 'PARAM_NAME'
      Size = 30
    end
    object q_proc_paramPARAM_ORDER: TFloatField
      FieldName = 'PARAM_ORDER'
    end
    object q_proc_paramPARAM_VISIBLE: TIntegerField
      FieldName = 'PARAM_VISIBLE'
    end
    object q_proc_paramPROC_PARAM_NAME: TStringField
      FieldName = 'PROC_PARAM_NAME'
      Size = 30
    end
    object q_proc_paramPROC_PARAM_ORDER: TFloatField
      FieldName = 'PROC_PARAM_ORDER'
    end
    object q_proc_paramMASTER_TAG: TStringField
      FieldName = 'MASTER_TAG'
      Size = 30
    end
    object q_proc_paramPARUS_PROC_PARAM_NAME: TStringField
      FieldName = 'PARUS_PROC_PARAM_NAME'
      Size = 30
    end
    object q_proc_paramPARUS_PROC_PARAM_ORDER: TFloatField
      FieldName = 'PARUS_PROC_PARAM_ORDER'
    end
  end
  object ds_proc_param: TDataSource
    DataSet = q_proc_param
    Left = 88
    Top = 200
  end
  object q_rep_tags: TOracleDataSet
    SQL.Strings = (
      'select *'
      'from report_tags')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000040000004E414D4501000000000004000000494E464F0100
      00000000090000004F574E45525F5441420100000000000A0000005155455259
      5F4E414D45010000000000}
    Session = ora_Session
    Left = 208
    Top = 88
    object q_rep_tagsNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
    object q_rep_tagsINFO: TStringField
      FieldName = 'INFO'
      Size = 30
    end
    object q_rep_tagsOWNER_TAB: TStringField
      FieldName = 'OWNER_TAB'
      Size = 15
    end
    object q_rep_tagsQUERY_NAME: TStringField
      FieldName = 'QUERY_NAME'
      Size = 30
    end
  end
  object ds_rep_tags: TDataSource
    DataSet = q_rep_tags
    Left = 272
    Top = 88
  end
  object ora_Package: TOraclePackage
    Session = ora_Session
    ParameterMode = pmNamed
    Left = 256
    Top = 192
  end
  object q_ProdGrKons: TOracleDataSet
    SQL.Strings = (
      'select distinct'
      '  ID_GLOBAL_GR as ID_GR,'
      '  NLS_UPPER(NAME_GLOBAL_GR) as NAME'
      'from KLS_PROD_GR_KONS '
      'ORDER BY  ID_GLOBAL_GR')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000500000049445F4752010000000000040000004E414D4501
      0000000000}
    Session = ora_Session
    Left = 95
    Top = 345
    object q_ProdGrKonsID_GR: TStringField
      FieldName = 'ID_GR'
      Required = True
      Size = 12
    end
    object q_ProdGrKonsNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
  end
  object ds_ProdGrKons: TDataSource
    DataSet = q_ProdGrKons
    Left = 95
    Top = 373
  end
  object q_ProdKons: TOracleDataSet
    SQL.Strings = (
      'select'
      '  ID,'
      '  NLS_UPPER(GROUP_NAME) as NAME'
      'from KLS_PROD_GROUPS A'
      'where PROD_TYPE_GRP_ID=9'
      'ORDER BY A.GROUP_ORDER')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = ora_Session
    Left = 267
    Top = 353
    object q_ProdKonsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_ProdKonsNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
  end
  object ds_ProdKons: TDataSource
    DataSet = q_ProdKons
    Left = 267
    Top = 381
  end
  object q_Orgstru_fil: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,NAME FROM ORG_STRUCTURE '
      'WHERE filial IS NOT NULL ORDER BY filial')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = ora_Session
    Left = 179
    Top = 353
    object q_Orgstru_filID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_Orgstru_filNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
  end
  object ds_Orgstru_fil: TDataSource
    DataSet = q_Orgstru_fil
    Left = 179
    Top = 381
  end
  object q_Orgstru_azc: TOracleDataSet
    SQL.Strings = (
      'SELECT A.ID,A.NAME FROM ORG_STRUCTURE A,KLS_ORG_KIND '
      'WHERE A.filial IS NULL AND A.ORG_KIND_ID=KLS_ORG_KIND.ID '
      'AND 1=1'
      'AND 1=1'
      'ORDER BY a.NAME'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = ora_Session
    Left = 323
    Top = 353
    object q_Orgstru_azcID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_Orgstru_azcNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
  end
  object ds_Orgstru_azc: TDataSource
    DataSet = q_Orgstru_azc
    Left = 315
    Top = 381
  end
  object q_tip_op_kons: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_tip_op_kons'
      'ORDER BY id')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = ora_Session
    Left = 315
    Top = 257
    object q_tip_op_konsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_tip_op_konsNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
  end
  object ds_tip_op_kons: TDataSource
    DataSet = q_tip_op_kons
    Left = 315
    Top = 285
  end
  object q_org_kind_grp: TOracleDataSet
    SQL.Strings = (
      'SELECT distinct GROUP_KIND_ID as ID, GROUP_KIND_NAME as NAME '
      'FROM kls_org_kind'
      'ORDER BY group_kind_id')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = ora_Session
    Left = 51
    Top = 417
    object q_org_kind_grpID: TFloatField
      FieldName = 'ID'
    end
    object q_org_kind_grpNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
  end
  object ds_org_kind_grp: TDataSource
    DataSet = q_org_kind_grp
    Left = 51
    Top = 445
  end
  object ParusLogon: TOracleLogon
    Session = ora_Parus
    Retries = 5
    Options = [ldDatabase, ldDatabaseList, ldLogonHistory]
    HistoryRegSection = 'Software\SNP\Master\LogonHistory'
    HistoryWithPassword = True
    Caption = #1048#1084#1103' '#1080' '#1055#1072#1088#1086#1083#1100' '#1074' '#1057#1080#1089#1090#1077#1084#1077' "'#1055#1072#1088#1091#1089'"'
    Left = 392
    Top = 393
  end
  object ora_Parus: TOracleSession
    DesignConnection = True
    LogonDatabase = 'P5'
    Left = 472
    Top = 341
  end
  object ParusProc: TOracleQuery
    Session = ora_Parus
    Left = 559
    Top = 374
  end
  object q_parus_proc_param: TOracleDataSet
    SQL.Strings = (
      'select *'
      'from reports_param '
      'where reports_id=0'
      'order by parus_proc_param_order')
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000200000049440100000000000A0000005245504F5254535F
      49440100000000000A000000504152414D5F4E414D450100000000000B000000
      504152414D5F4F524445520100000000000D000000504152414D5F5649534942
      4C450100000000000F00000050524F435F504152414D5F4E414D450100000000
      001000000050524F435F504152414D5F4F524445520100000000000A0000004D
      41535445525F5441470100000000001500000050415255535F50524F435F5041
      52414D5F4E414D450100000000001600000050415255535F50524F435F504152
      414D5F4F52444552010000000000}
    Session = ora_Session
    Left = 312
    Top = 208
    object q_parus_proc_paramID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_parus_proc_paramREPORTS_ID: TFloatField
      FieldName = 'REPORTS_ID'
      Required = True
    end
    object q_parus_proc_paramPARAM_NAME: TStringField
      FieldName = 'PARAM_NAME'
      Size = 30
    end
    object q_parus_proc_paramPARAM_ORDER: TFloatField
      FieldName = 'PARAM_ORDER'
    end
    object q_parus_proc_paramPARAM_VISIBLE: TIntegerField
      FieldName = 'PARAM_VISIBLE'
    end
    object q_parus_proc_paramPROC_PARAM_NAME: TStringField
      FieldName = 'PROC_PARAM_NAME'
      Size = 30
    end
    object q_parus_proc_paramPROC_PARAM_ORDER: TFloatField
      FieldName = 'PROC_PARAM_ORDER'
    end
    object q_parus_proc_paramMASTER_TAG: TStringField
      FieldName = 'MASTER_TAG'
      Size = 30
    end
    object q_parus_proc_paramPARUS_PROC_PARAM_NAME: TStringField
      FieldName = 'PARUS_PROC_PARAM_NAME'
      Size = 30
    end
    object q_parus_proc_paramPARUS_PROC_PARAM_ORDER: TFloatField
      FieldName = 'PARUS_PROC_PARAM_ORDER'
    end
  end
  object q_filial_parus: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ALL_ROWS */  DISTINCT A.SDEP_READY, C.FILIAL_ID    '
      
        'FROM V_PARUS_DICSTORE A, PARUS_STORE_ORG_STRU_LINK B, V_ORG_STRU' +
        'CTURE C'
      'WHERE sDEP_READY IS NOT NULL'
      '  AND A.nRN=B.STORE_RN'
      '  AND B.ORG_STRU_ID=C.ID'
      'ORDER BY sDEP_READY')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000A000000534445505F524541445901000000000009000000
      46494C49414C5F4944010000000000}
    Session = ora_Session
    Left = 187
    Top = 425
    object q_filial_parusSDEP_READY: TStringField
      FieldName = 'SDEP_READY'
    end
    object q_filial_parusFILIAL_ID: TFloatField
      FieldName = 'FILIAL_ID'
    end
  end
  object ds_filial_parus: TDataSource
    DataSet = q_filial_parus
    Left = 187
    Top = 453
  end
  object q_Exped: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  kls_predpr.id,'
      '  kls_predpr.short_name'
      'FROM kls_predpr, predpr_role'
      'WHERE predpr_role.PREDPR_ID=kls_predpr.ID'
      '  AND predpr_role.kls_role_id=3'
      'ORDER BY 2'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000A00000053484F52545F4E41
      4D45010000000000}
    Session = ora_Session
    Left = 123
    Top = 353
    object q_ExpedID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_ExpedSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object ds_Exped: TDataSource
    DataSet = q_Exped
    Left = 123
    Top = 381
  end
  object q_VagOwner: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  kls_vagowner.id,'
      '  kls_vagowner.vagowner_name'
      'FROM kls_vagowner'
      'WHERE ID IN (select OWNER_ID FROM kls_vagowner) '
      '  and id<>0 and id<>99'
      'ORDER BY 1'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000D0000005641474F574E4552
      5F4E414D45010000000000}
    Session = ora_Session
    Left = 131
    Top = 417
    object q_VagOwnerID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_VagOwnerVAGOWNER_NAME: TStringField
      FieldName = 'VAGOWNER_NAME'
      Required = True
      Size = 30
    end
  end
  object ds_vagOwner: TDataSource
    DataSet = q_VagOwner
    Left = 131
    Top = 445
  end
end
