object F_EdNariad: TF_EdNariad
  Left = 241
  Top = 112
  Width = 549
  Height = 384
  Caption = #1053#1072#1088#1103#1076
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
    Height = 161
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 51
      Top = 13
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = #8470' '#1085#1072#1088#1103#1076#1072':'
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
    object Label6: TLabel
      Left = 16
      Top = 33
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = #8470' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080':'
    end
    object sb_FindFirst: TSpeedButton
      Left = 396
      Top = 88
      Width = 20
      Height = 20
      Hint = #1055#1086#1080#1089#1082' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
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
      OnClick = sb_FindFirstClick
    end
    object lb_DateDover: TDBText
      Left = 200
      Top = 33
      Width = 66
      Height = 13
      AutoSize = True
      DataField = 'DATE_DOVER'
    end
    object lb_NumDover: TDBText
      Left = 112
      Top = 33
      Width = 65
      Height = 13
      AutoSize = True
      DataField = 'NUM_DOVER'
    end
    object lb_DoljDover: TDBText
      Left = 112
      Top = 72
      Width = 61
      Height = 13
      AutoSize = True
      DataField = 'DOLJ_DOVER'
    end
    object lb_FioDover: TDBText
      Left = 272
      Top = 72
      Width = 57
      Height = 13
      AutoSize = True
      DataField = 'FIO_DOVER'
    end
    object sbPrint: TSpeedButton
      Left = 8
      Top = 120
      Width = 25
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1085#1072#1088#1103#1076#1072
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbPrintClick
    end
    object Label4: TLabel
      Left = 183
      Top = 33
      Width = 11
      Height = 13
      Caption = #1086#1090
    end
    object Label5: TLabel
      Left = 34
      Top = 52
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103':'
    end
    object Label7: TLabel
      Left = 64
      Top = 72
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1072' '#1080#1084#1103':'
    end
    object sb_FindNext: TSpeedButton
      Left = 420
      Top = 88
      Width = 20
      Height = 20
      Hint = #1053#1072#1081#1090#1080' '#1089#1083#1077#1076#1091#1102#1097#1091#1102' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222222222222222422222222222222244222224242424444442222222222222
        4422222222222222422222222222222222220002220002222222000222000222
        2222080020800222222207002070022222220000000002222222208000802222
        2222220020022222222222002002222222222222222222222222}
      ParentShowHint = False
      ShowHint = True
      OnClick = sb_FindNextClick
    end
    object lb_Platel: TDBText
      Left = 112
      Top = 53
      Width = 40
      Height = 13
      AutoSize = True
      DataField = 'SHORT_NAME'
    end
    object Label8: TLabel
      Left = 272
      Top = 34
      Width = 12
      Height = 13
      Caption = #1076#1086
    end
    object lb_DateEnd: TDBText
      Left = 296
      Top = 33
      Width = 56
      Height = 13
      AutoSize = True
      DataField = 'DATE_END'
    end
    object lb_seek: TLabel
      Left = 448
      Top = 90
      Width = 81
      Height = 13
      AutoSize = False
    end
    object ed_Dover: TDBLookupComboBox
      Left = 16
      Top = 88
      Width = 377
      Height = 21
      DataField = 'DOVER_ID'
      KeyField = 'ID'
      ListField = 'DATE_DOVER; NUM_DOVER; FIO_DOVER; SHORT_NAME'
      ListFieldIndex = 3
      ListSource = F_Nariad.ds_ListDover
      TabOrder = 3
    end
    object nav_NarLines: TOracleNavigator
      Left = 256
      Top = 120
      Width = 270
      Height = 25
      Hint = #1055#1077#1088#1077#1073#1086#1088' '#1079#1072#1076#1072#1085#1080#1081
      DataSource = ds_NarLines
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
      TabOrder = 4
    end
    object ed_NumNariad: TDBEdit
      Left = 112
      Top = 8
      Width = 121
      Height = 21
      DataField = 'NUM_NAR'
      TabOrder = 0
    end
    object ed_DateNariad: TDBDateEdit
      Left = 256
      Top = 8
      Width = 121
      Height = 21
      DataField = 'DATE_NAR'
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
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1088#1103#1076
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
      Hint = #1054#1090#1082#1072#1079#1072#1090#1100#1089#1103' '#1086#1090' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1085#1072#1088#1103#1076#1072
      Caption = #1054#1090#1082#1072#1079
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bt_cancelClick
      Kind = bkCancel
    end
  end
  object grid_NarLines: TDBGridEh
    Left = 0
    Top = 161
    Width = 541
    Height = 132
    Align = alClient
    DataSource = ds_NarLines
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
        FieldName = 'NOM_ZD'
        Footers = <>
        Title.Caption = #8470' '#1079#1072#1076#1072#1085#1080#1103
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'NAME_NPR'
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
  object q_NarLines: TOracleDataSet
    SQL.Strings = (
      'SELECT kls_nar_line.*, kls_nar_line.rowid FROM kls_nar_line'
      'WHERE kls_nar_line.NARIAD_ID=:NARIAD_ID'
      'ORDER BY kls_nar_line.nom_zd')
    Variables.Data = {
      03000000010000000A0000003A4E41524941445F494403000000040000000500
      000000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_NAR_LINE'
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000030000005645530100000000
      00060000004E4F4D5F5A44010000000000090000004E41524941445F49440100
      00000000}
    UniqueFields = 'ID'
    MasterFields = 'ID'
    DetailFields = 'NARIAD_ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'KLS_NAR_LINE'
    CachedUpdates = True
    Left = 312
    Top = 184
    object q_NarLinesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_NarLinesVES: TFloatField
      FieldName = 'VES'
      Required = True
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object q_NarLinesNOM_ZD: TStringField
      FieldName = 'NOM_ZD'
      Required = True
      Size = 12
    end
    object q_NarLinesNARIAD_ID: TFloatField
      FieldName = 'NARIAD_ID'
      Required = True
    end
    object q_NarLinesNAME_NPR: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_NPR'
      LookupDataSet = q_Prod
      LookupKeyFields = 'NOM_ZD'
      LookupResultField = 'NAME_NPR'
      KeyFields = 'NOM_ZD'
      Size = 40
      Lookup = True
    end
  end
  object ds_NarLines: TDataSource
    DataSet = q_NarLines
    Left = 240
    Top = 184
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
  object q_Prod: TOracleDataSet
    SQL.Strings = (
      'SELECT month.nom_zd, kls_prod.name_npr '
      'FROM month, kls_prod '
      'WHERE kls_prod.ID_GROUP_NPR<>'#39'00000'#39
      'AND MONTH.DATE_PLAN>=TO_DATE('#39'01.01.2001'#39','#39'dd.mm.yyyy'#39')'
      'AND month.prod_id_npr=kls_prod.id_npr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000080000004E414D455F4E5052010000000000060000004E4F
      4D5F5A44010000000000}
    Left = 248
    Top = 240
  end
  object q_ProdToNar: TOracleDataSet
    SQL.Strings = (
      'SELECT ORDER_NPR,NAME_NPR'
      'FROM KLS_PROD_NAR'
      'WHERE ID<>0'
      'ORDER BY ORDER_NPR'
      ''
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000090000004E41525F4F52444552010000000000090000004E
      41525F47524F5550010000000000}
    Left = 168
    Top = 240
  end
  object q_ProdInNar: TOracleDataSet
    SQL.Strings = (
      'SELECT KLS_PROD_NAR.ORDER_NPR, SUM(KLS_NAR_LINE.VES) AS VES'
      '  FROM KLS_NAR_LINE, KLS_PROD, MONTH, KLS_PROD_NAR'
      ' WHERE KLS_NAR_LINE.NOM_ZD = MONTH.NOM_ZD AND'
      
        '       MONTH.PROD_ID_NPR = KLS_PROD.ID_NPR AND KLS_PROD.PROD_NAR' +
        '_ID = KLS_PROD_NAR.ID AND'
      '       KLS_NAR_LINE.NARIAD_ID=:IdNar AND'
      '       KLS_PROD_NAR.ORDER_NAR=:NarOrder'
      ' GROUP BY KLS_PROD_NAR.ORDER_NPR')
    Variables.Data = {
      0300000002000000060000003A49444E41520300000004000000170100000000
      0000090000003A4E41524F5244455203000000040000001000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000090000004E41525F4F524445520100000000000300000056
      4553010000000000}
    Session = F_Nariad.ora_Session
    Left = 88
    Top = 176
  end
  object q_NarInMonth1: TOracleDataSet
    SQL.Strings = (
      'SELECT SUM(KLS_NAR_LINE.VES) AS NAR_VES'
      '  FROM KLS_NAR_LINE'
      
        ' WHERE KLS_NAR_LINE.NOM_ZD = :NomZd AND KLS_NAR_LINE.ID<>:IdNarL' +
        'ine'
      '')
    Variables.Data = {
      0300000002000000060000003A4E4F4D5A440500000004000000272027000000
      00000A0000003A49444E41524C494E4503000000040000000100000000000000}
    QBEDefinition.QBEFieldDefs = {0400000001000000070000004E41525F564553010000000000}
    Left = 160
    Top = 176
  end
  object q_ListMonth: TOracleDataSet
    SQL.Strings = (
      'SELECT MONTH.NOM_ZD, KLS_PROD_NAR.ABBR_NPR, MONTH.PRIM'
      'FROM KLS_NAR_LINE, MONTH, KLS_PROD, KLS_PROD_NAR'
      
        'WHERE KLS_NAR_LINE.NOM_ZD=MONTH.NOM_ZD AND KLS_PROD.PROD_NAR_ID ' +
        '= KLS_PROD_NAR.ID AND'
      '               MONTH.PROD_ID_NPR=KLS_PROD.ID_NPR AND'
      
        '               MONTH.DATE_PLAN>=TO_DATE('#39'01.01.2001'#39','#39'dd.mm.yyyy' +
        #39') AND'
      '               KLS_NAR_LINE.NARIAD_ID = :IdNar'
      'ORDER BY MONTH.NOM_ZD'
      ''
      '')
    Variables.Data = {
      0300000001000000060000003A49444E41520300000004000000170100000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000060000004E4F4D5F5A44010000000000090000004E41525F
      53484F5254010000000000}
    Session = F_Nariad.ora_Session
    Left = 64
    Top = 232
  end
  object WordApplication: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 360
    Top = 240
  end
  object DataSource1: TDataSource
    DataSet = q_ProdInNar
    Left = 120
    Top = 232
  end
end
