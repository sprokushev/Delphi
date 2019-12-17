object f_Zakaz: Tf_Zakaz
  Left = 390
  Top = 172
  Width = 777
  Height = 537
  Caption = #1047#1072#1082#1072#1079#1099' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1077#1081
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 769
    Height = 30
    Align = alTop
    TabOrder = 0
    object Label6: TLabel
      Left = 7
      Top = 8
      Width = 56
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076' '#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 164
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
    object edDateFrom: TDateTimePicker
      Left = 71
      Top = 4
      Width = 92
      Height = 21
      Hint = #1057' '#1076#1072#1090#1099
      Date = 37839.826075081020000000
      Time = 37839.826075081020000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = edDateFromChange
    end
    object edDateTo: TDateTimePicker
      Left = 191
      Top = 5
      Width = 92
      Height = 21
      Hint = #1055#1086' '#1076#1072#1090#1091
      Date = 37839.826075081020000000
      Time = 37839.826075081020000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = edDateToChange
    end
    object btFilter: TButton
      Left = 288
      Top = 3
      Width = 73
      Height = 25
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100'...'
      TabOrder = 2
      OnClick = btFilterClick
    end
    object btRefresh: TBitBtn
      Left = 460
      Top = 3
      Width = 89
      Height = 25
      Action = acZakazRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
    object btClearFilter: TButton
      Left = 364
      Top = 3
      Width = 93
      Height = 25
      Caption = #1059#1073#1088#1072#1090#1100' '#1086#1090#1073#1086#1088
      TabOrder = 4
      OnClick = btClearFilterClick
    end
  end
  object PageControlZakaz: TPageControl
    Left = 0
    Top = 30
    Width = 769
    Height = 476
    ActivePage = tabPostav
    Align = alClient
    TabOrder = 1
    OnChange = PageControlZakazChange
    object tabPostav: TTabSheet
      Caption = #1054#1090#1075#1088#1091#1079#1082#1072' '#1089' '#1059#1053#1055' ('#1051#1059#1050#1054#1049#1051'-'#1057#1053#1055')'
      OnShow = tabPostavShow
      object Splitter2: TSplitter
        Left = 0
        Top = 242
        Width = 761
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        Beveled = True
      end
      object TBDock1: TTBDock
        Left = 0
        Top = 0
        Width = 761
        Height = 28
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
          object TBItem2: TTBItem
            Action = acRequestConsumerCopy
            DisplayMode = nbdmImageAndText
          end
          object TBItem5: TTBItem
            Action = acRequestConsumerEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem4: TTBItem
            Action = acRequestConsumerDel
            DisplayMode = nbdmImageAndText
          end
          object TBSeparatorItem3: TTBSeparatorItem
          end
          object TBItem14: TTBItem
            Action = acZakazReestrXls
            DisplayMode = nbdmImageAndText
          end
          object TBItem21: TTBItem
            Action = acRequestConsumerToDbf
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object PageControlPostav: TPageControl
        Left = 0
        Top = 245
        Width = 761
        Height = 184
        ActivePage = tabPostavHist
        Align = alBottom
        TabOrder = 1
        OnChange = PageControlPostavChange
        object tabPostavInfo: TTabSheet
          Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
          OnShow = tabPostavInfoShow
          object Panel1: TPanel
            Left = 353
            Top = 0
            Width = 400
            Height = 156
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 0
            object lbPostavDogKind: TLabel
              Left = 8
              Top = 8
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
            object lbPostavDogNum: TLabel
              Left = 97
              Top = 8
              Width = 86
              Height = 13
              Caption = '<'#1053#1077#1080#1079#1074#1077#1089#1090#1085#1086'>'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbPostavDolgName: TLabel
              Left = 8
              Top = 24
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
            object edPostavDolgSum: TDBText
              Left = 166
              Top = 24
              Width = 185
              Height = 17
              DataField = 'SALDO'
              DataSource = ds_PostavDolg
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 8
              Top = 56
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
            object edPostavDogZakaz: TDBText
              Left = 88
              Top = 56
              Width = 81
              Height = 17
              DataField = 'ZAYV_ALL_DOG'
              DataSource = ds_PostavFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 176
              Top = 56
              Width = 66
              Height = 13
              Caption = #1059#1090#1074#1077#1088#1078#1076#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edPostavDogUtv: TDBText
              Left = 248
              Top = 56
              Width = 81
              Height = 17
              DataField = 'ZAYV_ACCEPT_DOG'
              DataSource = ds_PostavFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 176
              Top = 72
              Width = 58
              Height = 13
              Caption = #1054#1090#1075#1088#1091#1078#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edPostavDogFact: TDBText
              Left = 248
              Top = 72
              Width = 97
              Height = 14
              DataField = 'ZAYV_FACT_DOG'
              DataSource = ds_PostavFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 353
            Height = 156
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 1
            object Label10: TLabel
              Left = 8
              Top = 8
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
            object lbPlanNB: TLabel
              Left = 8
              Top = 24
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
            object edPostavPlanNB: TDBText
              Left = 89
              Top = 24
              Width = 80
              Height = 17
              DataField = 'PLAN_NB'
              DataSource = ds_PostavPlan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbPlanTRAN: TLabel
              Left = 176
              Top = 24
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
            object edPostavPlanTRAN: TDBText
              Left = 232
              Top = 24
              Width = 81
              Height = 17
              DataField = 'PLAN_TRAN'
              DataSource = ds_PostavPlan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbPlanOther: TLabel
              Left = 8
              Top = 40
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
            object edPostavPlanOther: TDBText
              Left = 88
              Top = 40
              Width = 81
              Height = 17
              DataField = 'PLAN_OTHER'
              DataSource = ds_PostavPlan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edPostavProdUtv: TDBText
              Left = 248
              Top = 56
              Width = 81
              Height = 17
              DataField = 'ZAYV_ACCEPT_PROD'
              DataSource = ds_PostavFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 176
              Top = 56
              Width = 66
              Height = 13
              Caption = #1059#1090#1074#1077#1088#1078#1076#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edPostavProdZakaz: TDBText
              Left = 88
              Top = 56
              Width = 81
              Height = 17
              DataField = 'ZAYV_ALL_PROD'
              DataSource = ds_PostavFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 8
              Top = 56
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
            object Label17: TLabel
              Left = 176
              Top = 72
              Width = 58
              Height = 13
              Caption = #1054#1090#1075#1088#1091#1078#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edPostavProdFact: TDBText
              Left = 248
              Top = 72
              Width = 97
              Height = 14
              DataField = 'ZAYV_FACT_PROD'
              DataSource = ds_PostavFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 176
              Top = 40
              Width = 82
              Height = 13
              Caption = #1042#1085#1091#1090#1088#1080#1082#1086#1088#1087'.'#1058#1056'.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edPostavPlanVNCORTR: TDBText
              Left = 264
              Top = 40
              Width = 81
              Height = 17
              DataField = 'PLAN_VNCORPTR'
              DataSource = ds_PostavPlan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edPostavProdName: TDBText
              Left = 81
              Top = 8
              Width = 264
              Height = 17
              DataField = 'PROD_NAME'
              DataSource = ds_PostavFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object tabPostavHist: TTabSheet
          Caption = #1048#1089#1090#1086#1088#1080#1103' '#1079#1072#1082#1072#1079#1072
          ImageIndex = 1
          OnShow = tabPostavHistShow
          object TBDock2: TTBDock
            Left = 0
            Top = 0
            Width = 753
            Height = 28
            object TBToolbar2: TTBToolbar
              Left = 0
              Top = 0
              Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
              Images = f_main.img_Common
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              object TBItem53: TTBItem
                Action = acZakazHistWord
                DisplayMode = nbdmImageAndText
              end
              object TBSeparatorItem13: TTBSeparatorItem
              end
              object TBItem7: TTBItem
                Action = acZakazHistEdit
                DisplayMode = nbdmImageAndText
              end
              object TBItem51: TTBItem
                Action = acRequestConsumerAddOtgr
                DisplayMode = nbdmImageAndText
              end
              object TBItem10: TTBItem
                Action = acRequestConsumerReAddress
                DisplayMode = nbdmImageAndText
              end
              object TBItem45: TTBItem
                Action = acRequestConsumerReAddressAdd
                DisplayMode = nbdmImageAndText
              end
              object TBItem11: TTBItem
                Action = acRequestConsumerCancel
                DisplayMode = nbdmImageAndText
              end
              object TBItem44: TTBItem
                Action = acRequestConsumerCancelAdd
                DisplayMode = nbdmImageAndText
              end
              object TBItem12: TTBItem
                Action = acZakazHistDel
                DisplayMode = nbdmImageAndText
              end
            end
          end
          object gridPostavHist: TDBGridEh
            Left = 0
            Top = 28
            Width = 753
            Height = 128
            Align = alClient
            AllowedOperations = [alopUpdateEh]
            ColumnDefValues.Title.TitleButton = True
            DataSource = ds_PostavHist
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
            FrozenCols = 4
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghDialogFind]
            ParentFont = False
            PopupMenu = pmPostavHist
            ReadOnly = True
            SumList.Active = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            UseMultiTitle = True
            OnExit = gridPostavHistExit
            OnSortMarkingChanged = gridPostavHistSortMarkingChanged
            Columns = <
              item
                EditButtons = <>
                FieldName = 'SORTBY'
                Footer.ValueType = fvtCount
                Footers = <>
                Width = 31
              end
              item
                EditButtons = <>
                FieldName = 'CLIENT_NUMBER'
                Footers = <>
                Width = 69
              end
              item
                EditButtons = <>
                FieldName = 'INPUT_NUMBER'
                Footers = <>
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'STATUS_ZAKAZ_NAME'
                Footers = <>
                Width = 203
              end
              item
                EditButtons = <>
                FieldName = 'INPUT_DATE'
                Footers = <>
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'UNP_NUMBER'
                Footers = <>
                Width = 93
              end
              item
                EditButtons = <>
                FieldName = 'VES'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'KOL'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 45
              end
              item
                EditButtons = <>
                FieldName = 'NOM_ZD'
                Footers = <>
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'LOAD_VES'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'LOAD_KOL'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'FACT_VES'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 75
              end
              item
                EditButtons = <>
                FieldName = 'FACT_KOL'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 73
              end
              item
                EditButtons = <>
                FieldName = 'NAME_NPR'
                Footers = <>
                Width = 124
              end
              item
                EditButtons = <>
                FieldName = 'PRICE'
                Footers = <>
                Width = 57
              end
              item
                EditButtons = <>
                FieldName = 'SPEED_VES'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'SPEED_KOL'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 48
              end
              item
                EditButtons = <>
                FieldName = 'BEGIN_DATE'
                Footers = <>
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'GRAFIK'
                Footers = <>
                Width = 205
              end
              item
                EditButtons = <>
                FieldName = 'OLD_STAN_KOD'
                Footers = <>
                Width = 54
              end
              item
                EditButtons = <>
                FieldName = 'OLD_STAN_NAME'
                Footers = <>
                Width = 133
              end
              item
                EditButtons = <>
                FieldName = 'STAN_KOD'
                Footers = <>
                Width = 59
              end
              item
                EditButtons = <>
                FieldName = 'STAN_NAME'
                Footers = <>
                Width = 157
              end
              item
                EditButtons = <>
                FieldName = 'POLUCH_NAME'
                Footers = <>
                Width = 241
              end
              item
                EditButtons = <>
                FieldName = 'POLUCH_OKPO'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'POTREB_NAME'
                Footers = <>
                Width = 217
              end
              item
                EditButtons = <>
                FieldName = 'GU12_A_NUM'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'GU12_A_DATE'
                Footers = <>
                Width = 76
              end
              item
                EditButtons = <>
                FieldName = 'GU12_A_FROM_DATE'
                Footers = <>
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'ID'
                Footers = <>
              end>
          end
        end
      end
      object gridPostav: TDBGridEh
        Left = 0
        Top = 28
        Width = 761
        Height = 214
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        ColumnDefValues.Title.TitleButton = True
        DataSource = ds_Postav
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
        FrozenCols = 4
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghDialogFind]
        ParentFont = False
        PopupMenu = pmPostav
        SumList.Active = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnExit = gridPostavExit
        OnSortMarkingChanged = gridPostavSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #8470' '#1087'/'#1087
            Title.TitleButton = False
            Width = 32
            OnGetCellParams = gridPostavColumns0GetCellParams
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'IS_ACCEPT'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            ReadOnly = True
            Width = 32
          end
          item
            EditButtons = <>
            FieldName = 'CLIENT_NUMBER'
            Footers = <>
            ReadOnly = True
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'INPUT_NUMBER'
            Footers = <>
            ReadOnly = True
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'INPUT_DATE'
            Footers = <>
            ReadOnly = True
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'NOM_ZD_LIST'
            Footers = <>
            ReadOnly = True
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'PLAT_NAME'
            Footers = <>
            ReadOnly = True
            Width = 211
          end
          item
            EditButtons = <>
            FieldName = 'DOG_NUMBER'
            Footers = <>
            ReadOnly = True
            Width = 96
          end
          item
            EditButtons = <>
            FieldName = 'NAME_NPR'
            Footers = <>
            ReadOnly = True
            Width = 119
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'FACT_VES'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 71
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'EXIST_CANCEL'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            ReadOnly = True
            Width = 32
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'USL_OPL_NAME'
            Footers = <>
            ReadOnly = True
            Width = 121
          end
          item
            EditButtons = <>
            FieldName = 'PRICE_CLIENT'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'BEGIN_DATE'
            Footers = <>
            ReadOnly = True
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 39
          end
          item
            EditButtons = <>
            FieldName = 'FACT_KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'STAN_NAME'
            Footers = <>
            ReadOnly = True
            Width = 198
          end
          item
            EditButtons = <>
            FieldName = 'STAN_KOD'
            Footers = <>
            ReadOnly = True
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_NAME'
            Footers = <>
            ReadOnly = True
            Width = 206
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_OKPO'
            Footers = <>
            ReadOnly = True
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_GDKOD'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_KSSS'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_NAME'
            Footers = <>
            ReadOnly = True
            Width = 274
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_NAME_DOP'
            Footers = <>
            ReadOnly = True
            Width = 168
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_OKPO'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_GDKOD'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_KSSS'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NEFTEBASA'
            Footers = <>
            ReadOnly = True
            Width = 153
          end
          item
            EditButtons = <>
            FieldName = 'SPEED_VES'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'SPEED_KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'LOAD_VES'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'LOAD_KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'PRIM'
            Footers = <>
            ReadOnly = True
            Width = 345
          end
          item
            EditButtons = <>
            FieldName = 'GR4'
            Footers = <>
            ReadOnly = True
            Width = 288
          end
          item
            EditButtons = <>
            FieldName = 'D_PLAN'
            Footers = <>
            ReadOnly = True
            Width = 94
          end
          item
            EditButtons = <>
            FieldName = 'PLAT_INN'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'FILIAL_NAME'
            Footers = <>
            ReadOnly = True
            Width = 160
          end
          item
            EditButtons = <>
            FieldName = 'PAYFORM_NAME'
            Footers = <>
            ReadOnly = True
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'LOAD_NAME'
            Footers = <>
            ReadOnly = True
            Width = 149
          end
          item
            EditButtons = <>
            FieldName = 'VETKA_NAME'
            Footers = <>
            ReadOnly = True
            Width = 136
          end
          item
            EditButtons = <>
            FieldName = 'PLANSTRU_NAME'
            Footers = <>
            ReadOnly = True
            Width = 232
          end
          item
            EditButtons = <>
            FieldName = 'GOSPROG_NAME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'GP_NAPR_NAME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'LUK_DOG_NUMBER'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PERIOD_NAME'
            Footers = <>
            Width = 79
          end>
      end
      object sbPostav: TStatusBar
        Left = 0
        Top = 429
        Width = 761
        Height = 19
        Panels = <
          item
            Text = 'Ctrl+F - '#1055#1086#1080#1089#1082
            Width = 80
          end
          item
            Text = #1060#1080#1083#1100#1090#1088': '#1085#1077#1090
            Width = 400
          end>
      end
    end
    object tabAgent: TTabSheet
      Caption = #1054#1090#1075#1088#1091#1079#1082#1072' '#1089' '#1059#1053#1055' ('#1040#1075#1077#1085#1090#1089#1082#1080#1081' '#1076#1086#1075#1086#1074#1086#1088')'
      ImageIndex = 1
      OnShow = tabAgentShow
      object Splitter1: TSplitter
        Left = 0
        Top = 238
        Width = 761
        Height = 7
        Cursor = crVSplit
        Align = alBottom
        Beveled = True
      end
      object PageControlAgent: TPageControl
        Left = 0
        Top = 245
        Width = 761
        Height = 184
        ActivePage = tabAgentHist
        Align = alBottom
        TabOrder = 0
        OnChange = PageControlAgentChange
        object tabAgentInfo: TTabSheet
          Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
          OnShow = tabAgentInfoShow
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 353
            Height = 156
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 0
            object Label9: TLabel
              Left = 8
              Top = 8
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
            object Label14: TLabel
              Left = 8
              Top = 24
              Width = 79
              Height = 13
              Caption = #1055#1083#1072#1085' '#1087#1086#1089#1090#1072#1074#1086#1082':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edAgentPlanProd: TDBText
              Left = 97
              Top = 24
              Width = 80
              Height = 17
              DataField = 'PLAN_PROD'
              DataSource = ds_AgentPlan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edAgentProdUTV: TDBText
              Left = 248
              Top = 56
              Width = 81
              Height = 17
              DataField = 'ZAYV_ACCEPT_PROD'
              DataSource = ds_AgentFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 176
              Top = 56
              Width = 66
              Height = 13
              Caption = #1059#1090#1074#1077#1088#1078#1076#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edAgentProdZakaz: TDBText
              Left = 88
              Top = 56
              Width = 81
              Height = 17
              DataField = 'ZAYV_ALL_PROD'
              DataSource = ds_AgentFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 8
              Top = 56
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
            object Label20: TLabel
              Left = 176
              Top = 72
              Width = 58
              Height = 13
              Caption = #1054#1090#1075#1088#1091#1078#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edAgentProdFact: TDBText
              Left = 248
              Top = 72
              Width = 97
              Height = 14
              DataField = 'ZAYV_FACT_PROD'
              DataSource = ds_AgentFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edAgentProdName: TDBText
              Left = 81
              Top = 8
              Width = 264
              Height = 17
              DataField = 'PROD_NAME'
              DataSource = ds_AgentFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object Panel5: TPanel
            Left = 353
            Top = 0
            Width = 400
            Height = 156
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object lbAgentDogKind: TLabel
              Left = 8
              Top = 8
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
            object lbAgentDogNum: TLabel
              Left = 97
              Top = 8
              Width = 86
              Height = 13
              Caption = '<'#1053#1077#1080#1079#1074#1077#1089#1090#1085#1086'>'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 8
              Top = 56
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
            object edAgentDogZakaz: TDBText
              Left = 88
              Top = 56
              Width = 81
              Height = 17
              DataField = 'ZAYV_ALL_DOG'
              DataSource = ds_AgentFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label26: TLabel
              Left = 176
              Top = 56
              Width = 66
              Height = 13
              Caption = #1059#1090#1074#1077#1088#1078#1076#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edAgentDogUTV: TDBText
              Left = 248
              Top = 56
              Width = 81
              Height = 17
              DataField = 'ZAYV_ACCEPT_DOG'
              DataSource = ds_AgentFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label28: TLabel
              Left = 176
              Top = 72
              Width = 58
              Height = 13
              Caption = #1054#1090#1075#1088#1091#1078#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edAgentDogFact: TDBText
              Left = 248
              Top = 72
              Width = 97
              Height = 14
              DataField = 'ZAYV_FACT_DOG'
              DataSource = ds_AgentFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label1: TLabel
              Left = 8
              Top = 24
              Width = 79
              Height = 13
              Caption = #1055#1083#1072#1085' '#1087#1086#1089#1090#1072#1074#1086#1082':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edAgentPlanDog: TDBText
              Left = 97
              Top = 24
              Width = 80
              Height = 17
              DataField = 'PLAN_DOG'
              DataSource = ds_AgentPlan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object tabAgentHist: TTabSheet
          Caption = #1048#1089#1090#1086#1088#1080#1103' '#1079#1072#1082#1072#1079#1072
          ImageIndex = 1
          OnShow = tabAgentHistShow
          object TBDock3: TTBDock
            Left = 0
            Top = 0
            Width = 753
            Height = 28
            object TBToolbar3: TTBToolbar
              Left = 0
              Top = 0
              Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
              Images = f_main.img_Common
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              object TBItem54: TTBItem
                Action = acZakazHistWord
                DisplayMode = nbdmImageAndText
              end
              object TBSeparatorItem15: TTBSeparatorItem
              end
              object TBItem15: TTBItem
                Action = acZakazHistEdit
                DisplayMode = nbdmImageAndText
              end
              object TBItem52: TTBItem
                Action = acRequestConsumerAddOtgr
                DisplayMode = nbdmImageAndText
              end
              object TBItem16: TTBItem
                Action = acRequestConsumerReAddress
                DisplayMode = nbdmImageAndText
              end
              object TBItem46: TTBItem
                Action = acRequestConsumerReAddressAdd
                DisplayMode = nbdmImageAndText
              end
              object TBItem17: TTBItem
                Action = acRequestConsumerCancel
                DisplayMode = nbdmImageAndText
              end
              object TBItem47: TTBItem
                Action = acRequestConsumerCancelAdd
                DisplayMode = nbdmImageAndText
              end
              object TBItem18: TTBItem
                Action = acZakazHistDel
                DisplayMode = nbdmImageAndText
              end
            end
          end
          object gridAgentHist: TDBGridEh
            Left = 0
            Top = 26
            Width = 753
            Height = 130
            Align = alClient
            AllowedOperations = [alopUpdateEh]
            ColumnDefValues.Title.TitleButton = True
            DataSource = ds_AgentHist
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
            FrozenCols = 4
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghDialogFind]
            ParentFont = False
            PopupMenu = pmAgentHist
            ReadOnly = True
            SumList.Active = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            UseMultiTitle = True
            OnExit = gridAgentHistExit
            OnSortMarkingChanged = gridAgentHistSortMarkingChanged
            Columns = <
              item
                EditButtons = <>
                FieldName = 'SORTBY'
                Footer.ValueType = fvtCount
                Footers = <>
                Width = 31
              end
              item
                EditButtons = <>
                FieldName = 'CLIENT_NUMBER'
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = 'INPUT_NUMBER'
                Footers = <>
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'STATUS_ZAKAZ_NAME'
                Footers = <>
                Width = 203
              end
              item
                EditButtons = <>
                FieldName = 'INPUT_DATE'
                Footers = <>
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'VES'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'KOL'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 48
              end
              item
                EditButtons = <>
                FieldName = 'NOM_ZD'
                Footers = <>
                Width = 77
              end
              item
                EditButtons = <>
                FieldName = 'LOAD_VES'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'LOAD_KOL'
                Footer.ValueType = fvtSum
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'FACT_VES'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 71
              end
              item
                EditButtons = <>
                FieldName = 'FACT_KOL'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 74
              end
              item
                EditButtons = <>
                FieldName = 'NAME_NPR'
                Footers = <>
                Width = 124
              end
              item
                EditButtons = <>
                FieldName = 'PRICE'
                Footers = <>
                Width = 57
              end
              item
                EditButtons = <>
                FieldName = 'SPEED_VES'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 69
              end
              item
                EditButtons = <>
                FieldName = 'SPEED_KOL'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 57
              end
              item
                EditButtons = <>
                FieldName = 'BEGIN_DATE'
                Footers = <>
                Width = 72
              end
              item
                EditButtons = <>
                FieldName = 'GRAFIK'
                Footers = <>
                Width = 205
              end
              item
                EditButtons = <>
                FieldName = 'OLD_STAN_KOD'
                Footers = <>
                Width = 54
              end
              item
                EditButtons = <>
                FieldName = 'OLD_STAN_NAME'
                Footers = <>
                Width = 133
              end
              item
                EditButtons = <>
                FieldName = 'STAN_KOD'
                Footers = <>
                Width = 51
              end
              item
                EditButtons = <>
                FieldName = 'STAN_NAME'
                Footers = <>
                Width = 140
              end
              item
                EditButtons = <>
                FieldName = 'POLUCH_NAME'
                Footers = <>
                Width = 241
              end
              item
                EditButtons = <>
                FieldName = 'POLUCH_OKPO'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'POTREB_NAME'
                Footers = <>
                Width = 217
              end
              item
                EditButtons = <>
                FieldName = 'GU12_A_NUM'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'GU12_A_DATE'
                Footers = <>
                Width = 76
              end
              item
                EditButtons = <>
                FieldName = 'GU12_A_FROM_DATE'
                Footers = <>
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'ID'
                Footers = <>
              end>
          end
        end
      end
      object TBDock5: TTBDock
        Left = 0
        Top = 0
        Width = 761
        Height = 28
        object TBToolbar5: TTBToolbar
          Left = 0
          Top = 0
          Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
          Images = f_main.img_Common
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object TBItem25: TTBItem
            Action = acRequestConsumerAdd
            DisplayMode = nbdmImageAndText
          end
          object TBItem3: TTBItem
            Action = acRequestConsumerCopy
            DisplayMode = nbdmImageAndText
          end
          object TBItem27: TTBItem
            Action = acRequestConsumerEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem30: TTBItem
            Action = acRequestConsumerDel
            DisplayMode = nbdmImageAndText
          end
          object TBSeparatorItem1: TTBSeparatorItem
          end
          object TBItem6: TTBItem
            Action = acZakazReestrXls
            DisplayMode = nbdmImageAndText
          end
          object TBItem9: TTBItem
            Action = acRequestConsumerToDbf
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object gridAgent: TDBGridEh
        Left = 0
        Top = 28
        Width = 761
        Height = 210
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        ColumnDefValues.Title.TitleButton = True
        DataSource = ds_Agent
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
        FrozenCols = 4
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghDialogFind]
        ParentFont = False
        PopupMenu = pmAgent
        SumList.Active = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnExit = gridAgentExit
        OnSortMarkingChanged = gridAgentSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #8470' '#1087'/'#1087
            Title.TitleButton = False
            Width = 32
            OnGetCellParams = gridAgentColumns0GetCellParams
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'IS_ACCEPT'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            ReadOnly = True
            Width = 39
          end
          item
            EditButtons = <>
            FieldName = 'CLIENT_NUMBER'
            Footers = <>
            ReadOnly = True
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'INPUT_NUMBER'
            Footers = <>
            ReadOnly = True
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'INPUT_DATE'
            Footers = <>
            ReadOnly = True
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'NOM_ZD_LIST'
            Footers = <>
            ReadOnly = True
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'PLAT_NAME'
            Footers = <>
            ReadOnly = True
            Width = 211
          end
          item
            EditButtons = <>
            FieldName = 'DOG_NUMBER'
            Footers = <>
            ReadOnly = True
            Width = 96
          end
          item
            EditButtons = <>
            FieldName = 'NAME_NPR'
            Footers = <>
            ReadOnly = True
            Width = 121
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 84
          end
          item
            EditButtons = <>
            FieldName = 'FACT_VES'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 82
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'EXIST_CANCEL'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            ReadOnly = True
            Width = 32
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'USL_OPL_NAME'
            Footers = <>
            ReadOnly = True
            Width = 121
          end
          item
            EditButtons = <>
            FieldName = 'PRICE_CLIENT'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'BEGIN_DATE'
            Footers = <>
            ReadOnly = True
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 38
          end
          item
            EditButtons = <>
            FieldName = 'FACT_KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'STAN_NAME'
            Footers = <>
            ReadOnly = True
            Width = 202
          end
          item
            EditButtons = <>
            FieldName = 'STAN_KOD'
            Footers = <>
            ReadOnly = True
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_NAME'
            Footers = <>
            ReadOnly = True
            Width = 206
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_OKPO'
            Footers = <>
            ReadOnly = True
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_GDKOD'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_KSSS'
            Footers = <>
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_NAME'
            Footers = <>
            ReadOnly = True
            Width = 274
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_NAME_DOP'
            Footers = <>
            ReadOnly = True
            Width = 168
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_OKPO'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_GDKOD'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_KSSS'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NEFTEBASA'
            Footers = <>
            ReadOnly = True
            Width = 153
          end
          item
            EditButtons = <>
            FieldName = 'SPEED_VES'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'SPEED_KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'LOAD_VES'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'LOAD_KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'PRIM'
            Footers = <>
            ReadOnly = True
            Width = 345
          end
          item
            EditButtons = <>
            FieldName = 'GR4'
            Footers = <>
            ReadOnly = True
            Width = 288
          end
          item
            EditButtons = <>
            FieldName = 'D_PLAN'
            Footers = <>
            ReadOnly = True
            Width = 94
          end
          item
            EditButtons = <>
            FieldName = 'PLAT_INN'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'FILIAL_NAME'
            Footers = <>
            ReadOnly = True
            Width = 160
          end
          item
            EditButtons = <>
            FieldName = 'PAYFORM_NAME'
            Footers = <>
            ReadOnly = True
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'LOAD_NAME'
            Footers = <>
            ReadOnly = True
            Width = 149
          end
          item
            EditButtons = <>
            FieldName = 'VETKA_NAME'
            Footers = <>
            ReadOnly = True
            Width = 136
          end
          item
            EditButtons = <>
            FieldName = 'PLANSTRU_NAME'
            Footers = <>
            ReadOnly = True
            Width = 232
          end
          item
            EditButtons = <>
            FieldName = 'GOSPROG_NAME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'GP_NAPR_NAME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'LUK_DOG_NUMBER'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
          end>
      end
      object sbAgent: TStatusBar
        Left = 0
        Top = 429
        Width = 761
        Height = 19
        Panels = <
          item
            Text = 'Ctrl+F - '#1055#1086#1080#1089#1082
            Width = 80
          end
          item
            Text = #1060#1080#1083#1100#1090#1088': '#1085#1077#1090
            Width = 400
          end>
      end
    end
    object tabParus: TTabSheet
      Caption = #1054#1090#1075#1088#1091#1079#1082#1072' '#1089' '#1085#1077#1092#1090#1077#1073#1072#1079' ('#1055#1040#1056#1059#1057')'
      ImageIndex = 2
      OnShow = tabParusShow
      object Splitter3: TSplitter
        Left = 0
        Top = 298
        Width = 761
        Height = 7
        Cursor = crVSplit
        Align = alBottom
        Beveled = True
      end
      object PageControlParus: TPageControl
        Left = 0
        Top = 305
        Width = 761
        Height = 124
        ActivePage = tabParusInfo
        Align = alBottom
        TabOrder = 0
        OnChange = PageControlParusChange
        object tabParusInfo: TTabSheet
          Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
          OnShow = tabParusInfoShow
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 353
            Height = 96
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 0
            object Label23: TLabel
              Left = 8
              Top = 8
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
            object Label30: TLabel
              Left = 8
              Top = 24
              Width = 47
              Height = 13
              Caption = #1055#1083#1072#1085' '#1053#1041':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edParusPlanNB: TDBText
              Left = 89
              Top = 24
              Width = 80
              Height = 17
              DataField = 'PLAN_NB'
              DataSource = ds_ParusPlan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label31: TLabel
              Left = 176
              Top = 24
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
            object edParusPlanTRANSIT: TDBText
              Left = 232
              Top = 24
              Width = 81
              Height = 17
              DataField = 'PLAN_TRAN'
              DataSource = ds_ParusPlan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label32: TLabel
              Left = 8
              Top = 40
              Width = 53
              Height = 13
              Caption = #1055#1083#1072#1085' '#1040#1047#1057':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edParusPlanAZS: TDBText
              Left = 88
              Top = 40
              Width = 81
              Height = 17
              DataField = 'PLAN_AZS'
              DataSource = ds_ParusPlan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edParusProdUTV: TDBText
              Left = 248
              Top = 56
              Width = 81
              Height = 17
              DataField = 'ZAYV_ACCEPT_PROD'
              DataSource = ds_ParusFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label33: TLabel
              Left = 176
              Top = 56
              Width = 66
              Height = 13
              Caption = #1059#1090#1074#1077#1088#1078#1076#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edParusProdZakaz: TDBText
              Left = 88
              Top = 56
              Width = 81
              Height = 17
              DataField = 'ZAYV_ALL_PROD'
              DataSource = ds_ParusFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label34: TLabel
              Left = 8
              Top = 56
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
            object Label35: TLabel
              Left = 176
              Top = 72
              Width = 58
              Height = 13
              Caption = #1054#1090#1075#1088#1091#1078#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edParusProdFact: TDBText
              Left = 248
              Top = 72
              Width = 97
              Height = 14
              DataField = 'ZAYV_FACT_PROD'
              DataSource = ds_ParusFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label37: TLabel
              Left = 176
              Top = 40
              Width = 82
              Height = 13
              Caption = #1042#1085#1091#1090#1088#1080#1082#1086#1088#1087'.'#1058#1056'.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edParusPlanVNCORPTR: TDBText
              Left = 264
              Top = 40
              Width = 81
              Height = 17
              DataField = 'PLAN_VNCORPTR'
              DataSource = ds_ParusPlan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edParusProdName: TDBText
              Left = 81
              Top = 8
              Width = 264
              Height = 17
              DataField = 'PROD_NAME'
              DataSource = ds_ParusFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object Panel7: TPanel
            Left = 353
            Top = 0
            Width = 400
            Height = 96
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object lbParusDogKind: TLabel
              Left = 8
              Top = 8
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
            object lbParusDogNum: TLabel
              Left = 105
              Top = 8
              Width = 86
              Height = 13
              Caption = '<'#1053#1077#1080#1079#1074#1077#1089#1090#1085#1086'>'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbParusDolgName: TLabel
              Left = 8
              Top = 24
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
            object lbParusDolgSum: TDBText
              Left = 166
              Top = 24
              Width = 185
              Height = 17
              DataField = 'SALDO'
              DataSource = ds_ParusDolg
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label40: TLabel
              Left = 8
              Top = 56
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
            object edParusDogZakaz: TDBText
              Left = 88
              Top = 56
              Width = 81
              Height = 17
              DataField = 'ZAYV_ALL_DOG'
              DataSource = ds_ParusFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label41: TLabel
              Left = 176
              Top = 56
              Width = 66
              Height = 13
              Caption = #1059#1090#1074#1077#1088#1078#1076#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edParusDogUTV: TDBText
              Left = 248
              Top = 56
              Width = 81
              Height = 17
              DataField = 'ZAYV_ACCEPT_DOG'
              DataSource = ds_ParusFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label43: TLabel
              Left = 176
              Top = 72
              Width = 58
              Height = 13
              Caption = #1054#1090#1075#1088#1091#1078#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edParusDogFact: TDBText
              Left = 248
              Top = 72
              Width = 97
              Height = 14
              DataField = 'ZAYV_FACT_DOG'
              DataSource = ds_ParusFact
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
      end
      object TBDock6: TTBDock
        Left = 0
        Top = 0
        Width = 761
        Height = 28
        object TBToolbar6: TTBToolbar
          Left = 0
          Top = 0
          Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
          Images = f_main.img_Common
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object TBItem19: TTBItem
            Action = acRequestConsumerLoadArh
          end
          object TBItem20: TTBItem
            Action = acRequestConsumerLoadParus
          end
          object TBSeparatorItem5: TTBSeparatorItem
          end
          object TBItem22: TTBItem
            Action = acZakazReestrXls
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object sbParus: TStatusBar
        Left = 0
        Top = 429
        Width = 761
        Height = 19
        Panels = <
          item
            Text = 'Ctrl+F - '#1055#1086#1080#1089#1082
            Width = 80
          end
          item
            Text = #1060#1080#1083#1100#1090#1088': '#1085#1077#1090
            Width = 400
          end>
      end
      object gridParus: TDBGridEh
        Left = 0
        Top = 28
        Width = 761
        Height = 270
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        ColumnDefValues.Title.TitleButton = True
        DataSource = ds_Parus
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
        FrozenCols = 4
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghDialogFind]
        ParentFont = False
        PopupMenu = pmParus
        SumList.Active = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnExit = gridParusExit
        OnSortMarkingChanged = gridParusSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #8470' '#1087'/'#1087
            Title.TitleButton = False
            Width = 32
            OnGetCellParams = gridParusColumns0GetCellParams
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'IS_ACCEPT'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            ReadOnly = True
            Width = 32
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'IS_WORK'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            ReadOnly = True
            Width = 33
          end
          item
            EditButtons = <>
            FieldName = 'INPUT_NUMBER'
            Footers = <>
            ReadOnly = True
            Width = 101
          end
          item
            EditButtons = <>
            FieldName = 'INPUT_DATE'
            Footers = <>
            ReadOnly = True
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'PARUS_AGENT_NAME'
            Footers = <>
            ReadOnly = True
            Width = 134
          end
          item
            EditButtons = <>
            FieldName = 'PARUS_DOGOVOR'
            Footers = <>
            ReadOnly = True
            Width = 91
          end
          item
            EditButtons = <>
            FieldName = 'PARUS_NOMEN_NAME'
            Footers = <>
            ReadOnly = True
            Width = 251
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'FACT_VES'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'USL_OPL_NAME'
            Footers = <>
            ReadOnly = True
            Width = 121
          end
          item
            EditButtons = <>
            FieldName = 'PRICE_CLIENT'
            Footers = <>
            ReadOnly = True
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_NAME'
            Footers = <>
            ReadOnly = True
            Width = 206
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_NAME'
            Footers = <>
            ReadOnly = True
            Width = 168
          end
          item
            EditButtons = <>
            FieldName = 'NEFTEBASA'
            Footers = <>
            ReadOnly = True
            Width = 153
          end
          item
            EditButtons = <>
            FieldName = 'PRIM'
            Footers = <>
            ReadOnly = True
            Width = 345
          end
          item
            EditButtons = <>
            FieldName = 'D_PLAN'
            Footers = <>
            ReadOnly = True
            Width = 94
          end
          item
            EditButtons = <>
            FieldName = 'FILIAL_NAME'
            Footers = <>
            ReadOnly = True
            Width = 160
          end>
      end
    end
  end
  object acManagerZakaz: TActionManager
    Images = f_main.img_Common
    Left = 392
    Top = 248
    StyleName = 'XP Style'
    object acZakazRefresh: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1079#1072#1082#1072#1079#1086#1074
      ImageIndex = 11
      OnExecute = acZakazRefreshExecute
    end
    object acRequestConsumerAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
      ImageIndex = 0
      OnExecute = acRequestConsumerAddExecute
    end
    object acRequestConsumerCopy: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      OnExecute = acRequestConsumerCopyExecute
    end
    object acZakazHistWord: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100' '#1079#1072#1103#1074#1082#1080' (Word)'
      ImageIndex = 6
      OnExecute = acZakazHistWordExecute
    end
    object acRequestConsumerEdit: TAction
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1079#1072#1082#1072#1079#1072
      Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1079#1072#1082#1072#1079#1072
      ImageIndex = 8
      OnExecute = acRequestConsumerEditExecute
    end
    object acRequestConsumerReAddressAdd: TAction
      Caption = #1055#1077#1088#1077#1072#1076#1088#1077#1089#1072#1094#1080#1103' + '#1053#1086#1074#1099#1081
      Hint = #1055#1077#1088#1077#1072#1076#1088#1077#1089#1072#1094#1080#1103' + '#1053#1086#1074#1099#1081
      ImageIndex = 0
      OnExecute = acRequestConsumerReAddressAddExecute
    end
    object acZakazHistEdit: TAction
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
      Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 8
      OnExecute = acZakazHistEditExecute
    end
    object acRequestConsumerAddOtgr: TAction
      Caption = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077
      Hint = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077
      ImageIndex = 20
      OnExecute = acRequestConsumerAddOtgrExecute
    end
    object acRequestConsumerCancelAdd: TAction
      Caption = #1054#1090#1082#1072#1079' + '#1053#1086#1074#1099#1081
      Hint = #1054#1090#1082#1072#1079' + '#1053#1086#1074#1099#1081
      ImageIndex = 0
      OnExecute = acRequestConsumerCancelAddExecute
    end
    object acRequestConsumerReAddress: TAction
      Caption = #1055#1077#1088#1077#1072#1076#1088#1077#1089#1072#1094#1080#1103
      Hint = #1055#1077#1088#1077#1072#1076#1088#1077#1089#1072#1094#1080#1103
      ImageIndex = 8
      OnExecute = acRequestConsumerReAddressExecute
    end
    object acRequestConsumerCancel: TAction
      Caption = #1054#1090#1082#1072#1079' '#1082#1083#1080#1077#1085#1090#1072
      ImageIndex = 8
      OnExecute = acRequestConsumerCancelExecute
    end
    object acZakazHistDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 5
      OnExecute = acZakazHistDelExecute
    end
    object acRequestConsumerDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079
      ImageIndex = 5
      OnExecute = acRequestConsumerDelExecute
    end
    object acRequestConsumerLoadArh: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1079#1072#1082#1072#1079#1099' '#1040#1088#1093#1072#1085#1075#1077#1083#1100#1089#1082#1072
    end
    object acRequestConsumerLoadParus: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1079#1072#1082#1072#1079#1099' '#1080#1079' '#1055#1072#1088#1091#1089#1072
    end
    object acRequestConsumerToDbf: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' DBF'
      ImageIndex = 43
      OnExecute = acRequestConsumerToDbfExecute
    end
    object acZakazReestrXls: TAction
      Category = 'FOR_ALL'
      Caption = #1056#1077#1077#1089#1090#1088' '#1079#1072#1103#1074#1086#1082' (XLS)'
      Hint = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' XLS'
      ImageIndex = 6
      OnExecute = acZakazReestrXlsExecute
    end
    object acZakazLinkMonth: TAction
      Category = 'FOR_ALL'
      Caption = #1056#1072#1079#1085#1072#1088#1103#1076#1082#1080
      ImageIndex = 19
      OnExecute = acZakazLinkMonthExecute
    end
    object acZakazLinkZakazUNP: TAction
      Category = 'FOR_ALL'
      Caption = #1047#1072#1082#1072#1079' '#1051#1059#1050#1054#1049#1051'-'#1059#1053#1055
      ImageIndex = 19
      OnExecute = acZakazLinkZakazUNPExecute
    end
    object acZakazLinkZakazSNP: TAction
      Category = 'FOR_ALL'
      Caption = #1047#1072#1082#1072#1079' '#1051#1059#1050#1054#1049#1051'-'#1057#1053#1055
      ImageIndex = 18
      OnExecute = acZakazLinkZakazSNPExecute
    end
  end
  object FormStorage1: TFormStorage
    Options = [fpState, fpPosition, fpActiveControl]
    UseRegistry = True
    OnRestorePlacement = FormStorage1RestorePlacement
    StoredProps.Strings = (
      'PageControlAgent.ActivePage'
      'PageControlParus.ActivePage'
      'PageControlPostav.ActivePage'
      'PageControlZakaz.ActivePage'
      'PageControlAgent.Height'
      'PageControlParus.Height'
      'PageControlPostav.Height')
    StoredValues = <>
    Left = 304
    Top = 246
  end
  object oraSes: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'BUH'
    Connected = True
    Left = 40
    Top = 128
  end
  object q_Postav: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      
        '  mon.ROWID, mon.ID, NVL(mon.IS_AGENT,-1) as IS_AGENT, mon.DATE_' +
        'PLAN, mon.CLIENT_NUMBER, mon.CLIENT_DATE,'
      
        '  mon.INPUT_NUMBER, mon.INPUT_DATE, mon.BEGIN_DATE, mon.IS_ACCEP' +
        'T, NVL(mon.FILIAL_ID,-1) as FILIAL_ID,'
      
        '  mon.PLAT_ID, PLAT.PREDPR_NAME as PLAT_NAME, PLAT.INN as PLAT_I' +
        'NN,'
      
        '  NVL(LUK_PLAT.ID,-1) as LUK_PLAT_ID, LUK_PLAT.PREDPR_NAME as LU' +
        'K_PLAT_NAME,LUK_AGENT.PREDPR_NAME as AGENT_NAME,contacts.STAFF1 ' +
        'as AGENT_STAFF,contacts.LASTNAME1||'#39' '#39'||contacts.SHORTNAME as AG' +
        'ENT_DIRECTOR, LUK_DOG.agent_id,'
      '  NVL(mon.DOG_ID,-1) as DOG_ID, KLS_DOG.DOG_NUMBER,'
      
        '  NVL(LUK_DOG.ID,-1) as LUK_DOG_ID, LUK_DOG.DOG_NUMBER as LUK_DO' +
        'G_NUMBER,'
      '  mon.PRICE_CLIENT, mon.PRICE,'
      
        '  mon.PROD_ID_NPR, mon.USL_OPL_ID, mon.LOAD_ABBR, mon.STAN_ID, m' +
        'on.VETKA_ID, mon.POLUCH_ID, mon.POTREB_ID,'
      
        '  mon.POTREB_NAME as POTREB_NAME_DOP, mon.NEFTEBASA, mon.PAYFORM' +
        '_ID, mon.PLANSTRU_ID, mon.IS_AUTO, mon.LINK_ID, mon.LINK_HIST_ID' +
        ','
      
        '  mon.VES, mon.KOL, mon.SPEED_VES, mon.SPEED_KOL, mon.NOM_ZD_LIS' +
        'T, mon.FACT_VES, mon.FACT_KOL,'
      
        '  mon.PRIM, mon.GR4, mon.LOAD_VES, mon.LOAD_KOL, mon.ZAKAZ_PREV_' +
        'ID,'
      '  TO_CHAR(mon.date_plan, '#39'Month YYYY'#39') AS d_plan,'
      '  KLS_PROD.NAME_NPR as NAME_NPR, KLS_PROD.NORMOTGR,'
      
        '  KLS_STAN.STAN_KOD, KLS_STAN.STAN_NAME, mon.GOSPROG_ID, KLS_GOS' +
        'PROG.GOSPROG_NAME,'
      '  mon.GP_NAPR_ID, KLS_GP_NAPR.NAME as GP_NAPR_NAME,'
      
        '  KLS_USL_OPL.NAME as USL_OPL_NAME, ORG_STRUCTURE.FULL_NAME as F' +
        'ILIAL_NAME,'
      
        '  poluch.PREDPR_NAME as POLUCH_NAME, poluch.OKPO as POLUCH_OKPO,' +
        ' poluch.gd_kod as POLUCH_GDKOD,poluch.postindex_j||'#39', '#39'||poluch.' +
        'city_j||'#39', '#39'||poluch.address_j as POLUCH_addr, poluch.ksss_predp' +
        'r_id as POLUCH_KSSS,'
      
        '  potreb.PREDPR_NAME as POTREB_NAME, potreb.OKPO as POTREB_OKPO,' +
        ' potreb.gd_kod as POTREB_GDKOD,potreb.postindex_j||'#39', '#39'||potreb.' +
        'city_j||'#39', '#39'||potreb.address_j as POTREB_addr, potreb.ksss_predp' +
        'r_id as POTREB_KSSS,'
      
        '  KLS_PAYFORM.PAYFORM_NAME, KLS_VID_OTGR.LOAD_NAME, KLS_VETKA.VE' +
        'TKA_NAME, V_PLAN_STRU.NAME as PLANSTRU_NAME,'
      
        '  NVL((SELECT DISTINCT 1 FROM zakaz_hist a where a.zakaz_id=mon.' +
        'id and a.status_zakaz_id=50),0) as EXIST_CANCEL, KLS_ZAKAZ_PERIO' +
        'D.NAME PERIOD_NAME'
      
        'FROM ZAKAZ mon,KLS_DOG,KLS_PROD,KLS_STAN,KLS_USL_OPL,ORG_STRUCTU' +
        'RE,KLS_PREDPR poluch,KLS_PREDPR potreb,'
      
        '     KLS_PREDPR plat,KLS_PAYFORM,KLS_VID_OTGR,KLS_VETKA,V_PLAN_S' +
        'TRU,KLS_PREDPR LUK_PLAT,KLS_DOG LUK_DOG,KLS_GOSPROG,KLS_GP_NAPR,' +
        'KLS_PREDPR_CONTACTS contacts,KLS_PREDPR LUK_AGENT, KLS_ZAKAZ_PER' +
        'IOD'
      'WHERE mon.PLAT_ID=plat.ID'
      '  AND mon.FILIAL_ID=ORG_STRUCTURE.ID'
      '  AND mon.PROD_ID_NPR=KLS_PROD.ID_NPR'
      
        '  AND mon.DOG_ID=KLS_DOG.ID(+) AND mon.LUKDOG_ID=LUK_DOG.ID(+) A' +
        'ND LUK_PLAT.ID=2641 AND LUK_DOG.ZAKAZ_CONTACT_ID=contacts.ID(+) ' +
        'AND LUK_DOG.agent_id=LUK_AGENT.ID(+)'
      
        '  AND mon.STAN_ID=KLS_STAN.ID(+) AND mon.GOSPROG_ID=KLS_GOSPROG.' +
        'ID(+) AND mon.GP_NAPR_ID=KLS_GP_NAPR.ID(+)'
      '  AND mon.USL_OPL_ID=KLS_USL_OPL.ID (+)'
      '  AND mon.POLUCH_ID=poluch.ID(+)'
      '  AND mon.POTREB_ID=potreb.ID(+)'
      '  AND mon.PAYFORM_ID=KLS_PAYFORM.ID(+)'
      '  AND mon.LOAD_ABBR=KLS_VID_OTGR.LOAD_ABBR(+)'
      '  AND mon.VETKA_ID=KLS_VETKA.ID(+)'
      '  AND mon.PLANSTRU_ID=V_PLAN_STRU.ID(+)'
      '  AND mon.is_agent=2'
      
        '  AND mon.DATE_PLAN>=TO_DATE('#39'01.09.2005'#39','#39'dd.mm.yyyy'#39') AND  mon' +
        '.DATE_PLAN<=TO_DATE('#39'30.09.2006'#39','#39'dd.mm.yyyy'#39')'
      '  AND 1=1 -- '#1060#1080#1083#1100#1090#1088
      '  AND mon.PERIOD_ID=KLS_ZAKAZ_PERIOD.ID'
      'ORDER BY mon.ID desc')
    QBEDefinition.QBEFieldDefs = {
      030000004E00000002000000494401000000000800000049535F4147454E5401
      0000000009000000444154455F504C414E01000000000D000000434C49454E54
      5F4E554D42455201000000000B000000434C49454E545F444154450100000000
      0C000000494E5055545F4E554D42455201000000000A000000494E5055545F44
      41544501000000000A000000424547494E5F4441544501000000000900000049
      535F41434345505401000000000900000046494C49414C5F4944010000000007
      000000504C41545F4944010000000006000000444F475F494401000000000B00
      000050524F445F49445F4E505201000000000A00000055534C5F4F504C5F4944
      0100000000090000004C4F41445F414242520100000000070000005354414E5F
      49440100000000080000005645544B415F4944010000000009000000504F4C55
      43485F4944010000000009000000504F545245425F494401000000000B000000
      504F545245425F4E414D450100000000090000004E4546544542415341010000
      00000A000000504159464F524D5F494401000000000B000000504C414E535452
      555F494401000000000C00000050524943455F434C49454E5401000000000500
      000050524943450100000000030000005645530100000000030000004B4F4C01
      000000000900000053504545445F56455301000000000900000053504545445F
      4B4F4C01000000000B0000004E4F4D5F5A445F4C495354010000000008000000
      464143545F564553010000000008000000464143545F4B4F4C01000000000300
      000047523401000000000A000000444F475F4E554D4245520100000000060000
      00445F504C414E0100000000080000004E4F524D4F5447520100000000090000
      00504C41545F4E414D45010000000008000000504C41545F494E4E0100000000
      080000004E414D455F4E50520100000000080000005354414E5F4B4F44010000
      0000090000005354414E5F4E414D4501000000000C00000055534C5F4F504C5F
      4E414D4501000000000B00000046494C49414C5F4E414D4501000000000B0000
      00504F4C5543485F4E414D4501000000000B000000504F4C5543485F4F4B504F
      01000000000C000000504159464F524D5F4E414D450100000000090000004C4F
      41445F4E414D4501000000000A0000005645544B415F4E414D4501000000000D
      000000504C414E535452555F4E414D450100000000040000005052494D010000
      0000080000004C4F41445F5645530100000000080000004C4F41445F4B4F4C01
      000000000D0000005A414B415A5F505245565F494401000000000C0000004558
      4953545F43414E43454C01000000000C000000504F4C5543485F47444B4F4401
      000000000B000000504F4C5543485F4144445201000000000B000000504F5452
      45425F4F4B504F01000000000C000000504F545245425F47444B4F4401000000
      000B000000504F545245425F4144445201000000000B0000004C554B5F504C41
      545F494401000000000E0000004C554B5F444F475F4E554D4245520100000000
      0C000000474F5350524F475F4E414D4501000000000C00000047505F4E415052
      5F4E414D4501000000000D0000004C554B5F504C41545F4E414D450100000000
      0A0000004C554B5F444F475F494401000000000A000000474F5350524F475F49
      4401000000000A00000047505F4E4150525F494401000000000700000049535F
      4155544F0100000000070000004C494E4B5F494401000000000C0000004C494E
      4B5F484953545F494401000000000A0000004147454E545F4E414D4501000000
      000B0000004147454E545F535441464601000000000E0000004147454E545F44
      49524543544F520100000000080000004147454E545F494401000000000B0000
      00504F4C5543485F4B53535301000000000B000000504F545245425F4B535353
      01000000000F000000504F545245425F4E414D455F444F5001000000000B0000
      00504552494F445F4E414D450100000000}
    UniqueFields = 'ID'
    RefreshOptions = [roBeforeEdit, roAfterUpdate]
    UpdatingTable = 'ZAKAZ'
    Session = oraSes
    AfterScroll = q_PostavAfterScroll
    OnFilterRecord = q_PostavFilterRecord
    Left = 108
    Top = 126
    object q_PostavID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_PostavDATE_PLAN: TDateTimeField
      FieldName = 'DATE_PLAN'
      Required = True
    end
    object q_PostavCLIENT_NUMBER: TStringField
      DisplayLabel = #1048#1089#1093'. '#8470
      FieldName = 'CLIENT_NUMBER'
      Size = 50
    end
    object q_PostavCLIENT_DATE: TDateTimeField
      DisplayLabel = #1048#1089#1093'. '#1076#1072#1090#1072
      FieldName = 'CLIENT_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_PostavINPUT_NUMBER: TStringField
      DisplayLabel = #1042#1093'. '#8470
      FieldName = 'INPUT_NUMBER'
      Required = True
      Size = 50
    end
    object q_PostavINPUT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1075'.'
      FieldName = 'INPUT_DATE'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_PostavBEGIN_DATE: TDateTimeField
      DisplayLabel = #1047#1072#1082#1072#1079' '#1076#1077#1081#1089#1090#1074#1091#1077#1090' '#1089'...'
      FieldName = 'BEGIN_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_PostavIS_ACCEPT: TIntegerField
      DisplayLabel = #1059#1090'- '#1074#1077#1088'- '#1076#1080#1090#1100
      FieldName = 'IS_ACCEPT'
      Required = True
    end
    object q_PostavFILIAL_ID: TFloatField
      FieldName = 'FILIAL_ID'
      Required = True
    end
    object q_PostavPLAT_ID: TFloatField
      FieldName = 'PLAT_ID'
      Required = True
    end
    object q_PostavDOG_ID: TFloatField
      FieldName = 'DOG_ID'
    end
    object q_PostavPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object q_PostavUSL_OPL_ID: TFloatField
      FieldName = 'USL_OPL_ID'
    end
    object q_PostavLOAD_ABBR: TStringField
      FieldName = 'LOAD_ABBR'
      Size = 3
    end
    object q_PostavSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
    object q_PostavVETKA_ID: TFloatField
      FieldName = 'VETKA_ID'
    end
    object q_PostavPOLUCH_ID: TFloatField
      FieldName = 'POLUCH_ID'
    end
    object q_PostavPOTREB_ID: TFloatField
      FieldName = 'POTREB_ID'
    end
    object q_PostavPOTREB_NAME: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'|'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'POTREB_NAME'
      Size = 60
    end
    object q_PostavNEFTEBASA: TStringField
      DisplayLabel = #1053#1077#1092#1090#1077#1073#1072#1079#1072
      FieldName = 'NEFTEBASA'
      Size = 50
    end
    object q_PostavPAYFORM_ID: TFloatField
      FieldName = 'PAYFORM_ID'
    end
    object q_PostavPLANSTRU_ID: TFloatField
      FieldName = 'PLANSTRU_ID'
    end
    object q_PostavPRICE_CLIENT: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'PRICE_CLIENT'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object q_PostavPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object q_PostavVES: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086', '#1090#1085
      FieldName = 'VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_PostavKOL: TFloatField
      DisplayLabel = #1047#1072#1103#1074'- '#1083#1077#1085#1086', '#1074#1094
      FieldName = 'KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_PostavSPEED_VES: TFloatField
      DisplayLabel = #1057#1088#1086#1095'. '#1087#1077#1088#1077#1074#1086#1079#1082#1080', '#1090#1085
      FieldName = 'SPEED_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_PostavSPEED_KOL: TFloatField
      DisplayLabel = #1057#1088#1086#1095'. '#1087#1077#1088#1077'- '#1074#1086#1079#1082#1080', '#1074#1094
      FieldName = 'SPEED_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_PostavNOM_ZD_LIST: TStringField
      DisplayLabel = #1047#1072#1103#1074#1082#1080' '#1080#1079' '#1060#1048#1053#1040#1053#1057#1054#1042
      FieldName = 'NOM_ZD_LIST'
      Size = 150
    end
    object q_PostavFACT_VES: TFloatField
      DisplayLabel = #1048#1089#1087#1086#1083'- '#1085#1077#1085#1086', '#1090#1085
      FieldName = 'FACT_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_PostavFACT_KOL: TFloatField
      DisplayLabel = #1048#1089#1087#1086#1083'- '#1085#1077#1085#1086', '#1074#1094
      FieldName = 'FACT_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_PostavPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 100
    end
    object q_PostavGR4: TStringField
      DisplayLabel = #1043#1088#1072#1092#1072' 4'
      FieldName = 'GR4'
      Size = 100
    end
    object q_PostavD_PLAN: TStringField
      DisplayLabel = #1055#1077#1088#1080#1086#1076
      FieldName = 'D_PLAN'
      Size = 14
    end
    object q_PostavPLAT_NAME: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'PLAT_NAME'
      Required = True
      Size = 60
    end
    object q_PostavPLAT_INN: TStringField
      DisplayLabel = #1048#1053#1053' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      FieldName = 'PLAT_INN'
      Size = 12
    end
    object q_PostavDOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldName = 'DOG_NUMBER'
      Size = 30
    end
    object q_PostavNAME_NPR: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object q_PostavNORMOTGR: TFloatField
      FieldName = 'NORMOTGR'
    end
    object q_PostavSTAN_KOD: TIntegerField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103'|'#1050#1086#1076
      FieldName = 'STAN_KOD'
    end
    object q_PostavSTAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103'|'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'STAN_NAME'
      Size = 50
    end
    object q_PostavUSL_OPL_NAME: TStringField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1103' '#1086#1087#1083#1072#1090#1099
      FieldName = 'USL_OPL_NAME'
      Size = 40
    end
    object q_PostavFILIAL_NAME: TStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'FILIAL_NAME'
      Size = 50
    end
    object q_PostavPOLUCH_NAME: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100'|'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'POLUCH_NAME'
      Size = 60
    end
    object q_PostavPOLUCH_OKPO: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100'|'#1054#1050#1055#1054
      FieldName = 'POLUCH_OKPO'
      Size = 10
    end
    object q_PostavPOTREB_NAME_DOP: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'|?'
      FieldName = 'POTREB_NAME_DOP'
      Size = 60
    end
    object q_PostavPAYFORM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PAYFORM_NAME'
    end
    object q_PostavLOAD_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088#1086#1074#1082#1080
      FieldName = 'LOAD_NAME'
      Size = 45
    end
    object q_PostavVETKA_NAME: TStringField
      DisplayLabel = #1042#1077#1090#1082#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'VETKA_NAME'
      Size = 50
    end
    object q_PostavPLANSTRU_NAME: TStringField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072
      FieldName = 'PLANSTRU_NAME'
      Size = 156
    end
    object q_PostavEXIST_CANCEL: TFloatField
      DisplayLabel = #1045#1089#1090#1100' '#1086#1090'- '#1082#1072#1079
      FieldName = 'EXIST_CANCEL'
    end
    object q_PostavLOAD_VES: TFloatField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077', '#1090#1085
      FieldName = 'LOAD_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_PostavLOAD_KOL: TFloatField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077', '#1074#1094
      FieldName = 'LOAD_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_PostavIS_AGENT: TFloatField
      FieldName = 'IS_AGENT'
    end
    object q_PostavZAKAZ_PREV_ID: TFloatField
      FieldName = 'ZAKAZ_PREV_ID'
    end
    object q_PostavPOLUCH_GDKOD: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100'|'#1046#1044' '#1050#1054#1044
      FieldName = 'POLUCH_GDKOD'
      Size = 12
    end
    object q_PostavPOLUCH_ADDR: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100'|'#1040#1076#1088#1077#1089
      FieldName = 'POLUCH_ADDR'
      Size = 135
    end
    object q_PostavPOTREB_OKPO: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'|'#1054#1050#1055#1054
      FieldName = 'POTREB_OKPO'
      Size = 10
    end
    object q_PostavPOTREB_GDKOD: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'|'#1046#1044' '#1050#1054#1044
      FieldName = 'POTREB_GDKOD'
      Size = 12
    end
    object q_PostavPOTREB_ADDR: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'|'#1040#1076#1088#1077#1089
      FieldName = 'POTREB_ADDR'
      Size = 135
    end
    object q_PostavLUK_PLAT_ID: TFloatField
      FieldName = 'LUK_PLAT_ID'
    end
    object q_PostavLUK_PLAT_NAME: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldName = 'LUK_PLAT_NAME'
      Required = True
      Size = 60
    end
    object q_PostavLUK_DOG_ID: TFloatField
      FieldName = 'LUK_DOG_ID'
    end
    object q_PostavLUK_DOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088' '#1089' '#1055#1086#1089#1090#1072#1074#1097#1080#1082#1086#1084
      FieldName = 'LUK_DOG_NUMBER'
      Size = 30
    end
    object q_PostavGOSPROG_NAME: TStringField
      DisplayLabel = #1043#1086#1089#1087#1088#1086#1075#1088#1072#1084#1084#1072
      FieldName = 'GOSPROG_NAME'
      Size = 30
    end
    object q_PostavGP_NAPR_NAME: TStringField
      DisplayLabel = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086' '#1075#1086#1089#1087#1088#1086#1075#1088#1072#1084#1084#1077
      FieldName = 'GP_NAPR_NAME'
      Size = 30
    end
    object q_PostavGOSPROG_ID: TIntegerField
      FieldName = 'GOSPROG_ID'
    end
    object q_PostavGP_NAPR_ID: TFloatField
      FieldName = 'GP_NAPR_ID'
    end
    object q_PostavIS_AUTO: TIntegerField
      FieldName = 'IS_AUTO'
    end
    object q_PostavLINK_ID: TFloatField
      FieldName = 'LINK_ID'
    end
    object q_PostavLINK_HIST_ID: TFloatField
      FieldName = 'LINK_HIST_ID'
    end
    object q_PostavAGENT_NAME: TStringField
      FieldName = 'AGENT_NAME'
      Size = 60
    end
    object q_PostavAGENT_STAFF: TStringField
      FieldName = 'AGENT_STAFF'
      Size = 50
    end
    object q_PostavAGENT_DIRECTOR: TStringField
      FieldName = 'AGENT_DIRECTOR'
      Size = 31
    end
    object q_PostavAGENT_ID: TFloatField
      FieldName = 'AGENT_ID'
    end
    object q_PostavPOLUCH_KSSS: TFloatField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100'|'#1050#1057#1057#1057
      FieldName = 'POLUCH_KSSS'
    end
    object q_PostavPOTREB_KSSS: TFloatField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'|'#1050#1057#1057#1057
      FieldName = 'POTREB_KSSS'
    end
    object q_PostavPERIOD_NAME: TStringField
      DisplayLabel = #1055#1077#1088#1080#1086#1076' '#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103
      DisplayWidth = 25
      FieldName = 'PERIOD_NAME'
      Size = 30
    end
  end
  object ds_Postav: TDataSource
    DataSet = q_Postav
    Left = 108
    Top = 174
  end
  object q_Agent: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      
        '  mon.ROWID, mon.ID, NVL(mon.IS_AGENT,-1) as IS_AGENT, mon.DATE_' +
        'PLAN, mon.CLIENT_NUMBER, mon.CLIENT_DATE,'
      
        '  mon.INPUT_NUMBER, mon.INPUT_DATE, mon.BEGIN_DATE, mon.IS_ACCEP' +
        'T, NVL(mon.FILIAL_ID,-1) as FILIAL_ID,'
      
        '  mon.PLAT_ID, PLAT.PREDPR_NAME as PLAT_NAME, PLAT.INN as PLAT_I' +
        'NN,'
      
        '  NVL(LUK_PLAT.ID,-1) as LUK_PLAT_ID, LUK_PLAT.PREDPR_NAME as LU' +
        'K_PLAT_NAME,LUK_AGENT.PREDPR_NAME as AGENT_NAME,contacts.STAFF1 ' +
        'as AGENT_STAFF,contacts.LASTNAME1||'#39' '#39'||contacts.SHORTNAME as AG' +
        'ENT_DIRECTOR,'
      '  NVL(mon.DOG_ID,-1) as DOG_ID, KLS_DOG.DOG_NUMBER,'
      
        '  NVL(LUK_DOG.ID,-1) as LUK_DOG_ID, LUK_DOG.DOG_NUMBER as LUK_DO' +
        'G_NUMBER,'
      '  mon.PRICE_CLIENT, mon.PRICE,'
      
        '  mon.PROD_ID_NPR, mon.USL_OPL_ID, mon.LOAD_ABBR, mon.STAN_ID, m' +
        'on.VETKA_ID, mon.POLUCH_ID, mon.POTREB_ID,'
      
        '  mon.POTREB_NAME as POTREB_NAME_DOP, mon.NEFTEBASA, mon.PAYFORM' +
        '_ID, mon.PLANSTRU_ID, mon.IS_AUTO, mon.LINK_ID, mon.LINK_HIST_ID' +
        ','
      
        '  mon.VES, mon.KOL, mon.SPEED_VES, mon.SPEED_KOL, mon.NOM_ZD_LIS' +
        'T, mon.FACT_VES, mon.FACT_KOL,'
      
        '  mon.PRIM, mon.GR4, mon.LOAD_VES, mon.LOAD_KOL, mon.ZAKAZ_PREV_' +
        'ID,'
      '  TO_CHAR(mon.date_plan, '#39'Month YYYY'#39') AS d_plan,'
      '  KLS_PROD.NAME_NPR as NAME_NPR, KLS_PROD.NORMOTGR,'
      
        '  KLS_STAN.STAN_KOD, KLS_STAN.STAN_NAME, mon.GOSPROG_ID, KLS_GOS' +
        'PROG.GOSPROG_NAME,'
      '  mon.GP_NAPR_ID, KLS_GP_NAPR.NAME as GP_NAPR_NAME,'
      
        '  KLS_USL_OPL.NAME as USL_OPL_NAME, ORG_STRUCTURE.FULL_NAME as F' +
        'ILIAL_NAME,'
      
        '  poluch.PREDPR_NAME as POLUCH_NAME, poluch.OKPO as POLUCH_OKPO,' +
        ' poluch.gd_kod as POLUCH_GDKOD,poluch.postindex_j||'#39', '#39'||poluch.' +
        'city_j||'#39', '#39'||poluch.address_j as POLUCH_addr, poluch.ksss_predp' +
        'r_id as POLUCH_KSSS,'
      
        '  potreb.PREDPR_NAME as POTREB_NAME, potreb.OKPO as POTREB_OKPO,' +
        ' potreb.gd_kod as POTREB_GDKOD,potreb.postindex_j||'#39', '#39'||potreb.' +
        'city_j||'#39', '#39'||potreb.address_j as POTREB_addr, potreb.ksss_predp' +
        'r_id as POTREB_KSSS,'
      
        '  KLS_PAYFORM.PAYFORM_NAME, KLS_VID_OTGR.LOAD_NAME, KLS_VETKA.VE' +
        'TKA_NAME, V_PLAN_STRU.NAME as PLANSTRU_NAME,'
      
        '  NVL((SELECT DISTINCT 1 FROM zakaz_hist a where a.zakaz_id=mon.' +
        'id and a.status_zakaz_id=50),0) as EXIST_CANCEL'
      
        'FROM ZAKAZ mon,KLS_DOG,KLS_PROD,KLS_STAN,KLS_USL_OPL,ORG_STRUCTU' +
        'RE,KLS_PREDPR poluch,KLS_PREDPR potreb,'
      
        '     KLS_PREDPR plat,KLS_PAYFORM,KLS_VID_OTGR,KLS_VETKA,V_PLAN_S' +
        'TRU,KLS_PREDPR LUK_PLAT,KLS_DOG LUK_DOG,KLS_GOSPROG,KLS_GP_NAPR,' +
        'KLS_PREDPR_CONTACTS contacts,KLS_PREDPR LUK_AGENT'
      'WHERE mon.PLAT_ID=plat.ID'
      '  AND mon.FILIAL_ID=ORG_STRUCTURE.ID'
      '  AND mon.PROD_ID_NPR=KLS_PROD.ID_NPR'
      
        '  AND mon.DOG_ID=KLS_DOG.ID(+) AND mon.LUKDOG_ID=LUK_DOG.ID(+) A' +
        'ND LUK_DOG.PREDPR_ID=LUK_PLAT.ID(+) AND LUK_DOG.ZAKAZ_CONTACT_ID' +
        '=contacts.ID(+) AND LUK_DOG.agent_id=LUK_AGENT.ID(+)'
      
        '  AND mon.STAN_ID=KLS_STAN.ID(+) AND mon.GOSPROG_ID=KLS_GOSPROG.' +
        'ID(+) AND mon.GP_NAPR_ID=KLS_GP_NAPR.ID(+)'
      '  AND mon.USL_OPL_ID=KLS_USL_OPL.ID (+)'
      '  AND mon.POLUCH_ID=poluch.ID(+)'
      '  AND mon.POTREB_ID=potreb.ID(+)'
      '  AND mon.PAYFORM_ID=KLS_PAYFORM.ID(+)'
      '  AND mon.LOAD_ABBR=KLS_VID_OTGR.LOAD_ABBR(+)'
      '  AND mon.VETKA_ID=KLS_VETKA.ID(+)'
      '  AND mon.PLANSTRU_ID=V_PLAN_STRU.ID(+)'
      '  AND mon.is_agent=1'
      
        '  AND mon.DATE_PLAN>=TO_DATE('#39'01.09.2004'#39','#39'dd.mm.yyyy'#39') AND  mon' +
        '.DATE_PLAN<=TO_DATE('#39'30.09.2004'#39','#39'dd.mm.yyyy'#39')'
      '  AND 1=1 -- '#1060#1080#1083#1100#1090#1088
      'ORDER BY mon.ID desc')
    QBEDefinition.QBEFieldDefs = {
      030000004C00000002000000494401000000000800000049535F4147454E5401
      0000000009000000444154455F504C414E01000000000D000000434C49454E54
      5F4E554D42455201000000000B000000434C49454E545F444154450100000000
      0C000000494E5055545F4E554D42455201000000000A000000494E5055545F44
      41544501000000000A000000424547494E5F4441544501000000000900000049
      535F41434345505401000000000900000046494C49414C5F4944010000000007
      000000504C41545F4944010000000006000000444F475F494401000000000B00
      000050524F445F49445F4E505201000000000A00000055534C5F4F504C5F4944
      0100000000090000004C4F41445F414242520100000000070000005354414E5F
      49440100000000080000005645544B415F4944010000000009000000504F4C55
      43485F4944010000000009000000504F545245425F494401000000000B000000
      504F545245425F4E414D450100000000090000004E4546544542415341010000
      00000A000000504159464F524D5F494401000000000B000000504C414E535452
      555F494401000000000C00000050524943455F434C49454E5401000000000500
      000050524943450100000000030000005645530100000000030000004B4F4C01
      000000000900000053504545445F56455301000000000900000053504545445F
      4B4F4C01000000000B0000004E4F4D5F5A445F4C495354010000000008000000
      464143545F564553010000000008000000464143545F4B4F4C01000000000300
      000047523401000000000A000000444F475F4E554D4245520100000000060000
      00445F504C414E0100000000080000004E4F524D4F5447520100000000090000
      00504C41545F4E414D45010000000008000000504C41545F494E4E0100000000
      080000004E414D455F4E50520100000000080000005354414E5F4B4F44010000
      0000090000005354414E5F4E414D4501000000000C00000055534C5F4F504C5F
      4E414D4501000000000B00000046494C49414C5F4E414D4501000000000B0000
      00504F4C5543485F4E414D4501000000000B000000504F4C5543485F4F4B504F
      01000000000C000000504159464F524D5F4E414D450100000000090000004C4F
      41445F4E414D4501000000000A0000005645544B415F4E414D4501000000000D
      000000504C414E535452555F4E414D450100000000040000005052494D010000
      0000080000004C4F41445F5645530100000000080000004C4F41445F4B4F4C01
      000000000D0000005A414B415A5F505245565F494401000000000C0000004558
      4953545F43414E43454C01000000000C000000504F4C5543485F47444B4F4401
      000000000B000000504F4C5543485F4144445201000000000B000000504F5452
      45425F4F4B504F01000000000C000000504F545245425F47444B4F4401000000
      000B000000504F545245425F4144445201000000000B0000004C554B5F504C41
      545F494401000000000D0000004C554B5F504C41545F4E414D4501000000000A
      0000004C554B5F444F475F494401000000000E0000004C554B5F444F475F4E55
      4D42455201000000000C000000474F5350524F475F4E414D4501000000000C00
      000047505F4E4150525F4E414D4501000000000A000000474F5350524F475F49
      4401000000000A00000047505F4E4150525F494401000000000700000049535F
      4155544F0100000000070000004C494E4B5F494401000000000C0000004C494E
      4B5F484953545F494401000000000A0000004147454E545F4E414D4501000000
      000B0000004147454E545F535441464601000000000E0000004147454E545F44
      49524543544F5201000000000B000000504F4C5543485F4B5353530100000000
      0B000000504F545245425F4B53535301000000000F000000504F545245425F4E
      414D455F444F500100000000}
    UniqueFields = 'ID'
    RefreshOptions = [roBeforeEdit, roAfterUpdate]
    UpdatingTable = 'ZAKAZ'
    Session = oraSes
    AfterScroll = q_AgentAfterScroll
    OnFilterRecord = q_AgentFilterRecord
    Left = 164
    Top = 134
    object q_AgentID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_AgentDATE_PLAN: TDateTimeField
      FieldName = 'DATE_PLAN'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_AgentCLIENT_NUMBER: TStringField
      DisplayLabel = #1048#1089#1093'. '#8470
      FieldName = 'CLIENT_NUMBER'
      Size = 50
    end
    object q_AgentCLIENT_DATE: TDateTimeField
      DisplayLabel = #1048#1089#1093'. '#1076#1072#1090#1072
      FieldName = 'CLIENT_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_AgentINPUT_NUMBER: TStringField
      DisplayLabel = #1042#1093'. '#8470
      FieldName = 'INPUT_NUMBER'
      Required = True
      Size = 50
    end
    object q_AgentINPUT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1075'.'
      FieldName = 'INPUT_DATE'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_AgentBEGIN_DATE: TDateTimeField
      DisplayLabel = #1047#1072#1082#1072#1079' '#1076#1077#1081#1089#1090#1074#1091#1077#1090' '#1089'...'
      FieldName = 'BEGIN_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_AgentIS_ACCEPT: TIntegerField
      DisplayLabel = #1059#1090'- '#1074#1077#1088'- '#1076#1080#1090#1100
      FieldName = 'IS_ACCEPT'
      Required = True
    end
    object q_AgentFILIAL_ID: TFloatField
      FieldName = 'FILIAL_ID'
      Required = True
    end
    object q_AgentPLAT_ID: TFloatField
      FieldName = 'PLAT_ID'
      Required = True
    end
    object q_AgentDOG_ID: TFloatField
      FieldName = 'DOG_ID'
    end
    object q_AgentPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object q_AgentUSL_OPL_ID: TFloatField
      FieldName = 'USL_OPL_ID'
    end
    object q_AgentLOAD_ABBR: TStringField
      FieldName = 'LOAD_ABBR'
      Size = 3
    end
    object q_AgentSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
    object q_AgentVETKA_ID: TFloatField
      FieldName = 'VETKA_ID'
    end
    object q_AgentPOLUCH_ID: TFloatField
      FieldName = 'POLUCH_ID'
    end
    object q_AgentPOTREB_ID: TFloatField
      FieldName = 'POTREB_ID'
    end
    object q_AgentPOTREB_NAME: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'|'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'POTREB_NAME'
      Size = 60
    end
    object q_AgentNEFTEBASA: TStringField
      DisplayLabel = #1053#1077#1092#1090#1077#1073#1072#1079#1072
      FieldName = 'NEFTEBASA'
      Size = 50
    end
    object q_AgentPAYFORM_ID: TFloatField
      FieldName = 'PAYFORM_ID'
    end
    object q_AgentPLANSTRU_ID: TFloatField
      FieldName = 'PLANSTRU_ID'
    end
    object q_AgentPRICE_CLIENT: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'PRICE_CLIENT'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object q_AgentPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object q_AgentVES: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086', '#1090#1085
      FieldName = 'VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_AgentKOL: TFloatField
      DisplayLabel = #1047#1072#1103#1074'- '#1083#1077#1085#1086', '#1074#1094
      FieldName = 'KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_AgentSPEED_VES: TFloatField
      DisplayLabel = #1057#1088#1086#1095'. '#1087#1077#1088#1077#1074#1086#1079#1082#1080', '#1090#1085
      FieldName = 'SPEED_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_AgentSPEED_KOL: TFloatField
      DisplayLabel = #1057#1088#1086#1095'. '#1087#1077#1088#1077'- '#1074#1086#1079#1082#1080', '#1074#1094
      FieldName = 'SPEED_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_AgentNOM_ZD_LIST: TStringField
      DisplayLabel = #1047#1072#1103#1074#1082#1080' '#1080#1079' '#1060#1048#1053#1040#1053#1057#1054#1042
      FieldName = 'NOM_ZD_LIST'
      Size = 150
    end
    object q_AgentFACT_VES: TFloatField
      DisplayLabel = #1048#1089#1087#1086#1083'- '#1085#1077#1085#1086', '#1090#1085
      FieldName = 'FACT_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_AgentFACT_KOL: TFloatField
      DisplayLabel = #1048#1089#1087#1086#1083'- '#1085#1077#1085#1086', '#1074#1094
      FieldName = 'FACT_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_AgentPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 100
    end
    object q_AgentGR4: TStringField
      DisplayLabel = #1043#1088#1072#1092#1072' 4'
      FieldName = 'GR4'
      Size = 100
    end
    object q_AgentD_PLAN: TStringField
      DisplayLabel = #1055#1077#1088#1080#1086#1076
      FieldName = 'D_PLAN'
      Size = 14
    end
    object q_AgentPLAT_NAME: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'PLAT_NAME'
      Required = True
      Size = 60
    end
    object q_AgentPLAT_INN: TStringField
      DisplayLabel = #1048#1053#1053' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      FieldName = 'PLAT_INN'
      Size = 12
    end
    object q_AgentDOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldName = 'DOG_NUMBER'
      Size = 30
    end
    object q_AgentNAME_NPR: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object q_AgentNORMOTGR: TFloatField
      FieldName = 'NORMOTGR'
    end
    object q_AgentSTAN_KOD: TIntegerField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103'|'#1050#1086#1076
      FieldName = 'STAN_KOD'
    end
    object q_AgentSTAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103'|'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'STAN_NAME'
      Size = 50
    end
    object q_AgentUSL_OPL_NAME: TStringField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1103' '#1086#1087#1083#1072#1090#1099
      FieldName = 'USL_OPL_NAME'
      Size = 40
    end
    object q_AgentFILIAL_NAME: TStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'FILIAL_NAME'
      Size = 50
    end
    object q_AgentPOLUCH_NAME: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100'|'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'POLUCH_NAME'
      Size = 60
    end
    object q_AgentPOLUCH_OKPO: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100'|'#1054#1050#1055#1054
      FieldName = 'POLUCH_OKPO'
      Size = 10
    end
    object q_AgentPOTREB_NAME_DOP: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'|?'
      FieldName = 'POTREB_NAME_DOP'
      Size = 60
    end
    object q_AgentPAYFORM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PAYFORM_NAME'
    end
    object q_AgentLOAD_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088#1086#1074#1082#1080
      FieldName = 'LOAD_NAME'
      Size = 45
    end
    object q_AgentVETKA_NAME: TStringField
      DisplayLabel = #1042#1077#1090#1082#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'VETKA_NAME'
      Size = 50
    end
    object q_AgentPLANSTRU_NAME: TStringField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072
      FieldName = 'PLANSTRU_NAME'
      Size = 156
    end
    object q_AgentEXIST_CANCEL: TFloatField
      DisplayLabel = #1045#1089#1090#1100' '#1086#1090'- '#1082#1072#1079
      FieldName = 'EXIST_CANCEL'
    end
    object q_AgentLOAD_VES: TFloatField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077', '#1090#1085
      FieldName = 'LOAD_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_AgentLOAD_KOL: TFloatField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077', '#1074#1094
      FieldName = 'LOAD_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_AgentIS_AGENT: TFloatField
      FieldName = 'IS_AGENT'
    end
    object q_AgentZAKAZ_PREV_ID: TFloatField
      FieldName = 'ZAKAZ_PREV_ID'
    end
    object q_AgentPOLUCH_GDKOD: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100'|'#1046#1044' '#1050#1054#1044
      FieldName = 'POLUCH_GDKOD'
      Size = 12
    end
    object q_AgentPOLUCH_ADDR: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100'|'#1040#1076#1088#1077#1089
      FieldName = 'POLUCH_ADDR'
      Size = 135
    end
    object q_AgentPOTREB_OKPO: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'|'#1054#1050#1055#1054
      FieldName = 'POTREB_OKPO'
      Size = 10
    end
    object q_AgentPOTREB_GDKOD: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'|'#1046#1044' '#1050#1054#1044
      FieldName = 'POTREB_GDKOD'
      Size = 12
    end
    object q_AgentPOTREB_ADDR: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'|'#1040#1076#1088#1077#1089
      FieldName = 'POTREB_ADDR'
      Size = 135
    end
    object q_AgentLUK_PLAT_ID: TFloatField
      FieldName = 'LUK_PLAT_ID'
    end
    object q_AgentLUK_PLAT_NAME: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldName = 'LUK_PLAT_NAME'
      Size = 60
    end
    object q_AgentLUK_DOG_ID: TFloatField
      FieldName = 'LUK_DOG_ID'
    end
    object q_AgentLUK_DOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088' '#1089' '#1055#1086#1089#1090#1072#1074#1097#1080#1082#1086#1084
      FieldName = 'LUK_DOG_NUMBER'
      Size = 30
    end
    object q_AgentGOSPROG_NAME: TStringField
      DisplayLabel = #1043#1086#1089#1087#1088#1086#1075#1088#1072#1084#1084#1072
      FieldName = 'GOSPROG_NAME'
      Size = 30
    end
    object q_AgentGP_NAPR_NAME: TStringField
      DisplayLabel = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086' '#1075#1086#1089#1087#1088#1086#1075#1088#1072#1084#1084#1077
      FieldName = 'GP_NAPR_NAME'
      Size = 30
    end
    object q_AgentGOSPROG_ID: TIntegerField
      FieldName = 'GOSPROG_ID'
    end
    object q_AgentGP_NAPR_ID: TFloatField
      FieldName = 'GP_NAPR_ID'
    end
    object q_AgentIS_AUTO: TIntegerField
      FieldName = 'IS_AUTO'
    end
    object q_AgentLINK_ID: TFloatField
      FieldName = 'LINK_ID'
    end
    object q_AgentLINK_HIST_ID: TFloatField
      FieldName = 'LINK_HIST_ID'
    end
    object q_AgentAGENT_NAME: TStringField
      FieldName = 'AGENT_NAME'
      Size = 60
    end
    object q_AgentAGENT_STAFF: TStringField
      FieldName = 'AGENT_STAFF'
      Size = 50
    end
    object q_AgentAGENT_DIRECTOR: TStringField
      FieldName = 'AGENT_DIRECTOR'
      Size = 31
    end
    object q_AgentPOLUCH_KSSS: TFloatField
      DisplayLabel = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100'|'#1050#1057#1057#1057
      FieldName = 'POLUCH_KSSS'
    end
    object q_AgentPOTREB_KSSS: TFloatField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100'|'#1050#1057#1057#1057
      FieldName = 'POTREB_KSSS'
    end
  end
  object ds_Agent: TDataSource
    DataSet = q_Agent
    Left = 164
    Top = 182
  end
  object q_PostavHist: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '  mon.ROWID,'
      '  mon.*,ZAKAZ_UNP.INPUT_NUMBER as UNP_NUMBER,'
      '  KLS_STATUS_ZAKAZ.NAME as STATUS_ZAKAZ_NAME,'
      '  KLS_PROD.NAME_NPR as NAME_NPR,'
      '  KLS_PROD.NORMOTGR,'
      '  KLS_STAN.STAN_KOD,'
      '  KLS_STAN.STAN_NAME,'
      '  OLD_STAN.STAN_KOD as OLD_STAN_KOD,'
      '  OLD_STAN.STAN_NAME as OLD_STAN_NAME,'
      
        '  poluch.PREDPR_NAME as POLUCH_NAME, poluch.OKPO as POLUCH_OKPO,' +
        ' poluch.gd_kod as POLUCH_GDKOD,poluch.postindex_j||'#39', '#39'||poluch.' +
        'city_j||'#39', '#39'||poluch.address_j as POLUCH_addr, poluch.ksss_predp' +
        'r_id as POLUCH_KSSS,'
      
        '  potreb.PREDPR_NAME as POTREB_NAME, potreb.OKPO as POTREB_OKPO,' +
        ' potreb.gd_kod as POTREB_GDKOD,potreb.postindex_j||'#39', '#39'||potreb.' +
        'city_j||'#39', '#39'||potreb.address_j as POTREB_addr, potreb.ksss_predp' +
        'r_id as POTREB_KSSS,'
      '  GU12_A.NOM_Z as GU12_A_NUM,'
      '  GU12_A.REG_DATE as GU12_A_DATE,  '
      '  GU12_A.FROM_DATE as GU12_A_FROM_DATE  '
      
        'FROM ZAKAZ_HIST mon,KLS_STATUS_ZAKAZ,KLS_PROD,KLS_STAN OLD_STAN,' +
        'KLS_STAN,KLS_PREDPR poluch,KLS_PREDPR potreb, '
      '     GU12_A,ZAKAZ zakaz_unp'
      
        'WHERE mon.STATUS_ZAKAZ_ID=KLS_STATUS_ZAKAZ.ID AND mon.LINK_ID=za' +
        'kaz_unp.ID(+)'
      '  AND mon.PROD_ID_NPR=KLS_PROD.ID_NPR'
      '  AND mon.OLD_STAN_ID=OLD_STAN.ID(+)'
      '  AND mon.STAN_ID=KLS_STAN.ID (+)'
      '  AND mon.POLUCH_ID=poluch.ID(+)'
      '  AND mon.POTREB_ID=potreb.ID(+)'
      '  AND mon.GU12_A_ID=GU12_A.ID(+)'
      '  AND mon.ZAKAZ_ID=:ZAKAZ_ID'
      'ORDER BY mon.SORTBY')
    Variables.Data = {
      0300000001000000090000003A5A414B415A5F49440300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      030000003300000002000000494401000000000D000000434C49454E545F4E55
      4D42455201000000000B000000434C49454E545F4441544501000000000C0000
      00494E5055545F4E554D42455201000000000A000000494E5055545F44415445
      01000000000A000000424547494E5F4441544501000000000B00000050524F44
      5F49445F4E50520100000000070000005354414E5F4944010000000009000000
      504F4C5543485F4944010000000009000000504F545245425F49440100000000
      0500000050524943450100000000030000005645530100000000030000004B4F
      4C01000000000900000053504545445F56455301000000000900000053504545
      445F4B4F4C010000000008000000464143545F56455301000000000800000046
      4143545F4B4F4C0100000000080000004E4F524D4F5447520100000000080000
      004E414D455F4E50520100000000080000005354414E5F4B4F44010000000009
      0000005354414E5F4E414D4501000000000B000000504F4C5543485F4E414D45
      01000000000B000000504F4C5543485F4F4B504F0100000000080000005A414B
      415A5F4944010000000006000000534F5254425901000000000F000000535441
      5455535F5A414B415A5F494401000000000B0000004F4C445F5354414E5F4944
      0100000000060000004E4F4D5F5A44010000000009000000475531325F415F49
      4401000000000700000049535F4155544F01000000000600000047524146494B
      0100000000110000005354415455535F5A414B415A5F4E414D4501000000000C
      0000004F4C445F5354414E5F4B4F4401000000000D0000004F4C445F5354414E
      5F4E414D4501000000000A000000475531325F415F4E554D01000000000B0000
      00475531325F415F44415445010000000010000000475531325F415F46524F4D
      5F444154450100000000080000004C4F41445F5645530100000000080000004C
      4F41445F4B4F4C01000000000C000000504F4C5543485F47444B4F4401000000
      000B000000504F4C5543485F4144445201000000000B000000504F545245425F
      4F4B504F01000000000C000000504F545245425F47444B4F4401000000000B00
      0000504F545245425F4144445201000000000B000000504F545245425F4E414D
      450100000000070000004C494E4B5F494401000000000C0000004C494E4B5F48
      4953545F494401000000000D00000049535F4155544F5F4D4F4E544801000000
      000A000000554E505F4E554D42455201000000000B000000504F4C5543485F4B
      53535301000000000B000000504F545245425F4B5353530100000000}
    Master = q_Postav
    MasterFields = 'ID'
    DetailFields = 'ZAKAZ_ID'
    Session = oraSes
    OnFilterRecord = q_PostavHistFilterRecord
    Left = 228
    Top = 142
    object q_PostavHistID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_PostavHistZAKAZ_ID: TFloatField
      FieldName = 'ZAKAZ_ID'
      Required = True
    end
    object q_PostavHistSORTBY: TIntegerField
      DisplayLabel = 'N '#1087'/'#1087
      FieldName = 'SORTBY'
    end
    object q_PostavHistSTATUS_ZAKAZ_ID: TFloatField
      FieldName = 'STATUS_ZAKAZ_ID'
      Required = True
    end
    object q_PostavHistCLIENT_NUMBER: TStringField
      DisplayLabel = #1048#1089#1093'. '#8470
      FieldName = 'CLIENT_NUMBER'
      Size = 50
    end
    object q_PostavHistCLIENT_DATE: TDateTimeField
      FieldName = 'CLIENT_DATE'
    end
    object q_PostavHistINPUT_NUMBER: TStringField
      DisplayLabel = #1042#1093'. '#8470
      FieldName = 'INPUT_NUMBER'
      Required = True
      Size = 50
    end
    object q_PostavHistINPUT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1075'.'
      FieldName = 'INPUT_DATE'
      Required = True
    end
    object q_PostavHistPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 5
    end
    object q_PostavHistOLD_STAN_ID: TFloatField
      FieldName = 'OLD_STAN_ID'
    end
    object q_PostavHistSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
    object q_PostavHistPOLUCH_ID: TFloatField
      FieldName = 'POLUCH_ID'
    end
    object q_PostavHistPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object q_PostavHistVES: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086', '#1090#1085
      FieldName = 'VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_PostavHistKOL: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086', '#1074#1094
      FieldName = 'KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_PostavHistSPEED_VES: TFloatField
      DisplayLabel = #1074' '#1090'.'#1095'. '#1089#1088#1086#1095'. '#1087#1077#1088'., '#1090#1085
      FieldName = 'SPEED_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_PostavHistSPEED_KOL: TFloatField
      DisplayLabel = #1074' '#1090'.'#1095'. '#1089#1088#1086#1095'. '#1087#1077#1088'., '#1074#1094
      FieldName = 'SPEED_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_PostavHistNOM_ZD: TStringField
      DisplayLabel = #1047#1072#1103#1074#1082#1072' '#1080#1079' '#1060#1048#1053#1040#1053#1057#1054#1042
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_PostavHistFACT_VES: TFloatField
      DisplayLabel = #1054#1090#1075#1088#1091#1078#1077#1085#1086', '#1090#1085
      FieldName = 'FACT_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_PostavHistFACT_KOL: TFloatField
      DisplayLabel = #1054#1090#1075#1088#1091#1078#1077#1085#1086', '#1074#1094
      FieldName = 'FACT_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_PostavHistGU12_A_ID: TFloatField
      FieldName = 'GU12_A_ID'
    end
    object q_PostavHistIS_AUTO: TIntegerField
      FieldName = 'IS_AUTO'
      Required = True
    end
    object q_PostavHistBEGIN_DATE: TDateTimeField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1089' ...'
      FieldName = 'BEGIN_DATE'
    end
    object q_PostavHistGRAFIK: TStringField
      DisplayLabel = #1043#1088#1072#1092#1080#1082' '#1086#1090#1075#1088#1091#1079#1082#1080
      FieldName = 'GRAFIK'
      Size = 100
    end
    object q_PostavHistPOTREB_ID: TFloatField
      FieldName = 'POTREB_ID'
    end
    object q_PostavHistSTATUS_ZAKAZ_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1086#1079#1080#1094#1080#1080
      FieldName = 'STATUS_ZAKAZ_NAME'
      Required = True
      Size = 50
    end
    object q_PostavHistNAME_NPR: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object q_PostavHistNORMOTGR: TFloatField
      FieldName = 'NORMOTGR'
    end
    object q_PostavHistSTAN_KOD: TIntegerField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103' ('#1082#1086#1076')'
      FieldName = 'STAN_KOD'
    end
    object q_PostavHistSTAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      FieldName = 'STAN_NAME'
      Size = 50
    end
    object q_PostavHistOLD_STAN_KOD: TIntegerField
      DisplayLabel = #1055#1088#1077#1076'. '#1089#1090#1072#1085#1094#1080#1103' ('#1082#1086#1076')'
      FieldName = 'OLD_STAN_KOD'
    end
    object q_PostavHistOLD_STAN_NAME: TStringField
      DisplayLabel = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1089#1090#1072#1085#1094#1080#1103
      FieldName = 'OLD_STAN_NAME'
      Size = 50
    end
    object q_PostavHistPOLUCH_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'POLUCH_NAME'
      Size = 60
    end
    object q_PostavHistPOLUCH_OKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'POLUCH_OKPO'
      Size = 10
    end
    object q_PostavHistPOTREB_NAME: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
      FieldName = 'POTREB_NAME'
      Size = 60
    end
    object q_PostavHistGU12_A_NUM: TStringField
      DisplayLabel = #1047#1072#1103#1074#1082#1072' '#1085#1072' '#1087#1077#1088#1077#1074#1086#1079#1082#1091' ('#1069#1058#1056#1040#1053')'
      FieldName = 'GU12_A_NUM'
      Size = 15
    end
    object q_PostavHistGU12_A_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' ('#1069#1058#1056#1040#1053')'
      FieldName = 'GU12_A_DATE'
    end
    object q_PostavHistGU12_A_FROM_DATE: TDateTimeField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1089' ... ('#1069#1058#1056#1040#1053')'
      FieldName = 'GU12_A_FROM_DATE'
    end
    object q_PostavHistLOAD_VES: TFloatField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077', '#1090#1085
      FieldName = 'LOAD_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_PostavHistLOAD_KOL: TFloatField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077', '#1074#1094
      FieldName = 'LOAD_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_PostavHistPOLUCH_GDKOD: TStringField
      FieldName = 'POLUCH_GDKOD'
      Size = 12
    end
    object q_PostavHistPOLUCH_ADDR: TStringField
      FieldName = 'POLUCH_ADDR'
      Size = 135
    end
    object q_PostavHistPOTREB_OKPO: TStringField
      FieldName = 'POTREB_OKPO'
      Size = 10
    end
    object q_PostavHistPOTREB_GDKOD: TStringField
      FieldName = 'POTREB_GDKOD'
      Size = 12
    end
    object q_PostavHistPOTREB_ADDR: TStringField
      FieldName = 'POTREB_ADDR'
      Size = 135
    end
    object q_PostavHistLINK_ID: TFloatField
      FieldName = 'LINK_ID'
    end
    object q_PostavHistLINK_HIST_ID: TFloatField
      FieldName = 'LINK_HIST_ID'
    end
    object q_PostavHistIS_AUTO_MONTH: TIntegerField
      FieldName = 'IS_AUTO_MONTH'
    end
    object q_PostavHistUNP_NUMBER: TStringField
      DisplayLabel = #1056#1077#1075'.'#8470' '#1059#1053#1055
      FieldName = 'UNP_NUMBER'
      Size = 50
    end
    object q_PostavHistPOLUCH_KSSS: TFloatField
      FieldName = 'POLUCH_KSSS'
    end
    object q_PostavHistPOTREB_KSSS: TFloatField
      FieldName = 'POTREB_KSSS'
    end
  end
  object ds_PostavHist: TDataSource
    DataSet = q_PostavHist
    Left = 228
    Top = 190
  end
  object q_AgentHist: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '  mon.ROWID,'
      '  mon.*,'
      '  KLS_STATUS_ZAKAZ.NAME as STATUS_ZAKAZ_NAME,'
      '  KLS_PROD.NAME_NPR as NAME_NPR,'
      '  KLS_PROD.NORMOTGR,'
      '  KLS_STAN.STAN_KOD,'
      '  KLS_STAN.STAN_NAME,'
      '  OLD_STAN.STAN_KOD as OLD_STAN_KOD,'
      '  OLD_STAN.STAN_NAME as OLD_STAN_NAME,'
      
        '  poluch.PREDPR_NAME as POLUCH_NAME, poluch.OKPO as POLUCH_OKPO,' +
        ' poluch.gd_kod as POLUCH_GDKOD,poluch.postindex_j||'#39', '#39'||poluch.' +
        'city_j||'#39', '#39'||poluch.address_j as POLUCH_addr, poluch.ksss_predp' +
        'r_id as POLUCH_KSSS,'
      
        '  potreb.PREDPR_NAME as POTREB_NAME, potreb.OKPO as POTREB_OKPO,' +
        ' potreb.gd_kod as POTREB_GDKOD,potreb.postindex_j||'#39', '#39'||potreb.' +
        'city_j||'#39', '#39'||potreb.address_j as POTREB_addr, potreb.ksss_predp' +
        'r_id as POTREB_KSSS,'
      '  GU12_A.NOM_Z as GU12_A_NUM,'
      '  GU12_A.REG_DATE as GU12_A_DATE,  '
      '  GU12_A.FROM_DATE as GU12_A_FROM_DATE  '
      
        'FROM ZAKAZ_HIST mon,KLS_STATUS_ZAKAZ,KLS_PROD,KLS_STAN OLD_STAN,' +
        'KLS_STAN,KLS_PREDPR poluch,KLS_PREDPR potreb, '
      '     GU12_A'
      'WHERE mon.STATUS_ZAKAZ_ID=KLS_STATUS_ZAKAZ.ID'
      '  AND mon.PROD_ID_NPR=KLS_PROD.ID_NPR'
      '  AND mon.OLD_STAN_ID=OLD_STAN.ID(+)'
      '  AND mon.STAN_ID=KLS_STAN.ID (+)'
      '  AND mon.POLUCH_ID=poluch.ID(+)'
      '  AND mon.POTREB_ID=potreb.ID(+)'
      '  AND mon.GU12_A_ID=GU12_A.ID(+)'
      '  AND mon.ZAKAZ_ID=:ZAKAZ_ID'
      'ORDER BY mon.SORTBY')
    Variables.Data = {
      0300000001000000090000003A5A414B415A5F49440300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      030000003200000002000000494401000000000D000000434C49454E545F4E55
      4D42455201000000000B000000434C49454E545F4441544501000000000C0000
      00494E5055545F4E554D42455201000000000A000000494E5055545F44415445
      01000000000A000000424547494E5F4441544501000000000B00000050524F44
      5F49445F4E50520100000000070000005354414E5F4944010000000009000000
      504F4C5543485F4944010000000009000000504F545245425F49440100000000
      0B000000504F545245425F4E414D450100000000050000005052494345010000
      0000030000005645530100000000030000004B4F4C0100000000090000005350
      4545445F56455301000000000900000053504545445F4B4F4C01000000000800
      0000464143545F564553010000000008000000464143545F4B4F4C0100000000
      080000004E4F524D4F5447520100000000080000004E414D455F4E5052010000
      0000080000005354414E5F4B4F440100000000090000005354414E5F4E414D45
      01000000000B000000504F4C5543485F4E414D4501000000000B000000504F4C
      5543485F4F4B504F0100000000080000005A414B415A5F494401000000000600
      0000534F5254425901000000000F0000005354415455535F5A414B415A5F4944
      01000000000B0000004F4C445F5354414E5F49440100000000060000004E4F4D
      5F5A44010000000009000000475531325F415F49440100000000070000004953
      5F4155544F01000000000600000047524146494B010000000011000000535441
      5455535F5A414B415A5F4E414D4501000000000C0000004F4C445F5354414E5F
      4B4F4401000000000D0000004F4C445F5354414E5F4E414D4501000000000A00
      0000475531325F415F4E554D01000000000B000000475531325F415F44415445
      010000000010000000475531325F415F46524F4D5F4441544501000000000800
      00004C4F41445F5645530100000000080000004C4F41445F4B4F4C0100000000
      0C000000504F4C5543485F47444B4F4401000000000B000000504F4C5543485F
      4144445201000000000B000000504F545245425F4F4B504F01000000000C0000
      00504F545245425F47444B4F4401000000000B000000504F545245425F414444
      520100000000070000004C494E4B5F494401000000000C0000004C494E4B5F48
      4953545F494401000000000D00000049535F4155544F5F4D4F4E544801000000
      000B000000504F4C5543485F4B53535301000000000B000000504F545245425F
      4B5353530100000000}
    Master = q_Agent
    MasterFields = 'ID'
    DetailFields = 'ZAKAZ_ID'
    Session = oraSes
    OnFilterRecord = q_AgentHistFilterRecord
    Left = 324
    Top = 150
    object q_AgentHistID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_AgentHistZAKAZ_ID: TFloatField
      FieldName = 'ZAKAZ_ID'
      Required = True
    end
    object q_AgentHistSORTBY: TIntegerField
      DisplayLabel = 'N '#1087'/'#1087
      FieldName = 'SORTBY'
    end
    object q_AgentHistSTATUS_ZAKAZ_ID: TFloatField
      FieldName = 'STATUS_ZAKAZ_ID'
      Required = True
    end
    object q_AgentHistCLIENT_NUMBER: TStringField
      DisplayLabel = #1048#1089#1093'. '#8470
      FieldName = 'CLIENT_NUMBER'
      Size = 50
    end
    object q_AgentHistCLIENT_DATE: TDateTimeField
      FieldName = 'CLIENT_DATE'
    end
    object q_AgentHistINPUT_NUMBER: TStringField
      DisplayLabel = #1042#1093'. '#8470
      FieldName = 'INPUT_NUMBER'
      Required = True
      Size = 50
    end
    object q_AgentHistINPUT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1075'.'
      FieldName = 'INPUT_DATE'
      Required = True
    end
    object q_AgentHistPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 5
    end
    object q_AgentHistOLD_STAN_ID: TFloatField
      FieldName = 'OLD_STAN_ID'
    end
    object q_AgentHistSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
    object q_AgentHistPOLUCH_ID: TFloatField
      FieldName = 'POLUCH_ID'
    end
    object q_AgentHistPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object q_AgentHistVES: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086', '#1090#1085
      FieldName = 'VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_AgentHistKOL: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086', '#1074#1094
      FieldName = 'KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_AgentHistSPEED_VES: TFloatField
      DisplayLabel = #1074' '#1090'.'#1095'. '#1089#1088#1086#1095'. '#1087#1077#1088'., '#1090#1085
      FieldName = 'SPEED_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_AgentHistSPEED_KOL: TFloatField
      DisplayLabel = #1074' '#1090'.'#1095'. '#1089#1088#1086#1095'. '#1087#1077#1088'., '#1074#1094
      FieldName = 'SPEED_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_AgentHistNOM_ZD: TStringField
      DisplayLabel = #1047#1072#1103#1074#1082#1072' '#1080#1079' '#1060#1048#1053#1040#1053#1057#1054#1042
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_AgentHistFACT_VES: TFloatField
      DisplayLabel = #1054#1090#1075#1088#1091#1078#1077#1085#1086', '#1090#1085
      FieldName = 'FACT_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_AgentHistFACT_KOL: TFloatField
      DisplayLabel = #1054#1090#1075#1088#1091#1078#1077#1085#1086', '#1074#1094
      FieldName = 'FACT_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_AgentHistGU12_A_ID: TFloatField
      FieldName = 'GU12_A_ID'
    end
    object q_AgentHistIS_AUTO: TIntegerField
      FieldName = 'IS_AUTO'
      Required = True
    end
    object q_AgentHistBEGIN_DATE: TDateTimeField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1089' ...'
      FieldName = 'BEGIN_DATE'
    end
    object q_AgentHistGRAFIK: TStringField
      DisplayLabel = #1043#1088#1072#1092#1080#1082' '#1086#1090#1075#1088#1091#1079#1082#1080
      FieldName = 'GRAFIK'
      Size = 100
    end
    object q_AgentHistPOTREB_ID: TFloatField
      FieldName = 'POTREB_ID'
    end
    object q_AgentHistSTATUS_ZAKAZ_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1086#1079#1080#1094#1080#1080
      FieldName = 'STATUS_ZAKAZ_NAME'
      Required = True
      Size = 50
    end
    object q_AgentHistNAME_NPR: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object q_AgentHistNORMOTGR: TFloatField
      FieldName = 'NORMOTGR'
    end
    object q_AgentHistSTAN_KOD: TIntegerField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103' ('#1082#1086#1076')'
      FieldName = 'STAN_KOD'
    end
    object q_AgentHistSTAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      FieldName = 'STAN_NAME'
      Size = 50
    end
    object q_AgentHistOLD_STAN_KOD: TIntegerField
      DisplayLabel = #1055#1088#1077#1076'. '#1089#1090#1072#1085#1094#1080#1103' ('#1082#1086#1076')'
      FieldName = 'OLD_STAN_KOD'
    end
    object q_AgentHistOLD_STAN_NAME: TStringField
      DisplayLabel = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1089#1090#1072#1085#1094#1080#1103
      FieldName = 'OLD_STAN_NAME'
      Size = 50
    end
    object q_AgentHistPOLUCH_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'POLUCH_NAME'
      Size = 60
    end
    object q_AgentHistPOLUCH_OKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'POLUCH_OKPO'
      Size = 10
    end
    object q_AgentHistPOTREB_NAME: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
      FieldName = 'POTREB_NAME'
      Size = 60
    end
    object q_AgentHistGU12_A_NUM: TStringField
      DisplayLabel = #1047#1072#1103#1074#1082#1072' '#1085#1072' '#1087#1077#1088#1077#1074#1086#1079#1082#1091' ('#1069#1058#1056#1040#1053')'
      FieldName = 'GU12_A_NUM'
      Size = 15
    end
    object q_AgentHistGU12_A_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' ('#1069#1058#1056#1040#1053')'
      FieldName = 'GU12_A_DATE'
    end
    object q_AgentHistGU12_A_FROM_DATE: TDateTimeField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1089' ... ('#1069#1058#1056#1040#1053')'
      FieldName = 'GU12_A_FROM_DATE'
    end
    object q_AgentHistLOAD_VES: TFloatField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077', '#1090#1085
      FieldName = 'LOAD_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_AgentHistLOAD_KOL: TFloatField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079#1082#1077', '#1074#1094
      FieldName = 'LOAD_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_AgentHistPOLUCH_GDKOD: TStringField
      FieldName = 'POLUCH_GDKOD'
      Size = 12
    end
    object q_AgentHistPOLUCH_ADDR: TStringField
      FieldName = 'POLUCH_ADDR'
      Size = 135
    end
    object q_AgentHistPOTREB_OKPO: TStringField
      FieldName = 'POTREB_OKPO'
      Size = 10
    end
    object q_AgentHistPOTREB_GDKOD: TStringField
      FieldName = 'POTREB_GDKOD'
      Size = 12
    end
    object q_AgentHistPOTREB_ADDR: TStringField
      FieldName = 'POTREB_ADDR'
      Size = 135
    end
    object q_AgentHistLINK_ID: TFloatField
      FieldName = 'LINK_ID'
    end
    object q_AgentHistLINK_HIST_ID: TFloatField
      FieldName = 'LINK_HIST_ID'
    end
    object q_AgentHistIS_AUTO_MONTH: TIntegerField
      FieldName = 'IS_AUTO_MONTH'
    end
    object q_AgentHistPOLUCH_KSSS: TFloatField
      FieldName = 'POLUCH_KSSS'
    end
    object q_AgentHistPOTREB_KSSS: TFloatField
      FieldName = 'POTREB_KSSS'
    end
  end
  object ds_AgentHist: TDataSource
    DataSet = q_AgentHist
    Left = 324
    Top = 190
  end
  object pkgFOR_ZAKAZ: TOraclePackage
    Session = oraSes
    PackageName = 'FOR_ZAKAZ'
    Left = 404
    Top = 150
  end
  object q_PostavPlan: TOracleDataSet
    SQL.Strings = (
      'SELECT PLAN_NB,PLAN_TRAN,PLAN_VNCORPTR,PLAN_OTHER'
      '  FROM V_ZAKAZ_TEMP'
      ' WHERE IS_AGENT=2'
      '   AND KIND_VALUE=1'
      #9' AND FILIAL_ID=:FILIAL_ID'
      #9' AND PROD_ID_NPR=:PROD_ID_NPR'
      '')
    Variables.Data = {
      03000000020000000A0000003A46494C49414C5F494403000000040000001F00
      0000000000000C0000003A50524F445F49445F4E505205000000060000003233
      3630300000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000400000007000000504C414E5F4E42010000000009000000504C414E
      5F5452414E01000000000D000000504C414E5F564E434F525054520100000000
      0A000000504C414E5F4F544845520100000000}
    Master = q_Postav
    MasterFields = 'filial_id;prod_id_npr'
    DetailFields = 'filial_id;prod_id_npr'
    Session = oraSes
    Left = 504
    Top = 137
    object q_PostavPlanPLAN_NB: TFloatField
      FieldName = 'PLAN_NB'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_PostavPlanPLAN_TRAN: TFloatField
      FieldName = 'PLAN_TRAN'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_PostavPlanPLAN_VNCORPTR: TFloatField
      FieldName = 'PLAN_VNCORPTR'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_PostavPlanPLAN_OTHER: TFloatField
      FieldName = 'PLAN_OTHER'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
  end
  object ds_PostavPlan: TDataSource
    DataSet = q_PostavPlan
    Left = 500
    Top = 166
  end
  object q_PostavFact: TOracleDataSet
    SQL.Strings = (
      'SELECT PROD_NAME,'
      ' '#9#9'   ZAYV_ALL_PROD,ZAYV_ACCEPT_PROD,ZAYV_FACT_PROD,'
      ' '#9#9'   ZAYV_ALL_DOG,ZAYV_ACCEPT_DOG,ZAYV_FACT_DOG,'
      ' '#9#9'   ZAYV_ALL_PLAT,ZAYV_ACCEPT_PLAT,ZAYV_FACT_PLAT'
      '  FROM V_ZAKAZ_TEMP'
      ' WHERE IS_AGENT=2'
      '   AND KIND_VALUE=2'
      #9' AND FILIAL_ID=:FILIAL_ID'
      #9' AND PROD_ID_NPR=:PROD_ID_NPR'
      #9' AND DOG_ID=:DOG_ID'
      #9' AND PLAT_ID=:PLAT_ID'
      '')
    Variables.Data = {
      03000000040000000A0000003A46494C49414C5F494403000000040000001F00
      0000000000000C0000003A50524F445F49445F4E505205000000060000003233
      3630300000000000070000003A444F475F49440300000004000000E307000000
      000000080000003A504C41545F49440300000004000000E304000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000A0000000900000050524F445F4E414D4501000000000D0000005A41
      59565F414C4C5F50524F440100000000100000005A4159565F4143434550545F
      50524F4401000000000E0000005A4159565F464143545F50524F440100000000
      0C0000005A4159565F414C4C5F444F4701000000000F0000005A4159565F4143
      434550545F444F4701000000000D0000005A4159565F464143545F444F470100
      0000000D0000005A4159565F414C4C5F504C41540100000000100000005A4159
      565F4143434550545F504C415401000000000E0000005A4159565F464143545F
      504C41540100000000}
    Master = q_Postav
    MasterFields = 'filial_id;prod_id_npr;dog_id;plat_id'
    DetailFields = 'filial_id;prod_id_npr;dog_id;plat_id'
    Session = oraSes
    Left = 568
    Top = 137
    object q_PostavFactPROD_NAME: TStringField
      FieldName = 'PROD_NAME'
      Size = 200
    end
    object q_PostavFactZAYV_ALL_PROD: TFloatField
      FieldName = 'ZAYV_ALL_PROD'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_PostavFactZAYV_ACCEPT_PROD: TFloatField
      FieldName = 'ZAYV_ACCEPT_PROD'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_PostavFactZAYV_FACT_PROD: TFloatField
      FieldName = 'ZAYV_FACT_PROD'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_PostavFactZAYV_ALL_DOG: TFloatField
      FieldName = 'ZAYV_ALL_DOG'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_PostavFactZAYV_ACCEPT_DOG: TFloatField
      FieldName = 'ZAYV_ACCEPT_DOG'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_PostavFactZAYV_FACT_DOG: TFloatField
      FieldName = 'ZAYV_FACT_DOG'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_PostavFactZAYV_ALL_PLAT: TFloatField
      FieldName = 'ZAYV_ALL_PLAT'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_PostavFactZAYV_ACCEPT_PLAT: TFloatField
      FieldName = 'ZAYV_ACCEPT_PLAT'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_PostavFactZAYV_FACT_PLAT: TFloatField
      FieldName = 'ZAYV_FACT_PLAT'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
  end
  object ds_PostavFact: TDataSource
    DataSet = q_PostavFact
    Left = 572
    Top = 166
  end
  object q_PostavDolg: TOracleDataSet
    SQL.Strings = (
      'SELECT SALDO'
      '  FROM V_ZAKAZ_TEMP'
      ' WHERE IS_AGENT=2'
      '   AND KIND_VALUE=3'
      #9' AND DOG_ID=:DOG_ID'
      '')
    Variables.Data = {
      0300000001000000070000003A444F475F49440300000004000000E307000000
      000000}
    QBEDefinition.QBEFieldDefs = {03000000010000000500000053414C444F0100000000}
    Master = q_Postav
    MasterFields = 'dog_id'
    DetailFields = 'dog_id'
    Session = oraSes
    Left = 632
    Top = 137
    object q_PostavDolgSALDO: TFloatField
      FieldName = 'SALDO'
      DisplayFormat = '# ### ### ##0.00 '#1088#1091#1073
    end
  end
  object ds_PostavDolg: TDataSource
    DataSet = q_PostavDolg
    Left = 636
    Top = 166
  end
  object ds_AgentPlan: TDataSource
    DataSet = q_AgentPlan
    Left = 500
    Top = 246
  end
  object q_AgentPlan: TOracleDataSet
    SQL.Strings = (
      'SELECT PLAN_PROD,PLAN_DOG'
      '  FROM V_ZAKAZ_TEMP'
      ' WHERE IS_AGENT=1'
      '   AND KIND_VALUE=1'
      #9' AND FILIAL_ID=:FILIAL_ID'
      #9' AND PROD_ID_NPR=:PROD_ID_NPR'
      'and DOG_ID=:DOG_ID'
      '')
    Variables.Data = {
      03000000030000000A0000003A46494C49414C5F494403000000040000001F00
      0000000000000C0000003A50524F445F49445F4E505205000000060000003233
      3630300000000000070000003A444F475F4944050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000200000009000000504C414E5F50524F44010000000008000000504C
      414E5F444F470100000000}
    Master = q_Agent
    MasterFields = 'filial_id;prod_id_npr;dog_id'
    DetailFields = 'filial_id;prod_id_npr;dog_id'
    Session = oraSes
    Left = 504
    Top = 217
    object q_AgentPlanPLAN_PROD: TFloatField
      FieldName = 'PLAN_PROD'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_AgentPLAN_DOG: TFloatField
      FieldName = 'PLAN_DOG'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
  end
  object q_AgentFact: TOracleDataSet
    SQL.Strings = (
      'SELECT PROD_NAME,'
      ' '#9#9'   ZAYV_ALL_PROD,ZAYV_ACCEPT_PROD,ZAYV_FACT_PROD,'
      ' '#9#9'   ZAYV_ALL_DOG,ZAYV_ACCEPT_DOG,ZAYV_FACT_DOG,'
      ' '#9#9'   ZAYV_ALL_PLAT,ZAYV_ACCEPT_PLAT,ZAYV_FACT_PLAT'
      '  FROM V_ZAKAZ_TEMP'
      ' WHERE IS_AGENT=1'
      '   AND KIND_VALUE=2'
      #9' AND FILIAL_ID=:FILIAL_ID'
      #9' AND PROD_ID_NPR=:PROD_ID_NPR'
      #9' AND DOG_ID=:DOG_ID'
      #9' AND PLAT_ID=:PLAT_ID'
      '')
    Variables.Data = {
      03000000040000000A0000003A46494C49414C5F494403000000040000001F00
      0000000000000C0000003A50524F445F49445F4E505205000000060000003233
      3630300000000000070000003A444F475F49440300000004000000E307000000
      000000080000003A504C41545F49440300000004000000E304000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000A0000000900000050524F445F4E414D4501000000000D0000005A41
      59565F414C4C5F50524F440100000000100000005A4159565F4143434550545F
      50524F4401000000000E0000005A4159565F464143545F50524F440100000000
      0C0000005A4159565F414C4C5F444F4701000000000F0000005A4159565F4143
      434550545F444F4701000000000D0000005A4159565F464143545F444F470100
      0000000D0000005A4159565F414C4C5F504C41540100000000100000005A4159
      565F4143434550545F504C415401000000000E0000005A4159565F464143545F
      504C41540100000000}
    Master = q_Agent
    MasterFields = 'filial_id;prod_id_npr;dog_id;plat_id'
    DetailFields = 'filial_id;prod_id_npr;dog_id;plat_id'
    Session = oraSes
    Left = 568
    Top = 217
    object StringField1: TStringField
      FieldName = 'PROD_NAME'
      Size = 200
    end
    object FloatField1: TFloatField
      FieldName = 'ZAYV_ALL_PROD'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object FloatField2: TFloatField
      FieldName = 'ZAYV_ACCEPT_PROD'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object FloatField3: TFloatField
      FieldName = 'ZAYV_FACT_PROD'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object FloatField4: TFloatField
      FieldName = 'ZAYV_ALL_DOG'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object FloatField5: TFloatField
      FieldName = 'ZAYV_ACCEPT_DOG'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object FloatField6: TFloatField
      FieldName = 'ZAYV_FACT_DOG'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object FloatField7: TFloatField
      FieldName = 'ZAYV_ALL_PLAT'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object FloatField8: TFloatField
      FieldName = 'ZAYV_ACCEPT_PLAT'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object FloatField9: TFloatField
      FieldName = 'ZAYV_FACT_PLAT'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
  end
  object ds_AgentFact: TDataSource
    DataSet = q_AgentFact
    Left = 572
    Top = 246
  end
  object pmPostav: TTBPopupMenu
    Images = f_main.img_Common
    Left = 304
    Top = 96
    object TBItem42: TTBItem
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100'...'
      OnClick = TBItem42Click
    end
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
      Action = acRequestConsumerAdd
    end
    object TBItem56: TTBItem
      Action = acRequestConsumerCopy
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
    end
    object TBItem57: TTBItem
      Action = acRequestConsumerEdit
    end
    object TBItem58: TTBItem
      Action = acRequestConsumerDel
    end
    object TBItem62: TTBItem
      Action = acRequestConsumerAddOtgr
    end
    object TBItem63: TTBItem
      Action = acRequestConsumerReAddress
    end
    object TBItem64: TTBItem
      Action = acRequestConsumerReAddressAdd
    end
    object TBItem65: TTBItem
      Action = acRequestConsumerCancel
    end
    object TBItem66: TTBItem
      Action = acRequestConsumerCancelAdd
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem38: TTBItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      OnClick = TBItem38Click
    end
    object TBItem59: TTBItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1079#1072#1103#1074#1082#1080' (Word)'
      ImageIndex = 6
    end
    object TBItem60: TTBItem
      Action = acZakazReestrXls
    end
    object TBItem61: TTBItem
      Action = acRequestConsumerToDbf
    end
  end
  object pmAgent: TTBPopupMenu
    Images = f_main.img_Common
    Left = 336
    Top = 96
    object TBItem43: TTBItem
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100'...'
      OnClick = TBItem43Click
    end
    object TBItem23: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem1: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem1AcceptText
    end
    object TBItem24: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem24Click
    end
    object TBItem26: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem26Click
    end
    object TBSeparatorItem6: TTBSeparatorItem
    end
    object TBItem28: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem28Click
    end
    object TBItem73: TTBItem
      Action = acRequestConsumerAdd
    end
    object TBItem72: TTBItem
      Action = acRequestConsumerCopy
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
    end
    object TBItem71: TTBItem
      Action = acRequestConsumerEdit
    end
    object TBItem70: TTBItem
      Action = acRequestConsumerDel
    end
    object TBItem69: TTBItem
      Action = acRequestConsumerAddOtgr
    end
    object TBItem76: TTBItem
      Action = acRequestConsumerReAddress
    end
    object TBItem75: TTBItem
      Action = acRequestConsumerReAddressAdd
    end
    object TBItem74: TTBItem
      Action = acRequestConsumerCancel
    end
    object TBItem77: TTBItem
      Action = acRequestConsumerCancelAdd
    end
    object TBSeparatorItem10: TTBSeparatorItem
    end
    object TBSubmenuItem2: TTBSubmenuItem
      Caption = #1057#1074#1103#1079#1080
      object TBItem13: TTBItem
        Action = acZakazLinkZakazSNP
      end
      object TBItem8: TTBItem
        Action = acZakazLinkMonth
      end
    end
    object TBSeparatorItem17: TTBSeparatorItem
    end
    object TBItem39: TTBItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      OnClick = TBItem39Click
    end
    object TBItem68: TTBItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1079#1072#1103#1074#1082#1080' (Word)'
      ImageIndex = 6
    end
    object TBItem67: TTBItem
      Action = acZakazReestrXls
    end
    object TBItem78: TTBItem
      Action = acRequestConsumerToDbf
    end
  end
  object pmPostavHist: TTBPopupMenu
    Left = 392
    Top = 96
    object TBItem29: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem3: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem3AcceptText
    end
    object TBItem31: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem31Click
    end
    object TBItem32: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem32Click
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem33: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem33Click
    end
    object TBItem80: TTBItem
      Action = acZakazHistEdit
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1087#1086#1079#1080#1094#1080#1080
    end
    object TBItem81: TTBItem
      Action = acRequestConsumerAddOtgr
    end
    object TBItem85: TTBItem
      Action = acRequestConsumerReAddress
    end
    object TBItem84: TTBItem
      Action = acRequestConsumerReAddressAdd
    end
    object TBItem83: TTBItem
      Action = acRequestConsumerCancel
    end
    object TBItem82: TTBItem
      Action = acRequestConsumerCancelAdd
    end
    object TBItem79: TTBItem
      Action = acZakazHistDel
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
    end
    object TBSeparatorItem11: TTBSeparatorItem
    end
    object TBSubmenuItem1: TTBSubmenuItem
      Caption = #1057#1074#1103#1079#1080
      object TBItem100: TTBItem
        Action = acZakazLinkZakazUNP
      end
    end
    object TBSeparatorItem18: TTBSeparatorItem
    end
    object TBItem40: TTBItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      OnClick = TBItem40Click
    end
    object TBItem86: TTBItem
      Action = acZakazHistWord
    end
  end
  object pmAgentHist: TTBPopupMenu
    Left = 464
    Top = 104
    object TBItem34: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem4: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem4AcceptText
    end
    object TBItem35: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem35Click
    end
    object TBItem36: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem36Click
    end
    object TBSeparatorItem8: TTBSeparatorItem
    end
    object TBItem37: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem37Click
    end
    object TBItem93: TTBItem
      Action = acZakazHistEdit
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1087#1086#1079#1080#1094#1080#1080
    end
    object TBItem92: TTBItem
      Action = acRequestConsumerAddOtgr
    end
    object TBItem91: TTBItem
      Action = acRequestConsumerReAddress
    end
    object TBItem90: TTBItem
      Action = acRequestConsumerReAddressAdd
    end
    object TBItem89: TTBItem
      Action = acRequestConsumerCancel
    end
    object TBItem88: TTBItem
      Action = acRequestConsumerCancelAdd
    end
    object TBItem94: TTBItem
      Action = acZakazHistDel
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
    end
    object TBSeparatorItem12: TTBSeparatorItem
    end
    object TBItem41: TTBItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      OnClick = TBItem41Click
    end
    object TBItem87: TTBItem
      Action = acZakazHistWord
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 344
    Top = 296
  end
  object q_Parus: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '  mon.ROWID, mon.PARUS_RN, 3 as IS_AGENT, mon.DATE_PLAN, '
      
        '  mon.CLIENT_NUMBER, mon.CLIENT_DATE, mon.INPUT_NUMBER, mon.INPU' +
        'T_DATE,'
      
        '  mon.IS_ACCEPT, mon.IS_WORK, NVL(mon.FILIAL_ID,-1) as FILIAL_ID' +
        ', '
      '  mon.PARUS_AGENT_TAG, mon.PARUS_NOMEN_TAG, mon.USL_OPL_ID, '
      '  mon.POLUCH_NAME, mon.POTREB_NAME, mon.NEFTEBASA, '
      '  mon.PRICE_CLIENT, mon.PRICE, mon.VES, mon.FACT_VES, '
      '  mon.PRIM, '
      '  TO_CHAR(mon.date_plan, '#39'Month YYYY'#39') AS d_plan,'
      '  mon.PARUS_AGENT_NAME, '
      '  mon.PARUS_DOGOVOR,'
      '  mon.PARUS_NOMEN_NAME, '
      '  KLS_USL_OPL.NAME as USL_OPL_NAME,'
      '  ORG_STRUCTURE.FULL_NAME as FILIAL_NAME'
      'FROM ZAKAZ_PARUS mon,'
      '     KLS_USL_OPL,ORG_STRUCTURE'
      'WHERE mon.FILIAL_ID=ORG_STRUCTURE.ID '
      '  AND mon.USL_OPL_ID=KLS_USL_OPL.ID (+)'
      
        '  AND mon.DATE_PLAN>=TO_DATE('#39'01.09.2004'#39','#39'dd.mm.yyyy'#39') AND  mon' +
        '.DATE_PLAN<=TO_DATE('#39'30.09.2004'#39','#39'dd.mm.yyyy'#39') '
      '  AND 1=1 -- '#1060#1080#1083#1100#1090#1088' '
      'ORDER BY mon.PARUS_RN desc')
    QBEDefinition.QBEFieldDefs = {
      030000001B0000000800000049535F4147454E54010000000009000000444154
      455F504C414E01000000000D000000434C49454E545F4E554D42455201000000
      000B000000434C49454E545F4441544501000000000C000000494E5055545F4E
      554D42455201000000000A000000494E5055545F444154450100000000090000
      0049535F41434345505401000000000900000046494C49414C5F494401000000
      000A00000055534C5F4F504C5F494401000000000B000000504F545245425F4E
      414D450100000000090000004E454654454241534101000000000C0000005052
      4943455F434C49454E5401000000000500000050524943450100000000030000
      00564553010000000008000000464143545F564553010000000006000000445F
      504C414E01000000000C00000055534C5F4F504C5F4E414D4501000000000B00
      000046494C49414C5F4E414D4501000000000B000000504F4C5543485F4E414D
      450100000000040000005052494D01000000000800000050415255535F524E01
      000000000700000049535F574F524B01000000000F00000050415255535F4147
      454E545F54414701000000000F00000050415255535F4E4F4D454E5F54414701
      000000001000000050415255535F4147454E545F4E414D4501000000000D0000
      0050415255535F444F474F564F5201000000001000000050415255535F4E4F4D
      454E5F4E414D450100000000}
    UniqueFields = 'PARUS_RN'
    RefreshOptions = [roBeforeEdit, roAfterUpdate]
    UpdatingTable = 'ZAKAZ_PARUS'
    Session = oraSes
    AfterScroll = q_ParusAfterScroll
    OnFilterRecord = q_ParusFilterRecord
    Left = 44
    Top = 182
    object q_ParusDATE_PLAN: TDateTimeField
      FieldName = 'DATE_PLAN'
      Required = True
    end
    object q_ParusCLIENT_NUMBER: TStringField
      DisplayLabel = #1048#1089#1093'. '#8470
      FieldName = 'CLIENT_NUMBER'
      Size = 50
    end
    object q_ParusCLIENT_DATE: TDateTimeField
      DisplayLabel = #1048#1089#1093'. '#1076#1072#1090#1072
      FieldName = 'CLIENT_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_ParusINPUT_NUMBER: TStringField
      DisplayLabel = #1042#1093'. '#8470
      FieldName = 'INPUT_NUMBER'
      Required = True
      Size = 50
    end
    object q_ParusINPUT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1075'.'
      FieldName = 'INPUT_DATE'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_ParusIS_ACCEPT: TIntegerField
      DisplayLabel = #1059#1090'- '#1074#1077#1088'- '#1076#1080#1090#1100
      FieldName = 'IS_ACCEPT'
      Required = True
    end
    object q_ParusNEFTEBASA: TStringField
      DisplayLabel = #1053#1077#1092#1090#1077#1073#1072#1079#1072
      FieldName = 'NEFTEBASA'
      Size = 50
    end
    object q_ParusPRICE_CLIENT: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'PRICE_CLIENT'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object q_ParusPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object q_ParusVES: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086', '#1090#1085
      FieldName = 'VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_ParusFACT_VES: TFloatField
      DisplayLabel = #1048#1089#1087#1086#1083'- '#1085#1077#1085#1086', '#1090#1085
      FieldName = 'FACT_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_ParusPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 100
    end
    object q_ParusD_PLAN: TStringField
      DisplayLabel = #1055#1077#1088#1080#1086#1076
      FieldName = 'D_PLAN'
      Size = 14
    end
    object q_ParusPARUS_AGENT_NAME: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'PARUS_AGENT_NAME'
      Required = True
      Size = 60
    end
    object q_ParusPARUS_DOGOVOR: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldName = 'PARUS_DOGOVOR'
      Size = 30
    end
    object q_ParusPARUS_NOMEN_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'PARUS_NOMEN_NAME'
      Required = True
      Size = 60
    end
    object q_ParusUSL_OPL_NAME: TStringField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1103' '#1086#1087#1083#1072#1090#1099
      FieldName = 'USL_OPL_NAME'
      Size = 40
    end
    object q_ParusFILIAL_NAME: TStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'FILIAL_NAME'
      Size = 50
    end
    object q_ParusPOLUCH_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'POLUCH_NAME'
      Size = 60
    end
    object q_ParusPOTREB_NAME: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
      FieldName = 'POTREB_NAME'
      Size = 60
    end
    object q_ParusPARUS_RN: TFloatField
      FieldName = 'PARUS_RN'
      Required = True
    end
    object q_ParusIS_AGENT: TFloatField
      FieldName = 'IS_AGENT'
    end
    object q_ParusIS_WORK: TIntegerField
      DisplayLabel = #1054#1090'- '#1075#1088#1091'- '#1079#1080#1090#1100
      FieldName = 'IS_WORK'
    end
    object q_ParusFILIAL_ID: TFloatField
      FieldName = 'FILIAL_ID'
    end
    object q_ParusPARUS_AGENT_TAG: TStringField
      FieldName = 'PARUS_AGENT_TAG'
    end
    object q_ParusPARUS_NOMEN_TAG: TStringField
      FieldName = 'PARUS_NOMEN_TAG'
    end
    object q_ParusUSL_OPL_ID: TFloatField
      FieldName = 'USL_OPL_ID'
    end
  end
  object ds_Parus: TDataSource
    DataSet = q_Parus
    Left = 44
    Top = 230
  end
  object pmParus: TTBPopupMenu
    Images = f_main.img_Common
    Left = 528
    Top = 104
    object TBItem95: TTBItem
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100'...'
      OnClick = btFilterClick
    end
    object TBItem96: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem5: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem5AcceptText
    end
    object TBItem97: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem97Click
    end
    object TBItem98: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem98Click
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItem99: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem99Click
    end
    object TBSeparatorItem16: TTBSeparatorItem
    end
    object TBItem109: TTBItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      OnClick = TBItem109Click
    end
    object TBItem111: TTBItem
      Action = acZakazReestrXls
    end
  end
  object q_ParusPlan: TOracleDataSet
    SQL.Strings = (
      'SELECT PLAN_NB,PLAN_AZS,PLAN_TRAN,PLAN_VNCORPTR'
      '  FROM V_ZAKAZ_TEMP'
      ' WHERE IS_AGENT=9'
      '   AND KIND_VALUE=1'
      #9' AND FILIAL_ID=:FILIAL_ID'
      #9' AND PARUS_NOMEN_TAG=:PARUS_NOMEN_TAG'
      '')
    Variables.Data = {
      03000000020000000A0000003A46494C49414C5F494403000000040000001F00
      000000000000100000003A50415255535F4E4F4D454E5F544147050000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000400000007000000504C414E5F4E42010000000009000000504C414E
      5F5452414E01000000000D000000504C414E5F564E434F525054520100000000
      08000000504C414E5F415A530100000000}
    Master = q_Parus
    MasterFields = 'filial_id;parus_nomen_tag'
    Session = oraSes
    Left = 104
    Top = 241
    object q_ParusPLAN_NB: TFloatField
      FieldName = 'PLAN_NB'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_ParusPLAN_AZS: TFloatField
      FieldName = 'PLAN_AZS'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_ParusPLAN_VNCORPTR: TFloatField
      FieldName = 'PLAN_VNCORPTR'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_ParusPLAN_TRAN: TFloatField
      FieldName = 'PLAN_TRAN'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
  end
  object ds_ParusPlan: TDataSource
    DataSet = q_ParusPlan
    Left = 100
    Top = 270
  end
  object q_ParusFact: TOracleDataSet
    SQL.Strings = (
      'SELECT PROD_NAME,'
      ' '#9#9'   ZAYV_ALL_PROD,ZAYV_ACCEPT_PROD,ZAYV_FACT_PROD,'
      ' '#9#9'   ZAYV_ALL_DOG,ZAYV_ACCEPT_DOG,ZAYV_FACT_DOG,'
      ' '#9#9'   ZAYV_ALL_PLAT,ZAYV_ACCEPT_PLAT,ZAYV_FACT_PLAT'
      '  FROM V_ZAKAZ_TEMP'
      ' WHERE IS_AGENT=9'
      '   AND KIND_VALUE=2'
      #9' AND FILIAL_ID=:FILIAL_ID'
      #9' AND PARUS_NOMEN_TAG=:PARUS_NOMEN_TAG'
      #9' AND PARUS_DOGOVOR=:PARUS_DOGOVOR'
      #9' AND PARUS_AGENT_TAG=:PARUS_AGENT_TAG'
      '')
    Variables.Data = {
      03000000040000000A0000003A46494C49414C5F494403000000040000001F00
      000000000000100000003A50415255535F4E4F4D454E5F544147050000000000
      0000000000000E0000003A50415255535F444F474F564F520500000000000000
      00000000100000003A50415255535F4147454E545F5441470500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      030000000A0000000900000050524F445F4E414D4501000000000D0000005A41
      59565F414C4C5F50524F440100000000100000005A4159565F4143434550545F
      50524F4401000000000E0000005A4159565F464143545F50524F440100000000
      0C0000005A4159565F414C4C5F444F4701000000000F0000005A4159565F4143
      434550545F444F4701000000000D0000005A4159565F464143545F444F470100
      0000000D0000005A4159565F414C4C5F504C41540100000000100000005A4159
      565F4143434550545F504C415401000000000E0000005A4159565F464143545F
      504C41540100000000}
    Master = q_Parus
    MasterFields = 'filial_id;parus_nomen_tag;parus_dogovor;parus_agent_tag'
    Session = oraSes
    Left = 160
    Top = 249
    object q_ParusPROD_NAME: TStringField
      FieldName = 'PROD_NAME'
      Size = 200
    end
    object q_ParusZAYV_ALL_PROD: TFloatField
      FieldName = 'ZAYV_ALL_PROD'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_ParusZAYV_ACCEPT_PROD: TFloatField
      FieldName = 'ZAYV_ACCEPT_PROD'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_ParusZAYV_FACT_PROD: TFloatField
      FieldName = 'ZAYV_FACT_PROD'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_ParusZAYV_ALL_DOG: TFloatField
      FieldName = 'ZAYV_ALL_DOG'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_ParusZAYV_ACCEPT_DOG: TFloatField
      FieldName = 'ZAYV_ACCEPT_DOG'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_ParusZAYV_FACT_DOG: TFloatField
      FieldName = 'ZAYV_FACT_DOG'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_ParusZAYV_ALL_PLAT: TFloatField
      FieldName = 'ZAYV_ALL_PLAT'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_ParusZAYV_ACCEPT_PLAT: TFloatField
      FieldName = 'ZAYV_ACCEPT_PLAT'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
    object q_ParusZAYV_FACT_PLAT: TFloatField
      FieldName = 'ZAYV_FACT_PLAT'
      DisplayFormat = '#0.000 '#1090#1085
      EditFormat = '#0.000'
    end
  end
  object ds_ParusFact: TDataSource
    DataSet = q_ParusFact
    Left = 164
    Top = 278
  end
  object q_ParusDolg: TOracleDataSet
    SQL.Strings = (
      'SELECT SALDO'
      '  FROM V_ZAKAZ_TEMP'
      ' WHERE IS_AGENT=9'
      '   AND KIND_VALUE=3'
      #9' AND PARUS_DOGOVOR=:PARUS_DOGOVOR'
      '')
    Variables.Data = {
      03000000010000000E0000003A50415255535F444F474F564F52050000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {03000000010000000500000053414C444F0100000000}
    Master = q_Parus
    MasterFields = 'parus_dogovor'
    Session = oraSes
    Left = 208
    Top = 249
    object q_ParusDolgSALDO: TFloatField
      FieldName = 'SALDO'
      DisplayFormat = '# ### ### ##0.00 '#1088#1091#1073
      EditFormat = '#0.00'
    end
  end
  object ds_ParusDolg: TDataSource
    DataSet = q_ParusDolg
    Left = 212
    Top = 278
  end
end
