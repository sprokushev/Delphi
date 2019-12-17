object f_KlsMisc: Tf_KlsMisc
  Left = 559
  Top = 498
  Width = 721
  Height = 466
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grKlsMisc: TDBGridEh
    Left = 0
    Top = 123
    Width = 705
    Height = 305
    Align = alClient
    AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
    ColumnDefValues.Title.TitleButton = True
    DataGrouping.GroupLevels = <>
    DataSource = ds_kls
    EvenRowColor = clInfoBk
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    PopupMenu = pm_GridColumn
    RowDetailPanel.Color = clBtnFace
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleImages = f_main.img_Common
    UseMultiTitle = True
    OnDblClick = grKlsMiscDblClick
    OnKeyDown = grKlsMiscKeyDown
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 705
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DockPos = 0
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem4: TTBItem
        Action = acKLSNewRecord
        DisplayMode = nbdmImageAndText
      end
      object TBItem11: TTBItem
        Action = acKLSCopyRecord
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = acKLSEditRecord
        DisplayMode = nbdmImageAndText
      end
      object TBItem7: TTBItem
        Action = acKLSDelRecord
        DisplayMode = nbdmImageAndText
      end
      object TBItem8: TTBItem
        Action = acKLSChild
        DisplayMode = nbdmImageAndText
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem2: TTBItem
        Action = acKLSOK
        DisplayMode = nbdmImageAndText
      end
      object TBItem1: TTBItem
        Action = acKLSCancel
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object panelFilter_1: TPanel
    Left = 0
    Top = 54
    Width = 705
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object lb_Filter_1: TLabel
      Left = 9
      Top = 4
      Width = 160
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103':'
    end
    object ed_Filter_1: TEdit
      Left = 173
      Top = 1
      Width = 348
      Height = 21
      TabOrder = 0
      OnKeyDown = ed_Filter_1KeyDown
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 705
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object btRefresh: TRxSpeedButton
      Left = 111
      Top = 2
      Width = 25
      Height = 25
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDD4444DDDDDDDDDD44444444DDDDDDD444DDDD44
        4DDDDDD44DDDDDD44DDDDD44DDDDDDDD44DDDD44DDDDDDDD44DDDD44DDDDDDDD
        44DDDD44DDDDDDDD44DDDDD44DDDD4D44DDDDDD44DDDD4444DDDDDDDDDDDD444
        DDDDDDDDDDDDD4444DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      OnClick = btRefreshClick
    end
    object DBNavigator1: TDBNavigator
      Left = 5
      Top = 2
      Width = 100
      Height = 25
      DataSource = ds_kls
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
  end
  object PanelFilter_2: TPanel
    Left = 0
    Top = 77
    Width = 705
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    object lb_Filter_2: TLabel
      Left = 6
      Top = 4
      Width = 162
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1043#1086#1088#1086#1076':'
    end
    object ed_Filter_2: TEdit
      Left = 173
      Top = 1
      Width = 348
      Height = 21
      TabOrder = 0
      OnKeyDown = ed_Filter_2KeyDown
    end
  end
  object PanelFilter_3: TPanel
    Left = 0
    Top = 100
    Width = 705
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
    object lb_Filter_3: TLabel
      Left = 8
      Top = 5
      Width = 160
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1057#1090#1072#1085#1094#1080#1103':'
    end
    object ed_Filter_3: TEdit
      Left = 173
      Top = 1
      Width = 348
      Height = 21
      TabOrder = 0
      OnKeyDown = ed_Filter_3KeyDown
    end
  end
  object t_kls_structure: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM MASTER_KLS_STRUCTURE WHERE id='#39'KLS_STAN'#39)
    QBEDefinition.QBEFieldDefs = {
      040000001E000000020000004944010000000000050000005155455259010000
      0000000700000043415054494F4E0100000000000C000000554E495155455F46
      49454C4401000000000010000000464F585F5550444154455F51554552590100
      0000000010000000464F585F494E534552545F51554552590100000000001000
      0000464F585F44454C4554455F515545525901000000000013000000554E4951
      49445F53454C4543545F515545525901000000000013000000554E495149445F
      5550444154455F51554552590100000000000B00000053544152545F4F524445
      520100000000000A0000004E414D455F4649454C440100000000000A00000054
      41424C455F4E414D450100000000000C0000004E414D455F4649454C445F3201
      000000000006000000534F52544259010000000000080000004144445F464F52
      4D0100000000000900000053455155454E434553010000000000080000004649
      4C5445525F310100000000000800000046494C5445525F320100000000000800
      000046494C5445525F330100000000001000000046494C5445525F315F434150
      54494F4E0100000000001000000046494C5445525F325F43415054494F4E0100
      000000001000000046494C5445525F335F43415054494F4E0100000000000900
      00005249474854535F494401000000000010000000444154455F4649454C445F
      424547494E0100000000000E000000444154455F4649454C445F454E44010000
      00000009000000564945575F54494D450100000000000A0000004348494C445F
      464F524D0100000000000A0000004348494C445F4E414D450100000000000B00
      000046524F5A454E5F434F4C530100000000000C0000004D41535445525F4649
      454C44010000000000}
    Session = f_main.ora_Session
    Left = 368
    Top = 200
    object t_kls_structureID: TStringField
      FieldName = 'ID'
      Required = True
      Size = 50
    end
    object t_kls_structureTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 50
    end
    object t_kls_structureQUERY: TStringField
      FieldName = 'QUERY'
      Required = True
      Size = 1024
    end
    object t_kls_structureCAPTION: TStringField
      FieldName = 'CAPTION'
      Required = True
      Size = 100
    end
    object t_kls_structureUNIQUE_FIELD: TStringField
      FieldName = 'UNIQUE_FIELD'
      Required = True
      Size = 30
    end
    object t_kls_structureFOX_UPDATE_QUERY: TStringField
      FieldName = 'FOX_UPDATE_QUERY'
      Size = 256
    end
    object t_kls_structureFOX_INSERT_QUERY: TStringField
      FieldName = 'FOX_INSERT_QUERY'
      Size = 256
    end
    object t_kls_structureFOX_DELETE_QUERY: TStringField
      FieldName = 'FOX_DELETE_QUERY'
      Size = 64
    end
    object t_kls_structureUNIQID_SELECT_QUERY: TStringField
      FieldName = 'UNIQID_SELECT_QUERY'
      Size = 256
    end
    object t_kls_structureUNIQID_UPDATE_QUERY: TStringField
      FieldName = 'UNIQID_UPDATE_QUERY'
      Size = 256
    end
    object t_kls_structureSTART_ORDER: TStringField
      FieldName = 'START_ORDER'
      Size = 50
    end
    object t_kls_structureNAME_FIELD: TStringField
      FieldName = 'NAME_FIELD'
      Size = 30
    end
    object t_kls_structureNAME_FIELD_2: TStringField
      FieldName = 'NAME_FIELD_2'
      Size = 30
    end
    object t_kls_structureSORTBY: TIntegerField
      FieldName = 'SORTBY'
    end
    object t_kls_structureADD_FORM: TStringField
      FieldName = 'ADD_FORM'
      Size = 15
    end
    object t_kls_structureSEQUENCES: TStringField
      FieldName = 'SEQUENCES'
      Size = 30
    end
    object t_kls_structureFILTER_1: TStringField
      FieldName = 'FILTER_1'
      Size = 30
    end
    object t_kls_structureFILTER_2: TStringField
      FieldName = 'FILTER_2'
      Size = 30
    end
    object t_kls_structureFILTER_3: TStringField
      FieldName = 'FILTER_3'
      Size = 30
    end
    object t_kls_structureFILTER_1_CAPTION: TStringField
      FieldName = 'FILTER_1_CAPTION'
      Size = 50
    end
    object t_kls_structureFILTER_2_CAPTION: TStringField
      FieldName = 'FILTER_2_CAPTION'
      Size = 50
    end
    object t_kls_structureFILTER_3_CAPTION: TStringField
      FieldName = 'FILTER_3_CAPTION'
      Size = 50
    end
    object t_kls_structureRIGHTS_ID: TStringField
      FieldName = 'RIGHTS_ID'
      Size = 30
    end
    object t_kls_structureDATE_FIELD_BEGIN: TStringField
      FieldName = 'DATE_FIELD_BEGIN'
      Size = 15
    end
    object t_kls_structureDATE_FIELD_END: TStringField
      FieldName = 'DATE_FIELD_END'
      Size = 15
    end
    object t_kls_structureVIEW_TIME: TIntegerField
      FieldName = 'VIEW_TIME'
      Required = True
    end
    object t_kls_structureCHILD_FORM: TStringField
      FieldName = 'CHILD_FORM'
      Size = 30
    end
    object t_kls_structureCHILD_NAME: TStringField
      FieldName = 'CHILD_NAME'
      Size = 30
    end
    object t_kls_structureFROZEN_COLS: TIntegerField
      FieldName = 'FROZEN_COLS'
    end
    object t_kls_structureMASTER_FIELD: TStringField
      FieldName = 'MASTER_FIELD'
      Size = 30
    end
  end
  object t_field_structure: TOracleDataSet
    SQL.Strings = (
      
        'SELECT * FROM MASTER_KLS_FIELD_STRUCTURE WHERE structure_id='#39'KLS' +
        '_STAN'#39)
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
    Left = 368
    Top = 228
    object t_field_structureSTRUCTURE_ID: TStringField
      FieldName = 'STRUCTURE_ID'
      Required = True
      Size = 50
    end
    object t_field_structureFIELD_ID: TIntegerField
      FieldName = 'FIELD_ID'
      Required = True
    end
    object t_field_structureFIELD_NAME: TStringField
      FieldName = 'FIELD_NAME'
      Required = True
      Size = 50
    end
    object t_field_structureFIELD_CAPTION: TStringField
      FieldName = 'FIELD_CAPTION'
      Required = True
      Size = 50
    end
    object t_field_structureLOOKUP_SOURCE_QUERY: TStringField
      FieldName = 'LOOKUP_SOURCE_QUERY'
      Size = 512
    end
    object t_field_structureLOOKUP_DISPLAY_FIELD: TStringField
      FieldName = 'LOOKUP_DISPLAY_FIELD'
      Size = 50
    end
    object t_field_structureLOOKUP_KEY_FIELD: TStringField
      FieldName = 'LOOKUP_KEY_FIELD'
      Size = 50
    end
    object t_field_structureLOOKUP_TABLE: TStringField
      FieldName = 'LOOKUP_TABLE'
      Size = 30
    end
    object t_field_structureFIELD_READONLY: TIntegerField
      FieldName = 'FIELD_READONLY'
    end
    object t_field_structureMASK: TStringField
      FieldName = 'MASK'
      Size = 10
    end
    object t_field_structureDISPLAY_WIDTH: TIntegerField
      FieldName = 'DISPLAY_WIDTH'
    end
    object t_field_structureFIELD_KIND: TIntegerField
      FieldName = 'FIELD_KIND'
      Required = True
    end
  end
  object t_kls: TOracleDataSet
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
    BeforeInsert = t_klsBeforeInsert
    AfterInsert = t_klsAfterInsert
    BeforePost = t_klsBeforePost
    BeforeDelete = t_klsBeforeDelete
    OnFilterRecord = t_klsFilterRecord
    Left = 368
    Top = 256
  end
  object ds_kls: TDataSource
    DataSet = t_kls
    Left = 396
    Top = 256
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=pf'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 368
    Top = 284
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 396
    Top = 284
  end
  object ADOTable1: TADOTable
    Left = 396
    Top = 312
  end
  object KLSActionManager: TActionManager
    Images = f_main.img_Common
    Left = 368
    Top = 312
    StyleName = 'XP Style'
    object acKLSNewRecord: TAction
      Caption = #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 0
      OnExecute = acKLSNewRecordExecute
    end
    object acKLSEditRecord: TAction
      Caption = #1055#1088#1072#1074#1082#1072' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 2
      OnExecute = acKLSEditRecordExecute
    end
    object acKLSDelRecord: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 5
      OnExecute = acKLSDelRecordExecute
    end
    object acKLSOK: TAction
      Category = 'FOR_ALL'
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 17
      OnExecute = acKLSOKExecute
    end
    object acKLSCancel: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 16
      OnExecute = acKLSCancelExecute
    end
    object acKLSChild: TAction
      Caption = #1044#1086#1095#1077#1088#1085#1077#1077' '#1086#1082#1085#1086
      ImageIndex = 4
      OnExecute = acKLSChildExecute
    end
    object acKlsMemoEdit: TAction
      Category = 'FOR_ALL'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      ImageIndex = 4
      OnExecute = acKlsMemoEditExecute
    end
    object acKlsExportXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' XLS'
      ImageIndex = 42
      OnExecute = acKlsExportXLSExecute
    end
    object acKLSCopyRecord: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 10
      OnExecute = acKLSCopyRecordExecute
    end
  end
  object pm_GridColumn: TTBPopupMenu
    OnPopup = pm_GridColumnPopup
    Left = 64
    Top = 280
    object TBItem17: TTBItem
      Action = acKLSOK
      DisplayMode = nbdmImageAndText
    end
    object TBItem18: TTBItem
      Action = acKLSCancel
      DisplayMode = nbdmImageAndText
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
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
    object TBItem5: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem5Click
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = acKlsMemoEdit
      DisplayMode = nbdmImageAndText
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem12: TTBItem
      Action = acKLSNewRecord
      DisplayMode = nbdmImageAndText
    end
    object TBItem13: TTBItem
      Action = acKLSCopyRecord
      DisplayMode = nbdmImageAndText
    end
    object TBItem14: TTBItem
      Action = acKLSEditRecord
      DisplayMode = nbdmImageAndText
    end
    object TBItem15: TTBItem
      Action = acKLSDelRecord
      DisplayMode = nbdmImageAndText
    end
    object TBItem16: TTBItem
      Action = acKLSChild
      DisplayMode = nbdmImageAndText
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItem10: TTBItem
      Action = acKlsExportXLS
      DisplayMode = nbdmImageAndText
    end
  end
  object q_Comments: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM SYS.USER_COL_COMMENTS '
      'WHERE TABLE_NAME='#39'KLS_STAN'#39)
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A0000005441424C455F4E414D450100000000000B000000
      434F4C554D4E5F4E414D4501000000000008000000434F4D4D454E5453010000
      000000}
    Session = f_main.ora_Session
    Left = 248
    Top = 236
    object q_CommentsTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Required = True
      Size = 30
    end
    object q_CommentsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Required = True
      Size = 30
    end
    object q_CommentsCOMMENTS: TStringField
      FieldName = 'COMMENTS'
      Size = 4000
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 496
    Top = 200
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 384
    Top = 144
  end
end
