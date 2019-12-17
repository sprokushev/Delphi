object f_zayav: Tf_zayav
  Left = 243
  Top = 255
  Width = 941
  Height = 500
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1103#1074#1086#1082' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnActivate = FormActivate
  OnClick = requery_zayavExecute
  PixelsPerInch = 96
  TextHeight = 13
  object gr_zayav: TDBGridEh
    Left = 0
    Top = 132
    Width = 933
    Height = 334
    Align = alClient
    DataSource = ds_zayav
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
    Columns = <
      item
        EditButtons = <>
        FieldName = 'FROM_DATE'
        Footers = <>
        Title.Caption = #1057' '#1076#1072#1090#1099
      end
      item
        EditButtons = <>
        FieldName = 'TO_DATE'
        Footers = <>
        Title.Caption = #1055#1086' '#1076#1072#1090#1091
      end
      item
        EditButtons = <>
        FieldName = 'PROD'
        Footers = <>
        Title.Caption = #1043#1088#1091#1079
      end
      item
        EditButtons = <>
        FieldName = 'REG_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080
      end
      item
        EditButtons = <>
        FieldName = 'SOGL_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1089#1086#1075#1083#1072#1089#1086#1074#1072#1085#1080#1103
      end
      item
        EditButtons = <>
        FieldName = 'OTPRAV'
        Footers = <>
        LookupDisplayFields = 'OTPRAV'
        Title.Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
        Width = 209
      end
      item
        EditButtons = <>
        FieldName = 'PLATTAR'
        Footers = <>
        Title.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1090#1072#1088#1080#1092#1072
        Width = 201
      end
      item
        EditButtons = <>
        FieldName = 'EXPED'
        Footers = <>
        Title.Caption = #1069#1082#1089#1087#1077#1076#1080#1090#1086#1088
        Width = 165
      end
      item
        EditButtons = <>
        FieldName = 'RODVAG'
        Footers = <>
        Title.Caption = #1056#1086#1076' '#1074#1072#1075#1086#1085#1072
      end
      item
        EditButtons = <>
        FieldName = 'STAT_NAGR'
        Footers = <>
        Title.Caption = #1057#1090#1072#1090'.'#1085#1072#1075#1088'.'
      end
      item
        EditButtons = <>
        FieldName = 'DOGOVOR'
        Footers = <>
        Title.Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
        Width = 108
      end
      item
        EditButtons = <>
        FieldName = 'STANOTPR'
        Footers = <>
        Title.Caption = #1057#1090#1072#1085#1094#1080#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
        Width = 142
      end
      item
        EditButtons = <>
        FieldName = 'PODACH'
        Footers = <>
        Title.Caption = #1055#1086#1076#1072#1095#1072
      end
      item
        EditButtons = <>
        FieldName = 'VIDSOOB'
        Footers = <>
        Title.Caption = #1042#1080#1076' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
        Width = 119
      end
      item
        EditButtons = <>
        FieldName = 'GR_GRUZ'
        Footers = <>
        Title.Caption = #1043#1088#1091#1087#1087#1072' '#1075#1088#1091#1079#1072
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'PRIZNOTPR'
        Footers = <>
        Title.Caption = #1055#1088#1080#1079#1085#1072#1082' '#1086#1090#1087#1088#1072#1074#1082#1080
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'VLADPUT'
        Footers = <>
        Title.Caption = #1042#1083#1072#1076#1077#1083#1077#1094' '#1087#1091#1090#1080
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 26
    Width = 933
    Height = 106
    BoundLines = [blTop, blBottom, blLeft, blRight]
    FixAlign = True
    object TBToolbar2: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar2'
      DockPos = -2
      TabOrder = 0
      object TBControlItem2: TTBControlItem
        Control = GroupBox2
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 450
        Height = 100
        Caption = #1060#1080#1083#1100#1090#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 159
          Top = 18
          Width = 23
          Height = 13
          Caption = #1043#1088#1091#1079
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object RadioGroup1: TRadioGroup
          Left = 7
          Top = 15
          Width = 140
          Height = 77
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            #1042#1089#1077
            #1053#1077#1089#1086#1075#1083#1072#1089#1086#1074#1072#1085#1085#1099#1077
            #1057#1086#1075#1083#1072#1089#1086#1074#1072#1085#1085#1099#1077)
          ParentFont = False
          TabOrder = 0
        end
        object c_filter_prod: TRxDBLookupCombo
          Left = 186
          Top = 14
          Width = 225
          Height = 21
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LookupField = 'ID'
          LookupDisplay = 'NAME'
          LookupSource = ds_filter_prod
          ParentFont = False
          TabOrder = 1
        end
        object GroupBox1: TGroupBox
          Left = 154
          Top = 37
          Width = 257
          Height = 55
          Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080
          TabOrder = 2
          object Label2: TLabel
            Left = 10
            Top = 28
            Width = 7
            Height = 13
            Caption = #1057
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 126
            Top = 27
            Width = 12
            Height = 13
            Caption = #1087#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object c_filter_regdate1: TDBDateTimeEditEh
            Left = 24
            Top = 24
            Width = 90
            Height = 21
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 0
            Visible = True
            OnChange = c_filter_regdate1Change
          end
          object c_filter_regdate2: TDBDateTimeEditEh
            Left = 143
            Top = 24
            Width = 90
            Height = 21
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 1
            Visible = True
            OnChange = c_filter_regdate2Change
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 466
      Top = 17
      Width = 76
      Height = 74
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object b_zayav_refresh: TSpeedButton
        Left = 4
        Top = 4
        Width = 67
        Height = 66
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
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
        OnClick = b_zayav_refreshClick
      end
    end
  end
  object TBDock2: TTBDock
    Left = 0
    Top = 0
    Width = 933
    Height = 26
    object TBToolbar3: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DockPos = 0
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 0
        OnClick = TBItem_addZayavClick
      end
      object TBItem2: TTBItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 8
        OnClick = TBItem_redZayavClick
      end
      object TBItem3: TTBItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 5
        OnClick = TBItem_delZayavClick
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem5: TTBItem
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
        DisplayMode = nbdmImageAndText
        ImageIndex = 16
        OnClick = TBItemClearFilter
      end
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 132
    Width = 933
    Height = 334
    Align = alClient
    DataSource = ds_zayav
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'FROM_DATE'
        Footers = <>
        Title.Caption = #1057' '#1076#1072#1090#1099
      end
      item
        EditButtons = <>
        FieldName = 'TO_DATE'
        Footers = <>
        Title.Caption = #1055#1086' '#1076#1072#1090#1091
      end
      item
        EditButtons = <>
        FieldName = 'PROD'
        Footers = <>
        Title.Caption = #1043#1088#1091#1079
      end
      item
        EditButtons = <>
        FieldName = 'REG_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080
      end
      item
        EditButtons = <>
        FieldName = 'SOGL_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1089#1086#1075#1083#1072#1089#1086#1074#1072#1085#1080#1103
      end
      item
        EditButtons = <>
        FieldName = 'OTPRAV'
        Footers = <>
        LookupDisplayFields = 'OTPRAV'
        Title.Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
        Width = 209
      end
      item
        EditButtons = <>
        FieldName = 'PLATTAR'
        Footers = <>
        Title.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1090#1072#1088#1080#1092#1072
        Width = 201
      end
      item
        EditButtons = <>
        FieldName = 'EXPED'
        Footers = <>
        Title.Caption = #1069#1082#1089#1087#1077#1076#1080#1090#1086#1088
        Width = 165
      end
      item
        EditButtons = <>
        FieldName = 'RODVAG'
        Footers = <>
        Title.Caption = #1056#1086#1076' '#1074#1072#1075#1086#1085#1072
      end
      item
        EditButtons = <>
        FieldName = 'STAT_NAGR'
        Footers = <>
        Title.Caption = #1057#1090#1072#1090'.'#1085#1072#1075#1088'.'
      end
      item
        EditButtons = <>
        FieldName = 'DOGOVOR'
        Footers = <>
        Title.Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
        Width = 108
      end
      item
        EditButtons = <>
        FieldName = 'STANOTPR'
        Footers = <>
        Title.Caption = #1057#1090#1072#1085#1094#1080#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
        Width = 142
      end
      item
        EditButtons = <>
        FieldName = 'PODACH'
        Footers = <>
        Title.Caption = #1055#1086#1076#1072#1095#1072
      end
      item
        EditButtons = <>
        FieldName = 'VIDSOOB'
        Footers = <>
        Title.Caption = #1042#1080#1076' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
        Width = 119
      end
      item
        EditButtons = <>
        FieldName = 'GR_GRUZ'
        Footers = <>
        Title.Caption = #1043#1088#1091#1087#1087#1072' '#1075#1088#1091#1079#1072
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'PRIZNOTPR'
        Footers = <>
        Title.Caption = #1055#1088#1080#1079#1085#1072#1082' '#1086#1090#1087#1088#1072#1074#1082#1080
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'VLADPUT'
        Footers = <>
        Title.Caption = #1042#1083#1072#1076#1077#1083#1077#1094' '#1087#1091#1090#1080
      end>
  end
  object OracleSession1: TOracleSession
    Cursor = crHourGlass
    DesignConnection = False
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
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
    Left = 8
    Top = 344
  end
  object q_zayav: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'Z.ROWID,'
      'Z.ID,'
      'Z.NOM_Z,'
      'Z.FROM_DATE,'
      'Z.TO_DATE,'
      'Z.PROD_ID,'
      'KP.NAME_GU12 AS PROD,'
      'Z.REG_DATE,'
      'Z.SOGL_DATE,'
      'Z.GROTP_ID,'
      'O.SHORT_NAME AS OTPRAV,'
      'Z.PLATTAR_ID,'
      'PLT.SHORT_NAME AS PLATTAR,'
      'Z.EXPED_ID,'
      'E.SHORT_NAME AS EXPED,'
      'Z.RODVAG_ID,'
      'RV.NAME AS RODVAG,'
      'KP.STAT_NAGR AS STAT_NAGR,'
      'Z.DOGOVOR,'
      'Z.STANOTPR_ID,'
      'SO.STAN_NAME AS STANOTPR,'
      'Z.PODACH_ID,'
      'POD.NAME AS PODACH,'
      'Z.VIDSOOB_ID AS VIDSOOB_ID,'
      'SOOB.NAME AS VIDSOOB,'
      'Z.GR_GRUZ_ID,'
      'GRGR.NAME AS GR_GRUZ,'
      'Z.PRIZNOTPR_ID,'
      'PROT.NAME AS PRIZNOTPR,'
      'Z.VLADPUT_ID,'
      'VP.VLADPUT '
      'FROM'
      'GU12_A Z,'
      'V_GU12_OTPRAV O,'
      'V_GU12_PLATTAR PLT,'
      'V_GU12_EXPED E,'
      'KLS_PROD_GU12 KP,'
      'KLS_GD_VAGTYPE RV,'
      'V_GU12_STAN_OTPR SO,'
      'KLS_GD_PODACH POD,'
      'KLS_GD_SOOB SOOB,'
      'KLS_GD_GROUP GRGR,'
      'KLS_GD_OTPR PROT,'
      'V_GU12_VLADPUT VP'
      'WHERE'
      'Z.GROTP_ID=O.GROTP_ID(+)'
      'AND Z.PLATTAR_ID=PLT.PLATTAR_ID(+)'
      'AND Z.EXPED_ID=E.ID(+)'
      'AND Z.PROD_ID=KP.ID(+)'
      'AND Z.RODVAG_ID=RV.ID(+)'
      'AND Z.STANOTPR_ID=SO.STAN_ID(+)'
      'AND Z.PODACH_ID=POD.ID(+)'
      'AND Z.VIDSOOB_ID=SOOB.ID(+)'
      'AND Z.GR_GRUZ_ID=GRGR.ID(+)'
      'AND Z.PRIZNOTPR_ID=PROT.ID(+)'
      'AND Z.VLADPUT_ID=VP.VLADPUT_ID(+)'
      'ORDER BY ID'
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
      030000001E0000000900000046524F4D5F44415445010000000007000000544F
      5F444154450100000000060000004F545052415601000000000800000047524F
      54505F494401000000000800000045585045445F494401000000000500000045
      58504544010000000002000000494401000000000A000000504C41545441525F
      4944010000000007000000504C41545441520100000000050000004E4F4D5F5A
      01000000000700000050524F445F494401000000000400000050524F44010000
      0000080000005245475F44415445010000000009000000534F474C5F44415445
      010000000009000000524F445641475F4944010000000006000000524F445641
      47010000000009000000535441545F4E414752010000000007000000444F474F
      564F5201000000000B0000005354414E4F5450525F4944010000000008000000
      5354414E4F545052010000000009000000504F444143485F4944010000000006
      000000504F4441434801000000000A000000564944534F4F425F494401000000
      0007000000564944534F4F4201000000000A00000047525F4752555A5F494401
      000000000C0000005052495A4E4F5450525F4944010000000009000000505249
      5A4E4F54505201000000000A000000564C41445055545F494401000000000700
      0000564C414450555401000000000700000047525F4752555A0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'GU12_A'
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = True
    Left = 8
    Top = 376
  end
  object ds_zayav: TDataSource
    DataSet = q_zayav
    Left = 8
    Top = 408
  end
  object ActMan: TActionManager
    Left = 48
    Top = 344
    StyleName = 'XP Style'
    object requery_zayav: TAction
      Caption = #1047#1072#1087#1088#1086#1089' '#1085#1072' '#1089#1087#1080#1089#1086#1082' '#1079#1072#1103#1074#1086#1082' '
      OnExecute = requery_zayavExecute
    end
  end
  object q_filter_prod: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,NAME,STAT_NAGR FROM KLS_PROD_GU12')
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
      03000000030000000200000049440100000000040000004E414D450100000000
      09000000535441545F4E4147520100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = True
    Left = 48
    Top = 376
  end
  object ds_filter_prod: TDataSource
    DataSet = q_filter_prod
    Left = 48
    Top = 408
  end
  object DataSource1: TDataSource
    DataSet = q_nrow
    Left = 88
    Top = 408
  end
  object q_nrow: TOracleDataSet
    SQL.Strings = (
      'select count(*) as NROW from gu12_a')
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
    QBEDefinition.QBEFieldDefs = {0300000001000000040000004E524F570100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = True
    Left = 88
    Top = 376
  end
end
