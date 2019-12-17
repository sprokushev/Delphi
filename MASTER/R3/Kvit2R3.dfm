inherited f_Kvit2R3: Tf_Kvit2R3
  Left = 366
  Top = 162
  Width = 800
  Caption = #1057#1074#1103#1079#1100' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1089' '#1087#1086#1089#1090#1072#1074#1082#1072#1084#1080' R3'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 792
    Height = 26
    object TBToolbar2: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TBItem14: TTBItem
        Action = acR3_DelPostNoFile
        DisplayMode = nbdmImageAndText
      end
      object TBItem13: TTBItem
        Action = acR3_DelPostFile
        DisplayMode = nbdmImageAndText
      end
      object TBItem15: TTBItem
        Action = acR3_SendOperOF
        DisplayMode = nbdmImageAndText
      end
      object TBItem16: TTBItem
        Action = acR3_SendDocOF
        DisplayMode = nbdmImageAndText
      end
      object TBItem1: TTBItem
        Action = acR3_SendOS
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acR3_SendSU
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = acR3_SendQQ
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 52
    Width = 792
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object RxSpeedButton1: TRxSpeedButton
      Left = 106
      Top = 3
      Width = 25
      Height = 25
      Action = acR3_RefreshPost
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
    object Label3: TLabel
      Left = 135
      Top = 9
      Width = 34
      Height = 13
      Caption = #1089' '#1076#1072#1090#1099
    end
    object Label4: TLabel
      Left = 262
      Top = 9
      Width = 37
      Height = 13
      Caption = #1087#1086' '#1076#1072#1090#1091
    end
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 3
      Width = 100
      Height = 25
      DataSource = ds_Kvit2R3
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object ed_BeginDate: TDateTimePicker
      Left = 177
      Top = 5
      Width = 82
      Height = 21
      Date = 37070.390091736100000000
      Time = 37070.390091736100000000
      TabOrder = 1
    end
    object ed_EndDate: TDateTimePicker
      Left = 305
      Top = 5
      Width = 82
      Height = 21
      Date = 37070.390091736100000000
      Time = 37070.390091736100000000
      TabOrder = 2
    end
    object cb_FilterKind: TComboBox
      Left = 437
      Top = 5
      Width = 145
      Height = 21
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 3
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
      Left = 584
      Top = 5
      Width = 162
      Height = 21
      TabOrder = 4
    end
    object cb_NOT_Filter: TCheckBox
      Left = 392
      Top = 8
      Width = 43
      Height = 17
      Caption = 'NOT'
      TabOrder = 5
    end
    object ed_Sobstv: TRxDBLookupCombo
      Left = 114
      Top = 29
      Width = 273
      Height = 21
      DropDownCount = 8
      Enabled = False
      LookupField = 'ID'
      LookupDisplay = 'PREDPR_NAME'
      LookupSource = ds_Sobstv
      TabOrder = 6
    end
    object cb_Sobstv: TCheckBox
      Left = 8
      Top = 32
      Width = 105
      Height = 17
      Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = cb_SobstvClick
    end
    object cb_Prod: TCheckBox
      Left = 392
      Top = 30
      Width = 79
      Height = 17
      Caption = #1055#1088#1086#1076#1091#1082#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = cb_ProdClick
    end
    object ed_Prod: TRxDBLookupCombo
      Left = 474
      Top = 28
      Width = 273
      Height = 21
      DropDownCount = 8
      Enabled = False
      LookupField = 'ID_NPR'
      LookupDisplay = 'LONG_NAME_NPR'
      LookupSource = ds_Prod
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 792
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
  end
  object gridPost: TDBGridEh
    Left = 0
    Top = 103
    Width = 792
    Height = 309
    Align = alClient
    AllowedOperations = []
    AllowedSelections = [gstRecordBookmarks, gstAll]
    DataSource = ds_Kvit2R3
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    FrozenCols = 5
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch]
    SumList.Active = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnGetCellParams = gridPostGetCellParams
    OnSortMarkingChanged = gridPostSortMarkingChanged
    Columns = <
      item
        Alignment = taRightJustify
        EditButtons = <>
        Footers = <>
        Title.Caption = #8470' '#1087'/'#1087
        Width = 33
        OnGetCellParams = gridPostColumns0GetCellParams
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'date_otgr'
        Footers = <>
        Title.TitleButton = True
        Width = 61
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'id_ms'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'id_sap'
        Footers = <>
        Title.TitleButton = True
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'id_sap_psn'
        Footers = <>
        Title.TitleButton = True
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'kvit_id'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'bednr'
        Footers = <>
        Title.TitleButton = True
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'ves'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'od_zzzz_id'
        Footers = <>
        Title.TitleButton = True
        Width = 100
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'nom_zd'
        Footers = <>
        Title.TitleButton = True
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'prod_name'
        Footers = <>
        Title.TitleButton = True
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'num_otgr'
        Footers = <>
        Title.TitleButton = True
        Width = 63
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'num_kvit'
        Footers = <>
        Title.TitleButton = True
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'oper'
        Footers = <>
        Title.TitleButton = True
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'lastoper'
        Footers = <>
        Title.TitleButton = True
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'exp_name'
        Footers = <>
        Title.TitleButton = True
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'send_oper'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'd_oper'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 't_oper'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'of_file'
        Footers = <>
        Title.TitleButton = True
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'send_doc'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'd_doc'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 't_doc'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'of_file_d'
        Footers = <>
        Title.TitleButton = True
        Width = 115
      end
      item
        EditButtons = <>
        FieldName = 'send_os'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'd_os'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 't_os'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'os_file'
        Footers = <>
        Title.TitleButton = True
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'send_su'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'd_su'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 't_su'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'su_file'
        Footers = <>
        Title.TitleButton = True
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'send_qq'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'd_qq'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 't_qq'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'qq_file'
        Footers = <>
        Title.TitleButton = True
        Width = 118
      end
      item
        EditButtons = <>
        FieldName = 'np'
        Footers = <>
        Title.TitleButton = True
        Width = 57
      end>
  end
  object TBDock2: TTBDock
    Left = 0
    Top = 26
    Width = 792
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TBItem4: TTBItem
        Action = acR3_NoDelPost
        DisplayMode = nbdmImageAndText
      end
      object TBItem6: TTBItem
        Action = acR3_NoSendOperOF
        DisplayMode = nbdmImageAndText
      end
      object TBItem7: TTBItem
        Action = acR3_NoSendDocOF
        DisplayMode = nbdmImageAndText
      end
      object TBItem8: TTBItem
        Action = acR3_NoSendOS
        DisplayMode = nbdmImageAndText
      end
      object TBItem9: TTBItem
        Action = acR3_NoSendSU
        DisplayMode = nbdmImageAndText
      end
      object TBItem10: TTBItem
        Action = acR3_NoSendQQ
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object ActionManager2: TActionManager
    Images = f_main.img_Common
    Left = 248
    Top = 104
    StyleName = 'XP Style'
    object acR3_DelPostNoFile: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1073#1077#1079' '#1092#1072#1081#1083#1072
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1089#1090#1072#1074#1082#1091'('#1080') '#1073#1077#1079' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1092#1072#1081#1083#1072
      ImageIndex = 5
      OnExecute = acR3_DelPostNoFileExecute
    end
    object acR3_DelPostFile: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089' '#1092#1072#1081#1083#1086#1084
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1089#1090#1072#1074#1082#1091'('#1080') '#1089' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077#1084' '#1092#1072#1081#1083#1072
      ImageIndex = 29
      OnExecute = acR3_DelPostFileExecute
    end
    object acR3_NoDelPost: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1087#1086#1089#1090#1072#1074#1082#1080'                       '
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1087#1086#1089#1090#1072#1074#1082#1080
      ImageIndex = 14
      OnExecute = acR3_NoDelPostExecute
    end
    object acR3_SendOperOF: TAction
      Caption = #1055#1086#1074#1090#1086#1088#1085#1086' - '#1086#1087#1077#1088'.OF'
      Hint = #1055#1086#1074#1090#1086#1088#1085#1086' '#1086#1090#1087#1088#1072#1074#1080#1090#1100' '#1086#1087#1077#1088#1072#1090#1080#1074#1085#1091#1102' '#1086#1090#1075#1088#1091#1079#1082#1091' (OF)'
      ImageIndex = 31
      OnExecute = acR3_SendOperOFExecute
    end
    object acR3_NoSendOperOF: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' - '#1086#1087#1077#1088'.OF'
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1086#1090#1087#1088#1072#1074#1082#1091' '#1086#1087#1077#1088#1074#1085#1086#1081' '#1087#1086#1089#1090#1072#1074#1082#1080' (OF)'
      ImageIndex = 14
      OnExecute = acR3_NoSendOperOFExecute
    end
    object acR3_SendDocOF: TAction
      Caption = #1076#1086#1082'.OF'
      Hint = #1055#1086#1074#1090#1086#1088#1085#1086' '#1086#1090#1087#1088#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1080#1088#1086#1074#1072#1085#1085#1091#1102' '#1086#1090#1075#1088#1091#1079#1082#1091' (OF)'
      ImageIndex = 23
      OnExecute = acR3_SendDocOFExecute
    end
    object acR3_NoSendDocOF: TAction
      Caption = #1076#1086#1082'.OF'
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1086#1090#1087#1088#1072#1074#1082#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1080#1088#1086#1074#1072#1085#1085#1086#1081' '#1086#1090#1075#1088#1091#1079#1082#1080' (OF)'
      ImageIndex = 14
      OnExecute = acR3_NoSendDocOFExecute
    end
    object acR3_SendOS: TAction
      Caption = 'OS'
      Hint = #1055#1086#1074#1090#1086#1088#1085#1086' '#1086#1090#1087#1088#1072#1074#1080#1090#1100' '#1091#1089#1083#1091#1075#1080' (OS)'
      ImageIndex = 24
      OnExecute = acR3_SendOSExecute
    end
    object acR3_NoSendOS: TAction
      Caption = 'OS'
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1086#1090#1087#1088#1072#1074#1082#1091' '#1091#1089#1083#1091#1075' (OS)'
      ImageIndex = 14
      OnExecute = acR3_NoSendOSExecute
    end
    object acR3_SendSU: TAction
      Caption = 'SU'
      Hint = #1055#1086#1074#1090#1086#1088#1085#1086' '#1086#1090#1087#1088#1072#1074#1080#1090#1100' '#1087#1088#1086#1074#1086#1079#1085#1091#1102' '#1087#1083#1072#1090#1091' (SU)'
      ImageIndex = 25
      OnExecute = acR3_SendSUExecute
    end
    object acR3_NoSendSU: TAction
      Caption = 'SU'
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1086#1090#1087#1088#1072#1074#1082#1091' '#1087#1088#1086#1074'.'#1087#1083#1072#1090#1099' (SU)'
      ImageIndex = 14
      OnExecute = acR3_NoSendSUExecute
    end
    object acR3_SendQQ: TAction
      Caption = 'QQ'
      Hint = #1055#1086#1074#1090#1086#1088#1085#1086' '#1086#1090#1087#1088#1072#1074#1080#1090#1100' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090' (QQ)'
      ImageIndex = 26
      OnExecute = acR3_SendQQExecute
    end
    object acR3_NoSendQQ: TAction
      Caption = 'QQ'
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1086#1090#1087#1088#1072#1074#1082#1091' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1086#1074' (QQ)'
      ImageIndex = 14
      OnExecute = acR3_NoSendQQExecute
    end
    object acR3_RefreshPost: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      ShortCut = 119
      OnExecute = acR3_RefreshPostExecute
    end
    object acR3_SeekPost: TAction
      Caption = #1055#1086#1080#1089#1082
      Hint = #1055#1086#1080#1089#1082
      ImageIndex = 9
    end
    object acR3_InfoPost: TAction
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1086#1089#1090#1072#1074#1082#1077
      Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1086#1089#1090#1072#1074#1082#1077
      ImageIndex = 22
    end
  end
  object ado_Session: TADOConnection
    ConnectionString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=PF'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 48
    Top = 104
  end
  object q_Kvit2R3: TADOQuery
    Connection = ado_Session
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT k2r3.*,prod.abbr as prod_name,IIF(is_exp,'#39#1069#1050#1057#1055#1054#1056#1058#39','#39#1056#1054#1057#1057#1048 +
        #1071' '#39') as exp_name'
      'FROM '#39'U:\FOX2R3\ARCHIV\kvit2r3.dbf'#39' k2r3, prod, month'
      
        'WHERE k2r3.kod_npr=prod.kod and ALLT(k2r3.nom_zd)=ALLT(month.nom' +
        '_zd)'
      'AND (EMPTY(DATE_OTGR) or'
      '(DATE_OTGR>={11/01/2002} and DATE_OTGR<={11/30/2002}))'
      'AND 1=1 '
      'AND 1=1'
      'AND 1=1'
      'AND 1=1'
      'AND 1=1'
      'AND 1=1'
      'AND 1=1'
      'AND 1=1'
      'AND 1=1'
      'AND 1=1'
      'AND 1=1'
      'AND 1=1'
      'AND 1=1'
      'AND 1=1'
      'AND 1=1'
      'ORDER BY DATE_OTGR,ID_SAP,ID_SAP_PSN,ID_MS')
    Left = 120
    Top = 104
    object q_Kvit2R3kvit_id: TIntegerField
      DisplayLabel = 'ID '#1087#1086#1089#1090#1072#1074#1082#1080' '#1074' '#1053#1055#1054
      FieldName = 'kvit_id'
    end
    object q_Kvit2R3bednr: TBCDField
      DisplayLabel = 'ID '#1087#1088#1086#1074'. '#1087#1083#1072#1090#1099
      FieldName = 'bednr'
      Precision = 18
      Size = 0
    end
    object q_Kvit2R3id_sap: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1082#1072' R3'
      FieldName = 'id_sap'
      FixedChar = True
      Size = 30
    end
    object q_Kvit2R3od_zzzz_id: TStringField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103' '#1088#1072#1079#1085'.R3'
      FieldName = 'od_zzzz_id'
      FixedChar = True
      Size = 50
    end
    object q_Kvit2R3id_ms: TBCDField
      DisplayLabel = 'ID '#1087#1086#1089#1090#1072#1074#1082#1080
      FieldName = 'id_ms'
      Precision = 18
      Size = 0
    end
    object q_Kvit2R3ves: TBCDField
      DisplayLabel = #1042#1077#1089
      FieldName = 'ves'
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
      Precision = 15
      Size = 3
    end
    object q_Kvit2R3id_sap_psn: TStringField
      DisplayLabel = #1055#1086#1079'. '#1087#1086#1089#1090#1072#1074#1082#1080' R3'
      FieldName = 'id_sap_psn'
      FixedChar = True
      Size = 30
    end
    object q_Kvit2R3oper: TStringField
      DisplayLabel = #1059#1076'. '#1089' '#1092#1072#1081#1083#1086#1084
      FieldName = 'oper'
      FixedChar = True
      Size = 1
    end
    object q_Kvit2R3lastoper: TStringField
      DisplayLabel = #1059#1076'. '#1073#1077#1079'. '#1092#1072#1081#1083#1072
      FieldName = 'lastoper'
      FixedChar = True
      Size = 1
    end
    object q_Kvit2R3send_oper: TBooleanField
      DisplayLabel = 'OF('#1086')'
      FieldName = 'send_oper'
    end
    object q_Kvit2R3t_oper: TStringField
      DisplayLabel = #1042#1088#1077#1084#1103
      FieldName = 't_oper'
      FixedChar = True
      Size = 8
    end
    object q_Kvit2R3of_file: TStringField
      DisplayLabel = #1060#1072#1081#1083
      FieldName = 'of_file'
      FixedChar = True
      Size = 30
    end
    object q_Kvit2R3t_del: TStringField
      DisplayLabel = #1042#1088#1077#1084#1103'('#1091#1076')'
      FieldName = 't_del'
      FixedChar = True
      Size = 8
    end
    object q_Kvit2R3send_doc: TBooleanField
      DisplayLabel = 'OF('#1076')'
      FieldName = 'send_doc'
    end
    object q_Kvit2R3t_doc: TStringField
      DisplayLabel = #1042#1088#1077#1084#1103
      FieldName = 't_doc'
      FixedChar = True
      Size = 8
    end
    object q_Kvit2R3of_file_d: TStringField
      DisplayLabel = #1060#1072#1081#1083
      FieldName = 'of_file_d'
      FixedChar = True
      Size = 30
    end
    object q_Kvit2R3os: TStringField
      FieldName = 'os'
      FixedChar = True
      Size = 1
    end
    object q_Kvit2R3lastos: TStringField
      FieldName = 'lastos'
      FixedChar = True
      Size = 1
    end
    object q_Kvit2R3send_os: TBooleanField
      DisplayLabel = 'OS'
      FieldName = 'send_os'
    end
    object q_Kvit2R3t_os: TStringField
      DisplayLabel = #1042#1088#1077#1084#1103
      FieldName = 't_os'
      FixedChar = True
      Size = 8
    end
    object q_Kvit2R3os_file: TStringField
      DisplayLabel = #1060#1072#1081#1083
      FieldName = 'os_file'
      FixedChar = True
      Size = 30
    end
    object q_Kvit2R3su: TStringField
      FieldName = 'su'
      FixedChar = True
      Size = 1
    end
    object q_Kvit2R3lastsu: TStringField
      FieldName = 'lastsu'
      FixedChar = True
      Size = 1
    end
    object q_Kvit2R3send_su: TBooleanField
      DisplayLabel = 'SU'
      FieldName = 'send_su'
    end
    object q_Kvit2R3t_su: TStringField
      DisplayLabel = #1042#1088#1077#1084#1103
      FieldName = 't_su'
      FixedChar = True
      Size = 8
    end
    object q_Kvit2R3su_file: TStringField
      DisplayLabel = #1060#1072#1081#1083
      FieldName = 'su_file'
      FixedChar = True
      Size = 30
    end
    object q_Kvit2R3qq: TStringField
      FieldName = 'qq'
      FixedChar = True
      Size = 1
    end
    object q_Kvit2R3lastqq: TStringField
      FieldName = 'lastqq'
      FixedChar = True
      Size = 1
    end
    object q_Kvit2R3send_qq: TBooleanField
      DisplayLabel = 'QQ'
      FieldName = 'send_qq'
    end
    object q_Kvit2R3t_qq: TStringField
      DisplayLabel = #1042#1088#1077#1084#1103
      FieldName = 't_qq'
      FixedChar = True
      Size = 8
    end
    object q_Kvit2R3qq_file: TStringField
      DisplayLabel = #1060#1072#1081#1083
      FieldName = 'qq_file'
      FixedChar = True
      Size = 30
    end
    object q_Kvit2R3logfile: TStringField
      FieldName = 'logfile'
      FixedChar = True
      Size = 30
    end
    object q_Kvit2R3is_exp: TBooleanField
      DisplayLabel = #1069#1082#1089#1087#1086#1088#1090
      FieldName = 'is_exp'
    end
    object q_Kvit2R3tip_otgr: TIntegerField
      FieldName = 'tip_otgr'
    end
    object q_Kvit2R3nom_zd: TStringField
      DisplayLabel = #1056#1072#1079#1085'.'#1053#1055#1054
      FieldName = 'nom_zd'
      FixedChar = True
      Size = 12
    end
    object q_Kvit2R3kod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_Kvit2R3np: TIntegerField
      DisplayLabel = 'N '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'np'
    end
    object q_Kvit2R3num_kvit: TBCDField
      DisplayLabel = 'N '#1082#1074#1080#1090#1072#1085#1094#1080#1080
      FieldName = 'num_kvit'
      Precision = 12
      Size = 0
    end
    object q_Kvit2R3num_otgr: TStringField
      DisplayLabel = 'N '#1090#1088'.'#1089#1088'-'#1074#1072
      FieldName = 'num_otgr'
      FixedChar = True
      Size = 30
    end
    object q_Kvit2R3prod_name: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      DisplayWidth = 30
      FieldName = 'prod_name'
      FixedChar = True
      Size = 30
    end
    object q_Kvit2R3d_oper: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'd_oper'
    end
    object q_Kvit2R3d_del: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'd_del'
    end
    object q_Kvit2R3d_doc: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'd_doc'
    end
    object q_Kvit2R3d_os: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'd_os'
    end
    object q_Kvit2R3d_su: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'd_su'
    end
    object q_Kvit2R3d_qq: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'd_qq'
    end
    object q_Kvit2R3date_otgr: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'date_otgr'
    end
    object q_Kvit2R3exp_name: TStringField
      DisplayLabel = #1069#1050#1057#1055#1054#1056#1058
      FieldName = 'exp_name'
      FixedChar = True
      Size = 7
    end
  end
  object ds_Kvit2R3: TDataSource
    DataSet = q_Kvit2R3
    Left = 176
    Top = 104
  end
  object q_Update: TADOQuery
    Connection = ado_Session
    DataSource = ds_Kvit2R3
    Parameters = <>
    Left = 120
    Top = 160
  end
  object q_Sobstv: TOracleDataSet
    SQL.Strings = (
      
        'SELECT A.ID,A.PREDPR_NAME,B.FOX_KOD FROM KLS_PREDPR A,PREDPR_ROL' +
        'E B'
      'WHERE A.ID=B.PREDPR_ID'
      'AND B.KLS_ROLE_ID=1'
      'ORDER BY A.ID')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000B0000005052454450525F4E41
      4D450100000000}
    Session = f_main.ora_Session
    Left = 200
    Top = 176
  end
  object ds_Sobstv: TDataSource
    DataSet = q_Sobstv
    Left = 256
    Top = 184
  end
  object q_prod: TOracleDataSet
    SQL.Strings = (
      'SELECT A.ID_NPR,A.LONG_NAME_NPR FROM KLS_PROD A'
      'WHERE A.FLG_ALLOWED=1'
      'ORDER BY A.ID_NPR')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E505201000000000D0000004C4F4E475F
      4E414D455F4E50520100000000}
    Session = f_main.ora_Session
    Left = 200
    Top = 232
  end
  object ds_Prod: TDataSource
    DataSet = q_prod
    Left = 256
    Top = 240
  end
end
