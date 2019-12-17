inherited f_LoadFilList: Tf_LoadFilList
  Left = 257
  Top = 204
  Width = 761
  Caption = #1047#1072#1075#1088#1091#1078#1077#1085#1085#1099#1077' '#1086#1090#1095#1077#1090#1099
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 753
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acLF_Load
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 405
    Width = 753
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 26
    Width = 753
    Height = 379
    Align = alClient
    AllowedOperations = []
    DataSource = ds_FilPeriods
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = acLF_ViewExecute
    OnGetCellParams = DBGridEh1GetCellParams
    OnSortMarkingChanged = DBGridEh1SortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DATE_LOAD'
        Footers = <>
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'REP_TYPE_NAME'
        Footers = <>
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'STATUS'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1'
          '2')
        PickList.Strings = (
          #1042' '#1073#1091#1092#1077#1088#1077
          #1055#1088#1086#1074#1077#1088#1077#1085
          #1047#1072#1075#1088#1091#1078#1077#1085)
      end
      item
        EditButtons = <>
        FieldName = 'FILIAL_NAME'
        Footers = <>
        Width = 207
      end
      item
        EditButtons = <>
        FieldName = 'MON_REPORT'
        Footers = <>
        Width = 101
      end
      item
        EditButtons = <>
        FieldName = 'FILENAME'
        Footers = <>
        Width = 206
      end
      item
        EditButtons = <>
        FieldName = 'USER_LOAD'
        Footers = <>
        Width = 92
      end>
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 488
    Top = 160
    StyleName = 'XP Style'
    object acLF_Load: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      ImageIndex = 0
      OnExecute = acLF_LoadExecute
    end
    object acLF_View: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      OnExecute = acLF_ViewExecute
    end
  end
  object q_FilPeriods: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  LOAD_FIL_PERIODS.*,'
      '  TO_CHAR(DATE_REPORT,'#39'Month YYYY'#39') AS MON_REPORT,'
      
        '  ORG_STRUCTURE.NAME AS FILIAL_NAME, LOAD_FIL_REP_TYPES.NAME AS ' +
        'REP_TYPE_NAME'
      'FROM LOAD_FIL_PERIODS, ORG_STRUCTURE, LOAD_FIL_REP_TYPES'
      
        'WHERE LOAD_FIL_PERIODS.FILIAL_ID=ORG_STRUCTURE.ID AND LOAD_FIL_P' +
        'ERIODS.REP_TYPE_ID=LOAD_FIL_REP_TYPES.ID'
      'ORDER BY DATE_LOAD DESC'
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000B00000002000000494401000000000B000000444154455F5245504F
      525401000000000800000046494C454E414D4501000000000900000044415445
      5F4C4F4144010000000009000000555345525F4C4F414401000000000B000000
      46494C49414C5F4E414D4501000000000B0000005245505F545950455F494401
      000000000D0000005245505F545950455F4E414D450100000000090000004649
      4C49414C5F494401000000000A0000004D4F4E5F5245504F5254010000000006
      0000005354415455530100000000}
    Session = f_main.ora_Session
    Active = True
    Left = 216
    Top = 88
    object q_FilPeriodsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_FilPeriodsORG_STRU_ID: TFloatField
      FieldName = 'FILIAL_ID'
      Required = True
    end
    object q_FilPeriodsDATE_REPORT: TDateTimeField
      DisplayLabel = #1054#1090#1095#1077#1090#1085#1072#1103' '#1076#1072#1090#1072
      FieldName = 'DATE_REPORT'
      Required = True
    end
    object q_FilPeriodsMON_REPORT: TStringField
      DisplayLabel = #1054#1090#1095#1077#1090#1085#1099#1081' '#1084#1077#1089#1103#1094
      FieldName = 'MON_REPORT'
      Size = 14
    end
    object q_FilPeriodsFILENAME: TStringField
      DisplayLabel = #1060#1072#1081#1083
      FieldName = 'FILENAME'
      Size = 100
    end
    object q_FilPeriodsDATE_LOAD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1079#1072#1075#1088#1091#1079#1082#1080
      FieldName = 'DATE_LOAD'
    end
    object q_FilPeriodsUSER_LOAD: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088
      FieldName = 'USER_LOAD'
      Size = 240
    end
    object q_FilPeriodsFILIAL_NAME: TStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'FILIAL_NAME'
      Required = True
      Size = 100
    end
    object q_FilPeriodsREP_TYPE_ID: TFloatField
      FieldName = 'REP_TYPE_ID'
    end
    object q_FilPeriodsREP_TYPE_NAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1079#1072#1075#1088#1091#1078#1077#1085#1085#1086#1075#1086' '#1086#1090#1095#1077#1090#1072
      FieldName = 'REP_TYPE_NAME'
      Size = 50
    end
    object q_FilPeriodsSTATUS: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS'
    end
  end
  object ds_FilPeriods: TDataSource
    DataSet = q_FilPeriods
    Left = 288
    Top = 88
  end
end
