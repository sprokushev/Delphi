object f_SutReeList: Tf_SutReeList
  Left = 372
  Top = 181
  Width = 512
  Height = 354
  Caption = #1057#1091#1090#1086#1095#1085#1099#1077' '#1088#1077#1077#1089#1090#1088#1099' '#1079#1072#1076#1072#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gridSutReeList: TDBGridEh
    Left = 0
    Top = 26
    Width = 504
    Height = 294
    Align = alClient
    DataSource = ds_SutReeList
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = gridSutReeListDblClick
    OnGetCellParams = gridSutReeListGetCellParams
    OnSortMarkingChanged = gridSutReeListSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NUM_REE'
        Footers = <>
        Title.TitleButton = True
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'DATE_REE'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'DOP_REE'
        Footers = <>
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'STATUS_NAME'
        Footers = <>
        Width = 203
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 504
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acSutReeNew
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acSutReeEdit
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object q_SutReeList: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '  a.num_ree,'
      '  a.date_ree,'
      '  a.dop_ree,'
      '  a.id,'
      '  kls_status.name as status_name'
      'FROM month_reestr a,kls_status_month_reestr kls_status'
      'WHERE a.status=kls_status.id'
      'ORDER BY a.num_ree DESC')
    QBEDefinition.QBEFieldDefs = {
      0300000005000000070000004E554D5F52454501000000000800000044415445
      5F524545010000000007000000444F505F524545010000000002000000494401
      000000000B0000005354415455535F4E414D450100000000}
    ReadOnly = True
    QueryAllRecords = False
    Session = f_main.ora_Session
    Left = 116
    Top = 96
    object q_SutReeListNUM_REE: TFloatField
      DisplayLabel = #8470' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'NUM_REE'
      Required = True
    end
    object q_SutReeListDATE_REE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'DATE_REE'
      Required = True
    end
    object q_SutReeListDOP_REE: TFloatField
      DisplayLabel = #8470' '#1076#1086#1087' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'DOP_REE'
      Required = True
    end
    object q_SutReeListID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_SutReeListSTATUS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'STATUS_NAME'
      Required = True
      Size = 50
    end
  end
  object ds_SutReeList: TDataSource
    DataSet = q_SutReeList
    Left = 184
    Top = 96
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 40
    Top = 96
    StyleName = 'XP Style'
    object acSutReeNew: TAction
      Caption = #1053#1086#1074#1099#1081
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1088#1077#1077#1089#1090#1088
      ImageIndex = 0
      OnExecute = acSutReeNewExecute
    end
    object acSutReeEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1077#1077#1089#1090#1088
      ImageIndex = 8
      OnExecute = acSutReeEditExecute
    end
  end
end
