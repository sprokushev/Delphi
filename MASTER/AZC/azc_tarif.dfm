inherited f_forAZC_tarif: Tf_forAZC_tarif
  Left = 139
  Top = 108
  Width = 866
  Height = 620
  Caption = #1058#1072#1088#1080#1092#1099' '#1075#1088#1091#1079#1086#1087#1077#1088#1077#1074#1086#1079#1095#1080#1082#1086#1074
  OldCreateOrder = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBG_tarif: TDBGridEh
    Left = 0
    Top = 26
    Width = 858
    Height = 560
    Align = alClient
    DataSource = DS_tarif
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = DBG_tarifGetCellParams
    OnSortMarkingChanged = DBG_tarifSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'AGENT'
        Footers = <>
        Title.TitleButton = True
        Width = 155
      end
      item
        EditButtons = <>
        FieldName = 'SKLAD_FROM'
        Footers = <>
        Title.TitleButton = True
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'SKLAD_TO'
        Footers = <>
        Title.TitleButton = True
        Width = 38
      end
      item
        EditButtons = <>
        FieldName = 'DISTANCE'
        Footers = <>
        Title.TitleButton = True
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'TARIF_TONN'
        Footers = <>
        Title.TitleButton = True
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'TARIF_1000V'
        Footers = <>
        Title.TitleButton = True
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'DATE_'
        Footers = <>
        Title.TitleButton = True
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'AGNNAME'
        Footers = <>
        Title.TitleButton = True
        Width = 390
      end
      item
        EditButtons = <>
        FieldName = 'AZS_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 160
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 858
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object tbi_add: TTBItem
        Action = ac_insert
        DisplayMode = nbdmImageAndText
        Images = f_main.img_Common
      end
      object tbi_edit: TTBItem
        Action = ac_edit
        DisplayMode = nbdmImageAndText
      end
      object tbi_delete: TTBItem
        Action = ac_delete
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object ODS_tarif: TOracleDataSet
    SQL.Strings = (
      'SELECT A.*, B.AGNNAME, C.AZS_NAME'
      'FROM azc_tarif A, agnlist@oracle B, AZSAZSLISTMT@oracle C '
      'WHERE'
      'A.agent = B.AGNABBR'
      'AND A.SKLAD_TO= C.AZS_NUMBER'
      'order by sklad_from'
      ''
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000A00000005000000444154455F01000000000800000044495354414E
      434501000000000A00000054415249465F544F4E4E01000000000B0000005441
      5249465F313030305601000000000700000041474E4E414D4501000000000200
      000049440100000000050000004147454E5401000000000A000000534B4C4144
      5F46524F4D010000000008000000534B4C41445F544F01000000000800000041
      5A535F4E414D450100000000}
    Session = f_main.ora_Session
    Active = True
    Left = 256
    Top = 88
    object ODS_tarifAGENT: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1077#1088#1077#1074#1086#1079#1095#1080#1082
      FieldName = 'AGENT'
      Size = 255
    end
    object ODS_tarifSKLAD_FROM: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076' '#1086#1090#1075#1088#1091#1079#1082#1080
      FieldName = 'SKLAD_FROM'
      Size = 255
    end
    object ODS_tarifSKLAD_TO: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'SKLAD_TO'
      Size = 255
    end
    object ODS_tarifDISTANCE: TFloatField
      DisplayLabel = #1044#1080#1089#1090#1072#1085#1094#1080#1103
      FieldName = 'DISTANCE'
    end
    object ODS_tarifTARIF_TONN: TFloatField
      DisplayLabel = #1058#1072#1088#1080#1092'('#1090#1085')'
      FieldName = 'TARIF_TONN'
    end
    object ODS_tarifTARIF_1000V: TFloatField
      DisplayLabel = #1058#1072#1088#1080#1092'('#1086#1073#1098#1077#1084')'
      FieldName = 'TARIF_1000V'
    end
    object ODS_tarifDATE_: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1090#1072#1088#1080#1092#1072
      FieldName = 'DATE_'
    end
    object ODS_tarifAGNNAME: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1077#1088#1077#1074#1086#1079#1095#1080#1082
      FieldName = 'AGNNAME'
      Required = True
      Size = 160
    end
    object ODS_tarifAZS_NAME: TStringField
      DisplayLabel = #1040#1047#1057' '
      FieldName = 'AZS_NAME'
      Required = True
      Size = 80
    end
    object ODS_tarifID: TFloatField
      FieldName = 'ID'
    end
  end
  object DS_tarif: TDataSource
    DataSet = ODS_tarif
    Left = 160
    Top = 40
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 480
    Top = 176
    StyleName = 'XP Style'
    object ac_insert: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = ac_insertExecute
    end
    object ac_edit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 8
      OnExecute = ac_editExecute
    end
    object ac_delete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 16
      OnExecute = ac_deleteExecute
    end
  end
  object OQ_tarif: TOracleQuery
    Session = f_main.ora_Session
    Left = 320
    Top = 144
  end
end
