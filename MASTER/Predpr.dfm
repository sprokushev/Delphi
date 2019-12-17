object f_Predpr: Tf_Predpr
  Left = 271
  Top = 121
  BorderStyle = bsDialog
  Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
  ClientHeight = 514
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 697
    Height = 473
    ActivePage = tabMain
    Align = alClient
    TabOrder = 0
    object tabMain: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      object gb_Addr: TGroupBox
        Left = 0
        Top = 81
        Width = 689
        Height = 128
        Align = alTop
        Caption = ' '#1040#1076#1088#1077#1089#1072' '
        TabOrder = 0
        object Label4: TLabel
          Left = 105
          Top = 56
          Width = 38
          Height = 13
          Caption = #1048#1085#1076#1077#1082#1089
        end
        object Label5: TLabel
          Left = 203
          Top = 56
          Width = 30
          Height = 13
          Caption = #1043#1086#1088#1086#1076
        end
        object Label6: TLabel
          Left = 317
          Top = 56
          Width = 31
          Height = 13
          Caption = #1040#1076#1088#1077#1089
        end
        object Label7: TLabel
          Left = 12
          Top = 75
          Width = 68
          Height = 13
          Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1081
        end
        object Label8: TLabel
          Left = 13
          Top = 100
          Width = 50
          Height = 13
          Caption = #1055#1086#1095#1090#1086#1074#1099#1081
        end
        object Label17: TLabel
          Left = 252
          Top = 16
          Width = 43
          Height = 13
          Caption = #1056#1077#1075#1080#1086#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sb_Regions: TSpeedButton
          Left = 577
          Top = 28
          Width = 26
          Height = 22
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000CE0E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777700000777770000070F000777770F00070F000777770F
            0007000000070000000700F000000F00000700F000700F00000700F000700F00
            00077000000000000077770F00070F0007777700000700000777777000777000
            77777770F07770F0777777700077700077777777777777777777}
          OnClick = sb_RegionsClick
        end
        object Label20: TLabel
          Left = 12
          Top = 16
          Width = 43
          Height = 13
          Caption = #1057#1090#1088#1072#1085#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sb_States: TSpeedButton
          Left = 217
          Top = 30
          Width = 26
          Height = 22
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000CE0E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777700000777770000070F000777770F00070F000777770F
            0007000000070000000700F000000F00000700F000700F00000700F000700F00
            00077000000000000077770F00070F0007777700000700000777777000777000
            77777770F07770F0777777700077700077777777777777777777}
          OnClick = sb_StatesClick
        end
        object DBEdit1: TDBEdit
          Left = 89
          Top = 73
          Width = 71
          Height = 21
          DataField = 'POSTINDEX_J'
          DataSource = ds_Predpr
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 165
          Top = 73
          Width = 117
          Height = 21
          DataField = 'CITY_J'
          DataSource = ds_Predpr
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 288
          Top = 73
          Width = 313
          Height = 21
          DataField = 'ADDRESS_J'
          DataSource = ds_Predpr
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 89
          Top = 98
          Width = 71
          Height = 21
          DataField = 'POSTINDEX_P'
          DataSource = ds_Predpr
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 165
          Top = 98
          Width = 117
          Height = 21
          DataField = 'CITY_P'
          DataSource = ds_Predpr
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 288
          Top = 98
          Width = 313
          Height = 21
          DataField = 'ADDRESS_P'
          DataSource = ds_Predpr
          TabOrder = 5
        end
        object lc_Region: TRxDBLookupCombo
          Left = 251
          Top = 29
          Width = 326
          Height = 21
          DropDownCount = 8
          DataField = 'REGION_ID'
          DataSource = ds_Predpr
          DisplayEmpty = '<'#1056#1077#1075#1080#1086#1085' '#1085#1077' '#1074#1099#1073#1088#1072#1085'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'REGION_NAME'
          LookupSource = ds_Region
          TabOrder = 6
        end
        object lc_State: TRxDBLookupCombo
          Left = 11
          Top = 30
          Width = 206
          Height = 22
          DropDownCount = 8
          DataField = 'STATES_ID'
          DataSource = ds_Predpr
          DisplayEmpty = #1056#1054#1057#1057#1048#1049#1057#1050#1040#1071' '#1060#1045#1044#1045#1056#1040#1062#1048#1071
          EmptyValue = '1'
          LookupField = 'ID'
          LookupDisplay = 'STATE_NAME'
          LookupSource = ds_States
          TabOrder = 7
        end
      end
      object gb_Kods: TGroupBox
        Left = 0
        Top = 209
        Width = 689
        Height = 71
        Align = alTop
        Caption = ' '#1050#1086#1076#1072' '
        TabOrder = 1
        object Label9: TLabel
          Left = 30
          Top = 20
          Width = 24
          Height = 13
          Caption = #1048#1053#1053
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 15
          Top = 44
          Width = 38
          Height = 13
          Caption = #1054#1050#1054#1053#1061
        end
        object Label11: TLabel
          Left = 236
          Top = 20
          Width = 31
          Height = 13
          Caption = #1054#1050#1055#1054
        end
        object Label21: TLabel
          Left = 229
          Top = 47
          Width = 38
          Height = 13
          Caption = #1054#1050#1042#1069#1044
        end
        object Label27: TLabel
          Left = 436
          Top = 20
          Width = 29
          Height = 13
          Caption = #1054#1043#1056#1053
        end
        object DBEdit7: TDBEdit
          Left = 66
          Top = 17
          Width = 150
          Height = 21
          DataField = 'INN'
          DataSource = ds_Predpr
          TabOrder = 0
        end
        object DBEdit8: TDBEdit
          Left = 65
          Top = 44
          Width = 150
          Height = 21
          DataField = 'OKONH'
          DataSource = ds_Predpr
          TabOrder = 1
        end
        object DBEdit9: TDBEdit
          Left = 274
          Top = 16
          Width = 150
          Height = 21
          DataField = 'OKPO'
          DataSource = ds_Predpr
          TabOrder = 2
        end
        object DBEdit13: TDBEdit
          Left = 274
          Top = 43
          Width = 150
          Height = 21
          DataField = 'OKVED'
          DataSource = ds_Predpr
          TabOrder = 3
        end
        object DBEdit16: TDBEdit
          Left = 474
          Top = 16
          Width = 150
          Height = 21
          DataField = 'OGRN'
          DataSource = ds_Predpr
          TabOrder = 4
        end
      end
      object gb_Class: TGroupBox
        Left = 0
        Top = 280
        Width = 689
        Height = 165
        Align = alClient
        Caption = ' '#1050#1083#1072#1089#1089#1080#1092#1080#1082#1072#1094#1080#1103' '
        TabOrder = 2
        object Label18: TLabel
          Left = 30
          Top = 21
          Width = 50
          Height = 13
          Caption = #1061#1086#1083#1076#1080#1085#1075
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 54
          Top = 44
          Width = 23
          Height = 13
          Caption = #1058#1080#1087
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 15
          Top = 67
          Width = 65
          Height = 13
          Caption = #1061#1086#1079'.'#1076#1077#1103#1090'-'#1089#1090#1080
        end
        object lc_Holding: TRxDBLookupCombo
          Left = 86
          Top = 17
          Width = 267
          Height = 21
          DropDownCount = 8
          DataField = 'HOLDING_ID'
          DataSource = ds_Predpr
          LookupField = 'ID'
          LookupDisplay = 'HOLDING_NAME'
          LookupSource = ds_Holding
          TabOrder = 0
        end
        object lc_Pertype: TRxDBLookupCombo
          Left = 86
          Top = 41
          Width = 267
          Height = 21
          DropDownCount = 8
          DataField = 'PERTYPE_ID'
          DataSource = ds_Predpr
          LookupField = 'ID'
          LookupDisplay = 'PERTYPE_NAME'
          LookupSource = ds_pertype
          TabOrder = 1
        end
        object lc_Class: TRxDBLookupCombo
          Left = 86
          Top = 64
          Width = 267
          Height = 21
          DropDownCount = 8
          DataField = 'CLASS_ID'
          DataSource = ds_Predpr
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = ds_Class
          TabOrder = 2
        end
      end
      object gb_Main: TGroupBox
        Left = 0
        Top = 0
        Width = 689
        Height = 81
        Align = alTop
        TabOrder = 3
        object Label1: TLabel
          Left = 8
          Top = 12
          Width = 19
          Height = 13
          Caption = #1050#1086#1076
        end
        object l_ID: TDBText
          Left = 40
          Top = 12
          Width = 54
          Height = 17
          DataField = 'ID'
          DataSource = ds_Predpr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 87
          Top = 12
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 135
          Top = 36
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = #1050#1088#1072#1090#1082#1086#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 157
          Top = 60
          Width = 20
          Height = 13
          Alignment = taRightJustify
          Caption = #1058#1045#1043
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object e_Predpr_Name: TDBEdit
          Left = 184
          Top = 9
          Width = 425
          Height = 21
          DataField = 'predpr_name'
          DataSource = ds_Predpr
          TabOrder = 0
        end
        object e_short_name: TDBEdit
          Left = 184
          Top = 33
          Width = 425
          Height = 21
          DataField = 'SHORT_NAME'
          DataSource = ds_Predpr
          TabOrder = 1
        end
        object DBCheckBox1: TDBCheckBox
          Left = 8
          Top = 59
          Width = 105
          Height = 17
          Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1085#1086
          DataField = 'IS_BLOCK'
          DataSource = ds_Predpr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object e_TAG: TDBEdit
          Left = 184
          Top = 57
          Width = 425
          Height = 21
          DataField = 'TAG'
          DataSource = ds_Predpr
          TabOrder = 3
        end
      end
    end
    object tabContacts: TTabSheet
      Caption = #1050#1086#1085#1090#1072#1082#1090#1099
      ImageIndex = 7
      object gb_Contacts_Def: TGroupBox
        Left = 0
        Top = 0
        Width = 689
        Height = 44
        Align = alTop
        Caption = ' '#1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '
        TabOrder = 0
        object Label12: TLabel
          Left = 6
          Top = 19
          Width = 29
          Height = 13
          Caption = 'E-Mail'
        end
        object Label13: TLabel
          Left = 199
          Top = 19
          Width = 45
          Height = 13
          Caption = #1058#1077#1083#1077#1092#1086#1085
        end
        object Label14: TLabel
          Left = 404
          Top = 17
          Width = 29
          Height = 13
          Caption = #1060#1072#1082#1089
        end
        object DBEdit10: TDBEdit
          Left = 40
          Top = 15
          Width = 150
          Height = 21
          DataField = 'EMAIL'
          DataSource = ds_Predpr
          TabOrder = 0
        end
        object DBEdit11: TDBEdit
          Left = 249
          Top = 15
          Width = 150
          Height = 21
          DataField = 'PHONE'
          DataSource = ds_Predpr
          TabOrder = 1
        end
        object DBEdit12: TDBEdit
          Left = 442
          Top = 15
          Width = 150
          Height = 21
          DataField = 'Fax'
          DataSource = ds_Predpr
          TabOrder = 2
        end
      end
      object gb_Contacts: TGroupBox
        Left = 0
        Top = 44
        Width = 689
        Height = 401
        Align = alClient
        Caption = ' '#1057#1087#1080#1089#1086#1082' '#1082#1086#1085#1090#1072#1082#1090#1085#1099#1093' '#1083#1080#1094' ('#1090#1086#1083#1100#1082#1086' '#1074' '#1088#1077#1078#1080#1084#1077' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103') '
        Enabled = False
        TabOrder = 1
        object gridContacts: TDBGridEh
          Left = 2
          Top = 41
          Width = 685
          Height = 358
          Align = alClient
          AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
          DataSource = ds_Contacts
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnSortMarkingChanged = gridContactsSortMarkingChanged
          Columns = <
            item
              Checkboxes = False
              DblClickNextVal = True
              EditButtons = <>
              FieldName = 'IS_BOSS'
              Footers = <>
              KeyList.Strings = (
                '0'
                '1'
                '2'
                '3')
              PickList.Strings = (
                '0-'#1056#1072#1073#1086#1090#1085#1080#1082
                '1-'#1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
                '2-'#1043#1083'.'#1073#1091#1093#1075#1072#1083#1090#1077#1088
                '3-'#1047#1072#1084'.'#1088#1091#1082'-'#1083#1103)
              Title.TitleButton = True
              Width = 90
            end
            item
              Checkboxes = False
              DblClickNextVal = True
              EditButtons = <>
              FieldName = 'SEX'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              PickList.Strings = (
                #1052
                #1046)
              Title.TitleButton = True
              Width = 38
            end
            item
              EditButtons = <>
              FieldName = 'STAFF'
              Footers = <>
              Title.TitleButton = True
              Width = 186
            end
            item
              EditButtons = <>
              FieldName = 'PHONE'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'LASTNAME'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'SHORTNAME'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'FIRSTNAME'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'MIDDLENAME'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'STAFF1'
              Footers = <>
              Title.TitleButton = True
              Width = 230
            end
            item
              EditButtons = <>
              FieldName = 'NA_OSNOV'
              Footers = <>
              Title.TitleButton = True
              Width = 262
            end
            item
              EditButtons = <>
              FieldName = 'LASTNAME1'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'FIRSTNAME1'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'MIDDLENAME1'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'STAFF2'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'LASTNAME2'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'FIRSTNAME2'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'MIDDLENAME2'
              Footers = <>
              Title.TitleButton = True
            end>
        end
        object TBDock1: TTBDock
          Left = 2
          Top = 15
          Width = 685
          Height = 26
          object TBToolbar1: TTBToolbar
            Left = 0
            Top = 0
            Caption = 'TBToolbar1'
            DockPos = 0
            Images = f_main.img_Common
            TabOrder = 0
            object TBItem4: TTBItem
              Action = acContactAdd
              DisplayMode = nbdmImageAndText
            end
            object TBItem3: TTBItem
              Action = acContactApply
              DisplayMode = nbdmImageAndText
            end
            object TBItem7: TTBItem
              Action = acContactDel
              DisplayMode = nbdmImageAndText
            end
            object TBItem8: TTBItem
              Action = acContactRefresh
              DisplayMode = nbdmImageAndText
            end
          end
        end
      end
    end
    object tabRS: TTabSheet
      Caption = #1056'/'#1089
      ImageIndex = 1
      object gb_Rs_Def: TGroupBox
        Left = 0
        Top = 0
        Width = 689
        Height = 89
        Align = alTop
        Caption = ' '#1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '
        TabOrder = 0
        object DBText1: TDBText
          Left = 368
          Top = 19
          Width = 297
          Height = 15
          DataField = 'BANK_NAME'
          DataSource = ds_banks_def
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 47
          Top = 42
          Width = 313
          Height = 14
          DataField = 'ADDRESS'
          DataSource = ds_banks_def
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText3: TDBText
          Left = 397
          Top = 44
          Width = 119
          Height = 14
          DataField = 'BIK'
          DataSource = ds_banks_def
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 364
          Top = 44
          Width = 22
          Height = 13
          Caption = #1041#1048#1050
        end
        object Label16: TLabel
          Left = 8
          Top = 43
          Width = 34
          Height = 13
          Caption = #1040#1076#1088#1077#1089':'
        end
        object Label24: TLabel
          Left = 20
          Top = 65
          Width = 21
          Height = 13
          Caption = #1056'/'#1089':'
        end
        object Label26: TLabel
          Left = 20
          Top = 21
          Width = 21
          Height = 13
          Caption = #1050'/'#1089':'
        end
        object ed_RS: TDBEdit
          Left = 46
          Top = 61
          Width = 313
          Height = 21
          DataField = 'RS'
          DataSource = ds_Predpr
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit14: TDBEdit
          Left = 46
          Top = 15
          Width = 313
          Height = 21
          DataField = 'BANK_KORS'
          DataSource = ds_Predpr
          ReadOnly = True
          TabOrder = 1
        end
      end
      object gb_Rs: TGroupBox
        Left = 0
        Top = 89
        Width = 689
        Height = 356
        Align = alClient
        Caption = ' '#1057#1087#1080#1089#1086#1082' '#1088#1072#1089#1095#1077#1090#1085#1099#1093' '#1089#1095#1077#1090#1086#1074' ('#1090#1086#1083#1100#1082#1086' '#1074' '#1088#1077#1078#1080#1084#1077' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103') '
        Enabled = False
        TabOrder = 1
        object TBDock2: TTBDock
          Left = 2
          Top = 15
          Width = 685
          Height = 26
          object TBToolbar2: TTBToolbar
            Left = 0
            Top = 0
            Caption = 'TBToolbar1'
            DockPos = 0
            Images = f_main.img_Common
            TabOrder = 0
            object TBItem1: TTBItem
              Action = acRSAdd
              DisplayMode = nbdmImageAndText
            end
            object TBItem5: TTBItem
              Action = acRSApply
              DisplayMode = nbdmImageAndText
            end
            object TBItem6: TTBItem
              Action = acRSDel
              DisplayMode = nbdmImageAndText
            end
            object TBItem9: TTBItem
              Action = acRSRefresh
              DisplayMode = nbdmImageAndText
            end
          end
        end
        object gridRS: TDBGridEh
          Left = 2
          Top = 41
          Width = 685
          Height = 313
          Align = alClient
          AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
          DataSource = ds_Rs
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnDblClick = gridRSDblClick
          OnSortMarkingChanged = gridRSSortMarkingChanged
          Columns = <
            item
              AlwaysShowEditButton = True
              ButtonStyle = cbsEllipsis
              EditButtons = <>
              FieldName = 'BANK_KORS'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 161
              OnEditButtonClick = gridRSColumns0EditButtonClick
            end
            item
              EditButtons = <>
              FieldName = 'RS'
              Footers = <>
              Title.TitleButton = True
              Width = 163
            end
            item
              Checkboxes = True
              DblClickNextVal = True
              EditButtons = <>
              FieldName = 'IS_MAIN'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              ReadOnly = True
              Title.TitleButton = True
              Width = 46
            end
            item
              EditButtons = <>
              FieldName = 'BIK'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'BANK_NAME'
              Footers = <>
              Width = 280
            end
            item
              EditButtons = <>
              FieldName = 'POSTINDEX'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'ADDRESS'
              Footers = <>
              Width = 242
            end>
        end
      end
    end
    object tabTerm: TTabSheet
      Caption = #1058#1077#1088#1084#1080#1085#1072#1083#1099
      ImageIndex = 2
      object gb_term_Def: TGroupBox
        Left = 0
        Top = 0
        Width = 689
        Height = 49
        Align = alTop
        Caption = ' '#1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '
        TabOrder = 0
        object Label23: TLabel
          Left = 14
          Top = 20
          Width = 43
          Height = 13
          Caption = #1046'/'#1076' '#1082#1086#1076
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit15: TDBEdit
          Left = 63
          Top = 16
          Width = 106
          Height = 21
          DataField = 'GD_KOD'
          DataSource = ds_Predpr
          ReadOnly = True
          TabOrder = 0
        end
      end
      object gb_Term: TGroupBox
        Left = 0
        Top = 49
        Width = 689
        Height = 396
        Align = alClient
        Caption = ' '#1057#1087#1080#1089#1086#1082' '#1090#1077#1088#1084#1080#1085#1072#1083#1086#1074' ('#1090#1086#1083#1100#1082#1086' '#1074' '#1088#1077#1078#1080#1084#1077' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103')'
        Enabled = False
        TabOrder = 1
        object TBDock3: TTBDock
          Left = 2
          Top = 15
          Width = 685
          Height = 26
          object TBToolbar3: TTBToolbar
            Left = 0
            Top = 0
            Caption = 'TBToolbar1'
            DockPos = 0
            Images = f_main.img_Common
            TabOrder = 0
            object TBItem10: TTBItem
              Action = acTermAdd
              DisplayMode = nbdmImageAndText
            end
            object TBItem11: TTBItem
              Action = acTermApply
              DisplayMode = nbdmImageAndText
            end
            object TBItem12: TTBItem
              Action = acTermDel
              DisplayMode = nbdmImageAndText
            end
            object TBItem13: TTBItem
              Action = acTermRefresh
              DisplayMode = nbdmImageAndText
            end
          end
        end
        object gridTerm: TDBGridEh
          Left = 2
          Top = 41
          Width = 685
          Height = 353
          Align = alClient
          AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
          DataSource = ds_Term
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnDblClick = gridTermDblClick
          OnSortMarkingChanged = gridTermSortMarkingChanged
          Columns = <
            item
              EditButtons = <>
              FieldName = 'STAN_KOD'
              Footers = <>
              ReadOnly = True
            end
            item
              AlwaysShowEditButton = True
              ButtonStyle = cbsEllipsis
              EditButtons = <>
              FieldName = 'STAN_NAME'
              Footers = <>
              ReadOnly = True
              OnEditButtonClick = gridTermColumns1EditButtonClick
            end
            item
              AlwaysShowEditButton = True
              ButtonStyle = cbsEllipsis
              EditButtons = <>
              FieldName = 'VETKA_NAME'
              Footers = <>
              ReadOnly = True
              Width = 194
              OnEditButtonClick = gridTermColumns2EditButtonClick
            end
            item
              Checkboxes = True
              EditButtons = <>
              FieldName = 'IS_MAIN'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              ReadOnly = True
              Width = 47
            end
            item
              EditButtons = <>
              FieldName = 'PREDPR_GDKOD'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'STAN_RAST'
              Footers = <>
              ReadOnly = True
              Width = 47
            end
            item
              EditButtons = <>
              FieldName = 'GDOR_NAME'
              Footers = <>
              ReadOnly = True
            end>
        end
      end
    end
    object tabRoles: TTabSheet
      Caption = #1056#1086#1083#1080
      ImageIndex = 4
      object gb_Roles: TGroupBox
        Left = 0
        Top = 0
        Width = 689
        Height = 445
        Align = alClient
        Caption = ' '#1057#1087#1080#1089#1086#1082' '#1088#1086#1083#1077#1081' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' ('#1090#1086#1083#1100#1082#1086' '#1074' '#1088#1077#1078#1080#1084#1077' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103') '
        Enabled = False
        TabOrder = 0
        object gridRoles: TDBGridEh
          Left = 2
          Top = 41
          Width = 685
          Height = 402
          Align = alClient
          DataSource = ds_Roles
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnDblClick = gridRolesDblClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'CHAR1'
              Footers = <>
              Width = 300
            end
            item
              Checkboxes = True
              EditButtons = <>
              FieldName = 'NUM3'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              Width = 67
            end
            item
              EditButtons = <>
              FieldName = 'NUM4'
              Footers = <>
              Width = 68
            end>
        end
        object TBDock4: TTBDock
          Left = 2
          Top = 15
          Width = 685
          Height = 26
          object TBToolbar4: TTBToolbar
            Left = 0
            Top = 0
            Caption = 'TBToolbar1'
            DockPos = 0
            Images = f_main.img_Common
            TabOrder = 0
            object TBItem15: TTBItem
              Action = acRoleApply
              DisplayMode = nbdmImageAndText
            end
            object TBItem17: TTBItem
              Action = acRoleRefresh
              DisplayMode = nbdmImageAndText
            end
          end
        end
      end
    end
    object tabAkciz: TTabSheet
      Caption = #1040#1082#1094#1080#1079#1085#1099#1077' '#1089#1074#1080#1076'-'#1074#1072
      ImageIndex = 6
      object gb_Akciz_Def: TGroupBox
        Left = 0
        Top = 0
        Width = 689
        Height = 39
        Align = alTop
        Caption = ' '#1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '
        TabOrder = 0
        object cb_Ex_Svid: TDBCheckBox
          Left = 8
          Top = 16
          Width = 209
          Height = 17
          Caption = #1045#1089#1090#1100' '#1072#1082#1094#1080#1079#1085#1086#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086
          DataField = 'EX_SVID'
          DataSource = ds_Predpr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object gb_Akciz: TGroupBox
        Left = 0
        Top = 39
        Width = 689
        Height = 406
        Align = alClient
        Caption = ' '#1057#1087#1080#1089#1086#1082' '#1072#1082#1094#1080#1079#1085#1099#1093' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074' ('#1090#1086#1083#1100#1082#1086' '#1074' '#1088#1077#1078#1080#1084#1077' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103')'
        Enabled = False
        TabOrder = 1
        object gridAkciz: TDBGridEh
          Left = 2
          Top = 41
          Width = 685
          Height = 363
          Align = alClient
          AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
          DataSource = ds_Akciz
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnSortMarkingChanged = gridAkcizSortMarkingChanged
          Columns = <
            item
              EditButtons = <>
              FieldName = 'DATE_BEG'
              Footers = <>
              Title.TitleButton = True
              Width = 77
            end
            item
              EditButtons = <>
              FieldName = 'DATE_END'
              Footers = <>
              Title.TitleButton = True
              Width = 78
            end
            item
              Checkboxes = True
              DblClickNextVal = True
              EditButtons = <>
              FieldName = 'EX_SVID'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              Title.TitleButton = True
              Width = 58
            end
            item
              EditButtons = <>
              FieldName = 'EX_SVID_PREF'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'EX_SVID_NUMB'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'DATE_GIVE'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'DATE_CANCEL'
              Footers = <>
              Title.TitleButton = True
            end
            item
              Checkboxes = True
              DblClickNextVal = True
              EditButtons = <>
              FieldName = 'IS_OPT'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              Title.TitleButton = True
            end
            item
              Checkboxes = True
              DblClickNextVal = True
              EditButtons = <>
              FieldName = 'IS_ROZN'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              Title.TitleButton = True
            end>
        end
        object TBDock5: TTBDock
          Left = 2
          Top = 15
          Width = 685
          Height = 26
          object TBToolbar5: TTBToolbar
            Left = 0
            Top = 0
            Caption = 'TBToolbar1'
            DockPos = 0
            Images = f_main.img_Common
            TabOrder = 0
            object TBItem14: TTBItem
              Action = acAkcizAdd
              DisplayMode = nbdmImageAndText
            end
            object TBItem16: TTBItem
              Action = acAkcizApply
              DisplayMode = nbdmImageAndText
            end
            object TBItem18: TTBItem
              Action = acAkcizDel
              DisplayMode = nbdmImageAndText
            end
            object TBItem19: TTBItem
              Action = acAkcizRefresh
              DisplayMode = nbdmImageAndText
            end
          end
        end
      end
    end
    object tabLinks: TTabSheet
      Caption = #1057#1074#1103#1079#1080
      ImageIndex = 3
      object gb_Links: TGroupBox
        Left = 0
        Top = 0
        Width = 689
        Height = 445
        Align = alClient
        Caption = ' '#1057#1074#1103#1079#1080' '#1089' '#1076#1088#1091#1075#1080#1084#1080' '#1089#1080#1089#1090#1077#1084#1072#1084#1080' ('#1090#1086#1083#1100#1082#1086' '#1074' '#1088#1077#1078#1080#1084#1077' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103') '
        Enabled = False
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 473
    Width = 697
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 40
      Top = 8
      Width = 200
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1081#1090#1080
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 457
      Top = 8
      Width = 200
      Height = 25
      Caption = #1071' '#1087#1077#1088#1077#1076#1091#1084#1072#1083'! <Cancel>'
      TabOrder = 1
      Kind = bkCancel
    end
    object BitBtn3: TBitBtn
      Left = 248
      Top = 8
      Width = 200
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1086#1089#1090#1072#1090#1100#1089#1103
      TabOrder = 2
      OnClick = BitBtn3Click
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
  end
  object q_banks: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_banks')
    QBEDefinition.QBEFieldDefs = {
      0400000006000000040000004B4F52530100000000000900000042414E4B5F4E
      414D450100000000000700000041444452455353010000000000030000004249
      4B01000000000009000000504F5354494E444558010000000000020000004944
      010000000000}
    Session = f_main.ora_Session
    Left = 179
    Top = 416
    object q_banksID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_banksKORS: TStringField
      FieldName = 'KORS'
      Required = True
    end
    object q_banksBIK: TStringField
      FieldName = 'BIK'
      Size = 9
    end
    object q_banksBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Required = True
      Size = 100
    end
    object q_banksPOSTINDEX: TStringField
      FieldName = 'POSTINDEX'
      Size = 6
    end
    object q_banksADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 100
    end
  end
  object ds_bank: TDataSource
    DataSet = q_banks
    Left = 207
    Top = 416
  end
  object q_Region: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_region'
      'ORDER BY REGION_NAME')
    QBEDefinition.QBEFieldDefs = {
      04000000070000000200000049440100000000000B000000524547494F4E5F4E
      414D45010000000000050000004F4B41544F0100000000000A0000004B4F445F
      4D4F53434F570100000000000A00000053484F52545F4E414D45010000000000
      0D0000004B4F445F535441544953544943010000000000090000005354415445
      535F4944010000000000}
    Session = f_main.ora_Session
    Left = 11
    Top = 416
  end
  object ds_Region: TDataSource
    DataSet = q_Region
    Left = 39
    Top = 416
  end
  object q_Holding: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ID,LEVEL, LPAD('#39'        '#39',2*(LEVEL-1))||HOLDING_NAME as H' +
        'OLDING_NAME,BOSS '
      'FROM kls_holding'
      'START WITH BOSS=0'
      'CONNECT BY PRIOR ID=BOSS')
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000C000000484F4C44494E475F
      4E414D4501000000000004000000424F5353010000000000}
    Session = f_main.ora_Session
    Left = 67
    Top = 416
  end
  object ds_Holding: TDataSource
    DataSet = q_Holding
    Left = 95
    Top = 416
  end
  object q_Pertype: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ID,LEVEL, LPAD('#39'        '#39',4*(LEVEL-1))||PERTYPE_NAME as P' +
        'ERTYPE_NAME,BOSS '
      'FROM kls_pertype'
      'START WITH BOSS is NULL'
      'CONNECT BY PRIOR ID=BOSS')
    QBEDefinition.QBEFieldDefs = {
      040000000300000002000000494401000000000004000000424F535301000000
      00000C000000504552545950455F4E414D45010000000000}
    Session = f_main.ora_Session
    Left = 123
    Top = 388
  end
  object ds_pertype: TDataSource
    DataSet = q_Pertype
    Left = 151
    Top = 388
  end
  object ds_Predpr: TDataSource
    DataSet = f_KlsMisc.t_kls
    Left = 392
    Top = 324
  end
  object q_States: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_states'
      'ORDER BY STATE_NAME')
    QBEDefinition.QBEFieldDefs = {
      04000000070000000200000049440100000000000A0000004B4F445F4D4F5343
      4F570100000000000A00000053484F52545F4E414D450100000000000D000000
      4B4F445F5354415449535449430100000000000A00000053544154455F4E414D
      45010000000000070000004E4150525F49440100000000000600000047445F4B
      4F44010000000000}
    Session = f_main.ora_Session
    Left = 11
    Top = 388
  end
  object ds_States: TDataSource
    DataSet = q_States
    Left = 39
    Top = 388
  end
  object q_Class: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_predpr_class'
      'ORDER BY id')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      0000080000004B4F445F53544154010000000000080000004B4F445F4D4F5343
      010000000000}
    Session = f_main.ora_Session
    Left = 123
    Top = 416
  end
  object ds_Class: TDataSource
    DataSet = q_Class
    Left = 151
    Top = 416
  end
  object ds_Contacts: TDataSource
    DataSet = q_Contacts
    Left = 95
    Top = 388
  end
  object TBPopupMenu1: TTBPopupMenu
    Left = 504
    Top = 304
    object TBItem2: TTBItem
      Action = acMemoEdit
    end
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 460
    Top = 300
    StyleName = 'XP Style'
    object acMemoEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      ImageIndex = 7
      OnExecute = acMemoEditExecute
    end
    object acAkcizAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = acAkcizAddExecute
    end
    object acTermAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = acTermAddExecute
    end
    object acRSAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = acRSAddExecute
    end
    object acContactAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = acContactAddExecute
    end
    object acAkcizApply: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      OnExecute = acAkcizApplyExecute
    end
    object acRoleApply: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      OnExecute = acRoleApplyExecute
    end
    object acTermApply: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      OnExecute = acTermApplyExecute
    end
    object acRSApply: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      OnExecute = acRSApplyExecute
    end
    object acContactApply: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      OnExecute = acContactApplyExecute
    end
    object acAkcizDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acAkcizDelExecute
    end
    object acTermDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acTermDelExecute
    end
    object acRSDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acRSDelExecute
    end
    object acContactDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acContactDelExecute
    end
    object acAkcizRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acAkcizRefreshExecute
    end
    object acRoleRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acRoleRefreshExecute
    end
    object acTermRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acTermRefreshExecute
    end
    object acRSRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acRSRefreshExecute
    end
    object acContactRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acContactRefreshExecute
    end
  end
  object q_Contacts: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  KLS_PREDPR_CONTACTS.rowid, '
      '  KLS_PREDPR_CONTACTS.*'
      'FROM KLS_PREDPR_CONTACTS'
      'WHERE KLS_PREDPR_CONTACTS.PREDPR_ID=0'
      'ORDER BY ID')
    QBEDefinition.QBEFieldDefs = {
      0400000013000000020000004944010000000000090000005052454450525F49
      440100000000000700000049535F424F5353010000000000080000004C415354
      4E414D450100000000000900000053484F52544E414D45010000000000090000
      0046495253544E414D450100000000000A0000004D4944444C454E414D450100
      00000000090000004C4153544E414D45310100000000000A0000004649525354
      4E414D45310100000000000B0000004D4944444C454E414D4531010000000000
      090000004C4153544E414D45320100000000000A00000046495253544E414D45
      320100000000000B0000004D4944444C454E414D453201000000000005000000
      50484F4E45010000000000050000005354414646010000000000060000005354
      4146463101000000000006000000535441464632010000000000030000005345
      58010000000000080000004E415F4F534E4F56010000000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'KLS_PREDPR_CONTACTS'
    Session = f_main.ora_Session
    BeforePost = q_ContactsBeforePost
    Left = 67
    Top = 388
    object q_ContactsID: TFloatField
      FieldName = 'ID'
    end
    object IntegerField1: TIntegerField
      FieldName = 'PREDPR_ID'
      Required = True
    end
    object IntegerField2: TIntegerField
      DisplayLabel = #1058#1080#1087
      FieldName = 'IS_BOSS'
    end
    object StringField1: TStringField
      DisplayLabel = #1048#1084#1077#1085#1080#1090#1077#1083#1100#1085#1099#1081' - '#1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LASTNAME'
      Size = 15
    end
    object StringField2: TStringField
      DisplayLabel = #1048#1084#1077#1085#1080#1090#1077#1083#1100#1085#1099#1081' - '#1048'.'#1054'.'
      FieldName = 'SHORTNAME'
      Size = 15
    end
    object StringField3: TStringField
      DisplayLabel = #1048#1084#1077#1085#1080#1090#1077#1083#1100#1085#1099#1081' - '#1048#1084#1103
      FieldName = 'FIRSTNAME'
      Size = 15
    end
    object StringField4: TStringField
      DisplayLabel = #1048#1084#1077#1085#1080#1090#1077#1083#1100#1085#1099#1081' - '#1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'MIDDLENAME'
      Size = 15
    end
    object StringField5: TStringField
      DisplayLabel = #1044#1072#1090#1077#1083#1100#1085#1099#1081' - '#1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LASTNAME1'
      Size = 15
    end
    object StringField6: TStringField
      DisplayLabel = #1044#1072#1090#1077#1083#1100#1085#1099#1081' - '#1048#1084#1103
      FieldName = 'FIRSTNAME1'
      Size = 15
    end
    object StringField7: TStringField
      DisplayLabel = #1044#1072#1090#1077#1083#1100#1085#1099#1081' - '#1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'MIDDLENAME1'
      Size = 15
    end
    object StringField8: TStringField
      DisplayLabel = #1056#1086#1076#1080#1090#1077#1083#1100#1085#1099#1081' - '#1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LASTNAME2'
      Size = 15
    end
    object StringField9: TStringField
      DisplayLabel = #1056#1086#1076#1080#1090#1077#1083#1100#1085#1099#1081' - '#1048#1084#1103
      FieldName = 'FIRSTNAME2'
      Size = 15
    end
    object StringField10: TStringField
      DisplayLabel = #1056#1086#1076#1080#1090#1077#1083#1100#1085#1099#1081' - '#1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'MIDDLENAME2'
      Size = 15
    end
    object StringField11: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'PHONE'
    end
    object StringField12: TStringField
      DisplayLabel = #1048#1084#1077#1085#1080#1090#1077#1083#1100#1085#1099#1081' - '#1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'STAFF'
      Size = 50
    end
    object StringField13: TStringField
      DisplayLabel = #1044#1072#1090#1077#1083#1100#1085#1099#1081' - '#1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'STAFF1'
      Size = 50
    end
    object StringField14: TStringField
      DisplayLabel = #1056#1086#1076#1080#1090#1077#1083#1100#1085#1099#1081' - '#1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'STAFF2'
      Size = 50
    end
    object IntegerField3: TIntegerField
      DisplayLabel = #1055#1086#1083
      FieldName = 'SEX'
    end
    object StringField15: TStringField
      DisplayLabel = #1053#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080
      FieldName = 'NA_OSNOV'
      Size = 100
    end
  end
  object q_Rs: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  KLS_PREDPR_RS.rowid, '
      '  KLS_PREDPR_RS.*'
      'FROM KLS_PREDPR_RS'
      'WHERE KLS_PREDPR_RS.PREDPR_ID=0'
      'ORDER BY ID')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000090000005052454450525F49
      440100000000000800000042414E4B535F494401000000000002000000525301
      00000000000700000049535F4D41494E010000000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'KLS_PREDPR_RS'
    Session = f_main.ora_Session
    BeforePost = q_RsBeforePost
    AfterPost = q_RsAfterPost
    AfterDelete = q_RsAfterDelete
    Left = 179
    Top = 388
    object q_RsID: TFloatField
      FieldName = 'ID'
    end
    object q_RsPREDPR_ID: TFloatField
      FieldName = 'PREDPR_ID'
      Required = True
    end
    object q_RsBANKS_ID: TFloatField
      FieldName = 'BANKS_ID'
      Required = True
    end
    object q_RsRS: TStringField
      DisplayLabel = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
      FieldName = 'RS'
      Required = True
    end
    object q_RsIS_MAIN: TIntegerField
      DisplayLabel = #1054#1089#1085#1086#1074'- '#1085#1086#1081
      FieldName = 'IS_MAIN'
    end
    object q_RsBANK_KORS: TStringField
      DisplayLabel = #1050#1086#1088'.'#1089#1095#1077#1090
      FieldKind = fkLookup
      FieldName = 'BANK_KORS'
      LookupDataSet = q_banks
      LookupKeyFields = 'ID'
      LookupResultField = 'KORS'
      KeyFields = 'BANKS_ID'
      Lookup = True
    end
    object q_RsBANK_NAME: TStringField
      DisplayLabel = #1041#1072#1085#1082
      FieldKind = fkLookup
      FieldName = 'BANK_NAME'
      LookupDataSet = q_banks
      LookupKeyFields = 'ID'
      LookupResultField = 'BANK_NAME'
      KeyFields = 'BANKS_ID'
      Size = 100
      Lookup = True
    end
    object q_RsPOSTINDEX: TStringField
      DisplayLabel = #1055#1086#1095#1090#1086#1074#1099#1081' '#1080#1085#1076#1077#1082#1089
      FieldKind = fkLookup
      FieldName = 'POSTINDEX'
      LookupDataSet = q_banks
      LookupKeyFields = 'ID'
      LookupResultField = 'POSTINDEX'
      KeyFields = 'BANKS_ID'
      Size = 10
      Lookup = True
    end
    object q_RsADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldKind = fkLookup
      FieldName = 'ADDRESS'
      LookupDataSet = q_banks
      LookupKeyFields = 'ID'
      LookupResultField = 'ADDRESS'
      KeyFields = 'BANKS_ID'
      Size = 100
      Lookup = True
    end
    object q_RsBIK: TStringField
      DisplayLabel = #1041#1048#1050
      FieldKind = fkLookup
      FieldName = 'BIK'
      LookupDataSet = q_banks
      LookupKeyFields = 'ID'
      LookupResultField = 'BIK'
      KeyFields = 'BANKS_ID'
      Size = 10
      Lookup = True
    end
  end
  object ds_Rs: TDataSource
    DataSet = q_Rs
    Left = 207
    Top = 388
  end
  object q_cmn: TOracleQuery
    Session = f_main.ora_Session
    Left = 356
    Top = 321
  end
  object q_banks_def: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_banks'
      'WHERE ID=0')
    QBEDefinition.QBEFieldDefs = {
      0400000006000000040000004B4F52530100000000000900000042414E4B5F4E
      414D450100000000000700000041444452455353010000000000030000004249
      4B01000000000009000000504F5354494E444558010000000000020000004944
      010000000000}
    MasterFields = 'BANKS_ID'
    DetailFields = 'ID'
    Session = f_main.ora_Session
    Left = 235
    Top = 416
    object FloatField1: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object StringField16: TStringField
      FieldName = 'KORS'
      Required = True
    end
    object StringField17: TStringField
      FieldName = 'BIK'
      Size = 9
    end
    object StringField18: TStringField
      FieldName = 'BANK_NAME'
      Required = True
      Size = 100
    end
    object StringField19: TStringField
      FieldName = 'POSTINDEX'
      Size = 6
    end
    object StringField20: TStringField
      FieldName = 'ADDRESS'
      Size = 100
    end
  end
  object ds_banks_def: TDataSource
    DataSet = q_banks_def
    Left = 263
    Top = 416
  end
  object q_Term: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  STAN_PREDPR.rowid,'
      '  STAN_PREDPR.*'
      'FROM STAN_PREDPR'
      'WHERE STAN_PREDPR.PREDPR_ID=0'
      'ORDER BY ID')
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000090000005052454450525F49
      440100000000000700000049535F4D41494E010000000000070000005354414E
      5F4944010000000000080000005645544B415F49440100000000000C00000050
      52454450525F47444B4F44010000000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'STAN_PREDPR'
    Session = f_main.ora_Session
    BeforePost = q_TermBeforePost
    AfterPost = q_TermAfterPost
    AfterDelete = q_TermAfterDelete
    Left = 235
    Top = 388
    object q_TermPREDPR_ID: TIntegerField
      FieldName = 'PREDPR_ID'
      Required = True
    end
    object q_TermSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
      Required = True
    end
    object q_TermPREDPR_GDKOD: TStringField
      DisplayLabel = #1046'/'#1076' '#1082#1086#1076' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'PREDPR_GDKOD'
      Size = 12
    end
    object q_TermIS_MAIN: TIntegerField
      DisplayLabel = #1054#1089#1085#1086#1074'- '#1085#1086#1081
      FieldName = 'IS_MAIN'
    end
    object q_TermID: TFloatField
      FieldName = 'ID'
    end
    object q_TermSTAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103
      FieldKind = fkLookup
      FieldName = 'STAN_NAME'
      LookupDataSet = q_Stan
      LookupKeyFields = 'ID'
      LookupResultField = 'STAN_NAME'
      KeyFields = 'STAN_ID'
      Size = 30
      Lookup = True
    end
    object q_TermSTAN_KOD: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldKind = fkLookup
      FieldName = 'STAN_KOD'
      LookupDataSet = q_Stan
      LookupKeyFields = 'ID'
      LookupResultField = 'STAN_KOD'
      KeyFields = 'STAN_ID'
      Lookup = True
    end
    object q_TermGDOR_NAME: TStringField
      DisplayLabel = #1044#1086#1088#1086#1075#1072
      FieldKind = fkLookup
      FieldName = 'GDOR_NAME'
      LookupDataSet = q_Stan
      LookupKeyFields = 'ID'
      LookupResultField = 'GDOR_NAME'
      KeyFields = 'STAN_ID'
      Size = 25
      Lookup = True
    end
    object q_TermSTAN_RAST: TIntegerField
      DisplayLabel = #1056#1072#1089#1089#1090#1086'- '#1103#1085#1080#1077
      FieldKind = fkLookup
      FieldName = 'STAN_RAST'
      LookupDataSet = q_Stan
      LookupKeyFields = 'ID'
      LookupResultField = 'RAST'
      KeyFields = 'STAN_ID'
      Lookup = True
    end
    object q_TermVETKA_NAME: TStringField
      DisplayLabel = #1042#1077#1090#1082#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldKind = fkLookup
      FieldName = 'VETKA_NAME'
      LookupDataSet = q_Vetka
      LookupKeyFields = 'ID'
      LookupResultField = 'VETKA_NAME'
      KeyFields = 'VETKA_ID'
      Size = 50
      Lookup = True
    end
    object q_TermVETKA_ID: TIntegerField
      FieldName = 'VETKA_ID'
    end
  end
  object ds_Term: TDataSource
    DataSet = q_Term
    Left = 263
    Top = 388
  end
  object q_Stan: TOracleDataSet
    SQL.Strings = (
      'SELECT kls_stan.*,kls_gdor.gdor_name FROM kls_stan, kls_gdor'
      'WHERE gdor_id=kls_gdor.id')
    QBEDefinition.QBEFieldDefs = {
      040000000C000000020000004944010000000000080000005354414E5F4B4F44
      010000000000090000005354414E5F4E414D4501000000000009000000415245
      4E5F444159530100000000000400000052415354010000000000090000005245
      47494F4E5F49440100000000000700000047444F525F49440100000000000900
      00004F5444454C454E4945010000000000090000005354415445535F49440100
      000000000900000047444F525F4E414D450100000000000C0000004B5353535F
      5354414E5F4944010000000000070000004953555F4B4F44010000000000}
    Session = f_main.ora_Session
    Active = True
    Left = 291
    Top = 416
    object q_StanSTAN_KOD: TIntegerField
      FieldName = 'STAN_KOD'
      Required = True
    end
    object q_StanID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_StanSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Required = True
      Size = 50
    end
    object q_StanAREN_DAYS: TIntegerField
      FieldName = 'AREN_DAYS'
    end
    object q_StanRAST: TIntegerField
      FieldName = 'RAST'
      Required = True
    end
    object q_StanREGION_ID: TIntegerField
      FieldName = 'REGION_ID'
      Required = True
    end
    object q_StanGDOR_ID: TIntegerField
      FieldName = 'GDOR_ID'
      Required = True
    end
    object q_StanOTDELENIE: TStringField
      FieldName = 'OTDELENIE'
      Size = 2
    end
    object q_StanSTATES_ID: TFloatField
      FieldName = 'STATES_ID'
    end
    object q_StanGDOR_NAME: TStringField
      FieldName = 'GDOR_NAME'
      Required = True
      Size = 25
    end
  end
  object ds_Stan: TDataSource
    DataSet = q_Stan
    Left = 319
    Top = 416
  end
  object q_Vetka: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_vetka')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000200000049440100000000000A0000005645544B415F4E41
      4D45010000000000080000004F574E45525F49440100000000000C0000004953
      5F4155544F5F4C494E4B010000000000}
    Session = f_main.ora_Session
    Left = 291
    Top = 387
    object q_VetkaVETKA_NAME: TStringField
      FieldName = 'VETKA_NAME'
      Required = True
      Size = 50
    end
    object q_VetkaOWNER_ID: TIntegerField
      FieldName = 'OWNER_ID'
    end
    object q_VetkaIS_AUTO_LINK: TFloatField
      FieldName = 'IS_AUTO_LINK'
      Required = True
    end
    object q_VetkaID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object ds_Vetka: TDataSource
    DataSet = q_Vetka
    Left = 319
    Top = 387
  end
  object q_Roles: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  ROWID,'
      '  ID,'
      '  CHAR1,'
      '  NUM2,'
      '  NUM3,'
      '  NUM4 '
      'FROM V_TEMPTABLE'
      'WHERE APP_NAME='#39'MASTER'#39
      'AND UNIT_NAME='#39'PREDPR'#39
      'AND TABLE_NAME='#39'PREDPR_ROLE'#39)
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000050000004348415231010000
      000000040000004E554D32010000000000040000004E554D3301000000000004
      0000004E554D34010000000000}
    UpdatingTable = 'TEMPVARI'
    Session = f_main.ora_Session
    AfterPost = q_RolesAfterPost
    Left = 347
    Top = 387
    object q_RolesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_RolesCHAR1: TStringField
      DisplayLabel = #1056#1086#1083#1100' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      FieldName = 'CHAR1'
      Size = 250
    end
    object q_RolesNUM2: TFloatField
      FieldName = 'NUM2'
    end
    object q_RolesNUM3: TFloatField
      DisplayLabel = #1057#1091#1097#1077#1089#1090#1074#1091#1077#1090
      FieldName = 'NUM3'
    end
    object q_RolesNUM4: TFloatField
      DisplayLabel = #1050#1086#1076' FoxPro'
      FieldName = 'NUM4'
    end
  end
  object ds_Roles: TDataSource
    DataSet = q_Roles
    Left = 375
    Top = 387
  end
  object q_Akciz: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  KLS_PREDPR_AKCIZ.rowid,'
      '  KLS_PREDPR_AKCIZ.*'
      'FROM KLS_PREDPR_AKCIZ'
      'WHERE KLS_PREDPR_AKCIZ.PLAT_ID=0'
      'ORDER BY ID')
    QBEDefinition.QBEFieldDefs = {
      040000000C00000002000000494401000000000007000000504C41545F494401
      000000000008000000444154455F42454701000000000008000000444154455F
      454E440100000000000700000045585F535649440100000000000C0000004558
      5F535649445F505245460100000000000C00000045585F535649445F4E554D42
      0100000000000B000000444154455F43414E43454C0100000000000900000044
      4154455F474956450100000000000600000049535F4F50540100000000000700
      000049535F524F5A4E0100000000000E00000050524F445F47524F5550535F49
      44010000000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'KLS_PREDPR_AKCIZ'
    Session = f_main.ora_Session
    BeforePost = q_AkcizBeforePost
    Left = 483
    Top = 148
    object q_AkcizID: TFloatField
      FieldName = 'ID'
    end
    object q_AkcizPLAT_ID: TFloatField
      FieldName = 'PLAT_ID'
      Required = True
    end
    object q_AkcizDATE_BEG: TDateTimeField
      DisplayLabel = #1057' '#1076#1072#1090#1099
      FieldName = 'DATE_BEG'
      Required = True
    end
    object q_AkcizDATE_END: TDateTimeField
      DisplayLabel = #1055#1086' '#1076#1072#1090#1091
      FieldName = 'DATE_END'
      Required = True
    end
    object q_AkcizEX_SVID: TFloatField
      DisplayLabel = #1045#1089#1090#1100' '#1089#1074#1080#1076'-'#1074#1086
      FieldName = 'EX_SVID'
    end
    object q_AkcizEX_SVID_PREF: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'EX_SVID_PREF'
      Size = 15
    end
    object q_AkcizEX_SVID_NUMB: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'EX_SVID_NUMB'
      Size = 30
    end
    object q_AkcizDATE_CANCEL: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'DATE_CANCEL'
    end
    object q_AkcizDATE_GIVE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      FieldName = 'DATE_GIVE'
    end
    object q_AkcizIS_OPT: TIntegerField
      DisplayLabel = #1054#1087#1090'?'
      FieldName = 'IS_OPT'
    end
    object q_AkcizIS_ROZN: TIntegerField
      DisplayLabel = #1056#1086#1079#1085#1080#1094#1072'?'
      FieldName = 'IS_ROZN'
    end
    object q_AkcizPROD_GROUPS_ID: TFloatField
      FieldName = 'PROD_GROUPS_ID'
    end
  end
  object ds_Akciz: TDataSource
    DataSet = q_Akciz
    Left = 527
    Top = 148
  end
end
