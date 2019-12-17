inherited f_Podacha: Tf_Podacha
  Left = 252
  Top = 173
  Width = 852
  Height = 582
  Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1080' '#1055#1054#1044#1040#1063#1048
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 249
    Width = 844
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
    Width = 844
    Height = 41
    Align = alTop
    Caption = ' '#1060#1080#1083#1100#1090#1088' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103':'
    end
    object Label2: TLabel
      Left = 240
      Top = 18
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object lbProdName: TLabel
      Left = 422
      Top = 16
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1091#1090#1100' '#1087#1086#1075#1088#1091#1079#1082#1080':'
    end
    object Date1: TDateTimePicker
      Left = 155
      Top = 13
      Width = 82
      Height = 22
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      TabOrder = 1
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
    object Date2: TDateTimePicker
      Left = 331
      Top = 13
      Width = 82
      Height = 22
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      TabOrder = 3
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
    object lc_Track: TRxDBLookupCombo
      Left = 506
      Top = 13
      Width = 255
      Height = 21
      DropDownCount = 8
      DisplayEmpty = '< '#1042#1057#1045' >'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = ds_Track
      TabOrder = 4
    end
    object Time1: TDateTimePicker
      Left = 83
      Top = 13
      Width = 70
      Height = 22
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      Kind = dtkTime
      TabOrder = 0
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
    object Time2: TDateTimePicker
      Left = 259
      Top = 13
      Width = 70
      Height = 22
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      Kind = dtkTime
      TabOrder = 2
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
  end
  object pageTitle: TPageControl
    Left = 0
    Top = 41
    Width = 844
    Height = 208
    ActivePage = tabTitleDetail
    Align = alTop
    TabOrder = 1
    object tabTitleDetail: TTabSheet
      Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1080
      object TBDock1: TTBDock
        Left = 0
        Top = 0
        Width = 836
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
          object TBItem3: TTBItem
            Action = acMOPodachaAdd
            DisplayMode = nbdmImageAndText
          end
          object TBItem2: TTBItem
            Action = acMOPodachaEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem4: TTBItem
            Action = acMOPodachaCopy
            DisplayMode = nbdmImageAndText
          end
          object TBItem1: TTBItem
            Action = acMOPodachaDel
            DisplayMode = nbdmImageAndText
          end
          object TBItem10: TTBItem
            Action = acPrint
            DisplayMode = nbdmImageAndText
          end
          object TBItem30: TTBItem
            Action = acMOPodachaToDBF
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object GridTitle: TDBGridEh
        Left = 0
        Top = 26
        Width = 836
        Height = 154
        Align = alClient
        DataSource = ds_title
        EvenRowColor = clInfoBk
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
            FieldName = 'POD_NUM'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.TitleButton = True
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'POD_DATE'
            Footers = <>
            Title.TitleButton = True
            Width = 109
          end
          item
            EditButtons = <>
            FieldName = 'KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'VES_CIST'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'VETKA_OTP_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 188
          end
          item
            EditButtons = <>
            FieldName = 'TECH_TIME'
            Footers = <>
            Title.TitleButton = True
            Width = 107
          end
          item
            EditButtons = <>
            FieldName = 'GOTOV_TIME'
            Footers = <>
            Title.TitleButton = True
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'BEG_NALIV_TIME'
            Footers = <>
            Title.TitleButton = True
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'END_NALIV_TIME'
            Footers = <>
            Title.TitleButton = True
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            Title.TitleButton = True
            Width = 75
          end>
      end
    end
    object tabTitleItogs: TTabSheet
      Caption = #1048#1090#1086#1075#1080
      ImageIndex = 1
      object TBDock3: TTBDock
        Left = 0
        Top = 0
        Width = 834
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
            OnClick = bRefreshClick
          end
        end
      end
    end
  end
  object pageRows: TPageControl
    Left = 0
    Top = 254
    Width = 844
    Height = 294
    ActivePage = tabRowsDetail
    Align = alClient
    TabOrder = 2
    object tabRowsDetail: TTabSheet
      Caption = #1055#1086#1079#1080#1094#1080#1080' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      object TBDock2: TTBDock
        Left = 0
        Top = 0
        Width = 836
        Height = 26
        object TBToolbar2: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar2'
          Images = f_main.img_Common
          TabOrder = 0
          object bRefreshRows: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            ImageIndex = 11
            Images = f_main.img_Common
            OnClick = bRefreshRowsClick
          end
          object TBItem5: TTBItem
            Action = acMOPodachaRowsAdd
            DisplayMode = nbdmImageAndText
          end
          object TBItem6: TTBItem
            Action = acMOPodachaRowsEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem7: TTBItem
            Action = acMOPodachaRowsCopy
            DisplayMode = nbdmImageAndText
          end
          object TBItem8: TTBItem
            Action = acMOPodachaRowsDel
            DisplayMode = nbdmImageAndText
          end
          object TBItem23: TTBItem
            Action = acRowsSprav
            DisplayMode = nbdmImageAndText
          end
          object TBItem18: TTBItem
            Action = acRowsPost
            DisplayMode = nbdmImageAndText
          end
          object TBItem22: TTBItem
            Action = acRowsCancel
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object GridRows: TDBGridEh
        Left = 0
        Top = 52
        Width = 836
        Height = 214
        Align = alClient
        AllowedOperations = [alopUpdateEh, alopAppendEh]
        DataSource = ds_rows
        EvenRowColor = clInfoBk
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
        FrozenCols = 3
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDialogFind]
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
        OnGetCellParams = GridRowsGetCellParams
        OnKeyDown = GridRowsKeyDown
        OnSortMarkingChanged = GridRowsSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'POD_POS'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.TitleButton = True
            Width = 28
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'VAGONTYPE_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 39
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'NUM_CIST'
            Footers = <>
            Title.TitleButton = True
            Width = 63
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'BAD_NUM'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.TitleButton = True
            Width = 20
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'KALIBR_ID'
            Footers = <>
            Title.TitleButton = True
            Width = 39
          end
          item
            Alignment = taRightJustify
            EditButtons = <>
            FieldName = 'CAPACITY'
            Footers = <>
            Title.TitleButton = True
            Width = 53
          end
          item
            EditButtons = <>
            FieldName = 'VES_CIST'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'VAGOWNER_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 182
          end
          item
            EditButtons = <>
            FieldName = 'SVED_NUMDATE'
            Footers = <>
            Width = 117
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'NCISTDOP'
            Footers = <>
            Title.TitleButton = True
            Width = 51
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'AXES'
            Footers = <>
            Title.TitleButton = True
            Width = 26
          end
          item
            EditButtons = <>
            FieldName = 'VZLIV'
            Footers = <>
            Title.TitleButton = True
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'VOLUME'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'TEMPER'
            Footers = <>
            Title.TitleButton = True
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'LAST_PROD_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 116
          end
          item
            ButtonStyle = cbsNone
            EditButtons = <>
            FieldName = 'PROD_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 127
          end
          item
            EditButtons = <>
            FieldName = 'ZPU_TYPE1_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 157
          end
          item
            EditButtons = <>
            FieldName = 'PLOMBA1'
            Footers = <>
            Title.TitleButton = True
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'ROSINSPL1'
            Footers = <>
            Title.TitleButton = True
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'ZPU_TYPE2_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'PLOMBA2'
            Footers = <>
            Title.TitleButton = True
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'ROSINSPL2'
            Footers = <>
            Title.TitleButton = True
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'VAG_STATUS_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'VETKA_POD_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 107
          end
          item
            EditButtons = <>
            FieldName = 'VETKA_NAPR_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 111
          end
          item
            EditButtons = <>
            FieldName = 'VED_OSMOTR_NUM'
            Footers = <>
            Title.TitleButton = True
            Width = 128
          end
          item
            EditButtons = <>
            FieldName = 'VED_POD_ID'
            Footers = <>
            Title.TitleButton = True
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            Title.TitleButton = True
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'VED_POD_NUM'
            Footers = <>
            Title.TitleButton = True
            Width = 129
          end>
      end
      object TBDock5: TTBDock
        Left = 0
        Top = 26
        Width = 836
        Height = 26
        object TBToolbar5: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar2'
          DockPos = -16
          Images = f_main.img_Common
          TabOrder = 0
          object TBItem28: TTBItem
            Action = acMOPodachaRowsAddVedOsm
            DisplayMode = nbdmImageAndText
          end
          object TBItem31: TTBItem
            Action = acMOPodachaMoveVagon
            DisplayMode = nbdmImageAndText
          end
          object TBItem32: TTBItem
            Action = acFind
            DisplayMode = nbdmImageAndText
          end
          object TBItem33: TTBItem
            Action = acLastReis
            DisplayMode = nbdmImageAndText
          end
        end
      end
    end
    object tabRowsItogs: TTabSheet
      Caption = #1048#1090#1086#1075#1080' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      ImageIndex = 1
      object TBDock4: TTBDock
        Left = 0
        Top = 0
        Width = 834
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
            OnClick = bRefreshRowsClick
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
    object acRowsCancel: TAction
      Category = 'FOR_ALL'
      Caption = 'ESC-'#1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 14
      OnExecute = acRowsCancelExecute
    end
    object acRowsPost: TAction
      Category = 'FOR_ALL'
      Caption = 'F10-'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      ShortCut = 121
      OnExecute = acRowsPostExecute
    end
    object acMOPodachaAdd: TAction
      Category = 'TITLE'
      Caption = #1053#1086#1074#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      ImageIndex = 0
      OnExecute = acMOPodachaAddExecute
    end
    object acMOPodachaEdit: TAction
      Category = 'TITLE'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      OnExecute = acMOPodachaEditExecute
    end
    object acMOPodachaCopy: TAction
      Category = 'TITLE'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      OnExecute = acMOPodachaCopyExecute
    end
    object acMOPodachaDel: TAction
      Category = 'TITLE'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acMOPodachaDelExecute
    end
    object acMOPodachaRowsAdd: TAction
      Category = 'ROWS'
      Caption = 'F2-'#1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1072#1075#1086#1085
      ImageIndex = 0
      ShortCut = 113
      OnExecute = acMOPodachaRowsAddExecute
    end
    object acMOPodachaRowsEdit: TAction
      Category = 'ROWS'
      Caption = 'F4-'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      ShortCut = 115
      OnExecute = acMOPodachaRowsEditExecute
    end
    object acMOPodachaRowsCopy: TAction
      Category = 'ROWS'
      Caption = 'F6-'#1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      ShortCut = 117
      OnExecute = acMOPodachaRowsCopyExecute
    end
    object acMOPodachaRowsDel: TAction
      Category = 'ROWS'
      Caption = 'F8-'#1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 119
      OnExecute = acMOPodachaRowsDelExecute
    end
    object acPrint: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 6
      OnExecute = acPrintExecute
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
    object acRowsSprav: TAction
      Category = 'FOR_ALL'
      Caption = 'F3-'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      ImageIndex = 30
      ShortCut = 114
      OnExecute = acRowsSpravExecute
    end
    object acMOPodachaRowsAddVedOsm: TAction
      Category = 'ROWS'
      Caption = #1048#1079' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1086#1089#1084#1086#1090#1088#1072
      ImageIndex = 20
      OnExecute = acMOPodachaRowsAddVedOsmExecute
    end
    object acMOPodachaToDBF: TAction
      Category = 'TITLE'
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1085#1072' '#1069#1089#1090#1072#1082#1072#1076#1091
      ImageIndex = 43
      OnExecute = acMOPodachaToDBFExecute
    end
    object acMOPodachaMoveVagon: TAction
      Category = 'ROWS'
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1074#1072#1075#1086#1085
      ImageIndex = 21
      OnExecute = acMOPodachaMoveVagonExecute
    end
    object acFind: TAction
      Category = 'FOR_ALL'
      Caption = 'F5-'#1055#1086#1080#1089#1082
      ImageIndex = 9
      ShortCut = 116
      OnExecute = acFindExecute
    end
    object acLastReis: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' '#1088#1077#1081#1089#1099
      ImageIndex = 22
      OnExecute = acLastReisExecute
    end
  end
  object PopupTitle: TTBPopupMenu
    Images = f_main.img_Common
    Left = 267
    Top = 133
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
      OnAcceptText = tbTitleFilterEditAcceptText
    end
    object tbTitleFilterSelection: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      ImageIndex = 3
      OnClick = tbTitleFilterSelectionClick
    end
    object tbTitleFilterClear: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 16
      OnClick = tbTitleFilterClearClick
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object tbTitleWinEdit: TTBItem
      Caption = #1042' '#1086#1082#1085#1077
      OnClick = tbTitleWinEditClick
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = acMOPodachaAdd
      DisplayMode = nbdmImageAndText
    end
    object TBItem11: TTBItem
      Action = acMOPodachaEdit
      DisplayMode = nbdmImageAndText
    end
    object TBItem12: TTBItem
      Action = acMOPodachaCopy
      DisplayMode = nbdmImageAndText
    end
    object TBItem13: TTBItem
      Action = acMOPodachaDel
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
      Action = acPrint
      DisplayMode = nbdmImageAndText
    end
    object TBItem15: TTBItem
      Action = acToXLS
      DisplayMode = nbdmImageAndText
    end
  end
  object PopupRows: TTBPopupMenu
    Images = f_main.img_Common
    Left = 323
    Top = 413
    object tbRowsFilterTitle: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object tbRowsFilterEdit: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = tbRowsFilterEditAcceptText
    end
    object tbRowsFilterSelection: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      ImageIndex = 3
      OnClick = tbRowsFilterSelectionClick
    end
    object tbRowsFilterClear: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 16
      OnClick = tbRowsFilterClearClick
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
    object tbRowsWinEdit: TTBItem
      Caption = #1042' '#1086#1082#1085#1077
      OnClick = tbRowsWinEditClick
    end
    object TBSeparatorItem6: TTBSeparatorItem
    end
    object TBItem24: TTBItem
      Action = acMOPodachaRowsAdd
      DisplayMode = nbdmImageAndText
    end
    object TBItem25: TTBItem
      Action = acMOPodachaRowsEdit
      DisplayMode = nbdmImageAndText
    end
    object TBItem26: TTBItem
      Action = acMOPodachaRowsCopy
      DisplayMode = nbdmImageAndText
    end
    object TBItem19: TTBItem
      Action = acRowsPost
    end
    object TBItem27: TTBItem
      Action = acMOPodachaRowsDel
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
    Left = 103
    Top = 137
  end
  object q_title: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '  a.*, '
      '  b.VETKA_NAME as VETKA_OTP_NAME'
      
        'FROM VED_POD a, (SELECT ID as VETKA_ID,VETKA_NAME FROM KLS_VETKA' +
        '_OTP) b'
      
        'WHERE a.VETKA_OTP_ID=b.VETKA_ID AND a.MESTO_ID=:MESTO_ID AND a.L' +
        'OAD_TYPE_ID=:LOAD_TYPE_ID'
      '  AND ((1=1'
      '  AND 1=1 /* '#1089' '#1076#1072#1090#1099' */'
      '  AND 1=1 /* '#1087#1086' '#1076#1072#1090#1091' */'
      '  AND 1=1 /* '#1074#1077#1090#1082#1072' */'
      '  AND 1=1'
      '  AND 1=1'
      '  AND 1=1'
      '  AND 1=1'
      '  AND 1=1'
      '  ) OR (a.ID=:TITLE_ID))'
      'ORDER BY pod_date DESC, pod_num DESC')
    Variables.Data = {
      0300000003000000090000003A4D4553544F5F49440300000004000000010000
      00000000000D0000003A4C4F41445F545950455F494403000000040000000100
      000000000000090000003A5449544C455F494404000000080000000000000000
      00000000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000D0000000200000049440100000000080000004D4553544F5F494401
      000000000A000000474F544F565F54494D4501000000000E0000004245475F4E
      414C49565F54494D4501000000000E000000454E445F4E414C49565F54494D45
      01000000000C0000004C4F41445F545950455F494401000000000C0000005645
      544B415F4F54505F4944010000000007000000504F445F4E554D010000000008
      000000504F445F44415445010000000009000000544543485F54494D45010000
      0000030000004B4F4C0100000000080000005645535F4349535401000000000E
      0000005645544B415F4F54505F4E414D450100000000}
    UniqueFields = 'ID'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    UpdatingTable = 'VED_POD'
    Session = ora_Session
    Active = True
    BeforeOpen = q_titleBeforeOpen
    AfterOpen = q_titleAfterOpen
    AfterScroll = q_titleAfterScroll
    OnFilterRecord = q_titleFilterRecord
    Left = 248
    Top = 160
    object q_titleID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_titleMESTO_ID: TFloatField
      FieldName = 'MESTO_ID'
      Required = True
    end
    object q_titleLOAD_TYPE_ID: TFloatField
      FieldName = 'LOAD_TYPE_ID'
      Required = True
    end
    object q_titleVETKA_OTP_ID: TFloatField
      FieldName = 'VETKA_OTP_ID'
      Required = True
    end
    object q_titlePOD_NUM: TFloatField
      DisplayLabel = #8470' '#1074#1077#1076#1086'- '#1084#1086#1089#1090#1080
      FieldName = 'POD_NUM'
      Required = True
    end
    object q_titlePOD_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      FieldName = 'POD_DATE'
      Required = True
    end
    object q_titleTECH_TIME: TDateTimeField
      DisplayLabel = #1058#1077#1093#1085#1080#1095#1077#1089#1082#1072#1103' '#1075#1086#1076#1085#1086#1089#1090#1100
      FieldName = 'TECH_TIME'
    end
    object q_titleGOTOV_TIME: TDateTimeField
      DisplayLabel = #1050#1086#1084#1084#1077#1088#1095#1077#1089#1082#1072#1103' '#1075#1086#1076#1085#1086#1089#1090#1100
      FieldName = 'GOTOV_TIME'
    end
    object q_titleBEG_NALIV_TIME: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1085#1072#1083#1080#1074#1072
      FieldName = 'BEG_NALIV_TIME'
    end
    object q_titleEND_NALIV_TIME: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1085#1072#1083#1080#1074#1072
      FieldName = 'END_NALIV_TIME'
    end
    object q_titleKOL: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074#1072#1075#1086#1085#1086#1074
      FieldName = 'KOL'
      Required = True
    end
    object q_titleVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1072#1075#1086#1085#1086#1074' ('#1090#1072#1088#1072')'
      FieldName = 'VES_CIST'
      Required = True
    end
    object q_titleVETKA_OTP_NAME: TStringField
      DisplayLabel = #1055#1091#1090#1100' '#1087#1086#1075#1088#1091#1079#1082#1080
      FieldName = 'VETKA_OTP_NAME'
      Required = True
      Size = 40
    end
  end
  object ds_title: TDataSource
    DataSet = q_title
    Left = 288
    Top = 160
  end
  object q_rows: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      'a.*,a.rowid,'
      'p.ID_NPR as LAST_PROD_ID_NPR,'
      
        'Trim(FOR_CIST.LAST_PROD_DATE(:POD_DATE,a.NUM_CIST,:MESTO_ID,:LOA' +
        'D_TYPE_ID)||'#39'-'#39'||p.ABBR_NPR) as LAST_PROD_NAME,'
      '(CASE'
      '   WHEN d.VED_OSMOTR_ID IS NULL THEN '#39#39
      
        '   ELSE TO_CHAR(d.VED_NUM)||'#39' '#1086#1090' '#39'||TO_CHAR(d.VED_DATE,'#39'dd.mm.yy' +
        'yy'#39')'
      ' END) as VED_OSMOTR_NUM,'
      '(CASE'
      '   WHEN s.SVED_ID IS NULL THEN '#39#39
      
        '   ELSE TO_CHAR(s.SVED_NUM)||'#39' '#1086#1090' '#39'||TO_CHAR(s.SVED_DATE,'#39'dd.mm.' +
        'yyyy'#39')'
      ' END) as SVED_NUMDATE,'
      ':POD_NUM||'#39' '#1086#1090' '#39'||TO_CHAR(:POD_DATE,'#39'dd.mm.yyyy'#39') as VED_POD_NUM'
      'FROM VED_POD_ROW a,'
      '     (SELECT ID_NPR,ABBR_NPR FROM KLS_PROD) p,'
      
        '     (SELECT ID as VED_OSMOTR_ROW_ID,VED_ID as VED_OSMOTR_ID FRO' +
        'M VED_OSMOTR_ROW) c,'
      
        '  '#9' (SELECT ID as VED_OSMOTR_ID, VED_NUM, VED_DATE FROM VED_OSMO' +
        'TR) d,'
      '  '#9' (SELECT ID as SVED_ID, SVED_NUM, SVED_DATE FROM SVED) s,'
      '  '#9' (SELECT VED_POD_ROW_ID, SVED_ID FROM REESTR) r'
      'WHERE a.VED_POD_ID=:VED_POD_ID'
      
        '  AND a.VED_OSMOTR_ROW_ID=c.VED_OSMOTR_ROW_ID(+) AND c.VED_OSMOT' +
        'R_ID=d.VED_OSMOTR_ID(+)'
      '  AND a.ID=r.VED_POD_ROW_ID(+) AND r.SVED_ID=s.SVED_ID(+)'
      
        '  AND FOR_CIST.LAST_PROD_ID_NPR(:POD_DATE,a.NUM_CIST,:MESTO_ID,:' +
        'LOAD_TYPE_ID)=p.ID_NPR(+)'
      'ORDER BY a.POD_POS')
    Variables.Data = {
      03000000050000000B0000003A5645445F504F445F4944040000000800000000
      000000F02E184100000000090000003A504F445F444154450C00000000000000
      00000000090000003A4D4553544F5F49440400000000000000000000000D0000
      003A4C4F41445F545950455F4944040000000000000000000000080000003A50
      4F445F4E554D040000000000000000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      03000000200000000200000049440100000000080000004E554D5F4349535401
      00000000090000004B414C4942525F494401000000000C0000005641474F4E54
      5950455F49440100000000080000005645535F4349535401000000000B000000
      5641474F574E45525F4944010000000008000000434150414349545901000000
      000A0000005645445F504F445F4944010000000007000000504F445F504F5301
      000000000B00000052415A4D45545F464143540100000000080000004E434953
      54444F500100000000040000004158455301000000000C0000005645544B415F
      504F445F494401000000000D0000005645544B415F4E4150525F494401000000
      000D0000005641475F5354415455535F494401000000000B00000050524F445F
      49445F4E5052010000000005000000565A4C495601000000000600000054454D
      504552010000000006000000564F4C554D450100000000070000004241445F4E
      554D0100000000090000005A50555F54595045310100000000090000005A5055
      5F5459504532010000000007000000504C4F4D42413101000000000700000050
      4C4F4D424132010000000009000000524F53494E53504C310100000000090000
      00524F53494E53504C320100000000110000005645445F4F534D4F54525F524F
      575F49440100000000100000004C4153545F50524F445F49445F4E5052010000
      00000E0000004C4153545F50524F445F4E414D4501000000000E000000564544
      5F4F534D4F54525F4E554D01000000000B0000005645445F504F445F4E554D01
      000000000C000000535645445F4E554D444154450100000000}
    UniqueFields = 'ID'
    Master = q_title
    MasterFields = 'ID'
    DetailFields = 'VED_POD_ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'VED_POD_ROW'
    Session = ora_Session
    BeforeOpen = q_rowsBeforeOpen
    AfterInsert = q_rowsAfterInsert
    BeforePost = q_rowsBeforePost
    AfterPost = q_rowsAfterPost
    AfterDelete = q_rowsAfterDelete
    BeforeScroll = q_rowsBeforeScroll
    AfterScroll = q_rowsAfterScroll
    OnFilterRecord = q_rowsFilterRecord
    Left = 280
    Top = 472
    object q_rowsID: TFloatField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object q_rowsVED_POD_ID: TFloatField
      FieldName = 'VED_POD_ID'
      ReadOnly = True
      Required = True
    end
    object q_rowsPOD_POS: TFloatField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'POD_POS'
    end
    object q_rowsRAZMET_FACT: TStringField
      DisplayLabel = #1056#1072#1079#1084#1077#1090#1082#1072' '#1087#1086#1076' '#1075#1088#1091#1079
      FieldName = 'RAZMET_FACT'
      Size = 30
    end
    object q_rowsNUM_CIST: TStringField
      DisplayLabel = #8470' '#1074#1072#1075#1086#1085#1072
      FieldName = 'NUM_CIST'
      Required = True
      OnChange = q_rowsNUM_CISTChange
      Size = 10
    end
    object q_rowsNCISTDOP: TIntegerField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1076#1086#1088#1086#1075' '#1057#1053#1043
      FieldName = 'NCISTDOP'
    end
    object q_rowsAXES: TIntegerField
      DisplayLabel = #1054#1089#1080
      FieldName = 'AXES'
    end
    object q_rowsCAPACITY: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086'- '#1087#1086#1076#1098#1077#1084'- '#1085#1086#1089#1090#1100
      FieldName = 'CAPACITY'
      Size = 10
    end
    object q_rowsVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VES_CIST'
    end
    object q_rowsVAGONTYPE_ID: TFloatField
      FieldName = 'VAGONTYPE_ID'
    end
    object q_rowsVAGONTYPE_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1074#1072#1075#1086'- '#1085#1072
      FieldKind = fkLookup
      FieldName = 'VAGONTYPE_NAME'
      LookupDataSet = q_VagonType
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VAGONTYPE_ID'
      Lookup = True
    end
    object q_rowsKALIBR_ID: TStringField
      DisplayLabel = #1058#1080#1087' '#1074#1072#1075#1086'- '#1085#1072
      FieldName = 'KALIBR_ID'
      Size = 5
    end
    object q_rowsVAGOWNER_ID: TFloatField
      FieldName = 'VAGOWNER_ID'
    end
    object q_rowsVAGOWNER_NAME: TStringField
      DisplayLabel = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1074#1072#1075#1086#1085#1072
      FieldKind = fkLookup
      FieldName = 'VAGOWNER_NAME'
      LookupDataSet = q_VagOwner
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VAGOWNER_ID'
      Size = 50
      Lookup = True
    end
    object q_rowsVETKA_POD_ID: TFloatField
      FieldName = 'VETKA_POD_ID'
    end
    object q_rowsVETKA_POD_NAME: TStringField
      DisplayLabel = #1055#1091#1090#1100' '#1087#1086#1076#1072#1095#1080
      FieldKind = fkLookup
      FieldName = 'VETKA_POD_NAME'
      LookupDataSet = q_VetkaPod
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VETKA_POD_ID'
      Lookup = True
    end
    object q_rowsVETKA_NAPR_ID: TFloatField
      FieldName = 'VETKA_NAPR_ID'
    end
    object q_rowsVETKA_NAPR_NAME: TStringField
      DisplayLabel = #1055#1091#1090#1100' '#1074#1099#1074#1086#1076#1072
      FieldKind = fkLookup
      FieldName = 'VETKA_NAPR_NAME'
      LookupDataSet = q_VetkaNapr
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VETKA_NAPR_ID'
      Lookup = True
    end
    object q_rowsVAG_STATUS_ID: TFloatField
      FieldName = 'VAG_STATUS_ID'
    end
    object q_rowsVAG_STATUS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldKind = fkLookup
      FieldName = 'VAG_STATUS_NAME'
      LookupDataSet = q_VagStatus
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VAG_STATUS_ID'
      Lookup = True
    end
    object q_rowsPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 5
    end
    object q_rowsPROD_NAME: TStringField
      DisplayLabel = #1055#1086#1076' '#1082#1072#1082#1086#1081' '#1087#1088#1086#1076#1091#1082#1090' '#1087#1088#1080#1075#1086#1076#1077#1085
      FieldKind = fkLookup
      FieldName = 'PROD_NAME'
      LookupDataSet = q_Prod
      LookupKeyFields = 'ID_NPR'
      LookupResultField = 'NAME_NPR'
      KeyFields = 'PROD_ID_NPR'
      Size = 40
      Lookup = True
    end
    object q_rowsVZLIV: TFloatField
      DisplayLabel = #1042#1079#1083#1080#1074
      FieldName = 'VZLIV'
    end
    object q_rowsTEMPER: TFloatField
      DisplayLabel = #1058#1077#1084#1087#1077'- '#1088#1072#1090#1091#1088#1072
      FieldName = 'TEMPER'
    end
    object q_rowsVOLUME: TFloatField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'VOLUME'
      ReadOnly = True
    end
    object q_rowsBAD_NUM: TIntegerField
      DisplayLabel = '?'
      FieldName = 'BAD_NUM'
      ReadOnly = True
    end
    object q_rowsZPU_TYPE1: TFloatField
      FieldName = 'ZPU_TYPE1'
    end
    object q_rowsZPU_TYPE2: TFloatField
      FieldName = 'ZPU_TYPE2'
    end
    object q_rowsPLOMBA1: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1072' 1'
      FieldName = 'PLOMBA1'
      Size = 15
    end
    object q_rowsPLOMBA2: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1072' 2'
      FieldName = 'PLOMBA2'
      Size = 15
    end
    object q_rowsROSINSPL1: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1072' '#1056#1086#1089#1080#1085#1089#1087#1077#1082'- '#1090#1086#1088#1072#1090#1072' 1'
      FieldName = 'ROSINSPL1'
      Size = 15
    end
    object q_rowsROSINSPL2: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1072' '#1056#1086#1089#1080#1085#1089#1087#1077#1082'- '#1090#1086#1088#1072#1090#1072' 2'
      FieldName = 'ROSINSPL2'
      Size = 15
    end
    object q_rowsZPU_TYPE1_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1083#1086#1084#1073#1099' 1'
      FieldKind = fkLookup
      FieldName = 'ZPU_TYPE1_NAME'
      LookupDataSet = q_ZpuType1
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ZPU_TYPE1'
      Size = 30
      Lookup = True
    end
    object q_rowsZPU_TYPE2_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1083#1086#1084#1073#1099' 2'
      FieldKind = fkLookup
      FieldName = 'ZPU_TYPE2_NAME'
      LookupDataSet = q_ZpuType2
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ZPU_TYPE2'
      Size = 30
      Lookup = True
    end
    object q_rowsVED_OSMOTR_ROW_ID: TFloatField
      FieldName = 'VED_OSMOTR_ROW_ID'
      ReadOnly = True
    end
    object q_rowsLAST_PROD_ID_NPR: TStringField
      FieldName = 'LAST_PROD_ID_NPR'
      ReadOnly = True
      Size = 5
    end
    object q_rowsLAST_PROD_NAME: TStringField
      DisplayLabel = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1075#1088#1091#1079
      FieldName = 'LAST_PROD_NAME'
      ReadOnly = True
      Size = 32
    end
    object q_rowsVED_OSMOTR_NUM: TStringField
      DisplayLabel = #1057#1074#1103#1079#1072#1085' '#1089' '#1074#1077#1076#1086#1084#1086#1089#1090#1100#1102' '#1086#1089#1084#1086#1090#1088#1072
      FieldName = 'VED_OSMOTR_NUM'
      ReadOnly = True
      Size = 54
    end
    object q_rowsVED_POD_NUM: TStringField
      DisplayLabel = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086#1076#1072#1095#1080
      FieldName = 'VED_POD_NUM'
      ReadOnly = True
      Size = 54
    end
    object q_rowsSVED_NUMDATE: TStringField
      DisplayLabel = #1057#1074#1077#1076#1077#1085#1080#1077
      FieldName = 'SVED_NUMDATE'
      ReadOnly = True
      Size = 54
    end
  end
  object ds_rows: TDataSource
    DataSet = q_rows
    Left = 320
    Top = 472
  end
  object pkgFOR_PODACHA: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_PODACHA'
    Left = 168
    Top = 407
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
    Left = 384
    Top = 144
  end
  object q_Track: TOracleDataSet
    SQL.Strings = (
      'select'
      '  ID,'
      '  VETKA_NAME as NAME'
      'from KLS_VETKA_OTP'
      'where load_type_id=:LOAD_TYPE_ID'
      'ORDER BY 1')
    Variables.Data = {
      03000000010000000D0000003A4C4F41445F545950455F494403000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Left = 147
    Top = 129
    object q_TrackID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_TrackNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 40
    end
  end
  object ds_Track: TDataSource
    DataSet = q_Track
    Left = 195
    Top = 133
  end
  object q_VagonType: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  a.ID,'
      '  a.ABBR_NAME as NAME'
      'from kls_vagontype a'
      'where a.id<>0'
      'ORDER BY a.ID')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Active = True
    Left = 395
    Top = 345
    object q_VagonTypeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_VagonTypeNAME: TStringField
      FieldName = 'NAME'
      Size = 3
    end
  end
  object q_Prod: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  kls_prod.ID_NPR,'
      '  kls_prod.NAME_NPR as NAME_NPR'
      'from kls_prod'
      'ORDER BY ID_NPR')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E50520100000000080000004E414D455F
      4E50520100000000}
    Session = ora_Session
    Active = True
    Left = 395
    Top = 441
    object q_ProdID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object q_ProdNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
  end
  object q_VagOwner: TOracleDataSet
    SQL.Strings = (
      'select '
      '  ID,'
      '  kls_vagowner.DISPLAY_NAME as NAME,'
      '  sortby'
      'from kls_vagowner'
      'where LOAD_TYPE_ID=:LOAD_TYPE_ID and (id=0 or SOBSTV_ID<>0)'
      'ORDER BY sortby'
      '')
    Variables.Data = {
      03000000010000000D0000003A4C4F41445F545950455F494403000000040000
      000100000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000040000004E414D450100000000
      06000000534F525442590100000000}
    Session = ora_Session
    Active = True
    Left = 475
    Top = 345
    object q_VagOwnerID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_VagOwnerNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object q_VagOwnerSORTBY: TFloatField
      FieldName = 'SORTBY'
    end
  end
  object q_VetkaPod: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  a.ID,'
      '  a.SHORT_NAME as NAME'
      'from kls_vetka_otp a'
      'where id>=100'
      'ORDER BY a.ID')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Active = True
    Left = 475
    Top = 393
    object q_VetkaPodID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_VetkaPodNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 10
    end
  end
  object q_VetkaNapr: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  a.ID,'
      '  a.SHORT_NAME as NAME'
      'from kls_vetka_otp a'
      'where id>=100'
      'ORDER BY a.ID')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Active = True
    Left = 467
    Top = 441
    object q_VetkaNaprID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_VetkaNaprNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 10
    end
  end
  object q_VagStatus: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  a.ID,'
      '  a.NAME as NAME'
      'from kls_vag_status a'
      'ORDER BY a.ID')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Active = True
    Left = 555
    Top = 369
    object FloatField1: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NAME'
      Required = True
    end
  end
  object pkgFOR_CIST: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_CIST'
    Left = 48
    Top = 407
  end
  object q_ZpuType1: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  a.ID,'
      '  a.NAME as NAME'
      'from kls_zpu_types a '
      'ORDER BY a.ID')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Active = True
    Left = 659
    Top = 369
    object q_ZpuType1ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_ZpuType1NAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
  end
  object q_ZpuType2: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  a.ID,'
      '  a.NAME as NAME'
      'from kls_zpu_types a '
      'ORDER BY a.ID')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Active = True
    Left = 723
    Top = 369
    object q_ZpuType2ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_ZpuType2NAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
  end
  object q_Ved: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      
        '  '#39#1042#1077#1076#1086#1084#1086#1089#1090#1100' '#8470' '#39'||TO_NCHAR(VED_OSMOTR.VED_NUM)||'#39', '#39'||TO_CHAR(VE' +
        'D_DATE) as TreeNode1 /* '#1055#1091#1090#1100' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1076#1083#1103' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103' '#1076#1077#1088#1077#1074#1072'*/,'
      
        '  VED_OSMOTR_ROW.VED_ID as VED_OSMOTR_ID /* ID '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1086#1089#1084#1086#1090#1088#1072 +
        ' */,'
      
        '  VED_OSMOTR_ROW.ID as VED_OSMOTR_ROW_ID /* ID '#1087#1086#1079#1080#1094#1080#1080' '#1074#1077#1076#1086#1084#1086#1089#1090#1080 +
        ' '#1086#1089#1084#1086#1090#1088#1072' */,'
      '  VED_OSMOTR.VED_NUM /* '#8470' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1086#1089#1084#1086#1090#1088#1072' */,'
      '  VED_OSMOTR.VED_DATE /* '#1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1086#1089#1084#1086#1090#1088#1072' */,'
      '  VED_OSMOTR_ROW.POD_POS /* '#8470' '#1087'/'#1087' */,'
      
        '  '#39#1074#1072#1075#1086#1085' '#8470' '#39'||VED_OSMOTR_ROW.NUM_CIST as TreeChild1/*'#1042#1072#1075#1086#1085' '#1076#1083#1103' '#1087 +
        #1086#1089#1090#1088#1086#1077#1085#1080#1103' '#1076#1077#1088#1077#1074#1072'*/,'
      '  VED_OSMOTR_ROW.NUM_CIST /* '#8470' '#1074#1072#1075#1086#1085#1072' */,'
      '  VED_OSMOTR_ROW.KALIBR_ID /* '#1090#1080#1087' '#1074#1072#1075#1086#1085#1072' */,'
      
        '  VED_OSMOTR_ROW.RAZMET_PER as RAZMET, /* '#1056#1072#1079#1084#1077#1090#1082#1072' '#1074#1072#1075#1086#1085#1072' '#1087#1086#1076' '#1087#1088 +
        #1086#1076#1091#1082#1090' */'
      
        '  '#39#1042#1077#1076#1086#1084#1086#1089#1090#1100' '#8470' '#39'||TO_NCHAR(VED_OSMOTR.VED_NUM)||'#39', '#39'||TO_CHAR(VE' +
        'D_DATE)||'#39#1074#1072#1075#1086#1085' '#8470' '#39'||VED_OSMOTR_ROW.NUM_CIST as LookUp/*'#1082#1083#1102#1095' '#1076#1083#1103 +
        ' '#1087#1086#1080#1089#1082#1072'*/'
      'FROM VED_OSMOTR,VED_OSMOTR_ROW,KLS_PROD prod_v'
      'WHERE VED_OSMOTR_ROW.VAG_STATUS_ID=0 AND '
      '  VED_OSMOTR_ROW.VED_ID=VED_OSMOTR.ID AND'
      '  VED_OSMOTR_ROW.PROD_ID_NPR=prod_v.ID_NPR(+) AND'
      '  VED_OSMOTR.VED_DATE>=TRUNC(:FROM_DATE) AND'
      '  VED_OSMOTR.VED_DATE<:POD_DATE+1 AND'
      '  /* '#1059#1089#1083#1086#1074#1080#1103', '#1089#1074#1103#1079#1072#1085#1085#1099#1077' '#1089' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086#1076#1072#1095#1080' */'
      
        '  VED_OSMOTR.LOAD_TYPE_ID=:LOAD_TYPE_ID AND /* '#1090#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088#1086#1074 +
        #1082#1080' */'
      '--  VED_OSMOTR.MESTO_ID=:MESTO_ID AND /* '#1084#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080' */'
      
        '  (NOT EXISTS (SELECT NULL FROM VED_POD_ROW WHERE VED_OSMOTR_ROW' +
        '_ID=VED_OSMOTR_ROW.ID)) /* '#1042#1072#1075#1086#1085' '#1080#1079' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1086#1089#1084#1086#1090#1088#1072' '#1077#1097#1077' '#1085#1077' '#1074#1082#1083 +
        #1102#1095#1077#1085' '#1074' '#1082#1072#1082#1091#1102'-'#1083#1080#1073#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086#1076#1072#1095#1080' */'
      '  and NOT EXISTS (select NULL'
      '                from ved_pod aa, ved_pod_row bb'
      '               where bb.VED_POD_ID=aa.id'
      '                 and aa.LOAD_TYPE_ID=:LOAD_TYPE_ID'
      '        '#9#9#9#9' and bb.NUM_CIST=VED_OSMOTR_ROW.NUM_CIST'
      '                 and aa.POD_DATE>=TRUNC(:FROM_DATE)'
      '                 and aa.POD_DATE<:POD_DATE+1'
      #9#9#9#9'         and aa.POD_DATE>VED_OSMOTR.VED_DATE)'
      
        'ORDER BY VED_OSMOTR.VED_DATE, VED_OSMOTR.VED_NUM, VED_OSMOTR_ROW' +
        '.POD_POS, VED_OSMOTR_ROW.NUM_CIST')
    Variables.Data = {
      03000000030000000D0000003A4C4F41445F545950455F494403000000000000
      00000000000A0000003A46524F4D5F444154450C000000000000000000000009
      0000003A504F445F444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000B00000007000000504F445F504F530100000000080000004E554D5F
      434953540100000000090000004B414C4942525F494401000000000600000052
      415A4D455401000000000A000000545245454348494C44310100000000060000
      004C4F4F4B55500100000000110000005645445F4F534D4F54525F524F575F49
      440100000000070000005645445F4E554D0100000000080000005645445F4441
      544501000000000D0000005645445F4F534D4F54525F49440100000000090000
      00545245454E4F4445310100000000}
    Session = ora_Session
    Left = 776
    Top = 368
    object q_VedTREENODE1: TStringField
      FieldName = 'TREENODE1'
      Size = 148
    end
    object q_VedVED_OSMOTR_ID: TFloatField
      FieldName = 'VED_OSMOTR_ID'
      Required = True
    end
    object q_VedVED_OSMOTR_ROW_ID: TFloatField
      FieldName = 'VED_OSMOTR_ROW_ID'
      Required = True
    end
    object q_VedVED_NUM: TFloatField
      FieldName = 'VED_NUM'
      Required = True
    end
    object q_VedVED_DATE: TDateTimeField
      FieldName = 'VED_DATE'
      Required = True
    end
    object q_VedPOD_POS: TFloatField
      FieldName = 'POD_POS'
    end
    object q_VedTREECHILD1: TStringField
      FieldName = 'TREECHILD1'
      Size = 18
    end
    object q_VedNUM_CIST: TStringField
      FieldName = 'NUM_CIST'
      Required = True
      Size = 10
    end
    object q_VedKALIBR_ID: TStringField
      FieldName = 'KALIBR_ID'
      Size = 5
    end
    object q_VedRAZMET: TStringField
      FieldName = 'RAZMET'
      Size = 50
    end
    object q_VedLOOKUP: TStringField
      FieldName = 'LOOKUP'
      Size = 216
    end
  end
  object ds_Ved: TDataSource
    DataSet = q_Ved
    Left = 776
    Top = 426
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 328
    Top = 344
  end
  object q_cist_deni: TOracleDataSet
    SQL.Strings = (
      'select * from kls_cist_deni'
      'where num_cist=:NUM_CIST'
      'order by beg_deni desc')
    Variables.Data = {
      0300000001000000090000003A4E554D5F434953540500000000000000000000
      00}
    Session = ora_Session
    Left = 584
    Top = 439
  end
end
