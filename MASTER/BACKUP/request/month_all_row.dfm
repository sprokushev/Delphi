object f_MonthAllRow: Tf_MonthAllRow
  Left = 190
  Top = 331
  Width = 899
  Height = 361
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1079#1072#1082#1072#1079#1072' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 891
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
      Images = f_main.img_Common
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acRequestConsumerDelRow
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 891
    Height = 41
    Align = alTop
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 10
      Top = 8
      Width = 150
      Height = 25
      DataSource = dsMonthAllRow
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
      Hints.Strings = (
        #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
        #1044#1086#1073#1072#1074#1080#1090#1100
        #1059#1076#1072#1083#1080#1090#1100
        #1048#1079#1084#1077#1085#1080#1090#1100
        #1057#1086#1093#1088#1072#1085#1080#1090#1100
        #1054#1090#1084#1077#1085#1080#1090#1100
        #1054#1073#1085#1086#1074#1080#1090#1100)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 167
      Top = 8
      Width = 113
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      WordWrap = True
      OnClick = BitBtn1Click
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10001000100010001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C100010001000100010001000100010001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1000100010001F7C1F7C1F7C1F7C100010001000
        1F7C1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C10001000
        1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
        10001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
        10001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
        10001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
        10001F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C10001F7C10001000
        1F7C1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1000100010001000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000100010001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000100010001000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
  end
  object grMonth: TDBGridEh
    Left = 0
    Top = 67
    Width = 891
    Height = 226
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = dsMonthAllRow
    EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
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
    FrozenCols = 4
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
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
    OnExit = grMonthExit
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SORTBY'
        Footers = <>
        Width = 38
      end
      item
        EditButtons = <>
        FieldName = 'CLIENT_NUMBER'
        Footers = <>
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'CLIENT_DATE'
        Footers = <>
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'INPUT_NUMBER'
        Footers = <>
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'INPUT_DATE'
        Footers = <>
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'BEGIN_DATE'
        Footers = <>
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'STATUS_ZAKAZ_NAME'
        Footers = <>
        ReadOnly = True
        Width = 214
      end
      item
        EditButtons = <>
        FieldName = 'REQUEST'
        Footers = <>
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'KOL'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'DOG_NUMBER'
        Footers = <>
        Width = 133
      end
      item
        EditButtons = <>
        FieldName = 'PROD_NAME'
        Footers = <>
        Width = 199
      end
      item
        EditButtons = <>
        FieldName = 'SPEED_VES'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SPEED_KOL'
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'PRICE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PLAT_NAME'
        Footers = <>
        ReadOnly = True
        Width = 225
      end
      item
        EditButtons = <>
        FieldName = 'STAN_OLD_NAME'
        Footers = <>
        Width = 218
      end
      item
        EditButtons = <>
        FieldName = 'STAN_NAME'
        Footers = <>
        Width = 213
      end
      item
        EditButtons = <>
        FieldName = 'VID_OTGR_NAME'
        Footers = <>
        Width = 133
      end
      item
        EditButtons = <>
        FieldName = 'GR4'
        Footers = <>
        Width = 227
      end
      item
        EditButtons = <>
        FieldName = 'PRICH'
        Footers = <>
        Width = 243
      end
      item
        EditButtons = <>
        FieldName = 'POLUCH_ID_NAME'
        Footers = <>
        Width = 230
      end
      item
        EditButtons = <>
        FieldName = 'POLUCH_NAME'
        Footers = <>
        Width = 257
      end
      item
        EditButtons = <>
        FieldName = 'VETKA_NAME'
        Footers = <>
        Width = 203
      end
      item
        EditButtons = <>
        FieldName = 'POTREB_ID_NAME'
        Footers = <>
        Width = 220
      end
      item
        EditButtons = <>
        FieldName = 'POTREB_NAME'
        Footers = <>
        Width = 239
      end
      item
        EditButtons = <>
        FieldName = 'USL_OPL_NAME'
        Footers = <>
        Width = 137
      end
      item
        EditButtons = <>
        FieldName = 'PAYFORM_NAME'
        Footers = <>
        Width = 137
      end
      item
        EditButtons = <>
        FieldName = 'ORGSTRU_NAME'
        Footers = <>
        Width = 156
      end
      item
        EditButtons = <>
        FieldName = 'PLANSTRU_NAME'
        Footers = <>
        Width = 413
      end
      item
        EditButtons = <>
        FieldName = 'NOM_ZD'
        Footers = <>
        ReadOnly = True
        Width = 93
      end
      item
        EditButtons = <>
        FieldName = 'GU12_A_NUM'
        Footers = <>
        ReadOnly = True
        Width = 146
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 293
    Width = 891
    Height = 41
    Align = alBottom
    TabOrder = 3
  end
  object oraSes: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'BUH'
    Left = 440
    Top = 192
  end
  object dsMonthAllRow: TDataSource
    DataSet = oraMonthAllRow
    Left = 456
    Top = 112
  end
  object acManagerMonthAllRow: TActionManager
    Images = f_main.img_Common
    Left = 288
    Top = 144
    StyleName = 'XP Style'
    object acRequestConsumerDelRow: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 5
      OnExecute = acRequestConsumerDelRowExecute
    end
  end
  object oraProd: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_PROD'
      'WHERE EXISTS '
      '(SELECT NULL '
      '  FROM KLS_PROD_GROUPS_DESC A, KLS_PROD_GROUPS B '
      ' WHERE A.PROD_GROUPS_ID=B.ID'
      '   AND B.PROD_TYPE_GRP_ID =4'
      '   AND A.PROD_ID_NPR=KLS_PROD.ID_NPR'
      '   )'
      'order by id_npr'
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      030000001C0000000600000049445F4E50520100000000080000004E414D455F
      4E505201000000000B00000049445F4B494E445F4E505201000000000C000000
      49445F47524F55505F4E505201000000000D0000004C4F4E475F4E414D455F4E
      5052010000000008000000414242525F4E505201000000000200000049440100
      0000000B000000464C475F414C4C4F574544010000000008000000474F53545F
      4E505201000000000A00000047445F4B4F445F4E505201000000000B00000047
      445F4E414D455F4E50520100000000060000004B4F445F313001000000000800
      00004B4F445F4F4B445001000000000B0000004B4F445F4641535F4D534B0100
      0000000500000045445F495A0100000000080000004E4F524D4F544752010000
      0000070000004641534F564B41010000000007000000564F4C5F464153010000
      000009000000444F525F4E414C4F47010000000005000000414B43495A010000
      00000B00000050524F445F4E41525F494401000000000C00000050524F445F50
      4C414E5F494401000000000C00000050524F445F475531325F49440100000000
      0A0000004D4F535F4752505F494401000000000D000000415A435F50525F4752
      505F494401000000000F00000049445F47524F55505F4E50525F474401000000
      000B0000004156475F464143545F504C01000000000700000053465F4E414D45
      0100000000}
    Session = oraSes
    Left = 205
    Top = 180
  end
  object oraPlat: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ALL_ROWS*/'
      #9'ID, short_name,inn'
      '  FROM kls_predpr WHERE is_block<>1'
      'order by short_name')
    QBEDefinition.QBEFieldDefs = {
      030000000300000002000000494401000000000A00000053484F52545F4E414D
      45010000000003000000494E4E0100000000}
    Session = oraSes
    Left = 94
    Top = 125
  end
  object oraStan: TOracleDataSet
    SQL.Strings = (
      'SELECT   kls_stan.ID, kls_stan.stan_name'
      '    FROM kls_stan kls_stan'
      'ORDER BY kls_stan.stan_name ASC')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000090000005354414E5F4E414D45
      0100000000}
    Session = oraSes
    Left = 92
    Top = 90
  end
  object oraDog: TOracleDataSet
    SQL.Strings = (
      'SELECT kls_dog.ID, kls_dog.dog_number,predpr_id,dog_date'
      '  FROM  kls_dog'
      'WHERE 1=1'
      'order by  kls_dog.dog_number'
      ''
      ' ')
    QBEDefinition.QBEFieldDefs = {
      030000000400000002000000494401000000000A000000444F475F4E554D4245
      520100000000090000005052454450525F4944010000000008000000444F475F
      444154450100000000}
    Session = oraSes
    Left = 93
    Top = 171
  end
  object oraPayform: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       payform_name'
      '  from kls_payform'
      'order by payform_name')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000C000000504159464F524D5F4E
      414D450100000000}
    Session = oraSes
    Left = 148
    Top = 95
  end
  object oraVidOtgr: TOracleDataSet
    SQL.Strings = (
      'select load_abbr,'
      '       load_name'
      '  from kls_vid_otgr'
      'order by load_name')
    QBEDefinition.QBEFieldDefs = {
      0300000002000000090000004C4F41445F414242520100000000090000004C4F
      41445F4E414D450100000000}
    Session = oraSes
    Left = 148
    Top = 136
  end
  object oraVetka: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       vetka_name'
      '  from kls_vetka'
      'order by vetka_name')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A0000005645544B415F4E414D
      450100000000}
    Session = oraSes
    Left = 204
    Top = 94
  end
  object oraPotreb: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       short_name'
      '  from kls_predpr WHERE is_block<>1'
      'order by short_name')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A00000053484F52545F4E414D
      450100000000}
    Session = oraSes
    Left = 204
    Top = 133
  end
  object oraPoluch: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       short_name'
      '  from kls_predpr WHERE is_block<>1'
      'order by short_name'
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A00000053484F52545F4E414D
      450100000000}
    Session = oraSes
    Left = 204
    Top = 234
  end
  object oraUslOpl: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       name'
      '  from kls_usl_opl'
      'order by kol_dn,name')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = oraSes
    Left = 87
    Top = 268
  end
  object oraOrgStru: TOracleDataSet
    SQL.Strings = (
      '-- '#1060#1080#1083#1080#1072#1083#1099
      'SELECT * FROM ORG_STRUCTURE WHERE PLAN_REAL<>0'
      'ORDER BY PLAN_REAL')
    QBEDefinition.QBEFieldDefs = {
      0300000025000000020000004944010000000006000000414452455353010000
      0000040000004E4F54450100000000040000004E414D4501000000000B000000
      4F52475F4B494E445F49440100000000090000005052454450525F4944010000
      00000B0000004F52475F545950455F494401000000000600000046494C49414C
      010000000008000000574F524B53484F50010000000003000000494E4E010000
      00000C00000049535F4155544F5F4B4F4E53010000000009000000504C414E5F
      5245414C010000000010000000434954595F5052454649585F46494C45010000
      00000C00000049535F4155544F5F4C494E4B01000000000B000000434954595F
      494E5F584C5301000000000900000046554C4C5F4E414D4501000000000E0000
      0050415255535F43524E5F4155544F01000000000D00000050415255535F4352
      4E5F4B4E5401000000001000000050415255535F4445504152544D454E540100
      0000001200000050415255535F504C414E5F415A435F44455001000000001300
      000050415255535F504C414E5F4155544F5F4445500100000000110000005041
      5255535F504C414E5F4D425F44455001000000001300000050415255535F504C
      414E5F5452414E5F44455001000000001400000050415255535F504C414E5F41
      5A435F4445505F3201000000001500000050415255535F504C414E5F4155544F
      5F4445505F3201000000001500000050415255535F504C414E5F5452414E5F44
      45505F3201000000000400000041424252010000000004000000524153540100
      000000090000005452414E535F4F52470100000000070000004E4F5F574F524B
      01000000000700000049535F4155544F01000000001400000049535F4155544F
      5F464F525F444953505F415A530100000000130000004C4F41445F4E414C4956
      5F46524F4D5F584C530100000000150000004C4F41445F4E414C49565F46524F
      4D5F50415255530100000000110000004C4F41445F4641535F46524F4D5F584C
      530100000000130000004C4F41445F4641535F46524F4D5F5041525553010000
      0000070000004B5353535F49440100000000}
    Session = oraSes
    Left = 150
    Top = 271
  end
  object oraPlanStru: TOracleDataSet
    SQL.Strings = (
      'Select id,name from v_plan_stru where has_child=0'
      'and end_date<=:DATE_PLAN')
    Variables.Data = {
      03000000010000000A0000003A444154455F504C414E0C000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = oraSes
    Left = 152
    Top = 182
  end
  object oraStatusZakaz: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,NAME  FROM kls_status_zakaz'
      'WHERE 1=1'
      'ORDER BY id')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = oraSes
    Left = 92
    Top = 220
  end
  object oraGU12_A: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,NOM_Z  FROM GU12_A'
      'WHERE 1=1'
      'ORDER BY id')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000050000004E4F4D5F5A01000000
      00}
    Session = oraSes
    Left = 148
    Top = 228
  end
  object oraMonthAllRow: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '     rowid,'
      '     id,'
      '     month_all_id,'
      '     sortby,'
      '     client_number,'
      '     client_date,'
      #9'   input_date,'
      '     input_number,'
      '     request,'
      '     kol,'
      '     speed_ves,'
      '     speed_kol,'
      '     kls_predpr_id,'
      '     kls_dog_id,'
      '     date_dog,'
      '     kls_prod_id,'
      '     stan_id,'
      '     prich,'
      '     payform_id,'
      '     load_abbr,'
      '     vetka_id,'
      '     gr4,'
      '     poluch_id, potreb_id,'
      '     usl_opl_id,'
      '     orgstru_id,'
      '     price,'
      '     poluch_name,potreb_name,'
      '     kls_planstruid,'
      '     nom_zd,'
      '     status_zakaz_id,'
      '     gu12_a_id,'
      '     stan_old_id,     begin_date'
      '  FROM MONTH_ALL_ROW'
      ' WHERE 1=1'
      'ORDER BY sortby')
    QBEDefinition.QBEFieldDefs = {
      030000002200000002000000494401000000000C0000004D4F4E54485F414C4C
      5F4944010000000006000000534F5254425901000000000D000000434C49454E
      545F4E554D42455201000000000B000000434C49454E545F4441544501000000
      000A000000494E5055545F4441544501000000000C000000494E5055545F4E55
      4D424552010000000007000000524551554553540100000000030000004B4F4C
      01000000000900000053504545445F5645530100000000090000005350454544
      5F4B4F4C01000000000D0000004B4C535F5052454450525F494401000000000A
      0000004B4C535F444F475F4944010000000008000000444154455F444F470100
      0000000B0000004B4C535F50524F445F49440100000000070000005354414E5F
      4944010000000005000000505249434801000000000A000000504159464F524D
      5F49440100000000090000004C4F41445F414242520100000000080000005645
      544B415F4944010000000003000000475234010000000009000000504F4C5543
      485F4944010000000009000000504F545245425F494401000000000A00000055
      534C5F4F504C5F494401000000000A0000004F5247535452555F494401000000
      0005000000505249434501000000000B000000504F4C5543485F4E414D450100
      0000000B000000504F545245425F4E414D4501000000000E0000004B4C535F50
      4C414E5354525549440100000000060000004E4F4D5F5A4401000000000F0000
      005354415455535F5A414B415A5F4944010000000009000000475531325F415F
      494401000000000B0000005354414E5F4F4C445F494401000000000A00000042
      4547494E5F444154450100000000}
    Session = oraSes
    Left = 376
    Top = 176
    object oraMonthAllRowID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object oraMonthAllRowMONTH_ALL_ID: TFloatField
      FieldName = 'MONTH_ALL_ID'
      Required = True
    end
    object oraMonthAllRowSORTBY: TFloatField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'SORTBY'
    end
    object oraMonthAllRowCLIENT_NUMBER: TStringField
      DisplayLabel = #1048#1089#1093'.'#8470' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'CLIENT_NUMBER'
      Size = 50
    end
    object oraMonthAllRowCLIENT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'CLIENT_DATE'
    end
    object oraMonthAllRowINPUT_NUMBER: TStringField
      DisplayLabel = #1042#1093'.'#8470' '#1051#1059#1050#1054#1049#1051'-'#1057#1053#1055
      FieldName = 'INPUT_NUMBER'
      Size = 50
    end
    object oraMonthAllRowINPUT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'INPUT_DATE'
      Required = True
    end
    object oraMonthAllRowREQUEST: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086', '#1058#1053
      FieldName = 'REQUEST'
      Required = True
    end
    object oraMonthAllRowKOL: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086', '#1042#1062
      FieldName = 'KOL'
      Required = True
    end
    object oraMonthAllRowSPEED_VES: TFloatField
      DisplayLabel = #1057#1088'.'#1087#1077#1088'-'#1082#1080', '#1058#1053
      FieldName = 'SPEED_VES'
      Required = True
    end
    object oraMonthAllRowSPEED_KOL: TFloatField
      DisplayLabel = #1057#1088'.'#1087#1077#1088'-'#1082#1080', '#1042#1062
      FieldName = 'SPEED_KOL'
      Required = True
    end
    object oraMonthAllRowKLS_PREDPR_ID: TFloatField
      FieldName = 'KLS_PREDPR_ID'
    end
    object oraMonthAllRowKLS_DOG_ID: TFloatField
      FieldName = 'KLS_DOG_ID'
    end
    object oraMonthAllRowDATE_DOG: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
      FieldName = 'DATE_DOG'
    end
    object oraMonthAllRowKLS_PROD_ID: TFloatField
      FieldName = 'KLS_PROD_ID'
    end
    object oraMonthAllRowSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
    object oraMonthAllRowPRICH: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRICH'
      Size = 100
    end
    object oraMonthAllRowPAYFORM_ID: TFloatField
      FieldName = 'PAYFORM_ID'
    end
    object oraMonthAllRowLOAD_ABBR: TStringField
      FieldName = 'LOAD_ABBR'
      Size = 3
    end
    object oraMonthAllRowVETKA_ID: TFloatField
      FieldName = 'VETKA_ID'
    end
    object oraMonthAllRowGR4: TStringField
      DisplayLabel = #1043#1088'4'
      FieldName = 'GR4'
      Size = 100
    end
    object oraMonthAllRowPOLUCH_ID: TFloatField
      FieldName = 'POLUCH_ID'
    end
    object oraMonthAllRowPOTREB_ID: TFloatField
      FieldName = 'POTREB_ID'
    end
    object oraMonthAllRowUSL_OPL_ID: TFloatField
      FieldName = 'USL_OPL_ID'
    end
    object oraMonthAllRowORGSTRU_ID: TFloatField
      FieldName = 'ORGSTRU_ID'
    end
    object oraMonthAllRowPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
    end
    object oraMonthAllRowPOLUCH_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' ('#1076#1086#1087')'
      FieldName = 'POLUCH_NAME'
      Size = 200
    end
    object oraMonthAllRowPOTREB_NAME: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100' ('#1076#1086#1087')'
      FieldName = 'POTREB_NAME'
      Size = 200
    end
    object oraMonthAllRowKLS_PLANSTRUID: TFloatField
      FieldName = 'KLS_PLANSTRUID'
    end
    object oraMonthAllRowNOM_ZD: TStringField
      DisplayLabel = #8470' ('#1060#1048#1053#1040#1053#1057#1067')'
      FieldName = 'NOM_ZD'
      Size = 150
    end
    object oraMonthAllRowSTATUS_ZAKAZ_ID: TFloatField
      FieldName = 'STATUS_ZAKAZ_ID'
      Required = True
    end
    object oraMonthAllRowGU12_A_ID: TFloatField
      FieldName = 'GU12_A_ID'
    end
    object oraMonthAllRowSTAN_OLD_ID: TFloatField
      FieldName = 'STAN_OLD_ID'
    end
    object oraMonthAllRowSTATUS_ZAKAZ_NAME: TStringField
      DisplayLabel = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1079#1072#1082#1072#1079#1072
      FieldKind = fkLookup
      FieldName = 'STATUS_ZAKAZ_NAME'
      LookupDataSet = oraStatusZakaz
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'STATUS_ZAKAZ_ID'
      Size = 50
      Lookup = True
    end
    object oraMonthAllRowPLAT_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldKind = fkLookup
      FieldName = 'PLAT_NAME'
      LookupDataSet = oraPlat
      LookupKeyFields = 'ID'
      LookupResultField = 'SHORT_NAME'
      KeyFields = 'KLS_PREDPR_ID'
      Size = 60
      Lookup = True
    end
    object oraMonthAllRowDOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldKind = fkLookup
      FieldName = 'DOG_NUMBER'
      LookupDataSet = oraDog
      LookupKeyFields = 'ID'
      LookupResultField = 'DOG_NUMBER'
      KeyFields = 'KLS_DOG_ID'
      Size = 30
      Lookup = True
    end
    object oraMonthAllRowPROD_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldKind = fkLookup
      FieldName = 'PROD_NAME'
      LookupDataSet = oraProd
      LookupKeyFields = 'ID_NPR'
      LookupResultField = 'NAME_NPR'
      KeyFields = 'KLS_PROD_ID'
      Size = 60
      Lookup = True
    end
    object oraMonthAllRowSTAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      FieldKind = fkLookup
      FieldName = 'STAN_NAME'
      LookupDataSet = oraStan
      LookupKeyFields = 'ID'
      LookupResultField = 'STAN_NAME'
      KeyFields = 'STAN_ID'
      Size = 60
      Lookup = True
    end
    object oraMonthAllRowSTAN_OLD_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103' ('#1041#1067#1051#1054')'
      FieldKind = fkLookup
      FieldName = 'STAN_OLD_NAME'
      LookupDataSet = oraStan
      LookupKeyFields = 'ID'
      LookupResultField = 'STAN_NAME'
      KeyFields = 'STAN_OLD_ID'
      Size = 60
      Lookup = True
    end
    object oraMonthAllRowPAYFORM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldKind = fkLookup
      FieldName = 'PAYFORM_NAME'
      LookupDataSet = oraPayform
      LookupKeyFields = 'ID'
      LookupResultField = 'PAYFORM_NAME'
      KeyFields = 'PAYFORM_ID'
      Size = 60
      Lookup = True
    end
    object oraMonthAllRowUSL_OPL_NAME: TStringField
      DisplayLabel = #1059#1089#1083#1086#1074#1080#1103' '#1086#1087#1083#1072#1090#1099
      FieldKind = fkLookup
      FieldName = 'USL_OPL_NAME'
      LookupDataSet = oraUslOpl
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'USL_OPL_ID'
      Size = 60
      Lookup = True
    end
    object oraMonthAllRowORGSTRU_NAME: TStringField
      DisplayLabel = #1055#1041#1045
      FieldKind = fkLookup
      FieldName = 'ORGSTRU_NAME'
      LookupDataSet = oraOrgStru
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ORGSTRU_ID'
      Size = 60
      Lookup = True
    end
    object oraMonthAllRowPLANSTRU_NAME: TStringField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072
      FieldKind = fkLookup
      FieldName = 'PLANSTRU_NAME'
      LookupDataSet = oraPlanStru
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'KLS_PLANSTRUID'
      Size = 60
      Lookup = True
    end
    object oraMonthAllRowPOLUCH_ID_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'POLUCH_ID_NAME'
      LookupDataSet = oraPoluch
      LookupKeyFields = 'ID'
      LookupResultField = 'SHORT_NAME'
      KeyFields = 'POLUCH_ID'
      Size = 60
      Lookup = True
    end
    object oraMonthAllRowPOTREB_ID_NAME: TStringField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'POTREB_ID_NAME'
      LookupDataSet = oraPotreb
      LookupKeyFields = 'ID'
      LookupResultField = 'SHORT_NAME'
      KeyFields = 'POTREB_ID'
      Size = 60
      Lookup = True
    end
    object oraMonthAllRowVETKA_NAME: TStringField
      DisplayLabel = #1042#1077#1090#1082#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldKind = fkLookup
      FieldName = 'VETKA_NAME'
      LookupDataSet = oraVetka
      LookupKeyFields = 'ID'
      LookupResultField = 'VETKA_NAME'
      KeyFields = 'VETKA_ID'
      Size = 60
      Lookup = True
    end
    object oraMonthAllRowVID_OTGR_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1090#1088#1072#1085#1089#1087'.'
      FieldKind = fkLookup
      FieldName = 'VID_OTGR_NAME'
      LookupDataSet = oraVidOtgr
      LookupKeyFields = 'LOAD_ABBR'
      LookupResultField = 'LOAD_NAME'
      KeyFields = 'LOAD_ABBR'
      Size = 60
      Lookup = True
    end
    object oraMonthAllRowGU12_A_NUM: TStringField
      DisplayLabel = #8470' ('#1043#1059'-12)'
      FieldKind = fkLookup
      FieldName = 'GU12_A_NUM'
      LookupDataSet = oraGU12_A
      LookupKeyFields = 'ID'
      LookupResultField = 'NOM_Z'
      KeyFields = 'GU12_A_ID'
      Size = 30
      Lookup = True
    end
    object oraMonthAllRowBEGIN_DATE: TDateTimeField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1089
      FieldName = 'BEGIN_DATE'
    end
  end
end
