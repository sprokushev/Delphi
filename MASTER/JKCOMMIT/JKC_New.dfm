object F_JKCommit: TF_JKCommit
  Left = 267
  Top = 198
  Width = 696
  Height = 480
  Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 688
    Height = 23
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acJKC_History
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acJKC_FillList
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 23
    Width = 688
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 83
      Height = 13
      Caption = #1052#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080':'
    end
    object lc_Mesto: TRxDBLookupCombo
      Left = 96
      Top = 4
      Width = 216
      Height = 21
      DropDownCount = 8
      LookupField = 'ID'
      LookupDisplay = 'MESTO_NAME'
      LookupSource = ds_Mesto
      TabOrder = 0
      OnChange = lc_MestoChange
    end
    object cb_OnlyNoCommit: TCheckBox
      Left = 328
      Top = 8
      Width = 169
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1085#1077#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1085#1099#1077
      TabOrder = 1
      OnClick = cb_OnlyNoCommitClick
    end
  end
  object grid_JKC: TDBGridEh
    Left = 0
    Top = 54
    Width = 688
    Height = 392
    Align = alClient
    DataSource = ds_JKCommit
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    UseMultiTitle = True
    Columns = <
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'FLG_COMMIT'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        Width = 39
      end
      item
        EditButtons = <>
        FieldName = 'SVED_NUM'
        Footer.Value = #1048#1058#1054#1043#1054
        Footer.ValueType = fvtStaticText
        Footers = <>
        ReadOnly = True
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'SVED_DATE'
        Footers = <>
        ReadOnly = True
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'DATE_OFORML'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'DATE_EDIT'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'SVED_CNT'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'SVED_VES'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'NOM_ZD'
        Footers = <>
        ReadOnly = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'PROD_NAME'
        Footers = <>
        ReadOnly = True
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'NOM_ZD_COMMIT'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        ReadOnly = True
        Width = 90
      end>
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 584
    Top = 128
    StyleName = 'XP Style'
    object acJKC_History: TAction
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1081
      ImageIndex = 7
    end
    object acJKC_FillList: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1074#1077#1076#1077#1085#1080#1081
      ImageIndex = 11
      OnExecute = acJKC_FillListExecute
    end
  end
  object q_Tmp: TOracleDataSet
    SQL.Strings = (
      #1063#1090#1086' '#1085#1080#1073#1091#1076#1100)
    Left = 448
    Top = 136
  end
  object q_JKCommit: TOracleDataSet
    SQL.Strings = (
      'SELECT A.rowid, A.* '
      'FROM JKCOMMIT_SPROKUSHEV A'
      'WHERE A.MESTO_ID=1'
      '  AND 1=1'
      'ORDER BY A.FLG_COMMIT ASC,A.SVED_NUM DESC')
    QBEDefinition.QBEFieldDefs = {
      030000000C000000080000004D4553544F5F494401000000000A000000464C47
      5F434F4D4D4954010000000008000000535645445F4E554D0100000000090000
      00535645445F4441544501000000000B000000444154455F4F464F524D4C0100
      00000009000000444154455F45444954010000000008000000535645445F434E
      54010000000008000000535645445F564553010000000007000000535645445F
      49440100000000060000004E4F4D5F5A4401000000000900000050524F445F4E
      414D4501000000000D0000004E4F4D5F5A445F434F4D4D49540100000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'JKCommit_TMP'
    Left = 400
    Top = 176
    object q_JKCommitMESTO_ID: TIntegerField
      FieldName = 'MESTO_ID'
      Required = True
    end
    object q_JKCommitFLG_COMMIT: TIntegerField
      DisplayLabel = #1055#1086#1076'- '#1090#1074#1077#1088'- '#1076#1080#1090#1100'?'
      FieldName = 'FLG_COMMIT'
      Required = True
    end
    object q_JKCommitSVED_NUM: TIntegerField
      DisplayLabel = #8470' '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_NUM'
      Required = True
    end
    object q_JKCommitSVED_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_DATE'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
    end
    object q_JKCommitDATE_OFORML: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
      FieldName = 'DATE_OFORML'
      DisplayFormat = 'dd.mm.yyyy hh:nn:ss'
    end
    object q_JKCommitDATE_EDIT: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'DATE_EDIT'
      DisplayFormat = 'dd.mm.yyyy hh:nn:ss'
    end
    object q_JKCommitSVED_CNT: TIntegerField
      DisplayLabel = #1050#1086#1083'- '#1074#1086
      FieldName = 'SVED_CNT'
      Required = True
      DisplayFormat = '##0'
    end
    object q_JKCommitSVED_VES: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'SVED_VES'
      Required = True
      DisplayFormat = '### ##0.000'
    end
    object q_JKCommitSVED_ID: TStringField
      FieldName = 'SVED_ID'
      Size = 9
    end
    object q_JKCommitNOM_ZD: TStringField
      DisplayLabel = #8470' '#1079#1072#1076#1072#1085#1080#1103
      FieldName = 'NOM_ZD'
      Required = True
      Size = 12
    end
    object q_JKCommitPROD_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'PROD_NAME'
      Required = True
      Size = 30
    end
    object q_JKCommitNOM_ZD_COMMIT: TIntegerField
      DisplayLabel = #1047#1072#1103#1074#1082#1072' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1072'?'
      FieldName = 'NOM_ZD_COMMIT'
      Required = True
    end
  end
  object q_Mesto: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_MESTO'
      'ORDER BY ID')
    QBEDefinition.QBEFieldDefs = {
      030000000300000002000000494401000000000A0000004D4553544F5F4E414D
      4501000000000E0000004D4553544F5F535645444E414D450100000000}
    Left = 520
    Top = 224
  end
  object ds_Mesto: TDataSource
    DataSet = q_Mesto
    Left = 560
    Top = 168
  end
  object ds_JKCommit: TDataSource
    DataSet = q_JKCommit
    Left = 472
    Top = 168
  end
end
