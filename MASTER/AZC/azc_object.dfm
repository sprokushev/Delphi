inherited f_forAZC_object: Tf_forAZC_object
  Left = 421
  Top = 200
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
  ClientHeight = 560
  ClientWidth = 795
  OldCreateOrder = True
  Position = poDesigned
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 24
    Width = 796
    Height = 538
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    Images = f_main.img_Common
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1054#1073#1098#1077#1082#1090#1099
      ImageIndex = 22
      DesignSize = (
        788
        509)
      object DBGrid1: TDBGridEh
        Left = 0
        Top = 2
        Width = 404
        Height = 495
        AllowedOperations = []
        AllowedSelections = [gstColumns]
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoFitColWidths = True
        Color = clWhite
        DataSource = DS_azc_obj_all
        FixedColor = clActiveBorder
        Flat = True
        FooterColor = clWhite
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghAutoSortMarking, dghMultiSortMarking]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        VertScrollBar.VisibleMode = sbNeverShowEh
        OnCellClick = DBGrid1CellClick
        OnDblClick = DBGrid1DblClick
        OnGetCellParams = DBGrid1GetCellParams
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1082#1090
            Title.TitleButton = True
            Width = 128
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'NAME_1'
            Footers = <>
            Title.Caption = #1042#1080#1076
            Title.TitleButton = True
            Width = 87
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'NAME_2'
            Footers = <>
            Title.Caption = #1058#1080#1087
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'ADRESS'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089
            Title.TitleButton = True
            Width = 115
          end>
      end
      object EHazs_tree: TDBGridEh
        Left = 408
        Top = 0
        Width = 377
        Height = 497
        AllowedOperations = []
        Anchors = [akTop, akRight, akBottom]
        DataSource = DS_azc_obj
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME_ORG'
            Footers = <>
            ImageList = f_main.img_Common
            ShowImageAndText = True
            OnGetCellParams = EHazs_treeColumns0GetCellParams
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1099
      ImageIndex = 32
      DesignSize = (
        788
        509)
      object Panel1: TPanel
        Left = 1
        Top = 468
        Width = 381
        Height = 27
        Anchors = [akLeft, akRight]
        TabOrder = 1
        DesignSize = (
          381
          27)
        object Label2: TLabel
          Left = 7
          Top = 7
          Width = 43
          Height = 13
          Anchors = []
          Caption = #1057' '#1044#1040#1058#1067
        end
        object Label1: TLabel
          Left = 187
          Top = 8
          Width = 50
          Height = 13
          Anchors = []
          Caption = #1055#1054' '#1044#1040#1058#1059
        end
        object Time_2: TDateEdit
          Left = 250
          Top = 4
          Width = 121
          Height = 19
          Anchors = []
          NumGlyphs = 2
          TabOrder = 0
        end
        object Time_1: TDateEdit
          Left = 54
          Top = 4
          Width = 121
          Height = 19
          Anchors = []
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = -1
        Width = 380
        Height = 459
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clBtnHighlight
        DataSource = DS_rez
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghMultiSortMarking]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = DBGridEh2GetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DATEUPLOAD'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 53
          end
          item
            EditButtons = <>
            FieldName = 'NAME_NPR'
            Footers = <>
            Title.Caption = #1055#1088#1086#1076#1091#1082#1090
            Title.TitleButton = True
            Width = 96
          end
          item
            EditButtons = <>
            FieldName = 'VOL'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1084
            Title.TitleButton = True
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = 'DEAD_VOL'
            Footers = <>
            Title.Caption = #1052#1077#1088#1090#1074#1099#1081' '#1086#1089#1090#1072#1090#1086#1082
            Title.TitleButton = True
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'MAX_VOL'
            Footers = <>
            Title.Caption = #1052#1072#1082#1089'. '#1086#1073#1098#1077#1084
            Title.TitleButton = True
            Width = 72
          end
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
            Title.TitleButton = True
            Width = 90
          end>
      end
      object Panel2: TPanel
        Left = 395
        Top = 467
        Width = 392
        Height = 28
        Anchors = [akRight]
        TabOrder = 2
        DesignSize = (
          392
          28)
        object ComboBox1: TComboBox
          Left = 7
          Top = 4
          Width = 177
          Height = 21
          Anchors = []
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = #1055#1086' '#1086#1073#1098#1077#1082#1090#1072#1084
          OnChange = ComboBox1Change
          Items.Strings = (
            #1055#1086' '#1086#1073#1098#1077#1082#1090#1072#1084
            #1042#1089#1077)
        end
        object Button1: TButton
          Left = 248
          Top = 4
          Width = 93
          Height = 20
          Anchors = []
          Caption = 'OK'
          TabOrder = 1
          OnClick = Button1Click
        end
      end
      object EHazs_rez: TDBGridEh
        Left = 384
        Top = 0
        Width = 404
        Height = 456
        AllowedOperations = []
        Anchors = [akTop, akRight, akBottom]
        DataSource = DS_azc_obj
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME_ORG'
            Footers = <>
            ImageList = f_main.img_Common
            ShowImageAndText = True
            OnGetCellParams = DBGridEh1Columns0GetCellParams
          end>
      end
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 795
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DockPos = -8
      FloatingWidth = 1
      Images = f_main.img_Common
      TabOrder = 0
      object tbItemAdd: TTBItem
        Action = ac_AZCObj_add
        DisplayMode = nbdmImageAndText
      end
      object tbItemDel: TTBItem
        Action = ac_AZCObj_del
        DisplayMode = nbdmImageAndText
      end
      object tbItemChange: TTBItem
        Action = azc_AZCObj_edit
        DisplayMode = nbdmImageAndText
      end
      object TBItem1: TTBItem
        Action = ac_AZCObj_refresh
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object ODS_azc_obj: TOracleDataSet
    SQL.Strings = (
      'select * from v_azc_org WHERE ID_ORG_TYPE <> 6'
      'ORDER BY NAME_ORG')
    ReadBuffer = 11
    QBEDefinition.QBEFieldDefs = {
      03000000050000000600000049445F4F52470100000000080000004E414D455F
      4F524701000000000D00000049445F504152454E545F4F524701000000000B00
      000049445F4F52475F5459504501000000000700000049535F524F4F54010000
      0000}
    DetailFields = 'ID_ORG'
    Left = 584
    Top = 72
    object ODS_azc_objID_ORG: TFloatField
      FieldName = 'ID_ORG'
      Required = True
    end
    object ODS_azc_objNAME_ORG: TStringField
      FieldName = 'NAME_ORG'
      Required = True
      Size = 100
    end
    object ODS_azc_objID_PARENT_ORG: TFloatField
      FieldName = 'ID_PARENT_ORG'
    end
    object ODS_azc_objID_ORG_TYPE: TFloatField
      FieldName = 'ID_ORG_TYPE'
    end
    object ODS_azc_objIS_ROOT: TIntegerField
      FieldName = 'IS_ROOT'
    end
  end
  object DS_azc_obj: TDataSource
    DataSet = mte_azs_obj
    Left = 568
    Top = 160
  end
  object ODS_azc_obj_all: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ORG_STRUCTURE.ROWID,ORG_STRUCTURE.ID,ORG_STRUCTURE.NAME, ' +
        'ORG_STRUCTURE.ADRESS, '
      
        'ORG_STRUCTURE.NOTE,ORG_STRUCTURE.ORG_KIND_ID,ORG_STRUCTURE.ORG_T' +
        'YPE_ID,'
      'KLS_ORG_KIND.NAME,  KLS_ORG_TYPE.NAME  FROM '
      'ORG_STRUCTURE, KLS_ORG_KIND, KLS_ORG_TYPE, ORG_RELATIONS'
      'WHERE ORG_STRUCTURE.ORG_KIND_ID = KLS_ORG_KIND.ID'
      'AND KLS_ORG_TYPE.ID = ORG_STRUCTURE.ORG_TYPE_ID'
      'AND ORG_STRUCTURE.id<>1'
      'AND ORG_STRUCTURE.id = ORG_RELATIONS.ORG_STRU_1_ID'
      'AND ORG_RELATIONS.ORG_STRU_2_ID = :var_kind'
      'ORDER  BY ORG_STRUCTURE.NAME')
    Variables.Data = {
      0300000001000000090000003A5641525F4B494E440300000000000000000000
      00}
    StringFieldsOnly = True
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_ORG_STRUCTURE'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      0300000009000000040000004E414D4501000000000600000041445245535301
      00000000060000004E414D455F310100000000060000004E414D455F32010000
      00000200000049440100000000040000004E4F544501000000000B0000004F52
      475F4B494E445F49440100000000090000005052454450525F49440100000000
      0B0000004F52475F545950455F49440100000000}
    UniqueFields = 'ID'
    DetailFields = 'ORG_KIND_ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'ORG_STRUCTURE'
    CommitOnPost = False
    CachedUpdates = True
    Left = 640
    Top = 136
    object ODS_azc_obj_allID: TStringField
      FieldName = 'ID'
      Required = True
      Size = 11
    end
    object ODS_azc_obj_allADRESS: TStringField
      FieldName = 'ADRESS'
      Required = True
      Size = 100
    end
    object ODS_azc_obj_allNOTE: TStringField
      FieldName = 'NOTE'
      Size = 100
    end
    object ODS_azc_obj_allNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object ODS_azc_obj_allORG_KIND_ID: TStringField
      FieldName = 'ORG_KIND_ID'
      Required = True
      Size = 11
    end
    object ODS_azc_obj_allORG_TYPE_ID: TStringField
      FieldName = 'ORG_TYPE_ID'
      Required = True
      Size = 11
    end
    object ODS_azc_obj_allNAME_1: TStringField
      FieldName = 'NAME_1'
      Required = True
      Size = 70
    end
    object ODS_azc_obj_allNAME_2: TStringField
      FieldName = 'NAME_2'
      Required = True
      Size = 70
    end
  end
  object DS_azc_obj_all: TDataSource
    DataSet = ODS_azc_obj_all
    Left = 472
    Top = 128
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 496
    Top = 208
    StyleName = 'XP Style'
    object ac_AZCRez_add: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1077#1079#1077#1088#1074#1091#1072#1088
      ImageIndex = 0
      OnExecute = ac_AZCRez_addExecute
    end
    object ac_AZCObj_add: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
      ImageIndex = 0
      OnExecute = ac_AZCObj_addExecute
    end
    object ac_AZCRez_del: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1077#1079#1077#1088#1074#1091#1072#1088
      ImageIndex = 5
      OnExecute = ac_AZCRez_delExecute
    end
    object ac_AZCObj_del: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
      ImageIndex = 5
      OnExecute = ac_AZCObj_delExecute
    end
    object azc_AZCRez_edit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1077#1079#1077#1088#1074#1091#1072#1088
      ImageIndex = 2
      OnExecute = azc_AZCRez_editExecute
    end
    object azc_AZCObj_edit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
      ImageIndex = 2
      OnExecute = azc_AZCObj_editExecute
    end
    object ac_AZCObj_refresh: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = ac_AZCObj_refreshExecute
    end
  end
  object OQ_azc_obj: TOracleQuery
    Left = 664
    Top = 72
  end
  object ODS_rez: TOracleDataSet
    SQL.Strings = (
      
        'select arc_rez.rowid, arc_rez.ORG_STRU_ID ID_ORG,  arc_rez.*,  o' +
        'rg_structure.NAME, '
      'kls_prod.NAME_NPR, kls_ar_tov.NAME '
      'from arc_rez, org_structure, kls_prod, kls_ar_tov'
      'where arc_rez.ORG_STRU_ID = org_structure.ID'
      'and arc_rez.PROD_ID_NPR = kls_prod.ID_NPR'
      'and arc_rez.ORG_STRU_ID = :ID_ORG'
      'AND DATEUPLOAD BETWEEN  :date_1 and  :date_2'
      'and kls_ar_tov.ID = arc_rez.AR_TOV_ID')
    ReadBuffer = 11
    Variables.Data = {
      0300000003000000070000003A49445F4F524703000000000000000000000007
      0000003A444154455F310C0000000000000000000000070000003A444154455F
      320C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000F0000000600000049445F4F524701000000000A0000004441544555
      504C4F414401000000000700000052455A5F4E554D01000000000B0000005245
      5A5F4E554D5F554E50010000000003000000564F4C0100000000080000004445
      41445F564F4C0100000000070000004D41585F564F4C01000000000400000050
      52494D010000000009000000444953505F4E414D450100000000090000004152
      5F544F565F494401000000000B00000050524F445F49445F4E50520100000000
      0B0000004F52475F535452555F49440100000000040000004E414D4501000000
      00080000004E414D455F4E50520100000000060000004E414D455F3101000000
      00}
    MasterFields = 'ID_ORG'
    QueryAllRecords = False
    Session = f_main.ora_Session
    Left = 604
    Top = 257
    object ODS_rezID_ORG: TFloatField
      FieldName = 'ID_ORG'
    end
    object ODS_rezDATEUPLOAD: TDateTimeField
      FieldName = 'DATEUPLOAD'
      Required = True
    end
    object ODS_rezREZ_NUM: TStringField
      FieldName = 'REZ_NUM'
      Required = True
      Size = 15
    end
    object ODS_rezREZ_NUM_UNP: TStringField
      FieldName = 'REZ_NUM_UNP'
      Size = 15
    end
    object ODS_rezVOL: TFloatField
      FieldName = 'VOL'
      Required = True
    end
    object ODS_rezDEAD_VOL: TFloatField
      FieldName = 'DEAD_VOL'
      Required = True
    end
    object ODS_rezMAX_VOL: TFloatField
      FieldName = 'MAX_VOL'
      Required = True
    end
    object ODS_rezPRIM: TStringField
      FieldName = 'PRIM'
      Size = 50
    end
    object ODS_rezDISP_NAME: TStringField
      FieldName = 'DISP_NAME'
      Size = 50
    end
    object ODS_rezAR_TOV_ID: TIntegerField
      FieldName = 'AR_TOV_ID'
      Required = True
    end
    object ODS_rezPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object ODS_rezORG_STRU_ID: TFloatField
      FieldName = 'ORG_STRU_ID'
    end
    object ODS_rezNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object ODS_rezNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object ODS_rezNAME_1: TStringField
      FieldName = 'NAME_1'
      Required = True
      Size = 30
    end
  end
  object DS_rez: TDataSource
    DataSet = ODS_rez
    Left = 604
    Top = 305
  end
  object mte_azs_obj: TMemTableEh
    Params = <>
    DataDriver = dsd_azs_obj
    ReadOnly = True
    AfterScroll = mte_azs_objAfterScroll
    Left = 492
    Top = 377
    object mte_azs_objID_ORG: TFloatField
      FieldName = 'ID_ORG'
      Required = True
    end
    object mte_azs_objNAME_ORG: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME_ORG'
      Required = True
      Size = 100
    end
    object mte_azs_objID_PARENT_ORG: TFloatField
      FieldName = 'ID_PARENT_ORG'
    end
    object mte_azs_objID_ORG_TYPE: TFloatField
      FieldName = 'ID_ORG_TYPE'
    end
    object mte_azs_objIS_ROOT: TIntegerField
      FieldName = 'IS_ROOT'
    end
  end
  object dsd_azs_obj: TDataSetDriverEh
    ProviderDataSet = ODS_azc_obj
    Left = 588
    Top = 377
  end
end
