object f_RezReport: Tf_RezReport
  Left = 366
  Top = 121
  Width = 372
  Height = 548
  Caption = #1054#1090#1095#1077#1090#1099' '#1087#1086' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1085#1086#1084#1091' '#1087#1072#1088#1082#1091
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 26
    Width = 364
    Height = 495
    Align = alClient
    DataSource = ds_ArcRez
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
    OnDblClick = DBGridEh1DblClick
    OnGetCellParams = DBGridEh1GetCellParams
    OnSortMarkingChanged = DBGridEh1SortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DATEUPLOAD'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'DISP_NAME'
        Footers = <>
        Title.TitleButton = True
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 364
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem2: TTBItem
        Action = acRezReportShort
        DisplayMode = nbdmImageAndText
      end
      object TBItem1: TTBItem
        Action = acRezReportLong
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object t_ArcRez: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  dateupload,'
      '  DISP_NAME'
      'FROM arc_rez'
      'ORDER BY dateupload DESC')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000A0000004441544555504C4F414401000000000900000044
      4953505F4E414D450100000000}
    ReadOnly = True
    QueryAllRecords = False
    Left = 228
    Top = 64
    object t_ArcRezDATEUPLOAD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' / '#1074#1088#1077#1084#1103
      DisplayWidth = 22
      FieldName = 'DATEUPLOAD'
      Required = True
      DisplayFormat = 'dd mmmm yyyy hh:nn'
    end
    object t_ArcRezDISP_NAME: TStringField
      DisplayLabel = #1044#1080#1089#1087#1077#1090#1095#1077#1088' '#1059#1053#1055
      DisplayWidth = 23
      FieldName = 'DISP_NAME'
      Size = 50
    end
  end
  object ds_ArcRez: TDataSource
    DataSet = t_ArcRez
    Left = 256
    Top = 64
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 200
    Top = 96
    StyleName = 'XP Style'
    object acRezReportLong: TAction
      Caption = #1055#1086#1083#1085#1099#1081
      ImageIndex = 6
      OnExecute = acRezReportLongExecute
    end
    object acRezReportShort: TAction
      Caption = #1057#1078#1072#1090#1099#1081
      ImageIndex = 6
      OnExecute = acRezReportShortExecute
    end
  end
end
