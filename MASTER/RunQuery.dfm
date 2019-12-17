object f_Query: Tf_Query
  Left = 259
  Top = 137
  Width = 696
  Height = 480
  Caption = 'f_Query'
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
  object gridQuery: TDBGridEh
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    Hint = #1044#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1085#1072#1078#1084#1080#1090#1077' CTRL+F'
    Align = alClient
    DataSource = dsQuery
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clScrollBar
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = TBPopupMenu1
    RowSizingAllowed = True
    ShowHint = True
    SumList.Active = True
    SumList.VirtualRecords = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
  end
  object tQuery: TOracleDataSet
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
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    DesignActivation = False
    Active = False
    Left = 248
    Top = 88
  end
  object dsQuery: TDataSource
    DataSet = tQuery
    Left = 336
    Top = 88
  end
  object TBPopupMenu1: TTBPopupMenu
    Left = 536
    Top = 160
    object TBItem2: TTBItem
      Action = acPrintQuery
    end
    object TBItem1: TTBItem
      Action = acCopyQuery
    end
    object TBItem4: TTBItem
      Action = acQueryInXLS
    end
    object TBItem9: TTBItem
      Action = acQueryInRtf
    end
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 472
    Top = 144
    StyleName = 'XP Style'
    object acPrintQuery: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 6
      OnExecute = acPrintQueryExecute
    end
    object acCopyQuery: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      OnExecute = acCopyQueryExecute
    end
    object acQueryInXLS: TAction
      Caption = #1042' Excel'
      ImageIndex = 42
      OnExecute = acQueryInXLSExecute
    end
    object acQueryInRtf: TAction
      Caption = #1042' Word'
      ImageIndex = 38
      OnExecute = acQueryInRtfExecute
    end
  end
  object printQuery: TPrintDBGridEh
    DBGridEh = gridQuery
    Options = [pghFitGridToPageWidth]
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
    PageHeader.RightText.Strings = (
      '&[Page]')
    PrintFontName = 'Arial'
    Units = MM
    Left = 472
    Top = 85
  end
end
