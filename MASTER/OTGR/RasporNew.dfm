object f_RasporNew: Tf_RasporNew
  Left = 331
  Top = 185
  Width = 739
  Height = 556
  Caption = #1053#1086#1074#1086#1077' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1077' '#1085#1072' '#1086#1090#1075#1088#1091#1079#1082#1091
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
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 78
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 8
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1077' '#8470':'
    end
    object Label2: TLabel
      Left = 206
      Top = 8
      Width = 11
      Height = 13
      Caption = #1086#1090
    end
    object btSetNum: TSpeedButton
      Left = 177
      Top = 3
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
      Left = 14
      Top = 32
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072' '#1089
    end
    object Label4: TLabel
      Left = 206
      Top = 32
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object Label5: TLabel
      Left = 13
      Top = 56
      Width = 98
      Height = 13
      Alignment = taRightJustify
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1085#1086#1084#1077#1088#1091':'
    end
    object edNum: TEdit
      Left = 101
      Top = 3
      Width = 74
      Height = 21
      TabOrder = 0
      OnChange = edNumChange
    end
    object edDat: TDateTimePicker
      Left = 229
      Top = 4
      Width = 90
      Height = 21
      Date = 37839.812709131950000000
      Time = 37839.812709131950000000
      TabOrder = 1
      OnCloseUp = CheckDate
      OnChange = CheckDate
      OnExit = CheckDate
    end
    object edEnd: TDateTimePicker
      Left = 229
      Top = 28
      Width = 90
      Height = 21
      Date = 37839.812709131950000000
      Time = 37839.812709131950000000
      TabOrder = 4
      OnCloseUp = CheckDate
      OnChange = CheckDate
      OnExit = CheckDate
    end
    object edBeg: TDateTimePicker
      Left = 101
      Top = 28
      Width = 90
      Height = 21
      Date = 37839.812709131950000000
      Time = 37839.812709131950000000
      TabOrder = 3
      OnCloseUp = CheckDate
      OnChange = CheckDate
      OnExit = CheckDate
    end
    object edTime: TDateTimePicker
      Left = 325
      Top = 4
      Width = 76
      Height = 21
      Date = 37839.812709131950000000
      Time = 37839.812709131950000000
      Kind = dtkTime
      TabOrder = 2
      OnCloseUp = CheckDate
      OnChange = CheckDate
      OnExit = CheckDate
    end
    object edFilter: TEdit
      Left = 120
      Top = 52
      Width = 121
      Height = 21
      TabOrder = 5
      OnChange = edFilterChange
    end
    object btRefresh: TButton
      Left = 408
      Top = 8
      Width = 89
      Height = 57
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 6
      OnClick = btRefreshClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 488
    Width = 731
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      731
      41)
    object btOk: TBitBtn
      Left = 125
      Top = 8
      Width = 90
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 0
      OnClick = btOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333377F3333333333000033334224333333333333
        337337F3333333330000333422224333333333333733337F3333333300003342
        222224333333333373333337F3333333000034222A22224333333337F337F333
        7F33333300003222A3A2224333333337F3737F337F33333300003A2A333A2224
        33333337F73337F337F33333000033A33333A222433333337333337F337F3333
        0000333333333A222433333333333337F337F33300003333333333A222433333
        333333337F337F33000033333333333A222433333333333337F337F300003333
        33333333A222433333333333337F337F00003333333333333A22433333333333
        3337F37F000033333333333333A223333333333333337F730000333333333333
        333A333333333333333337330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btCancel: TBitBtn
      Left = 485
      Top = 8
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
        0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
        DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
        0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
        00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
        32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
        00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object GridRows: TDBGridEh
    Left = 0
    Top = 78
    Width = 731
    Height = 410
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = ds_rows
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
    FrozenCols = 1
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
    ParentFont = False
    RowSizingAllowed = True
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnExit = GridRowsExit
    OnSortMarkingChanged = GridRowsSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NOM_ZD'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'KOL'
        Footers = <>
        Title.TitleButton = True
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'VES'
        Footers = <>
        Title.TitleButton = True
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'FACT_KOL'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 38
      end
      item
        EditButtons = <>
        FieldName = 'FACT_VES'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 48
      end
      item
        EditButtons = <>
        FieldName = 'OST_KOL'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'OST_VES'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'OST_REE'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'OST_MON_KOL'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'OST_MON_VES'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'STAN_NAME'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Width = 162
      end
      item
        EditButtons = <>
        FieldName = 'PROD_NAME'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'POLUCH_NAME'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'NORMOTGR'
        Footers = <>
        Width = 49
      end>
  end
  object pkgFOR_DOCUMENTS: TOraclePackage
    PackageName = 'FOR_DOCUMENTS'
    Left = 327
    Top = 166
  end
  object q_rows: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'a.*,a.rowid'
      'FROM TEMP_NAR_LINE a'
      'WHERE 1=1'
      'ORDER BY DECODE(NVL(KOL,0)+NVL(VES,0),0,0,1) DESC, a.NOM_ZD')
    SequenceField.Field = 'ID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000E000000030000005645530100000000060000004E4F4D5F5A440100
      000000030000004B4F4C010000000008000000464143545F4B4F4C0100000000
      08000000464143545F5645530100000000070000004D4F4E5F4B4F4C01000000
      00070000004D4F4E5F56455301000000000C0000004D4F4E5F464143545F4B4F
      4C01000000000C0000004D4F4E5F464143545F56455301000000000900000053
      54414E5F4E414D4501000000000900000050524F445F4E414D4501000000000B
      000000504F4C5543485F4E414D45010000000008000000544F4E4E5F52454501
      00000000080000004E4F524D4F5447520100000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'TEMP_NAR_LINE'
    Session = f_Raspor.ora_Session
    Filtered = True
    OnCalcFields = q_rowsCalcFields
    Left = 232
    Top = 144
    object q_rowsNOM_ZD: TStringField
      DisplayLabel = 'N '#1079#1072#1076#1072#1085#1080#1103
      FieldName = 'NOM_ZD'
      Required = True
      Size = 12
    end
    object q_rowsKOL: TIntegerField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079'- '#1082#1077', '#1094#1089
      FieldName = 'KOL'
      OnChange = q_rowsKOLChange
      OnSetText = q_rowsKOLSetText
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_rowsVES: TFloatField
      DisplayLabel = #1050' '#1086#1090#1075#1088#1091#1079'- '#1082#1077', '#1090#1085
      FieldName = 'VES'
      OnChange = q_rowsVESChange
      OnSetText = q_rowsVESSetText
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_rowsFACT_KOL: TIntegerField
      DisplayLabel = #1054#1090#1075#1088#1091'- '#1078#1077#1085#1086', '#1094#1089
      FieldName = 'FACT_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_rowsFACT_VES: TFloatField
      DisplayLabel = #1054#1090#1075#1088#1091'- '#1078#1077#1085#1086', '#1090#1085
      FieldName = 'FACT_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_rowsMON_KOL: TIntegerField
      FieldName = 'MON_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_rowsMON_VES: TFloatField
      FieldName = 'MON_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_rowsMON_FACT_KOL: TIntegerField
      FieldName = 'MON_FACT_KOL'
      Required = True
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object q_rowsMON_FACT_VES: TFloatField
      FieldName = 'MON_FACT_VES'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_rowsSTAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103
      FieldName = 'STAN_NAME'
      Size = 50
    end
    object q_rowsPROD_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'PROD_NAME'
    end
    object q_rowsPOLUCH_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'POLUCH_NAME'
      Size = 30
    end
    object q_rowsTONN_REE: TFloatField
      FieldName = 'TONN_REE'
      Required = True
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object q_rowsOST_KOL: TFloatField
      DisplayLabel = #1054#1089#1090#1072'- '#1083#1086#1089#1100', '#1094#1089
      FieldKind = fkCalculated
      FieldName = 'OST_KOL'
      DisplayFormat = '#0'
      EditFormat = '#0'
      Calculated = True
    end
    object q_rowsOST_VES: TFloatField
      DisplayLabel = #1054#1089#1090#1072'- '#1083#1086#1089#1100', '#1090#1085
      FieldKind = fkCalculated
      FieldName = 'OST_VES'
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
      Calculated = True
    end
    object q_rowsOST_MON_KOL: TFloatField
      DisplayLabel = #1054#1089#1090#1072'- '#1083#1086#1089#1100' '#1087#1086' '#1079#1072#1076#1072'- '#1085#1080#1102', '#1094#1089
      FieldKind = fkCalculated
      FieldName = 'OST_MON_KOL'
      DisplayFormat = '#0'
      EditFormat = '#0'
      Calculated = True
    end
    object q_rowsOST_MON_VES: TFloatField
      DisplayLabel = #1054#1089#1090#1072'- '#1083#1086#1089#1100' '#1087#1086' '#1079#1072#1076#1072'- '#1085#1080#1102', '#1090#1085
      FieldKind = fkCalculated
      FieldName = 'OST_MON_VES'
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
      Calculated = True
    end
    object q_rowsOST_REE: TFloatField
      DisplayLabel = #1054#1089#1090#1072'- '#1083#1086#1089#1100' '#1087#1086' '#1088#1077#1077#1089#1090#1088#1091', '#1090#1085
      FieldKind = fkCalculated
      FieldName = 'OST_REE'
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
      Calculated = True
    end
    object q_rowsNORMOTGR: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1086#1090#1075#1088#1091#1079'- '#1082#1080', '#1090#1085
      FieldName = 'NORMOTGR'
      Required = True
    end
  end
  object ds_rows: TDataSource
    DataSet = q_rows
    Left = 280
    Top = 152
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'GridRows.<P>.Columns.ColumnsIndex'
      'GridRows.<P>.Columns.<ForAllItems>.Width')
    Left = 136
    Top = 192
  end
end
