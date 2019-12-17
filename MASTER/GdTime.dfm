inherited f_GdTime: Tf_GdTime
  Left = 304
  Top = 217
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1074#1088#1077#1084#1077#1085#1080' '#1086#1090#1075#1088#1091#1079#1082#1080
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 688
    Height = 26
    object TBToolbar2: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acAddGgTime
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acChangeGdTime
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = acDelGdTime
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 688
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object RxSpeedButton1: TRxSpeedButton
      Left = 106
      Top = 3
      Width = 25
      Height = 25
      Action = acRefreshGdTime
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
    end
    object Label3: TLabel
      Left = 135
      Top = 9
      Width = 34
      Height = 13
      Caption = #1089' '#1076#1072#1090#1099
    end
    object Label4: TLabel
      Left = 262
      Top = 9
      Width = 37
      Height = 13
      Caption = #1087#1086' '#1076#1072#1090#1091
    end
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 3
      Width = 100
      Height = 25
      DataSource = ds_GdTime
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object ed_BeginDate: TDateTimePicker
      Left = 177
      Top = 5
      Width = 82
      Height = 21
      Date = 37070.390091736100000000
      Time = 37070.390091736100000000
      TabOrder = 1
    end
    object ed_EndDate: TDateTimePicker
      Left = 305
      Top = 5
      Width = 82
      Height = 21
      Date = 37070.390091736100000000
      Time = 37070.390091736100000000
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 405
    Width = 688
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
  end
  object gridPost: TDBGridEh
    Left = 0
    Top = 57
    Width = 688
    Height = 348
    Align = alClient
    AllowedOperations = []
    AllowedSelections = [gstRecordBookmarks, gstAll]
    DataSource = ds_GdTime
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch]
    SumList.Active = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = acChangeGdTimeExecute
    Columns = <
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'num_otgr'
        Footers = <>
        Width = 93
      end
      item
        EditButtons = <>
        FieldName = 'date_otgr'
        Footers = <>
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'np_data_o'
        Footers = <>
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'np_timep'
        Footers = <>
        Width = 87
      end>
  end
  object ActionManager2: TActionManager
    Images = f_main.img_Common
    Left = 512
    Top = 200
    StyleName = 'XP Style'
    object acAddGgTime: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = acAddGgTimeExecute
    end
    object acChangeGdTime: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 8
      OnExecute = acChangeGdTimeExecute
    end
    object acDelGdTime: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acDelGdTimeExecute
    end
    object acRefreshGdTime: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acRefreshGdTimeExecute
    end
  end
  object ado_Session: TADOConnection
    ConnectionString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=PF'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 48
    Top = 104
  end
  object q_GdTime: TADOQuery
    Connection = ado_Session
    CursorType = ctStatic
    BeforeOpen = q_GdTimeBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT mesto.name,gd_time.*'
      'FROM gd_time,mesto'
      'WHERE (EMPTY(DATE_OTGR) or'
      '(DATE_OTGR>={11/01/2002} and DATE_OTGR<={11/30/2003}))'
      'AND gd_time.mesto=mesto.kod'
      'ORDER BY DATE_OTGR,NUM_OTGR')
    Left = 120
    Top = 104
    object q_GdTimename: TStringField
      DisplayLabel = #1052#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080
      DisplayWidth = 18
      FieldName = 'name'
      FixedChar = True
      Size = 15
    end
    object q_GdTimenum_otgr: TStringField
      DisplayLabel = #8470' '#1074#1072#1075#1086#1085#1072
      DisplayWidth = 12
      FieldName = 'num_otgr'
      FixedChar = True
      Size = 9
    end
    object q_GdTimedate_otgr: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1103
      DisplayWidth = 12
      FieldName = 'date_otgr'
    end
    object q_GdTimenp_data_o: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080
      DisplayWidth = 13
      FieldName = 'np_data_o'
    end
    object q_GdTimenp_timep: TStringField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1086#1090#1075#1088#1091#1079#1082#1080
      DisplayWidth = 12
      FieldName = 'np_timep'
      FixedChar = True
      Size = 8
    end
    object q_GdTimemesto: TIntegerField
      FieldName = 'mesto'
    end
  end
  object ds_GdTime: TDataSource
    DataSet = q_GdTime
    Left = 176
    Top = 104
  end
  object q_cmn: TADOQuery
    Connection = ado_Session
    CursorType = ctStatic
    Parameters = <>
    Left = 128
    Top = 208
    object StringField1: TStringField
      DisplayLabel = #1052#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080
      DisplayWidth = 18
      FieldName = 'name'
      FixedChar = True
      Size = 15
    end
    object StringField2: TStringField
      DisplayLabel = #8470' '#1074#1072#1075#1086#1085#1072
      DisplayWidth = 12
      FieldName = 'num_otgr'
      FixedChar = True
      Size = 9
    end
    object DateField1: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1103
      DisplayWidth = 12
      FieldName = 'date_otgr'
    end
    object DateField2: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080
      DisplayWidth = 13
      FieldName = 'np_data_o'
    end
    object StringField3: TStringField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1086#1090#1075#1088#1091#1079#1082#1080
      DisplayWidth = 12
      FieldName = 'np_timep'
      FixedChar = True
      Size = 8
    end
  end
end
