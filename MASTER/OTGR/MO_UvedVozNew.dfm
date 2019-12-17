object f_UvedVozNew: Tf_UvedVozNew
  Left = 284
  Top = 237
  BorderStyle = bsSingle
  Caption = #1053#1086#1074#1086#1077' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
  ClientHeight = 466
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
    Top = 75
    Width = 742
    Height = 391
    Align = alClient
    DataSource = ds_temp_uved
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    FrozenCols = 2
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
        FieldName = 'UVED_POS'
        Footers = <>
        Title.Caption = #8470' '#1087'/'#1087
        Title.TitleButton = True
        Width = 33
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
        FieldName = 'VAGOWNER_NAME'
        Footers = <>
        Title.Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
        Title.TitleButton = True
        Width = 197
      end
      item
        EditButtons = <>
        FieldName = 'VES_CIST'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'VES'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.TitleButton = True
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
        FieldName = 'VAG_STATUS'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'PROD_NAME'
        Footers = <>
        Title.Caption = #1055#1088#1086#1076#1091#1082#1090
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'PASP_NUM'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'DATE_OFORML'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
        Title.TitleButton = True
        Width = 108
      end
      item
        EditButtons = <>
        FieldName = 'SVED_NUM'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1089#1074#1077#1076'.'
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'NOM_ZD'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1079#1072#1076#1072#1085#1080#1103
        Title.TitleButton = True
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
        Title.Caption = #1042#1077#1090#1082#1072' '#1086#1090#1087'.'
        Title.TitleButton = True
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'POD_NUM'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1074#1077#1076'.'#1087#1086#1076'.'
        Title.TitleButton = True
        Width = 85
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
    ActionManager = amUved
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 15660791
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 15660791
    Spacing = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 34
    Width = 742
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 22
      Top = 16
      Width = 84
      Height = 13
      Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#8470
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
    object Label5: TLabel
      Left = 352
      Top = 16
      Width = 109
      Height = 13
      Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100' '#1057#1046#1057':'
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
      OnCloseUp = CheckUvedDate
      OnChange = CheckUvedDate
      OnExit = CheckUvedDate
    end
    object lc_operator: TRxDBLookupCombo
      Left = 466
      Top = 11
      Width = 167
      Height = 21
      DropDownCount = 8
      DisplayEmpty = '<'#1053#1045' '#1042#1067#1041#1056#1040#1053'>'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = ds_operator
      TabOrder = 2
    end
    object Button1: TButton
      Left = 644
      Top = 10
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 75
    Width = 742
    Height = 391
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    ColumnDefValues.Title.TitleButton = True
    DataSource = ds_temp_uved
    EvenRowColor = clInfoBk
    Flat = False
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
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'UVED_POS'
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
        FieldName = 'NAKL_NUM'
        Footers = <>
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
        Width = 114
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
  object q_temp_uved: TOracleDataSet
    SQL.Strings = (
      'select temp_uved.*,temp_uved.rowid'
      'from temp_uved'
      'order by uved_pos'
      '')
    QBEDefinition.QBEFieldDefs = {
      0300000015000000090000005245455354525F49440100000000060000004E4F
      4D5F5A440100000000090000005354414E5F4E414D4501000000000B00000050
      4F4C5543485F4E414D450100000000080000004E554D5F434953540100000000
      0D0000005641474F574E45525F4E414D45010000000003000000564553010000
      00000B000000444154455F4F464F524D4C01000000000900000050524F445F4E
      414D45010000000008000000535645445F4E554D010000000007000000504F44
      5F4E554D01000000000E0000005645544B415F4F54505F4E414D450100000000
      08000000555645445F504F53010000000008000000535645445F504F53010000
      000009000000535645445F44415445010000000008000000504153505F4E554D
      01000000000A0000005641475F5354415455530100000000080000004E414B4C
      5F4E554D0100000000070000005645535F414C4C010000000008000000564553
      5F434953540100000000080000005645535F5550414B0100000000}
    UniqueFields = 'reestr_id'
    UpdatingTable = 'temp_uved'
    Session = f_main.ora_Session
    AfterPost = q_temp_uvedAfterPost
    Left = 176
    Top = 176
    object q_temp_uvedUVED_POS: TFloatField
      FieldName = 'UVED_POS'
    end
    object q_temp_uvedREESTR_ID: TFloatField
      FieldName = 'REESTR_ID'
      ReadOnly = True
    end
    object q_temp_uvedNOM_ZD: TStringField
      FieldName = 'NOM_ZD'
      ReadOnly = True
      Size = 12
    end
    object q_temp_uvedSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      ReadOnly = True
      Size = 50
    end
    object q_temp_uvedPOLUCH_NAME: TStringField
      FieldName = 'POLUCH_NAME'
      ReadOnly = True
      Size = 30
    end
    object q_temp_uvedNUM_CIST: TStringField
      FieldName = 'NUM_CIST'
      ReadOnly = True
      Size = 10
    end
    object q_temp_uvedVAGOWNER_NAME: TStringField
      FieldName = 'VAGOWNER_NAME'
      ReadOnly = True
      Size = 50
    end
    object q_temp_uvedVES: TFloatField
      DisplayLabel = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1090#1085
      FieldName = 'VES'
      ReadOnly = True
    end
    object q_temp_uvedDATE_OFORML: TDateTimeField
      FieldName = 'DATE_OFORML'
      ReadOnly = True
    end
    object q_temp_uvedPROD_NAME: TStringField
      FieldName = 'PROD_NAME'
      ReadOnly = True
      Size = 30
    end
    object q_temp_uvedSVED_NUM: TFloatField
      FieldName = 'SVED_NUM'
      ReadOnly = True
    end
    object q_temp_uvedPOD_NUM: TFloatField
      FieldName = 'POD_NUM'
      ReadOnly = True
    end
    object q_temp_uvedVETKA_OTP_NAME: TStringField
      FieldName = 'VETKA_OTP_NAME'
      ReadOnly = True
      Size = 30
    end
    object q_temp_uvedSVED_POS: TFloatField
      FieldName = 'SVED_POS'
      ReadOnly = True
    end
    object q_temp_uvedSVED_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_DATE'
      ReadOnly = True
    end
    object q_temp_uvedPASP_NUM: TStringField
      DisplayLabel = 'N '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP_NUM'
      ReadOnly = True
    end
    object q_temp_uvedVAG_STATUS: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VAG_STATUS'
      ReadOnly = True
      Size = 30
    end
    object q_temp_uvedNAKL_NUM: TFloatField
      DisplayLabel = 'N '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'NAKL_NUM'
      ReadOnly = True
    end
    object q_temp_uvedVES_ALL: TFloatField
      DisplayLabel = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1074#1072#1075#1086#1085#1072', '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
      FieldName = 'VES_ALL'
      ReadOnly = True
    end
    object q_temp_uvedVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072', '#1090#1085
      FieldName = 'VES_CIST'
      ReadOnly = True
    end
    object q_temp_uvedVES_UPAK: TFloatField
      DisplayLabel = #1042#1077#1089' '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
      FieldName = 'VES_UPAK'
      ReadOnly = True
    end
  end
  object ds_temp_uved: TDataSource
    DataSet = q_temp_uved
    Left = 192
    Top = 232
  end
  object pkgFor_uved_voz: TOraclePackage
    PackageName = 'FOR_UVED_VOZ'
    Left = 352
    Top = 280
  end
  object amUved: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = acUvedAdd
            ImageIndex = 26
          end
          item
            Action = acUvedDel
            ImageIndex = 28
            ShortCut = 119
          end
          item
            Action = acUvedSave
            ImageIndex = 20
          end
          item
            Caption = '-'
          end
          item
            Action = acUvedPrint
            ImageIndex = 37
          end
          item
            Action = acAktPrint
            ImageIndex = 37
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
    Left = 16
    Top = 152
    StyleName = 'XP Style'
    object acUvedAdd: TAction
      Category = 'FOR_ALL'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 26
      OnExecute = acUvedAddExecute
    end
    object acUvedSave: TAction
      Category = 'FOR_ALL'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 20
      OnExecute = acUvedSaveExecute
    end
    object acUvedDel: TAction
      Category = 'FOR_ALL'
      Caption = 'F8-'#1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 28
      ShortCut = 119
      OnExecute = acUvedDelExecute
    end
    object acExit: TAction
      Category = 'FOR_ALL'
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 8
      OnExecute = acExitExecute
    end
    object acUvedPrint: TAction
      Category = 'FOR_ALL'
      Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086' '#1089#1083#1080#1074#1077
      ImageIndex = 37
      OnExecute = acUvedPrintExecute
    end
    object acAktPrint: TAction
      Category = 'FOR_ALL'
      Caption = #1040#1082#1090' '#1086#1073' '#1086#1089#1090#1072#1090#1082#1072#1093
      ImageIndex = 37
      OnExecute = acAktPrintExecute
    end
  end
  object pkgFor_documents: TOraclePackage
    PackageName = 'FOR_DOCUMENTS'
    Left = 348
    Top = 232
  end
  object q_uved: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '  s.*'
      'FROM UVED s'
      'WHERE s.ID=:UVED_ID'
      '')
    Variables.Data = {
      0300000001000000080000003A555645445F4944040000000000000000000000}
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000B0000000200000049440100000000080000004D4553544F5F494401
      000000000C0000004C4F41445F545950455F4944010000000008000000555645
      445F4E554D010000000009000000555645445F4441544501000000000A000000
      4C554B4F4D415F4E554D0100000000070000004D50535F4E554D010000000008
      000000434845525F4E554D0100000000080000005645544C5F4E554D01000000
      000A0000004F5045525347535F494401000000000B00000050524F445F49445F
      4E50520100000000}
    ReadOnly = True
    Session = f_main.ora_Session
    Left = 248
    Top = 176
    object q_uvedID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_uvedUVED_NUM: TFloatField
      FieldName = 'UVED_NUM'
      Required = True
    end
    object q_uvedUVED_DATE: TDateTimeField
      FieldName = 'UVED_DATE'
      Required = True
    end
    object q_uvedLOAD_TYPE_ID: TFloatField
      FieldName = 'LOAD_TYPE_ID'
      Required = True
    end
    object q_uvedMESTO_ID: TFloatField
      FieldName = 'MESTO_ID'
      Required = True
    end
    object q_uvedLUKOMA_NUM: TFloatField
      FieldName = 'LUKOMA_NUM'
    end
    object q_uvedMPS_NUM: TFloatField
      FieldName = 'MPS_NUM'
    end
    object q_uvedCHER_NUM: TFloatField
      FieldName = 'CHER_NUM'
    end
    object q_uvedVETL_NUM: TFloatField
      FieldName = 'VETL_NUM'
    end
    object q_uvedOPERSGS_ID: TFloatField
      FieldName = 'OPERSGS_ID'
    end
    object q_uvedPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 5
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
    Left = 352
    Top = 336
  end
  object PopupVagons: TTBPopupMenu
    Left = 344
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
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 360
    Top = 392
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
      03000000390000000200000049440100000000080000004E554D5F4349535401
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
      0000555645445F504F5301000000000A000000505F564F445F4B564954010000
      00000B000000505F444952545F4B56495401000000000A000000505F534F4C5F
      4B56495401000000000E0000005645535F4E4554544F5F4B5649540100000000
      0C0000004E554D5F4B5649545F5458540100000000}
    ReadOnly = True
    Session = f_main.ora_Session
    Left = 235
    Top = 291
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
    object q_reestrTEX_PD_ID: TFloatField
      FieldName = 'TEX_PD_ID'
    end
    object q_reestrP_VOD_KVIT: TFloatField
      FieldName = 'P_VOD_KVIT'
    end
    object q_reestrP_DIRT_KVIT: TFloatField
      FieldName = 'P_DIRT_KVIT'
    end
    object q_reestrP_SOL_KVIT: TFloatField
      FieldName = 'P_SOL_KVIT'
    end
    object q_reestrVES_NETTO_KVIT: TFloatField
      FieldName = 'VES_NETTO_KVIT'
    end
    object q_reestrNUM_KVIT_TXT: TStringField
      FieldName = 'NUM_KVIT_TXT'
      Size = 15
    end
  end
  object ds_operator: TDataSource
    DataSet = q_operator
    Left = 104
    Top = 312
  end
  object q_operator: TOracleDataSet
    SQL.Strings = (
      'select id,name from kls_master_sgs'
      '')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    ReadOnly = True
    Session = f_main.ora_Session
    Left = 187
    Top = 312
  end
end
