object f_UvedNew: Tf_UvedNew
  Left = 312
  Top = 191
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1086#1073' '#1091#1073#1086#1088#1082#1077
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
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GridVagons: TDBGridEh
    Left = 0
    Top = 134
    Width = 742
    Height = 332
    Align = alClient
    DataSource = ds_temp_uved
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
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Spacing = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 34
    Width = 742
    Height = 39
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
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 73
    Width = 742
    Height = 61
    Align = alTop
    TabOrder = 3
    object Label3: TLabel
      Left = 4
      Top = 14
      Width = 138
      Height = 13
      Caption = #8470' '#1089#1087#1080#1089#1082#1072' '#1076#1083#1103' '#1086#1093#1088#1072#1085#1099' '#1059#1053#1055
    end
    object Label4: TLabel
      Left = 17
      Top = 39
      Width = 125
      Height = 13
      Caption = #8470' '#1072#1082#1090#1072' '#1076#1083#1103' '#1086#1093#1088#1072#1085#1099' '#1052#1055#1057
    end
    object Label6: TLabel
      Left = 287
      Top = 39
      Width = 242
      Height = 13
      Caption = #8470' '#1091#1074#1077#1076#1086#1084#1083'. '#1076#1083#1103' '#1087#1088#1080#1077#1084#1086#1089#1076#1072#1090#1095#1080#1082#1086#1074' '#1089#1090'. '#1042#1077#1090#1083#1072#1089#1103#1085
    end
    object Label5: TLabel
      Left = 336
      Top = 14
      Width = 193
      Height = 13
      Caption = #8470' '#1088#1077#1077#1089#1090#1088#1072' '#1076#1083#1103' '#1051#1059#1050#1054#1049#1051'-'#1063#1077#1088#1085#1086#1084#1086#1088#1100#1077
    end
    object edLukoma_num: TEdit
      Left = 149
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edMPS_num: TEdit
      Left = 149
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edCher_num: TEdit
      Left = 533
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edVetl_num: TEdit
      Left = 533
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 3
    end
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
    ReadOnly = True
    UpdatingTable = 'temp_uved'
    Session = f_main.ora_Session
    Left = 184
    Top = 232
    object q_temp_uvedUVED_POS: TFloatField
      FieldName = 'UVED_POS'
    end
    object q_temp_uvedREESTR_ID: TFloatField
      FieldName = 'REESTR_ID'
    end
    object q_temp_uvedNOM_ZD: TStringField
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_temp_uvedSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Size = 50
    end
    object q_temp_uvedPOLUCH_NAME: TStringField
      FieldName = 'POLUCH_NAME'
      Size = 30
    end
    object q_temp_uvedNUM_CIST: TStringField
      FieldName = 'NUM_CIST'
      Size = 10
    end
    object q_temp_uvedVAGOWNER_NAME: TStringField
      FieldName = 'VAGOWNER_NAME'
      Size = 50
    end
    object q_temp_uvedVES: TFloatField
      DisplayLabel = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1090#1085
      FieldName = 'VES'
    end
    object q_temp_uvedDATE_OFORML: TDateTimeField
      FieldName = 'DATE_OFORML'
    end
    object q_temp_uvedPROD_NAME: TStringField
      FieldName = 'PROD_NAME'
      Size = 30
    end
    object q_temp_uvedSVED_NUM: TFloatField
      FieldName = 'SVED_NUM'
    end
    object q_temp_uvedPOD_NUM: TFloatField
      FieldName = 'POD_NUM'
    end
    object q_temp_uvedVETKA_OTP_NAME: TStringField
      FieldName = 'VETKA_OTP_NAME'
      Size = 30
    end
    object q_temp_uvedSVED_POS: TFloatField
      FieldName = 'SVED_POS'
    end
    object q_temp_uvedSVED_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_DATE'
    end
    object q_temp_uvedPASP_NUM: TStringField
      DisplayLabel = 'N '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP_NUM'
    end
    object q_temp_uvedVAG_STATUS: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VAG_STATUS'
      Size = 30
    end
    object q_temp_uvedNAKL_NUM: TFloatField
      DisplayLabel = 'N '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'NAKL_NUM'
    end
    object q_temp_uvedVES_ALL: TFloatField
      DisplayLabel = #1042#1077#1089' '#1075#1088#1091#1079#1072', '#1074#1072#1075#1086#1085#1072', '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
      FieldName = 'VES_ALL'
    end
    object q_temp_uvedVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072', '#1090#1085
      FieldName = 'VES_CIST'
    end
    object q_temp_uvedVES_UPAK: TFloatField
      DisplayLabel = #1042#1077#1089' '#1091#1087#1072#1082#1086#1074#1082#1080', '#1090#1085
      FieldName = 'VES_UPAK'
    end
  end
  object ds_temp_uved: TDataSource
    DataSet = q_temp_uved
    Left = 104
    Top = 232
  end
  object pkgFor_uved: TOraclePackage
    PackageName = 'FOR_UVED'
    Left = 264
    Top = 232
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
          end
          item
            Action = acUvedSave
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
    object acUvedAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 26
      OnExecute = acUvedAddExecute
    end
    object acUvedSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 20
      OnExecute = acUvedSaveExecute
    end
    object acUvedDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 28
      OnExecute = acUvedDelExecute
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
      03000000090000000200000049440100000000080000004D4553544F5F494401
      000000000C0000004C4F41445F545950455F4944010000000008000000555645
      445F4E554D010000000009000000555645445F4441544501000000000A000000
      4C554B4F4D415F4E554D0100000000070000004D50535F4E554D010000000008
      000000434845525F4E554D0100000000080000005645544C5F4E554D01000000
      00}
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
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState')
    Left = 312
    Top = 304
  end
  object PopupVagons: TTBPopupMenu
    Left = 384
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
    Left = 472
    Top = 240
  end
end
