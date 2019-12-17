inherited f_SvedIn: Tf_SvedIn
  Left = 284
  Top = 191
  Width = 974
  Height = 703
  Caption = #1057#1042#1045#1044#1045#1053#1048#1071' '#1086' '#1057#1051#1048#1042#1045' '#1085#1077#1092#1090#1080
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 958
    Height = 665
    ActivePage = tabTitleInfo
    Align = alClient
    TabOrder = 0
    object tabTitleInfo: TTabSheet
      Caption = #1057#1074#1077#1076#1077#1085#1080#1103
      object Splitter1: TSplitter
        Left = 0
        Top = 235
        Width = 950
        Height = 2
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        Color = clBtnFace
        ParentColor = False
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 950
        Height = 41
        Align = alTop
        Caption = ' '#1060#1080#1083#1100#1090#1088' '
        TabOrder = 0
        object Label1: TLabel
          Left = 15
          Top = 18
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = #1044#1072#1090#1072' '#1089#1083#1080#1074#1072
        end
        object Label2: TLabel
          Left = 171
          Top = 18
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object lbProdName: TLabel
          Left = 293
          Top = 16
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = #1042#1080#1076' '#1085#1077#1092#1090#1080
        end
        object Date1: TDateTimePicker
          Left = 83
          Top = 13
          Width = 82
          Height = 22
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          TabOrder = 0
          OnCloseUp = CheckTime
          OnChange = CheckTime
          OnExit = CheckTime
        end
        object Date2: TDateTimePicker
          Left = 187
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
        object lc_Prod: TRxDBLookupCombo
          Left = 354
          Top = 13
          Width = 247
          Height = 21
          DropDownCount = 8
          DisplayEmpty = '< '#1042#1057#1045' >'
          LookupField = 'ID_NPR'
          LookupDisplay = 'NAME_NPR'
          LookupSource = ds_Prod
          TabOrder = 2
        end
      end
      object TBDock1: TTBDock
        Left = 0
        Top = 41
        Width = 950
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
            Action = acSvedInAdd
            DisplayMode = nbdmImageAndText
          end
          object TBItem2: TTBItem
            Action = acSvedInEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem4: TTBItem
            Action = acSvedInCopy
            DisplayMode = nbdmImageAndText
          end
          object TBItem1: TTBItem
            Action = acSvedInDel
            DisplayMode = nbdmImageAndText
          end
          object TBItem10: TTBItem
            Action = acPrintSved
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object GridTitle: TDBGridEh
        Left = 0
        Top = 67
        Width = 950
        Height = 168
        Align = alTop
        AllowedOperations = []
        ColumnDefValues.Title.TitleButton = True
        DataGrouping.GroupLevels = <>
        DataSource = ds_title
        EvenRowColor = clWindow
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
        IndicatorOptions = [gioShowRowIndicatorEh]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        ParentFont = False
        PopupMenu = PopupTitle
        RowDetailPanel.Color = clBtnFace
        RowSizingAllowed = True
        SumList.Active = True
        TabOrder = 2
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
            EditButtons = <>
            FieldName = 'SVED_NUM'
            Footers = <>
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'SVED_DATE'
            Footers = <>
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'PROD_NAME'
            Footers = <>
            Width = 108
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'SVED_CNT'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'SVED_VES'
            Footers = <>
            Width = 101
          end
          item
            EditButtons = <>
            FieldName = 'VES_NETTO'
            Footers = <>
            Width = 93
          end
          item
            EditButtons = <>
            FieldName = 'VES_KVIT'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 102
          end
          item
            EditButtons = <>
            FieldName = 'VES_NETTO_KVIT'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'GOTOV_TIME'
            Footers = <>
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'BEG_NALIV_TIME'
            Footers = <>
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'END_NALIV_TIME'
            Footers = <>
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'DATE_OFORML'
            Footers = <>
            Width = 106
          end
          item
            EditButtons = <>
            FieldName = 'PASP_NUM'
            Footers = <>
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'REZ_NUM'
            Footers = <>
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'PASP_DATE'
            Footers = <>
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'PL'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PL15'
            Footers = <>
            Width = 73
          end
          item
            EditButtons = <>
            FieldName = 'P_VOD'
            Footers = <>
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'P_DIRT'
            Footers = <>
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'MG_SOL'
            Footers = <>
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'P_SOL'
            Footers = <>
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object gbRows: TGroupBox
        Left = 0
        Top = 237
        Width = 950
        Height = 400
        Align = alClient
        Caption = ' '#1055#1086#1079#1080#1094#1080#1080' '
        TabOrder = 3
        object TBDock3: TTBDock
          Left = 2
          Top = 15
          Width = 946
          Height = 26
          object TBToolbar3: TTBToolbar
            Left = 0
            Top = 0
            Caption = 'TBToolbar2'
            Images = f_main.img_Common
            TabOrder = 0
            object TBItem40: TTBItem
              Action = acFind
              DisplayMode = nbdmImageAndText
            end
            object TBItem22: TTBItem
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              DisplayMode = nbdmImageAndText
              ImageIndex = 11
              Images = f_main.img_Common
              OnClick = bRefreshRowsClick
            end
            object TBItem28: TTBItem
              Action = acSvedInRowsAdd
              DisplayMode = nbdmImageAndText
            end
            object TBItem30: TTBItem
              Action = acSvedInRowsEdit
              DisplayMode = nbdmImageAndText
            end
            object TBItem31: TTBItem
              Action = acSvedInRowsCopy
              DisplayMode = nbdmImageAndText
            end
            object TBItem32: TTBItem
              Action = acSvedInRowsDel
              DisplayMode = nbdmImageAndText
            end
            object TBItem6: TTBItem
              Action = acRowsSprav
              DisplayMode = nbdmImageAndText
            end
            object TBItem33: TTBItem
              Action = acSvedInRowsPost
              DisplayMode = nbdmImageAndText
            end
            object TBItem34: TTBItem
              Action = acSvedInRowsCancel
              DisplayMode = nbdmImageAndText
            end
          end
        end
        object TBDock2: TTBDock
          Left = 2
          Top = 41
          Width = 946
          Height = 26
          object tbOtgr: TTBToolbar
            Left = 0
            Top = 0
            Caption = 'tbOtgr'
            Images = f_main.img_Common
            TabOrder = 0
            object TBItem5: TTBItem
              Action = acSvedInRowsCalc
              DisplayMode = nbdmImageAndText
            end
            object TBItem7: TTBItem
              Action = acSvedInNakl
              DisplayMode = nbdmImageAndText
            end
            object TBItem43: TTBItem
              Action = acSvedInUved
              DisplayMode = nbdmImageAndText
            end
          end
        end
        object GridRows: TDBGridEh
          Left = 2
          Top = 67
          Width = 946
          Height = 331
          Align = alClient
          AllowedOperations = [alopUpdateEh, alopAppendEh]
          ColumnDefValues.Title.TitleButton = True
          DataGrouping.GroupLevels = <>
          DataSource = ds_rows
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
          FrozenCols = 3
          IndicatorOptions = [gioShowRowIndicatorEh]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentFont = False
          PopupMenu = PopupRows
          RowDetailPanel.Color = clBtnFace
          RowSizingAllowed = True
          SumList.Active = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnCellClick = GridRowsCellClick
          OnExit = GridRowsExit
          OnGetCellParams = GridRowsGetCellParams
          OnKeyDown = GridRowsKeyDown
          OnKeyPress = GridRowsKeyPress
          OnSortMarkingChanged = GridRowsSortMarkingChanged
          Columns = <
            item
              Checkboxes = True
              EditButtons = <>
              FieldName = 'Vybor'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              Width = 19
            end
            item
              EditButtons = <>
              FieldName = 'SVED_POS'
              Footer.ValueType = fvtCount
              Footers = <>
              Width = 25
            end
            item
              EditButtons = <>
              FieldName = 'NUM_CIST'
              Footers = <>
              Width = 63
            end
            item
              Alignment = taCenter
              EditButtons = <>
              FieldName = 'KALIBR_ID'
              Footers = <>
              Width = 41
            end
            item
              Alignment = taCenter
              EditButtons = <>
              FieldName = 'CAPACITY'
              Footers = <>
              Width = 49
            end
            item
              EditButtons = <>
              FieldName = 'VES_CIST'
              Footer.ValueType = fvtSum
              Footers = <>
              Width = 49
            end
            item
              Alignment = taCenter
              EditButtons = <>
              FieldName = 'OSTAT'
              Footer.ValueType = fvtSum
              Footers = <>
              Width = 34
            end
            item
              EditButtons = <>
              FieldName = 'NAKL_NUM'
              Footers = <>
              Width = 73
            end
            item
              EditButtons = <>
              FieldName = 'UVED_NUM'
              Footers = <>
              Width = 69
            end
            item
              EditButtons = <>
              FieldName = 'NUM_KVIT_TXT'
              Footers = <>
              Width = 83
            end
            item
              EditButtons = <>
              FieldName = 'DATE_KVIT'
              Footers = <>
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'VES_KVIT'
              Footer.ValueType = fvtSum
              Footers = <>
              Width = 71
            end
            item
              EditButtons = <>
              FieldName = 'P_VOD_KVIT'
              Footers = <>
              Width = 57
            end
            item
              EditButtons = <>
              FieldName = 'P_SOL_KVIT'
              Footers = <>
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'P_DIRT_KVIT'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'VES_NETTO_KVIT'
              Footer.ValueType = fvtSum
              Footers = <>
              Width = 74
            end
            item
              EditButtons = <>
              FieldName = 'TARIF'
              Footer.ValueType = fvtSum
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'TARIF_GUARD'
              Footer.ValueType = fvtSum
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'DATE_IN_STAN'
              Footers = <>
              Width = 78
            end
            item
              EditButtons = <>
              FieldName = 'TEMPER_KVIT'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'VZLIV_KVIT'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'PL_KVIT'
              Footers = <>
              Width = 71
            end
            item
              EditButtons = <>
              FieldName = 'PASP_NUM_KVIT'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'DATE_OTGR'
              Footers = <>
              Width = 63
            end
            item
              DisplayFormat = '#0.0000000'
              EditButtons = <>
              FieldName = 'VES'
              Footers = <>
              Width = 83
            end
            item
              EditButtons = <>
              FieldName = 'VES_NETTO'
              Footers = <>
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'VZLIV'
              Footers = <>
              Width = 46
            end
            item
              EditButtons = <>
              FieldName = 'VOLUME'
              Footer.ValueType = fvtSum
              Footers = <>
              Width = 72
            end
            item
              EditButtons = <>
              FieldName = 'TEMPER'
              Footers = <>
              Width = 48
            end
            item
              EditButtons = <>
              FieldName = 'FAKT_PL'
              Footers = <>
              Width = 62
            end
            item
              EditButtons = <>
              FieldName = 'CTLV'
              Footers = <>
              Width = 66
            end
            item
              EditButtons = <>
              FieldName = 'VOLUME15'
              Footer.ValueType = fvtSum
              Footers = <>
              Width = 88
            end
            item
              EditButtons = <>
              FieldName = 'VAGOWNER_NAME'
              Footers = <>
              Width = 216
            end
            item
              EditButtons = <>
              FieldName = 'DATE_VOZ'
              Footers = <>
              Width = 77
            end
            item
              DropDownRows = 10
              EditButtons = <>
              FieldName = 'ZPU_TYPE1_NAME'
              Footers = <>
              Width = 113
            end
            item
              EditButtons = <>
              FieldName = 'PLOMBA1'
              Footers = <>
            end
            item
              DropDownRows = 10
              EditButtons = <>
              FieldName = 'ZPU_TYPE2_NAME'
              Footers = <>
              Width = 149
            end
            item
              EditButtons = <>
              FieldName = 'PLOMBA2'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'KVIT_VOZ'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'SUM_VOZ'
              Footer.ValueType = fvtSum
              Footers = <>
            end
            item
              Checkboxes = True
              EditButtons = <>
              FieldName = 'EMPTY_VOZ'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              Width = 43
            end
            item
              EditButtons = <>
              FieldName = 'STAN_VOZ_KOD'
              Footers = <>
              Width = 84
            end
            item
              EditButtons = <>
              FieldName = 'STAN_VOZ_NAME'
              Footers = <>
              Width = 173
            end
            item
              EditButtons = <>
              FieldName = 'SVED_IN_ID'
              Footers = <>
              Width = 81
            end
            item
              EditButtons = <>
              FieldName = 'ID'
              Footers = <>
              Width = 61
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object tabTitleItogs: TTabSheet
      Caption = #1048#1090#1086#1075#1080
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 833
        Height = 41
        Align = alTop
        Caption = ' '#1060#1080#1083#1100#1090#1088' '
        TabOrder = 0
        object Label3: TLabel
          Left = 15
          Top = 18
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = #1044#1072#1090#1072' '#1089#1083#1080#1074#1072
        end
        object Label4: TLabel
          Left = 171
          Top = 18
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object Date3: TDateTimePicker
          Left = 83
          Top = 13
          Width = 82
          Height = 22
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          TabOrder = 0
          OnCloseUp = CheckTimeItogs
          OnChange = CheckTimeItogs
          OnExit = CheckTimeItogs
        end
        object Date4: TDateTimePicker
          Left = 187
          Top = 13
          Width = 82
          Height = 22
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          TabOrder = 1
          OnCloseUp = CheckTimeItogs
          OnChange = CheckTimeItogs
          OnExit = CheckTimeItogs
        end
      end
      object TBDock4: TTBDock
        Left = 0
        Top = 41
        Width = 833
        Height = 26
        object TBToolbar4: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          Images = f_main.img_Common
          TabOrder = 0
          object bRefreshItogs: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            ImageIndex = 11
            OnClick = bRefreshItogsClick
          end
        end
      end
      object GridItogs: TDBGridEh
        Left = 0
        Top = 67
        Width = 833
        Height = 490
        Align = alClient
        AllowedOperations = []
        DataGrouping.GroupLevels = <>
        DataSource = ds_itogs
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
        IndicatorOptions = [gioShowRowIndicatorEh]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        ParentFont = False
        PopupMenu = PopupItogs
        RowDetailPanel.Color = clBtnFace
        RowSizingAllowed = True
        SumList.Active = True
        TabOrder = 2
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
            EditButtons = <>
            FieldName = 'SVED_DATE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PROD_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 180
          end
          item
            EditButtons = <>
            FieldName = 'VAG_CNT'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'SUM_VES_KVIT'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
            Width = 105
          end
          item
            EditButtons = <>
            FieldName = 'SUM_VES'
            Footers = <>
            Title.TitleButton = True
            Width = 105
          end
          item
            EditButtons = <>
            FieldName = 'SUM_VES_NETTO'
            Footers = <>
            Title.TitleButton = True
            Width = 101
          end>
        object RowDetailData: TRowDetailPanelControlEh
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
    Left = 35
    Top = 117
    StyleName = 'XP Style'
    object acToXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      ImageIndex = 42
      OnExecute = acToXLSExecute
    end
    object acSvedInRowsCancel: TAction
      Category = 'FOR_ALL'
      Caption = 'ESC-'#1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 11
      OnExecute = acSvedInRowsCancelExecute
    end
    object acSvedInRowsPost: TAction
      Category = 'FOR_ALL'
      Caption = 'F10-'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      ShortCut = 121
      OnExecute = acSvedInRowsPostExecute
    end
    object acSvedInAdd: TAction
      Category = 'TITLE'
      Caption = #1053#1086#1074#1086#1077' '#1089#1074#1077#1076#1077#1085#1080#1077
      ImageIndex = 0
      OnExecute = acSvedInAddExecute
    end
    object acSvedInEdit: TAction
      Category = 'TITLE'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      OnExecute = acSvedInEditExecute
    end
    object acSvedInCopy: TAction
      Category = 'TITLE'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      OnExecute = acSvedInCopyExecute
    end
    object acSvedInDel: TAction
      Category = 'TITLE'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acSvedInDelExecute
    end
    object acSvedInRowsAdd: TAction
      Category = 'ROWS'
      Caption = 'F2-'#1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1072#1075#1086#1085
      ImageIndex = 0
      ShortCut = 113
      OnExecute = acSvedInRowsAddExecute
    end
    object acSvedInRowsEdit: TAction
      Category = 'ROWS'
      Caption = 'F4-'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      ShortCut = 115
      OnExecute = acSvedInRowsEditExecute
    end
    object acSvedInRowsCopy: TAction
      Category = 'ROWS'
      Caption = 'F6-'#1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      ShortCut = 117
      OnExecute = acSvedInRowsCopyExecute
    end
    object acSvedInRowsDel: TAction
      Category = 'ROWS'
      Caption = 'F8-'#1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 119
      OnExecute = acSvedInRowsDelExecute
    end
    object acPrintSved: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1074#1077#1076#1077#1085#1080#1103
      ImageIndex = 6
      OnExecute = acPrintSvedExecute
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
    object acSvedInView: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 1
      OnExecute = acSvedInViewExecute
    end
    object acFind: TAction
      Category = 'FOR_ALL'
      Caption = 'F5-'#1055#1086#1080#1089#1082
      ImageIndex = 9
      ShortCut = 116
      OnExecute = acFindExecute
    end
    object acSvedInRowsCalc: TAction
      Category = 'ROWS'
      Caption = 'F9-'#1055#1077#1088#1077#1089#1095#1077#1090
      ImageIndex = 37
      ShortCut = 120
      OnExecute = acSvedInRowsCalcExecute
    end
    object acRowsSprav: TAction
      Category = 'FOR_ALL'
      Caption = 'F3-'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      ImageIndex = 30
      ShortCut = 114
      OnExecute = acRowsSpravExecute
    end
    object acSvedInNakl: TAction
      Category = 'ROWS'
      Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
      ImageIndex = 6
      OnExecute = acSvedInNaklExecute
    end
    object acSvedInUved: TAction
      Category = 'ROWS'
      Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1080' '#1072#1082#1090' '#1086#1073' '#1086#1089#1090#1072#1090#1082#1072#1093
      ImageIndex = 6
      OnExecute = acSvedInUvedExecute
    end
  end
  object PopupTitle: TTBPopupMenu
    Images = f_main.img_Common
    Left = 291
    Top = 101
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
      Action = acSvedInAdd
      DisplayMode = nbdmImageAndText
    end
    object TBItem11: TTBItem
      Action = acSvedInEdit
      DisplayMode = nbdmImageAndText
    end
    object TBItem12: TTBItem
      Action = acSvedInCopy
      DisplayMode = nbdmImageAndText
    end
    object TBItem13: TTBItem
      Action = acSvedInDel
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
      Action = acPrintSved
      DisplayMode = nbdmImageAndText
    end
    object TBItem15: TTBItem
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      DisplayMode = nbdmImageAndText
      ImageIndex = 42
      OnClick = TBItem15Click
    end
    object TBSeparatorItem9: TTBSeparatorItem
    end
    object TBItem8: TTBItem
      Caption = #1058#1077#1082#1089#1090' '#1079#1072#1087#1088#1086#1089#1072
      OnClick = TBItem8Click
    end
  end
  object PopupRows: TTBPopupMenu
    Images = f_main.img_Common
    Left = 211
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
      Action = acSvedInRowsAdd
      DisplayMode = nbdmImageAndText
    end
    object TBItem25: TTBItem
      Action = acSvedInRowsEdit
      DisplayMode = nbdmImageAndText
    end
    object TBItem26: TTBItem
      Action = acSvedInRowsCopy
      DisplayMode = nbdmImageAndText
    end
    object TBItem27: TTBItem
      Action = acSvedInRowsDel
      DisplayMode = nbdmImageAndText
    end
    object TBItem20: TTBItem
      Action = acRowsSprav
    end
    object TBItem19: TTBItem
      Action = acSvedInRowsPost
    end
    object TBItem23: TTBItem
      Action = acSvedInRowsCancel
    end
    object TBItem35: TTBItem
      Action = acFind
    end
    object TBItem37: TTBItem
      Action = acSvedInRowsCalc
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
    object TBItem18: TTBItem
      Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
      ImageIndex = 6
      OnClick = acSvedInNaklExecute
    end
    object TBSeparatorItem11: TTBSeparatorItem
    end
    object TBItem38: TTBItem
      Caption = #1058#1077#1082#1089#1090' '#1079#1072#1087#1088#1086#1089#1072
      OnClick = TBItem38Click
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    Connected = True
    Left = 103
    Top = 113
  end
  object q_title: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */ '
      'a.*, KLS_PROD.SF_NAME as PROD_NAME'
      'FROM SVED_IN a, KLS_PROD'
      'WHERE a.PROD_ID_NPR=KLS_PROD.ID_NPR AND MESTO_ID=:MESTO_ID'
      '  AND ((1=1'
      '  AND 1=1 /* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1090#1080#1087#1091' '#1088#1072#1079#1075#1088#1091#1079#1082#1080' */'
      '  AND 1=1 /* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' */'
      '  AND 1=1 /* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' */'
      '  AND 1=1 /* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1087#1088#1086#1076#1091#1082#1090#1091' */'
      '  ) or a.ID=:TITLE_ID)'
      'ORDER BY sved_date DESC, sved_num DESC')
    Variables.Data = {
      0300000002000000090000003A4D4553544F5F49440300000004000000010000
      0000000000090000003A5449544C455F4944050000000000000000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      0400000018000000020000004944010000000000080000004D4553544F5F4944
      01000000000008000000535645445F4E554D0100000000000900000053564544
      5F4441544501000000000008000000535645445F564553010000000000080000
      00535645445F434E540100000000000A000000474F544F565F54494D45010000
      0000000E0000004245475F4E414C49565F54494D450100000000000E00000045
      4E445F4E414C49565F54494D450100000000000B000000444154455F4F464F52
      4D4C0100000000000B00000050524F445F49445F4E5052010000000000090000
      005645535F4E4554544F010000000000080000005645535F4B56495401000000
      000008000000504153505F4E554D0100000000000700000052455A5F4E554D01
      000000000009000000504153505F4441544501000000000002000000504C0100
      0000000005000000505F564F4401000000000006000000505F44495254010000
      000000060000004D475F534F4C01000000000005000000505F534F4C01000000
      00000900000050524F445F4E414D4501000000000004000000504C3135010000
      0000000E0000005645535F4E4554544F5F4B564954010000000000}
    UniqueFields = 'ID'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    UpdatingTable = 'SVED_IN'
    Session = ora_Session
    BeforeOpen = q_titleBeforeOpen
    AfterOpen = q_titleAfterOpen
    AfterScroll = q_titleAfterScroll
    OnFilterRecord = q_titleFilterRecord
    Left = 224
    Top = 128
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
    object q_titleSVED_VES: TFloatField
      DisplayLabel = #1041#1056#1059#1058#1058#1054' ('#1087#1088#1080#1077#1084#1082#1072')'
      FieldName = 'SVED_VES'
      Required = True
      DisplayFormat = '#0.0000000'
    end
    object q_titleSVED_CNT: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074#1072#1075#1086#1085#1086#1074
      FieldName = 'SVED_CNT'
      Required = True
    end
    object q_titleGOTOV_TIME: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100
      FieldName = 'GOTOV_TIME'
    end
    object q_titleBEG_NALIV_TIME: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1088#1072#1079#1075#1088#1091#1079#1082#1080
      FieldName = 'BEG_NALIV_TIME'
    end
    object q_titleEND_NALIV_TIME: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1088#1072#1079#1075#1088#1091#1079#1082#1080
      FieldName = 'END_NALIV_TIME'
    end
    object q_titleDATE_OFORML: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
      FieldName = 'DATE_OFORML'
    end
    object q_titleVES_NETTO: TFloatField
      DisplayLabel = #1053#1045#1058#1058#1054' ('#1087#1088#1080#1077#1084#1082#1072')'
      FieldName = 'VES_NETTO'
      Required = True
      DisplayFormat = '#0.0000000'
    end
    object q_titleVES_KVIT: TFloatField
      DisplayLabel = #1042#1077#1089' ('#1085#1072#1082#1083#1072#1076#1085#1072#1103'), '#1082#1075
      FieldName = 'VES_KVIT'
      Required = True
      DisplayFormat = '#0'
    end
    object q_titlePASP_NUM: TStringField
      DisplayLabel = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP_NUM'
      Size = 15
    end
    object q_titleREZ_NUM: TStringField
      DisplayLabel = #8470' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072
      FieldName = 'REZ_NUM'
      Size = 15
    end
    object q_titlePASP_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP_DATE'
    end
    object q_titlePL: TFloatField
      DisplayLabel = #1055#1083#1086#1090#1085'.'#1087#1088#1080' 20'#39'C'
      FieldName = 'PL'
      DisplayFormat = '#0.0000'
    end
    object q_titleP_VOD: TFloatField
      DisplayLabel = '% '#1074#1086#1076#1099
      FieldName = 'P_VOD'
    end
    object q_titleP_DIRT: TFloatField
      DisplayLabel = '% '#1084#1077#1093'. '#1087#1088#1080#1084#1077#1089#1077#1081
      FieldName = 'P_DIRT'
    end
    object q_titleMG_SOL: TFloatField
      DisplayLabel = #1057#1086#1076'.'#1089#1086#1083#1080' ('#1084#1075'/'#1083')'
      FieldName = 'MG_SOL'
    end
    object q_titleP_SOL: TFloatField
      DisplayLabel = '% '#1089#1086#1083#1077#1081
      FieldName = 'P_SOL'
    end
    object q_titlePROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      ReadOnly = True
      Required = True
      Size = 5
    end
    object q_titlePROD_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'PROD_NAME'
      Required = True
      Size = 40
    end
    object q_titleMESTO_ID: TFloatField
      FieldName = 'MESTO_ID'
      ReadOnly = True
      Required = True
    end
    object q_titlePL15: TFloatField
      DisplayLabel = #1055#1083#1086#1090#1085'.'#1087#1088#1080' 15'#39'C'
      FieldName = 'PL15'
      DisplayFormat = '#0.0000'
    end
    object q_titleVES_NETTO_KVIT: TFloatField
      DisplayLabel = #1053#1045#1058#1058#1054' ('#1085#1072#1082#1083#1072#1076#1085#1072#1103'), '#1082#1075
      FieldName = 'VES_NETTO_KVIT'
      DisplayFormat = '#0.0000'
    end
  end
  object ds_title: TDataSource
    DataSet = q_title
    Left = 224
    Top = 176
  end
  object q_rows: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      'a.*,a.rowid,'
      'so.STANOTP_KOD as STAN_OTP_KOD,'
      'so.STANOTP_NAME as STAN_OTP_NAME,'
      'sv.STANVOZ_KOD as STAN_VOZ_KOD,'
      'sv.STANVOZ_NAME as STAN_VOZ_NAME,'
      '(CASE'
      '   WHEN n.NAKL_ID IS NULL THEN '#39#39
      
        '   ELSE TO_CHAR(n.NAKL_NUM)||'#39' '#1086#1090' '#39'||TO_CHAR(n.NAKL_DATE,'#39'dd.mm.' +
        'yy'#39')'
      ' END) as NAKL_NUM,'
      '(CASE'
      '   WHEN u.UVED_ID IS NULL THEN '#39#39
      
        '   ELSE TO_CHAR(u.UVED_NUM)||'#39' '#1086#1090' '#39'||TO_CHAR(u.UVED_DATE,'#39'dd.mm.' +
        'yy'#39')'
      ' END) as UVED_NUM'
      'FROM'
      '  REESTR_IN a,'
      '  (SELECT ID as NAKL_ID,NAKL_NUM,NAKL_DATE FROM NAKL) n,'
      '  (SELECT ID as UVED_ID,UVED_NUM,UVED_DATE FROM UVED) u,'
      
        '  (SELECT ID as STANOTP_ID,STAN_KOD as STANOTP_KOD,STAN_NAME as ' +
        'STANOTP_NAME FROM KLS_STAN) so,'
      
        '  (SELECT ID as STANVOZ_ID,STAN_KOD as STANVOZ_KOD,STAN_NAME as ' +
        'STANVOZ_NAME FROM KLS_STAN) sv'
      'WHERE a.SVED_IN_ID=:SVED_IN_ID'
      'AND a.STAN_OTP_ID=so.STANOTP_ID(+)'
      'AND a.STAN_VOZ_ID=sv.STANVOZ_ID(+)'
      'AND a.NAKL_ID=n.NAKL_ID(+)'
      'AND a.UVED_ID=u.UVED_ID(+)'
      'ORDER BY a.SVED_POS')
    Variables.Data = {
      03000000010000000B0000003A535645445F494E5F494405000000050000006F
      3331350000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000003E000000020000004944010000000000080000004E554D5F43495354
      010000000000090000004B414C4942525F49440100000000000A000000535645
      445F494E5F4944010000000000080000004D4553544F5F494401000000000009
      0000005445585F50445F49440100000000000800000047524F54505F49440100
      000000000B0000005354414E5F4F54505F49440100000000000B000000464F52
      4D4E414B4C5F4944010000000000080000004E554D5F4B564954010000000000
      09000000444154455F4B5649540100000000000D000000504153505F4E554D5F
      4B5649540100000000000C00000052455A5F4E554D5F4B564954010000000000
      0E000000504153505F444154455F4B5649540100000000000A000000565A4C49
      565F4B5649540100000000000B00000054454D5045525F4B5649540100000000
      0007000000504C5F4B564954010000000000080000005645535F4B5649540100
      000000000500000054415249460100000000000B00000054415249465F475541
      52440100000000000C000000444154455F494E5F5354414E0100000000000900
      0000444154455F4F5447520100000000000C0000005641474F4E545950455F49
      44010000000000080000005645535F434953540100000000000B000000564147
      4F574E45525F4944010000000000080000004341504143495459010000000000
      07000000504C4F4D42413101000000000007000000504C4F4D42413201000000
      000005000000565A4C49560100000000000600000054454D5045520100000000
      000700000046414B545F504C0100000000000300000056455301000000000009
      0000005645535F4E4554544F01000000000008000000444154455F564F5A0100
      00000000080000004B5649545F564F5A0100000000000700000053554D5F564F
      5A0100000000000B0000005354414E5F564F5A5F49440100000000000C000000
      5354414E5F4F54505F4B4F440100000000000D0000005354414E5F4F54505F4E
      414D450100000000000C0000005354414E5F564F5A5F4B4F440100000000000D
      0000005354414E5F564F5A5F4E414D4501000000000008000000535645445F50
      4F5301000000000009000000454D5054595F564F5A0100000000000600000056
      4F4C554D4501000000000008000000564F4C554D453135010000000000040000
      0043544C5601000000000007000000474F53545F494401000000000009000000
      5A50555F5459504531010000000000090000005A50555F545950453201000000
      0000070000004241445F4E554D010000000000070000004E414B4C5F49440100
      00000000080000004E414B4C5F4E554D010000000000080000004E414B4C5F50
      4F53010000000000050000004F5354415401000000000007000000555645445F
      494401000000000008000000555645445F504F53010000000000080000005556
      45445F4E554D0100000000000A000000505F564F445F4B564954010000000000
      0B000000505F444952545F4B5649540100000000000A000000505F534F4C5F4B
      5649540100000000000E0000005645535F4E4554544F5F4B5649540100000000
      000C0000004E554D5F4B5649545F545854010000000000}
    UniqueFields = 'ID'
    Master = q_title
    MasterFields = 'ID'
    DetailFields = 'SVED_IN_ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'REESTR_IN'
    Session = ora_Session
    AfterInsert = q_rowsAfterInsert
    BeforePost = q_rowsBeforePost
    AfterPost = q_rowsAfterPost
    AfterDelete = q_rowsAfterDelete
    BeforeScroll = q_rowsBeforeScroll
    AfterScroll = q_rowsAfterScroll
    OnCalcFields = q_rowsCalcFields
    OnFilterRecord = q_rowsFilterRecord
    Left = 248
    Top = 408
    object q_rowsID: TFloatField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object q_rowsNUM_CIST: TStringField
      DisplayLabel = #8470' '#1074#1072#1075#1086#1085#1072
      FieldName = 'NUM_CIST'
      Required = True
      OnChange = q_rowsNUM_CISTChange
      Size = 10
    end
    object q_rowsSVED_IN_ID: TStringField
      FieldName = 'SVED_IN_ID'
      ReadOnly = True
      Required = True
      Size = 9
    end
    object q_rowsMESTO_ID: TIntegerField
      FieldName = 'MESTO_ID'
      ReadOnly = True
      Required = True
    end
    object q_rowsTEX_PD_ID: TFloatField
      FieldName = 'TEX_PD_ID'
    end
    object q_rowsGROTP_ID: TFloatField
      FieldName = 'GROTP_ID'
    end
    object q_rowsSTAN_OTP_ID: TFloatField
      FieldName = 'STAN_OTP_ID'
    end
    object q_rowsFORMNAKL_ID: TIntegerField
      FieldName = 'FORMNAKL_ID'
    end
    object q_rowsNUM_KVIT: TFloatField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'NUM_KVIT'
    end
    object q_rowsDATE_KVIT: TDateTimeField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'DATE_KVIT'
    end
    object q_rowsPASP_NUM_KVIT: TStringField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1055#1072#1089#1087#1086#1088#1090
      FieldName = 'PASP_NUM_KVIT'
      Size = 15
    end
    object q_rowsREZ_NUM_KVIT: TStringField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1056#1077#1079#1077#1088#1074#1091#1072#1088
      FieldName = 'REZ_NUM_KVIT'
      Size = 15
    end
    object q_rowsPASP_DATE_KVIT: TDateTimeField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1044#1072#1090#1072' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP_DATE_KVIT'
    end
    object q_rowsVZLIV_KVIT: TIntegerField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1042#1079#1083#1080#1074
      FieldName = 'VZLIV_KVIT'
    end
    object q_rowsTEMPER_KVIT: TFloatField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1058#1077#1084#1087#1077'- '#1088#1072#1090#1091#1088#1072
      FieldName = 'TEMPER_KVIT'
    end
    object q_rowsPL_KVIT: TFloatField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1072#1089#1087#1086#1088#1090#1085#1072#1103
      FieldName = 'PL_KVIT'
    end
    object q_rowsVES_KVIT: TFloatField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1042#1077#1089' '#1074' '#1085#1072#1082#1083'., '#1082#1075
      FieldName = 'VES_KVIT'
      DisplayFormat = '#0'
      EditFormat = '#0.000'
    end
    object q_rowsTARIF: TFloatField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1058#1072#1088#1080#1092
      FieldName = 'TARIF'
    end
    object q_rowsTARIF_GUARD: TFloatField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1055#1083#1072#1090#1072' '#1079#1072' '#1086#1093#1088#1072#1085#1091
      FieldName = 'TARIF_GUARD'
    end
    object q_rowsDATE_IN_STAN: TDateTimeField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1044#1072#1090#1072' '#1087#1088#1080#1073'. '#1085#1072' '#1089#1090#1072#1085#1094#1080#1102
      FieldName = 'DATE_IN_STAN'
    end
    object q_rowsDATE_OTGR: TDateTimeField
      DisplayLabel = '|'#1055#1088#1080#1077#1084#1082#1072'|'#1044#1072#1090#1072
      FieldName = 'DATE_OTGR'
      Required = True
    end
    object q_rowsVAGONTYPE_ID: TIntegerField
      FieldName = 'VAGONTYPE_ID'
    end
    object q_rowsKALIBR_ID: TStringField
      DisplayLabel = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
      FieldName = 'KALIBR_ID'
      OnValidate = q_rowsKALIBR_IDValidate
      Size = 5
    end
    object q_rowsVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1087#1091#1089#1090#1086#1075#1086' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VES_CIST'
    end
    object q_rowsVAGOWNER_ID: TIntegerField
      FieldName = 'VAGOWNER_ID'
    end
    object q_rowsCAPACITY: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086'- '#1087#1086#1076#1098#1077#1084'- '#1085#1086#1089#1090#1100
      FieldName = 'CAPACITY'
      Size = 10
    end
    object q_rowsPLOMBA1: TStringField
      DisplayLabel = '|'#1042#1086#1079#1074#1088#1072#1090'|'#1055#1083#1086#1084#1073#1072' 1'
      FieldName = 'PLOMBA1'
      Size = 15
    end
    object q_rowsPLOMBA2: TStringField
      DisplayLabel = '|'#1042#1086#1079#1074#1088#1072#1090'|'#1055#1083#1086#1084#1073#1072' 2'
      FieldName = 'PLOMBA2'
      Size = 15
    end
    object q_rowsVZLIV: TIntegerField
      DisplayLabel = '|'#1055#1088#1080#1077#1084#1082#1072'|'#1042#1079#1083#1080#1074
      FieldName = 'VZLIV'
      OnValidate = q_rowsVZLIVValidate
    end
    object q_rowsTEMPER: TFloatField
      DisplayLabel = '|'#1055#1088#1080#1077#1084#1082#1072'|'#1058#1077#1084#1087#1077'- '#1088#1072#1090#1091#1088#1072
      FieldName = 'TEMPER'
      OnValidate = q_rowsTEMPERValidate
    end
    object q_rowsFAKT_PL: TFloatField
      DisplayLabel = '|'#1055#1088#1080#1077#1084#1082#1072'|'#1055#1083#1086#1090#1085#1086#1089#1090#1100
      FieldName = 'FAKT_PL'
      DisplayFormat = '#0.0000'
    end
    object q_rowsVES: TFloatField
      DisplayLabel = '|'#1055#1088#1080#1077#1084#1082#1072'|'#1042#1077#1089' '#1087#1086' '#1087#1088#1080#1077#1084#1082#1077
      FieldName = 'VES'
      DisplayFormat = '#0.0000000'
      EditFormat = '#0.0000000'
    end
    object q_rowsVES_NETTO: TFloatField
      DisplayLabel = '|'#1055#1088#1080#1077#1084#1082#1072'|'#1042#1077#1089' '#1053#1045#1058#1058#1054
      FieldName = 'VES_NETTO'
      DisplayFormat = '#0.0000000'
      EditFormat = '#0.0000000'
    end
    object q_rowsDATE_VOZ: TDateTimeField
      DisplayLabel = '|'#1042#1086#1079#1074#1088#1072#1090'|'#1044#1072#1090#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
      FieldName = 'DATE_VOZ'
    end
    object q_rowsKVIT_VOZ: TStringField
      DisplayLabel = '|'#1042#1086#1079#1074#1088#1072#1090'|'#8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'KVIT_VOZ'
      Size = 12
    end
    object q_rowsSUM_VOZ: TFloatField
      DisplayLabel = '|'#1042#1086#1079#1074#1088#1072#1090'|'#1058#1072#1088#1080#1092' '#1079#1072' '#1074#1086#1079#1074#1088#1072#1090
      FieldName = 'SUM_VOZ'
    end
    object q_rowsSTAN_VOZ_ID: TFloatField
      FieldName = 'STAN_VOZ_ID'
    end
    object q_rowsSTAN_OTP_NAME: TStringField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1057#1090#1072#1085#1094#1080#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'STAN_OTP_NAME'
      ReadOnly = True
      Size = 50
    end
    object q_rowsVAGOWNER_NAME: TStringField
      DisplayLabel = #1042#1083#1072#1076#1077#1083#1077#1094' '#1074#1072#1075#1086#1085#1072
      FieldKind = fkLookup
      FieldName = 'VAGOWNER_NAME'
      LookupDataSet = q_VagOwner
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VAGOWNER_ID'
      ReadOnly = True
      Size = 60
      Lookup = True
    end
    object q_rowsSTAN_VOZ_NAME: TStringField
      DisplayLabel = '|'#1042#1086#1079#1074#1088#1072#1090'|'#1057#1090#1072#1085#1094#1080#1103' '#1074#1086#1079#1074#1088#1072#1090#1072
      FieldName = 'STAN_VOZ_NAME'
      ReadOnly = True
      Size = 50
    end
    object q_rowsSTAN_OTP_KOD: TIntegerField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1050#1086#1076
      FieldName = 'STAN_OTP_KOD'
      ReadOnly = True
    end
    object q_rowsSTAN_VOZ_KOD: TIntegerField
      DisplayLabel = '|'#1042#1086#1079#1074#1088#1072#1090'|'#1050#1086#1076
      FieldName = 'STAN_VOZ_KOD'
      ReadOnly = True
    end
    object q_rowsSVED_POS: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'SVED_POS'
    end
    object q_rowsEMPTY_VOZ: TIntegerField
      DisplayLabel = '|'#1042#1086#1079#1074#1088#1072#1090'|'#1055#1086#1088#1086#1078'- '#1085#1080#1081'?'
      FieldName = 'EMPTY_VOZ'
      Required = True
    end
    object q_rowsVOLUME: TFloatField
      DisplayLabel = '|'#1055#1088#1080#1077#1084#1082#1072'|'#1054#1073#1098#1077#1084
      FieldName = 'VOLUME'
    end
    object q_rowsVOLUME15: TFloatField
      DisplayLabel = '|'#1055#1088#1080#1077#1084#1082#1072'|'#1054#1073#1098#1077#1084' '#1087#1088#1080' 15'#39'C'
      FieldName = 'VOLUME15'
      DisplayFormat = '#0.0000'
    end
    object q_rowsCTLV: TFloatField
      DisplayLabel = '|'#1055#1088#1080#1077#1084#1082#1072'|'#1050#1086#1101#1092'. CTLv'
      FieldName = 'CTLV'
      DisplayFormat = '#0.0000'
    end
    object q_rowsGOST_ID: TIntegerField
      FieldName = 'GOST_ID'
      Required = True
    end
    object q_rowsZPU_TYPE1: TFloatField
      FieldName = 'ZPU_TYPE1'
    end
    object q_rowsZPU_TYPE2: TFloatField
      FieldName = 'ZPU_TYPE2'
    end
    object q_rowsVybor: TIntegerField
      DisplayLabel = '+'
      FieldKind = fkCalculated
      FieldName = 'Vybor'
      Calculated = True
    end
    object q_rowsZPU_TYPE1_NAME: TStringField
      DisplayLabel = '|'#1042#1086#1079#1074#1088#1072#1090'|'#1058#1080#1087' '#1087#1083#1086#1084#1073#1099' 1'
      FieldKind = fkLookup
      FieldName = 'ZPU_TYPE1_NAME'
      LookupDataSet = q_ZpuType1
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ZPU_TYPE1'
      Size = 40
      Lookup = True
    end
    object q_rowsZPU_TYPE2_NAME: TStringField
      DisplayLabel = '|'#1042#1086#1079#1074#1088#1072#1090'|'#1058#1080#1087' '#1087#1083#1086#1084#1073#1099' 2'
      FieldKind = fkLookup
      FieldName = 'ZPU_TYPE2_NAME'
      LookupDataSet = q_ZpuType2
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ZPU_TYPE2'
      Size = 40
      Lookup = True
    end
    object q_rowsBAD_NUM: TIntegerField
      FieldName = 'BAD_NUM'
    end
    object q_rowsNAKL_ID: TFloatField
      FieldName = 'NAKL_ID'
      ReadOnly = True
    end
    object q_rowsNAKL_NUM: TStringField
      DisplayLabel = 'N '#1085#1072#1082#1083#1072#1076#1085#1086#1081' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
      FieldName = 'NAKL_NUM'
      ReadOnly = True
      Size = 52
    end
    object q_rowsOSTAT: TIntegerField
      DisplayLabel = #1054#1089#1090#1072'- '#1090#1086#1082', '#1089#1084
      FieldName = 'OSTAT'
    end
    object q_rowsUVED_ID: TIntegerField
      FieldName = 'UVED_ID'
    end
    object q_rowsUVED_NUM: TStringField
      DisplayLabel = 'N '#1091#1074#1077#1076#1086#1084#1083#1077'- '#1085#1080#1077
      FieldName = 'UVED_NUM'
      Size = 52
    end
    object q_rowsP_VOD_KVIT: TFloatField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|% '#1074#1086#1076#1099
      FieldName = 'P_VOD_KVIT'
      DisplayFormat = '#0.0000'
    end
    object q_rowsP_DIRT_KVIT: TFloatField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|% '#1084#1077#1093'. '#1087#1088#1080#1084#1077#1089#1077#1081
      FieldName = 'P_DIRT_KVIT'
      DisplayFormat = '#0.0000'
    end
    object q_rowsP_SOL_KVIT: TFloatField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|% '#1089#1086#1083#1077#1081
      FieldName = 'P_SOL_KVIT'
      DisplayFormat = '#0.0000'
    end
    object q_rowsVES_NETTO_KVIT: TFloatField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#1053#1045#1058#1058#1054' ('#1085#1072#1082#1083'.), '#1082#1075
      FieldName = 'VES_NETTO_KVIT'
      DisplayFormat = '#0.0000'
    end
    object q_rowsNUM_KVIT_TXT: TStringField
      DisplayLabel = '|'#1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077'|'#8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'NUM_KVIT_TXT'
      Size = 15
    end
  end
  object ds_rows: TDataSource
    DataSet = q_rows
    Left = 296
    Top = 408
  end
  object pkgFOR_SVED_IN: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_SVED_IN'
    Left = 184
    Top = 423
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'PageControl1.<P>.ActivePage'
      'PageControl1.tabTitleInfo.GridTitle.<P>.Columns.ColumnsIndex'
      
        'PageControl1.tabTitleInfo.GridTitle.<P>.Columns.<ForAllItems>.Wi' +
        'dth'
      'PageControl1.tabTitleInfo.GridTitle.<P>.Height')
    Left = 344
    Top = 104
  end
  object q_Prod: TOracleDataSet
    SQL.Strings = (
      'select'
      '  kls_prod.id_npr,'
      '  kls_prod.SF_NAME as NAME_NPR'
      
        'from kls_prod, kls_prod_groups_desc d where kls_prod.id_npr=d.pr' +
        'od_id_npr and d.PROD_TYPE_GRP_ID=2'
      'and 1=1'
      'ORDER BY 1')
    Session = ora_Session
    Left = 499
    Top = 113
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
  object ds_Prod: TDataSource
    DataSet = q_Prod
    Left = 547
    Top = 117
  end
  object q_VagOwner: TOracleDataSet
    SQL.Strings = (
      'select '
      '  ID,'
      '  kls_vagowner.DISPLAY_NAME as NAME,'
      '  sortby'
      'from kls_vagowner'
      'where LOAD_TYPE_ID=1'
      'ORDER BY sortby')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      000006000000534F52544259010000000000}
    Session = ora_Session
    Active = True
    Left = 475
    Top = 393
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
  object ds_VagOwner: TDataSource
    DataSet = q_VagOwner
    Left = 499
    Top = 349
  end
  object q_StanVoz: TOracleDataSet
    SQL.Strings = (
      'select DISTINCT'
      '  kls_stan.ID,'
      '  kls_stan.STAN_NAME || '#39' '#39' || KLS_STAN.STAN_KOD as NAME,'
      '  kls_stan.STAN_NAME'
      'from kls_stan'
      'ORDER BY kls_stan.STAN_NAME')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      0000090000005354414E5F4E414D45010000000000}
    Session = ora_Session
    Left = 523
    Top = 353
    object FloatField1: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'NAME'
      Size = 91
    end
  end
  object ds_StanVoz: TDataSource
    DataSet = q_StanVoz
    Left = 531
    Top = 389
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 408
    Top = 104
  end
  object q_temp_ves: TOracleDataSet
    SQL.Strings = (
      'select *'
      'from temp_ves')
    UniqueFields = 'TAG'
    Session = ora_Session
    Left = 169
    Top = 131
  end
  object pkgFor_cist: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_CIST'
    Left = 33
    Top = 422
  end
  object pkgFor_ves: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_VES'
    Left = 105
    Top = 422
  end
  object q_ZpuType1: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  a.ID,'
      '  a.NAME as NAME'
      'from kls_zpu_types a '
      'ORDER BY a.ID')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = ora_Session
    Active = True
    Left = 475
    Top = 441
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
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = ora_Session
    Active = True
    Left = 475
    Top = 489
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
  object q_itogs: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '  a.SVED_DATE,'
      '  KLS_PROD.ID_NPR as PROD_ID_NPR,'
      '  KLS_PROD.SF_NAME as PROD_NAME,'
      '  COUNT(*) as VAG_CNT,'
      '  SUM(b.VES) as SUM_VES,'
      '  SUM(b.VES_NETTO) as SUM_VES_NETTO,'
      '  SUM(b.VES_KVIT) as SUM_VES_KVIT'
      'FROM REESTR_IN b, SVED_IN a, KLS_PROD'
      'WHERE a.PROD_ID_NPR=KLS_PROD.ID_NPR AND a.MESTO_ID=:MESTO_ID'
      '  AND b.SVED_IN_ID=a.ID'
      '  AND 1=1 /* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' */'
      '  AND 1=1 /* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' */'
      'GROUP BY a.SVED_DATE,KLS_PROD.ID_NPR,KLS_PROD.SF_NAME'
      '')
    Variables.Data = {
      0300000001000000090000003A4D4553544F5F49440300000004000000010000
      0000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000070000000B00000050524F445F49445F4E5052010000000000090000
      0050524F445F4E414D45010000000000070000005641475F434E540100000000
      000700000053554D5F5645530100000000000D00000053554D5F5645535F4E45
      54544F0100000000000C00000053554D5F5645535F4B56495401000000000009
      000000535645445F44415445010000000000}
    ReadOnly = True
    RefreshOptions = [roAfterInsert]
    Session = ora_Session
    BeforeOpen = q_itogsBeforeOpen
    Left = 384
    Top = 192
    object q_itogsPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object q_itogsPROD_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'PROD_NAME'
      Required = True
      Size = 40
    end
    object q_itogsVAG_CNT: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074#1072#1075#1086#1085#1086#1074
      FieldName = 'VAG_CNT'
    end
    object q_itogsSUM_VES: TFloatField
      DisplayLabel = #1042#1077#1089' '#1087#1086' '#1087#1088#1080#1077#1084#1082#1077
      FieldName = 'SUM_VES'
      DisplayFormat = '#0.0000000'
    end
    object q_itogsSUM_VES_NETTO: TFloatField
      DisplayLabel = #1042#1077#1089' '#1053#1045#1058#1058#1054
      FieldName = 'SUM_VES_NETTO'
      DisplayFormat = '#0.0000000'
    end
    object q_itogsSUM_VES_KVIT: TFloatField
      DisplayLabel = #1042#1077#1089' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077', '#1082#1075
      FieldName = 'SUM_VES_KVIT'
      DisplayFormat = '#0'
    end
    object q_itogsSVED_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1083#1080#1074#1072' / '#1088#1072#1079#1075#1088#1091#1079#1082#1080
      FieldName = 'SVED_DATE'
      Required = True
    end
  end
  object ds_itogs: TDataSource
    DataSet = q_itogs
    Left = 448
    Top = 192
  end
  object PopupItogs: TTBPopupMenu
    Images = f_main.img_Common
    Left = 315
    Top = 229
    object TBItem36: TTBItem
      Caption = #1042' '#1086#1082#1085#1077
      OnClick = TBItem36Click
    end
    object TBSeparatorItem10: TTBSeparatorItem
    end
    object TBItem42: TTBItem
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      DisplayMode = nbdmImageAndText
      ImageIndex = 42
      OnClick = TBItem42Click
    end
    object TBSeparatorItem12: TTBSeparatorItem
    end
    object TBItem39: TTBItem
      Caption = #1058#1077#1082#1089#1090' '#1079#1072#1087#1088#1086#1089#1072
      OnClick = TBItem39Click
    end
  end
end
