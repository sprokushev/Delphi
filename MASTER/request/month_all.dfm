object frmMonthAll: TfrmMonthAll
  Left = 1417
  Top = 390
  Width = 905
  Height = 609
  Caption = #1047#1072#1082#1072#1079#1099' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1077#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 541
    Top = 6
    Width = 69
    Height = 13
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 52
    Width = 897
    Height = 143
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 27
      Top = 28
      Width = 50
      Height = 13
      Caption = #1055#1088#1086#1076#1091#1082#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 69
      Height = 13
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 29
      Top = 50
      Width = 48
      Height = 13
      Caption = #1060#1080#1083#1080#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 528
      Top = 8
      Width = 23
      Height = 13
      Caption = ' '#1087#1086' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 408
      Top = 8
      Width = 12
      Height = 13
      Caption = 'c '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 24
      Top = 97
      Width = 52
      Height = 13
      Caption = #1044#1086#1075#1086#1074#1086#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 9
      Top = 74
      Width = 67
      Height = 13
      Caption = #1053#1077#1092#1090#1077#1073#1072#1079#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbPredpr: TRxDBLookupCombo
      Left = 80
      Top = 3
      Width = 321
      Height = 21
      Hint = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      DropDownCount = 20
      DisplayEmpty = #1042#1089#1077'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'SHORT_NAME'
      LookupSource = dsPredpr
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object cbProd: TRxDBLookupCombo
      Left = 80
      Top = 25
      Width = 320
      Height = 21
      Hint = #1055#1088#1086#1076#1091#1082#1090
      DropDownCount = 12
      DisplayEmpty = #1042#1089#1077'>'
      EmptyValue = '0'
      LookupField = 'ID_NPR'
      LookupDisplay = 'NAME_NPR'
      LookupSource = dsProd
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object edDateTo: TDateTimePicker
      Left = 554
      Top = 5
      Width = 92
      Height = 21
      Hint = #1055#1086' '#1076#1072#1090#1091
      Date = 37839.826075081020000000
      Time = 37839.826075081020000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = edDateToChange
    end
    object edDateFrom: TDateTimePicker
      Left = 429
      Top = 4
      Width = 92
      Height = 21
      Hint = #1057' '#1076#1072#1090#1099
      Date = 37839.826075081020000000
      Time = 37839.826075081020000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnChange = edDateFromChange
    end
    object DBNavigator1: TDBNavigator
      Left = 560
      Top = 110
      Width = 150
      Height = 25
      DataSource = dsMonth
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
      Hints.Strings = (
        #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
        #1044#1086#1073#1072#1074#1080#1090#1100
        #1059#1076#1072#1083#1080#1090#1100
        #1048#1079#1084#1077#1085#1080#1090#1100
        #1057#1086#1093#1088#1072#1085#1080#1090#1100
        #1054#1090#1084#1077#1085#1080#1090#1100
        #1054#1073#1085#1086#1074#1080#1090#1100)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
    object BitBtn1: TBitBtn
      Left = 720
      Top = 110
      Width = 113
      Height = 25
      Action = acRequestConsumerRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      WordWrap = True
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10001000100010001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C100010001000100010001000100010001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1000100010001F7C1F7C1F7C1F7C100010001000
        1F7C1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C10001000
        1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
        10001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
        10001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
        10001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
        10001F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C10001F7C10001000
        1F7C1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1000100010001000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000100010001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000100010001000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object cbOrgStru: TRxDBLookupCombo
      Left = 80
      Top = 47
      Width = 320
      Height = 21
      Hint = #1060#1080#1083#1080#1072#1083
      DropDownCount = 20
      DisplayEmpty = #1042#1089#1077'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = dsOrg_Stru
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = rbTransitGDClick
    end
    object BitBtn2: TBitBtn
      Left = 408
      Top = 30
      Width = 209
      Height = 24
      Action = acRequestConsumerCopy
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 12
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C00001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C0000
        1F7C1F7C1F7C000000000000000000000000007C007C007C007C007C007C007C
        00001F7C1F7C0000FF7FFF7FFF7FFF7F0000007C007C007C007C007C007C007C
        007C00001F7C0000FF7FFF7FFF7FFF7F0000007C007C007C007C007C007C007C
        007C007C00000000FF7F00000000FF7F0000007C007C007C007C007C007C007C
        007C00001F7C0000FF7FFF7FFF7FFF7F0000007C007C007C007C007C007C007C
        00001F7C1F7C0000FF7F00000000FF7FFF7FFF7FFF7FFF7F0000007C007C0000
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000007C00001F7C
        1F7C1F7C1F7C0000FF7F00000000FF7F0000000000000000000000001F7C1F7C
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7F0000FF7FFF7F00001F7C1F7C1F7C1F7C
        1F7C1F7C1F7C0000FF7F0000F75EFF7F0000FF7F00001F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7F000000001F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C0000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object rbTransitGD: TRadioButton
      Left = 8
      Top = 120
      Width = 137
      Height = 17
      Caption = #1046'/'#1076' '#1090#1088#1072#1085#1079#1080#1090' ('#1089' '#1059#1053#1055')'
      TabOrder = 7
      OnClick = rbTransitGDClick
    end
    object rbSAM: TRadioButton
      Left = 148
      Top = 120
      Width = 165
      Height = 17
      Caption = #1057#1072#1084#1086#1074#1099#1074#1086#1079' ('#1040#1074#1090#1086#1085#1072#1083#1080#1074', '#1053#1041')'
      TabOrder = 8
      OnClick = rbTransitGDClick
    end
    object ed_Dog: TEdit
      Left = 80
      Top = 93
      Width = 169
      Height = 21
      TabOrder = 4
      Text = '*'
    end
    object rbMB: TRadioButton
      Left = 320
      Top = 120
      Width = 81
      Height = 17
      Caption = #1052#1072#1089#1083#1086#1073#1072#1079#1072
      TabOrder = 9
      OnClick = rbTransitGDClick
    end
    object Button1: TButton
      Left = 626
      Top = 58
      Width = 207
      Height = 25
      Action = acRequestConsumerLoadParus
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1079#1072#1082#1072#1079#1099' '#1080' '#1087#1083#1072#1085' '#1080#1079' '#1055#1072#1088#1091#1089#1072
      TabOrder = 13
    end
    object BitBtn3: TBitBtn
      Left = 626
      Top = 30
      Width = 207
      Height = 25
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100' '#1080' '#1092#1072#1082#1090
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = BitBtn3Click
    end
    object Button2: TButton
      Left = 410
      Top = 58
      Width = 207
      Height = 25
      Action = acRequestConsumerLoadArh
      TabOrder = 15
    end
    object cbNeftebasa: TRxDBLookupCombo
      Left = 79
      Top = 71
      Width = 320
      Height = 21
      Hint = #1060#1080#1083#1080#1072#1083
      DropDownCount = 20
      DisplayEmpty = #1042#1089#1077'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = dsNeftebasa
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object rbAgentGD: TRadioButton
      Left = 408
      Top = 119
      Width = 137
      Height = 17
      Caption = #1040#1075#1077#1085#1090#1089#1082#1080#1081' '#1076#1086#1075#1086#1074#1086#1088
      TabOrder = 16
      OnClick = rbTransitGDClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 195
    Width = 897
    Height = 387
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object grMonth: TDBGridEh
      Left = 1
      Top = 1
      Width = 895
      Height = 300
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = dsMonth
      EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
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
      FrozenCols = 4
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
      ParentFont = False
      RowSizingAllowed = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnExit = grMonthExit
      OnGetCellParams = grMonthGetCellParams
      OnSortMarkingChanged = grMonthSortMarkingChanged
      Columns = <
        item
          Checkboxes = True
          DblClickNextVal = True
          EditButtons = <>
          FieldName = 'IS_WORK'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 39
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'IS_REQUESTED'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Title.TitleButton = True
          Width = 37
        end
        item
          EditButtons = <>
          FieldName = 'CLIENT_NUMBER'
          Footers = <>
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'INPUT_NUMBER'
          Footers = <>
          ReadOnly = True
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
          Width = 55
        end
        item
          EditButtons = <>
          FieldName = 'INPUT_DATE'
          Footers = <>
          ReadOnly = True
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'NOM_ZD'
          Footers = <>
          Width = 71
        end
        item
          Checkboxes = False
          EditButtons = <>
          FieldName = 'PLAT'
          Footers = <>
          LookupDisplayFields = 'short_name'
          ReadOnly = True
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
          Width = 161
        end
        item
          EditButtons = <>
          FieldName = 'PARUS_AGENT_NAME'
          Footers = <>
          ReadOnly = True
          Title.TitleButton = True
          Width = 240
        end
        item
          AlwaysShowEditButton = True
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'DOG'
          Footers = <>
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 114
        end
        item
          EditButtons = <>
          FieldName = 'PARUS_DOGOVOR'
          Footers = <>
          ReadOnly = True
          Title.TitleButton = True
          Width = 106
        end
        item
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'PROD'
          Footers = <>
          ReadOnly = True
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
          Width = 131
        end
        item
          EditButtons = <>
          FieldName = 'PARUS_MODIF_TAG'
          Footers = <>
          ReadOnly = True
          Title.TitleButton = True
          Width = 116
        end
        item
          EditButtons = <>
          FieldName = 'REQUEST'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'MON_VES'
          Footers = <>
          Visible = False
          Width = 52
        end
        item
          EditButtons = <>
          FieldName = 'EXECUTED'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
          Width = 73
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'EXIST_HIST'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Width = 34
        end
        item
          EditButtons = <>
          FieldName = 'STAN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Footers = <>
          ReadOnly = True
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'BEGIN_DATE'
          Footers = <>
          Width = 97
        end
        item
          EditButtons = <>
          FieldName = 'PRICE'
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'STATUS_ZAKAZ_NAME'
          Footers = <>
          Width = 155
        end
        item
          EditButtons = <>
          FieldName = 'ZAKAZ_OLD_NUM'
          Footers = <>
          Width = 190
        end
        item
          AlwaysShowEditButton = True
          EditButtons = <>
          FieldName = 'USLOPL'
          Footers = <>
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 104
        end
        item
          EditButtons = <>
          FieldName = 'STORE_NAME'
          Footers = <>
          Title.TitleButton = True
          Width = 173
        end
        item
          EditButtons = <>
          FieldName = 'ORGSTRU'
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
          Width = 171
        end
        item
          EditButtons = <>
          FieldName = 'D_PLAN'
          Footers = <>
          ReadOnly = True
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
          Width = 104
        end
        item
          AlwaysShowEditButton = True
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'POLUCH'
          Footers = <>
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
        end
        item
          EditButtons = <>
          FieldName = 'POLUCH_NAME'
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
        end
        item
          AlwaysShowEditButton = True
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'POTREB'
          Footers = <>
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
        end
        item
          EditButtons = <>
          FieldName = 'POTREB_NAME'
          Footers = <>
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'PRICH'
          Footers = <>
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'GR4'
          Footers = <>
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
          Width = 333
        end
        item
          AlwaysShowEditButton = True
          AutoDropDown = True
          DropDownBox.ColumnDefValues.EndEllipsis = True
          DropDownSpecRow.Visible = True
          EditButtons = <>
          FieldName = 'PAYFORM'
          Footers = <>
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
        end
        item
          AlwaysShowEditButton = True
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'LOAD'
          Footers = <>
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
        end
        item
          AlwaysShowEditButton = True
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'VETKA'
          Footers = <>
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 127
        end
        item
          AlwaysShowEditButton = True
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'PlanstruName'
          Footers = <>
          LookupDisplayFields = 'name'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 127
        end>
    end
    object gbInfo: TGroupBox
      Left = 1
      Top = 301
      Width = 895
      Height = 85
      Align = alBottom
      Caption = ' '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object lbDolgName: TLabel
        Left = 472
        Top = 32
        Width = 153
        Height = 13
        Caption = #1044#1077#1073#1080#1090#1086#1088#1089#1082#1072#1103' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbPlanNB: TLabel
        Left = 8
        Top = 32
        Width = 80
        Height = 13
        Caption = #1055#1083#1072#1085' '#1040#1047#1057' '#1080' '#1053#1041':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 16
        Width = 68
        Height = 13
        Caption = #1055#1086' '#1087#1088#1086#1076#1091#1082#1090#1091': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbPlanProdName: TLabel
        Left = 96
        Top = 16
        Width = 86
        Height = 13
        Caption = '<'#1053#1077#1080#1079#1074#1077#1089#1090#1085#1086'>'
      end
      object edPlanNB: TDBText
        Left = 89
        Top = 32
        Width = 80
        Height = 17
        DataField = 'PLAN_VES'
        DataSource = dsPlanNB
      end
      object lbDogKind: TLabel
        Left = 472
        Top = 16
        Width = 66
        Height = 13
        Caption = #1055#1086' '#1076#1086#1075#1086#1074#1086#1088#1091':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 640
        Top = 32
        Width = 185
        Height = 17
        DataField = 'SALDO'
        DataSource = dsSaldo
      end
      object lbDogovor: TLabel
        Left = 640
        Top = 16
        Width = 86
        Height = 13
        Caption = '<'#1053#1077#1080#1079#1074#1077#1089#1090#1085#1086'>'
      end
      object edPlanTRAN: TDBText
        Left = 232
        Top = 32
        Width = 81
        Height = 17
        DataField = 'PLAN_VES'
        DataSource = dsPlanTRAN
      end
      object Label14: TLabel
        Left = 472
        Top = 64
        Width = 122
        Height = 13
        Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080' '#1086#1090#1075#1088#1091#1078#1077#1085#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 640
        Top = 64
        Width = 97
        Height = 14
        DataField = 'FACT'
        DataSource = dsDogFact
      end
      object lbPlanTRAN: TLabel
        Left = 176
        Top = 32
        Width = 54
        Height = 13
        Caption = #1058#1056#1040#1053#1047#1048#1058':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 8
        Top = 48
        Width = 78
        Height = 13
        Caption = #1042#1089#1077#1075#1086' '#1079#1072#1082#1072#1079#1086#1074':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 96
        Top = 48
        Width = 81
        Height = 17
        DataField = 'ZAYV_ALL_PROD'
        DataSource = dsZayv
      end
      object Label13: TLabel
        Left = 184
        Top = 48
        Width = 103
        Height = 13
        Caption = #1047#1072#1082#1072#1079#1086#1074' '#1082' '#1086#1090#1075#1088#1091#1079#1082#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText6: TDBText
        Left = 336
        Top = 48
        Width = 81
        Height = 17
        DataField = 'ZAYV_WORK_PROD'
        DataSource = dsZayv
      end
      object Label15: TLabel
        Left = 472
        Top = 48
        Width = 78
        Height = 13
        Caption = #1042#1089#1077#1075#1086' '#1079#1072#1082#1072#1079#1086#1074':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText7: TDBText
        Left = 560
        Top = 48
        Width = 81
        Height = 17
        DataField = 'ZAYV_ALL_DOG'
        DataSource = dsZayv
      end
      object Label16: TLabel
        Left = 640
        Top = 48
        Width = 103
        Height = 13
        Caption = #1047#1072#1082#1072#1079#1086#1074' '#1082' '#1086#1090#1075#1088#1091#1079#1082#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText8: TDBText
        Left = 752
        Top = 48
        Width = 81
        Height = 17
        DataField = 'ZAYV_WORK_DOG'
        DataSource = dsZayv
      end
      object Label17: TLabel
        Left = 8
        Top = 64
        Width = 122
        Height = 13
        Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080' '#1086#1090#1075#1088#1091#1078#1077#1085#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText9: TDBText
        Left = 136
        Top = 64
        Width = 97
        Height = 14
        DataField = 'FACT'
        DataSource = dsProdFact
      end
      object lbPlanOther: TLabel
        Left = 312
        Top = 32
        Width = 67
        Height = 13
        Caption = #1055#1088#1086#1095#1080#1081' '#1087#1083#1072#1085':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edPlanOther: TDBText
        Left = 384
        Top = 32
        Width = 81
        Height = 17
        DataField = 'PLAN_VES'
        DataSource = dsPlanOther
      end
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 897
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
      Images = f_main.img_Common
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acRequestConsumerAdd
        DisplayMode = nbdmImageAndText
      end
      object TBItem8: TTBItem
        Action = acRequestConsumerAddOtgr
        DisplayMode = nbdmImageAndText
      end
      object TBItem5: TTBItem
        Action = acRequestConsumerEdit
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = acRequestConsumerReAddress
        DisplayMode = nbdmImageAndText
      end
      object TBItem9: TTBItem
        Action = acRequestConsumerCancel
        DisplayMode = nbdmImageAndText
      end
      object TBItem4: TTBItem
        Action = acRequestConsumerDel
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object TBDock2: TTBDock
    Left = 0
    Top = 26
    Width = 897
    Height = 26
    object TBToolbar2: TTBToolbar
      Left = 0
      Top = 0
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
      Images = f_main.img_Common
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TBItem19: TTBItem
        Action = acRequestConsumerExportXls
        DisplayMode = nbdmImageAndText
      end
      object TBItem20: TTBItem
        Action = acRequestConsumerToDbf
        DisplayMode = nbdmImageAndText
      end
      object TBItem6: TTBItem
        Action = acRequestWord
        DisplayMode = nbdmImageAndText
      end
      object TBItem18: TTBItem
        Action = acRequestConsumerPost
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acRequestConsumerHistory
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object oraSes: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'BUH'
    Left = 440
    Top = 192
  end
  object oraMonth_all: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ FIRST_ROWS*/'
      
        #9'   mon.input_date,mon.client_number,mon.client_date,mon.status_' +
        'zakaz_id,mon.input_number,mon.date_dog, mon.nom_zd,'
      
        '     mon.PARUS_AGENT_RN,mon.PARUS_AGENT_NAME,mon.PARUS_DOGOVOR, ' +
        'mon.mon_ves,mon.mon_kol,mon.kol,mon.speed_ves,mon.speed_kol,'
      
        '     mon.PARUS_NOMEN_RN,mon.PARUS_MODIF_RN,mon.PARUS_MODIF_NAME,' +
        'mon.PARUS_MODIF_TAG,'
      
        #9'   mon.request, mon.date_plan, mon.APPL_TAG, mon.is_work, mon.p' +
        'rich, mon.ID, mon.kls_dog_id, KLS_DOG.DOG_NUMBER,'
      
        '     TO_CHAR(mon.date_plan, '#39'Month YYYY'#39') AS d_plan, KLS_PROD.NO' +
        'RMOTGR,mon.BEGIN_DATE,mon.ZAKAZ_OLD_ID, DECODE(mon.ZAKAZ_OLD_ID,' +
        'NULL,'#39#39','#39#8470' '#39'||old_mon.input_number||'#39' '#1089#1090'.'#39'||old_stan.STAN_NAME) ' +
        'as ZAKAZ_OLD_NUM,'
      
        '     mon.ROWID, mon.kls_predpr_id, mon.kls_prod_id, mon.stan_id,' +
        'mon.usl_opl_id,mon.poluch_name,mon.potreb_name,'
      
        '     mon.gr4,mon.payform_id,mon.load_abbr, mon.poluch_id, mon.po' +
        'treb_id, mon.vetka_id,mon.price,mon.orgstru_id,mon.is_requested,' +
        'mon.executed,mon.kls_planstruid,mon.store_name,'
      
        '     NVL((SELECT DISTINCT 1 FROM month_all_row a where a.month_a' +
        'll_id=mon.id and a.status_zakaz_id>10),0) as EXIST_HIST'
      
        '  FROM MASTER.MONTH_ALL mon,KLS_DOG,KLS_PROD,MASTER.MONTH_ALL ol' +
        'd_mon, KLS_STAN old_stan'
      
        ' WHERE mon.KLS_DOG_ID=KLS_DOG.ID(+) AND mon.KLS_PROD_ID=KLS_PROD' +
        '.ID_NPR(+) AND mon.ZAKAZ_OLD_ID=old_mon.ID(+) AND old_mon.STAN_I' +
        'D=old_stan.ID(+)'
      '   AND 1=1'
      '   AND 1=1'
      '   AND 1=1'
      '   AND 1=1'
      '   AND 1=1'
      '   AND 1=1'
      '   AND 1=1'
      '   AND 1=1'
      '   AND 1=0'
      
        'ORDER BY mon.input_number DESC,mon.PARUS_AGENT_RN,mon.PARUS_AGEN' +
        'T_NAME,mon.PARUS_DOGOVOR,mon.PARUS_MODIF_TAG,mon.PARUS_MODIF_NAM' +
        'E'
      '')
    QBEDefinition.QBEFieldDefs = {
      030000003300000008000000444154455F444F47010000000007000000524551
      5545535401000000000A000000494E5055545F44415445010000000007000000
      49535F574F524B01000000000500000050524943480100000000020000004944
      01000000000A0000004B4C535F444F475F494401000000000D0000004B4C535F
      5052454450525F494401000000000B0000004B4C535F50524F445F4944010000
      000006000000445F504C414E01000000000C000000494E5055545F4E554D4245
      52010000000009000000444154455F504C414E01000000000300000047523401
      000000000A000000504159464F524D5F49440100000000070000005354414E5F
      49440100000000090000004C4F41445F41424252010000000009000000504F4C
      5543485F4944010000000009000000504F545245425F49440100000000080000
      005645544B415F494401000000000A00000055534C5F4F504C5F494401000000
      0005000000505249434501000000000A0000004F5247535452555F4944010000
      00000B000000504F4C5543485F4E414D4501000000000B000000504F54524542
      5F4E414D4501000000000A000000444F475F4E554D42455201000000000E0000
      0050415255535F4147454E545F524E01000000001000000050415255535F4147
      454E545F4E414D4501000000000D00000050415255535F444F474F564F520100
      0000000E00000050415255535F4E4F4D454E5F524E01000000000E0000005041
      5255535F4D4F4449465F524E01000000001000000050415255535F4D4F444946
      5F4E414D450100000000080000004150504C5F54414701000000000F00000050
      415255535F4D4F4449465F54414701000000000C00000049535F524551554553
      544544010000000008000000455845435554454401000000000E0000004B4C53
      5F504C414E53545255494401000000000A00000053544F52455F4E414D450100
      000000060000004E4F4D5F5A4401000000000D000000434C49454E545F4E554D
      42455201000000000F0000005354415455535F5A414B415A5F49440100000000
      0B000000434C49454E545F444154450100000000070000004D4F4E5F56455301
      00000000070000004D4F4E5F4B4F4C0100000000030000004B4F4C0100000000
      0900000053504545445F56455301000000000900000053504545445F4B4F4C01
      000000000A00000045584953545F484953540100000000080000004E4F524D4F
      54475201000000000A000000424547494E5F4441544501000000000C0000005A
      414B415A5F4F4C445F494401000000000D0000005A414B415A5F4F4C445F4E55
      4D0100000000}
    UniqueFields = 'ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'MASTER.month_all'
    Session = oraSes
    BeforePost = oraMonth_allBeforePost
    AfterScroll = oraMonth_allAfterScroll
    Left = 480
    Top = 184
    object oraMonth_allINPUT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'INPUT_DATE'
      Required = True
    end
    object oraMonth_allINPUT_NUMBER: TStringField
      DisplayLabel = #1042#1093'. '#1088#1077#1075'. '#8470
      FieldName = 'INPUT_NUMBER'
    end
    object oraMonth_allDATE_DOG: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1075'.'
      FieldName = 'DATE_DOG'
    end
    object oraMonth_allREQUEST: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086
      FieldName = 'REQUEST'
      Required = True
      DisplayFormat = '#0.000'
    end
    object oraMonth_allDATE_PLAN: TDateTimeField
      DisplayLabel = #1055#1083#1072#1085#1086#1074#1099#1081' '#1084#1077#1089#1103#1094
      FieldName = 'DATE_PLAN'
      Required = True
    end
    object oraMonth_allIS_WORK: TFloatField
      DisplayLabel = #1054#1090#1075#1088#1091'- '#1079#1080#1090#1100
      FieldName = 'IS_WORK'
    end
    object oraMonth_allPRICH: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRICH'
      Size = 100
    end
    object oraMonth_allID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object oraMonth_allKLS_DOG_ID: TFloatField
      FieldName = 'KLS_DOG_ID'
    end
    object oraMonth_allD_PLAN: TStringField
      DisplayLabel = #1055#1077#1088#1080#1086#1076
      FieldName = 'D_PLAN'
      Size = 16
    end
    object oraMonth_allKLS_PREDPR_ID: TFloatField
      FieldName = 'KLS_PREDPR_ID'
    end
    object oraMonth_allKLS_PROD_ID: TFloatField
      FieldName = 'KLS_PROD_ID'
    end
    object oraMonth_allSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
    object oraMonth_allGR4: TStringField
      DisplayLabel = #1043#1088#1072#1092#1072' 4 \ '#1055#1088#1080#1095#1080#1085#1072
      FieldName = 'GR4'
      Size = 100
    end
    object oraMonth_allPAYFORM_ID: TFloatField
      FieldName = 'PAYFORM_ID'
    end
    object oraMonth_allLOAD_ABBR: TStringField
      FieldName = 'LOAD_ABBR'
      Size = 3
    end
    object oraMonth_allPOLUCH_ID: TFloatField
      FieldName = 'POLUCH_ID'
    end
    object oraMonth_allPOTREB_ID: TFloatField
      FieldName = 'POTREB_ID'
    end
    object oraMonth_allVETKA_ID: TFloatField
      FieldName = 'VETKA_ID'
    end
    object oraMonth_allPlat: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldKind = fkLookup
      FieldName = 'PLAT'
      LookupDataSet = oraPlat
      LookupKeyFields = 'ID'
      LookupResultField = 'SHORT_NAME'
      KeyFields = 'KLS_PREDPR_ID'
      Size = 40
      Lookup = True
    end
    object oraMonth_allDog: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldKind = fkLookup
      FieldName = 'DOG'
      LookupDataSet = oraKls_dog
      LookupKeyFields = 'ID;predpr_id'
      LookupResultField = 'DOG_NUMBER'
      KeyFields = 'KLS_DOG_ID;kls_predpr_id'
      Lookup = True
    end
    object oraMonth_allprod: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldKind = fkLookup
      FieldName = 'PROD'
      LookupDataSet = oraProd
      LookupKeyFields = 'ID_NPR'
      LookupResultField = 'NAME_NPR'
      KeyFields = 'KLS_PROD_ID'
      Lookup = True
    end
    object oraMonth_allStan: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103
      FieldKind = fkLookup
      FieldName = 'STAN'
      LookupDataSet = oraKls_stan
      LookupKeyFields = 'ID'
      LookupResultField = 'STAN_NAME'
      KeyFields = 'STAN_ID'
      Size = 30
      Lookup = True
    end
    object oraMonth_allPayForm: TStringField
      DisplayLabel = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
      FieldKind = fkLookup
      FieldName = 'PAYFORM'
      LookupDataSet = oraPayform
      LookupKeyFields = 'ID'
      LookupResultField = 'PAYFORM_NAME'
      KeyFields = 'PAYFORM_ID'
      Lookup = True
    end
    object oraMonth_allLoad: TStringField
      DisplayLabel = #1042#1080#1076' '#1086#1090#1075#1088#1091#1079#1082#1080
      DisplayWidth = 45
      FieldKind = fkLookup
      FieldName = 'LOAD'
      LookupDataSet = oraVidOtgr
      LookupKeyFields = 'LOAD_ABBR'
      LookupResultField = 'LOAD_NAME'
      KeyFields = 'LOAD_ABBR'
      Size = 45
      Lookup = True
    end
    object oraMonth_allpoluch: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'POLUCH'
      LookupDataSet = oraPoluch
      LookupKeyFields = 'ID'
      LookupResultField = 'SHORT_NAME'
      KeyFields = 'POLUCH_ID'
      Size = 40
      Lookup = True
    end
    object oraMonth_allpotreb: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'POTREB'
      LookupDataSet = oraPotreb
      LookupKeyFields = 'ID'
      LookupResultField = 'SHORT_NAME'
      KeyFields = 'POTREB_ID'
      Size = 40
      Lookup = True
    end
    object oraMonth_allvetka: TStringField
      DisplayLabel = #1042#1077#1090#1082#1072
      FieldKind = fkLookup
      FieldName = 'VETKA'
      LookupDataSet = oraVetka
      LookupKeyFields = 'ID'
      LookupResultField = 'VETKA_NAME'
      KeyFields = 'VETKA_ID'
      Size = 40
      Lookup = True
    end
    object oraMonth_allINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldKind = fkLookup
      FieldName = 'INN'
      LookupDataSet = oraPlat
      LookupKeyFields = 'ID'
      LookupResultField = 'INN'
      KeyFields = 'KLS_PREDPR_ID'
      Lookup = True
    end
    object oraMonth_allUSL_OPL_ID: TFloatField
      FieldName = 'USL_OPL_ID'
    end
    object oraMonth_allUslOpl: TStringField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1077' '#1086#1087#1083#1072#1090#1099
      FieldKind = fkLookup
      FieldName = 'USLOPL'
      LookupDataSet = oraUslOpl
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'USL_OPL_ID'
      Lookup = True
    end
    object oraMonth_allPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      DisplayFormat = '#0.00'
    end
    object oraMonth_allORGSTRU_ID: TFloatField
      FieldName = 'ORGSTRU_ID'
    end
    object oraMonth_allorgstru: TStringField
      DisplayLabel = #1055#1041#1045
      FieldKind = fkLookup
      FieldName = 'ORGSTRU'
      LookupDataSet = orgStru
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ORGSTRU_ID'
      Size = 30
      Lookup = True
    end
    object oraMonth_allPOLUCH_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100'?'
      FieldName = 'POLUCH_NAME'
      Size = 50
    end
    object oraMonth_allPOTREB_NAME: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'?'
      FieldName = 'POTREB_NAME'
      Size = 50
    end
    object oraMonth_allDOG_NUMBER: TStringField
      FieldName = 'DOG_NUMBER'
      Size = 30
    end
    object oraMonth_allPARUS_AGENT_RN: TFloatField
      FieldName = 'PARUS_AGENT_RN'
    end
    object oraMonth_allPARUS_AGENT_NAME: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'PARUS_AGENT_NAME'
      Size = 200
    end
    object oraMonth_allPARUS_DOGOVOR: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldName = 'PARUS_DOGOVOR'
      Size = 30
    end
    object oraMonth_allPARUS_NOMEN_RN: TFloatField
      FieldName = 'PARUS_NOMEN_RN'
    end
    object oraMonth_allPARUS_MODIF_RN: TFloatField
      FieldName = 'PARUS_MODIF_RN'
    end
    object oraMonth_allPARUS_MODIF_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'PARUS_MODIF_NAME'
      Size = 200
    end
    object oraMonth_allAPPL_TAG: TStringField
      FieldName = 'APPL_TAG'
      Size = 6
    end
    object oraMonth_allPARUS_MODIF_TAG: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'PARUS_MODIF_TAG'
    end
    object oraMonth_allIS_REQUESTED: TFloatField
      DisplayLabel = #1059#1090#1074#1077#1088'- '#1076#1080#1090#1100
      FieldName = 'IS_REQUESTED'
    end
    object oraMonth_allEXECUTED: TFloatField
      DisplayLabel = #1048#1089#1087#1086#1083'- '#1085#1077#1085#1086
      FieldName = 'EXECUTED'
      DisplayFormat = '##0.000'
    end
    object oraMonth_allKLS_PLANSTRUID: TFloatField
      FieldName = 'KLS_PLANSTRUID'
    end
    object oraMonth_allPlanStru: TStringField
      DisplayLabel = #1055#1086#1079'.'#1055#1083'.'#1055#1086#1089#1090'.'
      FieldKind = fkLookup
      FieldName = 'PlanstruName'
      LookupDataSet = oraPlanStru
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'KLS_PLANSTRUID'
      Size = 60
      Lookup = True
    end
    object oraMonth_allSTORE_NAME: TStringField
      DisplayLabel = #1053#1077#1092#1090#1077#1073#1072#1079#1072
      FieldName = 'STORE_NAME'
      Size = 50
    end
    object oraMonth_allNOM_ZD: TStringField
      DisplayLabel = #1047#1072#1103#1074#1082#1080' '#1080#1079' '#1060#1048#1053#1040#1053#1057#1054#1042
      FieldName = 'NOM_ZD'
      Size = 150
    end
    object oraMonth_allCLIENT_NUMBER: TStringField
      DisplayLabel = #1048#1089#1093'. '#8470' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'CLIENT_NUMBER'
      Size = 50
    end
    object oraMonth_allSTATUS_ZAKAZ_ID: TFloatField
      FieldName = 'STATUS_ZAKAZ_ID'
      Required = True
    end
    object oraMonth_allSTATUS_ZAKAZ_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
      FieldKind = fkLookup
      FieldName = 'STATUS_ZAKAZ_NAME'
      LookupDataSet = q_status_zakaz
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'STATUS_ZAKAZ_ID'
      Size = 30
      Lookup = True
    end
    object oraMonth_allCLIENT_DATE: TDateTimeField
      FieldName = 'CLIENT_DATE'
    end
    object oraMonth_allMON_VES: TFloatField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077
      FieldName = 'MON_VES'
    end
    object oraMonth_allMON_KOL: TFloatField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077', '#1074#1094
      FieldName = 'MON_KOL'
    end
    object oraMonth_allKOL: TFloatField
      FieldName = 'KOL'
      Required = True
    end
    object oraMonth_allSPEED_VES: TFloatField
      FieldName = 'SPEED_VES'
      Required = True
    end
    object oraMonth_allSPEED_KOL: TFloatField
      FieldName = 'SPEED_KOL'
      Required = True
    end
    object oraMonth_allEXIST_HIST: TFloatField
      DisplayLabel = #1045#1089#1090#1100' '#1080#1089#1090#1086'- '#1088#1080#1103
      FieldName = 'EXIST_HIST'
      ReadOnly = True
    end
    object oraMonth_allNORMOTGR: TFloatField
      FieldName = 'NORMOTGR'
    end
    object oraMonth_allBEGIN_DATE: TDateTimeField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1089' '#1076#1072#1090#1099
      FieldName = 'BEGIN_DATE'
    end
    object oraMonth_allZAKAZ_OLD_ID: TFloatField
      FieldName = 'ZAKAZ_OLD_ID'
    end
    object oraMonth_allZAKAZ_OLD_NUM: TStringField
      DisplayLabel = #1055#1077#1088#1077#1072#1076#1088#1077#1089#1086#1074#1072#1085#1085#1099#1081' '#1079#1072#1082#1072#1079
      FieldName = 'ZAKAZ_OLD_NUM'
      Size = 106
    end
    object oraMonth_allKST: TStringField
      FieldKind = fkLookup
      FieldName = 'KST'
      LookupDataSet = oraKls_stan
      LookupKeyFields = 'ID'
      LookupResultField = 'STAN_KOD'
      KeyFields = 'STAN_ID'
      Lookup = True
    end
    object oraMonth_allOKPO: TStringField
      FieldKind = fkLookup
      FieldName = 'OKPO'
      LookupDataSet = oraPotreb
      LookupKeyFields = 'ID'
      LookupResultField = 'OKPO'
      KeyFields = 'POTREB_ID'
      Lookup = True
    end
    object oraMonth_allGDKOD: TStringField
      FieldKind = fkLookup
      FieldName = 'GDKOD'
      LookupDataSet = oraPotreb
      LookupKeyFields = 'ID'
      LookupResultField = 'GD_KOD'
      KeyFields = 'POTREB_ID'
      Lookup = True
    end
    object oraMonth_allADDR_POTR: TStringField
      FieldKind = fkLookup
      FieldName = 'ADDR_POTR'
      LookupDataSet = oraPotreb
      LookupKeyFields = 'ID'
      LookupResultField = 'ADDR'
      KeyFields = 'POTREB_ID'
      Size = 150
      Lookup = True
    end
    object oraMonth_allPotreb_Full: TStringField
      FieldKind = fkLookup
      FieldName = 'Potreb_Full'
      LookupDataSet = oraPotreb
      LookupKeyFields = 'ID'
      LookupResultField = 'PREDPR_NAME'
      KeyFields = 'POTREB_ID'
      Size = 250
      Lookup = True
    end
    object oraMonth_allPlat_full: TStringField
      FieldKind = fkLookup
      FieldName = 'Plat_full'
      LookupDataSet = oraPlat
      LookupKeyFields = 'ID'
      LookupResultField = 'PREDPR_NAME'
      KeyFields = 'KLS_PREDPR_ID'
      Size = 250
      Lookup = True
    end
  end
  object dsMonth: TDataSource
    DataSet = oraMonth_all
    Left = 536
    Top = 184
  end
  object acManagerZakaz: TActionManager
    Images = f_main.img_Common
    Left = 600
    Top = 184
    StyleName = 'XP Style'
    object acRequestConsumerRefresh: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1079#1072#1082#1072#1079#1086#1074
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 11
      OnExecute = acRequestConsumerRefreshExecute
    end
    object acRequestConsumerAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
      ImageIndex = 20
      OnExecute = acRequestConsumerAddExecute
    end
    object acRequestConsumerAddOtgr: TAction
      Caption = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077' (+/-)'
      ImageIndex = 8
      OnExecute = acRequestConsumerAddOtgrExecute
    end
    object acRequestConsumerEdit: TAction
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1079#1072#1082#1072#1079#1072
      Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1079#1072#1082#1072#1079#1072
      ImageIndex = 8
      OnExecute = acRequestConsumerEditExecute
    end
    object acRequestConsumerReAddress: TAction
      Caption = #1055#1077#1088#1077#1072#1076#1088#1077#1089#1086#1074#1082#1072
      Hint = #1055#1077#1088#1077#1072#1076#1088#1077#1089#1086#1074#1082#1072
      ImageIndex = 8
      OnExecute = acRequestConsumerReAddressExecute
    end
    object acRequestConsumerCancel: TAction
      Caption = #1054#1090#1082#1072#1079' '#1082#1083#1080#1077#1085#1090#1072
      ImageIndex = 8
      OnExecute = acRequestConsumerCancelExecute
    end
    object acRequestConsumerDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079
      ImageIndex = 5
      OnExecute = acRequestConsumerDelExecute
    end
    object acRequestConsumerPost: TAction
      Category = 'FOR_ALL'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 13
      OnExecute = acRequestConsumerPostExecute
    end
    object acRequestConsumerExportXls: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' XLS'
      Hint = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' XLS'
      ImageIndex = 42
      OnExecute = acRequestConsumerExportXlsExecute
    end
    object acRequestConsumerLoadArh: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1079#1072#1082#1072#1079#1099' '#1040#1088#1093#1072#1085#1075#1077#1083#1100#1089#1082#1072
      OnExecute = acRequestConsumerLoadArhExecute
    end
    object acRequestConsumerCopy: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 38
      OnExecute = acRequestConsumerCopyExecute
    end
    object acRequestConsumerLoadParus: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1079#1072#1082#1072#1079#1099' '#1080#1079' '#1055#1072#1088#1091#1089#1072
      OnExecute = acRequestConsumerLoadParusExecute
    end
    object acRequestConsumerToDbf: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' DBF'
      ImageIndex = 43
      OnExecute = acRequestConsumerToDbfExecute
    end
    object acRequestConsumerFact: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100' '#1080' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1077
      OnExecute = acRequestConsumerFactExecute
    end
    object acRequestConsumerHistory: TAction
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1079#1072#1082#1072#1079#1072
      ImageIndex = 7
      OnExecute = acRequestConsumerHistoryExecute
    end
    object acRequestWord: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1079#1072#1103#1074#1082#1080
      ImageIndex = 44
      OnExecute = acRequestWordExecute
    end
  end
  object oraKls_predpr: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ORDERED*/'
      'distinct kls.ID, kls.short_name,kls.okpo'
      'FROM month_all m, kls_predpr kls'
      'where m.KLS_PREDPR_ID=kls.ID and m.parus_rn is null'
      '  AND 1=1'
      '  AND 1=1'
      'order by kls.short_name')
    QBEDefinition.QBEFieldDefs = {
      030000000300000002000000494401000000000A00000053484F52545F4E414D
      450100000000040000004F4B504F0100000000}
    DetailFields = 'id'
    Session = oraSes
    Left = 269
    Top = 210
  end
  object dsPredpr: TDataSource
    DataSet = oraKls_predpr
    Left = 301
    Top = 210
  end
  object oraKls_prod: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'DISTINCT kls_prod.id_npr, kls_prod.name_npr'
      'FROM MASTER.month_all m, MASTER.kls_prod kls_prod'
      'WHERE m.kls_prod_id = kls_prod.id_npr AND m.parus_rn is null'
      '  AND 1=1'
      '  AND 1=1'
      'ORDER BY kls_prod.name_npr ASC')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E50520100000000080000004E414D455F
      4E50520100000000}
    Session = oraSes
    Left = 269
    Top = 180
  end
  object dsProd: TDataSource
    DataSet = oraKls_prod
    Left = 301
    Top = 180
  end
  object oraPayform: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       payform_name'
      '  from kls_payform'
      'order by payform_name')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000C000000504159464F524D5F4E
      414D450100000000}
    Session = oraSes
    Left = 228
    Top = 167
  end
  object oraKls_dog: TOracleDataSet
    SQL.Strings = (
      'SELECT kls_dog.ID, kls_dog.dog_number,predpr_id'
      '  FROM  kls_dog'
      'order by  kls_dog.dog_number'
      ''
      ' ')
    QBEDefinition.QBEFieldDefs = {
      030000000300000002000000494401000000000A000000444F475F4E554D4245
      520100000000090000005052454450525F49440100000000}
    Session = oraSes
    Left = 173
    Top = 243
  end
  object oraPlat: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ALL_ROWS*/'
      #9'ID, short_name,inn,predpr_name'
      '  FROM kls_predpr WHERE is_block<>1'
      'order by short_name')
    QBEDefinition.QBEFieldDefs = {
      030000000400000002000000494401000000000A00000053484F52545F4E414D
      45010000000003000000494E4E01000000000B0000005052454450525F4E414D
      450100000000}
    Session = oraSes
    Left = 94
    Top = 205
  end
  object oraKls_stan: TOracleDataSet
    SQL.Strings = (
      'SELECT   kls_stan.ID, kls_stan.stan_name,kls_stan.stan_kod'
      '    FROM kls_stan kls_stan'
      'ORDER BY kls_stan.stan_name ASC')
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000090000005354414E5F4E414D45
      0100000000080000005354414E5F4B4F440100000000}
    Session = oraSes
    Left = 164
    Top = 170
  end
  object oraVidOtgr: TOracleDataSet
    SQL.Strings = (
      'select load_abbr,'
      '       load_name'
      '  from kls_vid_otgr'
      'order by load_name')
    QBEDefinition.QBEFieldDefs = {
      0300000002000000090000004C4F41445F414242520100000000090000004C4F
      41445F4E414D450100000000}
    Session = oraSes
    Left = 228
    Top = 200
  end
  object oraVetka: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       vetka_name'
      '  from kls_vetka'
      'order by vetka_name')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A0000005645544B415F4E414D
      450100000000}
    Session = oraSes
    Left = 228
    Top = 222
  end
  object oraPotreb: TOracleDataSet
    SQL.Strings = (
      'select id,'
      
        '       short_name,okpo,gd_kod,postindex_j||'#39', '#39'||city_j||'#39', '#39'||a' +
        'ddress_j as addr, predpr_name'
      '  from kls_predpr WHERE is_block<>1'
      'order by short_name')
    QBEDefinition.QBEFieldDefs = {
      030000000600000002000000494401000000000A00000053484F52545F4E414D
      450100000000040000004F4B504F01000000000600000047445F4B4F44010000
      0000040000004144445201000000000B0000005052454450525F4E414D450100
      000000}
    Session = oraSes
    Left = 228
    Top = 253
  end
  object oraPoluch: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       short_name'
      '  from kls_predpr WHERE is_block<>1'
      'order by short_name'
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A00000053484F52545F4E414D
      450100000000}
    Session = oraSes
    Left = 228
    Top = 282
  end
  object oraProd: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_PROD'
      'WHERE EXISTS '
      '(SELECT NULL '
      '  FROM KLS_PROD_GROUPS_DESC A, KLS_PROD_GROUPS B '
      ' WHERE A.PROD_GROUPS_ID=B.ID'
      '   AND B.PROD_TYPE_GRP_ID =4'
      '   AND A.PROD_ID_NPR=KLS_PROD.ID_NPR'
      '   )'
      'order by Name_npr'
      '')
    QBEDefinition.QBEFieldDefs = {
      03000000200000000600000049445F4E50520100000000080000004E414D455F
      4E505201000000000B00000049445F4B494E445F4E505201000000000C000000
      49445F47524F55505F4E505201000000000D0000004C4F4E475F4E414D455F4E
      5052010000000008000000414242525F4E505201000000000200000049440100
      0000000B000000464C475F414C4C4F574544010000000008000000474F53545F
      4E505201000000000A00000047445F4B4F445F4E505201000000000B00000047
      445F4E414D455F4E50520100000000060000004B4F445F313001000000000800
      00004B4F445F4F4B445001000000000B0000004B4F445F4641535F4D534B0100
      0000000500000045445F495A0100000000080000004E4F524D4F544752010000
      0000070000004641534F564B41010000000007000000564F4C5F464153010000
      000009000000444F525F4E414C4F47010000000005000000414B43495A010000
      00000B00000050524F445F4E41525F494401000000000C00000050524F445F50
      4C414E5F494401000000000C00000050524F445F475531325F49440100000000
      0A0000004D4F535F4752505F494401000000000D000000415A435F50525F4752
      505F494401000000000F00000049445F47524F55505F4E50525F474401000000
      000B0000004156475F464143545F504C01000000000700000053465F4E414D45
      01000000000C0000004B5353535F50524F445F49440100000000050000004D41
      544E52010000000006000000554E505F4944010000000006000000414E414C49
      540100000000}
    Session = oraSes
    Left = 228
    Top = 313
  end
  object oraUslOpl: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       name'
      '  from kls_usl_opl'
      'order by kol_dn,name')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = oraSes
    Left = 231
    Top = 340
  end
  object oraOrg_Stru: TOracleDataSet
    SQL.Strings = (
      '-- '#1060#1080#1083#1080#1072#1083#1099
      'SELECT * FROM ORG_STRUCTURE WHERE PLAN_REAL<>0'
      'ORDER BY plan_real')
    QBEDefinition.QBEFieldDefs = {
      030000000F000000020000004944010000000006000000414452455353010000
      0000040000004E4F54450100000000040000004E414D4501000000000B000000
      4F52475F4B494E445F49440100000000090000005052454450525F4944010000
      00000B0000004F52475F545950455F494401000000000600000046494C49414C
      010000000008000000574F524B53484F50010000000003000000494E4E010000
      00000C00000049535F4155544F5F4B4F4E53010000000009000000504C414E5F
      5245414C010000000010000000434954595F5052454649585F46494C45010000
      00000C00000049535F4155544F5F4C494E4B01000000000B000000434954595F
      494E5F584C530100000000}
    Session = oraSes
    Left = 270
    Top = 239
  end
  object dsOrg_Stru: TDataSource
    DataSet = oraOrg_Stru
    Left = 305
    Top = 239
  end
  object orgStru: TOracleDataSet
    SQL.Strings = (
      '-- '#1060#1080#1083#1080#1072#1083#1099
      'SELECT * FROM ORG_STRUCTURE WHERE PLAN_REAL<>0'
      'ORDER BY PLAN_REAL')
    QBEDefinition.QBEFieldDefs = {
      0300000025000000020000004944010000000006000000414452455353010000
      0000040000004E4F54450100000000040000004E414D4501000000000B000000
      4F52475F4B494E445F49440100000000090000005052454450525F4944010000
      00000B0000004F52475F545950455F494401000000000600000046494C49414C
      010000000008000000574F524B53484F50010000000003000000494E4E010000
      00000C00000049535F4155544F5F4B4F4E53010000000009000000504C414E5F
      5245414C010000000010000000434954595F5052454649585F46494C45010000
      00000C00000049535F4155544F5F4C494E4B01000000000B000000434954595F
      494E5F584C5301000000000900000046554C4C5F4E414D4501000000000E0000
      0050415255535F43524E5F4155544F01000000000D00000050415255535F4352
      4E5F4B4E5401000000001000000050415255535F4445504152544D454E540100
      0000001200000050415255535F504C414E5F415A435F44455001000000001300
      000050415255535F504C414E5F4155544F5F4445500100000000110000005041
      5255535F504C414E5F4D425F44455001000000001300000050415255535F504C
      414E5F5452414E5F44455001000000001400000050415255535F504C414E5F41
      5A435F4445505F3201000000001500000050415255535F504C414E5F4155544F
      5F4445505F3201000000001500000050415255535F504C414E5F5452414E5F44
      45505F3201000000000400000041424252010000000004000000524153540100
      000000090000005452414E535F4F52470100000000070000004E4F5F574F524B
      01000000000700000049535F4155544F01000000001400000049535F4155544F
      5F464F525F444953505F415A530100000000130000004C4F41445F4E414C4956
      5F46524F4D5F584C530100000000150000004C4F41445F4E414C49565F46524F
      4D5F50415255530100000000110000004C4F41445F4641535F46524F4D5F584C
      530100000000130000004C4F41445F4641535F46524F4D5F5041525553010000
      0000070000004B5353535F49440100000000}
    Session = oraSes
    Left = 230
    Top = 367
  end
  object oraPlanOther: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  SUM (Plan_ves) AS plan_ves'
      'FROM Plan_post,'
      '     v_Kls_planstru_snp,'
      '     Plan_periods,'
      '    (SELECT link_id_npr'
      '       FROM v_prod_linked_grp_4'
      '      WHERE fact_id_npr = :Kls_prod_id) Prods'
      'WHERE Plan_post.Planstru_id = v_Kls_planstru_snp.ID'
      '  AND Plan_post.Plan_per_id = Plan_periods.ID'
      
        '  AND Plan_post.Plan_id = 1                       -- '#1056#1072#1073#1086#1095#1080#1081' '#1087#1083#1072 +
        #1085
      
        '  AND v_Kls_planstru_snp.Tip_real_id <> 0 -- '#1055#1083#1072#1085' '#1087#1086' '#1051#1059#1050#1054#1049#1051'-'#1057#1053#1055' ' +
        #1073#1077#1079' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1085#1072' '#1093#1088#1072#1085#1077#1085#1080#1077
      '  AND Plan_periods.Date_plan = :Date_plan'
      
        '  AND DECODE (v_Kls_planstru_snp.Region_id, 21, 40, 31) = :Orgst' +
        'ru_id'
      '  AND Prod_id_npr = Prods.Link_Id_npr'
      '  AND v_Kls_planstru_snp.Parent_id<>218'
      '')
    Variables.Data = {
      03000000030000000A0000003A444154455F504C414E0C000000000000000000
      00000B0000003A4F5247535452555F49440300000000000000000000000C0000
      003A4B4C535F50524F445F4944050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {030000000100000008000000504C414E5F5645530100000000}
    Master = oraMonth_all
    MasterFields = 'date_plan;orgstru_id;prod_id_npr'
    Session = oraSes
    Left = 40
    Top = 257
    object oraPlanOtherPLAN_VES: TFloatField
      FieldName = 'PLAN_VES'
      DisplayFormat = '#0.000 '#1090#1085
    end
  end
  object dsPlanOther: TDataSource
    DataSet = oraPlanOther
    Left = 120
    Top = 257
  end
  object oraPlanNB: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  SUM(plan_ves) as plan_ves'
      'FROM'
      '('
      'SELECT'
      '  -- '#1055#1083#1072#1085' '#1059#1053#1055
      '  Plan_periods.Date_plan,'
      '  Plan_post.Planstru_id,'
      '  plan_post.Prod_id_npr,'
      '  Plan_post.plan_ves'
      'FROM Plan_post,Plan_periods'
      'WHERE Plan_post.Plan_per_id = Plan_periods.ID'
      
        '  AND Plan_post.Plan_id = 1                       -- '#1056#1072#1073#1086#1095#1080#1081' '#1087#1083#1072 +
        #1085
      '  AND Plan_periods.Date_plan = :Date_plan'
      'UNION ALL'
      'SELECT'
      '  -- '#1055#1083#1072#1085' '#1074#1085#1077#1096#1085#1080#1093' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
      '  Plan_post_svod.Date_plan,'
      '  Plan_post_svod.Planstru_id,'
      '  plan_post_svod.Prod_id_npr,'
      '  Plan_post_svod.ves as plan_ves'
      'FROM Plan_post_svod'
      
        'WHERE Plan_post_svod.Supplier_id <>8  -- '#1042#1089#1077' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1080' '#1082#1088#1086#1084#1077' '#1051#1059 +
        #1050#1054#1049#1051'-'#1059#1053#1055
      '  AND Plan_post_svod.Date_plan = :Date_plan'
      ') PP,v_Kls_planstru_snp,'
      '('
      'SELECT Link_id_Npr'
      '   FROM v_prod_linked_grp_4'
      '  WHERE fact_id_npr = :Kls_prod_id'
      ') Prods'
      'WHERE PP.Planstru_id = v_Kls_planstru_snp.ID'
      
        '  AND v_Kls_planstru_snp.ID<>97 -- '#1055#1083#1072#1085' '#1087#1086' '#1051#1059#1050#1054#1049#1051'-'#1057#1053#1055' '#1073#1077#1079' '#1086#1090#1075#1088#1091#1079 +
        #1082#1080' '#1085#1072' '#1093#1088#1072#1085#1077#1085#1080#1077
      
        '  AND DECODE (v_Kls_planstru_SNP.Region_id, 21, 40, 31) = :Orgst' +
        'ru_id'
      '  AND PP.Prod_id_npr = Prods.Link_Id_npr'
      '  AND v_Kls_planstru_snp.Parent_id<>218'
      '  AND NVL(TIP_REAL_ID,0)=1'
      ''
      ''
      '')
    Variables.Data = {
      03000000030000000A0000003A444154455F504C414E0C000000070000007867
      0C01010101000000000C0000003A4B4C535F50524F445F494405000000000000
      00000000000B0000003A4F5247535452555F4944030000000400000025000000
      00000000}
    QBEDefinition.QBEFieldDefs = {030000000100000008000000504C414E5F5645530100000000}
    Master = oraMonth_all
    MasterFields = 'date_plan;orgstru_id;kls_prod_id'
    Session = oraSes
    Left = 40
    Top = 377
    object oraPlanNBPLAN_VES: TFloatField
      FieldName = 'PLAN_VES'
      DisplayFormat = '#0.000 '#1090#1085
    end
  end
  object dsPlanNB: TDataSource
    DataSet = oraPlanNB
    Left = 112
    Top = 377
  end
  object oraSaldo: TOracleDataSet
    SQL.Strings = (
      'SELECT saldo'
      'FROM V_MONTH_ALL_TMP_DOG_MASTER'
      'WHERE 1=0'
      '  AND 1=0'
      '')
    QBEDefinition.QBEFieldDefs = {03000000010000000500000053414C444F0100000000}
    Session = oraSes
    Left = 440
    Top = 305
    object oraSaldoSALDO: TFloatField
      FieldName = 'SALDO'
      Required = True
      DisplayFormat = '### ### ### ##0.00 '#1088#1091#1073'.'
    end
  end
  object dsSaldo: TDataSource
    DataSet = oraSaldo
    Left = 496
    Top = 305
  end
  object oraQIns: TOracleQuery
    SQL.Strings = (
      'INSERT INTO month_all'
      
        '            (APPL_TAG,kls_predpr_id, kls_dog_id, kls_prod_id, da' +
        'te_dog, request,'
      
        '             date_plan, stan_id, input_date, input_number, payfo' +
        'rm_id,'
      
        '             load_abbr, vetka_id, poluch_id, potreb_id,usl_opl_i' +
        'd,orgstru_id,price,'
      
        #9'           poluch_name,potreb_name,CLIENT_DATE,CLIENT_NUMBER,kl' +
        's_planstruid,status_zakaz_id,'
      
        '             is_agent,prich,gr4,KOL,SPEED_VES,SPEED_KOL,BEGIN_DA' +
        'TE'
      '            )'
      
        '     VALUES ('#39'MASTER'#39',:kls_predpr_id, :kls_dog_id, :kls_prod_id,' +
        ' :date_dog, :request,'
      
        '             :date_plan, :stan_id, TRUNC(:input_date), :input_nu' +
        'mber, :payform_id,'
      
        '             :load_abbr, :vetka_id, :poluch_id, :potreb_id,:usl_' +
        'opl_id,:orgstru_id,:price,'
      
        '           '#9' :poluch_name,:potreb_name,:CLIENT_DATE,:CLIENT_NUMB' +
        'ER,:kls_planstruid,:status_zakaz_id,'
      
        '             :is_agent,:prich,:gr4,:KOL,:SPEED_VES,:SPEED_KOL,:B' +
        'EGIN_DATE'
      '            )')
    Session = oraSes
    Variables.Data = {
      030000001E0000000E0000003A4B4C535F5052454450525F4944030000000000
      0000000000000B0000003A4B4C535F444F475F49440300000000000000000000
      000C0000003A4B4C535F50524F445F4944030000000000000000000000090000
      003A444154455F444F470C0000000000000000000000080000003A5245515545
      53540400000000000000000000000A0000003A444154455F504C414E0C000000
      0000000000000000080000003A5354414E5F4944030000000000000000000000
      0B0000003A494E5055545F444154450C00000000000000000000000D0000003A
      494E5055545F4E554D4245520500000000000000000000000B0000003A504159
      464F524D5F49440300000000000000000000000A0000003A4C4F41445F414242
      52050000000000000000000000090000003A5645544B415F4944030000000000
      0000000000000A0000003A504F4C5543485F4944030000000000000000000000
      0A0000003A504F545245425F49440300000000000000000000000B0000003A55
      534C5F4F504C5F49440300000000000000000000000B0000003A4F5247535452
      555F4944030000000000000000000000060000003A5052494345040000000000
      0000000000000C0000003A504F4C5543485F4E414D4505000000000000000000
      00000C0000003A504F545245425F4E414D450500000000000000000000000C00
      00003A434C49454E545F444154450C00000000000000000000000E0000003A43
      4C49454E545F4E554D4245520500000000000000000000000F0000003A4B4C53
      5F504C414E535452554944030000000000000000000000100000003A53544154
      55535F5A414B415A5F4944030000000000000000000000090000003A49535F41
      47454E54030000000000000000000000060000003A5052494348050000000000
      000000000000040000003A475234050000000000000000000000040000003A4B
      4F4C0300000000000000000000000A0000003A53504545445F56455304000000
      00000000000000000A0000003A53504545445F4B4F4C03000000000000000000
      00000B0000003A424547494E5F444154450C0000000000000000000000}
    Left = 38
    Top = 211
  end
  object oraPackage: TOraclePackage
    Session = oraSes
    PackageName = 'FOR_PARUS'
    Left = 480
    Top = 238
  end
  object oraPlanTRAN: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  SUM(Ves) AS plan_ves       -- '#1042#1077#1089' '#1074' '#1090#1086#1085#1085#1072#1093
      'FROM Plan_post_svod,'
      '     v_Kls_planstru_snp,'
      '    (SELECT Link_id_Npr'
      '       FROM v_prod_linked_grp_4'
      '      WHERE fact_id_npr = :Kls_prod_id) Prods'
      
        'WHERE Plan_post_svod.Supplier_id <>8  -- '#1042#1089#1077' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1080' '#1082#1088#1086#1084#1077' '#1051#1059 +
        #1050#1054#1049#1051'-'#1059#1053#1055
      '  AND Plan_post_svod.Planstru_id = v_Kls_planstru_snp.ID'
      '  AND Plan_post_svod.Date_plan = :Date_plan'
      
        '  AND v_Kls_planstru_snp.Tip_real_id <> 0 -- '#1055#1083#1072#1085' '#1087#1086' '#1051#1059#1050#1054#1049#1051'-'#1057#1053#1055' ' +
        #1073#1077#1079' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1085#1072' '#1093#1088#1072#1085#1077#1085#1080#1077
      
        '  AND DECODE (v_Kls_planstru_SNP.Region_id, 21, 40, 31) = :Orgst' +
        'ru_id'
      '  AND Prod_id_npr = Link_Id_npr'
      '  AND v_Kls_planstru_snp.Parent_id<>218'
      ''
      '')
    Variables.Data = {
      03000000030000000A0000003A444154455F504C414E0C000000000000000000
      00000B0000003A4F5247535452555F49440300000000000000000000000C0000
      003A4B4C535F50524F445F4944050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {030000000100000008000000504C414E5F5645530100000000}
    Master = oraMonth_all
    MasterFields = 'date_plan;orgstru_id;kls_prod_id'
    Session = oraSes
    Left = 40
    Top = 321
    object oraPlanTRANPLAN_VES: TFloatField
      FieldName = 'PLAN_VES'
      DisplayFormat = '#0.000 '#1090#1085
    end
  end
  object dsPlanTRAN: TDataSource
    DataSet = oraPlanTRAN
    Left = 112
    Top = 321
  end
  object oraPlanProd: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  Group_Name_Npr'
      'FROM V_Prod_Linked_Grp_4'
      'WHERE fact_Id_Npr = :Kls_prod_id'
      '')
    Variables.Data = {
      03000000010000000C0000003A4B4C535F50524F445F49440500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {03000000010000000E00000047524F55505F4E414D455F4E50520100000000}
    Master = oraMonth_all
    MasterFields = 'kls_prod_id'
    Session = oraSes
    Left = 440
    Top = 369
    object oraPlanProdGROUP_NAME_NPR: TStringField
      FieldName = 'GROUP_NAME_NPR'
      Required = True
      Size = 50
    end
  end
  object dsPlanProd: TDataSource
    DataSet = oraPlanProd
    Left = 496
    Top = 369
  end
  object oraDogFact: TOracleDataSet
    SQL.Strings = (
      'SELECT fact'
      'FROM V_MONTH_ALL_TMP_PRODDOG_MASTER'
      'WHERE 1=0'
      '  AND 1=0'
      '  AND 1=0'
      '')
    QBEDefinition.QBEFieldDefs = {030000000100000004000000464143540100000000}
    Session = oraSes
    Left = 560
    Top = 305
    object oraDogFactFACT: TFloatField
      FieldName = 'FACT'
      Required = True
      DisplayFormat = '#0.000 '#1090#1085
    end
  end
  object dsDogFact: TDataSource
    DataSet = oraDogFact
    Left = 616
    Top = 305
  end
  object oraProdFact: TOracleDataSet
    SQL.Strings = (
      'SELECT fact'
      'FROM V_MONTH_ALL_TMP_PROD_MASTER'
      'WHERE 1=0'
      '  AND 1=0'
      '')
    QBEDefinition.QBEFieldDefs = {030000000100000004000000464143540100000000}
    Session = oraSes
    Left = 560
    Top = 353
    object FloatField1: TFloatField
      FieldName = 'FACT'
      Required = True
      DisplayFormat = '#0.000 '#1090#1085
    end
  end
  object dsProdFact: TDataSource
    DataSet = oraProdFact
    Left = 616
    Top = 353
  end
  object oraZayv: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  SUM(REQUEST) as zayv_all_prod,'
      
        '  SUM(DECODE(IS_WORK+IS_REQUESTED,2,REQUEST,0)) as zayv_work_pro' +
        'd,'
      '  SUM(DECODE(KLS_DOG_ID,:KLS_DOG_ID,REQUEST,0)) as zayv_all_dog,'
      
        '  SUM(DECODE(KLS_DOG_ID,:KLS_DOG_ID,DECODE(IS_WORK+IS_REQUESTED,' +
        '2,REQUEST,0),0)) as zayv_work_dog'
      'FROM MONTH_ALL mon'
      'WHERE mon.date_plan>=:FromDate'
      '  AND mon.date_plan<=:ToDate'
      '  AND mon.orgstru_id=:ORGSTRU_ID'
      '  AND mon.KLS_PROD_ID=:KLS_PROD_ID')
    QBEDefinition.QBEFieldDefs = {
      03000000040000000D0000005A4159565F414C4C5F50524F4401000000000E00
      00005A4159565F574F524B5F50524F4401000000000C0000005A4159565F414C
      4C5F444F4701000000000D0000005A4159565F574F524B5F444F470100000000}
    Session = oraSes
    Left = 568
    Top = 233
    object oraZayvZAYV_ALL_PROD: TFloatField
      FieldName = 'ZAYV_ALL_PROD'
      DisplayFormat = '#0.000 '#1090#1085
    end
    object oraZayvZAYV_WORK_PROD: TFloatField
      FieldName = 'ZAYV_WORK_PROD'
      DisplayFormat = '#0.000 '#1090#1085
    end
    object oraZayvZAYV_ALL_DOG: TFloatField
      FieldName = 'ZAYV_ALL_DOG'
      DisplayFormat = '#0.000 '#1090#1085
    end
    object oraZayvZAYV_WORK_DOG: TFloatField
      FieldName = 'ZAYV_WORK_DOG'
      DisplayFormat = '#0.000 '#1090#1085
    end
  end
  object dsZayv: TDataSource
    DataSet = oraZayv
    Left = 624
    Top = 233
  end
  object oraPlanStru: TOracleDataSet
    SQL.Strings = (
      'Select id,name from v_plan_stru ')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = oraSes
    Left = 232
    Top = 414
    object oraPlanStruID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object oraPlanStruNAME: TStringField
      FieldName = 'NAME'
      Size = 156
    end
  end
  object TBPopupMenu1: TTBPopupMenu
    Left = 768
    Top = 224
    object TBItem11: TTBItem
      Action = acRequestConsumerExportXls
    end
    object TBItem12: TTBItem
      Action = acRequestConsumerToDbf
    end
  end
  object oraNeftebasa: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ORDERED*/'
      'distinct kls.ID, kls.short_name'
      'FROM month_all m, kls_predpr kls'
      'where m.KLS_PREDPR_ID=kls.ID and m.parus_rn is null'
      '  AND 1=1'
      '  AND 1=1'
      'order by kls.short_name')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A00000053484F52545F4E414D
      450100000000}
    DetailFields = 'id'
    Session = oraSes
    Left = 269
    Top = 282
  end
  object dsNeftebasa: TDataSource
    DataSet = oraNeftebasa
    Left = 301
    Top = 282
  end
  object q_status_zakaz: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,NAME2 as NAME  FROM kls_status_zakaz'
      'ORDER BY id')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = oraSes
    Left = 388
    Top = 234
  end
end
