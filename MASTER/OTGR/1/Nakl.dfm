inherited f_Sved: Tf_Sved
  Left = 244
  Top = 196
  Width = 865
  Height = 587
  Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086#1073' '#1086#1090#1075#1088#1091#1079#1082#1077
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 261
    Width = 857
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
    Width = 857
    Height = 53
    Align = alTop
    TabOrder = 0
    DesignSize = (
      857
      53)
    object lbProdName: TLabel
      Left = 479
      Top = 24
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1088#1086#1076#1091#1082#1090':'
    end
    object lc_Prod: TRxDBLookupCombo
      Left = 528
      Top = 21
      Width = 320
      Height = 21
      DropDownCount = 8
      DisplayEmpty = '< '#1042#1057#1045' >'
      Anchors = [akLeft, akTop, akRight]
      LookupField = 'ID_NPR'
      LookupDisplay = 'NAME_NPR'
      LookupSource = ds_Prod
      TabOrder = 0
    end
    object rg_KindOfDate: TRadioGroup
      Left = 2
      Top = 7
      Width = 124
      Height = 44
      Caption = ' '#1060#1080#1083#1100#1090#1088' '
      ItemIndex = 1
      Items.Strings = (
        #1055#1086' '#1076#1072#1090#1077' '#1087#1086#1076#1072#1095#1080
        #1055#1086' '#1076#1072#1090#1077' '#1089#1074#1077#1076#1077#1085#1080#1103)
      TabOrder = 1
    end
    object GroupBox2: TGroupBox
      Left = 131
      Top = 7
      Width = 342
      Height = 44
      TabOrder = 2
      object Label3: TLabel
        Left = 9
        Top = 18
        Width = 6
        Height = 13
        Caption = #1089
      end
      object Label4: TLabel
        Left = 171
        Top = 18
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Time2: TDateTimePicker
        Left = 187
        Top = 14
        Width = 67
        Height = 21
        Date = 37088.641009456000000000
        Time = 37088.641009456000000000
        Kind = dtkTime
        TabOrder = 0
      end
      object Time1: TDateTimePicker
        Left = 19
        Top = 14
        Width = 68
        Height = 21
        Date = 37088.641009456000000000
        Time = 37088.641009456000000000
        Kind = dtkTime
        TabOrder = 1
      end
      object Date2: TDateTimePicker
        Left = 255
        Top = 14
        Width = 79
        Height = 21
        Date = 37088.641009456000000000
        Time = 37088.641009456000000000
        TabOrder = 2
      end
      object Date1: TDateTimePicker
        Left = 88
        Top = 14
        Width = 80
        Height = 21
        Date = 37088.641009456000000000
        Time = 37088.641009456000000000
        TabOrder = 3
      end
    end
  end
  object pageTitle: TPageControl
    Left = 0
    Top = 53
    Width = 857
    Height = 208
    ActivePage = tabTitleDetail
    Align = alTop
    TabOrder = 1
    object tabTitleDetail: TTabSheet
      Caption = #1057#1074#1077#1076#1077#1085#1080#1103
      object TBDock1: TTBDock
        Left = 0
        Top = 0
        Width = 849
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
            Action = acMOSvedAdd
            DisplayMode = nbdmImageAndText
          end
          object TBItem2: TTBItem
            Action = acMOSvedEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem4: TTBItem
            Action = acMOSvedCopy
            DisplayMode = nbdmImageAndText
          end
          object TBItem1: TTBItem
            Action = acMOSvedDel
            DisplayMode = nbdmImageAndText
          end
          object TBItem10: TTBItem
            Action = acPrint
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object GridTitle: TDBGridEh
        Left = 0
        Top = 26
        Width = 849
        Height = 154
        Align = alClient
        DataSource = ds_title
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
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind]
        ParentFont = False
        PopupMenu = PopupTitle
        ReadOnly = True
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
        OnGetCellParams = GridTitleGetCellParams
        OnSortMarkingChanged = GridTitleSortMarkingChanged
        Columns = <
          item
            Checkboxes = False
            EditButtons = <>
            Footers = <>
            Title.Caption = #8470' '#1087'/'#1087
            Width = 29
          end
          item
            EditButtons = <>
            FieldName = 'SVED_NUM'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SVED_DATE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SVED_PROD_NAME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SVED_NOM_ZD'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SVED_VES'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SVED_CNT'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'VES_CIST'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'KOL_NET'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'VES_ALL'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'STAN_KOD'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'STAN_NAME'
            Footers = <>
            Width = 201
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_NAME'
            Footers = <>
            Width = 365
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_GD_KOD'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_OKPO'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'POD_DATE'
            Footers = <>
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TECH_TIME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'GOTOV_TIME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'BEG_NALIV_TIME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'END_NALIV_TIME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'DATE_OFORML'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SVED_PASP_NUM'
            Footers = <>
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'SVED_REZ_NUM'
            Footers = <>
            Width = 86
          end
          item
            EditButtons = <>
            FieldName = 'SVED_PASP_DATE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'IS_EXP'
            Footers = <>
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'NOM_ETRAN'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SOBSTV_NAME'
            Footers = <>
            Width = 197
          end
          item
            EditButtons = <>
            FieldName = 'DOG_NUMBER'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PLAT_NAME'
            Footers = <>
            Width = 296
          end
          item
            EditButtons = <>
            FieldName = 'PL20'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PL15'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'P_SER'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'T_VSP'
            Footers = <>
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'P_VOD'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'P_DIRT'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'P_SOL'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'MG_SOL'
            Footers = <>
            Width = 73
          end
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SVED_ID_NPR'
            Footers = <>
          end>
      end
    end
    object tabTitleItogs: TTabSheet
      Caption = #1048#1090#1086#1075#1080
      ImageIndex = 1
      object TBDock3: TTBDock
        Left = 0
        Top = 0
        Width = 849
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
    Top = 266
    Width = 857
    Height = 287
    ActivePage = tabRowsDetail
    Align = alClient
    TabOrder = 2
    object tabRowsDetail: TTabSheet
      Caption = #1055#1086#1079#1080#1094#1080#1080' '#1089#1074#1077#1076#1077#1085#1080#1103
      object TBDock2: TTBDock
        Left = 0
        Top = 26
        Width = 849
        Height = 26
        object TBToolbar2: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar2'
          DockPos = -16
          Images = f_main.img_Common
          TabOrder = 0
          object TBItem5: TTBItem
            Action = acMOSvedAddress
            DisplayMode = nbdmImageAndText
          end
          object TBItem6: TTBItem
            Action = acMOSvedAddVagons
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object GridRows: TDBGridEh
        Left = 0
        Top = 52
        Width = 849
        Height = 207
        Align = alClient
        AllowedOperations = [alopUpdateEh, alopAppendEh]
        DataSource = ds_rows
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
        OnCellClick = GridRowsCellClick
        OnExit = GridRowsExit
        OnKeyDown = GridRowsKeyDown
        OnSortMarkingChanged = GridRowsSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'SVED_POS'
            Footers = <>
            Width = 31
          end
          item
            EditButtons = <>
            FieldName = 'NUM_CIST'
            Footers = <>
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'Vybor'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            PickList.Strings = (
              '1'
              '0')
            Title.Caption = #1042#1099#1073#1086#1088
            Width = 42
          end
          item
            EditButtons = <>
            FieldName = 'VED_POD_NUM'
            Footers = <>
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'VAG_STATUS_NAME'
            Footers = <>
            Width = 74
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
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'KALIBR_ID'
            Footers = <>
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'AXES'
            Footers = <>
            Width = 32
          end
          item
            EditButtons = <>
            FieldName = 'CAPACITY'
            Footers = <>
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'VES_CIST'
            Footers = <>
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'VAGOWNER_NAME'
            Footers = <>
            Width = 138
          end
          item
            EditButtons = <>
            FieldName = 'NARIAD_NUM'
            Footers = <>
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = 'VZLIV'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'VOLUME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'TEMPER'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'FAKT_PL'
            Footers = <>
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'VES_ALL'
            Footers = <>
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
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'UPAK_NAME'
            Footers = <>
            Width = 175
          end
          item
            EditButtons = <>
            FieldName = 'UPAK_VES'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'UPAK_VES_ED'
            Footers = <>
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'PODDONS'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PODDON_VES'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'SHIELDS'
            Footers = <>
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'SHIELD_VES'
            Footers = <>
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footers = <>
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'KOL_NET'
            Footers = <>
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
          end
          item
            EditButtons = <>
            FieldName = 'PLOMBA2'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'ROSINSPL1'
            Footers = <>
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'ROSINSPL2'
            Footers = <>
            Width = 103
          end
          item
            EditButtons = <>
            FieldName = 'VETKA_POD_NAME'
            Footers = <>
            Width = 124
          end
          item
            EditButtons = <>
            FieldName = 'VETKA_OTP_NAME'
            Footers = <>
            Width = 115
          end
          item
            EditButtons = <>
            FieldName = 'VETKA_NAPR_NAME'
            Footers = <>
            Width = 112
          end
          item
            EditButtons = <>
            FieldName = 'FORMNAKL_NAME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NAKL_NUM'
            Footers = <>
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
      object TBDock5: TTBDock
        Left = 0
        Top = 0
        Width = 849
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
            OnClick = bRefreshRowsClick
          end
          object TBItem31: TTBItem
            Action = acMOSvedRowsAdd
            DisplayMode = nbdmImageAndText
          end
          object TBItem32: TTBItem
            Action = acMOSvedRowsEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem33: TTBItem
            Action = acMOSvedRowsCopy
            DisplayMode = nbdmImageAndText
          end
          object TBItem34: TTBItem
            Action = acMOSvedRowsDel
            DisplayMode = nbdmImageAndText
          end
          object TBItem35: TTBItem
            Action = acRowsPost
            DisplayMode = nbdmImageAndText
          end
          object TBItem36: TTBItem
            Action = acRowsCancel
            DisplayMode = nbdmImageAndText
          end
          object TBItem37: TTBItem
            Action = acMOSvedRowsCalc
            DisplayMode = nbdmImageAndText
          end
        end
      end
    end
    object tabRowsItogs: TTabSheet
      Caption = #1048#1090#1086#1075#1080' '#1089#1074#1077#1076#1077#1085#1080#1103
      ImageIndex = 1
      object TBDock4: TTBDock
        Left = 0
        Top = 0
        Width = 849
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
      ImageIndex = 11
      OnExecute = acRowsCancelExecute
    end
    object acRowsPost: TAction
      Category = 'FOR_ALL'
      Caption = 'F10-'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      ShortCut = 121
      OnExecute = acRowsPostExecute
    end
    object acMOSvedAdd: TAction
      Category = 'TITLE'
      Caption = #1053#1086#1074#1086#1077' '#1089#1074#1077#1076#1077#1085#1080#1077
      ImageIndex = 0
      OnExecute = acMOSvedAddExecute
    end
    object acMOSvedEdit: TAction
      Category = 'TITLE'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      OnExecute = acMOSvedEditExecute
    end
    object acMOSvedCopy: TAction
      Category = 'TITLE'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      OnExecute = acMOSvedCopyExecute
    end
    object acMOSvedDel: TAction
      Category = 'TITLE'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acMOSvedDelExecute
    end
    object acMOSvedRowsAdd: TAction
      Category = 'ROWS'
      Caption = 'F2-'#1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1072#1075#1086#1085
      ImageIndex = 0
      ShortCut = 113
      OnExecute = acMOSvedRowsAddExecute
    end
    object acMOSvedRowsEdit: TAction
      Category = 'ROWS'
      Caption = 'F4-'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      ShortCut = 115
      OnExecute = acMOSvedRowsEditExecute
    end
    object acMOSvedRowsCopy: TAction
      Category = 'ROWS'
      Caption = 'F6-'#1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      ShortCut = 117
      OnExecute = acMOSvedRowsCopyExecute
    end
    object acMOSvedRowsDel: TAction
      Category = 'ROWS'
      Caption = 'F8-'#1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 119
      OnExecute = acMOSvedRowsDelExecute
    end
    object acPrint: TAction
      Category = 'FOR_ALL'
      Caption = 'CTRL+F6-'#1055#1077#1095#1072#1090#1100
      ImageIndex = 6
      ShortCut = 16501
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
    object acMOSvedRowsCalc: TAction
      Category = 'ROWS'
      Caption = 'F9-'#1056#1072#1089#1089#1095#1080#1090#1072#1090#1100
      ImageIndex = 37
      ShortCut = 120
      OnExecute = acMOSvedRowsCalcExecute
    end
    object acMOSvedAddVagons: TAction
      Category = 'ROWS'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1072#1075#1086#1085#1099' '#1080#1079' '#1074#1077#1076'.'
      ImageIndex = 20
      ShortCut = 16497
      OnExecute = acMOSvedAddVagonsExecute
    end
    object acMOSvedAddress: TAction
      Category = 'ROWS'
      Caption = #1040#1076#1088#1077#1089#1072#1094#1080#1103'\'#1087#1077#1088#1077#1072#1076#1088#1077#1089#1072#1094#1080#1103
      ImageIndex = 51
      OnExecute = acMOSvedAddressExecute
    end
  end
  object PopupTitle: TTBPopupMenu
    Images = f_main.img_Common
    Left = 267
    Top = 109
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
      Action = acMOSvedAdd
      DisplayMode = nbdmImageAndText
    end
    object TBItem11: TTBItem
      Action = acMOSvedEdit
      DisplayMode = nbdmImageAndText
    end
    object TBItem12: TTBItem
      Action = acMOSvedCopy
      DisplayMode = nbdmImageAndText
    end
    object TBItem13: TTBItem
      Action = acMOSvedDel
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
    Left = 604
    Top = 471
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
      Action = acMOSvedRowsAdd
      DisplayMode = nbdmImageAndText
    end
    object TBItem25: TTBItem
      Action = acMOSvedRowsEdit
      DisplayMode = nbdmImageAndText
    end
    object TBItem26: TTBItem
      Action = acMOSvedRowsCopy
      DisplayMode = nbdmImageAndText
    end
    object TBItem19: TTBItem
      Action = acRowsPost
    end
    object TBItem27: TTBItem
      Action = acMOSvedRowsDel
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
      
        'SELECT /*+ ORDERED USE_NL(s,p,m,pasp,SOBSTV,kls_dog,PLAT,POLUCH,' +
        'STAN,GU12_A,kls_defi_mass)  */'
      '  s.ID, s.SVED_NUM, s.SVED_DATE, s.MESTO_ID,s.LOAD_TYPE_ID,'
      
        '  s.POD_DATE, s.TECH_TIME, s.GOTOV_TIME, s.BEG_NALIV_TIME, s.END' +
        '_NALIV_TIME, s.DATE_OFORML,'
      
        '  s.SVED_VES, s.SVED_CNT, s.VES_CIST, s.KOL_NET, s.VES_ALL, s.DE' +
        'FI_MASS_ID, KLS_DEFI_MASS.NAME as DEFI_MASS_NAME,'
      '  s.PASP_ID, s.PROD_ID_NPR as SVED_ID_NPR,'
      '  p.NAME_NPR as SVED_PROD_NAME,'
      
        '  s.PASP_NUM as SVED_PASP_NUM, s.REZ_NUM as SVED_REZ_NUM, s.PASP' +
        '_DATE as SVED_PASP_DATE,'
      
        '  s.NOM_ZD as SVED_NOM_ZD, s.CENA as SVED_CENA, s.CENA_OTP as SV' +
        'ED_CENA_OTP, s.DATE_CENA as SVED_DATE_CENA, m.IS_EXP, m.TEX_PD_I' +
        'D, GU12_A.NOM_Z as NOM_ETRAN,'
      '  SOBSTV.SF_NAME as SOBSTV_NAME,'
      '  KLS_DOG.DOG_NUMBER, PLAT.SF_NAME as PLAT_NAME,'
      
        '  POLUCH.SF_NAME as POLUCH_NAME, POLUCH.GD_KOD as POLUCH_GD_KOD,' +
        ' POLUCH.OKPO as POLUCH_OKPO,'
      '  STAN.STAN_KOD, STAN.STAN_NAME,'
      '  FOR_SVED.GET_PASP_VALUE_AS_NUM(s.ID,1,NULL) AS PL20,'
      '  FOR_SVED.GET_PASP_VALUE_AS_NUM(s.ID,602,NULL) AS PL15,'
      '  FOR_SVED.GET_PASP_VALUE_AS_NUM(s.ID,NULL,'#39'P_SER'#39') AS P_SER,'
      '  FOR_SVED.GET_PASP_VALUE_AS_NUM(s.ID,NULL,'#39'T_VSP'#39') AS T_VSP,'
      '  FOR_SVED.GET_PASP_VALUE_AS_NUM(s.ID,NULL,'#39'P_VOD'#39') AS P_VOD,'
      '  FOR_SVED.GET_PASP_VALUE_AS_NUM(s.ID,NULL,'#39'P_DIRT'#39') AS P_DIRT,'
      '  FOR_SVED.GET_PASP_VALUE_AS_NUM(s.ID,NULL,'#39'P_SOL'#39') AS P_SOL,'
      '  FOR_SVED.GET_PASP_VALUE_AS_NUM(s.ID,NULL,'#39'MG_SOL'#39') AS MG_SOL'
      
        'FROM SVED s, KLS_PROD p, MONTH m, V_PASP pasp, kls_predpr SOBSTV' +
        ', kls_dog,'
      
        '     kls_predpr PLAT, kls_predpr POLUCH, kls_stan STAN, GU12_A, ' +
        'kls_defi_mass'
      
        'WHERE s.PROD_ID_NPR=p.ID_NPR(+) AND s.DEFI_MASS_ID=KLS_DEFI_MASS' +
        '.ID(+)'
      
        '  AND s.NOM_ZD=m.NOM_ZD(+) AND m.DOG_ID=KLS_DOG.ID(+) AND KLS_DO' +
        'G.PREDPR_ID=plat.ID(+)'
      
        '  AND m.NPR_SOBSTV_ID=SOBSTV.ID(+) AND m.POLUCH_ID=POLUCH.ID(+) ' +
        'AND m.STAN_ID=STAN.ID(+)'
      '  AND m.GU12_A_ID=GU12_A.ID(+)'
      '  AND s.PASP_ID=pasp.ID(+)'
      
        '/* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' */ AND s.SVED_DATE>=TO_DATE('#39'01.06.2005'#39','#39'dd.m' +
        'm.yyyy'#39')'
      '   AND s.SVED_DATE<=TO_DATE('#39'31.07.2005'#39','#39'dd.mm.yyyy'#39')'
      '/* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1087#1088#1086#1076#1091#1082#1090#1091' */ AND s.PROD_ID_NPR='#39'11516'#39
      '  AND s.MESTO_ID=:MESTO_ID AND s.LOAD_TYPE_ID=:LOAD_TYPE_ID'
      'ORDER BY sved_date DESC, sved_num DESC')
    Variables.Data = {
      0300000002000000090000003A4D4553544F5F49440300000004000000010000
      00000000000D0000003A4C4F41445F545950455F494403000000040000000100
      000000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000002F0000000200000049440100000000080000004D4553544F5F494401
      000000000A000000474F544F565F54494D4501000000000E0000004245475F4E
      414C49565F54494D4501000000000E000000454E445F4E414C49565F54494D45
      01000000000C0000004C4F41445F545950455F49440100000000090000005445
      43485F54494D450100000000080000005645535F434953540100000000080000
      00535645445F4E554D010000000009000000535645445F444154450100000000
      0B000000444154455F4F464F524D4C010000000008000000535645445F564553
      010000000008000000535645445F434E540100000000070000004B4F4C5F4E45
      540100000000070000005645535F414C4C01000000000C000000444546495F4D
      4153535F4944010000000007000000504153505F494401000000000B00000053
      5645445F49445F4E505201000000000E000000535645445F50524F445F4E414D
      4501000000000D000000535645445F504153505F4E554D01000000000C000000
      535645445F52455A5F4E554D01000000000E000000535645445F504153505F44
      41544501000000000B000000535645445F4E4F4D5F5A44010000000009000000
      535645445F43454E4101000000000D000000535645445F43454E415F4F545001
      000000000E000000535645445F444154455F43454E4101000000000600000049
      535F4558500100000000090000005445585F50445F4944010000000009000000
      4E4F4D5F455452414E01000000000B000000534F425354565F4E414D45010000
      00000A000000444F475F4E554D424552010000000009000000504C41545F4E41
      4D4501000000000B000000504F4C5543485F4E414D4501000000000D00000050
      4F4C5543485F47445F4B4F4401000000000B000000504F4C5543485F4F4B504F
      0100000000080000005354414E5F4B4F440100000000090000005354414E5F4E
      414D45010000000004000000504C3230010000000004000000504C3135010000
      000005000000505F534552010000000005000000545F56535001000000000500
      0000505F564F44010000000006000000505F4449525401000000000500000050
      5F534F4C0100000000060000004D475F534F4C01000000000E00000044454649
      5F4D4153535F4E414D45010000000008000000504F445F444154450100000000}
    UniqueFields = 'ID'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    UpdatingTable = 'SVED'
    Session = ora_Session
    Active = True
    BeforeOpen = q_titleBeforeOpen
    AfterOpen = q_titleAfterOpen
    AfterScroll = q_titleAfterScroll
    OnFilterRecord = q_titleFilterRecord
    Left = 248
    Top = 160
    object q_titleID: TStringField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
      Size = 9
    end
    object q_titleSVED_NUM: TFloatField
      DisplayLabel = #8470' '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_NUM'
      Required = True
    end
    object q_titleSVED_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_DATE'
      Required = True
    end
    object q_titleMESTO_ID: TFloatField
      FieldName = 'MESTO_ID'
      Required = True
    end
    object q_titleLOAD_TYPE_ID: TFloatField
      FieldName = 'LOAD_TYPE_ID'
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
    object q_titleDATE_OFORML: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
      FieldName = 'DATE_OFORML'
    end
    object q_titleSVED_VES: TFloatField
      DisplayLabel = #1042#1077#1089' '#1075#1088#1091#1079#1072
      FieldName = 'SVED_VES'
      Required = True
    end
    object q_titleSVED_CNT: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1090'/'#1089
      FieldName = 'SVED_CNT'
      Required = True
    end
    object q_titleVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072' ('#1090#1072#1088#1072')'
      FieldName = 'VES_CIST'
      Required = True
    end
    object q_titleKOL_NET: TFloatField
      DisplayLabel = #1042#1077#1089' '#1053#1045#1058#1058#1054' ('#1085#1077#1092#1090#1080')'
      FieldName = 'KOL_NET'
      Required = True
    end
    object q_titleVES_ALL: TFloatField
      DisplayLabel = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1074#1072#1075#1086#1085#1072', '#1091#1087#1072#1082#1086#1074#1082#1080
      FieldName = 'VES_ALL'
      Required = True
    end
    object q_titleDEFI_MASS_ID: TFloatField
      FieldName = 'DEFI_MASS_ID'
    end
    object q_titleDEFI_MASS_NAME: TStringField
      DisplayLabel = #1052#1077#1090#1086#1076' '#1079#1072#1084#1077#1088#1072' '#1084#1072#1089#1089#1099
      FieldName = 'DEFI_MASS_NAME'
    end
    object q_titlePASP_ID: TStringField
      FieldName = 'PASP_ID'
      Size = 9
    end
    object q_titleSVED_ID_NPR: TStringField
      FieldName = 'SVED_ID_NPR'
      Size = 5
    end
    object q_titleSVED_PROD_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'SVED_PROD_NAME'
      Size = 40
    end
    object q_titleSVED_PASP_NUM: TStringField
      DisplayLabel = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'SVED_PASP_NUM'
      Size = 15
    end
    object q_titleSVED_REZ_NUM: TStringField
      DisplayLabel = #8470' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072
      FieldName = 'SVED_REZ_NUM'
      Size = 15
    end
    object q_titleSVED_PASP_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'SVED_PASP_DATE'
    end
    object q_titleSVED_NOM_ZD: TStringField
      DisplayLabel = #8470' '#1079#1072#1076#1072#1085#1080#1103
      FieldName = 'SVED_NOM_ZD'
      Size = 12
    end
    object q_titleSVED_CENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1073#1077#1079' '#1085#1072#1083#1086#1075#1086#1074
      FieldName = 'SVED_CENA'
    end
    object q_titleSVED_CENA_OTP: TFloatField
      DisplayLabel = #1054#1090#1087#1091#1089#1082#1085#1072#1103' '#1094#1077#1085#1072
      FieldName = 'SVED_CENA_OTP'
    end
    object q_titleSVED_DATE_CENA: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1094#1077#1085#1099
      FieldName = 'SVED_DATE_CENA'
    end
    object q_titleIS_EXP: TIntegerField
      DisplayLabel = #1069#1082#1089#1087#1086#1088#1090'?'
      FieldName = 'IS_EXP'
    end
    object q_titleTEX_PD_ID: TIntegerField
      FieldName = 'TEX_PD_ID'
    end
    object q_titleNOM_ETRAN: TStringField
      DisplayLabel = #8470' '#1079#1072#1103#1074#1082#1080' '#1085#1072' '#1087#1077#1088#1077#1074#1086#1079#1082#1091
      FieldName = 'NOM_ETRAN'
      Size = 15
    end
    object q_titleSOBSTV_NAME: TStringField
      DisplayLabel = #1042#1083#1072#1076#1077#1083#1077#1094' '#1085'/'#1087#1088
      FieldName = 'SOBSTV_NAME'
      Size = 250
    end
    object q_titleDOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldName = 'DOG_NUMBER'
      Size = 30
    end
    object q_titlePLAT_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'PLAT_NAME'
      Size = 250
    end
    object q_titlePOLUCH_NAME: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'POLUCH_NAME'
      Size = 250
    end
    object q_titlePOLUCH_GD_KOD: TStringField
      DisplayLabel = #1078'/'#1076' '#1082#1086#1076
      FieldName = 'POLUCH_GD_KOD'
      Size = 12
    end
    object q_titlePOLUCH_OKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'POLUCH_OKPO'
      Size = 10
    end
    object q_titleSTAN_KOD: TIntegerField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103' ('#1082#1086#1076')'
      FieldName = 'STAN_KOD'
    end
    object q_titleSTAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      FieldName = 'STAN_NAME'
      Size = 50
    end
    object q_titlePL20: TFloatField
      DisplayLabel = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080' 20'#39'C'
      FieldName = 'PL20'
    end
    object q_titlePL15: TFloatField
      DisplayLabel = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080' 15'#39'C'
      FieldName = 'PL15'
    end
    object q_titleP_SER: TFloatField
      DisplayLabel = '% '#1089#1077#1088#1099
      FieldName = 'P_SER'
    end
    object q_titleT_VSP: TFloatField
      DisplayLabel = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074#1089#1087#1099#1096#1082#1080
      FieldName = 'T_VSP'
    end
    object q_titleP_VOD: TFloatField
      DisplayLabel = '% '#1074#1086#1076#1099
      FieldName = 'P_VOD'
    end
    object q_titleP_DIRT: TFloatField
      DisplayLabel = '% '#1084#1077#1093'. '#1087#1088#1080#1084#1077#1089#1077#1081
      FieldName = 'P_DIRT'
    end
    object q_titleP_SOL: TFloatField
      DisplayLabel = '% '#1089#1086#1083#1077#1081
      FieldName = 'P_SOL'
    end
    object q_titleMG_SOL: TFloatField
      DisplayLabel = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1089#1086#1083#1077#1081', '#1084#1075'/'#1083
      FieldName = 'MG_SOL'
    end
    object q_titlePOD_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' / '#1074#1088#1077#1084#1103' '#1087#1086#1076#1072#1095#1080
      FieldName = 'POD_DATE'
    end
  end
  object ds_title: TDataSource
    DataSet = q_title
    Left = 288
    Top = 160
  end
  object q_rows: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */ '
      'a.*,a.rowid,'
      
        'TO_CHAR(c.POD_NUM)||'#39' '#1086#1090' '#39'||TO_CHAR(c.POD_DATE,'#39'dd.mm.yyyy hh24:' +
        'mi'#39') as VED_POD_NUM,'
      
        'TO_CHAR(n.NUM_NAR)||'#39' '#1086#1090' '#39'||TO_CHAR(n.DATE_NAR,'#39'dd.mm.yyyy'#39') as ' +
        'NARIAD_NUM,'
      
        'TO_CHAR(NAKL.NAKL_NUM)||'#39' '#1086#1090' '#39'||TO_CHAR(NAKL.NAKL_DATE,'#39'dd.mm.yy' +
        'yy'#39') as NAKL_NUM'
      
        'FROM REESTR a, VED_POD_ROW b, VED_POD c, KLS_NAR_LINE nl, KLS_NA' +
        'RIAD n, NAKL'
      'WHERE a.SVED_ID=:SVED_ID'
      '  AND a.VED_POD_ROW_ID=b.ID(+)'
      '  AND b.VED_POD_ID=c.ID(+)'
      '  AND a.NAR_LINE_ID=nl.ID(+)'
      '  AND nl.NARIAD_ID=n.ID(+)'
      '  AND a.NAKL_ID=NAKL.ID(+)'
      'ORDER BY a.SVED_POS')
    Variables.Data = {
      0300000001000000080000003A535645445F4944050000000000000000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      03000000380000000200000049440100000000080000004E554D5F4349535401
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
      000006000000564F4C554D4501000000000B0000005645445F504F445F4E554D
      01000000000A0000004E41524941445F4E554D0100000000080000004E414B4C
      5F4E554D0100000000070000004241445F4E554D010000000007000000474F53
      545F494401000000000400000043544C56010000000008000000564F4C554D45
      31350100000000}
    AutoCalcFields = False
    UniqueFields = 'ID'
    Master = q_title
    MasterFields = 'ID'
    DetailFields = 'SVED_ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'REESTR'
    Session = ora_Session
    AfterInsert = q_rowsAfterInsert
    AfterPost = q_rowsAfterPost
    AfterDelete = q_rowsAfterDelete
    BeforeScroll = q_rowsBeforeScroll
    AfterScroll = q_rowsAfterScroll
    OnFilterRecord = q_rowsFilterRecord
    Left = 24
    Top = 376
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
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'SVED_POS'
    end
    object q_rowsVED_POD_ROW_ID: TFloatField
      FieldName = 'VED_POD_ROW_ID'
    end
    object q_rowsVED_POD_NUM: TStringField
      DisplayLabel = #8470' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1087#1086#1076#1072#1095#1080
      FieldName = 'VED_POD_NUM'
      Size = 119
    end
    object q_rowsNUM_CIST: TStringField
      DisplayLabel = #8470' '#1074#1072#1075#1086#1085#1072
      FieldName = 'NUM_CIST'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object q_rowsNCISTDOP: TIntegerField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1076#1086#1088#1086#1075' '#1057#1053#1043
      FieldName = 'NCISTDOP'
      OnValidate = q_rowsNCISTDOPValidate
    end
    object q_rowsAXES: TIntegerField
      DisplayLabel = #1054#1089#1080
      FieldName = 'AXES'
      OnValidate = q_rowsAXESValidate
    end
    object q_rowsCAPACITY: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086'- '#1087#1086#1076#1098#1077#1084'- '#1085#1086#1089#1090#1100
      FieldName = 'CAPACITY'
      OnValidate = q_rowsCAPACITYValidate
      Size = 10
    end
    object q_rowsWES1: TStringField
      FieldName = 'WES1'
      Size = 5
    end
    object q_rowsVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VES_CIST'
      OnValidate = q_rowsVES_CISTValidate
    end
    object q_rowsVAGONTYPE_ID: TFloatField
      FieldName = 'VAGONTYPE_ID'
      OnValidate = q_rowsVAGONTYPE_IDValidate
    end
    object q_rowsVAGONTYPE_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1074#1072#1075#1086#1085#1072
      FieldKind = fkLookup
      FieldName = 'VAGONTYPE_NAME'
      LookupDataSet = q_VagonType
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VAGONTYPE_ID'
      Size = 30
      Lookup = True
    end
    object q_rowsKALIBR_ID: TStringField
      DisplayLabel = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
      FieldName = 'KALIBR_ID'
      OnValidate = q_rowsKALIBR_IDValidate
      Size = 5
    end
    object q_rowsTIP1: TStringField
      FieldName = 'TIP1'
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
      Size = 10
      Lookup = True
    end
    object q_rowsVETKA_OTP_ID: TFloatField
      FieldName = 'VETKA_OTP_ID'
    end
    object q_rowsVETKA_OTP_NAME: TStringField
      DisplayLabel = #1055#1091#1090#1100' '#1087#1086#1075#1088#1091#1079#1082#1080
      FieldKind = fkLookup
      FieldName = 'VETKA_OTP_NAME'
      LookupDataSet = q_VetkaOtp
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VETKA_OTP_ID'
      Size = 10
      Lookup = True
    end
    object q_rowsVETKA_NAPR_ID: TFloatField
      FieldName = 'VETKA_NAPR_ID'
    end
    object q_rowsVETKA_NAPR_NAME: TStringField
      DisplayLabel = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1074#1099#1074#1086#1076#1072
      FieldKind = fkLookup
      FieldName = 'VETKA_NAPR_NAME'
      LookupDataSet = q_VetkaNapr
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VETKA_NAPR_ID'
      Size = 10
      Lookup = True
    end
    object q_rowsVAG_STATUS_ID: TFloatField
      FieldName = 'VAG_STATUS_ID'
      Required = True
    end
    object q_rowsVAG_STATUS_NAME: TStringField
      DisplayLabel = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1074#1072#1075#1086#1085#1072
      FieldKind = fkLookup
      FieldName = 'VAG_STATUS_NAME'
      LookupDataSet = q_VagStatus
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VAG_STATUS_ID'
      Size = 30
      Lookup = True
    end
    object q_rowsVZLIV: TFloatField
      DisplayLabel = #1042#1079#1083#1080#1074', '#1089#1084
      FieldName = 'VZLIV'
      OnValidate = q_rowsVZLIVValidate
    end
    object q_rowsVOLUME: TFloatField
      DisplayLabel = #1054#1073#1098#1077#1084', '#1089#1084'3'
      FieldName = 'VOLUME'
      Required = True
    end
    object q_rowsTEMPER: TFloatField
      DisplayLabel = #1058#1077#1084#1087#1077'- '#1088#1072#1090#1091#1088#1072', '#39'C'
      FieldName = 'TEMPER'
    end
    object q_rowsFAKT_PL: TFloatField
      DisplayLabel = #1060#1072#1082#1090'. '#1087#1083#1086#1090'- '#1085#1086#1089#1090#1100
      FieldName = 'FAKT_PL'
    end
    object q_rowsVES: TFloatField
      DisplayLabel = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1090#1085
      FieldName = 'VES'
      Required = True
    end
    object q_rowsKOL_NET: TFloatField
      DisplayLabel = #1042#1077#1089' '#1053#1045#1058#1058#1054', '#1090#1085
      FieldName = 'KOL_NET'
      Required = True
    end
    object q_rowsVES_ALL: TFloatField
      DisplayLabel = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1074#1072#1075#1086#1085#1072', '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
      FieldName = 'VES_ALL'
      Required = True
    end
    object q_rowsVES_ED: TFloatField
      DisplayLabel = #1042#1077#1089' 1 '#1077#1076'., '#1090#1085
      FieldName = 'VES_ED'
      Required = True
    end
    object q_rowsKOL_ED: TIntegerField
      DisplayLabel = #1050#1086#1083' '#1077#1076'.'
      FieldName = 'KOL_ED'
      Required = True
    end
    object q_rowsUPAK_ID: TFloatField
      FieldName = 'UPAK_ID'
    end
    object q_rowsUPAK_NAME: TStringField
      DisplayLabel = #1059#1087#1072#1082#1086#1074#1082#1072
      FieldKind = fkLookup
      FieldName = 'UPAK_NAME'
      LookupDataSet = q_Upak
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'UPAK_ID'
      Size = 30
      Lookup = True
    end
    object q_rowsUPAK_VES: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1089#1077#1081' '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
      FieldName = 'UPAK_VES'
      Required = True
    end
    object q_rowsUPAK_VES_ED: TFloatField
      DisplayLabel = #1042#1077#1089' 1 '#1091#1087#1072#1082#1086#1074#1082#1080', '#1082#1075
      FieldName = 'UPAK_VES_ED'
      Required = True
    end
    object q_rowsPODDONS: TIntegerField
      DisplayLabel = #1055#1086#1076#1076#1086#1085#1086#1074', '#1096#1090
      FieldName = 'PODDONS'
      Required = True
    end
    object q_rowsPODDON_VES: TFloatField
      DisplayLabel = #1042#1077#1089' 1 '#1087#1086#1076#1076#1086#1085#1072', '#1082#1075
      FieldName = 'PODDON_VES'
      Required = True
    end
    object q_rowsSHIELDS: TIntegerField
      DisplayLabel = #1065#1080#1090#1086#1074', '#1096#1090
      FieldName = 'SHIELDS'
      Required = True
    end
    object q_rowsSHIELD_VES: TFloatField
      DisplayLabel = #1042#1077#1089' 1 '#1097#1080#1090#1072', '#1082#1075
      FieldName = 'SHIELD_VES'
      Required = True
    end
    object q_rowsZPU_TYPE1: TFloatField
      FieldName = 'ZPU_TYPE1'
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
    object q_rowsZPU_TYPE2: TFloatField
      FieldName = 'ZPU_TYPE2'
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
      DisplayLabel = #1055#1083#1086#1084#1073#1072' '#1056#1086#1089#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072#1090#1072' 1'
      FieldName = 'ROSINSPL1'
      Size = 6
    end
    object q_rowsROSINSPL2: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1072' '#1056#1086#1089#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072#1090#1072' 2'
      FieldName = 'ROSINSPL2'
      Size = 6
    end
    object q_rowsNUM_PROP: TIntegerField
      FieldName = 'NUM_PROP'
    end
    object q_rowsFIO_DRIVER: TStringField
      FieldName = 'FIO_DRIVER'
      Size = 50
    end
    object q_rowsFORMNAKL_ID: TFloatField
      FieldName = 'FORMNAKL_ID'
    end
    object q_rowsFORMNAKL_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldKind = fkLookup
      FieldName = 'FORMNAKL_NAME'
      LookupDataSet = q_FormNakl
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'FORMNAKL_ID'
      Size = 30
      Lookup = True
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
    end
    object q_rowsTARIF_GUARD: TFloatField
      FieldName = 'TARIF_GUARD'
    end
    object q_rowsNAR_LINE_ID: TFloatField
      FieldName = 'NAR_LINE_ID'
    end
    object q_rowsNAKL_ID: TFloatField
      FieldName = 'NAKL_ID'
    end
    object q_rowsNARIAD_NUM: TStringField
      DisplayLabel = #8470' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103
      FieldName = 'NARIAD_NUM'
      Size = 29
    end
    object q_rowsNAKL_NUM: TStringField
      DisplayLabel = #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'NAKL_NUM'
      Size = 54
    end
    object q_rowsBAD_NUM: TIntegerField
      FieldName = 'BAD_NUM'
      ReadOnly = True
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
    object q_rowsVybor: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Vybor'
      OnGetText = q_rowsVyborGetText
      Calculated = True
    end
  end
  object ds_rows: TDataSource
    DataSet = q_rows
    Left = 24
    Top = 424
  end
  object pkgFOR_SVED: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_SVED'
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
    Left = 384
    Top = 144
  end
  object ds_Prod: TDataSource
    DataSet = q_Prod
    Left = 523
    Top = 149
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
    Left = 83
    Top = 369
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
      'select /*+ RULE */'
      '  kls_prod.ID_NPR,'
      '  kls_prod.NAME_NPR as NAME_NPR'
      'from kls_prod'
      'WHERE id_npr>='#39'10100'#39
      'UNION ALL'
      'select /*+ RULE */'
      '  '#39'-1'#39' as ID_NPR,'
      '  '#39'< '#1041#1045#1047' '#1055#1056#1054#1044#1059#1050#1058#1040' >'#39' as NAME_NPR'
      'from dual'
      'ORDER BY ID_NPR')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E50520100000000080000004E414D455F
      4E50520100000000}
    Session = ora_Session
    Left = 467
    Top = 145
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
      'where LOAD_TYPE_ID=:LOAD_TYPE_ID'
      'ORDER BY sortby')
    Variables.Data = {
      03000000010000000D0000003A4C4F41445F545950455F494403000000040000
      000100000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000040000004E414D450100000000
      06000000534F525442590100000000}
    Session = ora_Session
    Left = 155
    Top = 369
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
    Left = 227
    Top = 369
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
    Left = 371
    Top = 369
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
    Left = 443
    Top = 369
    object q_VagStatusID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_VagStatusNAME: TStringField
      FieldName = 'NAME'
      Required = True
    end
  end
  object q_VetkaOtp: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  a.ID,'
      '  a.SHORT_NAME as NAME'
      'from kls_vetka_otp a'
      
        'where id<100 and mesto_id=:MESTO_ID and LOAD_TYPE_ID=:LOAD_TYPE_' +
        'ID'
      'ORDER BY a.ID')
    Variables.Data = {
      0300000002000000090000003A4D4553544F5F49440300000000000000000000
      000D0000003A4C4F41445F545950455F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Left = 299
    Top = 369
    object q_VetkaOtpID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_VetkaOtpNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 10
    end
  end
  object q_Upak: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  a.ID,'
      '  a.NAME as NAME'
      'from kls_upak a '
      'where bag_id is not null'
      'ORDER BY a.ID')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Left = 507
    Top = 369
    object q_UpakID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_UpakNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
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
    Left = 563
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
    Left = 627
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
  object q_FormNakl: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  a.ID,'
      '  a.FORM_NAME as NAME'
      'from kls_formnakl a '
      'ORDER BY a.ID')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Left = 699
    Top = 369
    object q_FormNaklID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_FormNaklNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
  end
  object ds_VagonType: TDataSource
    DataSet = q_VagonType
    Left = 84
    Top = 418
  end
  object ds_VagOwner: TDataSource
    DataSet = q_VagOwner
    Left = 164
    Top = 418
  end
  object ds_VetkaPod: TDataSource
    DataSet = q_VetkaPod
    Left = 236
    Top = 418
  end
  object ds_VetkaOtp: TDataSource
    DataSet = q_VetkaOtp
    Left = 308
    Top = 418
  end
  object ds_VetkaNapr: TDataSource
    DataSet = q_VetkaNapr
    Left = 373
    Top = 418
  end
  object ds_VagStatus: TDataSource
    DataSet = q_VagStatus
    Left = 444
    Top = 418
  end
  object ds_Upak: TDataSource
    DataSet = q_Upak
    Left = 508
    Top = 418
  end
  object ds_ZpuType1: TDataSource
    DataSet = q_ZpuType1
    Left = 564
    Top = 418
  end
  object ds_ZpuType2: TDataSource
    DataSet = q_ZpuType2
    Left = 628
    Top = 418
  end
  object ds_FormNakl: TDataSource
    DataSet = q_FormNakl
    Left = 700
    Top = 418
  end
  object pkgFor_cist: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_CIST'
    Left = 345
    Top = 470
  end
  object pkgFor_ves: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_VES'
    Left = 433
    Top = 470
  end
  object pkgFor_environment: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_ENVIRONMENT'
    Left = 184
    Top = 470
  end
  object pkgFor_init: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_INIT'
    Left = 266
    Top = 470
  end
  object OraclePackage1: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_SVED'
    Left = 89
    Top = 470
  end
  object ds_Ved: TDataSource
    DataSet = q_Ved
    Left = 760
    Top = 418
  end
  object q_Ved: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '  VED_POD.VETKA_OTP_ID /* ID '#1087#1091#1090#1080' '#1087#1086#1075#1088#1091#1079#1082#1080' */,'
      
        '  KLS_VETKA_OTP.SHORT_NAME||'#39', '#1042#1077#1076#1086#1084#1086#1089#1090#1100' '#8470' '#39'||TO_NCHAR(VED_POD.P' +
        'OD_NUM)||'#39', '#39'||TO_CHAR(POD_DATE) as TreeNode1 /* '#1055#1091#1090#1100' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1076 +
        #1083#1103' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103' '#1076#1077#1088#1077#1074#1072'*/,'
      '  VED_POD_ROW.VED_POD_ID /* ID '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1087#1086#1076#1072#1095#1080' */,'
      '  VED_POD_ROW.ID as VED_POD_ROW_ID /* ID '#1087#1086#1079#1080#1094#1080#1080' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' */,'
      '  VED_POD.POD_NUM /* '#8470' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1087#1086#1076#1072#1095#1080' */,'
      '  VED_POD.POD_DATE /* '#1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1087#1086#1076#1072#1095#1080' */,'
      '  VED_POD_ROW.POD_POS /* '#8470' '#1087'/'#1087' */,'
      
        '  '#39#1074#1072#1075#1086#1085' '#8470' '#39'||VED_POD_ROW.NUM_CIST as TreeChild1/*'#1042#1072#1075#1086#1085' '#1076#1083#1103' '#1087#1086#1089#1090 +
        #1088#1086#1077#1085#1080#1103' '#1076#1077#1088#1077#1074#1072'*/,'
      '  VED_POD_ROW.NUM_CIST /* '#8470' '#1074#1072#1075#1086#1085#1072' */,'
      '  VED_POD_ROW.KALIBR_ID /* '#1090#1080#1087' '#1074#1072#1075#1086#1085#1072' */,'
      '  VED_POD_ROW.VAG_STATUS_ID /* ID '#1089#1090#1072#1090#1091#1089#1072' '#1074#1072#1075#1086#1085#1072' */, '
      '  KLS_VAG_STATUS.NAME AS VAG_STATUS_NAME /* '#1057#1090#1072#1090#1091#1089' '#1074#1072#1075#1086#1085#1072' */,'
      
        '  VED_POD_ROW.RAZMET_FACT as RAZMET, /* '#1056#1072#1079#1084#1077#1090#1082#1072' '#1074#1072#1075#1086#1085#1072' '#1087#1086#1076' '#1087#1088#1086#1076 +
        #1091#1082#1090' */'
      
        '  KLS_VETKA_OTP.SHORT_NAME||'#39', '#1042#1077#1076#1086#1084#1086#1089#1090#1100' '#8470' '#39'||TO_NCHAR(VED_POD.P' +
        'OD_NUM)||'#39', '#39'||TO_CHAR(POD_DATE)||'#39#1074#1072#1075#1086#1085' '#8470' '#39'||VED_POD_ROW.NUM_CI' +
        'ST as LookUp/*'#1082#1083#1102#1095' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'*/'
      
        'FROM VED_POD,VED_POD_ROW,KLS_VETKA_OTP,KLS_VAG_STATUS, KLS_PROD ' +
        'prod_v, KLS_PROD prod_s'
      'WHERE '
      '  VED_POD_ROW.VED_POD_ID=VED_POD.ID AND'
      '  VED_POD.VETKA_OTP_ID=KLS_VETKA_OTP.ID AND'
      '  VED_POD_ROW.VAG_STATUS_ID=KLS_VAG_STATUS.ID AND'
      '  VED_POD_ROW.PROD_ID_NPR=prod_v.ID_NPR(+) AND'
      '  (prod_s.ID_NPR=NVL(:PROD_ID_NPR,'#39'00000'#39')) AND'
      '  /* '#1059#1089#1083#1086#1074#1080#1103', '#1089#1074#1103#1079#1072#1085#1085#1099#1077' '#1089#1086' '#1089#1074#1077#1076#1077#1085#1080#1077#1084' */'
      
        '  VED_POD.LOAD_TYPE_ID=:LOAD_TYPE_ID AND /* '#1090#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088#1086#1074#1082#1080' ' +
        '*/'
      '  VED_POD.MESTO_ID=:MESTO_ID AND /* '#1084#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080' */'
      
        '  (NOT EXISTS (SELECT NULL FROM REESTR WHERE VED_POD_ROW_ID=VED_' +
        'POD_ROW.ID)) AND /* '#1042#1072#1075#1086#1085' '#1080#1079' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1077#1097#1077' '#1085#1077' '#1074#1082#1083#1102#1095#1077#1085' '#1074' '#1082#1072#1082#1086#1077'-'#1083#1080 +
        #1073#1086' '#1089#1074#1077#1076#1077#1085#1080#1077' */'
      
        '  (prod_v.ID_GROUP_NPR=prod_s.ID_GROUP_NPR OR :PROD_ID_NPR IS NU' +
        'LL OR VED_POD_ROW.PROD_ID_NPR IS NULL) /* '#1054#1090#1073#1080#1088#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1090#1077' '#1074#1072#1075 +
        #1086#1085#1099', '#1074' '#1082#1086#1090#1086#1088#1099#1093' '#1075#1088#1091#1087#1087#1072' '#1087#1088#1086#1076#1091#1082#1090#1072' '#1089#1086#1086#1090#1074#1077#1089#1090#1074#1090#1091#1077#1090' '#1075#1088#1091#1087#1087#1077' '#1087#1088#1086#1076#1091#1082#1090#1072' '#1074' '#1089 +
        #1074#1077#1076#1077#1085#1080#1080' */'
      
        'ORDER BY VED_POD.POD_DATE DESC, VED_POD.POD_NUM, VED_POD_ROW.POD' +
        '_POS, VED_POD_ROW.NUM_CIST')
    Variables.Data = {
      03000000030000000C0000003A50524F445F49445F4E50520300000000000000
      000000000D0000003A4C4F41445F545950455F49440300000000000000000000
      00090000003A4D4553544F5F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000E0000000C0000005645544B415F4F54505F494401000000000A0000
      005645445F504F445F494401000000000E0000005645445F504F445F524F575F
      4944010000000007000000504F445F4E554D010000000008000000504F445F44
      415445010000000007000000504F445F504F530100000000080000004E554D5F
      434953540100000000090000004B414C4942525F494401000000000D00000056
      41475F5354415455535F494401000000000F0000005641475F5354415455535F
      4E414D4501000000000600000052415A4D455401000000000900000054524545
      4E4F44453101000000000A000000545245454348494C44310100000000060000
      004C4F4F4B55500100000000}
    Session = ora_Session
    Left = 760
    Top = 368
    object q_VedVETKA_OTP_ID: TFloatField
      FieldName = 'VETKA_OTP_ID'
      Required = True
    end
    object q_VedTREENODE1: TStringField
      FieldName = 'TREENODE1'
      Size = 249
    end
    object q_VedVED_POD_ID: TFloatField
      FieldName = 'VED_POD_ID'
      Required = True
    end
    object q_VedVED_POD_ROW_ID: TFloatField
      FieldName = 'VED_POD_ROW_ID'
      Required = True
    end
    object q_VedPOD_NUM: TFloatField
      FieldName = 'POD_NUM'
      Required = True
    end
    object q_VedPOD_DATE: TDateTimeField
      FieldName = 'POD_DATE'
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
    object q_VedVAG_STATUS_ID: TFloatField
      FieldName = 'VAG_STATUS_ID'
    end
    object q_VedVAG_STATUS_NAME: TStringField
      FieldName = 'VAG_STATUS_NAME'
      Required = True
    end
    object q_VedRAZMET: TStringField
      FieldName = 'RAZMET'
      Size = 30
    end
    object q_VedLOOKUP: TStringField
      FieldName = 'LOOKUP'
      Size = 315
    end
  end
  object q_NarLines: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      'FROM'
      
        '(SELECT /*+ ORDERED USE_NL(KLS_NAR_LINE, KLS_NARIAD, MONTH, KLS_' +
        'PROD, KLS_STAN, poluch) */'
      '  KLS_NAR_LINE.NARIAD_ID,'
      
        '  '#39#1079#1072#1103#1074'.'#8470' '#39'||KLS_NAR_LINE.NOM_ZD||'#39', '#39'||KLS_PROD.NAME_NPR||'#39', '#39'|' +
        '|KLS_STAN.STAN_KOD||'#39' '#39'||KLS_STAN.STAN_NAME||'#39', '#39'||POLUCH.SHORT_' +
        'NAME as TN,'
      '  KLS_NAR_LINE.ID as NAR_LINE_ID,'
      '  KLS_NARIAD.NUM_NAR, /* '#8470' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103' */'
      '  KLS_NARIAD.DATE_NAR, /* '#1076#1072#1090#1072' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103' */'
      '  KLS_NARIAD.DATE_END, /* '#1076#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103' */'
      '  KLS_NAR_LINE.NOM_ZD, /* '#1085#1086#1084#1077#1088' '#1079#1072#1076#1072#1085#1080#1103' */'
      
        '  KLS_NAR_LINE.VES-KLS_NAR_LINE.FACT_VES as RASPOR_VES, -- '#1086#1089#1090#1072#1083 +
        #1086#1089#1100' '#1086#1090#1075#1088#1091#1079#1080#1090#1100' '#1087#1086' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1102', '#1090#1085
      
        '  KLS_NAR_LINE.KOL-KLS_NAR_LINE.FACT_KOL as RASPOR_KOL, -- '#1086#1089#1090#1072#1083 +
        #1086#1089#1100' '#1086#1090#1075#1088#1091#1079#1080#1090#1100' '#1087#1086' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1102', '#1082#1086#1083'-'#1074#1086
      
        '  MONTH.TONN_RAZNAR-MONTH.TONN_FACT as MONTH_VES, -- '#1086#1089#1090#1072#1083#1086#1089#1100' '#1086#1090 +
        #1075#1088#1091#1079#1080#1090#1100' '#1087#1086' '#1079#1072#1103#1074#1082#1077', '#1090#1085' '
      
        '  MONTH.CIST_RAZNAR-MONTH.CIST_FACT as MONTH_KOL, -- '#1086#1089#1090#1072#1083#1086#1089#1100' '#1086#1090 +
        #1075#1088#1091#1079#1080#1090#1100' '#1087#1086' '#1079#1072#1103#1074#1082#1077', '#1082#1086#1083'-'#1074#1086' '
      '  KLS_PROD.NAME_NPR as PROD_NAME, -- '#1055#1088#1086#1076#1091#1082#1090
      
        '  KLS_STAN.STAN_KOD||'#39' '#39'||KLS_STAN.STAN_NAME as STAN_NAME, --'#1057#1090#1072 +
        #1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      '  POLUCH.SHORT_NAME as POLUCH_NAME, -- '#1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
      '  49 as ImageIndex1'
      'FROM'
      
        '  MONTH, KLS_NAR_LINE, KLS_NARIAD, KLS_PROD, KLS_STAN, KLS_PREDP' +
        'R poluch, KLS_VID_OTGR, KLS_PROD prod_s'
      'WHERE'
      '  KLS_NAR_LINE.NARIAD_ID=KLS_NARIAD.ID AND'
      '  KLS_NAR_LINE.NOM_ZD=MONTH.NOM_ZD AND'
      '  MONTH.PROD_ID_NPR=KLS_PROD.ID_NPR AND'
      '  MONTH.STAN_ID=KLS_STAN.ID AND'
      '  MONTH.POLUCH_ID=poluch.ID AND'
      '  MONTH.LOAD_ABBR=KLS_VID_OTGR.LOAD_ABBR AND'
      '  (prod_s.ID_NPR=NVL(:PROD_ID_NPR,'#39'00000'#39')) AND'
      '  /* '#1059#1089#1083#1086#1074#1080#1103', '#1089#1074#1103#1079#1072#1085#1085#1099#1077' '#1089#1086' '#1089#1074#1077#1076#1077#1085#1080#1077#1084' */'
      
        '  KLS_VID_OTGR.LOAD_TYPE_ID=:LOAD_TYPE_ID AND /* '#1090#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088 +
        #1086#1074#1082#1080' */'
      '  KLS_NARIAD.MESTO_ID=:MESTO_ID AND /* '#1084#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080' */'
      
        '  MONTH.DATE_PLAN=TRUNC(:SVED_DATE,'#39'MONTH'#39') AND /* '#1054#1090#1086#1073#1088#1072#1090#1100' '#1079#1072#1103#1074 +
        #1082#1080', '#1076#1077#1091#1089#1090#1074#1091#1102#1097#1080#1077' '#1074' '#1090#1086#1084' '#1078#1077' '#1084#1077#1089#1103#1094#1077', '#1095#1090#1086' '#1080' '#1076#1072#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1103' */'
      
        '  :SVED_DATE<=DATE_END AND /* '#1053#1077' '#1086#1082#1086#1085#1095#1080#1083#1089#1103' '#1087#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1088#1103#1076 +
        #1072' */'
      
        '  (MONTH.NOM_ZD=:NOM_ZD OR :NOM_ZD IS NULL) AND /* '#1045#1089#1083#1080' '#1074' '#1089#1074#1077#1076#1077#1085 +
        #1080#1080' '#1091#1078#1077' '#1087#1088#1086#1089#1090#1072#1074#1083#1077#1085' '#8470' '#1079#1072#1076#1072#1085#1080#1103', '#1090#1086' '#1086#1090#1073#1080#1088#1072#1077#1084' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103' '#1089' '#1090#1077#1084' '#1078#1077' '#1079#1072#1076 +
        #1072#1085#1080#1077#1084' */'
      
        '  (KLS_PROD.ID_GROUP_NPR=prod_s.ID_GROUP_NPR OR :PROD_ID_NPR IS ' +
        'NULL) AND /* '#1054#1090#1073#1080#1088#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1090#1077' '#1079#1072#1103#1074#1082#1080', '#1074' '#1082#1086#1090#1086#1088#1099#1093' '#1075#1088#1091#1087#1087#1072' '#1087#1088#1086#1076#1091#1082#1090 +
        #1072' '#1089#1086#1086#1090#1074#1077#1089#1090#1074#1090#1091#1077#1090' '#1075#1088#1091#1087#1087#1077' '#1087#1088#1086#1076#1091#1082#1090#1072' '#1074' '#1089#1074#1077#1076#1077#1085#1080#1080' */'
      '  /* '#1050#1086#1085#1090#1088#1086#1083#1100' */'
      
        '  (KLS_NAR_LINE.KOL-KLS_NAR_LINE.FACT_KOL>0) AND /* '#1082#1086#1085#1090#1088#1086#1083#1100' '#1079#1072' ' +
        #1086#1089#1090#1072#1090#1082#1086#1084' '#1074#1072#1075#1086#1085#1086#1074' '#1074' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1080' */'
      
        '  (KLS_NAR_LINE.VES-KLS_NAR_LINE.FACT_VES>=FOR_SVED.GET_MIN_OSTA' +
        'T_VES(:LOAD_TYPE_ID,KLS_PROD.ID_GROUP_NPR)) AND /* '#1082#1086#1085#1090#1088#1086#1083#1100' '#1079#1072' '#1086 +
        #1089#1090#1072#1090#1082#1086#1084' '#1074#1077#1089#1072' '#1074' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1080' */'
      
        '  (MONTH.CIST_RAZNAR-MONTH.CIST_FACT>0) AND /* '#1082#1086#1085#1090#1088#1086#1083#1100' '#1079#1072' '#1086#1089#1090#1072#1090 +
        #1082#1086#1084' '#1074#1072#1075#1086#1085#1086#1074' '#1074' '#1079#1072#1103#1074#1082#1077' */'
      
        '  (MONTH.TONN_RAZNAR-MONTH.TONN_FACT>=FOR_SVED.GET_MIN_OSTAT_VES' +
        '(:LOAD_TYPE_ID,KLS_PROD.ID_GROUP_NPR)) /* '#1082#1086#1085#1090#1088#1086#1083#1100' '#1079#1072' '#1086#1089#1090#1072#1090#1082#1086#1084' '#1074 +
        #1077#1089#1072' '#1074' '#1079#1072#1103#1074#1082#1077' */'
      'union'
      'SELECT distinct'
      '  NULL,'
      '  '#39#1053#1072#1088#1103#1076' '#8470' '#39'||KLS_NAR_LINE.NARIAD_ID as TN,/*id '#1087#1086#1079#1080#1094#1080#1080' '#1085#1072#1088#1103#1076#1072'*/'
      '  KLS_NAR_LINE.NARIAD_ID, /* '#8470' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103' */'
      '  null, /* '#1076#1072#1090#1072' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103' */'
      '  null,'
      '  null, /* '#1076#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103' */'
      '  null, /* '#1085#1086#1084#1077#1088' '#1079#1072#1076#1072#1085#1080#1103' */'
      '  null, -- '#1086#1089#1090#1072#1083#1086#1089#1100' '#1086#1090#1075#1088#1091#1079#1080#1090#1100' '#1087#1086' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1102', '#1090#1085
      '  null, -- '#1086#1089#1090#1072#1083#1086#1089#1100' '#1086#1090#1075#1088#1091#1079#1080#1090#1100' '#1087#1086' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1102', '#1082#1086#1083'-'#1074#1086
      '  null, -- '#1086#1089#1090#1072#1083#1086#1089#1100' '#1086#1090#1075#1088#1091#1079#1080#1090#1100' '#1087#1086' '#1079#1072#1103#1074#1082#1077', '#1090#1085
      '  null, -- '#1086#1089#1090#1072#1083#1086#1089#1100' '#1086#1090#1075#1088#1091#1079#1080#1090#1100' '#1087#1086' '#1079#1072#1103#1074#1082#1077', '#1082#1086#1083'-'#1074#1086
      '  null, -- '#1055#1088#1086#1076#1091#1082#1090
      '  null, --'#1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      '  null, -- '#1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
      '  48 as ImageIndex1'
      'FROM'
      
        '  MONTH, KLS_NAR_LINE, KLS_NARIAD, KLS_PROD, KLS_STAN, KLS_PREDP' +
        'R poluch, KLS_VID_OTGR, KLS_PROD prod_s'
      'WHERE'
      '  KLS_NAR_LINE.NARIAD_ID=KLS_NARIAD.ID AND'
      '  KLS_NAR_LINE.NOM_ZD=MONTH.NOM_ZD AND'
      '  MONTH.PROD_ID_NPR=KLS_PROD.ID_NPR AND'
      '  MONTH.STAN_ID=KLS_STAN.ID AND'
      '  MONTH.POLUCH_ID=poluch.ID AND'
      '  MONTH.LOAD_ABBR=KLS_VID_OTGR.LOAD_ABBR AND'
      '  (prod_s.ID_NPR=NVL(:PROD_ID_NPR,'#39'00000'#39')) AND'
      '  /* '#1059#1089#1083#1086#1074#1080#1103', '#1089#1074#1103#1079#1072#1085#1085#1099#1077' '#1089#1086' '#1089#1074#1077#1076#1077#1085#1080#1077#1084' */'
      
        '  KLS_VID_OTGR.LOAD_TYPE_ID=:LOAD_TYPE_ID AND /* '#1090#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088 +
        #1086#1074#1082#1080' */'
      '  KLS_NARIAD.MESTO_ID=:MESTO_ID AND /* '#1084#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080' */'
      
        '  MONTH.DATE_PLAN=TRUNC(:SVED_DATE,'#39'MONTH'#39') AND /* '#1054#1090#1086#1073#1088#1072#1090#1100' '#1079#1072#1103#1074 +
        #1082#1080', '#1076#1077#1091#1089#1090#1074#1091#1102#1097#1080#1077' '#1074' '#1090#1086#1084' '#1078#1077' '#1084#1077#1089#1103#1094#1077', '#1095#1090#1086' '#1080' '#1076#1072#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1103' */'
      
        '  :SVED_DATE<=DATE_END AND /* '#1053#1077' '#1086#1082#1086#1085#1095#1080#1083#1089#1103' '#1087#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1088#1103#1076 +
        #1072' */'
      
        '  (MONTH.NOM_ZD=:NOM_ZD OR :NOM_ZD IS NULL) AND /* '#1045#1089#1083#1080' '#1074' '#1089#1074#1077#1076#1077#1085 +
        #1080#1080' '#1091#1078#1077' '#1087#1088#1086#1089#1090#1072#1074#1083#1077#1085' '#8470' '#1079#1072#1076#1072#1085#1080#1103', '#1090#1086' '#1086#1090#1073#1080#1088#1072#1077#1084' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103' '#1089' '#1090#1077#1084' '#1078#1077' '#1079#1072#1076 +
        #1072#1085#1080#1077#1084' */'
      
        '  (KLS_PROD.ID_GROUP_NPR=prod_s.ID_GROUP_NPR OR :PROD_ID_NPR IS ' +
        'NULL) AND /* '#1054#1090#1073#1080#1088#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1090#1077' '#1079#1072#1103#1074#1082#1080', '#1074' '#1082#1086#1090#1086#1088#1099#1093' '#1075#1088#1091#1087#1087#1072' '#1087#1088#1086#1076#1091#1082#1090 +
        #1072' '#1089#1086#1086#1090#1074#1077#1089#1090#1074#1090#1091#1077#1090' '#1075#1088#1091#1087#1087#1077' '#1087#1088#1086#1076#1091#1082#1090#1072' '#1074' '#1089#1074#1077#1076#1077#1085#1080#1080' */'
      '  /* '#1050#1086#1085#1090#1088#1086#1083#1100' */'
      
        '  (KLS_NAR_LINE.KOL-KLS_NAR_LINE.FACT_KOL>0) AND /* '#1082#1086#1085#1090#1088#1086#1083#1100' '#1079#1072' ' +
        #1086#1089#1090#1072#1090#1082#1086#1084' '#1074#1072#1075#1086#1085#1086#1074' '#1074' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1080' */'
      
        '  (KLS_NAR_LINE.VES-KLS_NAR_LINE.FACT_VES>=FOR_SVED.GET_MIN_OSTA' +
        'T_VES(:LOAD_TYPE_ID,KLS_PROD.ID_GROUP_NPR)) AND /* '#1082#1086#1085#1090#1088#1086#1083#1100' '#1079#1072' '#1086 +
        #1089#1090#1072#1090#1082#1086#1084' '#1074#1077#1089#1072' '#1074' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1080' */'
      
        '  (MONTH.CIST_RAZNAR-MONTH.CIST_FACT>0) AND /* '#1082#1086#1085#1090#1088#1086#1083#1100' '#1079#1072' '#1086#1089#1090#1072#1090 +
        #1082#1086#1084' '#1074#1072#1075#1086#1085#1086#1074' '#1074' '#1079#1072#1103#1074#1082#1077' */'
      
        '  (MONTH.TONN_RAZNAR-MONTH.TONN_FACT>=FOR_SVED.GET_MIN_OSTAT_VES' +
        '(:LOAD_TYPE_ID,KLS_PROD.ID_GROUP_NPR)) /* '#1082#1086#1085#1090#1088#1086#1083#1100' '#1079#1072' '#1086#1089#1090#1072#1090#1082#1086#1084' '#1074 +
        #1077#1089#1072' '#1074' '#1079#1072#1103#1074#1082#1077' */'
      ')'
      'ORDER BY DATE_NAR DESC, NOM_ZD'
      '')
    Variables.Data = {
      03000000050000000C0000003A50524F445F49445F4E50520300000000000000
      000000000D0000003A4C4F41445F545950455F49440300000000000000000000
      00090000003A4D4553544F5F49440300000000000000000000000A0000003A53
      5645445F444154450C0000000000000000000000070000003A4E4F4D5F5A4405
      0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000F000000090000004E41524941445F494401000000000B0000004E41
      525F4C494E455F49440100000000070000004E554D5F4E415201000000000800
      0000444154455F4E4152010000000008000000444154455F454E440100000000
      060000004E4F4D5F5A4401000000000A000000524153504F525F564553010000
      00000A000000524153504F525F4B4F4C0100000000090000004D4F4E54485F56
      45530100000000090000004D4F4E54485F4B4F4C01000000000900000050524F
      445F4E414D450100000000090000005354414E5F4E414D4501000000000B0000
      00504F4C5543485F4E414D45010000000002000000544E01000000000B000000
      494D414745494E444558310100000000}
    Session = ora_Session
    BeforeOpen = q_NarLinesBeforeOpen
    AfterOpen = q_NarLinesAfterOpen
    Left = 816
    Top = 368
    object q_NarLinesNARIAD_ID: TFloatField
      FieldName = 'NARIAD_ID'
    end
    object q_NarLinesTN: TStringField
      FieldName = 'TN'
      Size = 186
    end
    object q_NarLinesNAR_LINE_ID: TFloatField
      FieldName = 'NAR_LINE_ID'
    end
    object q_NarLinesNUM_NAR: TStringField
      FieldName = 'NUM_NAR'
      Size = 15
    end
    object q_NarLinesDATE_NAR: TDateTimeField
      FieldName = 'DATE_NAR'
    end
    object q_NarLinesDATE_END: TDateTimeField
      FieldName = 'DATE_END'
    end
    object q_NarLinesNOM_ZD: TStringField
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_NarLinesRASPOR_VES: TFloatField
      FieldName = 'RASPOR_VES'
    end
    object q_NarLinesRASPOR_KOL: TFloatField
      FieldName = 'RASPOR_KOL'
    end
    object q_NarLinesMONTH_VES: TFloatField
      FieldName = 'MONTH_VES'
    end
    object q_NarLinesMONTH_KOL: TFloatField
      FieldName = 'MONTH_KOL'
    end
    object q_NarLinesPROD_NAME: TStringField
      FieldName = 'PROD_NAME'
      Size = 40
    end
    object q_NarLinesSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Size = 91
    end
    object q_NarLinesPOLUCH_NAME: TStringField
      FieldName = 'POLUCH_NAME'
      Size = 30
    end
    object q_NarLinesIMAGEINDEX1: TFloatField
      FieldName = 'IMAGEINDEX1'
    end
  end
  object ds_NarLines: TDataSource
    DataSet = MemTableEh1
    Left = 816
    Top = 418
  end
  object MemTableEh1: TMemTableEh
    Params = <>
    DataDriver = DataSetDriverEh1
    TreeList.Active = True
    TreeList.KeyFieldName = 'nar_line_id'
    TreeList.RefParentFieldName = 'nariad_id'
    TreeList.DefaultNodeExpanded = True
    Left = 704
    Top = 168
  end
  object DataSetDriverEh1: TDataSetDriverEh
    KeyFields = 'nar_line_id'
    ProviderDataSet = q_NarLines
    Left = 792
    Top = 168
  end
end