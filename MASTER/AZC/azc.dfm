inherited f_forAZCRealiz: Tf_forAZCRealiz
  Left = 277
  Top = 136
  Width = 922
  Height = 515
  Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1089' '#1085'/'#1087#1088' '#1074' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1093' '#1051#1059#1050#1054#1049#1051'-'#1057#1053#1055
  FormStyle = fsMDIForm
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 232
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label4'
  end
  object TBToolbar1: TTBToolbar
    Left = 0
    Top = 0
    Width = 914
    Height = 22
    Align = alTop
    Caption = 'TBToolbar1'
    Images = f_main.img_Common
    TabOrder = 0
    object TBItem5: TTBItem
      Action = ac_AZCOper_all
      DisplayMode = nbdmImageAndText
      ImageIndex = 0
    end
    object TBItem1: TTBItem
      Action = ac_AZCOper_all_e
      DisplayMode = nbdmImageAndText
      ImageIndex = 8
    end
    object TBItem4: TTBItem
      Action = ac_AZCOper_all_d
      DisplayMode = nbdmImageAndText
      ImageIndex = 5
    end
    object TBItem2: TTBItem
      Action = ac_AZCOper_all_rem
      DisplayMode = nbdmImageAndText
      ImageIndex = 38
    end
    object TBItem3: TTBItem
      Action = acAzcFromParus
      DisplayMode = nbdmImageAndText
    end
    object TBControlItem2: TTBControlItem
      Control = CheckBox1
    end
    object TBControlItem1: TTBControlItem
      Control = SpeedButton1
    end
    object SpeedButton1: TSpeedButton
      Left = 580
      Top = 0
      Width = 56
      Height = 22
      Caption = 'OK'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object CheckBox1: TCheckBox
      Left = 512
      Top = 2
      Width = 68
      Height = 17
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 0
      OnClick = CheckBox1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 452
    Width = 914
    Height = 29
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      914
      29)
    object Label1: TLabel
      Left = 5
      Top = 7
      Width = 43
      Height = 13
      Anchors = [akLeft]
      Caption = #1057' '#1044#1040#1058#1067
    end
    object Label2: TLabel
      Left = 150
      Top = 7
      Width = 50
      Height = 13
      Anchors = [akLeft]
      Caption = #1055#1054' '#1044#1040#1058#1059
    end
    object Label5: TLabel
      Left = 298
      Top = 7
      Width = 50
      Height = 13
      Anchors = [akLeft]
      Caption = #1060#1048#1051#1048#1040#1051
    end
    object Label3: TLabel
      Left = 605
      Top = 7
      Width = 63
      Height = 13
      Anchors = [akLeft]
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072':'
    end
    object date_begin: TDateEdit
      Left = 53
      Top = 4
      Width = 92
      Height = 18
      Anchors = [akLeft]
      NumGlyphs = 2
      TabOrder = 0
    end
    object date_end: TDateEdit
      Left = 205
      Top = 4
      Width = 89
      Height = 18
      Anchors = [akLeft]
      NumGlyphs = 2
      TabOrder = 1
    end
    object lc_Filial: TDBLookupComboBox
      Left = 351
      Top = 3
      Width = 249
      Height = 21
      Anchors = [akLeft]
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = ds_Filials
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 672
      Top = 3
      Width = 144
      Height = 21
      Anchors = [akLeft]
      ItemHeight = 13
      TabOrder = 3
      Text = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
      OnCloseUp = ComboBox1CloseUp
      Items.Strings = (
        #1055#1086' '#1084#1077#1088#1077' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103
        #1042' '#1086#1073#1088#1072#1090#1085#1086#1084' '#1087#1086#1088#1103#1076#1082#1077)
    end
    object btRefresh: TButton
      Left = 821
      Top = 2
      Width = 84
      Height = 23
      Anchors = [akLeft]
      Caption = 'OK'
      TabOrder = 4
      OnClick = btRefreshClick
    end
  end
  object PC_operation: TPageControl
    Left = 0
    Top = 22
    Width = 914
    Height = 430
    ActivePage = TabSheet5
    Align = alClient
    TabOrder = 2
    OnChange = PC_operationChange
    object TabSheet1: TTabSheet
      Caption = #1056#1072#1089#1093#1086#1076
      object gr_AZCReal: TDBGridEh
        Left = 0
        Top = 0
        Width = 906
        Height = 409
        Align = alClient
        AllowedOperations = []
        Color = clWhite
        DataSource = DS_azc_realiz
        FixedColor = clActiveBorder
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clMoneyGreen
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
        ParentFont = False
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnDblClick = ac_AZCOper_all_eExecute
        OnGetCellParams = gr_AZCRealGetCellParams
        OnKeyDown = gr_AZCRealKeyDown
        OnSortMarkingChanged = gr_AZCRealSortMarkingChanged
        Columns = <
          item
            DropDownSpecRow.Value = 0d
            EditButtons = <>
            FieldName = 'DATE_OPER'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'NAME_OPER'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
            Title.TitleButton = True
            Width = 126
          end
          item
            EditButtons = <>
            FieldName = 'NAME_1'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1082#1090
            Title.TitleButton = True
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'NAME_NPR'
            Footers = <>
            Title.Caption = #1055#1088#1086#1076#1091#1082#1090
            Title.TitleButton = True
            Width = 98
          end
          item
            EditButtons = <>
            FieldName = 'SHORT_NAME'
            Footers = <>
            Title.Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
            Title.TitleButton = True
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'VOLUME'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1084
            Title.TitleButton = True
            Width = 44
          end
          item
            DisplayFormat = '#0.00'
            EditButtons = <>
            FieldName = 'VES'
            Footer.FieldName = 'VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1042#1077#1089
            Title.TitleButton = True
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'DENCITY'
            Footers = <>
            Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
            Title.TitleButton = True
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'SUMMA'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1044#1077#1085#1100#1075#1080
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'FOR_AZC'
            Footers = <>
            Title.Caption = #1057#1082#1080#1076#1082#1072
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'DATE_INTO'
            Footers = <>
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1088#1080#1093#1086#1076
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 906
        Height = 409
        Align = alClient
        AllowedOperations = []
        DataSource = DS_azc_realiz
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clMoneyGreen
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
        ParentFont = False
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnDblClick = ac_AZCOper_all_eExecute
        OnGetCellParams = DBGridEh1GetCellParams
        OnKeyDown = DBGridEh1KeyDown
        OnSortMarkingChanged = gr_AZCRealSortMarkingChanged
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'DATE_OPER'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'NAME_OPER'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
            Title.TitleButton = True
            Width = 126
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'NAME_1'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1082#1090
            Title.TitleButton = True
            Width = 122
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'NAME_NPR'
            Footers = <>
            Title.Caption = #1055#1088#1086#1076#1091#1082#1090
            Title.TitleButton = True
            Width = 128
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'SHORT_NAME'
            Footers = <>
            Title.Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
            Title.TitleButton = True
            Width = 110
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'NAME_2'
            Footers = <>
            Title.Caption = #1052#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080
            Title.TitleButton = True
            Width = 102
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'VOLUME'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1084
            Title.TitleButton = True
            Width = 43
          end
          item
            DisplayFormat = '#0.00'
            EditButtons = <>
            FieldName = 'VES'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = 10
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Footer.FieldName = 'VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1042#1077#1089
            Title.TitleButton = True
            Width = 36
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'DENCITY'
            Footer.DisplayFormat = '#.#'
            Footers = <>
            Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
            Title.TitleButton = True
            Width = 63
          end
          item
            EditButtons = <>
            FieldName = 'DATE_INTO'
            Footers = <>
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1054#1089#1090#1072#1090#1086#1082
      ImageIndex = 2
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 906
        Height = 409
        Align = alClient
        AllowedOperations = []
        DataSource = DS_azc_realiz
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clMoneyGreen
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
        ParentFont = False
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnDblClick = ac_AZCOper_all_eExecute
        OnGetCellParams = DBGridEh2GetCellParams
        OnKeyDown = DBGridEh1KeyDown
        OnSortMarkingChanged = gr_AZCRealSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DATE_OPER'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'NAME_OPER'
            Footer.FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
            Title.TitleButton = True
            Width = 112
          end
          item
            EditButtons = <>
            FieldName = 'NAME_1'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1082#1090
            Title.TitleButton = True
            Width = 122
          end
          item
            EditButtons = <>
            FieldName = 'NAME_NPR'
            Footers = <>
            Title.Caption = #1055#1088#1086#1076#1091#1082#1090
            Title.TitleButton = True
            Width = 144
          end
          item
            EditButtons = <>
            FieldName = 'SHORT_NAME'
            Footers = <>
            Title.Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
            Title.TitleButton = True
            Width = 128
          end
          item
            EditButtons = <>
            FieldName = 'VOLUME'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1084
            Title.TitleButton = True
            Width = 75
          end
          item
            DisplayFormat = '#0.00'
            EditButtons = <>
            FieldName = 'VES'
            Footer.FieldName = 'VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1042#1077#1089
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'DENCITY'
            Footers = <>
            Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'DATE_INTO'
            Footers = <>
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1051#1080#1082#1072#1088#1076
      ImageIndex = 3
      object DBGridEh3: TDBGridEh
        Left = 0
        Top = 0
        Width = 906
        Height = 409
        Align = alClient
        AllowedOperations = []
        DataSource = DS_likard
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clMoneyGreen
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
        ParentFont = False
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnDblClick = ac_AZCOper_all_eExecute
        OnGetCellParams = DBGridEh3GetCellParams
        OnKeyDown = DBGridEh1KeyDown
        OnSortMarkingChanged = gr_AZCRealSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DATE_OPER'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'NAME_1'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1082#1090
            Title.TitleButton = True
            Width = 122
          end
          item
            EditButtons = <>
            FieldName = 'NAME_NPR'
            Footers = <>
            Title.Caption = #1055#1088#1086#1076#1091#1082#1090
            Title.TitleButton = True
            Width = 144
          end
          item
            EditButtons = <>
            FieldName = 'SHORT_NAME'
            Footers = <>
            Title.Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
            Title.TitleButton = True
            Width = 128
          end
          item
            EditButtons = <>
            FieldName = 'DENCITY'
            Footers = <>
            Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'VOLUME'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1084
            Title.TitleButton = True
          end
          item
            DisplayFormat = '#0.00'
            EditButtons = <>
            FieldName = 'VES'
            Footers = <>
            Title.Caption = #1042#1077#1089
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072
            Title.TitleButton = True
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'SUMMA'
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072
            Title.TitleButton = True
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'FOR_AZC'
            Footers = <>
            Title.Caption = #1057#1082#1080#1076#1082#1072
          end
          item
            EditButtons = <>
            FieldName = 'DATE_INTO'
            Footers = <>
          end>
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1043#1088#1091#1079' '#1074' '#1087#1091#1090#1080
      ImageIndex = 4
      object DBGridEh4: TDBGridEh
        Left = 0
        Top = 0
        Width = 906
        Height = 402
        Align = alClient
        AllowedOperations = []
        Color = clWhite
        DataSource = DS_good
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clMoneyGreen
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
        ParentFont = False
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnDblClick = ac_AZCOper_all_eExecute
        OnGetCellParams = DBGridEh4GetCellParams
        OnKeyDown = DBGridEh1KeyDown
        OnSortMarkingChanged = gr_AZCRealSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DATE_OPER'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'NAME_1'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1082#1090
            Title.TitleButton = True
            Width = 122
          end
          item
            EditButtons = <>
            FieldName = 'NAME_NPR'
            Footers = <>
            Title.Caption = #1055#1088#1086#1076#1091#1082#1090
            Title.TitleButton = True
            Width = 236
          end
          item
            EditButtons = <>
            FieldName = 'SHORT_NAME'
            Footers = <>
            Title.Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
            Title.TitleButton = True
            Width = 147
          end
          item
            EditButtons = <>
            FieldName = 'VOLUME'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1084
            Title.TitleButton = True
          end
          item
            DisplayFormat = '#0.00'
            EditButtons = <>
            FieldName = 'VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1042#1077#1089
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'DENCITY'
            Footers = <>
            Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'DATE_INTO'
            Footers = <>
          end>
      end
    end
    object TabSheet6: TTabSheet
      Caption = #1048#1090#1086#1075#1080
      ImageIndex = 5
      object Pagec_itogs: TPageControl
        Left = 0
        Top = 0
        Width = 906
        Height = 402
        ActivePage = TabSheet7
        Align = alClient
        TabOrder = 0
        OnChange = Pagec_itogsChange
        object TabSheet7: TTabSheet
          Caption = #1054#1089#1090#1072#1090#1086#1082
          object DBGrid_ostatok_all: TDBGridEh
            Left = 0
            Top = 0
            Width = 898
            Height = 381
            Align = alClient
            AllowedOperations = []
            DataSource = DS_itogs
            Flat = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            FooterColor = clMoneyGreen
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            FooterRowCount = 1
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
            ParentFont = False
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnGetCellParams = DBGrid_ostatok_allGetCellParams
            OnSortMarkingChanged = DBGrid_ostatok_allSortMarkingChanged
            Columns = <
              item
                Color = clWhite
                EditButtons = <>
                FieldName = 'SHORT_NAME'
                Footer.FieldName = 'SHORT_NAME'
                Footers = <>
                Title.Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
                Title.TitleButton = True
                Width = 193
              end
              item
                Color = clWhite
                EditButtons = <>
                FieldName = 'NAME_NPR'
                Footer.FieldName = 'NAME_NPR'
                Footers = <>
                Title.Caption = #1055#1088#1086#1076#1091#1082#1090
                Title.TitleButton = True
                Width = 190
              end
              item
                Color = clWhite
                EditButtons = <>
                FieldName = 'NAME_1'
                Footer.FieldName = 'NAME_1'
                Footers = <>
                Title.Caption = #1054#1073#1098#1077#1082#1090
                Title.TitleButton = True
                Width = 163
              end
              item
                EditButtons = <>
                FieldName = 'VOL_SUM'
                Footer.FieldName = 'VOL_SUM'
                Footer.Value = 'VOL'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #1054#1073#1098#1077#1084
                Title.TitleButton = True
              end
              item
                DisplayFormat = '#0.00'
                EditButtons = <>
                FieldName = 'VES_SUM'
                Footer.FieldName = 'VES_SUM'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #1042#1077#1089
                Title.TitleButton = True
                Width = 60
              end>
          end
        end
        object TabSheet8: TTabSheet
          Caption = #1056#1072#1089#1093#1086#1076
          ImageIndex = 1
          object DBGrid_real_all: TDBGridEh
            Left = 0
            Top = 0
            Width = 898
            Height = 399
            Align = alClient
            AllowedOperations = []
            DataSource = DS_itogs_op
            Flat = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            FooterColor = clMoneyGreen
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            FooterRowCount = 1
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
            ParentFont = False
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnGetCellParams = DBGrid_ostatok_allGetCellParams
            OnSortMarkingChanged = DBGrid_ostatok_allSortMarkingChanged
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Name_oper'
                Footers = <>
                Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
                Title.TitleButton = True
                Width = 110
              end
              item
                EditButtons = <>
                FieldName = 'SHORT_NAME'
                Footer.FieldName = 'SHORT_NAME'
                Footers = <>
                Title.Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
                Title.TitleButton = True
                Width = 193
              end
              item
                EditButtons = <>
                FieldName = 'NAME_NPR'
                Footer.FieldName = 'NAME_NPR'
                Footers = <>
                Title.Caption = #1055#1088#1086#1076#1091#1082#1090
                Title.TitleButton = True
                Width = 190
              end
              item
                EditButtons = <>
                FieldName = 'NAME_1'
                Footer.FieldName = 'NAME_1'
                Footer.ValueType = fvtFieldValue
                Footers = <>
                Title.Caption = #1054#1073#1098#1077#1082#1090
                Title.TitleButton = True
                Width = 163
              end
              item
                EditButtons = <>
                FieldName = 'VOL_SUM'
                Footer.FieldName = 'VOL_SUM'
                Footer.Value = 'VOL'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #1054#1073#1098#1077#1084
                Title.TitleButton = True
              end
              item
                DisplayFormat = '#0.00'
                EditButtons = <>
                FieldName = 'VES_SUM'
                Footer.FieldName = 'VES_SUM'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #1042#1077#1089
                Title.TitleButton = True
                Width = 55
              end
              item
                EditButtons = <>
                FieldName = 'MONEYS'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #1044#1077#1085#1100#1075#1080
                Title.TitleButton = True
              end>
          end
        end
        object TabSheet9: TTabSheet
          Caption = #1055#1088#1080#1093#1086#1076
          ImageIndex = 2
          object DBGrid_prihod_all: TDBGridEh
            Left = 0
            Top = 0
            Width = 898
            Height = 399
            Align = alClient
            AllowedOperations = []
            DataSource = DS_itogs_op
            Flat = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            FooterColor = clMoneyGreen
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            FooterRowCount = 1
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
            ParentFont = False
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnGetCellParams = DBGrid_ostatok_allGetCellParams
            OnSortMarkingChanged = DBGrid_ostatok_allSortMarkingChanged
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Name_oper'
                Footers = <>
                Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
                Title.TitleButton = True
                Width = 110
              end
              item
                EditButtons = <>
                FieldName = 'SHORT_NAME'
                Footer.FieldName = 'SHORT_NAME'
                Footers = <>
                Title.Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
                Title.TitleButton = True
                Width = 193
              end
              item
                EditButtons = <>
                FieldName = 'NAME_NPR'
                Footer.FieldName = 'NAME_NPR'
                Footers = <>
                Title.Caption = #1055#1088#1086#1076#1091#1082#1090
                Title.TitleButton = True
                Width = 190
              end
              item
                EditButtons = <>
                FieldName = 'NAME_1'
                Footer.FieldName = 'NAME_1'
                Footers = <>
                Title.Caption = #1054#1073#1098#1077#1082#1090
                Title.TitleButton = True
                Width = 163
              end
              item
                EditButtons = <>
                FieldName = 'VOL_SUM'
                Footer.FieldName = 'VOL_SUM'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #1054#1073#1098#1077#1084
                Title.TitleButton = True
              end
              item
                DisplayFormat = '#0.00'
                EditButtons = <>
                FieldName = 'VES_SUM'
                Footer.FieldName = 'VES_SUM'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #1042#1077#1089
                Title.TitleButton = True
                Width = 55
              end>
          end
        end
        object TabSheet10: TTabSheet
          Caption = #1044#1077#1085#1100#1075#1080
          ImageIndex = 3
          DesignSize = (
            898
            374)
          object DBGrid_all: TDBGridEh
            Left = 0
            Top = 0
            Width = 898
            Height = 374
            Align = alClient
            AllowedOperations = []
            DataSource = DS_itog_all
            Flat = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            FooterColor = clMoneyGreen
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            FooterRowCount = 1
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
            ParentFont = False
            SumList.Active = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnGetCellParams = DBGrid_ostatok_allGetCellParams
            OnSortMarkingChanged = DBGrid_ostatok_allSortMarkingChanged
            OnTitleBtnClick = DBGrid_allTitleBtnClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'NAME_1'
                Footers = <>
                Title.Caption = #1054#1073#1098#1077#1082#1090
                Title.TitleButton = True
                Width = 170
              end
              item
                DisplayFormat = '#0.00'
                EditButtons = <>
                FieldName = 'VES_SUM'
                Footers = <>
                Title.Caption = #1042#1077#1089
                Title.TitleButton = True
              end
              item
                EditButtons = <>
                FieldName = 'VOL_SUM'
                Footers = <>
                Title.Caption = #1054#1073#1098#1077#1084
                Title.TitleButton = True
              end
              item
                EditButtons = <>
                FieldName = 'MONEY'
                Footers = <>
                Title.Caption = #1057#1091#1084#1084#1072
                Title.TitleButton = True
              end>
          end
          object ComboBox2: TComboBox
            Left = 145
            Top = 361
            Width = 145
            Height = 21
            Anchors = []
            ItemHeight = 13
            TabOrder = 1
            Text = #1055#1086' '#1086#1073#1098#1077#1082#1090#1072#1084
            OnChange = ComboBox2Change
            Items.Strings = (
              #1055#1086' '#1086#1073#1098#1077#1082#1090#1072#1084
              #1055#1086' '#1086#1073#1098#1077#1082#1090#1072#1084' '#1080' '#1087#1088#1086#1076#1091#1082#1090#1072#1084
              #1055#1086' '#1087#1088#1086#1076#1091#1082#1090#1072#1084)
          end
          object StaticText1: TStaticText
            Left = 8
            Top = 362
            Width = 132
            Height = 20
            Anchors = []
            Caption = #1050#1088#1080#1090#1077#1088#1080#1081' '#1086#1090#1073#1086#1088#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
      end
    end
  end
  object ODS_azc_realiz: TOracleDataSet
    SQL.Strings = (
      
        'select azc_operation.*, azc_operation.ID as ID_, azc_type_operat' +
        'ion.NAME as Name_oper, azc_type_operation.KIND_OPER,'
      
        'org_structure.NAME as NAME_1, azc_place_send.NAME as NAME_2, kls' +
        '_prod.NAME_NPR,kls_prod.AZC_PR_GRP_ID,'
      
        'kls_predpr.SHORT_NAME, org_relations.ORG_STRU_2_ID, kls_cat_cen.' +
        'FOR_AZC, azc_prod_group.NOTE_'
      
        'from azc_operation, azc_type_operation, org_structure, kls_cat_c' +
        'en, azc_prod_group,'
      'azc_place_send, kls_prod, kls_predpr, org_relations '
      'where azc_type_operation.id=azc_operation.TYPE_OPER_ID'
      
        'and azc_operation.ORG_STRU_ID = org_structure.ID and azc_operati' +
        'on.DISCOUNT = kls_cat_cen.ID'
      
        'and azc_operation.PLACE_SEND_ID = azc_place_send.ID  and kls_pro' +
        'd.AZC_PR_GRP_ID = azc_prod_group.ID'
      ''
      'and azc_operation.PROD_ID_NPR = kls_prod.ID_NPR'
      
        'and azc_operation.SOBSTV_ID = kls_predpr.ID and org_structure.ID' +
        ' = org_relations.ORG_STRU_1_ID'
      
        'and (azc_type_operation.KIND_OPER=2 or azc_type_operation.KIND_O' +
        'PER=5)'
      'and azc_operation.DATE_OPER <= SYSDATE'
      'and azc_operation.DATE_OPER >= TRUNC (SYSDATE, '#39'month'#39')'
      
        'AND EXISTS (SELECT NULL FROM ORG_RELATIONS A WHERE A.org_stru_1_' +
        'id=AZC_OPERATION.ORG_STRU_ID AND A.org_stru_2_id=31)'
      'order by azc_operation.org_stru_id DESC')
    QBEDefinition.QBEFieldDefs = {
      040000001B00000002000000494401000000000009000000444154455F4F5045
      520100000000000700000044454E4349545901000000000006000000564F4C55
      4D4501000000000003000000564553010000000000040000004E4F5445010000
      0000000C000000545950455F4F5045525F49440100000000000D000000504C41
      43455F53454E445F49440100000000000B00000050524F445F49445F4E505201
      000000000009000000534F425354565F49440100000000000B0000004F52475F
      535452555F4944010000000000060000004E414D455F31010000000000060000
      004E414D455F320100000000000A00000053484F52545F4E414D450100000000
      000500000053554D4D4101000000000005000000505249434501000000000008
      0000004E414D455F4E505201000000000008000000444953434F554E54010000
      0000000300000049445F010000000000090000004B494E445F4F504552010000
      000000090000004E414D455F4F5045520100000000000D0000004F52475F5354
      52555F325F49440100000000000D000000444953434F554E545F545950450100
      0000000007000000464F525F415A4301000000000009000000444154455F494E
      544F0100000000000D000000415A435F50525F4752505F494401000000000005
      0000004E4F54455F010000000000}
    ReadOnly = True
    Session = f_main.ora_Session
    Left = 120
    Top = 112
    object ODS_azc_realizID: TFloatField
      FieldName = 'ID'
      KeyFields = 'ID'
      Required = True
      Visible = False
    end
    object ODS_azc_realizDATE_OPER: TDateTimeField
      FieldName = 'DATE_OPER'
      Required = True
    end
    object ODS_azc_realizDENCITY: TFloatField
      FieldName = 'DENCITY'
      Required = True
      DisplayFormat = '#0.0000'
    end
    object ODS_azc_realizVOLUME: TFloatField
      FieldName = 'VOLUME'
      Required = True
    end
    object ODS_azc_realizVES: TFloatField
      FieldName = 'VES'
      Required = True
      DisplayFormat = '#0.00'
    end
    object ODS_azc_realizNOTE: TStringField
      FieldName = 'NOTE'
      Size = 100
    end
    object ODS_azc_realizTYPE_OPER_ID: TFloatField
      FieldName = 'TYPE_OPER_ID'
      Required = True
    end
    object ODS_azc_realizPLACE_SEND_ID: TFloatField
      FieldName = 'PLACE_SEND_ID'
    end
    object ODS_azc_realizPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object ODS_azc_realizSOBSTV_ID: TIntegerField
      FieldName = 'SOBSTV_ID'
      Required = True
    end
    object ODS_azc_realizORG_STRU_ID: TFloatField
      FieldName = 'ORG_STRU_ID'
      Required = True
    end
    object ODS_azc_realizSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object ODS_azc_realizPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object ODS_azc_realizNAME_OPER: TStringField
      FieldName = 'NAME_OPER'
      Required = True
      Size = 50
    end
    object ODS_azc_realizNAME_1: TStringField
      FieldName = 'NAME_1'
      Required = True
      Size = 100
    end
    object ODS_azc_realizNAME_2: TStringField
      FieldName = 'NAME_2'
      Required = True
      Size = 50
    end
    object ODS_azc_realizNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object ODS_azc_realizSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object ODS_azc_realizID_: TFloatField
      FieldName = 'ID_'
      Required = True
    end
    object ODS_azc_realizKIND_OPER: TIntegerField
      FieldName = 'KIND_OPER'
      Required = True
    end
    object ODS_azc_realizORG_STRU_2_ID: TFloatField
      FieldName = 'ORG_STRU_2_ID'
      Required = True
    end
    object ODS_azc_realizFOR_AZC: TStringField
      FieldName = 'FOR_AZC'
      Required = True
      Size = 21
    end
    object ODS_azc_realizDISCOUNT: TIntegerField
      FieldName = 'DISCOUNT'
    end
    object ODS_azc_realizDISCOUNT_TYPE: TStringField
      FieldName = 'DISCOUNT_TYPE'
      Size = 17
    end
    object ODS_azc_realizAZC_PR_GRP_ID: TFloatField
      FieldName = 'AZC_PR_GRP_ID'
    end
    object ODS_azc_realizDATE_INTO: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072
      FieldName = 'DATE_INTO'
    end
    object ODS_azc_realizNOTE_: TStringField
      FieldName = 'NOTE_'
      Size = 15
    end
  end
  object DS_azc_realiz: TDataSource
    DataSet = ODS_azc_realiz
    Left = 128
    Top = 168
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 128
    Top = 304
    StyleName = 'XP Style'
    object ac_AZCOper_all: TAction
      Caption = #1053#1086#1074#1072#1103' '#1086#1087#1077#1088#1072#1094#1080#1103
      OnExecute = ac_AZCOper_allExecute
    end
    object ac_AZCOper_all_d: TAction
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077
      OnExecute = ac_AZCOper_all_dExecute
    end
    object ac_AZCOper_all_e: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1077
      OnExecute = ac_AZCOper_all_eExecute
    end
    object ac_AZCOper_all_rem: TAction
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1086#1089#1090#1072#1090#1082#1086#1074
      OnExecute = ac_AZCOper_all_remExecute
    end
    object acAzcFromParus: TAction
      Caption = #1047#1072#1082#1072#1095#1072#1090#1100' '#1080#1079' '#1055#1072#1088#1091#1089#1072
      ImageIndex = 10
      OnExecute = acAzcFromParusExecute
    end
  end
  object DS_likard: TDataSource
    DataSet = ODS_likard
    Left = 52
    Top = 296
  end
  object ODS_likard: TOracleDataSet
    SQL.Strings = (
      'select  AZC_REALIZ_LIKARD.rowid, azc_realiz_likard.id as id_,'
      'azc_realiz_likard.*, '
      'org_structure.NAME as NAME_1,'
      'kls_prod.NAME_NPR,kls_cat_cen.FOR_AZC,'
      'kls_predpr.SHORT_NAME, org_relations.ORG_STRU_2_ID'
      'from AZC_REALIZ_LIKARD, org_structure,'
      'kls_prod, kls_predpr, org_relations, kls_cat_cen'
      'where AZC_REALIZ_LIKARD.ORG_STRU_ID = org_structure.ID'
      ''
      
        'and AZC_REALIZ_LIKARD.PROD_ID_NPR = kls_prod.ID_NPR and org_stru' +
        'cture.ID = org_relations.ORG_STRU_1_ID'
      
        'and AZC_REALIZ_LIKARD.SOBSTV_ID = kls_predpr.ID and azc_realiz_l' +
        'ikard.DISCOUNT = kls_cat_cen.ID'
      'and AZC_REALIZ_LIKARD.DATE_OPER <= SYSDATE'
      'and AZC_REALIZ_LIKARD.DATE_OPER >= TRUNC (SYSDATE, '#39'month'#39')'
      'ORDER BY azc_realiz_likard.ID DESC')
    QBEDefinition.QBEFieldDefs = {
      040000001300000002000000494401000000000009000000444154455F4F5045
      520100000000000700000044454E434954590100000000000300000056455301
      000000000006000000564F4C554D45010000000000040000004E4F5445010000
      0000000B00000050524F445F49445F4E50520100000000000B0000004F52475F
      535452555F494401000000000009000000534F425354565F4944010000000000
      0500000053554D4D410100000000000500000050524943450100000000000800
      00004E414D455F4E50520100000000000A00000053484F52545F4E414D450100
      00000000060000004E414D455F310100000000000300000049445F0100000000
      0008000000444953434F554E540100000000000D0000004F52475F535452555F
      325F494401000000000007000000464F525F415A430100000000000900000044
      4154455F494E544F010000000000}
    Session = f_main.ora_Session
    Left = 44
    Top = 176
    object ODS_likardID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_likardDATE_OPER: TDateTimeField
      FieldName = 'DATE_OPER'
      Required = True
    end
    object ODS_likardDENCITY: TFloatField
      FieldName = 'DENCITY'
      Required = True
    end
    object ODS_likardVES: TFloatField
      FieldName = 'VES'
      Required = True
      DisplayFormat = '#0.00'
    end
    object ODS_likardVOLUME: TFloatField
      FieldName = 'VOLUME'
      Required = True
    end
    object ODS_likardNOTE: TStringField
      FieldName = 'NOTE'
      Size = 100
    end
    object ODS_likardSOBSTV_ID: TIntegerField
      FieldName = 'SOBSTV_ID'
      Required = True
    end
    object ODS_likardSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object ODS_likardPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object ODS_likardNAME_1: TStringField
      FieldName = 'NAME_1'
      Required = True
      Size = 100
    end
    object ODS_likardNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object ODS_likardSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object ODS_likardPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object ODS_likardORG_STRU_ID: TFloatField
      FieldName = 'ORG_STRU_ID'
      Required = True
    end
    object ODS_likardORG_STRU_2_ID: TFloatField
      FieldName = 'ORG_STRU_2_ID'
      Required = True
    end
    object ODS_likardDISCOUNT: TIntegerField
      FieldName = 'DISCOUNT'
    end
    object ODS_likardFOR_AZC: TStringField
      FieldName = 'FOR_AZC'
      Size = 21
    end
    object ODS_likardDATE_INTO: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072
      FieldName = 'DATE_INTO'
    end
  end
  object OQ_azc_realiz: TOracleQuery
    Left = 52
    Top = 112
  end
  object ODS_good: TOracleDataSet
    SQL.Strings = (
      
        'select azc_good_in_way.rowid, azc_good_in_way.id as id_, azc_goo' +
        'd_in_way.DATE_INTO,'
      
        'azc_good_in_way.DATE_OPER, azc_good_in_way.DENCITY, kls_predpr.S' +
        'HORT_NAME,'
      
        'azc_good_in_way.ID, azc_good_in_way.NOTE, azc_good_in_way.ORG_ST' +
        'RU_ID,'
      
        ' azc_good_in_way.PLACE_SEND_ID, azc_good_in_way.PREDPR_ID SOBSTV' +
        '_ID, azc_good_in_way.PROD_ID_NPR,'
      
        'azc_good_in_way.VES, azc_good_in_way.VOLUME, org_relations.ORG_S' +
        'TRU_2_ID,'
      
        'kls_prod.NAME_NPR, org_structure.NAME as NAME_1, azc_place_send.' +
        'NAME as NAME_2'
      
        'from azc_good_in_way, kls_prod, org_structure, azc_place_send, k' +
        'ls_predpr, org_relations'
      'where azc_good_in_way.PROD_ID_NPR = kls_prod.ID_NPR'
      ''
      'and org_structure.ID = azc_good_in_way.ORG_STRU_ID'
      'and azc_good_in_way.PLACE_SEND_ID = azc_place_send.ID'
      
        'and azc_good_in_Way.PREDPR_ID = kls_predpr.ID and org_structure.' +
        'iD=org_relations.ORG_STRU_1_ID'
      'and azc_good_in_Way.DATE_OPER <= SYSDATE'
      'and azc_good_in_Way.DATE_OPER >= TRUNC (SYSDATE, '#39'month'#39')'
      
        'AND EXISTS (SELECT NULL FROM ORG_RELATIONS A WHERE A.org_stru_1_' +
        'id=AZC_GOOD_IN_WAY.ORG_STRU_ID AND A.org_stru_2_id=31)'
      'ORDER BY azc_good_in_way.ID DESC')
    QBEDefinition.QBEFieldDefs = {
      040000001100000009000000444154455F4F5045520100000000000700000044
      454E43495459010000000000020000004944010000000000040000004E4F5445
      0100000000000B0000004F52475F535452555F49440100000000000D00000050
      4C4143455F53454E445F494401000000000009000000534F425354565F494401
      00000000000B00000050524F445F49445F4E5052010000000000030000005645
      5301000000000006000000564F4C554D45010000000000080000004E414D455F
      4E5052010000000000060000004E414D455F31010000000000060000004E414D
      455F320100000000000A00000053484F52545F4E414D45010000000000030000
      0049445F0100000000000D0000004F52475F535452555F325F49440100000000
      0009000000444154455F494E544F010000000000}
    Session = f_main.ora_Session
    Left = 52
    Top = 240
    object ODS_goodID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_goodDATE_OPER: TDateTimeField
      FieldName = 'DATE_OPER'
      Required = True
    end
    object ODS_goodDENCITY: TFloatField
      FieldName = 'DENCITY'
      Required = True
    end
    object ODS_goodNOTE: TStringField
      FieldName = 'NOTE'
      Size = 100
    end
    object ODS_goodORG_STRU_ID: TFloatField
      FieldName = 'ORG_STRU_ID'
      Required = True
    end
    object ODS_goodPLACE_SEND_ID: TFloatField
      FieldName = 'PLACE_SEND_ID'
      Required = True
    end
    object ODS_goodSOBSTV_ID: TIntegerField
      FieldName = 'SOBSTV_ID'
      Required = True
    end
    object ODS_goodPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object ODS_goodVES: TFloatField
      FieldName = 'VES'
      Required = True
      DisplayFormat = '#0.00'
    end
    object ODS_goodVOLUME: TFloatField
      FieldName = 'VOLUME'
      Required = True
    end
    object ODS_goodNAME_1: TStringField
      FieldName = 'NAME_1'
      Required = True
      Size = 100
    end
    object ODS_goodNAME_2: TStringField
      FieldName = 'NAME_2'
      Required = True
      Size = 50
    end
    object ODS_goodSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object ODS_goodNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object ODS_goodORG_STRU_2_ID: TFloatField
      FieldName = 'ORG_STRU_2_ID'
      Required = True
    end
    object ODS_goodDATE_INTO: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072
      FieldName = 'DATE_INTO'
    end
  end
  object DS_good: TDataSource
    DataSet = ODS_good
    Left = 132
    Top = 240
  end
  object ODS_itogs: TOracleDataSet
    SQL.Strings = (
      
        'SELECT AZC_OPERATION.ORG_STRU_ID,ORG_STRUCTURE.NAME AS NAME_1, A' +
        'ZC_OPERATION.PROD_ID_NPR , KLS_PROD.NAME_NPR, KLS_PROD.ABBR_NPR,' +
        'AZC_OPERATION.SOBSTV_ID, KLS_PREDPR.SHORT_NAME,AZC_PROD_GROUP.NO' +
        'TE_,'
      
        'FOR_AZC.GET_AZC_OST_Ves(AZC_OPERATION.ORG_STRU_ID, AZC_OPERATION' +
        '.PROD_ID_NPR, AZC_OPERATION.SOBSTV_ID, TO_DATE ('#39'28.02.2003'#39', '#39'd' +
        'd-mm-yy'#39')) AS VES_SUM,'
      
        'FOR_AZC.GET_AZC_OST_VOL(AZC_OPERATION.ORG_STRU_ID, AZC_OPERATION' +
        '.PROD_ID_NPR,AZC_OPERATION.SOBSTV_ID,  TO_DATE ('#39'28.02.2003'#39', '#39'd' +
        'd-mm-yy'#39')) AS VOL_SUM '
      
        'FROM AZC_OPERATION, KLS_PROD, ORG_STRUCTURE, KLS_PREDPR,AZC_PROD' +
        '_GROUP'
      'WHERE '
      'AZC_OPERATION.DATE_OPER >= TO_DATE ('#39'01.01.2003'#39', '#39'dd-mm-yy'#39')'
      
        'AND AZC_OPERATION.DATE_OPER <= TO_DATE ('#39'28.04.2003'#39', '#39'dd-mm-yy'#39 +
        ')'
      
        'AND  AZC_OPERATION.PROD_ID_NPR = KLS_PROD.ID_NPR AND KLS_PROD.AZ' +
        'C_PR_GRP_ID = AZC_PROD_GROUP.ID'
      ''
      'AND  AZC_OPERATION.ORG_STRU_ID = ORG_STRUCTURE.ID'
      'AND AZC_OPERATION.SOBSTV_ID = KLS_PREDPR.ID'
      
        'AND EXISTS (SELECT NULL FROM ORG_RELATIONS A WHERE A.org_stru_1_' +
        'id=AZC_OPERATION.ORG_STRU_ID AND A.org_stru_2_id=31)'
      
        'GROUP BY AZC_OPERATION.ORG_STRU_ID,ORG_STRUCTURE.NAME, AZC_OPERA' +
        'TION.PROD_ID_NPR , KLS_PROD.NAME_NPR, KLS_PROD.ABBR_NPR,AZC_OPER' +
        'ATION.SOBSTV_ID, KLS_PREDPR.SHORT_NAME,AZC_PROD_GROUP.NOTE_ '
      'ORDER BY NAME_NPR')
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000B0000004F52475F535452555F49440100000000000B0000
      0050524F445F49445F4E5052010000000000080000004E414D455F4E50520100
      0000000009000000534F425354565F49440100000000000A00000053484F5254
      5F4E414D45010000000000060000004E414D455F310100000000000700000056
      45535F53554D01000000000007000000564F4C5F53554D010000000000050000
      004E4F54455F01000000000008000000414242525F4E5052010000000000}
    Session = f_main.ora_Session
    Left = 204
    Top = 110
    object ODS_itogsORG_STRU_ID: TFloatField
      FieldName = 'ORG_STRU_ID'
      Required = True
    end
    object ODS_itogsNAME_1: TStringField
      FieldName = 'NAME_1'
      Required = True
      Size = 100
    end
    object ODS_itogsPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object ODS_itogsNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object ODS_itogsSOBSTV_ID: TIntegerField
      FieldName = 'SOBSTV_ID'
      Required = True
    end
    object ODS_itogsSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object ODS_itogsVES_SUM: TFloatField
      FieldName = 'VES_SUM'
      DisplayFormat = '#0.00'
    end
    object ODS_itogsVOL_SUM: TFloatField
      FieldName = 'VOL_SUM'
    end
    object ODS_itogsABBR_NPR: TStringField
      FieldName = 'ABBR_NPR'
    end
    object ODS_itogsNOTE_: TStringField
      FieldName = 'NOTE_'
      Size = 15
    end
  end
  object DS_itogs: TDataSource
    DataSet = ODS_itogs
    Left = 204
    Top = 166
  end
  object ODS_itogs_op: TOracleDataSet
    SQL.Strings = (
      
        'SELECT AZC_OPERATION.ORG_STRU_ID, ORG_STRUCTURE.NAME AS NAME_1, ' +
        'AZC_OPERATION.PROD_ID_NPR , KLS_PROD.NAME_NPR,KLS_PROD.ABBR_NPR,' +
        ' AZC_OPERATION.SOBSTV_ID, KLS_PREDPR.SHORT_NAME,AZC_PROD_GROUP.N' +
        'OTE_,'
      
        'AZC_TYPE_OPERATION.NAME AS NAME_OPER , SUM (AZC_OPERATION.VES) A' +
        'S ves_sum, SUM(AZC_OPERATION.VOLUME) AS vol_sum,  SUM (AZC_OPERA' +
        'TION.SUMMA) AS moneys'
      
        'FROM AZC_OPERATION, KLS_PROD, ORG_STRUCTURE, KLS_PREDPR, AZC_TYP' +
        'E_OPERATION, AZC_PROD_GROUP '
      'WHERE AZC_TYPE_OPERATION.ID = AZC_OPERATION.TYPE_OPER_ID '
      'AND AZC_TYPE_OPERATION.KIND_OPER = 2 AND'
      'AZC_OPERATION.DATE_OPER >= TO_DATE ('#39'01.01.2003'#39', '#39'dd-mm-yy'#39')'
      
        'AND AZC_OPERATION.DATE_OPER <= TO_DATE ('#39'28.04.2003'#39', '#39'dd-mm-yy'#39 +
        ')'
      
        'AND KLS_PROD.ID_NPR = AZC_OPERATION.PROD_ID_NPR AND KLS_PROD.AZC' +
        '_PR_GRP_ID = AZC_PROD_GROUP.ID'
      ''
      'AND  ORG_STRUCTURE.ID = AZC_OPERATION.ORG_STRU_ID'
      'AND AZC_OPERATION.SOBSTV_ID = KLS_PREDPR.ID'
      
        'AND EXISTS (SELECT NULL FROM ORG_RELATIONS A WHERE A.org_stru_1_' +
        'id=AZC_OPERATION.ORG_STRU_ID AND A.org_stru_2_id=31)'
      
        'GROUP BY AZC_OPERATION.ORG_STRU_ID, ORG_STRUCTURE.NAME, AZC_OPER' +
        'ATION.PROD_ID_NPR ,KLS_PROD.NAME_NPR,KLS_PROD.ABBR_NPR, AZC_OPER' +
        'ATION.SOBSTV_ID, KLS_PREDPR.SHORT_NAME , AZC_TYPE_OPERATION.NAME' +
        ',AZC_PROD_GROUP.NOTE_'
      'ORDER BY NAME_NPR')
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000B0000004F52475F535452555F49440100000000000B0000
      0050524F445F49445F4E5052010000000000080000004E414D455F4E50520100
      0000000009000000534F425354565F49440100000000000A00000053484F5254
      5F4E414D45010000000000060000004E414D455F31010000000000090000004E
      414D455F4F504552010000000000070000005645535F53554D01000000000007
      000000564F4C5F53554D010000000000060000004D4F4E455953010000000000
      050000004E4F54455F01000000000008000000414242525F4E50520100000000
      00}
    Session = f_main.ora_Session
    Left = 208
    Top = 232
    object ODS_itogs_opORG_STRU_ID: TFloatField
      FieldName = 'ORG_STRU_ID'
      Required = True
    end
    object ODS_itogs_opNAME_1: TStringField
      FieldName = 'NAME_1'
      Required = True
      Size = 100
    end
    object ODS_itogs_opPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object ODS_itogs_opNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object ODS_itogs_opSOBSTV_ID: TIntegerField
      FieldName = 'SOBSTV_ID'
      Required = True
    end
    object ODS_itogs_opSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object ODS_itogs_opName_oper: TStringField
      FieldName = 'Name_oper'
      Required = True
      Size = 50
    end
    object ODS_itogs_opVES_SUM: TFloatField
      FieldName = 'VES_SUM'
      DisplayFormat = '#0.00'
    end
    object ODS_itogs_opVOL_SUM: TFloatField
      FieldName = 'VOL_SUM'
    end
    object ODS_itogs_opMONEYS: TFloatField
      FieldName = 'MONEYS'
      KeyFields = 'MONEYS'
    end
    object ODS_itogs_opABBR_NPR: TStringField
      FieldName = 'ABBR_NPR'
    end
    object ODS_itogs_opNOTE_: TStringField
      FieldName = 'NOTE_'
      Size = 15
    end
  end
  object DS_itogs_op: TDataSource
    DataSet = ODS_itogs_op
    Left = 208
    Top = 278
  end
  object ODS_itogs_all: TOracleDataSet
    SQL.Strings = (
      
        'select azc_operation.ORG_STRU_ID as ORG_STRU_ID, org_structure.N' +
        'AME as NAME_1, '
      
        'SUM(azc_operation.VES)  ves_sum,SUM(azc_operation.VOLUME)  vol_s' +
        'um ,SUM(azc_operation.SUMMA)  money  '
      'from '
      'azc_operation, kls_prod, org_structure'
      'where '
      'azc_operation.DATE_OPER >= to_date ('#39'01.02.2003'#39', '#39'dd-mm-yy'#39')'
      'and azc_operation.DATE_OPER <=to_date ('#39'01.04.2003'#39', '#39'dd-mm-yy'#39')'
      'and azc_operation.PROD_ID_NPR = kls_prod.ID_NPR'
      ''
      'and azc_operation.TYPE_OPER_ID = 1 '
      'and azc_operation.ORG_STRU_ID = org_structure.ID'
      
        'AND EXISTS (SELECT NULL FROM ORG_RELATIONS A WHERE A.org_stru_1_' +
        'id=AZC_OPERATION.ORG_STRU_ID AND A.org_stru_2_id=31)'
      'GROUP BY azc_operation.ORG_STRU_ID, org_structure.NAME'
      'ORDER BY  org_structure.NAME')
    QBEDefinition.QBEFieldDefs = {
      04000000050000000300000056455301000000000003000000564F4C01000000
      0000050000004D4F4E4559010000000000040000004E414D450100000000000B
      0000004F52475F535452555F4944010000000000}
    Session = f_main.ora_Session
    Left = 264
    Top = 118
    object ODS_itogs_allORG_STRU_ID: TFloatField
      FieldName = 'ORG_STRU_ID'
      Required = True
    end
    object ODS_itogs_allNAME_1: TStringField
      FieldName = 'NAME_1'
      Required = True
      Size = 100
    end
    object ODS_itogs_allVES_SUM: TFloatField
      FieldName = 'VES_SUM'
      DisplayFormat = '#0.00'
    end
    object ODS_itogs_allVOL_SUM: TFloatField
      FieldName = 'VOL_SUM'
    end
    object ODS_itogs_allMONEY: TFloatField
      FieldName = 'MONEY'
    end
  end
  object DS_itog_all: TDataSource
    DataSet = ODS_itogs_all
    Left = 272
    Top = 174
  end
  object ds_Filials: TDataSource
    DataSet = q_Filials
    Left = 432
    Top = 160
  end
  object q_Filials: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM ORG_STRUCTURE WHERE filial IS NOT NULL')
    QBEDefinition.QBEFieldDefs = {
      040000000D000000020000004944010000000000060000004144524553530100
      00000000040000004E4F5445010000000000040000004E414D45010000000000
      0B0000004F52475F4B494E445F4944010000000000090000005052454450525F
      49440100000000000B0000004F52475F545950455F4944010000000000070000
      0049535F4155544F0100000000000600000046494C49414C0100000000000800
      0000574F524B53484F5001000000000003000000494E4E0100000000000C0000
      0049535F4155544F5F4B4F4E5301000000000009000000504C414E5F5245414C
      010000000000}
    Session = f_main.ora_Session
    Left = 392
    Top = 160
  end
end
