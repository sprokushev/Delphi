object f_SutRee: Tf_SutRee
  Left = 220
  Top = 111
  Width = 843
  Height = 568
  Caption = #1057#1091#1090#1086#1095#1085#1099#1081' '#1088#1077#1077#1089#1090#1088' '#1079#1072#1076#1072#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 835
    Height = 115
    Align = alTop
    TabOrder = 0
    object Panel3: TPanel
      Left = 585
      Top = 1
      Width = 104
      Height = 113
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object sbSutReeRefresh: TSpeedButton
        Left = 6
        Top = 6
        Width = 91
        Height = 99
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
        OnClick = sbSutReeRefreshClick
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 584
      Height = 113
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 28
        Top = 56
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = #1056#1077#1077#1089#1090#1088' '#8470':'
      end
      object Label4: TLabel
        Left = 15
        Top = 32
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = #1054#1090#1075#1088#1091#1079#1082#1072' '#1085#1072':'
      end
      object Label5: TLabel
        Left = 331
        Top = 8
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = #1044#1072#1090#1072' '#1087#1083#1072#1085#1072':'
      end
      object Label26: TLabel
        Left = 470
        Top = 31
        Width = 12
        Height = 13
        Caption = #1087#1086
        FocusControl = edGRAFIK_TO
      end
      object Label6: TLabel
        Left = 155
        Top = 56
        Width = 37
        Height = 13
        Caption = #1057#1090#1072#1090#1091#1089':'
      end
      object lbStatus: TLabel
        Left = 200
        Top = 56
        Width = 345
        Height = 13
        AutoSize = False
        Caption = #1053#1077' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 189
        Top = 8
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = #1044#1086#1087'.'#1088#1077#1077#1089#1090#1088':'
      end
      object Label8: TLabel
        Left = 8
        Top = 8
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072':'
      end
      object Label3: TLabel
        Left = 65
        Top = 77
        Width = 176
        Height = 13
        Alignment = taRightJustify
        Caption = #1047#1072#1075#1088#1091#1078#1077#1085' '#1059#1093#1090#1080#1085#1089#1082#1080#1081' '#1088#1077#1077#1089#1090#1088' (XLS):'
      end
      object Label9: TLabel
        Left = 14
        Top = 94
        Width = 227
        Height = 13
        Alignment = taRightJustify
        Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085' '#1074' '#1052#1086#1089#1082#1074#1091' '#1085#1072' '#1089#1086#1075#1083#1072#1089#1086#1074#1072#1085#1080#1077' (DBF):'
      end
      object lbUhtaXLS: TLabel
        Left = 248
        Top = 77
        Width = 297
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbMoscowDBF: TLabel
        Left = 248
        Top = 94
        Width = 297
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNumRee: TCurrencyEdit
        Left = 88
        Top = 53
        Width = 57
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = ',0'
        Enabled = False
        TabOrder = 0
      end
      object edDateRee: TDateTimePicker
        Left = 88
        Top = 4
        Width = 87
        Height = 21
        Date = 37896.756732175930000000
        Time = 37896.756732175930000000
        Enabled = False
        TabOrder = 1
        OnChange = edDateReeChange
      end
      object edDateTo: TDateTimePicker
        Left = 162
        Top = 28
        Width = 87
        Height = 21
        Date = 37896.756732175930000000
        Time = 37896.756732175930000000
        Enabled = False
        TabOrder = 5
      end
      object edTimeTo: TDateTimePicker
        Left = 88
        Top = 29
        Width = 72
        Height = 21
        Date = 37088.641009456000000000
        Time = 37088.641009456000000000
        Enabled = False
        Kind = dtkTime
        TabOrder = 4
      end
      object edDatePlan: TDateTimePicker
        Left = 401
        Top = 4
        Width = 82
        Height = 21
        Date = 37896.756732175930000000
        Time = 37896.756732175930000000
        Enabled = False
        TabOrder = 3
      end
      object edGRAFIK_FROM: TDateTimePicker
        Left = 385
        Top = 28
        Width = 82
        Height = 21
        Date = 37088.641009456000000000
        Time = 37088.641009456000000000
        Enabled = False
        TabOrder = 6
      end
      object edGRAFIK_TO: TDateTimePicker
        Left = 489
        Top = 28
        Width = 82
        Height = 21
        Date = 37088.641009456000000000
        Time = 37088.641009456000000000
        Enabled = False
        TabOrder = 7
      end
      object edDopRee: TCurrencyEdit
        Left = 256
        Top = 5
        Width = 57
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = ',0'
        Enabled = False
        TabOrder = 2
      end
      object cbUseGrafik: TCheckBox
        Left = 256
        Top = 29
        Width = 121
        Height = 17
        Caption = #1043#1088#1072#1092#1080#1082' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1089':'
        TabOrder = 8
        OnClick = cbUseGrafikClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 515
    Width = 835
    Height = 26
    Align = alBottom
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ctrl + F - '#1055#1086#1080#1089#1082
    end
  end
  object gridBrowse: TDBGridEh
    Left = 0
    Top = 141
    Width = 835
    Height = 374
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = ds_SutRee
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
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
    ParentFont = False
    PopupMenu = pm_gridBrowse
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnExit = gridBrowseExit
    OnGetCellParams = gridBrowseGetCellParams
    OnSortMarkingChanged = gridBrowseSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footer.ValueType = fvtCount
        Footers = <>
        ReadOnly = True
        Title.Caption = #8470' '#1087'/'#1087
        Width = 31
        OnGetCellParams = gridBrowseColumns0GetCellParams
      end
      item
        EditButtons = <>
        FieldName = 'PRIORITY_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'NOM_ZD'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'TONN_REQ'
        Footers = <>
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'TONN_REE'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'TONN_MOS'
        Footers = <>
        Width = 95
      end
      item
        EditButtons = <>
        FieldName = 'TONN_FACT'
        Footers = <>
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'TONN_REST'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NAME_NPR'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 133
      end
      item
        EditButtons = <>
        FieldName = 'KOD_NPR_KC'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'N_DOG'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'PLAT_NAME'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 235
      end
      item
        EditButtons = <>
        FieldName = 'NAME_POLU'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'INN_POLUCH'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'KOD_POL_KC'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'GDKOD_POLU'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'GDKOD_ST'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'NAME_STAN'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 144
      end
      item
        EditButtons = <>
        FieldName = 'NAME_POTR'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'INN_POTREB'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'KOD_POT_KC'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'PRICE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NAME_OBL'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'OS_OTM'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'AVAILABLE'
        Footers = <>
        Width = 93
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 115
    Width = 835
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem4: TTBItem
        Action = acSutReeNewXLSUhta
        DisplayMode = nbdmImageAndText
      end
      object TBItem5: TTBItem
        Action = acSutReeLoadXLSUhta
        DisplayMode = nbdmImageAndText
      end
      object TBItem12: TTBItem
        Action = acSutReeSendDBF
        DisplayMode = nbdmImageAndText
      end
      object TBItem11: TTBItem
        Action = acSutReeLoadDBF
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = acSutReeNewXLSMoscow
        DisplayMode = nbdmImageAndText
        Images = f_main.img_Common
      end
    end
  end
  object q_reports: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM reports'
      'WHERE id=0')
    Session = ORAConn
    AfterOpen = q_reportsAfterOpen
    Left = 168
    Top = 440
  end
  object ADOConn: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DSN=PF;UID=;SourceDB=U:\LUK\DBASES\;SourceType=DBF;Exclusive' +
      '=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 184
    Top = 184
  end
  object ds_SutRee: TDataSource
    DataSet = q_SutRee
    Left = 344
    Top = 240
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 80
    Top = 320
    StyleName = 'XP Style'
    object acSutReeNewXLSUhta: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' (XLS-'#1059#1093#1090#1072')'
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1059#1093#1090#1080#1085#1089#1082#1080#1081' '#1088#1077#1077#1089#1090#1088' (XLS)'
      ImageIndex = 0
      OnExecute = acSutReeNewXLSUhtaExecute
    end
    object acSutReeLoadXLSUhta: TAction
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100' (XLS-'#1059#1093#1090#1072')'
      Hint = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100' '#1059#1093#1090#1080#1085#1089#1082#1080#1081' '#1088#1077#1077#1089#1090#1088' (XLS)'
      ImageIndex = 46
      OnExecute = acSutReeLoadXLSUhtaExecute
    end
    object acSutReeSendDBF: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' (DBF-'#1052#1086#1089#1082#1074#1072')'
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1088#1077#1077#1089#1090#1088#1072' '#1079#1072#1076#1072#1085#1080#1081' '#1085#1072' '#1089#1086#1075#1083#1072#1089#1086#1074#1072#1085#1080#1077
      ImageIndex = 43
      OnExecute = acSutReeSendDBFExecute
    end
    object acSutReeLoadDBF: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' (DBF-'#1052#1086#1089#1082#1074#1072')'
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1079#1072#1076#1072#1085#1080#1081
      ImageIndex = 45
      OnExecute = acSutReeLoadDBFExecute
    end
    object acSutReeNewXLSMoscow: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' (XLS-'#1052#1086#1089#1082#1074#1072')'
      ImageIndex = 0
      OnExecute = acSutReeNewXLSMoscowExecute
    end
    object acSutReeToXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1090#1072#1073#1083#1080#1094#1099' '#1074' Excel'
      ImageIndex = 42
      OnExecute = acSutReeToXLSExecute
    end
  end
  object pm_gridBrowse: TTBPopupMenu
    Left = 80
    Top = 376
    object TBItem6: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
      Enabled = False
      Options = [tboDefault]
    end
    object e_FieldFilter: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      DisplayMode = nbdmImageAndText
      OnAcceptText = e_FieldFilterAcceptText
    end
    object TBItem14: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem14Click
    end
    object TBItem1: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem1Click
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem15: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem15Click
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem8: TTBItem
      Action = acSutReeNewXLSUhta
    end
    object TBItem10: TTBItem
      Action = acSutReeLoadXLSUhta
    end
    object TBItem13: TTBItem
      Action = acSutReeSendDBF
    end
    object TBItem9: TTBItem
      Action = acSutReeLoadDBF
    end
    object TBItem2: TTBItem
      Action = acSutReeNewXLSMoscow
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem7: TTBItem
      Action = acSutReeToXLS
    end
  end
  object q_tmp: TOracleQuery
    Session = ORAConn
    Left = 168
    Top = 336
  end
  object ORAConn: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'BUH'
    Left = 64
    Top = 232
  end
  object q_SutRee: TOracleDataSet
    SQL.Strings = (
      'SELECT B.rowid,'
      '  B.NOM_ZD,'
      '  TO_CHAR(MONTH.INPUT_DATE,'#39'dd.mm.yyyy'#39') as DATE_RAZN,'
      '  TO_CHAR(A.DATE_REE,'#39'dd.mm.yyyy'#39') as DATE_ISP,'
      '  MONTH.TONN_DECLARED as TONN_REQ,'
      '  B.TONN_REE,'
      '  B.TONN_REE as TONN_DISTR,'
      '  B.TONN_MOS,'
      '  MONTH.TONN_DECLARED-MONTH.TONN_LOADED as TONN_REST,'
      '  MONTH.TONN_LOADED as TONN_FACT,'
      '  MONTH.CENA_OTP as PRICE,'
      '  KLS_DOG.DOG_NUMBER as N_DOG,'
      '  '#39#39' as N_DOG2,'
      '  plat.PREDPR_NAME as PLAT_NAME,'
      '  MONTH.PROD_ID_NPR as K_NPR_LOC,'
      '  '#39#39' as KOD_NPR_R3,'
      '  KLS_PROD.KSSS_PROD_ID as KOD_NPR_KC,'
      '  NVL(ksss_material.KLS_NAME,KLS_PROD.NAME_NPR) as NAME_NPR,'
      '  plat.PREDPR_NAME as NAIM_PLAT,'
      '  TO_CHAR(plat.KSSS_PREDPR_ID) as KOD_PL_KC,'
      '  TO_CHAR(potreb.ID) as KOD_POTREB,'
      '  TO_CHAR(potreb.INN) as INN_POTREB,'
      '  potreb.PREDPR_NAME as NAME_POTR,'
      '  '#39#39' as KOD_POT_R3,'
      '  TO_CHAR(potreb.KSSS_PREDPR_ID) as KOD_POT_KC,'
      '  TO_CHAR(poluch.ID) as KOD_POLUCH,'
      '  '#39#39' as KOD_POL_R3,'
      '  TO_CHAR(poluch.KSSS_PREDPR_ID) as KOD_POL_KC,'
      '  TO_CHAR(poluch.INN) as INN_POLUCH,'
      '  poluch.PREDPR_NAME as NAME_POLU,'
      '  poluch.GD_KOD as GDKOD_POLU,'
      
        '  TO_CHAR(DECODE(KLS_VID_OTGR.LOAD_TYPE_ID,2,reg_pol.REGION_NAME' +
        ',KLS_REGION.REGION_NAME)) as NAME_OBL,'
      
        '  TRIM(TO_CHAR(DECODE(KLS_VID_OTGR.LOAD_TYPE_ID,2,reg_pol.KOD_MO' +
        'SCOW,KLS_REGION.KOD_MOSCOW))) as KOD_GAI,'
      '  MONTH.PRIM as OS_OTM,'
      '  LPAD(TO_CHAR(KLS_STAN.STAN_KOD),6,'#39'0'#39') as GDKOD_ST,'
      '  KLS_STAN.STAN_NAME as NAME_STAN,'
      '  B.PRIORITY,'
      '  '#39'UHTA'#39' as DEPT,'
      '  NVL((SELECT SUM(CASE'
      '            WHEN VOL<DEAD_VOL THEN 0'
      #9#9#9'ELSE VOL-DEAD_VOL'
      #9#9'  END)'
      '    FROM ARC_REZ'
      '   WHERE ORG_STRU_ID=1'
      '     AND AR_TOV_ID=1'
      #9' AND PROD_ID_NPR=MONTH.PROD_ID_NPR'
      
        #9' AND DATEUPLOAD = (SELECT MAX(DATEUPLOAD) FROM ARC_REZ WHERE OR' +
        'G_STRU_ID=1'
      '                                   AND AR_TOV_ID=1'
      
        '                                   AND PROD_ID_NPR=MONTH.PROD_ID' +
        '_NPR'
      
        '                                   AND DATEUPLOAD<=A.DATE_TO)),0' +
        ') as AVAILABLE'
      
        'FROM MONTH_REESTR A, MONTH_REESTR_POS B, MONTH, KLS_DOG, KLS_PRE' +
        'DPR plat,'
      '     KLS_PROD, KLS_PREDPR poluch, KLS_PREDPR potreb,'
      
        '     KLS_STAN, kls_prod_plan, KSSS_MATERIAL,kls_region,kls_regio' +
        'n reg_pol,kls_vid_otgr'
      'WHERE A.ID=:REESTR_ID'
      '  AND A.ID=B.MONTH_REESTR_ID'
      '  AND B.NOM_ZD=MONTH.NOM_ZD'
      '  AND MONTH.DOG_ID=KLS_DOG.ID'
      '  AND KLS_DOG.PREDPR_ID=plat.ID'
      '  AND MONTH.PROD_ID_NPR=KLS_PROD.ID_NPR'
      '  AND MONTH.POLUCH_ID=poluch.ID'
      '  AND MONTH.POTREB_ID=potreb.ID(+)'
      '  AND MONTH.STAN_ID=KLS_STAN.ID'
      '  AND month.LOAD_ABBR=kls_vid_otgr.LOAD_ABBR'
      '  AND KLS_STAN.REGION_ID=KLS_REGION.ID(+)'
      '  AND poluch.REGION_P_ID=reg_pol.ID(+)'
      '  AND KLS_PROD.PROD_PLAN_ID=KLS_PROD_PLAN.ID(+)'
      '  AND KLS_PROD.KSSS_PROD_ID=ksss_material.material_id(+)'
      
        'ORDER BY KLS_PROD_PLAN.ORDER_NPR, TO_CHAR(kls_prod.PROD_PLAN_ID)' +
        ', plat.PREDPR_NAME, B.NOM_ZD'
      '')
    Variables.Data = {
      03000000010000000A0000003A5245455354525F494403000000040000005C00
      000000000000}
    UpdatingTable = 'MONTH_REESTR_POS'
    Session = ORAConn
    BeforeOpen = q_SutReeBeforeOpen
    OnFilterRecord = q_SutReeFilterRecord
    Left = 296
    Top = 232
    object q_SutReeNOM_ZD: TStringField
      DisplayLabel = 'N '#1079#1072#1076#1072#1085#1080#1103
      FieldName = 'NOM_ZD'
      Required = True
      Size = 12
    end
    object q_SutReeDATE_RAZN: TStringField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'DATE_RAZN'
      Size = 10
    end
    object q_SutReeTONN_DISTR: TFloatField
      DisplayLabel = #1054#1090#1075#1088#1091#1079#1080#1090#1100
      FieldName = 'TONN_DISTR'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_SutReeN_DOG: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldName = 'N_DOG'
      Required = True
      Size = 30
    end
    object q_SutReePLAT_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'PLAT_NAME'
      Required = True
      Size = 60
    end
    object q_SutReeK_NPR_LOC: TStringField
      FieldName = 'K_NPR_LOC'
      Required = True
      Size = 5
    end
    object q_SutReeKOD_NPR_R3: TStringField
      FieldName = 'KOD_NPR_R3'
      Size = 1
    end
    object q_SutReeKOD_NPR_KC: TStringField
      DisplayLabel = #1050#1086#1076' '#1050#1057#1057#1057' '#1087#1088#1086#1076#1091#1082#1090#1072
      FieldName = 'KOD_NPR_KC'
      Size = 8
    end
    object q_SutReeNAME_NPR: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object q_SutReeKOD_POTREB: TStringField
      FieldName = 'KOD_POTREB'
      Size = 40
    end
    object q_SutReeINN_POTREB: TStringField
      DisplayLabel = #1048#1053#1053' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1103
      FieldName = 'INN_POTREB'
      Size = 12
    end
    object q_SutReeNAME_POTR: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
      FieldName = 'NAME_POTR'
      Size = 50
    end
    object q_SutReeKOD_POT_R3: TStringField
      FieldName = 'KOD_POT_R3'
      Size = 1
    end
    object q_SutReeKOD_POT_KC: TStringField
      DisplayLabel = #1050#1086#1076' '#1050#1057#1057#1057' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1103
      FieldName = 'KOD_POT_KC'
      Size = 40
    end
    object q_SutReeKOD_POLUCH: TStringField
      FieldName = 'KOD_POLUCH'
      Size = 40
    end
    object q_SutReeKOD_POL_R3: TStringField
      FieldName = 'KOD_POL_R3'
      Size = 1
    end
    object q_SutReeKOD_POL_KC: TStringField
      DisplayLabel = #1050#1086#1076' '#1050#1057#1057#1057' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'KOD_POL_KC'
      Size = 40
    end
    object q_SutReeINN_POLUCH: TStringField
      DisplayLabel = #1048#1053#1053' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'INN_POLUCH'
      Size = 12
    end
    object q_SutReeNAME_POLU: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'NAME_POLU'
      Size = 50
    end
    object q_SutReeGDKOD_POLU: TStringField
      DisplayLabel = #1046'/'#1076' '#1082#1086#1076' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'GDKOD_POLU'
      Size = 12
    end
    object q_SutReeNAME_STAN: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103
      FieldName = 'NAME_STAN'
      Required = True
      Size = 50
    end
    object q_SutReePRIORITY: TFloatField
      FieldName = 'PRIORITY'
    end
    object q_SutReeTONN_REE: TFloatField
      DisplayLabel = #1054#1090#1075#1088#1091#1079#1080#1090#1100', '#1090#1085
      FieldName = 'TONN_REE'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_SutReePRIORITY_NAME: TStringField
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      FieldKind = fkLookup
      FieldName = 'PRIORITY_NAME'
      LookupDataSet = q_Priority
      LookupKeyFields = 'ID'
      LookupResultField = 'SHORT_NAME'
      KeyFields = 'PRIORITY'
      Size = 10
      Lookup = True
    end
    object q_SutReeTONN_MOS: TFloatField
      DisplayLabel = #1057#1086#1075#1083#1072#1089#1086#1074#1072#1085#1086', '#1090#1085
      FieldName = 'TONN_MOS'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_SutReeDEPT: TStringField
      FieldName = 'DEPT'
      Size = 4
    end
    object q_SutReeDATE_ISP: TStringField
      FieldName = 'DATE_ISP'
      Size = 10
    end
    object q_SutReeTONN_REQ: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086', '#1090#1085
      FieldName = 'TONN_REQ'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_SutReeTONN_REST: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1083#1086#1089#1100' '#1086#1090#1075#1088#1091#1079#1080#1090#1100', '#1090#1085
      FieldName = 'TONN_REST'
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_SutReePRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1089' '#1053#1044#1057', '#1088#1091#1073'/'#1090#1085
      FieldName = 'PRICE'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object q_SutReeN_DOG2: TStringField
      FieldName = 'N_DOG2'
      Size = 1
    end
    object q_SutReeNAIM_PLAT: TStringField
      FieldName = 'NAIM_PLAT'
      Required = True
      Size = 60
    end
    object q_SutReeKOD_PL_KC: TStringField
      FieldName = 'KOD_PL_KC'
      Size = 40
    end
    object q_SutReeNAME_OBL: TStringField
      DisplayLabel = #1054#1073#1083#1072#1089#1090#1100' '#1087#1086#1089#1090#1072#1074#1082#1080
      FieldName = 'NAME_OBL'
      Size = 30
    end
    object q_SutReeKOD_GAI: TStringField
      FieldName = 'KOD_GAI'
      Size = 3
    end
    object q_SutReeOS_OTM: TStringField
      DisplayLabel = #1054#1089#1086#1073#1099#1077' '#1086#1090#1084#1077#1090#1082#1080
      FieldName = 'OS_OTM'
      Size = 100
    end
    object q_SutReeGDKOD_ST: TStringField
      DisplayLabel = #1046'/'#1076' '#1082#1086#1076' '#1089#1090#1072#1085#1094#1080#1080
      FieldName = 'GDKOD_ST'
      Size = 6
    end
    object q_SutReeTONN_FACT: TFloatField
      DisplayLabel = #1054#1090#1075#1088#1091#1078#1077#1085#1086', '#1090#1085
      FieldName = 'TONN_FACT'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_SutReeAVAILABLE: TFloatField
      DisplayLabel = #1056#1077#1089#1091#1088#1089' '#1085#1072' '#1091#1090#1088#1086', '#1090#1085
      FieldName = 'AVAILABLE'
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
  end
  object q_cmn: TOracleDataSet
    Session = ORAConn
    Left = 168
    Top = 384
  end
  object pkgFOR_REESTR: TOraclePackage
    Session = ORAConn
    PackageName = 'FOR_REESTR'
    Left = 156
    Top = 238
  end
  object OpenDlg: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' Excel|*.xls'
    InitialDir = 'C:\'
    Left = 120
    Top = 175
  end
  object q_Priority: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_PRIORITY_MONTH_REESTR'
      'ORDER BY ID')
    Session = ORAConn
    Left = 296
    Top = 312
  end
  object FileCheck: TTimer
    Interval = 10000
    OnTimer = FileCheckTimer
    Left = 480
    Top = 272
  end
  object q_cmn2: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 272
    Top = 184
  end
  object q_cmn1: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 384
    Top = 208
  end
  object ora_Package: TOraclePackage
    Session = ORAConn
    ParameterMode = pmNamed
    Left = 272
    Top = 384
  end
end
