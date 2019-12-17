object f_month_visir: Tf_month_visir
  Left = 9
  Top = 108
  Width = 1009
  Height = 614
  Caption = #1042#1080#1079#1080#1088#1086#1074#1072#1085#1080#1077' '#1088#1072#1079#1085#1072#1088#1103#1076#1086#1082
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 26
    Width = 1001
    Height = 169
    Align = alTop
    Caption = ' '#1060#1080#1083#1100#1090#1088' '
    TabOrder = 0
    object rg_Type_Ree: TRadioGroup
      Left = 120
      Top = 13
      Width = 161
      Height = 87
      Caption = #1058#1080#1087' '#1088#1077#1077#1089#1090#1088#1072
      ItemIndex = 0
      Items.Strings = (
        #1042#1089#1077' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1080
        #1055#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1088#1077#1077#1089#1090#1088
        #1044#1086#1087'.'#1088#1077#1077#1089#1090#1088' '#8470' 1'
        #1044#1086#1087'.'#1088#1077#1077#1089#1090#1088' '#8470' 2'
        #1044#1086#1087'.'#1088#1077#1077#1089#1090#1088' '#8470' 3')
      TabOrder = 0
    end
    object rg_Prod: TRadioGroup
      Left = 283
      Top = 13
      Width = 306
      Height = 87
      Caption = ' '#1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090' '
      ItemIndex = 0
      Items.Strings = (
        #1042#1089#1077' '#1087#1088#1086#1076#1091#1082#1090#1099
        #1043#1088#1091#1087#1087#1072
        #1055#1088#1086#1076#1091#1082#1090)
      TabOrder = 1
      OnClick = rg_ProdClick
    end
    object lc_ProdGr: TRxDBLookupCombo
      Left = 360
      Top = 50
      Width = 216
      Height = 21
      DropDownCount = 8
      Enabled = False
      LookupField = 'ID_NPR'
      LookupDisplay = 'NAME_NPR'
      LookupSource = ds_ProdGr
      TabOrder = 2
    end
    object lc_Prod: TRxDBLookupCombo
      Left = 360
      Top = 74
      Width = 216
      Height = 21
      DropDownCount = 8
      Enabled = False
      LookupField = 'ID_NPR'
      LookupDisplay = 'NAME_NPR'
      LookupSource = ds_ProdGr
      TabOrder = 3
    end
    object Panel1: TPanel
      Left = 5
      Top = 102
      Width = 687
      Height = 64
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 4
      object Label3: TLabel
        Left = 8
        Top = 12
        Width = 64
        Height = 13
        Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      end
      object Label4: TLabel
        Left = 8
        Top = 38
        Width = 59
        Height = 13
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      end
      object Label5: TLabel
        Left = 342
        Top = 12
        Width = 158
        Height = 13
        Caption = #1047#1072#1103#1074#1082#1072' ('#1084#1086#1078#1085#1086' '#1087#1077#1088#1074#1099#1077' '#1094#1080#1092#1088#1099')'
      end
      object Label6: TLabel
        Left = 344
        Top = 38
        Width = 42
        Height = 13
        Caption = #1057#1090#1072#1085#1094#1080#1103
      end
      object lc_plat: TRxDBLookupCombo
        Left = 80
        Top = 9
        Width = 251
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
        Left = 80
        Top = 35
        Width = 251
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
        Left = 509
        Top = 8
        Width = 172
        Height = 21
        TabOrder = 2
      end
      object e_stan: TEdit
        Left = 395
        Top = 35
        Width = 70
        Height = 21
        TabOrder = 3
        OnChange = e_stanChange
      end
      object lc_stan: TRxDBLookupCombo
        Left = 470
        Top = 35
        Width = 213
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
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 13
      Width = 108
      Height = 87
      Caption = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072
      TabOrder = 5
      object Label1: TLabel
        Left = 4
        Top = 24
        Width = 6
        Height = 13
        Caption = #1089
      end
      object Label2: TLabel
        Left = 4
        Top = 54
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Date1: TDateTimePicker
        Left = 19
        Top = 21
        Width = 82
        Height = 21
        CalAlignment = dtaLeft
        Date = 37088.641009456
        Time = 37088.641009456
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object Date2: TDateTimePicker
        Left = 19
        Top = 51
        Width = 82
        Height = 21
        CalAlignment = dtaLeft
        Date = 37088.641009456
        Time = 37088.641009456
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Left = 592
      Top = 17
      Width = 75
      Height = 83
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 6
      object sbOperReeRefresh: TSpeedButton
        Left = 4
        Top = 4
        Width = 67
        Height = 75
        Action = acMonVisirRefresh
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
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 195
    Width = 1001
    Height = 261
    Align = alClient
    DataSource = ds_Mon_Visir
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = acOperReePrintSvedExecute
    OnGetCellParams = DBGridEh1GetCellParams
    OnSortMarkingChanged = DBGridEh1SortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'nom_zd'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'inp_date'
        Footers = <>
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'ves'
        Footers = <>
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'is_denied'
        Footers = <>
        Width = 20
      end
      item
        EditButtons = <>
        FieldName = 'prichin'
        Footers = <>
        Width = 272
      end
      item
        EditButtons = <>
        FieldName = 'is_export'
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'stan'
        Footers = <>
        Width = 168
      end
      item
        EditButtons = <>
        FieldName = 'gdkod_npr'
        Footers = <>
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'gdname_npr'
        Footers = <>
        Width = 401
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 1001
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
        DropdownCombo = True
        ImageIndex = 6
        OnClick = acOperReePrintSvedExecute
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
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem3: TTBItem
        Caption = #1055#1086' '#1094#1080#1089#1090#1077#1088#1085#1072#1084
        DisplayMode = nbdmImageAndText
        ImageIndex = 7
        Images = f_main.img_Common
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
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 568
    Width = 1001
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
    SimplePanel = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 456
    Width = 1001
    Height = 112
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object Label8: TLabel
      Left = 8
      Top = 8
      Width = 81
      Height = 13
      Caption = #1042#1083#1072#1076#1077#1083#1077#1094' '#1085'/'#1087#1088'.:'
    end
    object DBText2: TDBText
      Left = 96
      Top = 8
      Width = 169
      Height = 17
      DataField = 'npr_sobstv'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 9
      Top = 24
      Width = 59
      Height = 13
      Caption = #1057#1090#1072#1085'.'#1086#1090#1087#1088'.: '
    end
    object DBText3: TDBText
      Left = 80
      Top = 24
      Width = 289
      Height = 17
      DataField = 'stanotp'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 376
      Top = 24
      Width = 99
      Height = 13
      Caption = #1043#1088#1091#1079#1086#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100': '
    end
    object DBText4: TDBText
      Left = 488
      Top = 24
      Width = 505
      Height = 17
      DataField = 'grotp_name'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 7
      Top = 40
      Width = 60
      Height = 13
      Caption = #1057#1090#1072#1085'.'#1085#1072#1079#1085'.: '
    end
    object DBText5: TDBText
      Left = 80
      Top = 40
      Width = 289
      Height = 17
      DataField = 'stan'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 384
      Top = 40
      Width = 92
      Height = 13
      Caption = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100': '
    end
    object DBText6: TDBText
      Left = 488
      Top = 40
      Width = 505
      Height = 17
      DataField = 'poluch'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 384
      Top = 56
      Width = 94
      Height = 13
      Caption = #1040#1076#1088#1077#1089' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'
    end
    object DBText7: TDBText
      Left = 488
      Top = 56
      Width = 505
      Height = 17
      DataField = 'pol_addr'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 5
      Top = 56
      Width = 67
      Height = 13
      Caption = #1042#1077#1090#1082#1072' '#1087#1086#1083#1091#1095'.:'
    end
    object DBText8: TDBText
      Left = 80
      Top = 56
      Width = 289
      Height = 17
      DataField = 'vetka'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 632
      Top = 8
      Width = 69
      Height = 13
      Caption = #1062#1080#1089#1090' '#1085#1072' '#1084#1077#1089'.:'
    end
    object DBText9: TDBText
      Left = 704
      Top = 8
      Width = 41
      Height = 17
      DataField = 'cist'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 752
      Top = 8
      Width = 69
      Height = 13
      Caption = #1058#1086#1085#1085' '#1085#1072' '#1084#1077#1089'.:'
    end
    object DBText10: TDBText
      Left = 824
      Top = 8
      Width = 65
      Height = 17
      DataField = 'cist'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 8
      Top = 72
      Width = 70
      Height = 13
      Caption = #1042#1080#1076' '#1086#1090#1075#1088#1091#1079#1082#1080':'
    end
    object DBText11: TDBText
      Left = 80
      Top = 72
      Width = 185
      Height = 17
      DataField = 'load_name'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 272
      Top = 8
      Width = 95
      Height = 13
      Caption = #1053'/'#1087#1088'. '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091':'
    end
    object DBText12: TDBText
      Left = 376
      Top = 8
      Width = 249
      Height = 17
      DataField = 'name_npr'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 272
      Top = 72
      Width = 66
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
    end
    object DBText13: TDBText
      Left = 344
      Top = 72
      Width = 649
      Height = 17
      DataField = 'prim'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 288
      Top = 88
      Width = 54
      Height = 13
      Caption = #1043#1088'.4 '#1085#1072#1082#1083'.:'
    end
    object DBText14: TDBText
      Left = 344
      Top = 88
      Width = 649
      Height = 17
      DataField = 'gr4'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 88
      Width = 89
      Height = 13
      Caption = #1050#1086#1076'.'#1080#1089#1082#1083'.'#1090#1072#1088#1080#1092#1072':'
    end
    object DBText1: TDBText
      Left = 104
      Top = 88
      Width = 169
      Height = 17
      DataField = 'k_tar'
      DataSource = ds_Mon_Visir
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ora_Session: TOracleSession
    BeforeLogOn = ora_SessionBeforeLogOn
    Cursor = crHourGlass
    DesignConnection = False
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    ConnectAs = caNormal
    ThreadSafe = False
    Preferences.FloatPrecision = 0
    Preferences.IntegerPrecision = 0
    Preferences.SmallIntPrecision = -1
    Preferences.UseOCI7 = False
    Preferences.ConvertCRLF = True
    Preferences.TrimStringFields = True
    Preferences.MaxStringFieldSize = 0
    Preferences.ZeroDateIsNull = True
    Preferences.NullLOBIsEmpty = False
    Pooling = spNone
    MTSOptions = [moImplicit, moUniqueServer]
    Connected = True
    RollbackOnDisconnect = False
    NullValue = nvUnAssigned
    SQLTrace = stUnchanged
    OptimizerGoal = ogUnchanged
    IsolationLevel = ilUnchanged
    BytesPerCharacter = bc1Byte
    Left = 487
    Top = 353
  end
  object q_Mon_Visir: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  MONTH_VISIR_LOC.ROWID,'
      '  MONTH_VISIR_LOC.ID,'
      '  MONTH_VISIR_LOC.DATE_REE,'
      '  MONTH_VISIR_LOC.DOP_REE,'
      '  MONTH_VISIR_LOC.PRICHIN,'
      '  MONTH_VISIR_LOC.APP_USERS_ID,'
      '  MASTER.V_MONTH_GD'
      ''
      '  DATE_REE,'
      '  DOP_REE,'
      '  MONTH_REE.VES')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      030000003500000008000000414242525F4E50520100000000060000004E4F4D
      5F5A44010000000008000000444154455F524545010000000007000000444F50
      5F52454501000000000300000056455301000000000A0000005354414E4F5450
      5F494401000000000A00000047444F524F54505F494401000000000C00000053
      54414E4F54505F4E414D4501000000000D0000004E50525F534F425354565F49
      4401000000000F0000004E50525F534F425354565F4E414D4501000000000700
      00005354414E5F494401000000000700000047444F525F494401000000000900
      00005354414E5F4E414D450100000000080000005645544B415F494401000000
      0009000000504F4C5543485F494401000000000B000000504F4C5543485F4E41
      4D4501000000000B000000504F4C5543485F4144445201000000000900000054
      45585F50445F494401000000000B0000004E415A4E5F4F54475F494401000000
      000900000049535F4558504F52540100000000090000004C4F41445F41424252
      0100000000090000004C4F41445F4E414D45010000000006000000444F475F49
      4401000000000A00000055534C5F4E554D42455201000000000A000000474F53
      50524F475F494401000000000B00000050524F445F49445F4E50520100000000
      080000004E414D455F4E505201000000000A00000047445F4B4F445F4E505201
      000000000B00000047445F4E414D455F4E505201000000000D000000544F4E4E
      5F4445434C4152454401000000000B000000544F4E4E5F4C4F41444544010000
      00000D000000434953545F4445434C4152454401000000000B00000043495354
      5F4C4F41444544010000000010000000464C475F414C4C4F575F385F41584553
      01000000000E000000464C475F55505045525F534C495601000000000C000000
      464C475F444F505F4349535401000000000B000000464C475F464F524D415F32
      010000000009000000464C475F4F424F4752010000000009000000444154455F
      504C414E0100000000040000005052494D010000000003000000475234010000
      0000050000004B5F54415201000000000A000000494E5055545F444154450100
      0000000B0000005550444154455F4441544501000000000A0000005441524946
      31544F4E4E010000000009000000504F545245425F494401000000000B000000
      504F545245425F4E414D4501000000000B000000504F545245425F4144445201
      000000000B000000504C414E535452555F49440100000000090000004E504F44
      4F475F494401000000000800000047524F54505F494401000000000A00000047
      524F54505F4E414D4501000000000A0000005645544B415F4E414D4501000000
      00}
    Cursor = crDefault
    ReadOnly = True
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = ora_Session
    DesignActivation = False
    Active = False
    BeforeOpen = q_Mon_VisirBeforeOpen
    AfterOpen = q_Mon_VisirAfterOpen
    AfterScroll = q_Mon_VisirAfterScroll
    Left = 739
    Top = 273
  end
  object ds_Mon_Visir: TDataSource
    DataSet = q_Mon_Visir
    Left = 459
    Top = 253
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 487
    Top = 381
  end
  object q_ProdGr: TOracleDataSet
    SQL.Strings = (
      'select '
      '  kls_prod.id_npr,'
      '  kls_prod.NAME_NPR '
      'from kls_prod where kls_prod.ID_GROUP_NPR='#39'00000'#39
      'ORDER BY 1')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      0300000002000000080000004E414D455F4E505201000000000600000049445F
      4E50520100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = ora_Session
    DesignActivation = False
    Active = False
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
      Size = 30
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
      '  kls_prod.GD_KOD_NPR,'
      '  kls_prod.GD_NAME_NPR '
      'from kls_prod where GD_KOD_NPR NOT NULL'
      'GROUP BY 1,2')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      0300000002000000080000004E414D455F4E505201000000000600000049445F
      4E50520100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = ora_Session
    DesignActivation = False
    Active = False
    Left = 571
    Top = 353
    object StringField1: TStringField
      FieldName = 'GD_KOD_NPR'
      Required = True
      Size = 5
    end
    object StringField2: TStringField
      FieldName = 'GD_NAME_NPR'
      Required = True
      Size = 30
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
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A00000053484F52545F4E414D
      450100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = ora_Session
    DesignActivation = False
    Active = False
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
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A00000053484F52545F4E414D
      450100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = ora_Session
    DesignActivation = False
    Active = False
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
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      0300000002000000090000005354414E5F4E414D450100000000080000005354
      414E5F4B4F440100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = ora_Session
    DesignActivation = False
    Active = False
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
    DBGridEh = DBGridEh1
    Options = [pghFitGridToPageWidth, pghRowAutoStretch, pghFitingByColWidths, pghOptimalColWidths]
    Page.BottomMargin = 1
    Page.LeftMargin = 1
    Page.RightMargin = 1
    Page.TopMargin = 1
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
    object acOperReePrintTable: TAction
      Category = 'Common'
      Caption = #1055#1077#1095#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099
      ImageIndex = 0
      OnExecute = acOperReePrintTableExecute
    end
    object acOperReePrintSved: TAction
      Category = 'Common'
      Caption = #1056#1077#1077#1089#1090#1088' '#1088#1072#1079#1085#1072#1088#1103#1076#1086#1082
      ImageIndex = 0
      OnExecute = acOperReePrintSvedExecute
    end
    object acMonVisirRefresh: TAction
      Category = 'Common'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acMonVisirRefreshExecute
    end
    object acOperReeNoFilter: TAction
      Category = 'Common'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 16
      OnExecute = acOperReeNoFilterExecute
    end
    object acOperReeFilter: TAction
      Category = 'Common'
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 9
      OnExecute = acOperReeFilterExecute
    end
    object acOperReePrintPasp: TAction
      Category = 'Common'
      Caption = #1056#1072#1079#1085#1072#1088#1103#1076#1082#1072
      ImageIndex = 0
      OnExecute = acOperReePrintPaspExecute
    end
    object acOperReePrint: TAction
      Category = 'Common'
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 6
    end
  end
  object Crpe1: TCrpe
    About = 'Version and Credits...'
    DesignControls = 'Design-Time Window Controls'
    Version.Crpe.DLL = '8.80'
    Version.Crpe.Engine = '8.80'
    Version.Crpe.FileVersion = '8.5.0.217'
    Version.Crpe.Major = 8
    Version.Crpe.Minor = 5
    Version.Crpe.Release = 0
    Version.Crpe.Build = 217
    Version.Report.Major = 8
    Version.Report.Minor = 0
    Version.Report.Letter = 'a'
    Version.Windows.Platform = 'NT'
    Version.Windows.Major = 5
    Version.Windows.Minor = 0
    Version.Windows.Build = '2195'
    ReportName = 'U:\Master\by_detail.rpt'
    CrpePath = 'D:\WINNT\System32\'
    TempPath = 'd:\temp\'
    Margins.Left = 312
    Margins.Right = 370
    Margins.Top = 360
    Margins.Bottom = 290
    PrintDate.Day = 12
    PrintDate.Month = 5
    PrintDate.Year = 2002
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
    ParamFields.Item.Format.Field.Paragraph.LineSpacing = 1
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
    Formulas.Item.Format.Field.Paragraph.LineSpacing = 1
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
    SQLExpressions.Item.Format.Field.Paragraph.LineSpacing = 1
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
    ExportOptions.Excel.Constant = 9
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
    TextObjects.Item.Format.Paragraph.LineSpacing = 1
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
    TextObjects.Item.EmbeddedFields.Item.Format.Field.Paragraph.LineSpacing = 1
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
    DatabaseFields.Item.Format.Field.Paragraph.LineSpacing = 1
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
    SummaryFields.Item.Format.Field.Paragraph.LineSpacing = 1
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
    SpecialFields.Item.Format.Field.Paragraph.LineSpacing = 1
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
    GroupNameFields.Item.Format.Field.Paragraph.LineSpacing = 1
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
    RunningTotals.Item.Format.Field.Paragraph.LineSpacing = 1
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
    WindowCursor.HyperLink = wcHand
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
    Graphs.Item.Options.Max = -1
    Graphs.Item.Options.Min = -1
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
    Graphs.Item.Axis.MinY = -1
    Graphs.Item.Axis.MaxY = -1
    Graphs.Item.Axis.MinY2 = -1
    Graphs.Item.Axis.MaxY2 = -1
    Graphs.Item.Axis.MinZ = -1
    Graphs.Item.Axis.MaxZ = -1
    Graphs.Item.Axis.NumberFormatY = gnfNoDecimal
    Graphs.Item.Axis.NumberFormatY2 = gnfNoDecimal
    Graphs.Item.Axis.NumberFormatZ = gnfNoDecimal
    Graphs.Item.Axis.DivisionTypeY = gdvAutomatic
    Graphs.Item.Axis.DivisionTypeY2 = gdvAutomatic
    Graphs.Item.Axis.DivisionTypeZ = gdvAutomatic
    Graphs.Item.Axis.DivisionsY = -1
    Graphs.Item.Axis.DivisionsY2 = -1
    Graphs.Item.Axis.DivisionsZ = -1
    SummaryInfo.AppName = 'Crystal Reports'
    SummaryInfo.SavePreviewPicture = False
    ReportOptions.SaveDataWithReport = False
    ReportOptions.SaveSummariesWithReport = False
    ReportOptions.AsyncQuery = True
    ReportOptions.PromptMode = pmNone
    ReportOptions.AlwaysSortLocally = False
    ReportOptions.IsReadOnly = True
    ReportOptions.CanSelectDistinctRecords = False
    Left = 432
    Top = 353
  end
  object ImageList1: TImageList
    Left = 431
    Top = 381
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000001042000000420042000000000042
      0042000000000000000000000000000000001042000000420042000000000042
      0042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000004210420000004200420000
      0000004200420000000000000000000000000000004210420000004200420000
      0000004200420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100010001000
      0000000010420042004200000000000000000000000000000000100010001000
      0000000010420042004200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F001F001F001F00
      1F00100000001042000000000000000000000000000000001F001F001F001F00
      1F00100000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010001F001F001F001F00
      1F001F0010000000104200420042000000000000000010001F001F001F001F00
      1F001F0010000000104200420042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F001F001F001F00
      1F001F001000100000001042000000000000000000001F001F001F001F001F00
      1F001F0010001000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F00FF7F1F001F001F00
      1F001F001000100010000000000000420042000000001F00FF7F1F001F001F00
      1F001F0010001000100000000000004200420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001000FF7F1F001F001F00
      1F0010001F00100010001000000000000000000000001000FF7F1F001F001F00
      1F0010001F001000100010000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F00FF7FFF7F1F00
      1F001F0010001F00100010001000000010420000000000001F00FF7FFF7F1F00
      1F001F0010001F00100010001000000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000010001F001000
      1F001F001F0010001F001000100000000000000000000000000010001F001000
      1F001F001F0010001F0010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001000
      100010001F001F0010001F001000000000000000000000000000000000001000
      100010001F001F0010001F001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F00
      1F001F001F001F001F0010001000000000000000000000000000000000001F00
      1F001F001F001F001F0010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001F001F001F0010000000000000000000000000000000000000000000
      000000001F001F001F0010000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7F0000000000000000000000000000000000000000000000000000
      00000000FF7F0000000000000000000000000000000000000000000000000000
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
  object ADO_Conn: TADOConnection
    Connected = True
    ConnectionString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=PF'
    LoginPrompt = False
    Left = 304
    Top = 312
  end
  object q_Tmpppppp: TADOTable
    Connection = ADO_Conn
    CursorType = ctStatic
    BeforeOpen = q_TmppppppBeforeOpen
    TableName = 'c:\tmp\visir.dbf'
    Left = 384
    Top = 256
    object q_Tmppppppdate_ree: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'date_ree'
      ReadOnly = True
    end
    object q_Tmppppppdop_ree: TIntegerField
      DisplayLabel = #8470' '#1076#1086#1087'. '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'dop_ree'
      ReadOnly = True
    end
    object q_Tmppppppnom_zd: TStringField
      DisplayLabel = #8470' '#1088#1072#1079#1085'.'
      FieldName = 'nom_zd'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object q_Tmppppppves: TBCDField
      DisplayLabel = #1057#1091#1090'. '#1079#1072#1076#1072#1085#1080#1077
      FieldName = 'ves'
      ReadOnly = True
      DisplayFormat = '0.000'
      EditFormat = '0.000'
      Precision = 14
      Size = 3
    end
    object q_Tmppppppis_denied: TBooleanField
      DisplayLabel = #1061
      FieldName = 'is_denied'
    end
    object q_Tmppppppprichin: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1086#1090#1082#1072#1079#1072
      FieldName = 'prichin'
      FixedChar = True
      Size = 200
    end
    object q_Tmppppppinp_date: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1072#1079#1085'.'
      FieldName = 'inp_date'
      ReadOnly = True
    end
    object q_Tmppppppupd_date: TDateField
      DisplayLabel = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1080
      FieldName = 'upd_date'
      ReadOnly = True
    end
    object q_Tmppppppis_export: TStringField
      DisplayLabel = #1050#1091#1076#1072'?'
      FieldName = 'is_export'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object q_Tmppppppnpr_sobstv: TStringField
      DisplayLabel = #1042#1083#1072#1076#1077#1083#1077#1094' '#1085'/'#1087#1088'.'
      FieldName = 'npr_sobstv'
      ReadOnly = True
      FixedChar = True
      Size = 60
    end
    object q_Tmppppppstanotp_id: TBCDField
      FieldName = 'stanotp_id'
      ReadOnly = True
      Precision = 10
      Size = 0
    end
    object q_Tmppppppstanotp: TStringField
      DisplayLabel = #1057#1090#1072#1085'.'#1086#1090#1087#1088#1072#1074'.'
      FieldName = 'stanotp'
      ReadOnly = True
      FixedChar = True
      Size = 100
    end
    object q_Tmppppppgrotp_id: TBCDField
      FieldName = 'grotp_id'
      ReadOnly = True
      Precision = 10
      Size = 0
    end
    object q_Tmppppppgrotp_name: TStringField
      DisplayLabel = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
      FieldName = 'grotp_name'
      ReadOnly = True
      FixedChar = True
      Size = 150
    end
    object q_Tmppppppstan_id: TBCDField
      FieldName = 'stan_id'
      ReadOnly = True
      Precision = 10
      Size = 0
    end
    object q_Tmppppppstan: TStringField
      DisplayLabel = #1057#1090#1072#1085'.'#1085#1072#1079#1085'.'
      FieldName = 'stan'
      ReadOnly = True
      FixedChar = True
      Size = 100
    end
    object q_Tmppppppvetka: TStringField
      DisplayLabel = #1042#1077#1090#1082#1072' '#1087#1086#1083#1091#1095'.'
      FieldName = 'vetka'
      ReadOnly = True
      FixedChar = True
      Size = 100
    end
    object q_Tmpppppppoluch_id: TBCDField
      FieldName = 'poluch_id'
      ReadOnly = True
      Precision = 10
      Size = 0
    end
    object q_Tmpppppppoluch: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'poluch'
      ReadOnly = True
      FixedChar = True
      Size = 100
    end
    object q_Tmpppppppol_addr: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1087#1086#1083#1091#1095'.'
      FieldName = 'pol_addr'
      ReadOnly = True
      FixedChar = True
      Size = 200
    end
    object q_Tmppppppload_name: TStringField
      DisplayLabel = #1042#1080#1076' '#1086#1090#1075#1088'.'
      FieldName = 'load_name'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object q_Tmppppppgroup_npr: TStringField
      FieldName = 'group_npr'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object q_Tmppppppid_npr: TStringField
      FieldName = 'id_npr'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object q_Tmppppppname_npr: TStringField
      DisplayLabel = #1053'/'#1087#1088'. '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
      FieldName = 'name_npr'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object q_Tmppppppgdkod_npr: TStringField
      DisplayLabel = #1046'/'#1076' '#1082#1086#1076
      FieldName = 'gdkod_npr'
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
    object q_Tmppppppgdname_npr: TStringField
      DisplayLabel = #1046'/'#1076' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1079#1072
      FieldName = 'gdname_npr'
      ReadOnly = True
      FixedChar = True
      Size = 100
    end
    object q_Tmppppppcist: TIntegerField
      DisplayLabel = #1062#1080#1089#1090' '#1085#1072' '#1084#1077#1089#1103#1094
      FieldName = 'cist'
      ReadOnly = True
    end
    object q_Tmpppppptonn: TBCDField
      DisplayLabel = #1058#1086#1085#1085' '#1085#1072' '#1084#1077#1089#1103#1094
      FieldName = 'tonn'
      ReadOnly = True
      DisplayFormat = '0.000'
      Precision = 10
      Size = 3
    end
    object q_Tmppppppforma_2: TBooleanField
      FieldName = 'forma_2'
      ReadOnly = True
    end
    object q_Tmppppppdate_plan: TStringField
      FieldName = 'date_plan'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object q_Tmppppppprim: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'prim'
      ReadOnly = True
      FixedChar = True
      Size = 100
    end
    object q_Tmppppppgr4: TStringField
      DisplayLabel = #1043#1088'.4 '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'gr4'
      ReadOnly = True
      FixedChar = True
      Size = 100
    end
    object q_Tmppppppk_tar: TStringField
      DisplayLabel = #1050#1086#1076' '#1080#1082#1089#1083'.'#1090#1072#1088#1080#1092#1072
      FieldName = 'k_tar'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
  end
  object q_cmn: TADOQuery
    Connection = ADO_Conn
    Parameters = <>
    Left = 528
    Top = 256
  end
  object q_MasterVisir: TOracleDataSet
    SQL.Strings = (
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      030000003500000008000000414242525F4E50520100000000060000004E4F4D
      5F5A44010000000008000000444154455F524545010000000007000000444F50
      5F52454501000000000300000056455301000000000A0000005354414E4F5450
      5F494401000000000A00000047444F524F54505F494401000000000C00000053
      54414E4F54505F4E414D4501000000000D0000004E50525F534F425354565F49
      4401000000000F0000004E50525F534F425354565F4E414D4501000000000700
      00005354414E5F494401000000000700000047444F525F494401000000000900
      00005354414E5F4E414D450100000000080000005645544B415F494401000000
      0009000000504F4C5543485F494401000000000B000000504F4C5543485F4E41
      4D4501000000000B000000504F4C5543485F4144445201000000000900000054
      45585F50445F494401000000000B0000004E415A4E5F4F54475F494401000000
      000900000049535F4558504F52540100000000090000004C4F41445F41424252
      0100000000090000004C4F41445F4E414D45010000000006000000444F475F49
      4401000000000A00000055534C5F4E554D42455201000000000A000000474F53
      50524F475F494401000000000B00000050524F445F49445F4E50520100000000
      080000004E414D455F4E505201000000000A00000047445F4B4F445F4E505201
      000000000B00000047445F4E414D455F4E505201000000000D000000544F4E4E
      5F4445434C4152454401000000000B000000544F4E4E5F4C4F41444544010000
      00000D000000434953545F4445434C4152454401000000000B00000043495354
      5F4C4F41444544010000000010000000464C475F414C4C4F575F385F41584553
      01000000000E000000464C475F55505045525F534C495601000000000C000000
      464C475F444F505F4349535401000000000B000000464C475F464F524D415F32
      010000000009000000464C475F4F424F4752010000000009000000444154455F
      504C414E0100000000040000005052494D010000000003000000475234010000
      0000050000004B5F54415201000000000A000000494E5055545F444154450100
      0000000B0000005550444154455F4441544501000000000A0000005441524946
      31544F4E4E010000000009000000504F545245425F494401000000000B000000
      504F545245425F4E414D4501000000000B000000504F545245425F4144445201
      000000000B000000504C414E535452555F49440100000000090000004E504F44
      4F475F494401000000000800000047524F54505F494401000000000A00000047
      524F54505F4E414D4501000000000A0000005645544B415F4E414D4501000000
      00}
    Cursor = crDefault
    ReadOnly = True
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = ora_Session
    DesignActivation = False
    Active = False
    Left = 643
    Top = 281
  end
end
