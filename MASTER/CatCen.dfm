object f_CatCen: Tf_CatCen
  Left = 154
  Top = 142
  Width = 696
  Height = 480
  Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1094#1077#1085
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
  object grid_CatCen: TDBGridEh
    Left = 0
    Top = 26
    Width = 688
    Height = 420
    Align = alClient
    AllowedOperations = []
    DataSource = ds_CatCen
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = grid_CatCenDblClick
    OnGetCellParams = grid_CatCenGetCellParams
    OnSortMarkingChanged = grid_CatCenSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'CAT_CEN_NAME'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'CAT_CEN_GROUP_NAME'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'GROUPDOG_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 135
      end
      item
        EditButtons = <>
        FieldName = 'PREDPR_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 227
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 688
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1094#1077#1085
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acAddCatCen
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acEdCatCen
        DisplayMode = nbdmImageAndText
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem3: TTBItem
        Action = acCatCenPrint
        DisplayMode = nbdmImageAndText
      end
      object TBItem4: TTBItem
        Action = acCatCenToDBF
      end
      object TBItem5: TTBItem
        Action = acCatCenToDBFJK
      end
      object TBItem6: TTBItem
        Action = acCatCenSaveToXls
      end
    end
  end
  object ds_CatCen: TDataSource
    DataSet = q_CatCen
    Left = 564
    Top = 80
  end
  object q_CatCen: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  KLS_CAT_CEN.ID,'
      '  KLS_CAT_CEN.CAT_CEN_NAME,'
      '  KLS_CAT_CEN_GROUP.CAT_CEN_GROUP_NAME,'
      '  KLS_GROUPDOG.GROUPDOG_NAME,'
      
        '  KLS_PREDPR.PREDPR_NAME,KLS_CAT_CEN.PREDPR_ID,GROUPDOG_ID,CAT_C' +
        'EN_group_id'
      'FROM KLS_CAT_CEN , KLS_PREDPR , KLS_GROUPDOG, KLS_CAT_CEN_GROUP'
      'WHERE ((KLS_CAT_CEN.PREDPR_ID = KLS_PREDPR.ID(+)) AND'
      '       (KLS_CAT_CEN.GROUPDOG_ID = KLS_GROUPDOG.ID(+)) AND'
      '       (KLS_CAT_CEN.CAT_CEN_GROUP_ID = KLS_CAT_CEN_GROUP.ID(+)))'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000800000002000000494401000000000C0000004341545F43454E5F4E
      414D450100000000120000004341545F43454E5F47524F55505F4E414D450100
      0000000D00000047524F5550444F475F4E414D4501000000000B000000505245
      4450525F4E414D450100000000090000005052454450525F494401000000000B
      00000047524F5550444F475F49440100000000100000004341545F43454E5F47
      524F55505F49440100000000}
    Left = 536
    Top = 80
    object q_CatCenID: TIntegerField
      DisplayLabel = #8470' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
      FieldName = 'ID'
      Required = True
    end
    object q_CatCenCAT_CEN_NAME: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1094#1077#1085
      FieldName = 'CAT_CEN_NAME'
      Required = True
      Size = 70
    end
    object q_CatCenCAT_CEN_GROUP_NAME: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
      FieldName = 'CAT_CEN_GROUP_NAME'
      Size = 30
    end
    object q_CatCenGROUPDOG_NAME: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1099' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
      FieldName = 'GROUPDOG_NAME'
      Size = 40
    end
    object q_CatCenPREDPR_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'PREDPR_NAME'
      Size = 60
    end
    object q_CatCenPREDPR_ID: TIntegerField
      FieldName = 'PREDPR_ID'
    end
    object q_CatCenGROUPDOG_ID: TIntegerField
      FieldName = 'GROUPDOG_ID'
    end
    object q_CatCenCAT_CEN_GROUP_ID: TIntegerField
      FieldName = 'CAT_CEN_GROUP_ID'
    end
  end
  object q_UpdateCatCen: TOracleQuery
    Left = 536
    Top = 108
  end
  object ActionManager1: TActionManager
    ActionBars.SessionCount = 21
    ActionBars = <
      item
        AutoSize = False
      end
      item
        Items = <
          item
            Action = acAddCatCen
            ImageIndex = 0
            ShortCut = 45
          end
          item
            Action = acEdCatCen
            ImageIndex = 2
            ShortCut = 115
          end>
        AutoSize = False
      end
      item
        Items = <
          item
            Action = acAddCatCen
            ImageIndex = 0
            ShortCut = 45
          end
          item
            Action = acEdCatCen
            ImageIndex = 2
            ShortCut = 115
          end>
        AutoSize = False
      end>
    Images = f_main.img_Common
    Left = 508
    Top = 108
    StyleName = 'XP Style'
    object acAddCatCen: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      Hint = '<Ins>'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = acAddCatCenExecute
    end
    object acEdCatCen: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      Hint = '<F4>'
      ImageIndex = 2
      ShortCut = 115
      OnExecute = acEdCatCenExecute
    end
    object acCatCenPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 6
      OnExecute = acCatCenPrintExecute
    end
    object acCatCenToDBFJK: TAction
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' DBF JK Only'
      OnExecute = acCatCenToDBFJKExecute
    end
    object acCatCenToDBF: TAction
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' DBF'
      OnExecute = acCatCenToDBFExecute
    end
    object acCatCenSaveToXls: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' Excel'
      OnExecute = acCatCenSaveToXlsExecute
    end
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = grid_CatCen
    Options = [pghFitGridToPageWidth, pghOptimalColWidths]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    PrintFontName = 'Times New Roman'
    Title.Strings = (
      '')
    Units = MM
    Left = 564
    Top = 108
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 564
    Top = 136
  end
end
