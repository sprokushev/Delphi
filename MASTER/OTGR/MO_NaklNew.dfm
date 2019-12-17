object f_NaklNew: Tf_NaklNew
  Left = 349
  Top = 287
  BorderStyle = bsSingle
  Caption = #1053#1086#1074#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
  ClientHeight = 431
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000EEEEEEE00000E00000EEEEEEEEEEE00000E
    EE000000EEE000000EEEEEEE00000000E0000000EEE0000000EEEEE000000000
    E000000EEEE0000000EEEEE000000000E000000EEEEE000000EEEEE000000000
    E000000EEEEE000000EEEEE000000000E00000EEEEEEE00000EEEEE000000000
    E00000EEEEE0E00000EEEEE000000000E0000EEEEEE0E00000EEEEE000000000
    E0000EEEEE000E0000EEEEE000000000E0000EEEEE000E0000EEEEE000000000
    E000EEEEEE0000E000EEEEE000000000E000EEEEE00000E000EEEEE000000000
    E00EEEEEE00000E000EEEEE000000000E00EEEEE0000000E00EEEEE000000000
    E0EEEEEE0000000E00EEEEE000000000E0EEEEE000000000E0EEEEE000000000
    E0EEEEE000000000E0EEEEE000000000EEEEEEE0000000000EEEEEE00000000E
    EEEEEE00000000000EEEEEEE00000EEEEEEEEE000000000000EEEEEEEE000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFF80FBE003E3F1F80FF7F1FC1FF7E1FC1FF7E0FC1FF7E0
    FC1FF7C07C1FF7C17C1FF7817C1FF783BC1FF783BC1FF703DC1FF707DC1FF607
    DC1FF60FEC1FF40FEC1FF41FF41FF41FF41FF01FF81FE03FF80F803FFC03FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GridVagons: TDBGridEh
    Left = 0
    Top = 81
    Width = 742
    Height = 350
    Align = alClient
    DataSource = ds_temp_nakl
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    FrozenCols = 2
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    PopupMenu = PopupVagons
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAKL_POS'
        Footers = <>
        Title.Caption = #8470' '#1087'/'#1087
        Title.TitleButton = True
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'NUM_CIST'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #8470' '#1074#1072#1075#1086#1085#1072
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'POD_NUM'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1074#1077#1076'. '#1087#1086#1076'.'
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'SVED_NUM'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1089#1074#1077#1076'.'
        Title.TitleButton = True
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'NOM_ZD'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1079#1072#1076#1072#1085#1080#1103
        Title.TitleButton = True
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'VAGOWNER_NAME'
        Footers = <>
        Title.Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
        Title.TitleButton = True
        Width = 154
      end
      item
        EditButtons = <>
        FieldName = 'VES_CIST'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'VES'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1090#1085
        Title.TitleButton = True
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'VES_UPAK'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'VES_ALL'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'PROD_NAME'
        Footers = <>
        Title.Caption = #1055#1088#1086#1076#1091#1082#1090
        Title.TitleButton = True
        Width = 182
      end
      item
        EditButtons = <>
        FieldName = 'PASP_NUM'
        Footers = <>
        Title.TitleButton = True
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'DATE_OFORML'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
        Title.TitleButton = True
        Width = 114
      end
      item
        EditButtons = <>
        FieldName = 'SVED_DATE'
        Footers = <>
        Title.TitleButton = True
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'STAN_NAME'
        Footers = <>
        Title.Caption = #1057#1090#1072#1085#1094#1080#1103' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 253
      end
      item
        EditButtons = <>
        FieldName = 'POLUCH_NAME'
        Footers = <>
        Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'VETKA_OTP_NAME'
        Footers = <>
        Title.Caption = #1055#1091#1090#1100' '#1086#1090#1075#1088#1091#1079#1082#1080
        Title.TitleButton = True
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'REESTR_ID'
        Footers = <>
        Title.TitleButton = True
      end>
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 742
    Height = 34
    ActionManager = amNakl
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Spacing = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 34
    Width = 742
    Height = 47
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 32
      Top = 16
      Width = 70
      Height = 13
      Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#8470
    end
    object Label1: TLabel
      Left = 229
      Top = 16
      Width = 11
      Height = 13
      Caption = #1086#1090
    end
    object btSetNum: TSpeedButton
      Left = 202
      Top = 11
      Width = 23
      Height = 22
      Hint = #1055#1086#1076#1086#1073#1088#1072#1090#1100' '#1085#1086#1084#1077#1088
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F33F333F3337F330FF0FFF0FFF
        F03337F37F337F3337F330FF0FFF0FFFF03337F37FFF7FFF37F330F00000000F
        F03337F77777777337F330FFF0FFF0FFF03337F337F337F337F330FFF0FFF0FF
        F03337F337FFF7FFF7F330FF00000000F03337F37777777737F330FFFF0FFF0F
        F03337F3337F337F37F330FFFF0FFF0FF03337F33373337337F330FFFFFFFFFF
        F03337F33333333FF7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = False
      OnClick = btSetNumClick
    end
    object edNum: TEdit
      Left = 111
      Top = 12
      Width = 90
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnChange = edNumChange
    end
    object edDate: TDateTimePicker
      Left = 249
      Top = 12
      Width = 90
      Height = 21
      Date = 37839.812709131950000000
      Time = 37839.812709131950000000
      TabOrder = 1
      OnCloseUp = CheckNaklDate
      OnChange = CheckNaklDate
      OnExit = CheckNaklDate
    end
  end
  object q_temp_nakl: TOracleDataSet
    SQL.Strings = (
      'select temp_nakl.*,temp_nakl.rowid'
      'from temp_nakl'
      'order by nakl_pos'
      '')
    QBEDefinition.QBEFieldDefs = {
      0300000014000000080000004E414B4C5F504F53010000000009000000524545
      5354525F49440100000000060000004E4F4D5F5A440100000000090000005354
      414E5F4E414D4501000000000B000000504F4C5543485F4E414D450100000000
      080000004E554D5F4349535401000000000D0000005641474F574E45525F4E41
      4D4501000000000300000056455301000000000B000000444154455F4F464F52
      4D4C01000000000900000050524F445F4E414D45010000000008000000535645
      445F4E554D010000000007000000504F445F4E554D01000000000E0000005645
      544B415F4F54505F4E414D45010000000008000000535645445F504F53010000
      000008000000504153505F4E554D010000000009000000535645445F44415445
      01000000000A0000005641475F5354415455530100000000070000005645535F
      414C4C0100000000080000005645535F43495354010000000008000000564553
      5F5550414B0100000000}
    UniqueFields = 'reestr_id'
    UpdatingTable = 'temp_nakl'
    Session = f_main.ora_Session
    Left = 184
    Top = 232
    object q_temp_naklNAKL_POS: TFloatField
      FieldName = 'NAKL_POS'
      ProviderFlags = []
    end
    object q_temp_naklREESTR_ID: TFloatField
      FieldName = 'REESTR_ID'
      ReadOnly = True
    end
    object q_temp_naklNOM_ZD: TStringField
      FieldName = 'NOM_ZD'
      ReadOnly = True
      Size = 12
    end
    object q_temp_naklSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      ReadOnly = True
      Size = 50
    end
    object q_temp_naklPOLUCH_NAME: TStringField
      FieldName = 'POLUCH_NAME'
      ReadOnly = True
      Size = 30
    end
    object q_temp_naklNUM_CIST: TStringField
      FieldName = 'NUM_CIST'
      ReadOnly = True
      Size = 10
    end
    object q_temp_naklVAGOWNER_NAME: TStringField
      FieldName = 'VAGOWNER_NAME'
      ReadOnly = True
      Size = 50
    end
    object q_temp_naklVES: TFloatField
      FieldName = 'VES'
      ReadOnly = True
    end
    object q_temp_naklDATE_OFORML: TDateTimeField
      FieldName = 'DATE_OFORML'
      ReadOnly = True
    end
    object q_temp_naklPROD_NAME: TStringField
      FieldName = 'PROD_NAME'
      ReadOnly = True
      Size = 30
    end
    object q_temp_naklSVED_NUM: TFloatField
      FieldName = 'SVED_NUM'
      ReadOnly = True
    end
    object q_temp_naklPOD_NUM: TFloatField
      FieldName = 'POD_NUM'
      ReadOnly = True
    end
    object q_temp_naklVETKA_OTP_NAME: TStringField
      FieldName = 'VETKA_OTP_NAME'
      ReadOnly = True
      Size = 30
    end
    object q_temp_naklSVED_POS: TFloatField
      FieldName = 'SVED_POS'
      ReadOnly = True
    end
    object q_temp_naklPASP_NUM: TStringField
      DisplayLabel = 'N '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP_NUM'
      ReadOnly = True
    end
    object q_temp_naklSVED_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_DATE'
      ReadOnly = True
    end
    object q_temp_naklVAG_STATUS: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'VAG_STATUS'
      ReadOnly = True
      Size = 30
    end
    object q_temp_naklVES_ALL: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072', '#1075#1088#1091#1079#1072', '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
      FieldName = 'VES_ALL'
      ReadOnly = True
    end
    object q_temp_naklVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072', '#1090#1085
      FieldName = 'VES_CIST'
      ReadOnly = True
    end
    object q_temp_naklVES_UPAK: TFloatField
      DisplayLabel = #1042#1077#1089' '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
      FieldName = 'VES_UPAK'
      ReadOnly = True
    end
  end
  object ds_temp_nakl: TDataSource
    DataSet = q_temp_nakl
    Left = 104
    Top = 232
  end
  object pkgFor_nakl: TOraclePackage
    PackageName = 'FOR_NAKL'
    Left = 264
    Top = 232
  end
  object amNakl: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = acNaklAdd
            ImageIndex = 26
          end
          item
            Action = acNaklDel
            ImageIndex = 28
          end
          item
            Action = acNaklSave
            ImageIndex = 20
          end
          item
            Caption = '-'
          end
          item
            Action = acExit
            ImageIndex = 8
          end>
        ActionBar = ActionToolBar1
      end>
    Images = f_main.ImageXP
    Left = 416
    Top = 232
    StyleName = 'XP Style'
    object acNaklAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 26
      OnExecute = acNaklAddExecute
    end
    object acNaklSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 20
      OnExecute = acNaklSaveExecute
    end
    object acNaklDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 28
      OnExecute = acNaklDelExecute
    end
    object acExit: TAction
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 8
      OnExecute = acExitExecute
    end
  end
  object pkgFor_documents: TOraclePackage
    PackageName = 'FOR_DOCUMENTS'
    Left = 348
    Top = 232
  end
  object q_nakl: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '  s.rowid,  '
      '  s.*'
      'FROM NAKL s'
      'WHERE s.ID=:NAKL_ID'
      '')
    Variables.Data = {
      0300000001000000080000003A4E414B4C5F4944040000000000000000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      03000000120000000200000049440100000000080000004D4553544F5F494401
      000000000C0000004C4F41445F545950455F4944010000000008000000564553
      5F434953540100000000070000005645535F414C4C0100000000080000004E41
      4B4C5F4E554D0100000000090000004E414B4C5F4441544501000000000C0000
      0050524F445F475531325F494401000000000B000000534841424E414B4C5F49
      440100000000080000005550414B5F5645530100000000030000005645530100
      0000000B000000464F524D4E414B4C5F494401000000000A0000005348414245
      58505F49440100000000050000004B5F5441520100000000060000004E4F4D5F
      5A4401000000000B00000050524F445F49445F4E505201000000000A00000053
      484142564F5A5F494401000000000600000049535F4558500100000000}
    UniqueFields = 'ID'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    UpdatingTable = 'NAKL'
    Session = f_main.ora_Session
    Left = 248
    Top = 160
    object q_naklID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_naklMESTO_ID: TFloatField
      FieldName = 'MESTO_ID'
      Required = True
    end
    object q_naklLOAD_TYPE_ID: TFloatField
      FieldName = 'LOAD_TYPE_ID'
      Required = True
    end
    object q_naklNAKL_NUM: TFloatField
      FieldName = 'NAKL_NUM'
      Required = True
    end
    object q_naklNAKL_DATE: TDateTimeField
      FieldName = 'NAKL_DATE'
      Required = True
    end
    object q_naklPROD_GU12_ID: TStringField
      FieldName = 'PROD_GU12_ID'
      Size = 10
    end
    object q_naklFORMNAKL_ID: TFloatField
      FieldName = 'FORMNAKL_ID'
      Required = True
    end
    object q_naklSHABNAKL_ID: TFloatField
      FieldName = 'SHABNAKL_ID'
    end
    object q_naklSHABEXP_ID: TFloatField
      FieldName = 'SHABEXP_ID'
    end
    object q_naklK_TAR: TStringField
      FieldName = 'K_TAR'
      Size = 10
    end
    object q_naklVES_CIST: TFloatField
      FieldName = 'VES_CIST'
      Required = True
    end
    object q_naklVES: TFloatField
      FieldName = 'VES'
      Required = True
    end
    object q_naklUPAK_VES: TFloatField
      FieldName = 'UPAK_VES'
      Required = True
    end
    object q_naklVES_ALL: TFloatField
      FieldName = 'VES_ALL'
      Required = True
    end
    object q_naklNOM_ZD: TStringField
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_naklPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 5
    end
    object q_naklSHABVOZ_ID: TFloatField
      FieldName = 'SHABVOZ_ID'
    end
    object q_naklIS_EXP: TIntegerField
      FieldName = 'IS_EXP'
    end
  end
  object PopupVagons: TTBPopupMenu
    Left = 352
    Top = 168
    object TBItem2: TTBItem
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      OnClick = TBItem2Click
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem1: TTBItem
      Caption = #1058#1077#1082#1089#1090' '#1079#1072#1087#1088#1086#1089#1072
      OnClick = TBItem1Click
    end
  end
  object q_reestr: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.*,b.NOM_ZD,b.PROD_ID_NPR,b.PASP_NUM,NVL(m.IS_EXP,0) as ' +
        'IS_EXP'
      'FROM REESTR a, SVED b, month m'
      'WHERE a.SVED_ID=b.ID'
      '  AND b.NOM_ZD=m.NOM_ZD(+)'
      '  AND a.ID=:ID'
      '')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000003D0000000200000049440100000000080000004E554D5F4349535401
      00000000090000004B414C4942525F494401000000000C0000005641474F4E54
      5950455F49440100000000080000005645535F4349535401000000000B000000
      5641474F574E45525F4944010000000008000000434150414349545901000000
      00080000004E43495354444F500100000000040000004158455301000000000C
      0000005645544B415F504F445F494401000000000D0000005645544B415F4E41
      50525F494401000000000D0000005641475F5354415455535F49440100000000
      07000000535645445F4944010000000008000000535645445F504F5301000000
      000E0000005645445F504F445F524F575F494401000000000400000057455331
      0100000000040000005449503101000000000C0000005645544B415F4F54505F
      4944010000000005000000565A4C495601000000000600000054454D50455201
      000000000700000046414B545F504C0100000000030000005645530100000000
      070000004B4F4C5F4E45540100000000070000005645535F414C4C0100000000
      060000005645535F45440100000000060000004B4F4C5F454401000000000700
      00005550414B5F49440100000000080000005550414B5F56455301000000000B
      0000005550414B5F5645535F4544010000000007000000504F44444F4E530100
      0000000A000000504F44444F4E5F564553010000000007000000534849454C44
      5301000000000A000000534849454C445F5645530100000000090000005A5055
      5F54595045310100000000090000005A50555F54595045320100000000070000
      00504C4F4D424131010000000007000000504C4F4D4241320100000000090000
      00524F53494E53504C31010000000009000000524F53494E53504C3201000000
      000B0000004E41525F4C494E455F49440100000000080000004E554D5F50524F
      5001000000000A00000046494F5F4452495645520100000000070000004E414B
      4C5F494401000000000B000000464F524D4E414B4C5F49440100000000080000
      004E554D5F4B564954010000000009000000444154455F4B5649540100000000
      05000000544152494601000000000B00000054415249465F4755415244010000
      000006000000564F4C554D450100000000070000004241445F4E554D01000000
      0007000000474F53545F494401000000000400000043544C5601000000000800
      0000564F4C554D4531350100000000080000004E414B4C5F504F530100000000
      07000000555645445F4944010000000008000000555645445F504F5301000000
      000700000049535F4155544F01000000000B00000050524F445F49445F4E5052
      0100000000060000004E4F4D5F5A44010000000008000000504153505F4E554D
      01000000000600000049535F4558500100000000}
    ReadOnly = True
    Session = f_main.ora_Session
    Left = 144
    Top = 160
    object q_reestrID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_reestrSVED_ID: TStringField
      FieldName = 'SVED_ID'
      Required = True
      Size = 9
    end
    object q_reestrSVED_POS: TIntegerField
      FieldName = 'SVED_POS'
    end
    object q_reestrVED_POD_ROW_ID: TFloatField
      FieldName = 'VED_POD_ROW_ID'
    end
    object q_reestrNUM_CIST: TStringField
      FieldName = 'NUM_CIST'
      Required = True
      Size = 10
    end
    object q_reestrNCISTDOP: TIntegerField
      FieldName = 'NCISTDOP'
    end
    object q_reestrAXES: TIntegerField
      FieldName = 'AXES'
    end
    object q_reestrCAPACITY: TStringField
      FieldName = 'CAPACITY'
      Size = 10
    end
    object q_reestrWES1: TStringField
      FieldName = 'WES1'
      Size = 5
    end
    object q_reestrVES_CIST: TFloatField
      FieldName = 'VES_CIST'
    end
    object q_reestrVAGONTYPE_ID: TFloatField
      FieldName = 'VAGONTYPE_ID'
    end
    object q_reestrKALIBR_ID: TStringField
      FieldName = 'KALIBR_ID'
      Size = 5
    end
    object q_reestrTIP1: TStringField
      FieldName = 'TIP1'
      Size = 5
    end
    object q_reestrVAGOWNER_ID: TFloatField
      FieldName = 'VAGOWNER_ID'
    end
    object q_reestrVETKA_POD_ID: TFloatField
      FieldName = 'VETKA_POD_ID'
    end
    object q_reestrVETKA_OTP_ID: TFloatField
      FieldName = 'VETKA_OTP_ID'
    end
    object q_reestrVETKA_NAPR_ID: TFloatField
      FieldName = 'VETKA_NAPR_ID'
    end
    object q_reestrVAG_STATUS_ID: TFloatField
      FieldName = 'VAG_STATUS_ID'
      Required = True
    end
    object q_reestrVZLIV: TFloatField
      FieldName = 'VZLIV'
    end
    object q_reestrTEMPER: TFloatField
      FieldName = 'TEMPER'
    end
    object q_reestrFAKT_PL: TFloatField
      FieldName = 'FAKT_PL'
    end
    object q_reestrVES: TFloatField
      FieldName = 'VES'
      Required = True
    end
    object q_reestrKOL_NET: TFloatField
      FieldName = 'KOL_NET'
      Required = True
    end
    object q_reestrVES_ALL: TFloatField
      FieldName = 'VES_ALL'
      Required = True
    end
    object q_reestrVES_ED: TFloatField
      FieldName = 'VES_ED'
      Required = True
    end
    object q_reestrKOL_ED: TIntegerField
      FieldName = 'KOL_ED'
      Required = True
    end
    object q_reestrUPAK_ID: TFloatField
      FieldName = 'UPAK_ID'
    end
    object q_reestrUPAK_VES: TFloatField
      FieldName = 'UPAK_VES'
      Required = True
    end
    object q_reestrUPAK_VES_ED: TFloatField
      FieldName = 'UPAK_VES_ED'
      Required = True
    end
    object q_reestrPODDONS: TIntegerField
      FieldName = 'PODDONS'
      Required = True
    end
    object q_reestrPODDON_VES: TFloatField
      FieldName = 'PODDON_VES'
      Required = True
    end
    object q_reestrSHIELDS: TIntegerField
      FieldName = 'SHIELDS'
      Required = True
    end
    object q_reestrSHIELD_VES: TFloatField
      FieldName = 'SHIELD_VES'
      Required = True
    end
    object q_reestrZPU_TYPE1: TFloatField
      FieldName = 'ZPU_TYPE1'
    end
    object q_reestrZPU_TYPE2: TFloatField
      FieldName = 'ZPU_TYPE2'
    end
    object q_reestrPLOMBA1: TStringField
      FieldName = 'PLOMBA1'
      Size = 15
    end
    object q_reestrPLOMBA2: TStringField
      FieldName = 'PLOMBA2'
      Size = 15
    end
    object q_reestrROSINSPL1: TStringField
      FieldName = 'ROSINSPL1'
      Size = 6
    end
    object q_reestrROSINSPL2: TStringField
      FieldName = 'ROSINSPL2'
      Size = 6
    end
    object q_reestrNAR_LINE_ID: TFloatField
      FieldName = 'NAR_LINE_ID'
    end
    object q_reestrNUM_PROP: TIntegerField
      FieldName = 'NUM_PROP'
    end
    object q_reestrFIO_DRIVER: TStringField
      FieldName = 'FIO_DRIVER'
      Size = 50
    end
    object q_reestrNAKL_ID: TFloatField
      FieldName = 'NAKL_ID'
    end
    object q_reestrFORMNAKL_ID: TFloatField
      FieldName = 'FORMNAKL_ID'
    end
    object q_reestrNUM_KVIT: TStringField
      FieldName = 'NUM_KVIT'
      Size = 10
    end
    object q_reestrDATE_KVIT: TDateTimeField
      FieldName = 'DATE_KVIT'
    end
    object q_reestrTARIF: TFloatField
      FieldName = 'TARIF'
      Required = True
    end
    object q_reestrTARIF_GUARD: TFloatField
      FieldName = 'TARIF_GUARD'
      Required = True
    end
    object q_reestrVOLUME: TFloatField
      FieldName = 'VOLUME'
      Required = True
    end
    object q_reestrBAD_NUM: TIntegerField
      FieldName = 'BAD_NUM'
      Required = True
    end
    object q_reestrGOST_ID: TIntegerField
      FieldName = 'GOST_ID'
      Required = True
    end
    object q_reestrCTLV: TFloatField
      FieldName = 'CTLV'
      Required = True
    end
    object q_reestrVOLUME15: TIntegerField
      FieldName = 'VOLUME15'
      Required = True
    end
    object q_reestrNAKL_POS: TIntegerField
      FieldName = 'NAKL_POS'
    end
    object q_reestrUVED_ID: TFloatField
      FieldName = 'UVED_ID'
    end
    object q_reestrUVED_POS: TIntegerField
      FieldName = 'UVED_POS'
    end
    object q_reestrIS_AUTO: TIntegerField
      FieldName = 'IS_AUTO'
      Required = True
    end
    object q_reestrNOM_ZD: TStringField
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_reestrPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 5
    end
    object q_reestrPASP_NUM: TStringField
      FieldName = 'PASP_NUM'
      Size = 15
    end
    object q_reestrIS_EXP: TFloatField
      FieldName = 'IS_EXP'
    end
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState')
    Left = 456
    Top = 168
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 584
    Top = 200
  end
end
