inherited f_Nakl: Tf_Nakl
  Left = 277
  Top = 202
  Width = 865
  Height = 587
  Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 248
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
    Height = 40
    Align = alTop
    Caption = ' '#1060#1080#1083#1100#1090#1088' '
    TabOrder = 0
    object lbProdName: TLabel
      Left = 375
      Top = 16
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1088#1086#1076#1091#1082#1090':'
    end
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
    object lc_ProdGU12: TRxDBLookupCombo
      Left = 432
      Top = 13
      Width = 201
      Height = 21
      DropDownCount = 8
      DisplayEmpty = '< '#1042#1057#1045' >'
      EmptyValue = '-1'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = ds_ProdGU12
      TabOrder = 0
    end
    object Time1: TDateTimePicker
      Left = 51
      Top = 14
      Width = 68
      Height = 21
      Date = 37088.641009456000000000
      Time = 37088.641009456000000000
      Kind = dtkTime
      TabOrder = 1
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
      TabOrder = 2
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
      TabOrder = 3
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
      TabOrder = 4
      OnCloseUp = CheckTime
      OnChange = CheckTime
      OnExit = CheckTime
    end
  end
  object pageTitle: TPageControl
    Left = 0
    Top = 40
    Width = 857
    Height = 208
    ActivePage = tabTitleDetail
    Align = alTop
    TabOrder = 1
    object tabTitleDetail: TTabSheet
      Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
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
          object TBItem2: TTBItem
            Action = acMONaklEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem3: TTBItem
            Action = acMONaklView
            DisplayMode = nbdmImageAndText
          end
          object TBItem1: TTBItem
            Action = acMONaklDel
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
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind]
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
        OnGetCellParams = GridTitleGetCellParams
        OnSortMarkingChanged = GridTitleSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAKL_NUM'
            Footers = <>
            Title.TitleButton = True
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'NAKL_DATE'
            Footers = <>
            Title.TitleButton = True
            Width = 98
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'UPAK_VES'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'VES_CIST'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'VES_ALL'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'K_TAR'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'FORMNAKL_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 127
          end
          item
            EditButtons = <>
            FieldName = 'FORMSHAB_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 109
          end
          item
            EditButtons = <>
            FieldName = 'SHABEXP_ID'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'EXP_CONTRACT'
            Footers = <>
            Title.TitleButton = True
            Width = 129
          end
          item
            EditButtons = <>
            FieldName = 'PRIM_DOG'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'EXP_PROD'
            Footers = <>
            Title.TitleButton = True
            Width = 137
          end
          item
            EditButtons = <>
            FieldName = 'ID'
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
    Top = 253
    Width = 857
    Height = 300
    ActivePage = tabRowsDetail
    Align = alClient
    TabOrder = 2
    object tabRowsDetail: TTabSheet
      Caption = #1055#1086#1079#1080#1094#1080#1080' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
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
          object TBItem34: TTBItem
            Action = acMONaklRowsDel
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object GridRows: TDBGridEh
        Left = 0
        Top = 26
        Width = 849
        Height = 246
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
            FieldName = 'NAKL_POS'
            Footers = <>
            Title.TitleButton = True
            Width = 27
          end
          item
            EditButtons = <>
            FieldName = 'NUM_CIST'
            Footers = <>
            Title.TitleButton = True
            Width = 91
          end
          item
            EditButtons = <>
            FieldName = 'UVED_NUM'
            Footers = <>
            Title.TitleButton = True
            Width = 92
          end
          item
            EditButtons = <>
            FieldName = 'NCISTDOP'
            Footers = <>
            Title.TitleButton = True
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = 'KALIBR_ID'
            Footers = <>
            Title.TitleButton = True
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = 'AXES'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'VES_CIST'
            Footers = <>
            Title.TitleButton = True
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'CAPACITY'
            Footers = <>
            Title.TitleButton = True
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'UPAK_VES'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'VES_ALL'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'NOM_ZD'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'PROD_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 162
          end
          item
            EditButtons = <>
            FieldName = 'SVED_NUM'
            Footers = <>
            Title.TitleButton = True
            Width = 125
          end
          item
            EditButtons = <>
            FieldName = 'ZPU_TYPE1_NAME'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'PLOMBA1'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'ROSINSPL1'
            Footers = <>
            Title.TitleButton = True
            Width = 88
          end
          item
            EditButtons = <>
            FieldName = 'ZPU_TYPE2_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 169
          end
          item
            EditButtons = <>
            FieldName = 'PLOMBA2'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'ROSINSPL2'
            Footers = <>
            Title.TitleButton = True
            Width = 103
          end
          item
            EditButtons = <>
            FieldName = 'VAGOWNER_NAME'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'PASP_NUM'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'REZ_NUM'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'PASP_DATE'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'NAKL_ID'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            Title.TitleButton = True
          end>
      end
    end
    object tabRowsItogs: TTabSheet
      Caption = #1048#1090#1086#1075#1080' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
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
    object acMONaklEdit: TAction
      Category = 'TITLE'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      OnExecute = acMONaklEditExecute
    end
    object acMONaklDel: TAction
      Category = 'TITLE'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acMONaklDelExecute
    end
    object acMONaklRowsDel: TAction
      Category = 'ROWS'
      Caption = 'F8-'#1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 119
      OnExecute = acMONaklRowsDelExecute
    end
    object acPrint: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
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
    object acMONaklView: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 1
      OnExecute = acMONaklViewExecute
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
      Caption = #1053#1086#1074#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
      DisplayMode = nbdmImageAndText
      ImageIndex = 0
      OnClick = acMONaklAddExecute
    end
    object TBItem11: TTBItem
      Action = acMONaklEdit
      DisplayMode = nbdmImageAndText
    end
    object TBItem12: TTBItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      DisplayMode = nbdmImageAndText
      ImageIndex = 4
    end
    object TBItem13: TTBItem
      Action = acMONaklDel
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
      Action = acMONaklRowsDel
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
    Left = 127
    Top = 161
  end
  object q_title: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '  s.rowid,  '
      '  s.*,'
      '  KLS_FORMNAKL.FORM_NAME as FORMNAKL_NAME,'
      '  KLS_FORMSHAB.NAME as FORMSHAB_NAME,'
      '  KLS_PROD_GU12.NAME_GU12,'
      
        '  KLS_DOG.DOG_NUMBER as EXP_CONTRACT, KLS_SHABEXP.PRIM_DOG, KLS_' +
        'PROD.ABBR_NPR as EXP_PROD'
      
        'FROM NAKL s, KLS_FORMNAKL, KLS_FORMSHAB, KLS_PROD_GU12, KLS_SHAB' +
        'EXP, KLS_DOG, KLS_PROD  '
      'WHERE s.FORMNAKL_ID=KLS_FORMNAKL.ID'
      '  AND s.SHABNAKL_ID=KLS_FORMSHAB.ID(+)'
      '  AND s.PROD_GU12_ID=KLS_PROD_GU12.ID(+)'
      
        '  AND s.SHABEXP_ID=KLS_SHABEXP.ID(+) AND KLS_SHABEXP.DOG_ID=KLS_' +
        'DOG.ID(+) AND KLS_SHABEXP.PROD_ID_NPR=KLS_PROD.ID_NPR(+)'
      
        '/* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' */ AND s.NAKL_DATE>=TO_DATE('#39'01.08.2005'#39','#39'dd.m' +
        'm.yyyy'#39')'
      
        '/* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077' */ AND s.NAKL_DATE<=TO_DATE('#39'31.12.2005'#39','#39'dd.m' +
        'm.yyyy'#39')'
      '/* '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1087#1088#1086#1076#1091#1082#1090#1091' */ AND 1=1'
      'AND s.MESTO_ID=:MESTO_ID AND s.LOAD_TYPE_ID=:LOAD_TYPE_ID'
      'ORDER BY NAKL_date DESC, NAKL_num DESC')
    Variables.Data = {
      0300000002000000090000003A4D4553544F5F49440300000004000000010000
      00000000000D0000003A4C4F41445F545950455F494403000000040000000100
      000000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000001B0000000200000049440100000000080000004D4553544F5F494401
      000000000C0000004C4F41445F545950455F4944010000000008000000564553
      5F434953540100000000070000005645535F414C4C0100000000080000004E41
      4B4C5F4E554D0100000000090000004E414B4C5F4441544501000000000C0000
      0050524F445F475531325F494401000000000B000000534841424E414B4C5F49
      440100000000080000005550414B5F5645530100000000030000005645530100
      0000000B000000464F524D4E414B4C5F494401000000000A0000005348414245
      58505F49440100000000050000004B5F54415201000000000D000000464F524D
      4E414B4C5F4E414D4501000000000D000000464F524D534841425F4E414D4501
      00000000090000004E414D455F4755313201000000000C0000004558505F434F
      4E54524143540100000000080000005052494D5F444F47010000000008000000
      4558505F50524F440100000000060000004E4F4D5F5A4401000000000B000000
      50524F445F49445F4E505201000000000A00000053484142564F5A5F49440100
      0000000600000049535F45585001000000000C0000004F5045524E414C49565F
      4944010000000006000000444F475F49440100000000070000005354414E5F49
      440100000000}
    UniqueFields = 'ID'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    UpdatingTable = 'NAKL'
    Session = ora_Session
    BeforeOpen = q_titleBeforeOpen
    AfterOpen = q_titleAfterOpen
    AfterScroll = q_titleAfterScroll
    OnFilterRecord = q_titleFilterRecord
    Left = 248
    Top = 160
    object q_titleID: TFloatField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object q_titleMESTO_ID: TFloatField
      FieldName = 'MESTO_ID'
      ReadOnly = True
      Required = True
    end
    object q_titleLOAD_TYPE_ID: TFloatField
      FieldName = 'LOAD_TYPE_ID'
      ReadOnly = True
      Required = True
    end
    object q_titleNAKL_NUM: TFloatField
      DisplayLabel = #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'NAKL_NUM'
      ReadOnly = True
      Required = True
    end
    object q_titleNAKL_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'NAKL_DATE'
      ReadOnly = True
      Required = True
    end
    object q_titlePROD_GU12_ID: TStringField
      FieldName = 'PROD_GU12_ID'
      ReadOnly = True
      Size = 10
    end
    object q_titleSHABNAKL_ID: TFloatField
      FieldName = 'SHABNAKL_ID'
      ReadOnly = True
    end
    object q_titleUPAK_VES: TFloatField
      DisplayLabel = #1042#1077#1089' '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
      FieldName = 'UPAK_VES'
      ReadOnly = True
      Required = True
    end
    object q_titleVES: TFloatField
      DisplayLabel = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1090#1085
      FieldName = 'VES'
      ReadOnly = True
      Required = True
    end
    object q_titleVES_ALL: TFloatField
      DisplayLabel = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1074#1072#1075#1086#1085#1072', '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
      FieldName = 'VES_ALL'
      ReadOnly = True
      Required = True
    end
    object q_titleVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072', '#1090#1085
      FieldName = 'VES_CIST'
      ReadOnly = True
      Required = True
    end
    object q_titleFORMNAKL_ID: TFloatField
      FieldName = 'FORMNAKL_ID'
      ReadOnly = True
      Required = True
    end
    object q_titleSHABEXP_ID: TFloatField
      DisplayLabel = #1064#1072#1073#1083#1086#1085' '#1101#1082#1089#1087'. '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'SHABEXP_ID'
      ReadOnly = True
    end
    object q_titleK_TAR: TStringField
      DisplayLabel = #1050#1086#1076' '#1080#1089#1082#1083'. '#1090#1072#1088#1080#1092#1072
      FieldName = 'K_TAR'
      ReadOnly = True
      Size = 10
    end
    object q_titleFORMNAKL_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'FORMNAKL_NAME'
      ReadOnly = True
      Required = True
      Size = 30
    end
    object q_titleFORMSHAB_NAME: TStringField
      DisplayLabel = #1064#1072#1073#1083#1086#1085' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'FORMSHAB_NAME'
      ReadOnly = True
      Size = 30
    end
    object q_titleNAME_GU12: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090' ('#1078'/'#1076')'
      FieldName = 'NAME_GU12'
      ReadOnly = True
      Size = 40
    end
    object q_titleEXP_CONTRACT: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1082#1090' ('#1069#1050#1057#1055#1054#1056#1058')'
      FieldName = 'EXP_CONTRACT'
      ReadOnly = True
      Size = 30
    end
    object q_titlePRIM_DOG: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1082#1090' ('#1069#1050#1057#1055#1054#1056#1058')'
      FieldName = 'PRIM_DOG'
      ReadOnly = True
    end
    object q_titleEXP_PROD: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090' ('#1069#1050#1057#1055#1054#1056#1058')'
      FieldName = 'EXP_PROD'
      ReadOnly = True
    end
    object q_titleNOM_ZD: TStringField
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_titlePROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 5
    end
    object q_titleSHABVOZ_ID: TFloatField
      FieldName = 'SHABVOZ_ID'
    end
    object q_titleIS_EXP: TIntegerField
      FieldName = 'IS_EXP'
    end
    object q_titleOPERNALIV_ID: TFloatField
      FieldName = 'OPERNALIV_ID'
    end
    object q_titleDOG_ID: TFloatField
      FieldName = 'DOG_ID'
    end
    object q_titleSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
  end
  object ds_title: TDataSource
    DataSet = q_title
    Left = 288
    Top = 160
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
      '   WHEN u.UVEDID IS NULL THEN '#39#39
      
        '   ELSE TO_CHAR(u.UVEDNUM)||'#39' '#1086#1090' '#39'||TO_CHAR(u.UVED_DATE,'#39'dd.mm.y' +
        'yyy hh24:mi:ss'#39')'
      ' END) as UVED_NUM,'
      ' vt.VAGONTYPE_NAME,'
      ' zt1.ZPU_TYPE1_NAME,'
      ' zt2.ZPU_TYPE2_NAME,'
      ' vo.VAGOWNER_NAME'
      'FROM REESTR a,'
      
        '   (SELECT ID as SVEDID,SVED_NUM as SVEDNUM,SVED_DATE,NOM_ZD,PRO' +
        'D_ID_NPR,PASP_ID,PASP_NUM,REZ_NUM,PASP_DATE FROM SVED) s,'
      
        '   (SELECT ID as UVEDID,UVED_NUM as UVEDNUM,UVED_DATE FROM UVED)' +
        ' u,'
      '   (SELECT ID_NPR,ABBR_NPR as PROD_NAME FROM KLS_PROD) p,'
      '   (SELECT NOM_ZD as MON_NOM_ZD, DATE_PLAN FROM MONTH) m,'
      
        '   (SELECT ID as VAGTYPE_ID, ABBR_NAME AS VAGONTYPE_NAME FROM KL' +
        'S_VAGONTYPE) vt,'
      
        '   (SELECT ID as ZPU_TYPE1_ID, NAME as ZPU_TYPE1_NAME FROM KLS_Z' +
        'PU_TYPES) zt1,'
      
        '   (SELECT ID as ZPU_TYPE2_ID, NAME as ZPU_TYPE2_NAME FROM KLS_Z' +
        'PU_TYPES) zt2,'
      
        '   (SELECT ID as VO_ID, DISPLAY_NAME as VAGOWNER_NAME FROM KLS_V' +
        'AGOWNER) vo'
      'WHERE a.NAKL_ID=:NAKL_ID'
      '  AND a.SVED_ID=s.SVEDID AND s.NOM_ZD=m.MON_NOM_ZD(+)'
      '  AND s.PROD_ID_NPR=p.ID_NPR(+)'
      '  AND a.UVED_ID=u.UVEDID(+)'
      '  AND a.VAGONTYPE_ID=vt.VAGTYPE_ID(+)'
      '  AND a.ZPU_TYPE1=zt1.ZPU_TYPE1_ID(+)'
      '  AND a.ZPU_TYPE2=zt2.ZPU_TYPE2_ID(+)'
      '  AND a.VAGOWNER_ID=vo.VO_ID(+)'
      'ORDER BY a.NAKL_POS')
    Variables.Data = {
      0300000001000000080000003A4E414B4C5F4944040000000000000000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      03000000450000000200000049440100000000080000004E554D5F4349535401
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
      000008000000555645445F4E554D0100000000060000004E4F4D5F5A44010000
      00000900000050524F445F4E414D45010000000008000000504153505F4E554D
      01000000000700000052455A5F4E554D010000000009000000504153505F4441
      5445010000000009000000444154455F504C414E01000000000E000000564147
      4F4E545950455F4E414D4501000000000D0000005641474F574E45525F4E414D
      4501000000000E0000005A50555F54595045315F4E414D4501000000000E0000
      005A50555F54595045325F4E414D450100000000}
    AutoCalcFields = False
    UniqueFields = 'ID'
    Master = q_title
    MasterFields = 'ID'
    DetailFields = 'NAKL_ID'
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
      ReadOnly = True
    end
    object q_rowsVED_POD_ROW_ID: TFloatField
      FieldName = 'VED_POD_ROW_ID'
      ReadOnly = True
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
      ReadOnly = True
    end
    object q_rowsAXES: TIntegerField
      DisplayLabel = #1054#1089#1080
      FieldName = 'AXES'
      ReadOnly = True
    end
    object q_rowsCAPACITY: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086'- '#1087#1086#1076#1098#1077#1084'- '#1085#1086#1089#1090#1100
      FieldName = 'CAPACITY'
      ReadOnly = True
      Size = 10
    end
    object q_rowsWES1: TStringField
      FieldName = 'WES1'
      ReadOnly = True
      Size = 5
    end
    object q_rowsVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072', '#1090#1085
      FieldName = 'VES_CIST'
      ReadOnly = True
    end
    object q_rowsVAGONTYPE_ID: TFloatField
      FieldName = 'VAGONTYPE_ID'
      ReadOnly = True
    end
    object q_rowsKALIBR_ID: TStringField
      DisplayLabel = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
      FieldName = 'KALIBR_ID'
      ReadOnly = True
      Size = 5
    end
    object q_rowsTIP1: TStringField
      FieldName = 'TIP1'
      ReadOnly = True
      Size = 5
    end
    object q_rowsVAGOWNER_ID: TFloatField
      FieldName = 'VAGOWNER_ID'
      ReadOnly = True
    end
    object q_rowsVETKA_POD_ID: TFloatField
      FieldName = 'VETKA_POD_ID'
      ReadOnly = True
    end
    object q_rowsVETKA_OTP_ID: TFloatField
      FieldName = 'VETKA_OTP_ID'
      ReadOnly = True
    end
    object q_rowsVETKA_NAPR_ID: TFloatField
      FieldName = 'VETKA_NAPR_ID'
      ReadOnly = True
    end
    object q_rowsVAG_STATUS_ID: TFloatField
      FieldName = 'VAG_STATUS_ID'
      ReadOnly = True
      Required = True
    end
    object q_rowsVZLIV: TFloatField
      FieldName = 'VZLIV'
      ReadOnly = True
    end
    object q_rowsTEMPER: TFloatField
      FieldName = 'TEMPER'
      ReadOnly = True
    end
    object q_rowsFAKT_PL: TFloatField
      FieldName = 'FAKT_PL'
      ReadOnly = True
    end
    object q_rowsVES: TFloatField
      DisplayLabel = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1090#1085
      FieldName = 'VES'
      ReadOnly = True
      Required = True
    end
    object q_rowsKOL_NET: TFloatField
      FieldName = 'KOL_NET'
      ReadOnly = True
      Required = True
    end
    object q_rowsVES_ALL: TFloatField
      DisplayLabel = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1091#1087#1072#1082#1086#1074#1082#1080', '#1074#1072#1075#1086#1085#1072', '#1090#1085
      FieldName = 'VES_ALL'
      ReadOnly = True
      Required = True
    end
    object q_rowsVES_ED: TFloatField
      FieldName = 'VES_ED'
      ReadOnly = True
      Required = True
    end
    object q_rowsKOL_ED: TIntegerField
      FieldName = 'KOL_ED'
      ReadOnly = True
      Required = True
    end
    object q_rowsUPAK_ID: TFloatField
      FieldName = 'UPAK_ID'
      ReadOnly = True
    end
    object q_rowsUPAK_VES: TFloatField
      DisplayLabel = #1042#1077#1089' '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
      FieldName = 'UPAK_VES'
      ReadOnly = True
      Required = True
    end
    object q_rowsUPAK_VES_ED: TFloatField
      FieldName = 'UPAK_VES_ED'
      ReadOnly = True
      Required = True
    end
    object q_rowsPODDONS: TIntegerField
      FieldName = 'PODDONS'
      ReadOnly = True
      Required = True
    end
    object q_rowsPODDON_VES: TFloatField
      FieldName = 'PODDON_VES'
      ReadOnly = True
      Required = True
    end
    object q_rowsSHIELDS: TIntegerField
      FieldName = 'SHIELDS'
      ReadOnly = True
      Required = True
    end
    object q_rowsSHIELD_VES: TFloatField
      FieldName = 'SHIELD_VES'
      ReadOnly = True
      Required = True
    end
    object q_rowsZPU_TYPE1: TFloatField
      FieldName = 'ZPU_TYPE1'
      ReadOnly = True
    end
    object q_rowsZPU_TYPE2: TFloatField
      FieldName = 'ZPU_TYPE2'
      ReadOnly = True
    end
    object q_rowsPLOMBA1: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1072' 1'
      FieldName = 'PLOMBA1'
      ReadOnly = True
      Size = 15
    end
    object q_rowsPLOMBA2: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1072' 2'
      FieldName = 'PLOMBA2'
      ReadOnly = True
      Size = 15
    end
    object q_rowsROSINSPL1: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1099' '#1056#1086#1089#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072#1090#1072' 1'
      FieldName = 'ROSINSPL1'
      ReadOnly = True
      Size = 6
    end
    object q_rowsROSINSPL2: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1099' '#1056#1086#1089#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072#1090#1072' 2'
      FieldName = 'ROSINSPL2'
      ReadOnly = True
      Size = 6
    end
    object q_rowsNAR_LINE_ID: TFloatField
      FieldName = 'NAR_LINE_ID'
      ReadOnly = True
    end
    object q_rowsNUM_PROP: TIntegerField
      FieldName = 'NUM_PROP'
      ReadOnly = True
    end
    object q_rowsFIO_DRIVER: TStringField
      FieldName = 'FIO_DRIVER'
      ReadOnly = True
      Size = 50
    end
    object q_rowsNAKL_ID: TFloatField
      FieldName = 'NAKL_ID'
      ReadOnly = True
    end
    object q_rowsFORMNAKL_ID: TFloatField
      FieldName = 'FORMNAKL_ID'
      ReadOnly = True
    end
    object q_rowsNUM_KVIT: TStringField
      FieldName = 'NUM_KVIT'
      ReadOnly = True
      Size = 10
    end
    object q_rowsDATE_KVIT: TDateTimeField
      FieldName = 'DATE_KVIT'
      ReadOnly = True
    end
    object q_rowsTARIF: TFloatField
      FieldName = 'TARIF'
      ReadOnly = True
      Required = True
    end
    object q_rowsTARIF_GUARD: TFloatField
      FieldName = 'TARIF_GUARD'
      ReadOnly = True
      Required = True
    end
    object q_rowsVOLUME: TFloatField
      FieldName = 'VOLUME'
      ReadOnly = True
      Required = True
    end
    object q_rowsBAD_NUM: TIntegerField
      FieldName = 'BAD_NUM'
      ReadOnly = True
      Required = True
    end
    object q_rowsGOST_ID: TIntegerField
      FieldName = 'GOST_ID'
      ReadOnly = True
      Required = True
    end
    object q_rowsCTLV: TFloatField
      FieldName = 'CTLV'
      ReadOnly = True
      Required = True
    end
    object q_rowsVOLUME15: TIntegerField
      FieldName = 'VOLUME15'
      ReadOnly = True
      Required = True
    end
    object q_rowsNAKL_POS: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'NAKL_POS'
      ReadOnly = True
    end
    object q_rowsUVED_ID: TFloatField
      FieldName = 'UVED_ID'
      ReadOnly = True
    end
    object q_rowsUVED_POS: TIntegerField
      FieldName = 'UVED_POS'
      ReadOnly = True
    end
    object q_rowsIS_AUTO: TIntegerField
      FieldName = 'IS_AUTO'
      ReadOnly = True
      Required = True
    end
    object q_rowsSVED_NUM: TStringField
      DisplayLabel = #8470' '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_NUM'
      ReadOnly = True
      Size = 54
    end
    object q_rowsUVED_NUM: TStringField
      DisplayLabel = #8470' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
      FieldName = 'UVED_NUM'
      ReadOnly = True
      Size = 63
    end
    object q_rowsVAGOWNER_NAME: TStringField
      DisplayLabel = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
      FieldName = 'VAGOWNER_NAME'
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'VAGOWNER_ID'
      ReadOnly = True
      Size = 50
    end
    object q_rowsNOM_ZD: TStringField
      DisplayLabel = #8470' '#1079#1072#1076#1072#1085#1080#1103
      FieldName = 'NOM_ZD'
      ReadOnly = True
      Size = 12
    end
    object q_rowsPROD_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'PROD_NAME'
      ReadOnly = True
    end
    object q_rowsZPU_TYPE1_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1083#1086#1084#1073#1099' 1'
      FieldName = 'ZPU_TYPE1_NAME'
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ZPU_TYPE1'
      ReadOnly = True
      Size = 30
    end
    object q_rowsZPU_TYPE2_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1083#1086#1084#1073#1099' 2'
      FieldName = 'ZPU_TYPE2_NAME'
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ZPU_TYPE2'
      ReadOnly = True
      Size = 30
    end
    object q_rowsPASP_NUM: TStringField
      DisplayLabel = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP_NUM'
      ReadOnly = True
      Size = 15
    end
    object q_rowsREZ_NUM: TStringField
      DisplayLabel = #8470' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072
      FieldName = 'REZ_NUM'
      ReadOnly = True
      Size = 15
    end
    object q_rowsPASP_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP_DATE'
      ReadOnly = True
    end
    object q_rowsDATE_PLAN: TDateTimeField
      FieldName = 'DATE_PLAN'
    end
  end
  object ds_rows: TDataSource
    DataSet = q_rows
    Left = 24
    Top = 424
  end
  object pkgFor_nakl: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_NAKL'
    Left = 248
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
  object ds_ProdGU12: TDataSource
    DataSet = q_ProdGU12
    Left = 523
    Top = 149
  end
  object q_ProdGU12: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */'
      '  ID,'
      '  NAME_GU12 as NAME'
      'from kls_prod_gu12'
      'UNION'
      'SELECT'
      '  '#39'0'#39' as ID,'
      '  '#39'< '#1041#1045#1047' '#1055#1056#1054#1044#1059#1050#1058#1040' >'#39' as NAME'
      'FROM dual'
      'ORDER BY ID'
      '')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Left = 459
    Top = 145
    object q_ProdGU12ID: TStringField
      FieldName = 'ID'
      Size = 10
    end
    object q_ProdGU12NAME: TStringField
      FieldName = 'NAME'
      Size = 40
    end
  end
  object pkgFOR_DOCUMENTS: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_DOCUMENTS'
    Left = 395
    Top = 472
  end
  object q_print_exp: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */'
      'kls_dog.DOG_NUMBER,kls_dog.DOG_DATE,'
      'month.NOM_ZD,sved.PASP_NUM,'
      '--'#1087#1086#1083#1103' '#1080#1079' reestr'
      
        'reestr.NUM_CIST,reestr.KOL_ED,reestr.KOL_NET,reestr.VES,reestr.V' +
        'ES_ALL,reestr.PLOMBA1,reestr.PLOMBA2,reestr.NCISTDOP,reestr.KALI' +
        'BR_ID,'
      'reestr.AXES,reestr.CAPACITY,reestr.VES_CIST,kls_zpu_types.NAME,'
      '--'#1087#1086#1083#1103' '#1080#1079' kls_stan '#1080' '#1074#1089#1077' '#1095#1090#1086' '#1089#1074#1103#1079#1072#1085#1086' '#1089#1086' '#1089#1090#1072#1085#1094#1080#1077#1081' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      
        'kls_stan.stan_kod,kls_stan.stan_name,kls_gdor.SHORT_NAME||'#39' '#1046'.'#1044'.' +
        #39' as gdor_name,kls_states.SHORT_NAME as strana,'
      '--'#1087#1086#1083#1103' '#1080#1079' month_tex_pd'
      
        'month_tex_pd.ID as tex_pd_id,month_tex_pd.BANK,month_tex_pd.GROT' +
        'P_OKPO,month_tex_pd.GROTP_SHORT_NAME,month_tex_pd.GROTP_ID,month' +
        '_tex_pd.PLATTARIF_ID,'
      
        'month_tex_pd.PLATTAR_SHORT_NAME,month_tex_pd.RS,month_tex_pd.TEX' +
        '_PD_NAME,'
      
        'grotp.GD_KOD as grotp_gd_kod,grotp.POSTINDEX_J as grotp_index,gr' +
        'otp.CITY_J as grotp_city,grotp.ADDRESS_J as grotp_address,'
      'kls_shabexp.*'
      
        'from kls_shabexp,month,reestr,sved,nakl,kls_tex_pd,kls_dog,kls_t' +
        'ex_pd month_tex_pd,kls_predpr grotp,kls_zpu_types,kls_stan,kls_s' +
        'tates,kls_gdor'
      'where reestr.SVED_ID=sved.id(+)'
      #9'  and reestr.NAKL_ID=nakl.ID(+)'
      #9'  and nakl.SHABEXP_ID=kls_shabexp.ID(+)'
      #9'  and sved.NOM_ZD=month.NOM_ZD(+)'
      #9'  and month.TEX_PD_ID=month_tex_pd.id(+)'
      #9'  and kls_shabexp.TEX_PD_ID=kls_tex_pd.ID(+)'
      #9'  and kls_shabexp.DOG_ID=kls_dog.ID(+)'
      #9'  and nakl.IS_EXP=1 and reestr.NAKL_ID=:nakl_id'
      #9'  and month_tex_pd.GROTP_ID=grotp.ID(+)'
      #9'  and reestr.ZPU_TYPE1=kls_zpu_types.ID(+)'#9'  '
      #9'  and kls_shabexp.STAN_ID=kls_stan.ID(+)'
      #9'  and kls_stan.GDOR_ID=kls_gdor.ID(+)'
      #9'  and kls_stan.STATES_ID=kls_states.ID(+)'
      'order by reestr.nakl_pos    ')
    Variables.Data = {
      0300000001000000080000003A4E414B4C5F4944040000000000000000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000005D0000000200000049440100000000080000005645535F4349535401
      00000000070000005645535F414C4C0100000000030000005645530100000000
      080000005052494D5F444F470100000000060000004E4F4D5F5A440100000000
      0B00000050524F445F49445F4E505201000000000A000000444F475F4E554D42
      4552010000000008000000444F475F4441544501000000000800000050415350
      5F4E554D0100000000080000004E554D5F434953540100000000060000004B4F
      4C5F45440100000000070000004B4F4C5F4E4554010000000007000000504C4F
      4D424131010000000007000000504C4F4D4241320100000000080000004E4349
      5354444F500100000000090000004B414C4942525F4944010000000004000000
      4158455301000000000800000043415041434954590100000000040000004E41
      4D450100000000080000005354414E5F4B4F440100000000090000005354414E
      5F4E414D4501000000000900000047444F525F4E414D45010000000006000000
      535452414E410100000000090000005445585F50445F49440100000000040000
      0042414E4B01000000000A00000047524F54505F4F4B504F0100000000100000
      0047524F54505F53484F52545F4E414D4501000000000800000047524F54505F
      494401000000000C000000504C415454415249465F4944010000000012000000
      504C41545441525F53484F52545F4E414D450100000000020000005253010000
      00000B0000005445585F50445F4E414D4501000000000C00000047524F54505F
      47445F4B4F4401000000000B00000047524F54505F494E44455801000000000A
      00000047524F54505F4349545901000000000D00000047524F54505F41444452
      45535301000000000A000000464C475F444F5354555001000000000600000044
      4F475F49440100000000070000005354414E5F49440100000000050000004F53
      4F42310100000000050000004F534F42320100000000050000004F534F423301
      00000000050000004F534F4234010000000004000000504F4C31010000000004
      000000504F4C32010000000004000000504F4C33010000000004000000504F4C
      340100000000050000004E454F42310100000000050000004E454F4232010000
      0000050000004E454F42330100000000050000004E454F423401000000000500
      00005354414E310100000000050000005354414E320100000000050000005354
      414E330100000000050000005354414E34010000000006000000444F52535431
      010000000006000000444F525354320100000000060000004E4D5F4752310100
      000000060000004E4D5F4752320100000000060000004E4D5F47523301000000
      00060000004E4D5F4752340100000000060000004E4D5F475235010000000006
      0000004E4D5F4752360100000000060000004E4D5F4752370100000000060000
      004E4D5F4752380100000000060000004E4D5F47523901000000000700000050
      4C545F4F5431010000000007000000504C545F4F543201000000000700000050
      4C545F4F5433010000000007000000504C545F4F543401000000000500000044
      4F435331010000000005000000444F435332010000000005000000444F435333
      010000000005000000444F43533401000000000400000054414D310100000000
      0400000054414D32010000000005000000504F53333301000000000500000050
      4F533334010000000005000000504F533335010000000005000000504F533336
      010000000007000000534854414D5031010000000007000000534854414D5032
      010000000007000000534854414D5033010000000007000000534854414D5034
      010000000007000000534854414D503501000000000A0000004752315F545854
      5F455801000000000A0000004752325F5458545F45580100000000090000004D
      4553544F5F504159010000000007000000434E545F56454401000000000B0000
      005445585F50445F49445F31010000000006000000494E534E554D0100000000
      06000000494E534441540100000000}
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    Session = ora_Session
    BeforeOpen = q_titleBeforeOpen
    AfterOpen = q_titleAfterOpen
    AfterScroll = q_titleAfterScroll
    OnFilterRecord = q_titleFilterRecord
    Left = 168
    Top = 360
    object q_print_expDOG_NUMBER: TStringField
      FieldName = 'DOG_NUMBER'
      Size = 30
    end
    object q_print_expDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
    end
    object q_print_expNOM_ZD: TStringField
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_print_expPASP_NUM: TStringField
      FieldName = 'PASP_NUM'
      Size = 15
    end
    object q_print_expNUM_CIST: TStringField
      FieldName = 'NUM_CIST'
      Required = True
      Size = 10
    end
    object q_print_expKOL_ED: TIntegerField
      FieldName = 'KOL_ED'
      Required = True
    end
    object q_print_expKOL_NET: TFloatField
      FieldName = 'KOL_NET'
      Required = True
    end
    object q_print_expVES: TFloatField
      FieldName = 'VES'
      Required = True
    end
    object q_print_expVES_ALL: TFloatField
      FieldName = 'VES_ALL'
      Required = True
    end
    object q_print_expPLOMBA1: TStringField
      FieldName = 'PLOMBA1'
      Size = 15
    end
    object q_print_expPLOMBA2: TStringField
      FieldName = 'PLOMBA2'
      Size = 15
    end
    object q_print_expNCISTDOP: TIntegerField
      FieldName = 'NCISTDOP'
    end
    object q_print_expKALIBR_ID: TStringField
      FieldName = 'KALIBR_ID'
      Size = 5
    end
    object q_print_expAXES: TIntegerField
      FieldName = 'AXES'
    end
    object q_print_expCAPACITY: TStringField
      FieldName = 'CAPACITY'
      Size = 10
    end
    object q_print_expVES_CIST: TFloatField
      FieldName = 'VES_CIST'
    end
    object q_print_expNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object q_print_expSTAN_KOD: TIntegerField
      FieldName = 'STAN_KOD'
    end
    object q_print_expSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Size = 50
    end
    object q_print_expGDOR_NAME: TStringField
      FieldName = 'GDOR_NAME'
      Size = 13
    end
    object q_print_expSTRANA: TStringField
      FieldName = 'STRANA'
      Size = 10
    end
    object q_print_expBANK: TStringField
      FieldName = 'BANK'
      Size = 60
    end
    object q_print_expGROTP_OKPO: TStringField
      FieldName = 'GROTP_OKPO'
      Size = 10
    end
    object q_print_expGROTP_SHORT_NAME: TStringField
      FieldName = 'GROTP_SHORT_NAME'
      Size = 50
    end
    object q_print_expGROTP_ID: TIntegerField
      FieldName = 'GROTP_ID'
    end
    object q_print_expPLATTARIF_ID: TIntegerField
      FieldName = 'PLATTARIF_ID'
    end
    object q_print_expPLATTAR_SHORT_NAME: TStringField
      FieldName = 'PLATTAR_SHORT_NAME'
      Size = 50
    end
    object q_print_expRS: TStringField
      FieldName = 'RS'
    end
    object q_print_expTEX_PD_NAME: TStringField
      FieldName = 'TEX_PD_NAME'
      Size = 50
    end
    object q_print_expGROTP_GD_KOD: TStringField
      FieldName = 'GROTP_GD_KOD'
      Size = 12
    end
    object q_print_expGROTP_INDEX: TStringField
      FieldName = 'GROTP_INDEX'
      Size = 6
    end
    object q_print_expGROTP_CITY: TStringField
      FieldName = 'GROTP_CITY'
      Size = 25
    end
    object q_print_expGROTP_ADDRESS: TStringField
      FieldName = 'GROTP_ADDRESS'
      Size = 100
    end
    object q_print_expID: TFloatField
      FieldName = 'ID'
    end
    object q_print_expFLG_DOSTUP: TIntegerField
      FieldName = 'FLG_DOSTUP'
    end
    object q_print_expDOG_ID: TIntegerField
      FieldName = 'DOG_ID'
    end
    object q_print_expPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 5
    end
    object q_print_expSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
    object q_print_expPRIM_DOG: TStringField
      FieldName = 'PRIM_DOG'
    end
    object q_print_expOSOB1: TStringField
      FieldName = 'OSOB1'
      Size = 33
    end
    object q_print_expOSOB2: TStringField
      FieldName = 'OSOB2'
      Size = 33
    end
    object q_print_expOSOB3: TStringField
      FieldName = 'OSOB3'
      Size = 33
    end
    object q_print_expOSOB4: TStringField
      FieldName = 'OSOB4'
      Size = 33
    end
    object q_print_expPOL1: TStringField
      FieldName = 'POL1'
      Size = 30
    end
    object q_print_expPOL2: TStringField
      FieldName = 'POL2'
      Size = 30
    end
    object q_print_expPOL3: TStringField
      FieldName = 'POL3'
      Size = 30
    end
    object q_print_expPOL4: TStringField
      FieldName = 'POL4'
      Size = 30
    end
    object q_print_expNEOB1: TStringField
      FieldName = 'NEOB1'
      Size = 40
    end
    object q_print_expNEOB2: TStringField
      FieldName = 'NEOB2'
      Size = 40
    end
    object q_print_expNEOB3: TStringField
      FieldName = 'NEOB3'
      Size = 40
    end
    object q_print_expNEOB4: TStringField
      FieldName = 'NEOB4'
      Size = 40
    end
    object q_print_expSTAN1: TStringField
      FieldName = 'STAN1'
      Size = 40
    end
    object q_print_expSTAN2: TStringField
      FieldName = 'STAN2'
      Size = 40
    end
    object q_print_expSTAN3: TStringField
      FieldName = 'STAN3'
      Size = 40
    end
    object q_print_expSTAN4: TStringField
      FieldName = 'STAN4'
      Size = 40
    end
    object q_print_expDORST1: TStringField
      FieldName = 'DORST1'
      Size = 40
    end
    object q_print_expDORST2: TStringField
      FieldName = 'DORST2'
      Size = 40
    end
    object q_print_expNM_GR1: TStringField
      FieldName = 'NM_GR1'
      Size = 26
    end
    object q_print_expNM_GR2: TStringField
      FieldName = 'NM_GR2'
      Size = 26
    end
    object q_print_expNM_GR3: TStringField
      FieldName = 'NM_GR3'
      Size = 26
    end
    object q_print_expNM_GR4: TStringField
      FieldName = 'NM_GR4'
      Size = 26
    end
    object q_print_expNM_GR5: TStringField
      FieldName = 'NM_GR5'
      Size = 26
    end
    object q_print_expNM_GR6: TStringField
      FieldName = 'NM_GR6'
      Size = 26
    end
    object q_print_expNM_GR7: TStringField
      FieldName = 'NM_GR7'
      Size = 26
    end
    object q_print_expNM_GR8: TStringField
      FieldName = 'NM_GR8'
      Size = 26
    end
    object q_print_expNM_GR9: TStringField
      FieldName = 'NM_GR9'
      Size = 26
    end
    object q_print_expPLT_OT1: TStringField
      FieldName = 'PLT_OT1'
      Size = 35
    end
    object q_print_expPLT_OT2: TStringField
      FieldName = 'PLT_OT2'
      Size = 35
    end
    object q_print_expPLT_OT3: TStringField
      FieldName = 'PLT_OT3'
      Size = 35
    end
    object q_print_expPLT_OT4: TStringField
      FieldName = 'PLT_OT4'
      Size = 35
    end
    object q_print_expDOCS1: TStringField
      FieldName = 'DOCS1'
      Size = 35
    end
    object q_print_expDOCS2: TStringField
      FieldName = 'DOCS2'
      Size = 35
    end
    object q_print_expDOCS3: TStringField
      FieldName = 'DOCS3'
      Size = 35
    end
    object q_print_expDOCS4: TStringField
      FieldName = 'DOCS4'
      Size = 35
    end
    object q_print_expTAM1: TStringField
      FieldName = 'TAM1'
      Size = 35
    end
    object q_print_expTAM2: TStringField
      FieldName = 'TAM2'
      Size = 35
    end
    object q_print_expPOS33: TStringField
      FieldName = 'POS33'
      Size = 10
    end
    object q_print_expPOS34: TStringField
      FieldName = 'POS34'
      Size = 10
    end
    object q_print_expPOS35: TStringField
      FieldName = 'POS35'
      Size = 10
    end
    object q_print_expPOS36: TStringField
      FieldName = 'POS36'
      Size = 10
    end
    object q_print_expSHTAMP1: TStringField
      FieldName = 'SHTAMP1'
      Size = 50
    end
    object q_print_expSHTAMP2: TStringField
      FieldName = 'SHTAMP2'
      Size = 50
    end
    object q_print_expSHTAMP3: TStringField
      FieldName = 'SHTAMP3'
      Size = 50
    end
    object q_print_expSHTAMP4: TStringField
      FieldName = 'SHTAMP4'
      Size = 50
    end
    object q_print_expSHTAMP5: TStringField
      FieldName = 'SHTAMP5'
      Size = 50
    end
    object q_print_expGR1_TXT_EX: TStringField
      FieldName = 'GR1_TXT_EX'
      Size = 60
    end
    object q_print_expGR2_TXT_EX: TStringField
      FieldName = 'GR2_TXT_EX'
      Size = 60
    end
    object q_print_expMESTO_PAY: TStringField
      FieldName = 'MESTO_PAY'
      Size = 30
    end
    object q_print_expCNT_VED: TIntegerField
      FieldName = 'CNT_VED'
    end
    object q_print_expINSNUM: TStringField
      FieldName = 'INSNUM'
    end
    object q_print_expINSDAT: TDateTimeField
      FieldName = 'INSDAT'
    end
    object q_print_expTEX_PD_ID: TFloatField
      FieldName = 'TEX_PD_ID'
    end
    object q_print_expTEX_PD_ID_1: TFloatField
      FieldName = 'TEX_PD_ID_1'
    end
  end
end
