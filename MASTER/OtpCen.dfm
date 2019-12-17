object f_OtpCen: Tf_OtpCen
  Left = 224
  Top = 154
  Width = 901
  Height = 483
  Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
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
  object GridBrowse: TDBGridEh
    Left = 0
    Top = 56
    Width = 893
    Height = 393
    Align = alClient
    ColumnDefValues.Title.TitleButton = True
    DataSource = ds_OtpCen
    EditActions = [geaCopyEh]
    EvenRowColor = clInfoBk
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
    PopupMenu = TBPopupMenu1
    ReadOnly = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = GridBrowseDblClick
    OnGetCellParams = GridBrowseGetCellParams
    Columns = <
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'IS_ORIGINAL'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        Width = 33
      end
      item
        EditButtons = <>
        FieldName = 'NAME_NPR'
        Footer.Value = #1048#1090#1086#1075#1086' '#1086#1090#1086#1073#1088#1072#1085#1086' '#1089#1090#1088#1086#1082':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 184
      end
      item
        EditButtons = <>
        FieldName = 'CAT_CEN_ID'
        Footer.FieldName = 'ID'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.ValueType = fvtCount
        Footers = <>
        Width = 39
      end
      item
        EditButtons = <>
        FieldName = 'CAT_CEN_NAME'
        Footers = <>
        Width = 184
      end
      item
        EditButtons = <>
        FieldName = 'CENA'
        Footers = <>
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'NO_AKCIZ'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1')
        PickList.Strings = (
          ''
          #1041#1045#1047' '#1040#1050#1062#1048#1047#1040)
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'AKCIZ'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CENA_OTP'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PROTOKOL_NUM'
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'PROTOKOL_DATE'
        Footers = <>
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'BEGIN_DATE'
        Footers = <>
        Width = 72
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'END_DATE'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'CENA_NPO'
        Footers = <>
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'CENA_OTP_NPO'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PROTOKOL_BEGIN_DATE'
        Footers = <>
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'SUPPLIER'
        Footers = <>
        Width = 211
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 893
    Height = 30
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 7
      Width = 40
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object Label2: TLabel
      Left = 79
      Top = 9
      Width = 82
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1094#1077#1085#1099
    end
    object Label3: TLabel
      Left = 241
      Top = 9
      Width = 34
      Height = 13
      Caption = #1089' '#1076#1072#1090#1099
    end
    object Label4: TLabel
      Left = 376
      Top = 9
      Width = 37
      Height = 13
      Caption = #1087#1086' '#1076#1072#1090#1091
    end
    object SpeedButton1: TSpeedButton
      Left = 51
      Top = 4
      Width = 23
      Height = 22
      Action = acPricesFilter
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0084000000FF00FF0084000000FF00FF0084000000FF00FF008400
        00008400000084000000840000008400000084000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        000000000000FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        000000000000FF00FF00FF00FF00FF00FF00000000000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000008484
        84000000000000000000FF00FF0000000000848484000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000C6C6
        C6000000000000000000FF00FF0000000000C6C6C6000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        000000000000000000000000000000000000000000000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000848484000000000000000000000000008484840000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000FF00FF000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000FF00FF000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object e_OneCatCen: TRxSpinEdit
      Left = 168
      Top = 5
      Width = 63
      Height = 21
      Hint = #1060#1080#1083#1100#1090#1088' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1086#1076#1085#1086#1081' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#13#10'(-1 - '#1074#1089#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080')'
      Value = -1.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object e_BeginDate: TDateTimePicker
      Left = 289
      Top = 5
      Width = 82
      Height = 21
      Date = 37070.390091736100000000
      Time = 37070.390091736100000000
      TabOrder = 1
    end
    object e_BeginDate2: TDateTimePicker
      Left = 419
      Top = 5
      Width = 82
      Height = 21
      Date = 37070.390091736100000000
      Time = 37070.390091736100000000
      TabOrder = 2
    end
    object cb_IsOriginal: TCheckBox
      Left = 510
      Top = 7
      Width = 121
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1086#1088#1080#1075#1080#1085#1072#1083#1099
      TabOrder = 3
    end
    object cb_ActivePrices: TCheckBox
      Left = 635
      Top = 7
      Width = 121
      Height = 17
      Hint = #1061#1086#1095#1091' '#1090#1086#1083#1100#1082#1086' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1077' '#1094#1077#1085#1099'.'#13#10#1048' '#1074#1089#1105' '#1090#1091#1090'!'
      Caption = #1044#1077#1081#1089#1090#1074#1091#1102#1097#1080#1077' '#1094#1077#1085#1099
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = cb_ActivePricesClick
    end
    object cb_CheckPrices: TCheckBox
      Left = 767
      Top = 7
      Width = 124
      Height = 17
      Hint = #1061#1086#1095#1091' '#1090#1086#1083#1100#1082#1086' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1077' '#1094#1077#1085#1099'.'#13#10#1048' '#1074#1089#1105' '#1090#1091#1090'!'
      Caption = #1055#1056#1054#1042#1045#1056#1050#1040' '#1062#1045#1053'!!!'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = cb_ActivePricesClick
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 893
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acNewPrice
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acEdPrice
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = acDeletePrices
        DisplayMode = nbdmImageAndText
      end
      object TBItem4: TTBItem
        Action = acPrintPrices
        DisplayMode = nbdmImageAndText
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem6: TTBItem
        Action = acPricesSaveToXls
        DisplayMode = nbdmImageAndText
      end
      object TBItem5: TTBItem
        Action = acPricesOraToDBF
        DisplayMode = nbdmImageAndText
      end
      object TBItem7: TTBItem
        Action = acPricesOraToDBFJK
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object q_OtpCen: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_FIN_OTPCEN'
      ''
      'ORDER BY ID'
      ''
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      030000001B0000000600000049445F4E50520100000000080000004E414D455F
      4E505201000000000A0000004341545F43454E5F494401000000000C00000043
      41545F43454E5F4E414D45010000000002000000494401000000000400000043
      454E41010000000005000000414B43495A0100000000050000004E4453323001
      00000000060000004E47534D323501000000000800000043454E415F4F545001
      000000000A000000424547494E5F44415445010000000008000000454E445F44
      41544501000000000B00000050524F445F49445F4E505201000000000C000000
      4F574E4552534849505F494401000000000E0000004F574E4552534849505F4E
      414D45010000000008000000535550504C49455201000000000B000000535550
      504C4945525F494401000000000C00000050524F544F4B4F4C5F4E554D010000
      00000D00000050524F544F4B4F4C5F4441544501000000000B00000049535F4F
      524947494E414C01000000001300000050524F544F4B4F4C5F424547494E5F44
      41544501000000000800000043454E415F4E504F01000000000C00000043454E
      415F4F54505F4E504F0100000000090000004E445332305F4E504F0100000000
      080000004E4F5F414B43495A010000000007000000504C41545F494401000000
      000700000043454E415F424E0100000000}
    ReadOnly = True
    Session = f_main.ora_Session
    BeforeOpen = q_OtpCenBeforeOpen
    AfterOpen = q_OtpCenAfterOpen
    OnFilterRecord = q_OtpCenFilterRecord
    Left = 600
    Top = 120
    object q_OtpCenNAME_NPR: TStringField
      DisplayLabel = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object q_OtpCenCAT_CEN_NAME: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1094#1077#1085#1099
      FieldName = 'CAT_CEN_NAME'
      Required = True
      Size = 70
    end
    object q_OtpCenCENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1073'/'#1085
      FieldName = 'CENA'
      Required = True
      DisplayFormat = '#0.00'
    end
    object q_OtpCenAKCIZ: TFloatField
      DisplayLabel = #1042' '#1090'.'#1095'. '#1072#1082#1094#1080#1079
      FieldName = 'AKCIZ'
      Required = True
      DisplayFormat = '#0.00'
    end
    object q_OtpCenNDS20: TFloatField
      DisplayLabel = #1053#1044#1057
      FieldName = 'NDS20'
      Required = True
      DisplayFormat = '#0.00'
    end
    object q_OtpCenNGSM25: TFloatField
      DisplayLabel = #1043#1057#1052
      FieldName = 'NGSM25'
      Required = True
      DisplayFormat = '#0.00'
    end
    object q_OtpCenCENA_OTP: TFloatField
      DisplayLabel = #1054#1090#1087#1091#1089#1082#1085#1072#1103' '#1094#1077#1085#1072
      FieldName = 'CENA_OTP'
      Required = True
      DisplayFormat = '#0.00'
    end
    object q_OtpCenBEGIN_DATE: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1094#1077#1085#1099
      FieldName = 'BEGIN_DATE'
      Required = True
    end
    object q_OtpCenEND_DATE: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1094#1077#1085#1099
      FieldName = 'END_DATE'
      Required = True
    end
    object q_OtpCenID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object q_OtpCenCAT_CEN_ID: TIntegerField
      DisplayLabel = #8470' '#1050#1072#1090'.'
      FieldName = 'CAT_CEN_ID'
      Required = True
    end
    object q_OtpCenID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_OtpCenPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object q_OtpCenOWNERSHIP_ID: TIntegerField
      FieldName = 'OWNERSHIP_ID'
      Required = True
    end
    object q_OtpCenOWNERSHIP_NAME: TStringField
      DisplayLabel = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100
      FieldName = 'OWNERSHIP_NAME'
      Required = True
      Size = 70
    end
    object q_OtpCenSUPPLIER: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldName = 'SUPPLIER'
      Required = True
      Size = 60
    end
    object q_OtpCenSUPPLIER_ID: TIntegerField
      FieldName = 'SUPPLIER_ID'
    end
    object q_OtpCenPROTOKOL_NUM: TStringField
      DisplayLabel = #8470' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
      FieldName = 'PROTOKOL_NUM'
      Size = 15
    end
    object q_OtpCenPROTOKOL_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
      FieldName = 'PROTOKOL_DATE'
    end
    object q_OtpCenIS_ORIGINAL: TIntegerField
      DisplayLabel = #1054#1088#1080#1075'.'
      FieldName = 'IS_ORIGINAL'
      Required = True
    end
    object q_OtpCenPROTOKOL_BEGIN_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
      FieldName = 'PROTOKOL_BEGIN_DATE'
    end
    object q_OtpCenCENA_NPO: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1053#1055#1054
      FieldName = 'CENA_NPO'
      DisplayFormat = '#0.00'
    end
    object q_OtpCenCENA_OTP_NPO: TFloatField
      DisplayLabel = #1054#1090#1087#1091#1089#1082#1085#1072#1103' '#1094#1077#1085#1072' '#1053#1055#1054
      FieldName = 'CENA_OTP_NPO'
      DisplayFormat = '#0.00'
    end
    object q_OtpCenNDS20_NPO: TFloatField
      DisplayLabel = #1053#1044#1057' '#1053#1055#1054
      FieldName = 'NDS20_NPO'
      DisplayFormat = '#0.00'
    end
    object q_OtpCenNO_AKCIZ: TIntegerField
      DisplayLabel = #1041#1045#1047' '#1040#1050#1062#1048#1047#1040'?'
      FieldName = 'NO_AKCIZ'
    end
    object q_OtpCenPLAT_ID: TIntegerField
      FieldName = 'PLAT_ID'
    end
    object q_OtpCenCENA_BN: TFloatField
      FieldName = 'CENA_BN'
    end
  end
  object ds_OtpCen: TDataSource
    DataSet = q_OtpCen
    Left = 600
    Top = 148
  end
  object q_UpdOtpCen: TOracleQuery
    Left = 572
    Top = 176
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = GridBrowse
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
    Left = 572
    Top = 204
  end
  object ActionManager1: TActionManager
    ActionBars.SessionCount = 30
    ActionBars = <
      item
        Items = <
          item
            Action = acEdPrice
            ImageIndex = 1
            ShortCut = 115
          end
          item
            Action = acNewPrice
            ImageIndex = 0
            ShortCut = 45
          end
          item
            Action = acDeletePrices
            ImageIndex = 5
          end
          item
            Action = acPrintPrices
            ImageIndex = 6
            ShortCut = 16464
          end
          item
            Action = acPricesOraToDBF
            Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' &DBF'
          end>
        AutoSize = False
      end>
    Images = f_main.img_Common
    Left = 572
    Top = 148
    StyleName = 'XP Style'
    object acNewPrice: TAction
      Caption = #1053#1086#1074#1072#1103' '#1094#1077#1085#1072
      ImageIndex = 0
      ShortCut = 45
      OnExecute = acNewPriceExecute
    end
    object acEdPrice: TAction
      Caption = #1055#1088#1072#1074#1082#1072' '#1094#1077#1085#1099
      ImageIndex = 1
      ShortCut = 115
      OnExecute = acEdPriceExecute
    end
    object acDeletePrices: TAction
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1094#1077#1085#1099
      ImageIndex = 5
      OnExecute = acDeletePricesExecute
    end
    object acPrintPrices: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099' '#1089' '#1090#1077#1082#1091#1097#1080#1084#1080' '#1087#1072#1088#1072#1084#1077#1090#1088#1072#1084#1080
      ImageIndex = 6
      ShortCut = 16464
      OnExecute = acPrintExecute
    end
    object acPricesOraToDBFJK: TAction
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' DBF JK Only'
      ImageIndex = 43
      OnExecute = acPricesOraToDBFJKExecute
    end
    object acPricesOraToDBF: TAction
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' DBF'
      ImageIndex = 43
      OnExecute = ac_ToDBFExecute
    end
    object acPricesFilter: TAction
      ImageIndex = 3
      OnExecute = ac_OneCatCenExecute
    end
    object acCopyPrices: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1094#1077#1085#1099
      ImageIndex = 4
      OnExecute = acCopyPricesExecute
    end
    object acPricesSaveToXls: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' Excel'
      ImageIndex = 42
      OnExecute = acPricesSaveToXlsExecute
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 600
    Top = 232
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'GridBrowse.<P>.Columns.ColumnsIndex'
      'GridBrowse.<P>.Columns.<ForAllItems>.Width')
    Left = 384
    Top = 144
  end
  object TBPopupMenu1: TTBPopupMenu
    Images = f_main.img_Common
    Left = 272
    Top = 160
    object TBItem15: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem1: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem1AcceptText
    end
    object TBItem17: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem17Click
    end
    object TBItem18: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem18Click
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem21: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem21Click
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = acNewPrice
      DisplayMode = nbdmImageAndText
    end
    object TBItem10: TTBItem
      Action = acEdPrice
      DisplayMode = nbdmImageAndText
    end
    object TBItem16: TTBItem
      Action = acCopyPrices
      DisplayMode = nbdmImageAndText
    end
    object TBItem8: TTBItem
      Action = acDeletePrices
      DisplayMode = nbdmImageAndText
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItem11: TTBItem
      Action = acPricesOraToDBF
      DisplayMode = nbdmImageAndText
    end
    object TBItem14: TTBItem
      Action = acPricesSaveToXls
      DisplayMode = nbdmImageAndText
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem12: TTBItem
      Caption = #1058#1077#1082#1089#1090' '#1079#1072#1087#1088#1086#1089#1072
      OnClick = TBItem12Click
    end
  end
end
