inherited f_Month: Tf_Month
  Left = 222
  Top = 111
  Width = 799
  Height = 406
  Caption = #1047#1072#1076#1072#1085#1080#1103' '#1085#1072' '#1086#1090#1075#1088#1091#1079#1082#1091
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pageTabs: TPageControl
    Left = 0
    Top = 147
    Width = 791
    Height = 225
    ActivePage = tabSpecif
    Align = alClient
    HotTrack = True
    Images = f_main.img_Common
    MultiLine = True
    TabOrder = 0
    object tabR3: TTabSheet
      Caption = #1056#1072#1079#1085#1072#1088#1103#1076#1082#1080' SAP R/3'
      ImageIndex = -1
      OnShow = tabR3Show
      object TBDock2: TTBDock
        Left = 0
        Top = 0
        Width = 783
        Height = 26
        object TBToolbar1: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          Images = f_main.img_Common
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object TBItem1: TTBItem
            Action = acMonth_NewMonth
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object gridR3: TDBGridEh
        Left = 0
        Top = 26
        Width = 783
        Height = 143
        Align = alClient
        AllowedSelections = [gstRecordBookmarks]
        DataSource = ds_R3_VBAK
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        FrozenCols = 3
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch]
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleImages = f_main.img_Common
        UseMultiTitle = True
        OnGetCellParams = gridR3GetCellParams
        OnSortMarkingChanged = gridR3SortMarkingChanged
        Columns = <
          item
            Alignment = taRightJustify
            EditButtons = <>
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #8470' '#1087'/'#1087
            Width = 31
            OnGetCellParams = gridR3Columns0GetCellParams
          end
          item
            Alignment = taRightJustify
            EditButtons = <>
            FieldName = 'VBELN'
            Footers = <>
            Title.TitleButton = True
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'NOM_ZD'
            Footers = <>
            Title.TitleButton = True
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'DATE_RAZN'
            Footers = <>
            Title.TitleButton = True
            Width = 65
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'IS_EXP'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.TitleButton = True
            Width = 29
          end
          item
            EditButtons = <>
            FieldName = 'VBAP_MATNR'
            Footers = <>
            Title.TitleButton = True
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'PROD_NAME_NPR'
            Footers = <>
            Title.TitleButton = True
            Width = 172
          end
          item
            EditButtons = <>
            FieldName = 'TONN_DECLARED'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'TONN_ALLOW'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 74
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'LUK_DOG_NUMBER'
            Footer.Alignment = taCenter
            Footers = <>
            Title.TitleButton = True
            Width = 63
          end
          item
            EditButtons = <>
            FieldName = 'NPO_DOG_NUMBER'
            Footers = <>
            Title.TitleButton = True
            Width = 96
          end
          item
            EditButtons = <>
            FieldName = 'DOG_NUMBER'
            Footers = <>
            Width = 92
          end
          item
            EditButtons = <>
            FieldName = 'VBPA_KUNNR'
            Footers = <>
            Title.TitleButton = True
            Width = 43
          end
          item
            EditButtons = <>
            FieldName = 'PLAT_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 190
          end
          item
            EditButtons = <>
            FieldName = 'OT_LIFNR'
            Footers = <>
            Title.TitleButton = True
            Width = 53
          end
          item
            EditButtons = <>
            FieldName = 'GROTP_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 184
          end
          item
            EditButtons = <>
            FieldName = 'VBAP_ROUTE'
            Footers = <>
            Title.TitleButton = True
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'ROUTE_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 206
          end
          item
            EditButtons = <>
            FieldName = 'KNANF'
            Footers = <>
            Title.TitleButton = True
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'KNEND'
            Footers = <>
            Title.TitleButton = True
            Width = 43
          end
          item
            EditButtons = <>
            FieldName = 'SH_KUNNR'
            Footers = <>
            Title.TitleButton = True
            Width = 48
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 331
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 184
          end
          item
            EditButtons = <>
            FieldName = 'LOAD_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 86
          end
          item
            EditButtons = <>
            FieldName = 'VAGONTYPE_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 93
          end
          item
            EditButtons = <>
            FieldName = 'NP_OWNER'
            Footers = <>
            Title.TitleButton = True
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'OWNER_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'NP_PRODR'
            Footers = <>
            Title.TitleButton = True
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'PRODR_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 182
          end
          item
            EditButtons = <>
            FieldName = 'LGOBE'
            Footers = <>
            Title.TitleButton = True
            Width = 105
          end
          item
            Checkboxes = False
            EditButtons = <>
            FieldName = 'OSN_8'
            Footers = <>
            KeyList.Strings = (
              #1056#1047#1056
              '   ')
            Title.TitleButton = True
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'PRIM'
            Footers = <>
            Title.TitleButton = True
            Width = 160
          end
          item
            EditButtons = <>
            FieldName = 'GR4'
            Footers = <>
            Title.TitleButton = True
            Width = 178
          end
          item
            EditButtons = <>
            FieldName = 'VETKA_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 125
          end
          item
            EditButtons = <>
            FieldName = 'TARIF_CODE'
            Footers = <>
            Title.TitleButton = True
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'TRANSP_NUM'
            Footers = <>
            Title.TitleButton = True
            Width = 71
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 169
        Width = 783
        Height = 27
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
    object tabSpecif: TTabSheet
      Caption = #1055#1086#1088#1090#1092#1077#1083#1100' '#1079#1072#1082#1072#1079#1086#1074
      ImageIndex = -1
      OnShow = tabSpecifShow
      object TBDock1: TTBDock
        Left = 0
        Top = 0
        Width = 783
        Height = 23
        object TBToolbar2: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          Images = f_main.img_Common
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object TBItem14: TTBItem
            Action = Action2
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 169
        Width = 783
        Height = 27
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
      end
      object gridSpecif: TDBGridEh
        Left = 0
        Top = 23
        Width = 783
        Height = 146
        Align = alClient
        AllowedSelections = [gstRecordBookmarks]
        DataSource = ds_Specif
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch]
        SumList.Active = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleImages = f_main.img_Common
        UseMultiTitle = True
        OnSortMarkingChanged = gridSpecifSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #8470' '#1087'/'#1087
            Width = 31
            OnGetCellParams = gridSpecifColumns0GetCellParams
          end
          item
            EditButtons = <>
            FieldName = 'BEGIN_DATE'
            Footers = <>
            Title.TitleButton = True
            Width = 62
          end
          item
            EditButtons = <>
            FieldName = 'END_DATE'
            Footers = <>
            Title.TitleButton = True
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'DOG_NUMBER'
            Footers = <>
            Title.TitleButton = True
            Width = 104
          end
          item
            EditButtons = <>
            FieldName = 'NAME_NPR'
            Footers = <>
            Title.TitleButton = True
            Width = 129
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 300
          end
          item
            EditButtons = <>
            FieldName = 'STAN_KOD'
            Footers = <>
            Title.TitleButton = True
            Width = 46
          end
          item
            EditButtons = <>
            FieldName = 'STAN_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 118
          end
          item
            EditButtons = <>
            FieldName = 'VES_M'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
            Width = 73
          end
          item
            EditButtons = <>
            FieldName = 'VES_KV'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'VES_ALL'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
            Width = 73
          end
          item
            EditButtons = <>
            FieldName = 'LOAD_ABBR'
            Footers = <>
            Title.TitleButton = True
            Width = 33
          end
          item
            EditButtons = <>
            FieldName = 'LOAD_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 135
          end
          item
            EditButtons = <>
            FieldName = 'TYPE_OTGR_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 165
          end
          item
            EditButtons = <>
            FieldName = 'PLAT_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 226
          end
          item
            EditButtons = <>
            FieldName = 'LUK_DOG_NUMBER'
            Footers = <>
            Title.TitleButton = True
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'PRIM'
            Footers = <>
            Title.TitleButton = True
            Width = 268
          end
          item
            EditButtons = <>
            FieldName = 'GR4'
            Footers = <>
            Title.TitleButton = True
            Width = 291
          end
          item
            EditButtons = <>
            FieldName = 'VETKA_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 130
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 360
          end
          item
            EditButtons = <>
            FieldName = 'STANOTP_KOD'
            Footers = <>
            Title.TitleButton = True
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'STANOTP_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 89
          end>
      end
    end
    object tabMonth: TTabSheet
      Caption = #1056#1072#1079#1085#1072#1088#1103#1076#1082#1080' '#1053#1055#1054
      ImageIndex = -1
      OnShow = tabMonthShow
      object TBDock3: TTBDock
        Left = 0
        Top = 0
        Width = 783
        Height = 23
        object TBToolbar3: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          Images = f_main.img_Common
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object TBItem2: TTBItem
            Action = Action3
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 194
        Width = 783
        Height = 27
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
      end
      object gridMonth: TDBGridEh
        Left = 0
        Top = 23
        Width = 783
        Height = 171
        Align = alClient
        AllowedSelections = [gstRecordBookmarks]
        DataSource = ds_Month
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        FrozenCols = 3
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch]
        SumList.Active = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleImages = f_main.img_Common
        UseMultiTitle = True
        OnSortMarkingChanged = gridMonthSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #8470' '#1087'/'#1087
            Width = 33
            OnGetCellParams = gridMonthColumns0GetCellParams
          end
          item
            EditButtons = <>
            FieldName = 'NOM_ZD'
            Footers = <>
            Title.TitleButton = True
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'VBELN'
            Footers = <>
            Title.TitleButton = True
            Width = 48
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'IS_EXP'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.TitleButton = True
            Width = 35
          end
          item
            EditButtons = <>
            FieldName = 'DOG_NUMBER'
            Footers = <>
            Title.TitleButton = True
            Width = 92
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'USL_NUMBER'
            Footers = <>
            Title.TitleButton = True
            Width = 31
          end
          item
            EditButtons = <>
            FieldName = 'PROD_NAME_NPR'
            Footers = <>
            Title.TitleButton = True
            Width = 129
          end
          item
            EditButtons = <>
            FieldName = 'STAN_KOD'
            Footers = <>
            Title.TitleButton = True
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'STAN_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 103
          end
          item
            EditButtons = <>
            FieldName = 'POLUCH_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 233
          end
          item
            EditButtons = <>
            FieldName = 'TONN_DECLARED'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'CIST_DECLARED'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
            Width = 48
          end
          item
            EditButtons = <>
            FieldName = 'TONN_R'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'CIST_R'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'TONN_LOADED'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'CIST_LOADED'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'DATE_PLAN'
            Footers = <>
            Title.TitleButton = True
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'DATE_RAZN'
            Footers = <>
            Title.TitleButton = True
            Width = 63
          end
          item
            EditButtons = <>
            FieldName = 'PLAT_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 239
          end
          item
            EditButtons = <>
            FieldName = 'LUK_DOG_NUMBER'
            Footers = <>
            Title.TitleButton = True
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = 'NPO_DOG_NUMBER'
            Footers = <>
            Title.TitleButton = True
            Width = 95
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'OSN_8'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.TitleButton = True
            Width = 33
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'SLIV_V'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.TitleButton = True
            Width = 38
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'OBOGR'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.TitleButton = True
            Width = 48
          end
          item
            EditButtons = <>
            FieldName = 'FORMA_2_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 269
          end
          item
            EditButtons = <>
            FieldName = 'PRIM'
            Footers = <>
            Title.TitleButton = True
            Width = 208
          end
          item
            EditButtons = <>
            FieldName = 'GR4'
            Footers = <>
            Title.TitleButton = True
            Width = 207
          end
          item
            EditButtons = <>
            FieldName = 'DATE_CEN'
            Footers = <>
            Title.TitleButton = True
            Width = 63
          end
          item
            EditButtons = <>
            FieldName = 'CENA'
            Footers = <>
            Title.TitleButton = True
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'CENA_OTP'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'SUM_ZD'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
            Width = 92
          end
          item
            EditButtons = <>
            FieldName = 'TARIF_CODE'
            Footers = <>
            Title.TitleButton = True
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'TRANSP_NUM'
            Footers = <>
            Title.TitleButton = True
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'TARIF1TONN'
            Footers = <>
            Title.TitleButton = True
            Width = 48
          end
          item
            EditButtons = <>
            FieldName = 'NAZN_OTG_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 280
          end
          item
            EditButtons = <>
            FieldName = 'LOAD_ABBR'
            Footers = <>
            Title.TitleButton = True
            Width = 35
          end
          item
            EditButtons = <>
            FieldName = 'LOAD_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 162
          end
          item
            EditButtons = <>
            FieldName = 'TYPE_OTGR_NAME'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'OWNER_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 198
          end
          item
            EditButtons = <>
            FieldName = 'SUPPLIER_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 204
          end
          item
            EditButtons = <>
            FieldName = 'GROTP_NAME'
            Footers = <>
            Width = 226
          end
          item
            EditButtons = <>
            FieldName = 'TEX_PD_ID'
            Footers = <>
            Title.TitleButton = True
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'POTREB_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 233
          end
          item
            EditButtons = <>
            FieldName = 'VETKA_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 128
          end
          item
            EditButtons = <>
            FieldName = 'GOSPROG_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'GP_NAPR_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 168
          end
          item
            EditButtons = <>
            FieldName = 'PLANSTRU_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 252
          end
          item
            EditButtons = <>
            FieldName = 'STANOTP_KOD'
            Footers = <>
            Title.TitleButton = True
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'STANOTP_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 106
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 791
    Height = 147
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 9
      Top = 8
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = #1057' '#1076#1072#1090#1099':'
    end
    object Label3: TLabel
      Left = 136
      Top = 8
      Width = 12
      Height = 13
      Alignment = taCenter
      Caption = #1087#1086
    end
    object RxSpeedButton1: TRxSpeedButton
      Left = 114
      Top = 119
      Width = 25
      Height = 25
      Action = acMonthRefresh
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
    end
    object ed_BeginDate: TDateTimePicker
      Left = 51
      Top = 5
      Width = 82
      Height = 21
      Date = 37070.390091736100000000
      Time = 37070.390091736100000000
      TabOrder = 0
    end
    object ed_EndDate: TDateTimePicker
      Left = 155
      Top = 5
      Width = 82
      Height = 21
      Date = 37070.390091736100000000
      Time = 37070.390091736100000000
      TabOrder = 1
    end
    object dbNav: TDBNavigator
      Left = 8
      Top = 118
      Width = 100
      Height = 25
      DataSource = ds_R3_VBAK
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
    object ed_Dog: TComboEdit
      Left = 320
      Top = 4
      Width = 162
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = ed_DogButtonClick
    end
    object cb_Prod: TCheckBox
      Left = 494
      Top = 6
      Width = 67
      Height = 17
      Caption = #1055#1088#1086#1076#1091#1082#1090':'
      TabOrder = 4
      OnClick = cb_ProdClick
    end
    object lc_Prod: TRxDBLookupCombo
      Left = 564
      Top = 4
      Width = 203
      Height = 21
      DropDownCount = 25
      Enabled = False
      LookupField = 'VBAP_MATNR'
      LookupDisplay = 'MAKTX'
      LookupSource = ds_R3_Materials
      TabOrder = 5
    end
    object ed_GrOtp: TComboEdit
      Left = 97
      Top = 28
      Width = 280
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 6
      OnButtonClick = ed_GrOtpButtonClick
    end
    object ed_poluch: TComboEdit
      Left = 97
      Top = 50
      Width = 280
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 7
      OnButtonClick = ed_poluchButtonClick
    end
    object ed_Plat: TComboEdit
      Left = 488
      Top = 28
      Width = 280
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 8
      OnButtonClick = ed_PlatButtonClick
    end
    object ed_StanKod: TEdit
      Left = 489
      Top = 50
      Width = 80
      Height = 21
      Enabled = False
      TabOrder = 9
      OnExit = ed_StanKodExit
      OnKeyDown = ed_StanKodKeyDown
    end
    object ed_Stan: TComboEdit
      Left = 571
      Top = 50
      Width = 197
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 10
      OnButtonClick = ed_StanButtonClick
    end
    object ed_potreb: TComboEdit
      Left = 97
      Top = 72
      Width = 280
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 11
      OnButtonClick = ed_potrebButtonClick
    end
    object lc_Plan: TRxDBLookupCombo
      Left = 488
      Top = 94
      Width = 281
      Height = 21
      DropDownCount = 25
      Enabled = False
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = ds_Plan
      TabOrder = 12
    end
    object cb_Plan: TCheckBox
      Left = 389
      Top = 95
      Width = 99
      Height = 17
      Caption = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072':'
      TabOrder = 13
      OnClick = cb_PlanClick
    end
    object cb_Dog: TCheckBox
      Left = 248
      Top = 7
      Width = 69
      Height = 17
      Caption = #1044#1086#1075#1086#1074#1086#1088':'
      TabOrder = 14
      OnClick = cb_DogClick
    end
    object cb_GrOtp: TCheckBox
      Left = 6
      Top = 31
      Width = 88
      Height = 17
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100':'
      TabOrder = 15
      OnClick = cb_GrOtpClick
    end
    object cb_Poluch: TCheckBox
      Left = 6
      Top = 52
      Width = 88
      Height = 17
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100':'
      TabOrder = 16
      OnClick = cb_PoluchClick
    end
    object cb_potreb: TCheckBox
      Left = 6
      Top = 73
      Width = 88
      Height = 17
      Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100':'
      TabOrder = 17
      OnClick = cb_potrebClick
    end
    object cb_Plat: TCheckBox
      Left = 405
      Top = 31
      Width = 83
      Height = 17
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
      TabOrder = 18
      OnClick = cb_PlatClick
    end
    object cb_Stan: TCheckBox
      Left = 379
      Top = 52
      Width = 109
      Height = 17
      Caption = #1057#1090#1072#1085'.'#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103':'
      TabOrder = 19
      OnClick = cb_StanClick
    end
    object cb_NOT_Filter: TCheckBox
      Left = 6
      Top = 96
      Width = 43
      Height = 17
      Caption = 'NOT'
      TabOrder = 20
    end
    object cb_FilterKind: TComboBox
      Left = 53
      Top = 94
      Width = 162
      Height = 21
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 21
      Text = #1042#1067#1041#1056#1040#1058#1068' '#1042#1057#1045
      Items.Strings = (
        #1042#1067#1041#1056#1040#1058#1068' '#1042#1057#1045
        #1055#1086#1089#1090#1072#1074#1082#1072' R3'
        #1056#1072#1079#1085#1072#1088#1103#1076#1082#1072' R3'
        #1056#1072#1079#1085#1072#1088#1103#1076#1082#1072' '#1053#1055#1054
        'N '#1082#1074#1080#1090#1072#1085#1094#1080#1080
        #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1086#1087#1077#1088'.'#1087#1086#1089#1090#1072#1074#1082#1080
        #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1076#1086#1082'. '#1087#1086#1089#1090#1072#1074#1082#1080
        #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1091#1089#1083#1091#1075#1080
        #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1087#1088#1086#1074'.'#1087#1083#1072#1090#1099
        #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099
        #1069#1050#1057#1055#1054#1056#1058
        #1050' '#1091#1076#1072#1083#1077#1085#1080#1102' '#1073#1077#1079' '#1092#1072#1081#1083#1072
        #1050' '#1091#1076#1072#1083#1077#1085#1080#1102' '#1089' '#1092#1072#1081#1083#1086#1084
        #1041#1077#1079' '#1085#1086#1084#1077#1088#1072' '#1087#1086#1089#1090#1072#1074#1082#1080' R3 ('#1085#1077' '#1087#1088#1080#1096#1077#1083' RC)'
        'N '#1076#1086#1075#1086#1074#1086#1088#1072)
    end
    object ed_Filter: TEdit
      Left = 216
      Top = 94
      Width = 162
      Height = 21
      TabOrder = 22
    end
    object ed_Owner: TComboEdit
      Left = 488
      Top = 72
      Width = 280
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 23
      OnButtonClick = ed_OwnerButtonClick
    end
    object cbOwner: TCheckBox
      Left = 399
      Top = 74
      Width = 89
      Height = 17
      Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082':'
      TabOrder = 24
      OnClick = cb_PlatClick
    end
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 624
    Top = 200
    StyleName = 'XP Style'
    object acMonth_NewMonth: TAction
      Caption = #1053#1086#1074#1072#1103' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1072' '#1053#1055#1054
      Hint = #1053#1086#1074#1072#1103' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1072' '#1053#1055#1054
      ImageIndex = 0
      OnExecute = acMonth_NewMonthExecute
    end
    object Action2: TAction
      Caption = 'Action2'
    end
    object Action3: TAction
      Caption = 'Action3'
    end
    object acMonthRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 11
      ShortCut = 119
      OnExecute = acMonthRefreshExecute
    end
  end
  object q_R3_VBAK: TOracleDataSet
    SQL.Strings = (
      'SELECT A.*'
      'FROM V_NEW_MONTH_R3_VBAK A'
      'WHERE 1=1 -- A.VBAK_VDATU<=END_DATE'
      '  AND 1=1 -- A.VBAK_VDATU>=BEGIN_DATE'
      '  AND 1=1 -- '#1060#1080#1083#1100#1090#1088
      'ORDER BY A.VBELN DESC'
      '')
    QBEDefinition.QBEFieldDefs = {
      0300000063000000050000005642454C4E0100000000060000004E4F4D5F5A44
      01000000000A000000564241505F4D41544E5201000000000B00000050524F44
      5F49445F4E505201000000000A0000005642414B5F565342454401000000000A
      00000056424B445F545241545901000000000E0000005641474F4E545950455F
      4E414D4501000000000C0000004C4F41445F545950455F494401000000000900
      00004C4F41445F4142425201000000000600000049535F45585001000000000A
      0000004C554B5F444F475F494401000000000A0000005642414B5F4155415254
      01000000000F000000434F4E54524143544F525F415454520100000000080000
      004E505F4F574E455201000000000A0000004F574E45525F4E414D4501000000
      00080000004E505F50524F445201000000000A00000050524F44525F4E414D45
      0100000000050000004C474F42450100000000040000005052494D0100000000
      050000004F534E5F3801000000000300000047523401000000000A0000005441
      5249465F434F444501000000000A0000005452414E53505F4E554D0100000000
      07000000464F524D415F320100000000080000004F545F4C49464E5201000000
      000A00000047524F54505F4E414D4501000000000800000047524F54505F4944
      01000000000800000053485F4B554E4E5201000000000B000000504F4C554348
      5F4E414D45010000000009000000504F4C5543485F494401000000000A000000
      564250415F4B554E4E52010000000009000000504C41545F4E414D4501000000
      0007000000504C41545F4944010000000006000000444F475F49440100000000
      0B000000504F545245425F4E414D4501000000000A00000056424B445F565341
      525401000000000D0000005641474F574E45525F4E414D4501000000000A0000
      00524F5554455F4E414D450100000000050000004B4E414E4601000000000A00
      00005354414E4F54505F49440100000000050000004B4E454E44010000000007
      0000005354414E5F494401000000000200000049440100000000090000004441
      54455F52415A4E010000000009000000444154455F504C414E01000000000B00
      00004C4F434B5F53544154555301000000000B00000049535F4558505F4E414D
      450100000000090000004C4F41445F4E414D4501000000000D00000050524F44
      5F4E414D455F4E505201000000000E0000004C554B5F444F475F4E554D424552
      01000000000E0000004E504F5F444F475F4E554D42455201000000000A000000
      4E504F5F444F475F494401000000000A000000444F475F4E554D424552010000
      00000A00000055534C5F4E554D4245520100000000090000005445585F50445F
      494401000000000B0000005354414E4F54505F4B4F4401000000000800000053
      54414E5F4B4F4401000000000D000000504F4C5543485F47445F4B4F44010000
      000009000000504F545245425F494401000000000A0000005645544B415F4E41
      4D450100000000080000005645544B415F494401000000000C0000004F574E45
      52534849505F494401000000000B0000004E415A4E5F4F54475F494401000000
      00080000004F574E45525F494401000000000800000050524F44525F49440100
      0000000B000000535550504C4945525F4944010000000006000000534C49565F
      56010000000008000000444F505F434953540100000000050000004F424F4752
      01000000000D000000544F4E4E5F4445434C4152454401000000000D00000043
      4953545F4445434C4152454401000000000A000000544F4E4E5F414C4C4F5701
      000000000A000000434953545F414C4C4F57010000000008000000544F4E4E5F
      4D494E010000000008000000434953545F4D494E01000000000A000000474F53
      50524F475F494401000000000A00000047505F4E4150525F4944010000000008
      000000444154455F43454E01000000000400000043454E410100000000080000
      0043454E415F4F545001000000000600000053554D5F5A4401000000000A0000
      00544152494631544F4E4E01000000000B000000504C414E535452555F494401
      000000000A000000564241505F524F55544501000000000E000000545950455F
      4F5447525F4E414D4501000000000C0000005354414E4F54505F4E414D450100
      000000090000005354414E5F4E414D4501000000000D0000004E415A4E5F4F54
      475F4E414D4501000000000D000000535550504C4945525F4E414D4501000000
      000C000000464F524D415F325F4E414D45010000000006000000544F4E4E5F52
      010000000006000000434953545F5201000000000B000000544F4E4E5F4C4F41
      44454401000000000B000000434953545F4C4F4144454401000000000C000000
      474F5350524F475F4E414D4501000000000C00000047505F4E4150525F4E414D
      4501000000000D000000504C414E535452555F4E414D4501000000000B000000
      5550444154455F4441544501000000000B0000005550444154455F46494C4501
      00000000}
    Session = f_main.ora_Session
    BeforeOpen = q_R3_VBAKBeforeOpen
    Left = 496
    Top = 143
    object q_R3_VBAKVBELN: TStringField
      DisplayLabel = 'N '#1088#1072#1079#1085'. R3'
      DisplayWidth = 7
      FieldName = 'VBELN'
      Required = True
      Size = 30
    end
    object q_R3_VBAKNOM_ZD: TStringField
      DisplayLabel = 'N '#1088#1072#1079#1085'. '#1053#1055#1054
      DisplayWidth = 12
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_R3_VBAKDATE_RAZN: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1072#1079#1085'.'
      DisplayWidth = 18
      FieldName = 'DATE_RAZN'
    end
    object q_R3_VBAKLOCK_STATUS: TStringField
      DisplayLabel = #1041#1083#1086#1082'.'
      DisplayWidth = 5
      FieldName = 'LOCK_STATUS'
      Size = 5
    end
    object q_R3_VBAKVBAP_MATNR: TStringField
      DisplayLabel = 'ID'
      DisplayWidth = 10
      FieldName = 'VBAP_MATNR'
      Size = 10
    end
    object q_R3_VBAKPROD_NAME_NPR: TStringField
      DisplayLabel = #1052#1072#1090#1077#1088#1080#1072#1083
      DisplayWidth = 100
      FieldName = 'PROD_NAME_NPR'
      Size = 100
    end
    object q_R3_VBAKTONN_DECLARED: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086
      FieldName = 'TONN_DECLARED'
      DisplayFormat = '#0.000'
    end
    object q_R3_VBAKTONN_ALLOW: TFloatField
      DisplayLabel = #1056#1072#1079#1088#1077#1096#1077#1085#1086
      FieldName = 'TONN_ALLOW'
      DisplayFormat = '#0.000'
    end
    object q_R3_VBAKPROD_ID_NPR: TStringField
      DisplayWidth = 5
      FieldName = 'PROD_ID_NPR'
      Size = 5
    end
    object q_R3_VBAKVBAK_VSBED: TStringField
      DisplayWidth = 3
      FieldName = 'VBAK_VSBED'
      Size = 3
    end
    object q_R3_VBAKLOAD_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087'.'
      DisplayWidth = 100
      FieldName = 'LOAD_NAME'
      Size = 100
    end
    object q_R3_VBAKVBKD_TRATY: TStringField
      DisplayWidth = 5
      FieldName = 'VBKD_TRATY'
      Size = 5
    end
    object q_R3_VBAKVAGONTYPE_NAME: TStringField
      DisplayLabel = #1056#1086#1076' '#1074#1072#1075#1086#1085#1072
      DisplayWidth = 100
      FieldName = 'VAGONTYPE_NAME'
      Size = 100
    end
    object q_R3_VBAKLOAD_TYPE_ID: TFloatField
      DisplayWidth = 10
      FieldName = 'LOAD_TYPE_ID'
    end
    object q_R3_VBAKLOAD_ABBR: TStringField
      DisplayWidth = 3
      FieldName = 'LOAD_ABBR'
      Size = 3
    end
    object q_R3_VBAKIS_EXP: TFloatField
      DisplayLabel = 'EXP'
      DisplayWidth = 10
      FieldName = 'IS_EXP'
    end
    object q_R3_VBAKLUK_DOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088' '#1051#1059#1050#1054#1049#1051' - '#1050#1083#1080#1077#1085#1090
      DisplayWidth = 30
      FieldName = 'LUK_DOG_NUMBER'
      Size = 30
    end
    object q_R3_VBAKVBAK_AUART: TStringField
      DisplayLabel = 'AUART'
      DisplayWidth = 10
      FieldName = 'VBAK_AUART'
      Size = 10
    end
    object q_R3_VBAKCONTRACTOR_ATTR: TIntegerField
      FieldName = 'CONTRACTOR_ATTR'
    end
    object q_R3_VBAKNP_OWNER: TStringField
      DisplayLabel = 'ID'
      DisplayWidth = 10
      FieldName = 'NP_OWNER'
      Size = 10
    end
    object q_R3_VBAKOWNER_NAME: TStringField
      DisplayLabel = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1085'/'#1087#1088
      DisplayWidth = 100
      FieldName = 'OWNER_NAME'
      Size = 100
    end
    object q_R3_VBAKNP_PRODR: TStringField
      DisplayLabel = 'ID'
      DisplayWidth = 10
      FieldName = 'NP_PRODR'
      Size = 10
    end
    object q_R3_VBAKPRODR_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100' '#1085'/'#1087#1088
      DisplayWidth = 100
      FieldName = 'PRODR_NAME'
      Size = 100
    end
    object q_R3_VBAKLGOBE: TStringField
      DisplayLabel = #1047#1072#1074#1086#1076' / '#1089#1082#1083#1072#1076
      DisplayWidth = 100
      FieldName = 'LGOBE'
      Size = 100
    end
    object q_R3_VBAKPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'PRIM'
      Size = 100
    end
    object q_R3_VBAKOSN_8: TFloatField
      DisplayLabel = #1056#1072#1079#1088'. 8-'#1086#1089#1085'.'
      DisplayWidth = 10
      FieldName = 'OSN_8'
    end
    object q_R3_VBAKGR4: TStringField
      DisplayLabel = #1043#1088#1072#1092#1072' 4'
      DisplayWidth = 100
      FieldName = 'GR4'
      Size = 100
    end
    object q_R3_VBAKVETKA_NAME: TStringField
      DisplayLabel = #1042#1077#1090#1082#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      DisplayWidth = 100
      FieldName = 'VETKA_NAME'
      Size = 100
    end
    object q_R3_VBAKTARIF_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1080#1089#1082#1083'. '#1090#1072#1088#1080#1092#1072
      DisplayWidth = 10
      FieldName = 'TARIF_CODE'
      Size = 10
    end
    object q_R3_VBAKTRANSP_NUM: TStringField
      DisplayLabel = 'N '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      DisplayWidth = 20
      FieldName = 'TRANSP_NUM'
    end
    object q_R3_VBAKPOLUCH_GD_KOD: TStringField
      DisplayLabel = #1046'/'#1076' '#1082#1086#1076
      DisplayWidth = 10
      FieldName = 'POLUCH_GD_KOD'
      Size = 10
    end
    object q_R3_VBAKOT_LIFNR: TStringField
      DisplayLabel = 'ID'
      DisplayWidth = 10
      FieldName = 'OT_LIFNR'
      Size = 10
    end
    object q_R3_VBAKGROTP_NAME: TStringField
      DisplayLabel = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
      DisplayWidth = 100
      FieldName = 'GROTP_NAME'
      Size = 100
    end
    object q_R3_VBAKSH_KUNNR: TStringField
      DisplayLabel = 'ID'
      DisplayWidth = 10
      FieldName = 'SH_KUNNR'
      Size = 10
    end
    object q_R3_VBAKPOLUCH_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 110
      FieldName = 'POLUCH_NAME'
      Size = 110
    end
    object q_R3_VBAKVBPA_KUNNR: TStringField
      DisplayLabel = 'ID'
      DisplayWidth = 10
      FieldName = 'VBPA_KUNNR'
      Size = 10
    end
    object q_R3_VBAKPLAT_NAME: TStringField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      DisplayWidth = 110
      FieldName = 'PLAT_NAME'
      Size = 110
    end
    object q_R3_VBAKKVERM: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088' '#1053#1055#1054' - '#1050#1083#1080#1077#1085#1090
      DisplayWidth = 30
      FieldName = 'NPO_DOG_NUMBER'
      Size = 30
    end
    object q_R3_VBAKPOTREB_NAME: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
      DisplayWidth = 100
      FieldName = 'POTREB_NAME'
      Size = 100
    end
    object q_R3_VBAKVBKD_VSART: TStringField
      DisplayLabel = 'ID7'
      DisplayWidth = 3
      FieldName = 'VBKD_VSART'
      Size = 3
    end
    object q_R3_VBAKVAGOWNER_NAME: TStringField
      DisplayLabel = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1090'/'#1089
      DisplayWidth = 100
      FieldName = 'VAGOWNER_NAME'
      Size = 100
    end
    object q_R3_VBAKVBAP_ROUTE: TStringField
      DisplayLabel = 'ID'
      DisplayWidth = 10
      FieldName = 'VBAP_ROUTE'
      Size = 10
    end
    object q_R3_VBAKROUTE_NAME: TStringField
      DisplayLabel = #1052#1072#1088#1096#1088#1091#1090
      DisplayWidth = 100
      FieldName = 'ROUTE_NAME'
      Size = 100
    end
    object q_R3_VBAKKNANF: TStringField
      DisplayLabel = #1057#1090#1072#1085'. '#1086#1090#1087#1088'.'
      DisplayWidth = 10
      FieldName = 'KNANF'
      Size = 10
    end
    object q_R3_VBAKKNEND: TStringField
      DisplayLabel = #1057#1090#1072#1085'. '#1085#1072#1079#1085'.'
      DisplayWidth = 10
      FieldName = 'KNEND'
      Size = 10
    end
    object q_R3_VBAKDOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1080
      FieldName = 'DOG_NUMBER'
      Size = 30
    end
    object q_R3_VBAKSTANOTP_KOD: TIntegerField
      FieldName = 'STANOTP_KOD'
    end
    object q_R3_VBAKSTAN_KOD: TIntegerField
      FieldName = 'STAN_KOD'
    end
  end
  object ds_R3_VBAK: TDataSource
    DataSet = q_R3_VBAK
    Left = 540
    Top = 143
  end
  object q_R3_Materials: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  A.VBAP_MATNR,'
      '  A.VBAP_MATNR || '#39' '#39' || A.MAKTX as MAKTX '
      'FROM R3_MATERIALS A'
      'ORDER BY A.MAKTX')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000A000000564241505F4D41544E520100000000050000004D
      414B54580100000000}
    Session = f_main.ora_Session
    Left = 596
    Top = 143
    object q_R3_MaterialsVBAP_MATNR: TStringField
      FieldName = 'VBAP_MATNR'
      Required = True
      Size = 10
    end
    object q_R3_MaterialsMAKTX: TStringField
      FieldName = 'MAKTX'
      Size = 100
    end
  end
  object ds_R3_Materials: TDataSource
    DataSet = q_R3_Materials
    Left = 636
    Top = 143
  end
  object q_Specif: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID, -- Id '#1079#1072#1082#1072#1079#1072
      '  A.BEGIN_DATE, -- '#1089' '#1076#1072#1090#1099
      '  A.END_DATE, -- '#1087#1086' '#1076#1072#1090#1091
      '  A.UPDATE_DATE, -- '#1076#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      '  KLS_PROD.ID_NPR as PROD_ID_NPR, KLS_PROD.NAME_NPR,-- '#1087#1088#1086#1076#1091#1082#1090
      '  DECODE(TO_CHAR(SYSDATE,'#39'MM'#39'),'
      
        '    '#39'01'#39',A.M1,'#39'02'#39',A.M2,'#39'03'#39',A.M3,'#39'04'#39',A.M4,'#39'05'#39',A.M5,'#39'06'#39',A.M6,' +
        #39'07'#39',A.M7,'#39'08'#39',A.M8,'#39'09'#39',A.M9,'#39'10'#39',A.M10,'#39'11'#39',A.M11,A.M12) as VE' +
        'S_M,'
      '  DECODE(TO_CHAR(SYSDATE,'#39'MM'#39'),'
      
        '    '#39'01'#39',A.KV1,'#39'02'#39',A.KV1,'#39'03'#39',A.KV1,'#39'04'#39',A.KV2,'#39'05'#39',A.KV2,'#39'06'#39',' +
        'A.KV2,'#39'07'#39',A.KV3,'#39'08'#39',A.KV3,'#39'09'#39',A.KV3,A.KV4) as VES_KV,'
      '  A.VES_ALL,'
      
        '  KLS_VID_OTGR.LOAD_ABBR, KLS_VID_OTGR.LOAD_NAME, KLS_VID_OTGR.L' +
        'OAD_TYPE_ID, KLS_LOAD_TYPE.TYPE_OTGR_NAME, -- '#1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088#1086#1074#1082 +
        #1080
      
        '  LUK_DOG.ID AS LUK_DOG_ID, LUK_DOG.DOG_NUMBER as LUK_DOG_NUMBER' +
        ', -- '#1076#1086#1075#1086#1074#1086#1088' '#1089' '#1051#1059#1050#1054#1049#1051#39#1086#1084
      '  A.PRIM, -- '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      '  A.GR4, -- '#1043#1088#1072#1092#1072' 4'
      
        '  KLS_VETKA.ID AS VETKA_ID, KLS_VETKA.VETKA_NAME, -- '#1042#1077#1090#1082#1072' '#1087#1086#1083#1091#1095 +
        #1072#1090#1077#1083#1103
      
        '  poluch.ID as POLUCH_ID, poluch.PREDPR_NAME AS poluch_name,  --' +
        ' '#1075#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
      
        '  plat.ID as plat_id, plat.PREDPR_NAME AS plat_name, -- '#1055#1086#1082#1091#1087#1072#1090#1077 +
        #1083#1100
      '  KLS_DOG.ID as DOG_ID, KLS_DOG.DOG_NUMBER, -- '#1044#1086#1075#1086#1074#1086#1088
      
        '  potreb.ID as POTREB_ID, potreb.PREDPR_NAME as POTREB_NAME, -- ' +
        #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
      
        '  STANOTP.ID as STANOTP_ID, STANOTP.STAN_KOD AS STANOTP_KOD, STA' +
        'NOTP.STAN_NAME as STANOTP_NAME,'
      '  STAN.ID as STAN_ID, STAN.STAN_KOD,STAN.STAN_NAME -- '#1052#1072#1088#1096#1088#1091#1090
      
        'FROM SPECIF A, KLS_DOG, KLS_VID_OTGR, KLS_PREDPR poluch, KLS_PRE' +
        'DPR plat,KLS_PREDPR potreb,'
      
        #9' KLS_DOG luk_dog, KLS_STAN STAN, KLS_STAN STANOTP, KLS_PROD, KL' +
        'S_LOAD_TYPE, KLS_VETKA'
      'WHERE A.DOG_ID=KLS_DOG.ID'
      '  AND KLS_DOG.MAINDOG_ID=luk_dog.ID(+)'
      '  AND KLS_DOG.PREDPR_ID=plat.ID'
      '  AND A.PROD_ID_NPR=KLS_PROD.ID_NPR'
      '  AND A.LOAD_ABBR=KLS_VID_OTGR.LOAD_ABBR (+)'
      '  AND KLS_VID_OTGR.LOAD_TYPE_ID=KLS_LOAD_TYPE.ID(+)'
      '  AND A.STANOTP_ID=STANOTP.ID(+)'
      '  AND A.STAN_ID=STAN.ID(+)'
      '  AND A.VETKA_ID=KLS_VETKA.ID(+)'
      '  AND A.POLUCH_ID=poluch.ID(+)'
      '  AND A.POTREB_ID=potreb.ID(+)'
      '  AND 1=1 -- A.BEGIN_DATE<=:END_DATE'
      '  AND 1=1 -- A.END_DATE>=:BEGIN_DATE'
      '  AND 1=1 -- '#1060#1080#1083#1100#1090#1088
      'ORDER BY A.BEGIN_DATE DESC,A.END_DATE DESC')
    QBEDefinition.QBEFieldDefs = {
      030000002100000002000000494401000000000A000000424547494E5F444154
      45010000000008000000454E445F4441544501000000000B0000005550444154
      455F4441544501000000000B00000050524F445F49445F4E5052010000000008
      0000004E414D455F4E50520100000000050000005645535F4D01000000000600
      00005645535F4B560100000000070000005645535F414C4C0100000000090000
      004C4F41445F414242520100000000090000004C4F41445F4E414D4501000000
      000C0000004C4F41445F545950455F494401000000000E000000545950455F4F
      5447525F4E414D4501000000000A0000004C554B5F444F475F49440100000000
      0E0000004C554B5F444F475F4E554D4245520100000000040000005052494D01
      00000000030000004752340100000000080000005645544B415F494401000000
      000A0000005645544B415F4E414D45010000000009000000504F4C5543485F49
      4401000000000B000000504F4C5543485F4E414D45010000000007000000504C
      41545F4944010000000009000000504C41545F4E414D45010000000006000000
      444F475F494401000000000A000000444F475F4E554D42455201000000000900
      0000504F545245425F494401000000000B000000504F545245425F4E414D4501
      000000000A0000005354414E4F54505F494401000000000B0000005354414E4F
      54505F4B4F4401000000000C0000005354414E4F54505F4E414D450100000000
      070000005354414E5F49440100000000080000005354414E5F4B4F4401000000
      00090000005354414E5F4E414D450100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_SpecifBeforeOpen
    Left = 396
    Top = 143
    object q_SpecifID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_SpecifBEGIN_DATE: TDateTimeField
      DisplayLabel = #1057' '#1076#1072#1090#1099
      FieldName = 'BEGIN_DATE'
      Required = True
    end
    object q_SpecifEND_DATE: TDateTimeField
      DisplayLabel = #1055#1086' '#1076#1072#1090#1091
      FieldName = 'END_DATE'
      Required = True
    end
    object q_SpecifUPDATE_DATE: TDateTimeField
      FieldName = 'UPDATE_DATE'
      Required = True
    end
    object q_SpecifPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 5
    end
    object q_SpecifNAME_NPR: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'NAME_NPR'
      Size = 30
    end
    object q_SpecifVES_M: TFloatField
      DisplayLabel = #1047#1072' '#1084#1077#1089'.'
      FieldName = 'VES_M'
      DisplayFormat = '#0.000'
    end
    object q_SpecifVES_KV: TFloatField
      DisplayLabel = #1047#1072' '#1082#1074'.'
      FieldName = 'VES_KV'
      DisplayFormat = '#0.000'
    end
    object q_SpecifVES_ALL: TFloatField
      DisplayLabel = #1047#1072' '#1075#1086#1076
      FieldName = 'VES_ALL'
      Required = True
      DisplayFormat = '#0.000'
    end
    object q_SpecifLOAD_ABBR: TStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'LOAD_ABBR'
      Size = 3
    end
    object q_SpecifLOAD_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1086#1090#1075#1088#1091#1079#1082#1080
      FieldName = 'LOAD_NAME'
      Size = 45
    end
    object q_SpecifLOAD_TYPE_ID: TIntegerField
      FieldName = 'LOAD_TYPE_ID'
    end
    object q_SpecifTYPE_OTGR_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088#1086#1074#1082#1080
      FieldName = 'TYPE_OTGR_NAME'
      Size = 30
    end
    object q_SpecifLUK_DOG_ID: TIntegerField
      FieldName = 'LUK_DOG_ID'
    end
    object q_SpecifLUK_DOG_NUMBER: TStringField
      DisplayLabel = #1042' '#1088#1072#1084#1082#1072#1093' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1089' '#1051#1059#1050#1054#1049#1051#39#1086#1084
      FieldName = 'LUK_DOG_NUMBER'
      Size = 30
    end
    object q_SpecifPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 100
    end
    object q_SpecifGR4: TStringField
      DisplayLabel = #1043#1088#1072#1092#1072' 4'
      FieldName = 'GR4'
      Size = 100
    end
    object q_SpecifVETKA_ID: TIntegerField
      FieldName = 'VETKA_ID'
    end
    object q_SpecifVETKA_NAME: TStringField
      DisplayLabel = #1042#1077#1090#1082#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'VETKA_NAME'
      Size = 50
    end
    object q_SpecifPOLUCH_ID: TIntegerField
      FieldName = 'POLUCH_ID'
    end
    object q_SpecifPOLUCH_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'POLUCH_NAME'
      Size = 60
    end
    object q_SpecifPLAT_ID: TIntegerField
      FieldName = 'PLAT_ID'
    end
    object q_SpecifPLAT_NAME: TStringField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      FieldName = 'PLAT_NAME'
      Size = 60
    end
    object q_SpecifDOG_ID: TIntegerField
      FieldName = 'DOG_ID'
    end
    object q_SpecifDOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldName = 'DOG_NUMBER'
      Size = 30
    end
    object q_SpecifPOTREB_ID: TIntegerField
      FieldName = 'POTREB_ID'
    end
    object q_SpecifPOTREB_NAME: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
      FieldName = 'POTREB_NAME'
      Size = 60
    end
    object q_SpecifSTANOTP_ID: TFloatField
      FieldName = 'STANOTP_ID'
    end
    object q_SpecifSTANOTP_KOD: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'STANOTP_KOD'
    end
    object q_SpecifSTANOTP_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'STANOTP_NAME'
      Size = 50
    end
    object q_SpecifSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
    object q_SpecifSTAN_KOD: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'STAN_KOD'
    end
    object q_SpecifSTAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      FieldName = 'STAN_NAME'
      Size = 50
    end
  end
  object ds_Specif: TDataSource
    DataSet = q_Specif
    Left = 436
    Top = 143
  end
  object q_Month: TOracleDataSet
    SQL.Strings = (
      'SELECT A.*'
      'FROM V_NEW_MONTH_MONTH A'
      'WHERE A.DATE_RAZN>=SYSDATE-30'
      '  AND 1=1 -- A.INPUT_DATE<=:END_DATE'
      '  AND 1=1 -- '#1060#1080#1083#1100#1090#1088
      'ORDER BY A.NOM_ZD DESC')
    QBEDefinition.QBEFieldDefs = {
      0300000063000000060000004E4F4D5F5A440100000000050000005642454C4E
      01000000000600000049535F455850010000000009000000444154455F504C41
      4E01000000000B0000005550444154455F4441544501000000000B0000005052
      4F445F49445F4E505201000000000D000000544F4E4E5F4445434C4152454401
      0000000006000000544F4E4E5F5201000000000B000000544F4E4E5F4C4F4144
      454401000000000D000000434953545F4445434C415245440100000000060000
      00434953545F5201000000000B000000434953545F4C4F414445440100000000
      06000000444F475F494401000000000A000000444F475F4E554D424552010000
      00000A00000055534C5F4E554D424552010000000007000000504C41545F4944
      010000000009000000504C41545F4E414D4501000000000A0000004C554B5F44
      4F475F494401000000000E0000004C554B5F444F475F4E554D42455201000000
      000A0000004E504F5F444F475F494401000000000E0000004E504F5F444F475F
      4E554D42455201000000000C000000464F524D415F325F4E414D450100000000
      040000005052494D010000000003000000475234010000000008000000444154
      455F43454E01000000000400000043454E4101000000000800000043454E415F
      4F545001000000000600000053554D5F5A4401000000000A0000005441524946
      31544F4E4E01000000000B0000004E415A4E5F4F54475F494401000000000D00
      00004E415A4E5F4F54475F4E414D450100000000090000004C4F41445F414242
      520100000000090000004C4F41445F4E414D4501000000000C0000004C4F4144
      5F545950455F494401000000000E000000545950455F4F5447525F4E414D4501
      000000000B000000535550504C4945525F494401000000000D00000053555050
      4C4945525F4E414D450100000000090000005445585F50445F49440100000000
      09000000504F4C5543485F494401000000000B000000504F4C5543485F4E414D
      45010000000009000000504F545245425F494401000000000B000000504F5452
      45425F4E414D450100000000080000005645544B415F494401000000000A0000
      005645544B415F4E414D4501000000000A000000474F5350524F475F49440100
      0000000A00000047505F4E4150525F494401000000000B000000504C414E5354
      52555F494401000000000A0000005354414E4F54505F494401000000000B0000
      005354414E4F54505F4B4F440100000000070000005354414E5F494401000000
      00080000005354414E5F4B4F4401000000000200000049440100000000090000
      00444154455F52415A4E01000000000B0000004C4F434B5F5354415455530100
      0000000B00000049535F4558505F4E414D4501000000000A0000005642414B5F
      565342454401000000000A00000056424B445F545241545901000000000E0000
      005641474F4E545950455F4E414D4501000000000A000000564241505F4D4154
      4E5201000000000D00000050524F445F4E414D455F4E505201000000000A0000
      00564250415F4B554E4E520100000000080000004F545F4C49464E5201000000
      000A00000047524F54505F4E414D4501000000000800000047524F54505F4944
      01000000000A000000564241505F524F55544501000000000A000000524F5554
      455F4E414D450100000000050000004B4E414E460100000000050000004B4E45
      4E4401000000000800000053485F4B554E4E5201000000000D000000504F4C55
      43485F47445F4B4F4401000000000C0000004F574E4552534849505F49440100
      0000000A0000005642414B5F415541525401000000000F000000434F4E545241
      43544F525F415454520100000000080000004E505F4F574E455201000000000A
      0000004F574E45525F4E414D450100000000080000004F574E45525F49440100
      000000080000004E505F50524F445201000000000A00000050524F44525F4E41
      4D4501000000000800000050524F44525F49440100000000050000004C474F42
      4501000000000A00000054415249465F434F444501000000000A000000545241
      4E53505F4E554D010000000007000000464F524D415F32010000000005000000
      4F534E5F38010000000006000000534C49565F56010000000008000000444F50
      5F434953540100000000050000004F424F475201000000000A00000056424B44
      5F565341525401000000000D0000005641474F574E45525F4E414D4501000000
      000A000000544F4E4E5F414C4C4F5701000000000A000000434953545F414C4C
      4F57010000000008000000544F4E4E5F4D494E01000000000800000043495354
      5F4D494E01000000000B0000005550444154455F46494C4501000000000C0000
      00474F5350524F475F4E414D4501000000000C00000047505F4E4150525F4E41
      4D4501000000000D000000504C414E535452555F4E414D4501000000000C0000
      005354414E4F54505F4E414D450100000000090000005354414E5F4E414D4501
      00000000}
    Session = f_main.ora_Session
    BeforeOpen = q_MonthBeforeOpen
    Left = 412
    Top = 199
    object q_MonthNOM_ZD: TStringField
      DisplayLabel = 'N '#1088#1072#1079#1085'. '#1053#1055#1054
      FieldName = 'NOM_ZD'
      Required = True
      Size = 12
    end
    object q_MonthVBELN: TStringField
      DisplayLabel = 'N '#1088#1072#1079#1085'. R3'
      FieldName = 'VBELN'
      Size = 30
    end
    object q_MonthIS_EXP: TIntegerField
      DisplayLabel = #1069#1082#1089#1087'.'
      FieldName = 'IS_EXP'
      Required = True
    end
    object q_MonthDATE_PLAN: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1083#1072#1085#1072
      FieldName = 'DATE_PLAN'
      Required = True
    end
    object q_MonthDATE_RAZN: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1072#1079#1085'.'
      FieldName = 'DATE_RAZN'
      Required = True
    end
    object q_MonthUPDATE_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
      FieldName = 'UPDATE_DATE'
      Required = True
    end
    object q_MonthPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object q_MonthPROD_NAME_NPR: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'PROD_NAME_NPR'
      Required = True
      Size = 30
    end
    object q_MonthTONN_DECLARED: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086' ('#1090'.)'
      FieldName = 'TONN_DECLARED'
      Required = True
      DisplayFormat = '#0.000'
    end
    object q_MonthTONN_R: TFloatField
      DisplayLabel = #1056#1072#1079#1085#1072#1088'. ('#1090'.)'
      FieldName = 'TONN_R'
      DisplayFormat = '#0.000'
    end
    object q_MonthTONN_LOADED: TFloatField
      DisplayLabel = #1054#1090#1075#1088#1091#1078#1077#1085#1086' ('#1090'.)'
      FieldName = 'TONN_LOADED'
      Required = True
      DisplayFormat = '#0.000'
    end
    object q_MonthCIST_DECLARED: TIntegerField
      DisplayLabel = #1047#1072#1103#1074#1083'. ('#1094#1080#1089#1090'.)'
      FieldName = 'CIST_DECLARED'
      Required = True
      DisplayFormat = '#0'
    end
    object q_MonthCIST_R: TIntegerField
      DisplayLabel = #1056#1072#1079#1085#1072#1088'. ('#1094#1080#1089#1090'.)'
      FieldName = 'CIST_R'
      DisplayFormat = '#0'
    end
    object q_MonthCIST_LOADED: TIntegerField
      DisplayLabel = #1054#1090#1075#1088'. ('#1094#1080#1089#1090'.)'
      FieldName = 'CIST_LOADED'
      Required = True
      DisplayFormat = '#0'
    end
    object q_MonthDOG_ID: TIntegerField
      FieldName = 'DOG_ID'
      Required = True
    end
    object q_MonthDOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldName = 'DOG_NUMBER'
      Required = True
      Size = 30
    end
    object q_MonthUSL_NUMBER: TIntegerField
      DisplayLabel = 'N '#1091#1089#1083'.'
      FieldName = 'USL_NUMBER'
      Required = True
    end
    object q_MonthPLAT_ID: TIntegerField
      FieldName = 'PLAT_ID'
      Required = True
    end
    object q_MonthPLAT_NAME: TStringField
      DisplayLabel = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      FieldName = 'PLAT_NAME'
      Required = True
      Size = 60
    end
    object q_MonthLUK_DOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088' '#1051#1059#1050#1054#1049#1051' - '#1050#1083#1080#1077#1085#1090
      FieldName = 'LUK_DOG_NUMBER'
      Size = 30
    end
    object q_MonthNPO_DOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088' '#1053#1055#1054' - '#1050#1083#1080#1077#1085#1090
      FieldName = 'NPO_DOG_NUMBER'
      Size = 30
    end
    object q_MonthOSN_8: TIntegerField
      DisplayLabel = '8 '#1086#1089#1077#1081
      FieldName = 'OSN_8'
      Required = True
    end
    object q_MonthSLIV_V: TIntegerField
      DisplayLabel = #1042#1077#1088#1093#1085'. '#1089#1083#1080#1074
      FieldName = 'SLIV_V'
      Required = True
    end
    object q_MonthOBOGR: TIntegerField
      DisplayLabel = #1054#1073#1086#1075#1088'.'
      FieldName = 'OBOGR'
      Required = True
    end
    object q_MonthFORMA_2: TFloatField
      FieldName = 'FORMA_2'
      Required = True
    end
    object q_MonthFORMA_2_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072' 2'
      FieldName = 'FORMA_2_NAME'
      Size = 50
    end
    object q_MonthPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 100
    end
    object q_MonthGR4: TStringField
      DisplayLabel = #1043#1088#1072#1092#1072' 4'
      FieldName = 'GR4'
      Size = 100
    end
    object q_MonthDATE_CEN: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1094#1077#1085#1099
      FieldName = 'DATE_CEN'
    end
    object q_MonthCENA: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1073#1077#1079' '#1085#1072#1083'.'
      FieldName = 'CENA'
      DisplayFormat = '#0.00'
    end
    object q_MonthCENA_OTP: TFloatField
      DisplayLabel = #1054#1090#1087#1091#1089#1082'. '#1094#1077#1085#1072
      FieldName = 'CENA_OTP'
      DisplayFormat = '#0.00'
    end
    object q_MonthSUM_ZD: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1079#1072#1076#1072#1085#1080#1103
      FieldName = 'SUM_ZD'
      DisplayFormat = '#0.00'
    end
    object q_MonthTARIF_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1080#1089#1082#1083'. '#1090#1072#1088#1080#1092#1072
      FieldName = 'TARIF_CODE'
      Size = 10
    end
    object q_MonthTRANSP_NUM: TStringField
      DisplayLabel = 'N '#1090#1088#1072#1085#1089#1087'.'
      FieldName = 'TRANSP_NUM'
    end
    object q_MonthTARIF1TONN: TFloatField
      DisplayLabel = #1058#1072#1088#1080#1092' '#1079#1072' 1 '#1090'.'
      FieldName = 'TARIF1TONN'
      DisplayFormat = '#0.00'
    end
    object q_MonthNAZN_OTG_ID: TIntegerField
      FieldName = 'NAZN_OTG_ID'
      Required = True
    end
    object q_MonthNAZN_OTG_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1086#1090#1075#1088#1091#1079#1082#1080
      FieldName = 'NAZN_OTG_NAME'
      Required = True
      Size = 50
    end
    object q_MonthLOAD_ABBR: TStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'LOAD_ABBR'
      Required = True
      Size = 3
    end
    object q_MonthLOAD_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1086#1090#1075#1088#1091#1079#1082#1080
      FieldName = 'LOAD_NAME'
      Required = True
      Size = 45
    end
    object q_MonthLOAD_TYPE_ID: TIntegerField
      FieldName = 'LOAD_TYPE_ID'
      Required = True
    end
    object q_MonthTYPE_OTGR_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088#1086#1074#1082#1080
      FieldName = 'TYPE_OTGR_NAME'
      Required = True
      Size = 30
    end
    object q_MonthOWNER_ID: TIntegerField
      FieldName = 'OWNER_ID'
    end
    object q_MonthOWNER_NAME: TStringField
      DisplayLabel = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1085'/'#1087#1088
      FieldName = 'OWNER_NAME'
      Size = 60
    end
    object q_MonthSUPPLIER_ID: TIntegerField
      FieldName = 'SUPPLIER_ID'
    end
    object q_MonthSUPPLIER_NAME: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082' '#1085'/'#1087#1088
      FieldName = 'SUPPLIER_NAME'
      Size = 60
    end
    object q_MonthGROTP_ID: TIntegerField
      FieldName = 'GROTP_ID'
      Required = True
    end
    object q_MonthGROTP_NAME: TStringField
      DisplayLabel = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
      FieldName = 'GROTP_NAME'
      Required = True
      Size = 60
    end
    object q_MonthPOLUCH_ID: TIntegerField
      FieldName = 'POLUCH_ID'
      Required = True
    end
    object q_MonthPOLUCH_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'POLUCH_NAME'
      Required = True
      Size = 60
    end
    object q_MonthPOTREB_ID: TIntegerField
      FieldName = 'POTREB_ID'
      Required = True
    end
    object q_MonthPOTREB_NAME: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
      FieldName = 'POTREB_NAME'
      Required = True
      Size = 60
    end
    object q_MonthVETKA_ID: TIntegerField
      FieldName = 'VETKA_ID'
    end
    object q_MonthVETKA_NAME: TStringField
      DisplayLabel = #1042#1077#1090#1082#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'VETKA_NAME'
      Size = 50
    end
    object q_MonthGOSPROG_ID: TIntegerField
      FieldName = 'GOSPROG_ID'
    end
    object q_MonthGOSPROG_NAME: TStringField
      DisplayLabel = #1043#1086#1089#1087#1088#1086#1075#1088#1072#1084#1084#1072
      FieldName = 'GOSPROG_NAME'
      Size = 30
    end
    object q_MonthGP_NAPR_ID: TFloatField
      FieldName = 'GP_NAPR_ID'
    end
    object q_MonthGP_NAPR_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' '#1087#1086' '#1075#1086#1089#1087#1088#1086#1075'.'
      FieldName = 'GP_NAPR_NAME'
      Size = 30
    end
    object q_MonthPLANSTRU_ID: TFloatField
      FieldName = 'PLANSTRU_ID'
    end
    object q_MonthPLANSTRU_NAME: TStringField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072
      FieldName = 'PLANSTRU_NAME'
      Size = 50
    end
    object q_MonthSTANOTP_ID: TFloatField
      FieldName = 'STANOTP_ID'
      Required = True
    end
    object q_MonthSTANOTP_KOD: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'STANOTP_KOD'
      Required = True
    end
    object q_MonthSTANOTP_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103' '#1086#1090#1087#1088'.'
      FieldName = 'STANOTP_NAME'
      Required = True
      Size = 50
    end
    object q_MonthSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
      Required = True
    end
    object q_MonthSTAN_KOD: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'STAN_KOD'
      Required = True
    end
    object q_MonthSTAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095'.'
      FieldName = 'STAN_NAME'
      Required = True
      Size = 50
    end
    object q_MonthID: TStringField
      FieldName = 'ID'
      Required = True
      Size = 12
    end
    object q_MonthLOCK_STATUS: TStringField
      FieldName = 'LOCK_STATUS'
      Size = 5
    end
    object q_MonthIS_EXP_NAME: TStringField
      FieldName = 'IS_EXP_NAME'
      Size = 16
    end
    object q_MonthVBAK_VSBED: TStringField
      FieldName = 'VBAK_VSBED'
      Size = 3
    end
    object q_MonthVBKD_TRATY: TStringField
      FieldName = 'VBKD_TRATY'
      Size = 5
    end
    object q_MonthVAGONTYPE_NAME: TStringField
      FieldName = 'VAGONTYPE_NAME'
      Size = 100
    end
    object q_MonthVBAP_MATNR: TStringField
      FieldName = 'VBAP_MATNR'
      Size = 10
    end
    object q_MonthLUK_DOG_ID: TFloatField
      FieldName = 'LUK_DOG_ID'
    end
    object q_MonthNPO_DOG_ID: TIntegerField
      FieldName = 'NPO_DOG_ID'
    end
    object q_MonthVBPA_KUNNR: TStringField
      FieldName = 'VBPA_KUNNR'
      Size = 10
    end
    object q_MonthOT_LIFNR: TStringField
      FieldName = 'OT_LIFNR'
      Size = 10
    end
    object q_MonthVBAP_ROUTE: TStringField
      FieldName = 'VBAP_ROUTE'
      Size = 10
    end
    object q_MonthROUTE_NAME: TStringField
      FieldName = 'ROUTE_NAME'
      Size = 100
    end
    object q_MonthKNANF: TStringField
      FieldName = 'KNANF'
      Size = 10
    end
    object q_MonthKNEND: TStringField
      FieldName = 'KNEND'
      Size = 10
    end
    object q_MonthSH_KUNNR: TStringField
      FieldName = 'SH_KUNNR'
      Size = 10
    end
    object q_MonthPOLUCH_GD_KOD: TStringField
      FieldName = 'POLUCH_GD_KOD'
      Size = 12
    end
    object q_MonthOWNERSHIP_ID: TFloatField
      FieldName = 'OWNERSHIP_ID'
    end
    object q_MonthVBAK_AUART: TStringField
      FieldName = 'VBAK_AUART'
      Size = 10
    end
    object q_MonthCONTRACTOR_ATTR: TIntegerField
      FieldName = 'CONTRACTOR_ATTR'
    end
    object q_MonthNP_OWNER: TStringField
      FieldName = 'NP_OWNER'
      Size = 10
    end
    object q_MonthNP_PRODR: TStringField
      FieldName = 'NP_PRODR'
      Size = 10
    end
    object q_MonthPRODR_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100' '#1085'/'#1087#1088
      FieldName = 'PRODR_NAME'
      Size = 100
    end
    object q_MonthPRODR_ID: TFloatField
      FieldName = 'PRODR_ID'
    end
    object q_MonthLGOBE: TStringField
      FieldName = 'LGOBE'
      Size = 100
    end
    object q_MonthDOP_CIST: TIntegerField
      FieldName = 'DOP_CIST'
      Required = True
    end
    object q_MonthVBKD_VSART: TStringField
      FieldName = 'VBKD_VSART'
      Size = 3
    end
    object q_MonthVAGOWNER_NAME: TStringField
      FieldName = 'VAGOWNER_NAME'
      Size = 100
    end
    object q_MonthTONN_ALLOW: TFloatField
      FieldName = 'TONN_ALLOW'
    end
    object q_MonthCIST_ALLOW: TFloatField
      FieldName = 'CIST_ALLOW'
    end
    object q_MonthTONN_MIN: TFloatField
      FieldName = 'TONN_MIN'
    end
    object q_MonthCIST_MIN: TFloatField
      FieldName = 'CIST_MIN'
    end
    object q_MonthUPDATE_FILE: TStringField
      FieldName = 'UPDATE_FILE'
      Size = 1
    end
    object q_MonthTEX_PD_ID: TFloatField
      DisplayLabel = #1050#1086#1076' '#1058#1045#1061' '#1055#1044
      FieldName = 'TEX_PD_ID'
    end
  end
  object ds_Month: TDataSource
    DataSet = q_Month
    Left = 452
    Top = 207
  end
  object q_Plan: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,NAME FROM V_PLAN_STRU'
      'WHERE HAS_CHILD<>1'
      '  AND BEGIN_DATE<:END_DATE+1'
      '  AND END_DATE>:BEGIN_DATE-1'
      'ORDER BY KOD_SGR, KOD_SPG, KOD_RZD, KOD_PRZ, KOD_GRP, KOD_PGR')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = f_main.ora_Session
    Left = 412
    Top = 258
    object q_PlanID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_PlanNAME: TStringField
      FieldName = 'NAME'
      Size = 156
    end
  end
  object ds_Plan: TDataSource
    DataSet = q_Plan
    Left = 508
    Top = 258
  end
  object q_Prod: TOracleDataSet
    SQL.Strings = (
      'SELECT ID_NPR,NAME_NPR FROM KLS_PROD WHERE FLG_ALLOWED=1')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E50520100000000080000004E414D455F
      4E50520100000000}
    Session = f_main.ora_Session
    Left = 260
    Top = 250
  end
  object ds_prod: TDataSource
    DataSet = q_Prod
    Left = 308
    Top = 250
  end
end