inherited f_Rep_Dbf: Tf_Rep_Dbf
  Left = 279
  Top = 115
  Width = 843
  Height = 568
  Caption = 'f_Rep_Dbf'
  OldCreateOrder = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 827
    Height = 31
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1086#1084#1077#1088' '#1086#1090#1095#1077#1090#1072':'
    end
    object sbRefresh: TSpeedButton
      Left = 156
      Top = 4
      Width = 25
      Height = 25
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
      OnClick = sbRefreshClick
    end
    object edNumRep: TCurrencyEdit
      Left = 95
      Top = 5
      Width = 57
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0'
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 506
    Width = 827
    Height = 26
    Align = alBottom
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ctrl + F - '#1055#1086#1080#1089#1082
    end
  end
  object gridBrowse: TDBGridEh
    Left = 0
    Top = 57
    Width = 827
    Height = 449
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    ColumnDefValues.Title.TitleButton = True
    DataSource = ds_Browse
    EvenRowColor = clInfoBk
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghRowHighlight, dghDialogFind]
    PopupMenu = pm_gridBrowse
    SortLocal = True
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnGetCellParams = gridBrowseGetCellParams
    Columns = <
      item
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footer.ValueType = fvtCount
        Footers = <>
        ReadOnly = True
        Title.Caption = #8470' '#1087'/'#1087
        Width = 31
        OnGetCellParams = gridBrowseColumns0GetCellParams
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 827
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object tbSendDBF: TTBItem
        Action = acRepDbfSendDBF
        DisplayMode = nbdmImageAndText
      end
      object tbSendXLS: TTBItem
        Action = acRepDbfSendXLS
        DisplayMode = nbdmImageAndText
        Images = f_main.img_Common
      end
      object tbPrepareXLS: TTBItem
        Action = acRepDbfPrepareXLS
        DisplayMode = nbdmImageAndText
      end
      object tbSendCSV: TTBItem
        Action = acRepDbfSendCSV
        DisplayMode = nbdmImageAndText
      end
      object TBSeparatorItem2: TTBSeparatorItem
      end
      object tbiItogs: TTBItem
        Caption = #1055#1088#1086#1084#1077#1078#1091#1090#1086#1095#1085#1099#1077' '#1080#1090#1086#1075#1080
        DisplayMode = nbdmImageAndText
        ImageIndex = 37
        Images = f_main.img_Common
        OnClick = tbiItogsClick
      end
    end
  end
  object q_reports: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM reports'
      'WHERE id=0')
    Session = f_main.ora_Session
    AfterOpen = q_reportsAfterOpen
    Left = 96
    Top = 64
  end
  object DBFConn: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DSN=PF;UID=;SourceDB=U:\LUK\DBASES\;SourceType=DBF;Exclusive' +
      '=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 168
    Top = 64
  end
  object q_DataADO: TADOQuery
    Connection = DBFConn
    EnableBCD = False
    Parameters = <>
    Left = 232
    Top = 152
  end
  object ds_Browse: TDataSource
    DataSet = t_Browse
    Left = 312
    Top = 152
  end
  object q_cmn: TADOQuery
    Connection = DBFConn
    Parameters = <>
    Left = 256
    Top = 328
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 392
    Top = 152
    StyleName = 'XP Style'
    object acRepDbfSendCSV: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' CSV-'#1092#1072#1081#1083
      ImageIndex = 43
      OnExecute = acRepDbfSendCSVExecute
    end
    object acRepDbfSendDBF: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' DBF-'#1092#1072#1081#1083
      ImageIndex = 43
      OnExecute = acRepDbfSendDBFExecute
    end
    object acRepDbfSendXLS: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' XLS-'#1092#1072#1081#1083
      ImageIndex = 42
      OnExecute = acRepDbfSendXLSExecute
    end
    object acRepDbfToXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1090#1072#1073#1083#1080#1094#1099' '#1074' Excel'
      ImageIndex = 42
      OnExecute = acRepDbfToXLSExecute
    end
    object acRepDbfPrepareXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' XLS-'#1092#1072#1081#1083' ('#1073#1077#1079' '#1086#1090#1087#1088#1072#1074#1082#1080')'
      ImageIndex = 42
      OnExecute = acRepDbfPrepareXLSExecute
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 384
    Top = 328
  end
  object pm_gridBrowse: TTBPopupMenu
    OnPopup = pm_gridBrowsePopup
    Left = 504
    Top = 264
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
    object TBItem3: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem3Click
    end
    object TBItem1: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem1Click
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem10: TTBItem
      Action = acRepDbfSendDBF
    end
    object TBItem4: TTBItem
      Action = acRepDbfPrepareXLS
    end
    object TBItem2: TTBItem
      Action = acRepDbfSendXLS
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem7: TTBItem
      Action = acRepDbfToXLS
    end
  end
  object q_cmn2: TOracleQuery
    Session = f_main.ora_Session
    Left = 160
    Top = 144
  end
  object ORAConn: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'BUH'
    Left = 224
    Top = 64
  end
  object q_DataORA: TOracleDataSet
    Session = ORAConn
    Left = 136
    Top = 280
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 592
    Top = 121
  end
  object FOR_REPORTS: TOraclePackage
    Session = f_main.ora_Session
    PackageName = 'FOR_REPORTS'
    Left = 288
    Top = 64
  end
  object t_Browse: TADOTable
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Mode=R' +
      'eadWrite;Extended Properties="DSN=PF;UID=;PWD=;SourceDB=C:\TMP\;' +
      'SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;' +
      'Null=Yes;Deleted=Yes;";Initial Catalog=C:\TMP\'
    CursorType = ctStatic
    OnFilterRecord = t_BrowseFilterRecord
    TableName = 'rep_1.dbf'
    Left = 192
    Top = 224
  end
end
