object f_KlsLinks: Tf_KlsLinks
  Left = 518
  Top = 316
  Width = 711
  Height = 459
  Caption = #1040#1089#1089#1086#1094#1080#1072#1094#1080#1080' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 473
    Top = 26
    Width = 10
    Height = 395
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 695
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DockPos = 0
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem4: TTBItem
        Action = acKLSNewLink
        DisplayMode = nbdmImageAndText
      end
      object TBItem7: TTBItem
        Action = acKLSDelLink
        DisplayMode = nbdmImageAndText
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
    end
    object rb1_1: TRadioButton
      Left = 368
      Top = 5
      Width = 41
      Height = 17
      Caption = '1-1'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rb1_1Click
    end
    object rbM_1: TRadioButton
      Left = 411
      Top = 5
      Width = 43
      Height = 17
      Caption = 'M-1'
      TabOrder = 2
      OnClick = rb1_1Click
    end
    object rbM_M: TRadioButton
      Left = 454
      Top = 5
      Width = 43
      Height = 17
      Caption = 'M-M'
      TabOrder = 3
      OnClick = rb1_1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 473
    Height = 395
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 0
      Top = 271
      Width = 473
      Height = 10
      Cursor = crVSplit
      Align = alBottom
    end
    object PanelLeft: TPanel
      Left = 0
      Top = 0
      Width = 473
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        473
        50)
      object btRefreshLeft: TRxSpeedButton
        Left = 444
        Top = 18
        Width = 25
        Height = 25
        Action = acRefreshLeft
        Anchors = [akRight]
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDD4444DDDDDDDDDD44444444DDDDDDD444DDDD44
          4DDDDDD44DDDDDD44DDDDD44DDDDDDDD44DDDD44DDDDDDDD44DDDD44DDDDDDDD
          44DDDD44DDDDDDDD44DDDDD44DDDD4D44DDDDDD44DDDD4444DDDDDDDDDDDD444
          DDDDDDDDDDDDD4444DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      end
      object lbLeft: TLabel
        Left = 128
        Top = 4
        Width = 33
        Height = 13
        Caption = 'lbLeft'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBNavLeft: TDBNavigator
        Left = 5
        Top = 18
        Width = 100
        Height = 25
        DataSource = ds_kls_left
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object ed_Filter_Left: TEdit
        Left = 109
        Top = 20
        Width = 329
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        TabOrder = 1
        OnKeyDown = ed_Filter_LeftKeyDown
      end
      object cb_NoLinkLeft: TCheckBox
        Left = 2
        Top = 0
        Width = 107
        Height = 17
        Caption = #1053#1077' '#1087#1088#1080#1074#1103#1079#1072#1085#1085#1099#1077
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
    object gridLeftList: TDBGridEh
      Left = 0
      Top = 50
      Width = 473
      Height = 221
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataGrouping.GroupLevels = <>
      DataSource = ds_kls_left
      EvenRowColor = clInfoBk
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      IndicatorOptions = [gioShowRowIndicatorEh]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
      RowDetailPanel.Color = clBtnFace
      SumList.Active = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleImages = f_main.img_Common
      UseMultiTitle = True
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object gridLeftLinks: TDBGridEh
      Left = 0
      Top = 281
      Width = 473
      Height = 114
      Align = alBottom
      AllowedOperations = [alopUpdateEh]
      DataGrouping.GroupLevels = <>
      DataSource = ds_Link_Left
      EvenRowColor = clInfoBk
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      IndicatorOptions = [gioShowRowIndicatorEh]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
      RowDetailPanel.Color = clBtnFace
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleImages = f_main.img_Common
      UseMultiTitle = True
      Columns = <
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'IS_AUTO_LINK'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          NotInKeyListIndex = 0
          Title.Caption = 'A'
          Width = 14
        end
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Title.Caption = #1050#1086#1076
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Alignment = taLeftJustify
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object Panel2: TPanel
    Left = 483
    Top = 26
    Width = 212
    Height = 395
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter4: TSplitter
      Left = 0
      Top = 271
      Width = 212
      Height = 10
      Cursor = crVSplit
      Align = alBottom
    end
    object PanelRight: TPanel
      Left = 0
      Top = 0
      Width = 212
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        212
        50)
      object btRefreshRight: TRxSpeedButton
        Left = 188
        Top = 18
        Width = 25
        Height = 25
        Action = acRefreshRight
        Anchors = [akRight]
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDD4444DDDDDDDDDD44444444DDDDDDD444DDDD44
          4DDDDDD44DDDDDD44DDDDD44DDDDDDDD44DDDD44DDDDDDDD44DDDD44DDDDDDDD
          44DDDD44DDDDDDDD44DDDDD44DDDD4D44DDDDDD44DDDD4444DDDDDDDDDDDD444
          DDDDDDDDDDDDD4444DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      end
      object lbRight: TLabel
        Left = 120
        Top = 4
        Width = 41
        Height = 13
        Caption = 'lbRight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBNavRight: TDBNavigator
        Left = 4
        Top = 18
        Width = 100
        Height = 25
        DataSource = ds_kls_right
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object ed_Filter_Right: TEdit
        Left = 109
        Top = 20
        Width = 74
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        TabOrder = 1
        OnKeyDown = ed_Filter_RightKeyDown
      end
      object cb_NoLinkRight: TCheckBox
        Left = 2
        Top = 0
        Width = 107
        Height = 17
        Caption = #1053#1077' '#1087#1088#1080#1074#1103#1079#1072#1085#1085#1099#1077
        TabOrder = 2
      end
    end
    object gridRightLinks: TDBGridEh
      Left = 0
      Top = 281
      Width = 212
      Height = 114
      Align = alBottom
      AllowedOperations = [alopUpdateEh]
      DataGrouping.GroupLevels = <>
      DataSource = ds_Link_Right
      EvenRowColor = clInfoBk
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      IndicatorOptions = [gioShowRowIndicatorEh]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
      RowDetailPanel.Color = clBtnFace
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleImages = f_main.img_Common
      UseMultiTitle = True
      Columns = <
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'IS_AUTO_LINK'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          NotInKeyListIndex = 0
          Title.Caption = 'A'
          Width = 15
        end
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Title.Caption = #1050#1086#1076
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Alignment = taLeftJustify
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object gridRightList: TDBGridEh
      Left = 0
      Top = 50
      Width = 212
      Height = 221
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataGrouping.GroupLevels = <>
      DataSource = ds_kls_right
      EvenRowColor = clInfoBk
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      IndicatorOptions = [gioShowRowIndicatorEh]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
      RowDetailPanel.Color = clBtnFace
      SumList.Active = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleImages = f_main.img_Common
      UseMultiTitle = True
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object t_kls_stru_left: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM MASTER_KLS_STRUCTURE '
      'WHERE id='#39'KLS_STAN'#39)
    QBEDefinition.QBEFieldDefs = {
      040000001A000000020000004944010000000000050000005155455259010000
      0000000700000043415054494F4E0100000000000C000000554E495155455F46
      49454C4401000000000010000000464F585F5550444154455F51554552590100
      0000000010000000464F585F494E534552545F51554552590100000000001000
      0000464F585F44454C4554455F515545525901000000000013000000554E4951
      49445F53454C4543545F515545525901000000000013000000554E495149445F
      5550444154455F51554552590100000000000B00000053544152545F4F524445
      520100000000000A0000004E414D455F4649454C440100000000000A00000054
      41424C455F4E414D450100000000000C0000004E414D455F4649454C445F3201
      000000000006000000534F525442590100000000000A00000049535F56495349
      424C45010000000000080000004144445F464F524D0100000000000900000053
      455155454E4345530100000000000800000046494C5445525F31010000000000
      0800000046494C5445525F320100000000000800000046494C5445525F330100
      000000001000000046494C5445525F315F43415054494F4E0100000000001000
      000046494C5445525F325F43415054494F4E0100000000001000000046494C54
      45525F335F43415054494F4E010000000000090000005249474854535F494401
      000000000010000000444154455F4649454C445F424547494E0100000000000E
      000000444154455F4649454C445F454E44010000000000}
    Session = f_main.ora_Session
    Left = 160
    Top = 136
    object t_kls_stru_leftID: TStringField
      FieldName = 'ID'
      Required = True
      Size = 50
    end
    object t_kls_stru_leftTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 50
    end
    object t_kls_stru_leftQUERY: TStringField
      FieldName = 'QUERY'
      Required = True
      Size = 1024
    end
    object t_kls_stru_leftCAPTION: TStringField
      FieldName = 'CAPTION'
      Required = True
      Size = 100
    end
    object t_kls_stru_leftUNIQUE_FIELD: TStringField
      FieldName = 'UNIQUE_FIELD'
      Required = True
      Size = 30
    end
    object t_kls_stru_leftFOX_UPDATE_QUERY: TStringField
      FieldName = 'FOX_UPDATE_QUERY'
      Size = 256
    end
    object t_kls_stru_leftFOX_INSERT_QUERY: TStringField
      FieldName = 'FOX_INSERT_QUERY'
      Size = 256
    end
    object t_kls_stru_leftFOX_DELETE_QUERY: TStringField
      FieldName = 'FOX_DELETE_QUERY'
      Size = 64
    end
    object t_kls_stru_leftUNIQID_SELECT_QUERY: TStringField
      FieldName = 'UNIQID_SELECT_QUERY'
      Size = 256
    end
    object t_kls_stru_leftUNIQID_UPDATE_QUERY: TStringField
      FieldName = 'UNIQID_UPDATE_QUERY'
      Size = 256
    end
    object t_kls_stru_leftSTART_ORDER: TStringField
      FieldName = 'START_ORDER'
      Size = 50
    end
    object t_kls_stru_leftNAME_FIELD: TStringField
      FieldName = 'NAME_FIELD'
      Size = 30
    end
    object t_kls_stru_leftNAME_FIELD_2: TStringField
      FieldName = 'NAME_FIELD_2'
      Size = 15
    end
    object t_kls_stru_leftSORTBY: TIntegerField
      FieldName = 'SORTBY'
    end
    object t_kls_stru_leftADD_FORM: TStringField
      FieldName = 'ADD_FORM'
      Size = 15
    end
    object t_kls_stru_leftSEQUENCES: TStringField
      FieldName = 'SEQUENCES'
      Size = 30
    end
    object t_kls_stru_leftFILTER_1: TStringField
      FieldName = 'FILTER_1'
      Size = 15
    end
    object t_kls_stru_leftFILTER_2: TStringField
      FieldName = 'FILTER_2'
      Size = 15
    end
    object t_kls_stru_leftFILTER_3: TStringField
      FieldName = 'FILTER_3'
      Size = 15
    end
    object t_kls_stru_leftFILTER_1_CAPTION: TStringField
      FieldName = 'FILTER_1_CAPTION'
      Size = 50
    end
    object t_kls_stru_leftFILTER_2_CAPTION: TStringField
      FieldName = 'FILTER_2_CAPTION'
      Size = 50
    end
    object t_kls_stru_leftFILTER_3_CAPTION: TStringField
      FieldName = 'FILTER_3_CAPTION'
      Size = 50
    end
    object t_kls_stru_leftRIGHTS_ID: TStringField
      FieldName = 'RIGHTS_ID'
      Size = 30
    end
    object t_kls_stru_leftDATE_FIELD_BEGIN: TStringField
      FieldName = 'DATE_FIELD_BEGIN'
      Size = 15
    end
    object t_kls_stru_leftDATE_FIELD_END: TStringField
      FieldName = 'DATE_FIELD_END'
      Size = 15
    end
  end
  object t_field_stru_left: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM MASTER_KLS_FIELD_STRUCTURE '
      'WHERE structure_id='#39'KLS_STAN'#39
      'ORDER BY field_id')
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000C0000005354525543545552455F49440100000000000800
      00004649454C445F49440100000000000A0000004649454C445F4E414D450100
      000000000D0000004649454C445F43415054494F4E010000000000130000004C
      4F4F4B55505F534F555243455F5155455259010000000000140000004C4F4F4B
      55505F444953504C41595F4649454C44010000000000100000004C4F4F4B5550
      5F4B45595F4649454C440100000000000C0000004C4F4F4B55505F5441424C45
      0100000000000E0000004649454C445F524541444F4E4C590100000000000400
      00004D41534B0100000000000D000000444953504C41595F5749445448010000
      0000000A0000004649454C445F4B494E44010000000000}
    Session = f_main.ora_Session
    Left = 216
    Top = 204
    object t_field_stru_leftSTRUCTURE_ID: TStringField
      FieldName = 'STRUCTURE_ID'
      Required = True
      Size = 50
    end
    object t_field_stru_leftFIELD_ID: TIntegerField
      FieldName = 'FIELD_ID'
      Required = True
    end
    object t_field_stru_leftFIELD_NAME: TStringField
      FieldName = 'FIELD_NAME'
      Required = True
      Size = 50
    end
    object t_field_stru_leftFIELD_CAPTION: TStringField
      FieldName = 'FIELD_CAPTION'
      Required = True
      Size = 50
    end
    object t_field_stru_leftLOOKUP_SOURCE_QUERY: TStringField
      FieldName = 'LOOKUP_SOURCE_QUERY'
      Size = 512
    end
    object t_field_stru_leftLOOKUP_DISPLAY_FIELD: TStringField
      FieldName = 'LOOKUP_DISPLAY_FIELD'
      Size = 50
    end
    object t_field_stru_leftLOOKUP_KEY_FIELD: TStringField
      FieldName = 'LOOKUP_KEY_FIELD'
      Size = 50
    end
    object t_field_stru_leftLOOKUP_TABLE: TStringField
      FieldName = 'LOOKUP_TABLE'
      Size = 30
    end
    object t_field_stru_leftFIELD_READONLY: TIntegerField
      FieldName = 'FIELD_READONLY'
    end
    object t_field_stru_leftMASK: TStringField
      FieldName = 'MASK'
      Size = 10
    end
    object t_field_stru_leftDISPLAY_WIDTH: TIntegerField
      FieldName = 'DISPLAY_WIDTH'
    end
    object t_field_stru_leftFIELD_KIND: TIntegerField
      FieldName = 'FIELD_KIND'
      Required = True
    end
  end
  object t_kls_left: TOracleDataSet
    SQL.Strings = (
      'select rowid,kls_stan.* from kls_stan')
    QBEDefinition.QBEFieldDefs = {
      0400000009000000020000004944010000000000080000005354414E5F4B4F44
      010000000000090000005354414E5F4E414D4501000000000009000000415245
      4E5F444159530100000000000400000052415354010000000000090000005245
      47494F4E5F49440100000000000700000047444F525F49440100000000000900
      00004F5444454C454E4945010000000000090000005354415445535F49440100
      00000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    Session = f_main.ora_Session
    AfterScroll = t_kls_leftAfterScroll
    OnFilterRecord = t_kls_leftFilterRecord
    Left = 128
    Top = 288
  end
  object ds_kls_left: TDataSource
    DataSet = t_kls_left
    Left = 188
    Top = 288
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 400
    Top = 304
    StyleName = 'XP Style'
    object acKLSNewLink: TAction
      Caption = #1057#1086#1077#1076#1080#1085#1080#1090#1100' F5'
      ImageIndex = 0
      ShortCut = 116
      OnExecute = acKLSNewLinkExecute
    end
    object acKLSDelLink: TAction
      Caption = #1056#1072#1079#1098#1077#1076#1080#1085#1080#1090#1100' F6'
      ImageIndex = 5
      ShortCut = 117
      OnExecute = acKLSDelLinkExecute
    end
    object acRefreshLeft: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      ShortCut = 119
      OnExecute = acRefreshLeftExecute
    end
    object acRefreshRight: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      ShortCut = 8311
      OnExecute = acRefreshRightExecute
    end
  end
  object pm_GridColumnLeft: TTBPopupMenu
    OnPopup = pm_GridColumnLeftPopup
    Left = 112
    Top = 216
    object TBItem6: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
      Enabled = False
      Options = [tboDefault]
    end
    object e_FieldFilterLeft: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      DisplayMode = nbdmImageAndText
      OnAcceptText = e_FieldFilterLeftAcceptText
    end
    object TBItem5: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem5Click
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Caption = #1042' '#1086#1082#1085#1077
      OnClick = TBItem9Click
    end
    object TBItem3: TTBItem
      Caption = #1058#1077#1082#1089#1090' '#1079#1072#1087#1088#1086#1089#1072
      OnClick = TBItem3Click
    end
  end
  object pm_GridColumnRight: TTBPopupMenu
    OnPopup = pm_GridColumnRightPopup
    Left = 504
    Top = 200
    object TBItem1: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
      Enabled = False
      Options = [tboDefault]
    end
    object e_FieldFilterRight: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      DisplayMode = nbdmImageAndText
      OnAcceptText = e_FieldFilterRightAcceptText
    end
    object TBItem2: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem2Click
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem10: TTBItem
      Caption = #1042' '#1086#1082#1085#1077
      OnClick = TBItem10Click
    end
    object TBItem8: TTBItem
      Caption = #1058#1077#1082#1089#1090' '#1079#1072#1087#1088#1086#1089#1072
      OnClick = TBItem8Click
    end
  end
  object t_kls_right: TOracleDataSet
    SQL.Strings = (
      'select rowid,kls_stan.* from kls_stan')
    QBEDefinition.QBEFieldDefs = {
      0400000008000000020000004944010000000000080000005354414E5F4B4F44
      010000000000090000005354414E5F4E414D4501000000000009000000415245
      4E5F444159530100000000000400000052415354010000000000090000005245
      47494F4E5F49440100000000000700000047444F525F49440100000000000900
      00004F5444454C454E4945010000000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    Session = f_main.ora_Session
    AfterScroll = t_kls_rightAfterScroll
    OnFilterRecord = t_kls_rightFilterRecord
    Left = 504
    Top = 280
  end
  object ds_kls_right: TDataSource
    DataSet = t_kls_right
    Left = 580
    Top = 296
  end
  object t_field_stru_right: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM MASTER_KLS_FIELD_STRUCTURE '
      'WHERE structure_id='#39'KLS_STAN'#39
      'ORDER BY field_id')
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000C0000005354525543545552455F49440100000000000800
      00004649454C445F49440100000000000A0000004649454C445F4E414D450100
      000000000D0000004649454C445F43415054494F4E010000000000130000004C
      4F4F4B55505F534F555243455F5155455259010000000000140000004C4F4F4B
      55505F444953504C41595F4649454C44010000000000100000004C4F4F4B5550
      5F4B45595F4649454C440100000000000C0000004C4F4F4B55505F5441424C45
      0100000000000E0000004649454C445F524541444F4E4C590100000000000400
      00004D41534B0100000000000D000000444953504C41595F5749445448010000
      0000000A0000004649454C445F4B494E44010000000000}
    Session = f_main.ora_Session
    Left = 592
    Top = 196
    object t_field_stru_rightSTRUCTURE_ID: TStringField
      FieldName = 'STRUCTURE_ID'
      Required = True
      Size = 50
    end
    object t_field_stru_rightFIELD_ID: TIntegerField
      FieldName = 'FIELD_ID'
      Required = True
    end
    object t_field_stru_rightFIELD_NAME: TStringField
      FieldName = 'FIELD_NAME'
      Required = True
      Size = 50
    end
    object t_field_stru_rightFIELD_CAPTION: TStringField
      FieldName = 'FIELD_CAPTION'
      Required = True
      Size = 50
    end
    object t_field_stru_rightLOOKUP_SOURCE_QUERY: TStringField
      FieldName = 'LOOKUP_SOURCE_QUERY'
      Size = 512
    end
    object t_field_stru_rightLOOKUP_DISPLAY_FIELD: TStringField
      FieldName = 'LOOKUP_DISPLAY_FIELD'
      Size = 50
    end
    object t_field_stru_rightLOOKUP_KEY_FIELD: TStringField
      FieldName = 'LOOKUP_KEY_FIELD'
      Size = 50
    end
    object t_field_stru_rightLOOKUP_TABLE: TStringField
      FieldName = 'LOOKUP_TABLE'
      Size = 30
    end
    object t_field_stru_rightFIELD_READONLY: TIntegerField
      FieldName = 'FIELD_READONLY'
    end
    object t_field_stru_rightMASK: TStringField
      FieldName = 'MASK'
      Size = 10
    end
    object t_field_stru_rightDISPLAY_WIDTH: TIntegerField
      FieldName = 'DISPLAY_WIDTH'
    end
    object t_field_stru_rightFIELD_KIND: TIntegerField
      FieldName = 'FIELD_KIND'
      Required = True
    end
  end
  object t_kls_stru_right: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM MASTER_KLS_STRUCTURE '
      'WHERE id='#39'KLS_STAN'#39)
    QBEDefinition.QBEFieldDefs = {
      040000001A000000020000004944010000000000050000005155455259010000
      0000000700000043415054494F4E0100000000000C000000554E495155455F46
      49454C4401000000000010000000464F585F5550444154455F51554552590100
      0000000010000000464F585F494E534552545F51554552590100000000001000
      0000464F585F44454C4554455F515545525901000000000013000000554E4951
      49445F53454C4543545F515545525901000000000013000000554E495149445F
      5550444154455F51554552590100000000000B00000053544152545F4F524445
      520100000000000A0000004E414D455F4649454C440100000000000A00000054
      41424C455F4E414D450100000000000C0000004E414D455F4649454C445F3201
      000000000006000000534F525442590100000000000A00000049535F56495349
      424C45010000000000080000004144445F464F524D0100000000000900000053
      455155454E4345530100000000000800000046494C5445525F31010000000000
      0800000046494C5445525F320100000000000800000046494C5445525F330100
      000000001000000046494C5445525F315F43415054494F4E0100000000001000
      000046494C5445525F325F43415054494F4E0100000000001000000046494C54
      45525F335F43415054494F4E010000000000090000005249474854535F494401
      000000000010000000444154455F4649454C445F424547494E0100000000000E
      000000444154455F4649454C445F454E44010000000000}
    Session = f_main.ora_Session
    Left = 536
    Top = 128
    object t_kls_stru_rightID: TStringField
      FieldName = 'ID'
      Required = True
      Size = 50
    end
    object t_kls_stru_rightTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 50
    end
    object t_kls_stru_rightCAPTION: TStringField
      FieldName = 'CAPTION'
      Required = True
      Size = 100
    end
    object t_kls_stru_rightSORTBY: TIntegerField
      FieldName = 'SORTBY'
    end
    object t_kls_stru_rightQUERY: TStringField
      FieldName = 'QUERY'
      Required = True
      Size = 1024
    end
    object t_kls_stru_rightUNIQUE_FIELD: TStringField
      FieldName = 'UNIQUE_FIELD'
      Required = True
      Size = 30
    end
    object t_kls_stru_rightFOX_UPDATE_QUERY: TStringField
      FieldName = 'FOX_UPDATE_QUERY'
      Size = 256
    end
    object t_kls_stru_rightFOX_INSERT_QUERY: TStringField
      FieldName = 'FOX_INSERT_QUERY'
      Size = 256
    end
    object t_kls_stru_rightFOX_DELETE_QUERY: TStringField
      FieldName = 'FOX_DELETE_QUERY'
      Size = 64
    end
    object t_kls_stru_rightUNIQID_SELECT_QUERY: TStringField
      FieldName = 'UNIQID_SELECT_QUERY'
      Size = 256
    end
    object t_kls_stru_rightUNIQID_UPDATE_QUERY: TStringField
      FieldName = 'UNIQID_UPDATE_QUERY'
      Size = 256
    end
    object t_kls_stru_rightSTART_ORDER: TStringField
      FieldName = 'START_ORDER'
      Size = 50
    end
    object t_kls_stru_rightNAME_FIELD: TStringField
      FieldName = 'NAME_FIELD'
      Size = 15
    end
    object t_kls_stru_rightNAME_FIELD_2: TStringField
      FieldName = 'NAME_FIELD_2'
      Size = 15
    end
    object t_kls_stru_rightADD_FORM: TStringField
      FieldName = 'ADD_FORM'
      Size = 15
    end
    object t_kls_stru_rightSEQUENCES: TStringField
      FieldName = 'SEQUENCES'
      Size = 30
    end
    object t_kls_stru_rightFILTER_1: TStringField
      FieldName = 'FILTER_1'
      Size = 15
    end
    object t_kls_stru_rightFILTER_1_CAPTION: TStringField
      FieldName = 'FILTER_1_CAPTION'
      Size = 50
    end
    object t_kls_stru_rightFILTER_2: TStringField
      FieldName = 'FILTER_2'
      Size = 15
    end
    object t_kls_stru_rightFILTER_2_CAPTION: TStringField
      FieldName = 'FILTER_2_CAPTION'
      Size = 50
    end
    object t_kls_stru_rightFILTER_3: TStringField
      FieldName = 'FILTER_3'
      Size = 15
    end
    object t_kls_stru_rightFILTER_3_CAPTION: TStringField
      FieldName = 'FILTER_3_CAPTION'
      Size = 50
    end
    object t_kls_stru_rightRIGHTS_ID: TStringField
      FieldName = 'RIGHTS_ID'
      Size = 30
    end
    object t_kls_stru_rightDATE_FIELD_BEGIN: TStringField
      FieldName = 'DATE_FIELD_BEGIN'
      Size = 15
    end
    object t_kls_stru_rightDATE_FIELD_END: TStringField
      FieldName = 'DATE_FIELD_END'
      Size = 15
    end
  end
  object t_links: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM MASTER_LINKS_STRUCTURE'
      'WHERE ID='#39'CUSTOMERS-PREDPR'#39)
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000200000049440100000000000700000043415054494F4E01
      00000000000A0000005441424C455F4C494E4B0100000000000D000000544142
      4C455F4C494E4B5F504B0100000000000F0000005441424C455F4C494E4B5F54
      595045010000000000110000005441424C455F4C494E4B5F4F4E455F504B0100
      00000000090000005441424C455F4F4E45010000000000120000005441424C45
      5F4F4E455F504F534954494F4E010000000000110000005441424C455F4C494E
      4B5F54574F5F504B010000000000090000005441424C455F54574F0100000000
      00120000005441424C455F4C494E4B5F504B5F54595045010000000000060000
      00534F525442590100000000000A00000051554552595F4C494E4B0100000000
      00}
    Session = f_main.ora_Session
    Left = 304
    Top = 106
    object t_linksID: TStringField
      FieldName = 'ID'
      Required = True
      Size = 50
    end
    object t_linksCAPTION: TStringField
      FieldName = 'CAPTION'
      Required = True
      Size = 100
    end
    object t_linksTABLE_LINK: TStringField
      FieldName = 'TABLE_LINK'
      Required = True
      Size = 50
    end
    object t_linksTABLE_LINK_PK: TStringField
      FieldName = 'TABLE_LINK_PK'
      Required = True
      Size = 50
    end
    object t_linksTABLE_LINK_TYPE: TStringField
      FieldName = 'TABLE_LINK_TYPE'
      Required = True
      Size = 3
    end
    object t_linksTABLE_LINK_ONE_PK: TStringField
      FieldName = 'TABLE_LINK_ONE_PK'
      Required = True
      Size = 50
    end
    object t_linksTABLE_ONE: TStringField
      FieldName = 'TABLE_ONE'
      Required = True
      Size = 50
    end
    object t_linksTABLE_LINK_TWO_PK: TStringField
      FieldName = 'TABLE_LINK_TWO_PK'
      Required = True
      Size = 50
    end
    object t_linksTABLE_TWO: TStringField
      FieldName = 'TABLE_TWO'
      Required = True
      Size = 50
    end
    object t_linksTABLE_LINK_PK_TYPE: TStringField
      FieldName = 'TABLE_LINK_PK_TYPE'
      Size = 1
    end
    object t_linksSORTBY: TFloatField
      FieldName = 'SORTBY'
    end
    object t_linksQUERY_LINK: TStringField
      FieldName = 'QUERY_LINK'
      Size = 300
    end
  end
  object t_Link_Left: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT IS_AUTO_LINK,ID,NAME'
      'FROM r3_customers'
      'WHERE 1=1'
      'AND 1=1')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      00000C00000049535F4155544F5F4C494E4B010000000000}
    Session = f_main.ora_Session
    AfterScroll = t_Link_LeftAfterScroll
    Left = 232
    Top = 370
  end
  object ds_Link_Left: TDataSource
    DataSet = t_Link_Left
    Left = 152
    Top = 370
  end
  object t_Link_Right: TOracleDataSet
    SQL.Strings = (
      'SELECT distinct  IS_AUTO_LINK,ID,NAME'
      'FROM r3_customers'
      'WHERE 1=1'
      'AND 1=1'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      00000C00000049535F4155544F5F4C494E4B010000000000}
    Session = f_main.ora_Session
    Left = 560
    Top = 370
  end
  object ds_Link_Right: TDataSource
    DataSet = t_Link_Right
    Left = 480
    Top = 370
  end
  object q_tmp: TOracleDataSet
    Session = f_main.ora_Session
    Left = 328
    Top = 194
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState')
    Left = 368
    Top = 248
  end
end
