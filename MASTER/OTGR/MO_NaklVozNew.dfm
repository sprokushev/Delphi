object f_NaklVozNew: Tf_NaklVozNew
  Left = 280
  Top = 237
  BorderStyle = bsSingle
  Caption = #1053#1086#1074#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
  ClientHeight = 589
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
    Top = 97
    Width = 742
    Height = 492
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    ColumnDefValues.Title.TitleButton = True
    DataSource = ds_temp_nakl
    EvenRowColor = clInfoBk
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    FrozenCols = 2
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDialogFind]
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
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'NUM_CIST'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #8470' '#1074#1072#1075#1086#1085#1072
      end
      item
        EditButtons = <>
        FieldName = 'SVED_NUM'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1089#1074#1077#1076'.'
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'VAGOWNER_NAME'
        Footers = <>
        Title.Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
        Width = 154
      end
      item
        EditButtons = <>
        FieldName = 'VES_CIST'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'SVED_DATE'
        Footers = <>
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'REESTR_ID'
        Footers = <>
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
    Height = 63
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 12
      Top = 16
      Width = 70
      Height = 13
      Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#8470
    end
    object Label1: TLabel
      Left = 213
      Top = 16
      Width = 11
      Height = 13
      Caption = #1086#1090
    end
    object btSetNum: TSpeedButton
      Left = 186
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
    object Label3: TLabel
      Left = 328
      Top = 16
      Width = 94
      Height = 13
      Caption = #1060#1086#1088#1084#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
    end
    object Label4: TLabel
      Left = 12
      Top = 40
      Width = 96
      Height = 13
      Caption = #1064#1072#1073#1083#1086#1085' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
    end
    object Label5: TLabel
      Left = 336
      Top = 43
      Width = 87
      Height = 13
      Caption = #1052#1072#1089#1090#1077#1088' '#1087#1086#1075#1088#1091#1079#1082#1080
    end
    object SpeedButton1: TSpeedButton
      Left = 597
      Top = 36
      Width = 23
      Height = 22
      Glyph.Data = {
        E6000000424DE60000000000000076000000280000000E0000000E0000000100
        0400000000007000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3300333333333333330033333333333333003333300033333300333330F03333
        3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
        3300333330F033333300333330F0333333003333300033333300333333333333
        33003333333333333300}
      OnClick = acMasterPogrAddExecute
    end
    object SpeedButton2: TSpeedButton
      Left = 296
      Top = 36
      Width = 23
      Height = 22
      Action = acShabVozAdd
      Glyph.Data = {
        E6000000424DE60000000000000076000000280000000E0000000E0000000100
        0400000000007000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3300333333333333330033333333333333003333300033333300333330F03333
        3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
        3300333330F033333300333330F0333333003333300033333300333333333333
        33003333333333333300}
    end
    object edNum: TEdit
      Left = 95
      Top = 12
      Width = 90
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnChange = edNumChange
    end
    object edDate: TDateTimePicker
      Left = 233
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
    object lc_FormNakl: TRxDBLookupCombo
      Left = 426
      Top = 13
      Width = 167
      Height = 21
      DropDownCount = 8
      LookupField = 'ID'
      LookupDisplay = 'FORM_NAME'
      LookupSource = ds_FormNakl
      TabOrder = 2
    end
    object lc_ShabVoz: TRxDBLookupCombo
      Left = 120
      Top = 37
      Width = 169
      Height = 21
      DropDownCount = 8
      LookupField = 'ID'
      LookupDisplay = 'SHAB_NAME'
      LookupSource = ds_ShabVoz
      TabOrder = 3
    end
    object lc_operator: TRxDBLookupCombo
      Left = 426
      Top = 37
      Width = 167
      Height = 21
      DropDownCount = 8
      DisplayEmpty = '<'#1053#1045' '#1042#1067#1041#1056#1040#1053'>'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = ds_operator
      TabOrder = 4
    end
    object Button1: TButton
      Left = 648
      Top = 24
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 5
      OnClick = Button1Click
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
    AfterPost = q_temp_naklAfterPost
    Left = 187
    Top = 211
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
    Top = 211
  end
  object pkgFor_nakl_voz: TOraclePackage
    PackageName = 'FOR_NAKL_VOZ'
    Left = 48
    Top = 496
  end
  object amNakl: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = acVagAdd
            ImageIndex = 26
          end
          item
            Action = acVagDel
            ImageIndex = 28
            ShortCut = 119
          end
          item
            Action = acNaklSave
            ImageIndex = 20
          end
          item
            Caption = '-'
          end
          item
            Action = acPrintNaklVoz
            ImageIndex = 37
          end
          item
            Action = acShabVozAdd
            ImageIndex = 38
          end
          item
            Action = acMasterPogrAdd
            ImageIndex = 38
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
    Left = 8
    Top = 184
    StyleName = 'XP Style'
    object acVagAdd: TAction
      Category = 'FOR_ALL'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 26
      OnExecute = acVagAddExecute
    end
    object acNaklSave: TAction
      Category = 'FOR_ALL'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 20
      OnExecute = acNaklSaveExecute
    end
    object acVagDel: TAction
      Category = 'FOR_ALL'
      Caption = 'F8-'#1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 28
      ShortCut = 119
      OnExecute = acVagDelExecute
    end
    object acExit: TAction
      Category = 'FOR_ALL'
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 8
      OnExecute = acExitExecute
    end
    object acPrintNaklVoz: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      ImageIndex = 37
      OnExecute = acPrintNaklVozExecute
    end
    object acShabVozAdd: TAction
      Caption = #1053#1086#1074#1099#1081' '#1096#1072#1073#1083#1086#1085
      ImageIndex = 38
      OnExecute = acShabVozAddExecute
    end
    object acMasterPogrAdd: TAction
      Category = 'FOR_ALL'
      Caption = #1053#1086#1074#1099#1081' '#1084#1072#1089#1090#1077#1088
      ImageIndex = 38
      OnExecute = acMasterPogrAddExecute
    end
  end
  object pkgFor_documents: TOraclePackage
    PackageName = 'FOR_DOCUMENTS'
    Left = 148
    Top = 496
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
      03000000150000000200000049440100000000080000004D4553544F5F494401
      000000000C0000004C4F41445F545950455F4944010000000008000000564553
      5F434953540100000000070000005645535F414C4C0100000000080000004E41
      4B4C5F4E554D0100000000090000004E414B4C5F4441544501000000000C0000
      0050524F445F475531325F494401000000000B000000534841424E414B4C5F49
      440100000000080000005550414B5F5645530100000000030000005645530100
      0000000B000000464F524D4E414B4C5F494401000000000A0000005348414245
      58505F49440100000000050000004B5F5441520100000000060000004E4F4D5F
      5A4401000000000B00000050524F445F49445F4E505201000000000A00000053
      484142564F5A5F494401000000000600000049535F45585001000000000C0000
      004F5045524E414C49565F4944010000000006000000444F475F494401000000
      00070000005354414E5F49440100000000}
    UniqueFields = 'ID'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate]
    UpdatingTable = 'NAKL'
    Session = f_main.ora_Session
    Left = 187
    Top = 164
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
    object q_naklOPERNALIV_ID: TFloatField
      FieldName = 'OPERNALIV_ID'
    end
    object q_naklDOG_ID: TFloatField
      FieldName = 'DOG_ID'
    end
    object q_naklSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
  end
  object PopupVagons: TTBPopupMenu
    Left = 672
    Top = 264
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
      'SELECT a.*,b.PROD_ID_NPR'
      'FROM REESTR_IN a, SVED_IN b'
      'WHERE a.SVED_IN_ID=b.ID'
      '  AND a.ID=:ID'
      '')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      03000000340000000200000049440100000000080000004E554D5F4349535401
      00000000090000004B414C4942525F494401000000000C0000005641474F4E54
      5950455F49440100000000080000005645535F4349535401000000000B000000
      5641474F574E45525F4944010000000008000000434150414349545901000000
      0008000000535645445F504F53010000000005000000565A4C49560100000000
      0600000054454D50455201000000000700000046414B545F504C010000000003
      0000005645530100000000090000005A50555F54595045310100000000090000
      005A50555F5459504532010000000007000000504C4F4D424131010000000007
      000000504C4F4D4241320100000000070000004E414B4C5F494401000000000B
      000000464F524D4E414B4C5F49440100000000080000004E554D5F4B56495401
      0000000009000000444154455F4B564954010000000005000000544152494601
      000000000B00000054415249465F4755415244010000000006000000564F4C55
      4D450100000000070000004241445F4E554D010000000007000000474F53545F
      494401000000000400000043544C56010000000008000000564F4C554D453135
      0100000000080000004E414B4C5F504F5301000000000B00000050524F445F49
      445F4E50520100000000080000004D4553544F5F494401000000000A00000053
      5645445F494E5F49440100000000090000005445585F50445F49440100000000
      0800000047524F54505F494401000000000B0000005354414E5F4F54505F4944
      01000000000D000000504153505F4E554D5F4B56495401000000000C00000052
      455A5F4E554D5F4B56495401000000000E000000504153505F444154455F4B56
      495401000000000A000000565A4C49565F4B56495401000000000B0000005445
      4D5045525F4B564954010000000007000000504C5F4B56495401000000000800
      00005645535F4B56495401000000000C000000444154455F494E5F5354414E01
      0000000009000000444154455F4F5447520100000000090000005645535F4E45
      54544F010000000008000000444154455F564F5A0100000000080000004B5649
      545F564F5A01000000000700000053554D5F564F5A01000000000B0000005354
      414E5F564F5A5F4944010000000009000000454D5054595F564F5A0100000000
      050000004F53544154010000000007000000555645445F494401000000000800
      0000555645445F504F530100000000}
    ReadOnly = True
    Session = f_main.ora_Session
    Left = 187
    Top = 259
    object q_reestrID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_reestrSVED_IN_ID: TStringField
      FieldName = 'SVED_IN_ID'
      Required = True
      Size = 9
    end
    object q_reestrMESTO_ID: TIntegerField
      FieldName = 'MESTO_ID'
      Required = True
    end
    object q_reestrTEX_PD_ID: TFloatField
      FieldName = 'TEX_PD_ID'
    end
    object q_reestrGROTP_ID: TFloatField
      FieldName = 'GROTP_ID'
    end
    object q_reestrSTAN_OTP_ID: TFloatField
      FieldName = 'STAN_OTP_ID'
    end
    object q_reestrFORMNAKL_ID: TIntegerField
      FieldName = 'FORMNAKL_ID'
    end
    object q_reestrNUM_KVIT: TFloatField
      FieldName = 'NUM_KVIT'
    end
    object q_reestrDATE_KVIT: TDateTimeField
      FieldName = 'DATE_KVIT'
    end
    object q_reestrPASP_NUM_KVIT: TStringField
      FieldName = 'PASP_NUM_KVIT'
      Size = 15
    end
    object q_reestrREZ_NUM_KVIT: TStringField
      FieldName = 'REZ_NUM_KVIT'
      Size = 15
    end
    object q_reestrPASP_DATE_KVIT: TDateTimeField
      FieldName = 'PASP_DATE_KVIT'
    end
    object q_reestrVZLIV_KVIT: TIntegerField
      FieldName = 'VZLIV_KVIT'
    end
    object q_reestrTEMPER_KVIT: TFloatField
      FieldName = 'TEMPER_KVIT'
    end
    object q_reestrPL_KVIT: TFloatField
      FieldName = 'PL_KVIT'
    end
    object q_reestrVES_KVIT: TFloatField
      FieldName = 'VES_KVIT'
    end
    object q_reestrTARIF: TFloatField
      FieldName = 'TARIF'
    end
    object q_reestrTARIF_GUARD: TFloatField
      FieldName = 'TARIF_GUARD'
    end
    object q_reestrDATE_IN_STAN: TDateTimeField
      FieldName = 'DATE_IN_STAN'
    end
    object q_reestrDATE_OTGR: TDateTimeField
      FieldName = 'DATE_OTGR'
      Required = True
    end
    object q_reestrNUM_CIST: TStringField
      FieldName = 'NUM_CIST'
      Required = True
      Size = 10
    end
    object q_reestrVAGONTYPE_ID: TIntegerField
      FieldName = 'VAGONTYPE_ID'
    end
    object q_reestrKALIBR_ID: TStringField
      FieldName = 'KALIBR_ID'
      Size = 5
    end
    object q_reestrVES_CIST: TFloatField
      FieldName = 'VES_CIST'
    end
    object q_reestrVAGOWNER_ID: TIntegerField
      FieldName = 'VAGOWNER_ID'
    end
    object q_reestrCAPACITY: TStringField
      FieldName = 'CAPACITY'
      Size = 10
    end
    object q_reestrPLOMBA1: TStringField
      FieldName = 'PLOMBA1'
      Size = 15
    end
    object q_reestrPLOMBA2: TStringField
      FieldName = 'PLOMBA2'
      Size = 15
    end
    object q_reestrVZLIV: TIntegerField
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
    end
    object q_reestrVES_NETTO: TFloatField
      FieldName = 'VES_NETTO'
    end
    object q_reestrDATE_VOZ: TDateTimeField
      FieldName = 'DATE_VOZ'
    end
    object q_reestrKVIT_VOZ: TStringField
      FieldName = 'KVIT_VOZ'
      Size = 12
    end
    object q_reestrSUM_VOZ: TFloatField
      FieldName = 'SUM_VOZ'
    end
    object q_reestrSTAN_VOZ_ID: TFloatField
      FieldName = 'STAN_VOZ_ID'
    end
    object q_reestrSVED_POS: TIntegerField
      FieldName = 'SVED_POS'
    end
    object q_reestrEMPTY_VOZ: TIntegerField
      FieldName = 'EMPTY_VOZ'
      Required = True
    end
    object q_reestrVOLUME: TFloatField
      FieldName = 'VOLUME'
    end
    object q_reestrVOLUME15: TFloatField
      FieldName = 'VOLUME15'
    end
    object q_reestrCTLV: TFloatField
      FieldName = 'CTLV'
    end
    object q_reestrGOST_ID: TIntegerField
      FieldName = 'GOST_ID'
      Required = True
    end
    object q_reestrZPU_TYPE1: TFloatField
      FieldName = 'ZPU_TYPE1'
    end
    object q_reestrZPU_TYPE2: TFloatField
      FieldName = 'ZPU_TYPE2'
    end
    object q_reestrBAD_NUM: TIntegerField
      FieldName = 'BAD_NUM'
      Required = True
    end
    object q_reestrNAKL_ID: TFloatField
      FieldName = 'NAKL_ID'
    end
    object q_reestrNAKL_POS: TIntegerField
      FieldName = 'NAKL_POS'
    end
    object q_reestrPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object q_reestrOSTAT: TIntegerField
      FieldName = 'OSTAT'
    end
    object q_reestrUVED_ID: TIntegerField
      FieldName = 'UVED_ID'
    end
    object q_reestrUVED_POS: TIntegerField
      FieldName = 'UVED_POS'
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
    Left = 672
    Top = 216
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 672
    Top = 168
  end
  object q_FormNakl: TOracleDataSet
    SQL.Strings = (
      'select id,form_name from kls_formnakl'
      'where load_type_id=1'
      '  and flg_dostup=1'
      '  and is_rus=1'
      'order by id  ')
    QBEDefinition.QBEFieldDefs = {
      0300000002000000020000004944010000000009000000464F524D5F4E414D45
      0100000000}
    ReadOnly = True
    Session = f_main.ora_Session
    Left = 187
    Top = 361
    object q_FormNaklID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_FormNaklFORM_NAME: TStringField
      FieldName = 'FORM_NAME'
      Required = True
      Size = 30
    end
  end
  object ds_FormNakl: TDataSource
    DataSet = q_FormNakl
    Left = 104
    Top = 361
  end
  object q_operator: TOracleDataSet
    SQL.Strings = (
      'select id,name from kls_master_pogr '
      '')
    ReadOnly = True
    Session = f_main.ora_Session
    Left = 187
    Top = 312
  end
  object ds_operator: TDataSource
    DataSet = q_operator
    Left = 104
    Top = 312
  end
  object q_ShabVoz: TOracleDataSet
    SQL.Strings = (
      'select kls_shabvoz.*,'
      
        #39#1064#1072#1073#1083#1086#1085' '#8470' '#39'||TO_CHAR(kls_shabvoz.SHAB_NUM)||'#39' '#1086#1090' '#39'||TO_CHAR(kls_' +
        'shabvoz.SHAB_DATE,'#39'dd.mm.yyyy'#39') as shab_name'
      'from kls_shabvoz')
    QBEDefinition.QBEFieldDefs = {
      030000001900000002000000494401000000000A0000005354414E4F54505F49
      440100000000090000005445585F50445F494401000000000800000047524F54
      505F49440100000000070000005354414E5F4944010000000008000000564554
      4B415F4944010000000009000000504F4C5543485F494401000000000B000000
      464C475F464F524D415F3201000000000B00000050524F445F49445F4E505201
      00000000040000005052494D0100000000030000004752340100000000050000
      004B5F54415201000000000A000000494E5055545F4441544501000000000900
      00005452414E53504F525401000000000600000049535F455850010000000008
      00000045585045445F4944010000000009000000475531325F415F4944010000
      000008000000565A49534B5F494401000000000A00000047524F54505F42414E
      4B01000000000800000047524F54505F525301000000000B0000005445585F50
      445F42414E4B0100000000090000005445585F50445F52530100000000080000
      00534841425F4E554D010000000009000000534841425F444154450100000000
      09000000534841425F4E414D450100000000}
    ReadOnly = True
    Session = f_main.ora_Session
    Left = 392
    Top = 224
  end
  object ds_ShabVoz: TDataSource
    DataSet = q_ShabVoz
    Left = 392
    Top = 272
  end
end
