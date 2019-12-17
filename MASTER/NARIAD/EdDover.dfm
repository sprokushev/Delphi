object F_EdDover: TF_EdDover
  Left = 280
  Top = 146
  Width = 549
  Height = 384
  Caption = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 137
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 88
      Height = 13
      Caption = #8470' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080':'
    end
    object Label2: TLabel
      Left = 239
      Top = 12
      Width = 11
      Height = 13
      Caption = #1086#1090
    end
    object Label3: TLabel
      Left = 385
      Top = 11
      Width = 12
      Height = 13
      Caption = #1076#1086
    end
    object Label4: TLabel
      Left = 74
      Top = 36
      Width = 30
      Height = 13
      Caption = #1060#1048#1054':'
    end
    object Label5: TLabel
      Left = 43
      Top = 59
      Width = 61
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
    end
    object Label6: TLabel
      Left = 41
      Top = 83
      Width = 63
      Height = 13
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
    end
    object SpeedButton1: TSpeedButton
      Left = 508
      Top = 80
      Width = 20
      Height = 20
      Hint = #1055#1086#1080#1089#1082' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777700000777770000070F000777770F00070F000777770F
        0007000000070000000700F000000F00000700F000700F00000700F000700F00
        00077000000000000077770F00070F0007777700000700000777777000777000
        77777770F07770F0777777700077700077777777777777777777}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object ed_Pokup: TDBLookupComboBox
      Left = 112
      Top = 80
      Width = 393
      Height = 21
      DataField = 'PREDPR_ID'
      KeyField = 'ID'
      ListField = 'SHORT_NAME'
      TabOrder = 5
    end
    object nav_DovLines: TOracleNavigator
      Left = 256
      Top = 104
      Width = 270
      Height = 25
      DataSource = ds_DovLines
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Hints.Strings = (
        #1055#1077#1088#1074#1099#1081
        #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081
        #1057#1083#1077#1076#1091#1102#1097#1080#1081
        #1055#1086#1089#1083#1077#1076#1085#1080#1081
        #1044#1086#1073#1072#1074#1080#1090#1100
        #1059#1076#1072#1083#1080#1090#1100
        #1048#1079#1084#1077#1085#1080#1090#1100
        #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        #1054#1090#1082#1072#1079#1072#1090#1100#1089#1103' '#1086#1090' '#1080#1079#1084#1077#1085#1077#1085#1080#1081)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object ed_NumDover: TDBEdit
      Left = 112
      Top = 8
      Width = 121
      Height = 21
      DataField = 'NUM_DOVER'
      TabOrder = 0
    end
    object ed_DateDover: TDBDateEdit
      Left = 256
      Top = 8
      Width = 121
      Height = 21
      DataField = 'DATE_DOVER'
      NumGlyphs = 2
      TabOrder = 1
    end
    object ed_DateEnd: TDBDateEdit
      Left = 408
      Top = 8
      Width = 121
      Height = 21
      DataField = 'DATE_END'
      NumGlyphs = 2
      TabOrder = 2
    end
    object ed_FIO: TRxLookupEdit
      Left = 112
      Top = 32
      Width = 417
      Height = 21
      ListStyle = lsDelimited
      LookupDisplay = 'FIO_DOVER; DOLJ_DOVER'
      LookupField = 'FIO_DOVER'
      LookupSource = ds_FIO
      TabOrder = 3
      Text = 'ed_FIO'
      OnCloseUp = ed_FIOCloseUp
      OnChange = ed_FIOChange
    end
    object ed_Dolj: TRxLookupEdit
      Left = 112
      Top = 56
      Width = 417
      Height = 21
      LookupDisplay = 'DOLJ_DOVER'
      LookupField = 'DOLJ_DOVER'
      LookupSource = ds_Dolj
      TabOrder = 4
      Text = 'ed_Dolj'
      OnCloseUp = ed_DoljCloseUp
      OnChange = ed_DoljChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 312
    Width = 541
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object bt_ok: TBitBtn
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
      Caption = 'OK'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bt_okClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bt_cancel: TBitBtn
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Hint = #1054#1090#1082#1072#1079#1072#1090#1100#1089#1103' '#1086#1090' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
      Caption = #1054#1090#1082#1072#1079
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bt_cancelClick
      Kind = bkCancel
    end
  end
  object grid_DovLines: TDBGridEh
    Left = 0
    Top = 137
    Width = 541
    Height = 156
    Align = alClient
    DataSource = ds_DovLines
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Name_npr'
        Footers = <>
        Title.Caption = #1053'/'#1087#1088#1086#1076#1091#1082#1090
        Width = 275
      end
      item
        EditButtons = <>
        FieldName = 'VES'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1042#1077#1089
        Width = 62
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 293
    Width = 541
    Height = 19
    Panels = <>
  end
  object q_DovLines: TOracleDataSet
    SQL.Strings = (
      'SELECT kls_dov_line.*, kls_dov_line.rowid FROM kls_dov_line'
      'WHERE kls_dov_line.DOVER_ID=:DOVER_ID'
      'ORDER BY kls_dov_line.prod_id_npr')
    Variables.Data = {
      0300000001000000090000003A444F5645525F49440300000004000000050000
      0000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_DOV_LINE'
    QBEDefinition.QBEFieldDefs = {
      030000000400000002000000494401000000000300000056455301000000000B
      00000050524F445F49445F4E5052010000000008000000444F5645525F494401
      00000000}
    UniqueFields = 'ID'
    MasterFields = 'ID'
    DetailFields = 'DOVER_ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'KLS_DOV_LINE'
    CachedUpdates = True
    Left = 312
    Top = 184
    object q_DovLinesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_DovLinesVES: TFloatField
      FieldName = 'VES'
      Required = True
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object q_DovLinesPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object q_DovLinesDOVER_ID: TFloatField
      FieldName = 'DOVER_ID'
      Required = True
    end
    object q_DovLinesName_npr: TStringField
      DisplayLabel = 'NAME_NPR'
      FieldKind = fkLookup
      FieldName = 'Name_npr'
      LookupDataSet = q_Prod
      LookupKeyFields = 'ID_NPR'
      LookupResultField = 'NAME_NPR'
      KeyFields = 'PROD_ID_NPR'
      Size = 40
      Lookup = True
    end
  end
  object ds_DovLines: TDataSource
    DataSet = q_DovLines
    Left = 352
    Top = 240
  end
  object q_Prod: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id_npr, name_npr FROM kls_prod WHERE ID_GROUP_NPR<>'#39'00000' +
        #39)
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E50520100000000080000004E414D455F
      4E50520100000000}
    Left = 248
    Top = 240
  end
  object ds_FIO: TDataSource
    DataSet = q_FIO
    Left = 136
    Top = 200
  end
  object ds_Dolj: TDataSource
    DataSet = q_Dolj
    Left = 200
    Top = 200
  end
  object q_FIO: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_LIST_FIO_IN_DOVER')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000900000046494F5F444F56455201000000000A000000444F
      4C4A5F444F5645520100000000}
    Left = 136
    Top = 256
  end
  object q_Dolj: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_LIST_DOLJ_IN_DOVER')
    QBEDefinition.QBEFieldDefs = {03000000010000000A000000444F4C4A5F444F5645520100000000}
    Left = 200
    Top = 248
  end
  object q_EdTmp: TOracleDataSet
    SQL.Strings = (
      'SELECT id FROM KLS_DOVER '
      'WHERE NUM_DOVER=1112 '
      '      AND DATE_DOVER=TO_DATE('#39'18/07/2001'#39','#39'dd/mm/yyyy'#39') '
      '      AND  PREDPR_ID=1941')
    Left = 400
    Top = 168
  end
end
