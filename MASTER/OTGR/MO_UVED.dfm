object f_Uved: Tf_Uved
  Left = 234
  Top = 139
  Width = 870
  Height = 640
  Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1086#1073' '#1091#1073#1086#1088#1082#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000EEEEEEE00000E00000EEEEEEEEEEE00000E
    EE000000EEE000000EEEEEEE00000000E0000000EEE0000000EEEEE000000000
    E000000EEEE0000000EEEEE000000000E000000EEEEE000000EEEEE000000000
    E000000EEEEE000000EEEEE000000000E00000EEEEEEE00000EEEEE000000000
    E00000EEEEE0E00000EEEEE000000000E0000EEEEEE0E00000EEEEE000000000
    E0000EEEEE000E0000EEEEE000000000E0000EEEEE000E0000EEEEE000000000
    E000EEEEEE0000E000EEEEE000000000E000EEEEE00000E000EEEEE000000000
    E00EEEEEE00000E000EEEEE000000000E00EEEEE0000000E00EEEEE000000000
    E0EEEEEE0000000E00EEEEE000000000E0EEEEE000000000E0EEEEE000000000
    E0EEEEE000000000E0EEEEE000000000EEEEEEE0000000000EEEEEE00000000E
    EEEEEE00000000000EEEEEEE00000EEEEEEEEE000000000000EEEEEEEE000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFF80FBE003E3F1F80FF7F1FC1FF7E1FC1FF7E0FC1FF7E0
    FC1FF7C07C1FF7C17C1FF7817C1FF783BC1FF783BC1FF703DC1FF707DC1FF607
    DC1FF60FEC1FF40FEC1FF41FF41FF41FF41FF01FF81FE03FF80F803FFC03FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 249
    Width = 862
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clBtnFace
    ParentColor = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 862
    Height = 41
    Align = alTop
    Caption = ' '#1060#1080#1083#1100#1090#1088' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 35
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089
    end
    object Label4: TLabel
      Left = 203
      Top = 18
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object Time1: TDateTimePicker
      Left = 51
      Top = 14
      Width = 68
      Height = 21
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      Kind = dtkTime
      TabOrder = 0
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
    object Date1: TDateTimePicker
      Left = 120
      Top = 14
      Width = 80
      Height = 21
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      TabOrder = 1
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
    object Time2: TDateTimePicker
      Left = 219
      Top = 14
      Width = 67
      Height = 21
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      Kind = dtkTime
      TabOrder = 2
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
    object Date2: TDateTimePicker
      Left = 287
      Top = 14
      Width = 79
      Height = 21
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      TabOrder = 3
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
  end
  object pageTitle: TPageControl
    Left = 0
    Top = 41
    Width = 862
    Height = 208
    ActivePage = tabTitleDetail
    Align = alTop
    TabOrder = 1
    object tabTitleDetail: TTabSheet
      Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
      object TBDock1: TTBDock
        Left = 0
        Top = 0
        Width = 854
        Height = 26
        object TBToolbar1: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          Images = f_main.img_Common
          TabOrder = 0
          object bRefresh: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            ImageIndex = 11
            OnClick = bRefreshClick
          end
          object TBItem2: TTBItem
            Action = acMOUvedEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem1: TTBItem
            Action = acMOUvedDel
            DisplayMode = nbdmImageAndText
          end
          object TBSubmenuItem3: TTBSubmenuItem
            Caption = #1055#1077#1095#1072#1090#1100
            DisplayMode = nbdmImageAndText
            ImageIndex = 6
            Images = f_main.img_Common
            object TBItem6: TTBItem
              Action = acPrintUvedVetl
              DisplayMode = nbdmImageAndText
              Options = [tboDefault]
            end
            object TBItem4: TTBItem
              Action = acPrintUvedLukoma
              DisplayMode = nbdmImageAndText
            end
            object TBItem5: TTBItem
              Action = acPrintUvedMPS
              DisplayMode = nbdmImageAndText
            end
            object TBItem3: TTBItem
              Action = acPrintUvedUnp
              DisplayMode = nbdmImageAndText
            end
            object TBItem7: TTBItem
              Action = acPrintUvedCher
              DisplayMode = nbdmImageAndText
            end
          end
        end
      end
      object GridTitle: TDBGridEh
        Left = 0
        Top = 26
        Width = 854
        Height = 154
        Align = alClient
        DataSource = ds_title
        EvenRowColor = clInfoBk
        Flat = False
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
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind]
        ParentFont = False
        PopupMenu = PopupTitle
        RowSizingAllowed = True
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnExit = GridTitleExit
        OnSortMarkingChanged = GridTitleSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'UVED_NUM'
            Footers = <>
            Title.Caption = #8470' '#1091#1074#1077#1076#1086#1084#1083'.'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'UVED_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = 'MESTO_NAME'
            Footers = <>
            Title.Caption = #1052#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080
            Width = 197
          end
          item
            EditButtons = <>
            FieldName = 'TYPE_OTGR_NAME'
            Footers = <>
            Title.Caption = #1058#1080#1087' '#1086#1090#1075#1088#1091#1079#1082#1080
            Width = 126
          end
          item
            EditButtons = <>
            FieldName = 'LUKOMA_NUM'
            Footers = <>
            Title.Caption = #8470' '#1089#1087#1080#1089#1082#1072' '#1076#1083#1103' '#1086#1093#1088#1072#1085#1099' '#1059#1053#1055' '
            Width = 91
          end
          item
            EditButtons = <>
            FieldName = 'MPS_NUM'
            Footers = <>
            Title.Caption = #8470' '#1072#1082#1090#1072' '#1076#1083#1103' '#1086#1093#1088#1072#1085#1099' '#1056#1046#1044
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'CHER_NUM'
            Footers = <>
            Title.Caption = #8470' '#1088#1077#1077#1089#1090#1088#1072' '#1076#1083#1103' '#1051#1059#1050#1054#1049#1051' - '#1063#1077#1088#1085#1086#1084#1086#1088#1100#1077
            Width = 102
          end
          item
            EditButtons = <>
            FieldName = 'VETL_NUM'
            Footers = <>
            Title.Caption = #8470' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1076#1083#1103' '#1087#1088#1080#1077#1084#1086' '#1089#1076#1072#1090#1095#1080#1082#1086#1074' '#1042#1077#1090#1083#1072#1089#1103#1085#1072
            Width = 118
          end>
      end
    end
    object tabTitleItogs: TTabSheet
      Caption = #1048#1090#1086#1075#1080
      ImageIndex = 1
      object TBDock3: TTBDock
        Left = 0
        Top = 0
        Width = 854
        Height = 26
        object TBToolbar3: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          Images = f_main.img_Common
          TabOrder = 0
          object TBItem20: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            ImageIndex = 11
          end
        end
      end
    end
  end
  object pageRows: TPageControl
    Left = 0
    Top = 254
    Width = 862
    Height = 352
    ActivePage = tabRowsDetail
    Align = alClient
    TabOrder = 2
    object tabRowsDetail: TTabSheet
      Caption = #1055#1086#1079#1080#1094#1080#1080' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      object TBDock5: TTBDock
        Left = 0
        Top = 0
        Width = 854
        Height = 26
        object TBToolbar5: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar2'
          DockPos = -16
          Images = f_main.img_Common
          TabOrder = 0
          object TBItem30: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            ImageIndex = 11
            Images = f_main.img_Common
          end
          object TBItem34: TTBItem
            Action = acMOUvedRowsDel
            DisplayMode = nbdmImageAndText
          end
          object TBItem35: TTBItem
            Caption = 'F10-'#1057#1086#1093#1088#1072#1085#1080#1090#1100
            DisplayMode = nbdmImageAndText
            ImageIndex = 13
            ShortCut = 121
          end
          object TBItem36: TTBItem
            Caption = 'ESC-'#1054#1090#1084#1077#1085#1080#1090#1100
            DisplayMode = nbdmImageAndText
            ImageIndex = 11
          end
        end
      end
      object GridRows: TDBGridEh
        Left = 0
        Top = 26
        Width = 854
        Height = 298
        Align = alClient
        AllowedOperations = [alopUpdateEh, alopAppendEh]
        DataSource = ds_rows
        Flat = False
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
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        FrozenCols = 2
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
        ParentFont = False
        PopupMenu = PopupRows
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnExit = GridRowsExit
        OnSortMarkingChanged = GridRowsSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'UVED_POS'
            Footers = <>
            Width = 31
          end
          item
            EditButtons = <>
            FieldName = 'NUM_CIST'
            Footers = <>
            Title.Caption = #8470' '#1074#1072#1075#1086#1085#1072
          end
          item
            EditButtons = <>
            FieldName = 'NAKL_NUM'
            Footers = <>
            Width = 99
          end
          item
            EditButtons = <>
            FieldName = 'SVED_NUM'
            Footers = <>
            Width = 118
          end
          item
            EditButtons = <>
            FieldName = 'VAG_STATUS_NAME'
            Footers = <>
            Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1074#1072#1075#1086#1085#1072
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = 'FORMNAKL_NAME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'VAGOWNER_NAME'
            Footers = <>
            Width = 138
          end
          item
            EditButtons = <>
            FieldName = 'VAGONTYPE_NAME'
            Footers = <>
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'NCISTDOP'
            Footers = <>
            Title.Caption = #1055#1088#1080#1079#1085#1072#1082' '#1076#1086#1088#1086#1075' '#1057#1053#1043
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'KALIBR_ID'
            Footers = <>
            Title.Caption = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'AXES'
            Footers = <>
            Title.Caption = #1054#1089#1080
            Width = 32
          end
          item
            EditButtons = <>
            FieldName = 'CAPACITY'
            Footers = <>
            Title.Caption = #1043#1088#1091#1079#1086#1087#1086#1076#1098#1077#1084#1085#1086#1089#1090#1100
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'VES_CIST'
            Footers = <>
            Title.Caption = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'VZLIV'
            Footers = <>
            Title.Caption = #1042#1079#1083#1080#1074', '#1089#1084
          end
          item
            EditButtons = <>
            FieldName = 'VOLUME'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1084', '#1089#1084'3'
          end
          item
            EditButtons = <>
            FieldName = 'TEMPER'
            Footers = <>
            Title.Caption = #1058#1077#1084#1087#1077'- '#1088#1072#1090#1091#1088#1072', '#39'C'
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'FAKT_PL'
            Footers = <>
            Title.Caption = #1060#1072#1082#1090'. '#1087#1083#1086#1090#1085#1086#1089#1090#1100
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'VES_ALL'
            Footers = <>
            Title.Caption = #1042#1077#1079' '#1075#1088#1091#1079#1072', '#1074#1072#1075#1086#1085#1072', '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
          end
          item
            EditButtons = <>
            FieldName = 'VES_ED'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'KOL_ED'
            Footers = <>
            Title.Caption = #1050#1086#1083'. '#1077#1076'.'
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'UPAK_VES'
            Footers = <>
            Title.Caption = #1042#1077#1089' '#1074#1089#1077#1081' '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
          end
          item
            EditButtons = <>
            FieldName = 'UPAK_VES_ED'
            Footers = <>
            Title.Caption = #1042#1077#1089' 1 '#1091#1087#1072#1082#1086#1074#1082#1080', '#1082#1075
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'PODDONS'
            Footers = <>
            Title.Caption = #1055#1054#1076#1076#1086#1085#1086#1074', '#1096#1090
          end
          item
            EditButtons = <>
            FieldName = 'PODDON_VES'
            Footers = <>
            Title.Caption = #1042#1077#1089' 1 '#1087#1086#1076#1076#1086#1085#1072', '#1082#1075
          end
          item
            EditButtons = <>
            FieldName = 'SHIELDS'
            Footers = <>
            Title.Caption = #1065#1080#1090#1086#1074', '#1096#1090
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'SHIELD_VES'
            Footers = <>
            Title.Caption = #1042#1077#1089' 1 '#1097#1080#1090#1072', '#1082#1075
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footers = <>
            Title.Caption = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1090#1085
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'KOL_NET'
            Footers = <>
            Title.Caption = #1042#1077#1089' '#1053#1045#1058#1058#1054', '#1090#1085
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'ZPU_TYPE1_NAME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'ZPU_TYPE2_NAME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PLOMBA1'
            Footers = <>
            Title.Caption = #1055#1083#1086#1084#1073#1072' 1'
          end
          item
            EditButtons = <>
            FieldName = 'PLOMBA2'
            Footers = <>
            Title.Caption = #1055#1083#1086#1084#1073#1072' 2'
          end
          item
            EditButtons = <>
            FieldName = 'ROSINSPL1'
            Footers = <>
            Title.Caption = #1055#1083#1086#1084#1073#1072' '#1056#1086#1089#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072#1090#1072' 1'
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'ROSINSPL2'
            Footers = <>
            Title.Caption = #1055#1083#1086#1084#1073#1072' '#1056#1086#1089#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072#1090#1072' 2'
            Width = 103
          end
          item
            EditButtons = <>
            FieldName = 'NAKL_NUM'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'TIP1'
            Footers = <>
            Width = 39
          end
          item
            EditButtons = <>
            FieldName = 'WES1'
            Footers = <>
            Width = 36
          end
          item
            EditButtons = <>
            FieldName = 'SVED_ID'
            Footers = <>
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'BAD_NUM'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            PickList.Strings = (
              #1076#1072
              #1085#1077#1090)
            Title.Caption = #1053#1077#1074#1077#1088#1085#1099#1081' '#1085#1086#1084#1077#1088
          end>
      end
    end
    object tabRowsItogs: TTabSheet
      Caption = #1048#1090#1086#1075#1080' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      ImageIndex = 1
      object TBDock4: TTBDock
        Left = 0
        Top = 0
        Width = 854
        Height = 26
        object TBToolbar4: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar2'
          Images = f_main.img_Common
          TabOrder = 0
          object TBItem21: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            ImageIndex = 11
            Images = f_main.img_Common
          end
        end
      end
    end
  end
  object ActionManager1: TActionManager
    ActionBars.SessionCount = 45
    ActionBars = <
      item
        AutoSize = False
      end
      item
        Items = <
          item
            Caption = '&Common'
          end>
        AutoSize = False
      end>
    Images = f_main.img_Common
    Left = 43
    Top = 165
    StyleName = 'XP Style'
    object acToXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      ImageIndex = 42
      OnExecute = acToXLSExecute
    end
    object acPrintUvedMPS: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1052#1055#1057
      ImageIndex = 27
      OnExecute = acPrintUvedMPSExecte
    end
    object acPrintUvedLukoma: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1051#1091#1082#1086#1084#1040
      ImageIndex = 27
      OnExecute = acPrintUvedLukomaExecute
    end
    object acPrintUvedVetl: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1042#1077#1090#1083#1072#1089#1103#1085
      ImageIndex = 27
      OnExecute = acPrintUvedVetlExecute
    end
    object acMOUvedEdit: TAction
      Category = 'TITLE'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      OnExecute = acMOUvedEditExecute
    end
    object acMOUvedDel: TAction
      Category = 'TITLE'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acMOUvedDelExecute
    end
    object acMOUvedRowsDel: TAction
      Category = 'ROWS'
      Caption = 'F8-'#1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 119
      OnExecute = acMOUvedRowsDelExecute
    end
    object acPrintUvedUnp: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1059#1053#1055
      ImageIndex = 27
      OnExecute = acPrintUvedUnpExecute
    end
    object acPrintUvedCher: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1063#1077#1088#1085#1086#1084#1086#1088#1100#1077
      ImageIndex = 27
      OnExecute = acPrintUvedCherExecute
    end
    object acFilter: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100'...'
      ImageIndex = 9
      OnExecute = acFilterExecute
    end
    object acNoFilter: TAction
      Category = 'FOR_ALL'
      Caption = #1059#1073#1088#1072#1090#1100' '#1086#1090#1073#1086#1088
      ImageIndex = 16
      OnExecute = acNoFilterExecute
    end
    object acMOUvedView: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 1
      OnExecute = acMOUvedViewExecute
    end
  end
  object PopupTitle: TTBPopupMenu
    Images = f_main.img_Common
    Left = 491
    Top = 165
    object TBItem16: TTBItem
      Action = acFilter
    end
    object TBItem17: TTBItem
      Action = acNoFilter
    end
    object tbTitleFilterTitle: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object tbTitleFilterEdit: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object tbTitleFilterSelection: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      ImageIndex = 3
    end
    object tbTitleFilterClear: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 16
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object tbTitleWinEdit: TTBItem
      Caption = #1042' '#1086#1082#1085#1077
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Caption = #1053#1086#1074#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
      DisplayMode = nbdmImageAndText
      ImageIndex = 0
    end
    object TBItem11: TTBItem
      Action = acMOUvedEdit
      DisplayMode = nbdmImageAndText
    end
    object TBItem12: TTBItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      DisplayMode = nbdmImageAndText
      ImageIndex = 4
    end
    object TBItem13: TTBItem
      Action = acMOUvedDel
      DisplayMode = nbdmImageAndText
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBSubmenuItem1: TTBSubmenuItem
      Caption = #1057#1074#1103#1079#1080
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem14: TTBItem
      Action = acPrintUvedUnp
      DisplayMode = nbdmImageAndText
    end
    object TBItem15: TTBItem
      Action = acToXLS
      DisplayMode = nbdmImageAndText
    end
  end
  object PopupRows: TTBPopupMenu
    Images = f_main.img_Common
    Left = 604
    Top = 471
    object tbRowsFilterTitle: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object tbRowsFilterEdit: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object tbRowsFilterSelection: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      ImageIndex = 3
    end
    object tbRowsFilterClear: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 16
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
    object tbRowsWinEdit: TTBItem
      Caption = #1042' '#1086#1082#1085#1077
    end
    object TBSeparatorItem6: TTBSeparatorItem
    end
    object TBItem24: TTBItem
      Caption = 'F2-'#1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1072#1075#1086#1085
      DisplayMode = nbdmImageAndText
      ImageIndex = 0
      ShortCut = 113
    end
    object TBItem25: TTBItem
      Caption = 'F4-'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      DisplayMode = nbdmImageAndText
      ImageIndex = 8
      ShortCut = 115
    end
    object TBItem26: TTBItem
      Caption = 'F6-'#1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      DisplayMode = nbdmImageAndText
      ImageIndex = 4
      ShortCut = 117
    end
    object TBItem19: TTBItem
      Caption = 'F10-'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      ShortCut = 121
    end
    object TBItem27: TTBItem
      Action = acMOUvedRowsDel
      DisplayMode = nbdmImageAndText
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBSubmenuItem2: TTBSubmenuItem
      Caption = #1057#1074#1103#1079#1080
    end
    object TBSeparatorItem8: TTBSeparatorItem
    end
    object TBItem29: TTBItem
      Action = acToXLS
      DisplayMode = nbdmImageAndText
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    Connected = True
    Left = 127
    Top = 161
  end
  object q_title: TOracleDataSet
    SQL.Strings = (
      
        'SELECT /*+ ORDERED USE_NL(s,p,m,pasp,SOBSTV,kls_dog,PLAT,POLUCH,' +
        'STAN,GU12_A,kls_defi_mass)  */'
      '  s.rowid,'
      '  s.ID,'
      '  s.MESTO_ID,'
      '  KLS_MESTO.MESTO_NAME,'
      '  s.LOAD_TYPE_ID,'
      '  KLS_LOAD_TYPE.TYPE_OTGR_NAME,'
      '  s.Uved_NUM,'
      '  s.Uved_DATE,'
      '  s.LUKOMA_NUM,'
      '  s.MPS_NUM,'
      '  s.CHER_NUM,'
      '  s.VETL_NUM'
      'FROM Uved s, KLS_MESTO, KLS_LOAD_TYPE'
      'WHERE s.MESTO_ID=KLS_MESTO.ID(+)'
      '  AND s.LOAD_TYPE_ID=KLS_LOAD_TYPE.ID(+)'
      '  AND s.MESTO_ID=:MESTO_ID AND s.LOAD_TYPE_ID=:LOAD_TYPE_ID'
      
        '/* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' */ AND s.Uved_DATE>=TO_DATE('#39'01.06.2005'#39','#39'dd.m' +
        'm.yyyy'#39')'
      
        '/* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' */ AND s.Uved_DATE<=TO_DATE('#39'31.12.2005'#39','#39'dd.m' +
        'm.yyyy'#39')'
      'ORDER BY Uved_date DESC, Uved_num DESC')
    Variables.Data = {
      0300000002000000090000003A4D4553544F5F49440300000004000000010000
      00000000000D0000003A4C4F41445F545950455F494403000000040000000100
      000000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000B0000000200000049440100000000080000004D4553544F5F494401
      000000000C0000004C4F41445F545950455F494401000000000A0000004D4553
      544F5F4E414D4501000000000E000000545950455F4F5447525F4E414D450100
      00000008000000555645445F4E554D010000000009000000555645445F444154
      4501000000000A0000004C554B4F4D415F4E554D0100000000070000004D5053
      5F4E554D010000000008000000434845525F4E554D0100000000080000005645
      544C5F4E554D0100000000}
    UniqueFields = 'ID'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    UpdatingTable = 'UVED'
    Session = ora_Session
    BeforeOpen = q_titleBeforeOpen
    AfterOpen = q_titleAfterOpen
    AfterScroll = q_titleAfterScroll
    OnFilterRecord = q_titleFilterRecord
    Left = 216
    Top = 176
    object q_titleID: TFloatField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object q_titleMESTO_ID: TFloatField
      FieldName = 'MESTO_ID'
      Required = True
    end
    object q_titleMESTO_NAME: TStringField
      FieldName = 'MESTO_NAME'
      Size = 35
    end
    object q_titleLOAD_TYPE_ID: TFloatField
      FieldName = 'LOAD_TYPE_ID'
      Required = True
    end
    object q_titleTYPE_OTGR_NAME: TStringField
      FieldName = 'TYPE_OTGR_NAME'
      Size = 30
    end
    object q_titleUVED_NUM: TFloatField
      FieldName = 'UVED_NUM'
      Required = True
    end
    object q_titleUVED_DATE: TDateTimeField
      FieldName = 'UVED_DATE'
      Required = True
    end
    object q_titleLUKOMA_NUM: TFloatField
      FieldName = 'LUKOMA_NUM'
    end
    object q_titleMPS_NUM: TFloatField
      FieldName = 'MPS_NUM'
    end
    object q_titleCHER_NUM: TFloatField
      FieldName = 'CHER_NUM'
    end
    object q_titleVETL_NUM: TFloatField
      FieldName = 'VETL_NUM'
    end
  end
  object ds_title: TDataSource
    DataSet = q_title
    Left = 272
    Top = 168
  end
  object q_rows: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ORDERED */'
      'a.*,a.rowid,'
      '(CASE'
      '   WHEN s.SVEDID||'#39' '#39'='#39' '#39' THEN '#39#39
      
        '   ELSE TO_CHAR(s.SVEDNUM)||'#39' '#1086#1090' '#39'||TO_CHAR(s.SVED_DATE,'#39'dd.mm.y' +
        'yyy'#39')'
      ' END) as SVED_NUM,'
      
        ' s.NOM_ZD,p.PROD_NAME,s.PASP_NUM,s.REZ_NUM,s.PASP_DATE,m.DATE_PL' +
        'AN,'
      '(CASE'
      '   WHEN n.NAKLID IS NULL THEN '#39#39
      
        '   ELSE TO_CHAR(n.NAKLNUM)||'#39' '#1086#1090' '#39'||TO_CHAR(n.NAKL_DATE,'#39'dd.mm.y' +
        'yyy hh24:mi:ss'#39')'
      ' END) as NAKL_NUM,'
      ' vt.VAGONTYPE_NAME,'
      ' zt1.ZPU_TYPE1_NAME,'
      ' zt2.ZPU_TYPE2_NAME,'
      ' vo.VAGOWNER_NAME,'
      ' vs.VAG_STATUS_NAME,'
      ' fn.FORMNAKL_NAME'
      'FROM REESTR a,'
      
        '   (SELECT ID as SVEDID,SVED_NUM as SVEDNUM,SVED_DATE,NOM_ZD,PRO' +
        'D_ID_NPR,PASP_ID,PASP_NUM,REZ_NUM,PASP_DATE FROM SVED) s,'
      
        '   (SELECT ID as NAKLID,NAKL_NUM as NAKLNUM,NAKL_DATE FROM NAKL)' +
        ' n,'
      '   (SELECT ID_NPR,ABBR_NPR as PROD_NAME FROM KLS_PROD) p,'
      '   (SELECT NOM_ZD as MON_NOM_ZD, DATE_PLAN FROM MONTH) m,'
      
        '   (SELECT ID as VAGTYPE_ID, ABBR_NAME AS VAGONTYPE_NAME FROM KL' +
        'S_VAGONTYPE) vt,'
      
        '   (SELECT ID as ZPU_TYPE1_ID, NAME as ZPU_TYPE1_NAME FROM KLS_Z' +
        'PU_TYPES) zt1,'
      
        '   (SELECT ID as ZPU_TYPE2_ID, NAME as ZPU_TYPE2_NAME FROM KLS_Z' +
        'PU_TYPES) zt2,'
      
        '   (SELECT ID as VO_ID, DISPLAY_NAME as VAGOWNER_NAME FROM KLS_V' +
        'AGOWNER) vo,'
      
        '   (SELECT ID as VS_ID, NAME as VAG_STATUS_NAME FROM KLS_VAG_STA' +
        'TUS) vs,'
      
        '   (SELECT ID as FN_ID, FORM_NAME as FORMNAKL_NAME FROM KLS_FORM' +
        'NAKL) fn '
      'WHERE a.UVED_ID=:UVED_ID'
      '  AND a.SVED_ID=s.SVEDID AND s.NOM_ZD=m.MON_NOM_ZD(+)'
      '  AND s.PROD_ID_NPR=p.ID_NPR(+)'
      '  AND a.NAKL_ID=n.NAKLID(+)'
      '  AND a.VAGONTYPE_ID=vt.VAGTYPE_ID(+)'
      '  AND a.ZPU_TYPE1=zt1.ZPU_TYPE1_ID(+)'
      '  AND a.ZPU_TYPE2=zt2.ZPU_TYPE2_ID(+)'
      '  AND a.VAGOWNER_ID=vo.VO_ID(+)'
      '  AND a.VAG_STATUS_ID=vs.VS_ID(+)'
      '  AND a.FORMNAKL_ID=fn.FN_ID(+)'
      'ORDER BY a.UVED_POS'
      '')
    Variables.Data = {
      0300000001000000080000003A555645445F4944040000000000000000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      03000000470000000200000049440100000000080000004E554D5F4349535401
      00000000090000004B414C4942525F494401000000000C0000005641474F4E54
      5950455F49440100000000080000005645535F4349535401000000000B000000
      5641474F574E45525F4944010000000008000000434150414349545901000000
      00080000004E43495354444F500100000000040000004158455301000000000C
      0000005645544B415F504F445F494401000000000D0000005645544B415F4E41
      50525F494401000000000D0000005641475F5354415455535F49440100000000
      07000000535645445F4944010000000008000000535645445F504F5301000000
      000E0000005645445F504F445F524F575F494401000000000400000057455331
      0100000000040000005449503101000000000C0000005645544B415F4F54505F
      4944010000000005000000565A4C495601000000000600000054454D50455201
      000000000700000046414B545F504C0100000000030000005645530100000000
      070000004B4F4C5F4E45540100000000070000005645535F414C4C0100000000
      060000005645535F45440100000000060000004B4F4C5F454401000000000700
      00005550414B5F49440100000000080000005550414B5F56455301000000000B
      0000005550414B5F5645535F4544010000000007000000504F44444F4E530100
      0000000A000000504F44444F4E5F564553010000000007000000534849454C44
      5301000000000A000000534849454C445F5645530100000000090000005A5055
      5F54595045310100000000090000005A50555F54595045320100000000070000
      00504C4F4D424131010000000007000000504C4F4D4241320100000000090000
      00524F53494E53504C31010000000009000000524F53494E53504C3201000000
      000B0000004E41525F4C494E455F49440100000000080000004E554D5F50524F
      5001000000000A00000046494F5F4452495645520100000000070000004E414B
      4C5F494401000000000B000000464F524D4E414B4C5F49440100000000080000
      004E554D5F4B564954010000000009000000444154455F4B5649540100000000
      05000000544152494601000000000B00000054415249465F4755415244010000
      000006000000564F4C554D450100000000070000004241445F4E554D01000000
      0007000000474F53545F494401000000000400000043544C5601000000000800
      0000564F4C554D4531350100000000080000004E414B4C5F504F530100000000
      07000000555645445F4944010000000008000000555645445F504F5301000000
      000700000049535F4155544F010000000008000000535645445F4E554D010000
      0000060000004E4F4D5F5A4401000000000900000050524F445F4E414D450100
      00000008000000504153505F4E554D01000000000700000052455A5F4E554D01
      0000000009000000504153505F44415445010000000009000000444154455F50
      4C414E0100000000080000004E414B4C5F4E554D01000000000E000000564147
      4F4E545950455F4E414D4501000000000E0000005A50555F54595045315F4E41
      4D4501000000000E0000005A50555F54595045325F4E414D4501000000000D00
      00005641474F574E45525F4E414D4501000000000F0000005641475F53544154
      55535F4E414D4501000000000D000000464F524D4E414B4C5F4E414D45010000
      0000}
    AutoCalcFields = False
    UniqueFields = 'ID'
    Master = q_title
    MasterFields = 'ID'
    DetailFields = 'UVED_ID'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'REESTR'
    Session = ora_Session
    AfterDelete = q_rowsAfterDelete
    OnFilterRecord = q_rowsFilterRecord
    Left = 24
    Top = 370
    object q_rowsID: TFloatField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object q_rowsSVED_ID: TStringField
      FieldName = 'SVED_ID'
      ReadOnly = True
      Required = True
      Size = 9
    end
    object q_rowsSVED_POS: TIntegerField
      FieldName = 'SVED_POS'
    end
    object q_rowsVED_POD_ROW_ID: TFloatField
      FieldName = 'VED_POD_ROW_ID'
    end
    object q_rowsNUM_CIST: TStringField
      FieldName = 'NUM_CIST'
      Required = True
      Size = 10
    end
    object q_rowsNCISTDOP: TIntegerField
      FieldName = 'NCISTDOP'
    end
    object q_rowsAXES: TIntegerField
      FieldName = 'AXES'
    end
    object q_rowsCAPACITY: TStringField
      FieldName = 'CAPACITY'
      Size = 10
    end
    object q_rowsWES1: TStringField
      FieldName = 'WES1'
      Size = 5
    end
    object q_rowsVES_CIST: TFloatField
      FieldName = 'VES_CIST'
    end
    object q_rowsVAGONTYPE_ID: TFloatField
      FieldName = 'VAGONTYPE_ID'
    end
    object q_rowsKALIBR_ID: TStringField
      FieldName = 'KALIBR_ID'
      Size = 5
    end
    object q_rowsTIP1: TStringField
      FieldName = 'TIP1'
      Size = 5
    end
    object q_rowsVAGOWNER_ID: TFloatField
      FieldName = 'VAGOWNER_ID'
    end
    object q_rowsVETKA_POD_ID: TFloatField
      FieldName = 'VETKA_POD_ID'
    end
    object q_rowsVETKA_OTP_ID: TFloatField
      FieldName = 'VETKA_OTP_ID'
    end
    object q_rowsVETKA_NAPR_ID: TFloatField
      FieldName = 'VETKA_NAPR_ID'
    end
    object q_rowsVAG_STATUS_ID: TFloatField
      FieldName = 'VAG_STATUS_ID'
      Required = True
    end
    object q_rowsVZLIV: TFloatField
      FieldName = 'VZLIV'
    end
    object q_rowsTEMPER: TFloatField
      FieldName = 'TEMPER'
    end
    object q_rowsFAKT_PL: TFloatField
      FieldName = 'FAKT_PL'
    end
    object q_rowsVES: TFloatField
      FieldName = 'VES'
      Required = True
    end
    object q_rowsKOL_NET: TFloatField
      FieldName = 'KOL_NET'
      Required = True
    end
    object q_rowsVES_ALL: TFloatField
      FieldName = 'VES_ALL'
      Required = True
    end
    object q_rowsVES_ED: TFloatField
      FieldName = 'VES_ED'
      Required = True
    end
    object q_rowsKOL_ED: TIntegerField
      FieldName = 'KOL_ED'
      Required = True
    end
    object q_rowsUPAK_ID: TFloatField
      FieldName = 'UPAK_ID'
    end
    object q_rowsUPAK_VES: TFloatField
      FieldName = 'UPAK_VES'
      Required = True
    end
    object q_rowsUPAK_VES_ED: TFloatField
      FieldName = 'UPAK_VES_ED'
      Required = True
    end
    object q_rowsPODDONS: TIntegerField
      FieldName = 'PODDONS'
      Required = True
    end
    object q_rowsPODDON_VES: TFloatField
      FieldName = 'PODDON_VES'
      Required = True
    end
    object q_rowsSHIELDS: TIntegerField
      FieldName = 'SHIELDS'
      Required = True
    end
    object q_rowsSHIELD_VES: TFloatField
      FieldName = 'SHIELD_VES'
      Required = True
    end
    object q_rowsZPU_TYPE1: TFloatField
      FieldName = 'ZPU_TYPE1'
    end
    object q_rowsZPU_TYPE2: TFloatField
      FieldName = 'ZPU_TYPE2'
    end
    object q_rowsPLOMBA1: TStringField
      FieldName = 'PLOMBA1'
      Size = 15
    end
    object q_rowsPLOMBA2: TStringField
      FieldName = 'PLOMBA2'
      Size = 15
    end
    object q_rowsROSINSPL1: TStringField
      FieldName = 'ROSINSPL1'
      Size = 6
    end
    object q_rowsROSINSPL2: TStringField
      FieldName = 'ROSINSPL2'
      Size = 6
    end
    object q_rowsNAR_LINE_ID: TFloatField
      FieldName = 'NAR_LINE_ID'
    end
    object q_rowsNUM_PROP: TIntegerField
      FieldName = 'NUM_PROP'
    end
    object q_rowsFIO_DRIVER: TStringField
      FieldName = 'FIO_DRIVER'
      Size = 50
    end
    object q_rowsNAKL_ID: TFloatField
      FieldName = 'NAKL_ID'
      ReadOnly = True
    end
    object q_rowsFORMNAKL_ID: TFloatField
      FieldName = 'FORMNAKL_ID'
    end
    object q_rowsFORMNAKL_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'FORMNAKL_NAME'
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'FORMNAKL_ID'
      Size = 30
    end
    object q_rowsNUM_KVIT: TStringField
      FieldName = 'NUM_KVIT'
      Size = 10
    end
    object q_rowsDATE_KVIT: TDateTimeField
      FieldName = 'DATE_KVIT'
    end
    object q_rowsTARIF: TFloatField
      FieldName = 'TARIF'
      Required = True
    end
    object q_rowsTARIF_GUARD: TFloatField
      FieldName = 'TARIF_GUARD'
      Required = True
    end
    object q_rowsVOLUME: TFloatField
      FieldName = 'VOLUME'
      Required = True
    end
    object q_rowsBAD_NUM: TIntegerField
      FieldName = 'BAD_NUM'
      Required = True
    end
    object q_rowsGOST_ID: TIntegerField
      FieldName = 'GOST_ID'
      Required = True
    end
    object q_rowsCTLV: TFloatField
      FieldName = 'CTLV'
      Required = True
    end
    object q_rowsVOLUME15: TIntegerField
      FieldName = 'VOLUME15'
      Required = True
    end
    object q_rowsNAKL_POS: TIntegerField
      FieldName = 'NAKL_POS'
    end
    object q_rowsUVED_ID: TFloatField
      FieldName = 'UVED_ID'
      ReadOnly = True
    end
    object q_rowsUVED_POS: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'UVED_POS'
    end
    object q_rowsIS_AUTO: TIntegerField
      FieldName = 'IS_AUTO'
      Required = True
    end
    object q_rowsSVED_NUM: TStringField
      DisplayLabel = #8470' '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_NUM'
      Size = 54
    end
    object q_rowsNOM_ZD: TStringField
      DisplayLabel = #8470' '#1079#1072#1076#1072#1085#1080#1103
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_rowsPROD_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'PROD_NAME'
    end
    object q_rowsPASP_NUM: TStringField
      DisplayLabel = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP_NUM'
      Size = 15
    end
    object q_rowsREZ_NUM: TStringField
      DisplayLabel = #8470' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072
      FieldName = 'REZ_NUM'
      Size = 15
    end
    object q_rowsPASP_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP_DATE'
    end
    object q_rowsDATE_PLAN: TDateTimeField
      DisplayLabel = #1055#1083#1072#1085#1086#1074#1099#1081' '#1084#1077#1089#1103#1094
      FieldName = 'DATE_PLAN'
    end
    object q_rowsNAKL_NUM: TStringField
      DisplayLabel = #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'NAKL_NUM'
      Size = 63
    end
    object q_rowsVAGONTYPE_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VAGONTYPE_NAME'
      Size = 3
    end
    object q_rowsZPU_TYPE1_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1083#1086#1084#1073#1099' 1'
      FieldName = 'ZPU_TYPE1_NAME'
      Size = 30
    end
    object q_rowsZPU_TYPE2_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1083#1086#1084#1073#1099' 2'
      FieldName = 'ZPU_TYPE2_NAME'
      Size = 30
    end
    object q_rowsVAGOWNER_NAME: TStringField
      DisplayLabel = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VAGOWNER_NAME'
      Size = 50
    end
    object q_rowsVAG_STATUS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VAG_STATUS_NAME'
    end
  end
  object ds_rows: TDataSource
    DataSet = q_rows
    Left = 24
    Top = 424
  end
  object pkgFor_uved: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_UVED'
    Left = 528
    Top = 471
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'pageRows.tabRowsDetail.GridRows.<P>.Columns.ColumnsIndex'
      'pageRows.tabRowsDetail.GridRows.<P>.Columns.<ForAllItems>.Width'
      'pageTitle.<P>.Height'
      'pageTitle.tabTitleDetail.GridTitle.<P>.Columns.ColumnsIndex'
      
        'pageTitle.tabTitleDetail.GridTitle.<P>.Columns.<ForAllItems>.Wid' +
        'th')
    Left = 400
    Top = 168
  end
  object pkgFOR_DOCUMENTS: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_DOCUMENTS'
    Left = 715
    Top = 467
  end
end
