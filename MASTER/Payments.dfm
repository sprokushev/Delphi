object f_Payments: Tf_Payments
  Left = 226
  Top = 167
  Width = 982
  Height = 561
  Caption = #1055#1083#1072#1090#1077#1078#1080
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
  object grid_pays: TDBGridEh
    Left = 0
    Top = 56
    Width = 974
    Height = 471
    Align = alClient
    DataSource = ds_OtpCen
    EditActions = [geaCopyEh]
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = [fsBold]
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    ParentFont = False
    PopupMenu = pm_grid
    ReadOnly = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = acPaymentEditExecute
    OnGetCellParams = grid_paysGetCellParams
    OnSortMarkingChanged = grid_paysSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NUM_PLAT'
        Footer.Value = #1048#1090#1086#1075#1086':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.TitleButton = True
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'DATE_PLAT'
        Footer.FieldName = 'ID'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.TitleButton = True
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'DATE_POST'
        Footers = <>
        Title.Caption = #1055#1083#1072#1090#1077#1078#1085#1086#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1077'|'#1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
        Title.TitleButton = True
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'PLAT_NAME'
        Footers = <>
        Title.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082'|'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 284
      end
      item
        EditButtons = <>
        FieldName = 'DOG_NUMBER'
        Footers = <>
        Title.TitleButton = True
        Width = 131
      end
      item
        EditButtons = <>
        FieldName = 'DOG_DATE'
        Footers = <>
        Title.TitleButton = True
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'SUMMA'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'SUMMA_PLACED'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'NAZN_PLAT'
        Footers = <>
        Title.TitleButton = True
        Width = 461
      end
      item
        EditButtons = <>
        FieldName = 'PAYFORM_NAME'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'RS'
        Footers = <>
        Title.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082'|'#1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'BANK_NAME'
        Footers = <>
        Title.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082'|'#1041#1072#1085#1082' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
        Title.TitleButton = True
        Width = 300
      end
      item
        EditButtons = <>
        FieldName = 'BANK_ADRESS'
        Footers = <>
        Title.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082'|'#1040#1076#1088#1077#1089' '#1073#1072#1085#1082#1072
        Title.TitleButton = True
        Width = 226
      end
      item
        EditButtons = <>
        FieldName = 'OURBANK_NAME'
        Footers = <>
        Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' '#1087#1083#1072#1090#1077#1078#1072'|'#1041#1072#1085#1082
        Title.TitleButton = True
        Width = 242
      end
      item
        EditButtons = <>
        FieldName = 'OURBANK_ADRESS'
        Footers = <>
        Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' '#1087#1083#1072#1090#1077#1078#1072'|'#1040#1076#1088#1077#1089' '#1073#1072#1085#1082#1072
        Title.TitleButton = True
        Width = 231
      end
      item
        EditButtons = <>
        FieldName = 'RS_UNP'
        Footers = <>
        Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' '#1087#1083#1072#1090#1077#1078#1072'|'#1056#1057
      end
      item
        EditButtons = <>
        FieldName = 'DEST_NAME'
        Footers = <>
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 974
    Height = 30
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 8
      Width = 40
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object Label3: TLabel
      Left = 89
      Top = 9
      Width = 34
      Height = 13
      Caption = #1089' '#1076#1072#1090#1099
    end
    object Label4: TLabel
      Left = 223
      Top = 9
      Width = 37
      Height = 13
      Caption = #1087#1086' '#1076#1072#1090#1091
    end
    object SpeedButton1: TSpeedButton
      Left = 59
      Top = 4
      Width = 23
      Height = 22
      Action = acPaymentFilter
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
    object e_BeginDate: TDateTimePicker
      Left = 137
      Top = 5
      Width = 82
      Height = 21
      Date = 37070.390091736100000000
      Time = 37070.390091736100000000
      TabOrder = 0
    end
    object e_EndDate: TDateTimePicker
      Left = 267
      Top = 5
      Width = 82
      Height = 21
      Date = 37070.390091736100000000
      Time = 37070.390091736100000000
      TabOrder = 1
    end
    object cb_ToRealiz: TCheckBox
      Left = 360
      Top = 8
      Width = 161
      Height = 17
      Caption = #1053#1045' '#1088#1072#1079#1085#1077#1089#1077#1085#1085#1099#1077' '#1086#1087#1083#1072#1090#1099
      TabOrder = 2
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 974
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acPaymentNew
        DisplayMode = nbdmImageAndText
      end
      object TBItem8: TTBItem
        Action = acPaymentCopy
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acPaymentEdit
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = acPaymentDelete
        DisplayMode = nbdmImageAndText
      end
      object TBItem7: TTBItem
        Action = acPaymentsPlace
        Caption = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1042#1057#1045' '#1086#1087#1083#1072#1090#1099
      end
      object TBItem10: TTBItem
        Action = acPaymentUnPlacePeriod
      end
      object TBItem4: TTBItem
        Action = acPaymentPrint
        DisplayMode = nbdmImageAndText
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem6: TTBItem
        Action = acPaymentSaveToXls
      end
      object TBItem5: TTBItem
        Action = acPaymentOraToDBF
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object q_Payments: TOracleDataSet
    SQL.Strings = (
      'SELECT /**/'
      '  * FROM V_PAYMENTS'
      'WHERE DATE_PLAT BETWEEN :BEG_DATE AND :END_DATE'
      '  AND 1=1'
      'ORDER BY ID DESC')
    Variables.Data = {
      0300000002000000090000003A4245475F444154450C00000000000000000000
      00090000003A454E445F444154450C0000000000000000000000}
    RefreshOptions = [roBeforeEdit]
    Session = oraSes
    BeforeOpen = q_PaymentsBeforeOpen
    OnFilterRecord = q_PaymentsFilterRecord
    Left = 600
    Top = 120
    object q_PaymentsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_PaymentsDOG_ID: TFloatField
      FieldName = 'DOG_ID'
    end
    object q_PaymentsBANK_ID: TFloatField
      FieldName = 'BANK_ID'
    end
    object q_PaymentsRS: TStringField
      DisplayLabel = #1056'/'#1057' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FieldName = 'RS'
    end
    object q_PaymentsSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '### ### ### ##0.00'
    end
    object q_PaymentsNAZN_PLAT: TStringField
      DisplayLabel = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
      DisplayWidth = 500
      FieldName = 'NAZN_PLAT'
      Size = 500
    end
    object q_PaymentsOURBANK_ID: TFloatField
      FieldName = 'OURBANK_ID'
    end
    object q_PaymentsDOG_NUMBER: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082'|'#8470' '#1044#1086#1075#1086#1074#1086#1088#1072
      FieldName = 'DOG_NUMBER'
      Size = 30
    end
    object q_PaymentsDOG_DATE: TDateTimeField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082'|'#1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
      FieldName = 'DOG_DATE'
    end
    object q_PaymentsBANK_NAME: TStringField
      DisplayLabel = #1041#1072#1085#1082' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FieldName = 'BANK_NAME'
      Size = 100
    end
    object q_PaymentsBANK_ADRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1073#1072#1085#1082#1072' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FieldName = 'BANK_ADRESS'
      Size = 100
    end
    object q_PaymentsOURBANK_NAME: TStringField
      DisplayLabel = #1041#1072#1085#1082' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'OURBANK_NAME'
      Size = 100
    end
    object q_PaymentsOURBANK_ADRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1073#1072#1085#1082#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'OURBANK_ADRESS'
      Size = 100
    end
    object q_PaymentsNUM_PLAT: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1078#1085#1086#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1077'|'#8470
      FieldName = 'NUM_PLAT'
    end
    object q_PaymentsDATE_PLAT: TDateTimeField
      DisplayLabel = #1055#1083#1072#1090#1077#1078#1085#1086#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1077'|'#1044#1072#1090#1072
      FieldName = 'DATE_PLAT'
    end
    object q_PaymentsPLAT_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082'|'#1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'PLAT_NAME'
      Required = True
      Size = 60
    end
    object q_PaymentsSUMMA_PLACED: TFloatField
      DisplayLabel = #1056#1072#1079#1085#1077#1089#1077#1085#1086
      FieldName = 'SUMMA_PLACED'
      DisplayFormat = '### ### ### ##0.00'
    end
    object q_PaymentsPAYFORM_ID: TFloatField
      FieldName = 'PAYFORM_ID'
      Required = True
    end
    object q_PaymentsPAYFORM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PAYFORM_NAME'
      Required = True
    end
    object q_PaymentsDATE_POST: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'DATE_POST'
    end
    object q_PaymentsDEST_ID: TFloatField
      FieldName = 'DEST_ID'
    end
    object q_PaymentsDEST_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'DEST_NAME'
      Size = 50
    end
    object q_PaymentsRS_ID: TFloatField
      FieldName = 'RS_ID'
    end
    object q_PaymentsRS_UNP: TStringField
      DisplayLabel = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
      FieldName = 'RS_UNP'
      Required = True
    end
    object q_PaymentsPLAT_ID: TIntegerField
      FieldName = 'PLAT_ID'
      Required = True
    end
  end
  object ds_OtpCen: TDataSource
    DataSet = q_Payments
    Left = 600
    Top = 148
  end
  object q_UpdPayments: TOracleQuery
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    Left = 492
    Top = 176
  end
  object FormStorage1: TFormStorage
    Options = [fpPosition]
    UseRegistry = True
    StoredProps.Strings = (
      'e_BeginDate.Date'
      'e_EndDate.Date')
    StoredValues = <>
    Left = 600
    Top = 204
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = grid_pays
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
            Action = acPaymentEdit
            ImageIndex = 1
            ShortCut = 115
          end
          item
            Action = acPaymentNew
            ImageIndex = 0
            ShortCut = 45
          end
          item
            Action = acPaymentDelete
            ImageIndex = 5
          end
          item
            Action = acPaymentPrint
            ImageIndex = 6
            ShortCut = 16464
          end
          item
            Action = acPaymentOraToDBF
            Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' &DBF'
          end>
        AutoSize = False
      end>
    Images = f_main.img_Common
    Left = 572
    Top = 148
    StyleName = 'XP Style'
    object acPaymentNew: TAction
      Caption = #1053#1086#1074#1099#1081' '#1087#1083#1072#1090#1077#1078
      ImageIndex = 0
      ShortCut = 45
      OnExecute = acPaymentNewExecute
    end
    object acPaymentEdit: TAction
      Caption = #1055#1088#1072#1074#1082#1072' '#1087#1083#1072#1090#1077#1078#1072
      ImageIndex = 1
      ShortCut = 115
      OnExecute = acPaymentEditExecute
    end
    object acPaymentDelete: TAction
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
      ImageIndex = 5
      OnExecute = acPaymentDeleteExecute
    end
    object acPaymentPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099' '#1089' '#1090#1077#1082#1091#1097#1080#1084#1080' '#1087#1072#1088#1072#1084#1077#1090#1088#1072#1084#1080
      ImageIndex = 6
      ShortCut = 16464
      OnExecute = acPrintExecute
    end
    object acPaymentOraToDBF: TAction
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' DBF'
      OnExecute = ac_ToDBFExecute
    end
    object acPaymentFilter: TAction
      Category = 'FOR_ALL'
      ImageIndex = 3
      OnExecute = acPaymentFilterExecute
    end
    object acPaymentAllBills: TAction
      Category = 'FOR_ALL'
      Caption = #1042#1089#1077' '#1057#1060' '#1082#1083#1080#1077#1085#1090#1072'...'
      ImageIndex = 18
      OnExecute = acPaymentAllBillsExecute
    end
    object acPaymentCopy: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1083#1072#1090#1077#1078
      ImageIndex = 4
      OnExecute = acPaymentCopyExecute
    end
    object acPaymentSaveToXls: TAction
      Category = 'FOR_ALL'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' Excel'
      OnExecute = acPaymentSaveToXlsExecute
    end
    object acPaymentPayedBills: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1087#1083#1072#1095#1077#1085#1085#1099#1077' '#1089#1095#1077#1090#1072'...'
      ImageIndex = 18
      OnExecute = acPaymentPayedBillsExecute
    end
    object acPaymentUnPlacePeriod: TAction
      Caption = #1057#1085#1103#1090#1100' '#1086#1087#1083#1072#1090#1099' '#1079#1072' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
      OnExecute = acPaymentUnPlacePeriodExecute
    end
    object acPaymentPlace: TAction
      Caption = #1056#1072#1079#1085#1077#1089#1090#1080' '#1042#1067#1041#1056#1040#1053#1053#1059#1070' '#1086#1087#1083#1072#1090#1091
      OnExecute = acPaymentPlaceExecute
    end
    object acPaymentsPlace: TAction
      Caption = #1056#1072#1079#1085#1077#1089#1090#1080' '#1042#1057#1045' '#1086#1087#1083#1072#1090#1099
      OnExecute = acPaymentsPlaceExecute
    end
    object acPaymentUnPlace: TAction
      Caption = #1057#1085#1103#1090#1100' '#1088#1072#1079#1085#1077#1089#1077#1085#1080#1077' '#1089' '#1042#1067#1041#1056#1040#1053#1053#1054#1049' '#1086#1087#1083#1072#1090#1099
      OnExecute = acPaymentUnPlaceExecute
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 572
    Top = 120
  end
  object oraFOR_BILLS: TOraclePackage
    Session = f_main.ora_Session
    PackageName = 'FOR_BILLS'
    Left = 601
    Top = 232
  end
  object pm_grid: TTBPopupMenu
    Images = f_main.img_Common
    Left = 440
    Top = 216
    object TBItem48: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem2: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem2AcceptText
    end
    object TBItem49: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem49Click
    end
    object TBItem50: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem50Click
    end
    object TBSeparatorItem14: TTBSeparatorItem
    end
    object tbCallOutWinEdit: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = tbCallOutWinEditClick
    end
    object TBItem55: TTBItem
      Action = acPaymentNew
    end
    object TBItem56: TTBItem
      Action = acPaymentCopy
    end
    object TBItem57: TTBItem
      Action = acPaymentEdit
    end
    object TBItem58: TTBItem
      Action = acPaymentDelete
    end
    object TBItem64: TTBItem
      Action = acPaymentPlace
    end
    object TBItem9: TTBItem
      Action = acPaymentUnPlace
    end
    object TBItem65: TTBItem
      Action = acPaymentsPlace
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBSubmenuItem1: TTBSubmenuItem
      Caption = #1057#1074#1103#1079#1080
      object TBItem63: TTBItem
        Action = acPaymentPayedBills
      end
      object TBItem11: TTBItem
        Action = acPaymentAllBills
      end
    end
    object TBSeparatorItem9: TTBSeparatorItem
    end
    object TBItem38: TTBItem
      Action = acPaymentSaveToXls
    end
    object TBItem59: TTBItem
      Action = acPaymentPrint
    end
    object TBItem60: TTBItem
      Action = acPaymentOraToDBF
    end
  end
  object q_cmn: TOracleQuery
    Left = 492
    Top = 280
  end
  object oraSes: TOracleSession
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'BUH'
    Connected = True
    Left = 384
    Top = 168
  end
  object q_CheckPlat: TOracleDataSet
    SQL.Strings = (
      'SELECT a.date_post,a.num_plat,a.date_plat'
      #9'FROM V_PAYMENTS_UNUSED b, payments a'
      ' WHERE b.ID=a.ID'
      '   AND b.DOG_ID=:DOG_ID'
      '   AND b.DATE_POST<:DATE_POST'
      '   AND b.summa<>0')
    Variables.Data = {
      0300000002000000070000003A444F475F49440400000000000000000000000A
      0000003A444154455F504F53540C0000000000000000000000}
    Session = oraSes
    Left = 264
    Top = 304
  end
end
