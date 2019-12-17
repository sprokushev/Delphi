inherited f_forAZC_perevod: Tf_forAZC_perevod
  Left = 498
  Top = 159
  Width = 756
  Height = 445
  Caption = #1055#1077#1088#1077#1074#1086#1076' '#1086#1089#1090#1072#1090#1082#1086#1074
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 38
    Height = 13
    Caption = #1054#1073#1098#1077#1082#1090
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 66
    Height = 13
    Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 42
    Height = 13
    Caption = #1055#1088#1086#1076#1091#1082#1090
  end
  object RxLabel1: TRxLabel
    Left = 16
    Top = 168
    Width = 37
    Height = 13
    Caption = #1054#1073#1098#1077#1084
  end
  object RxLabel2: TRxLabel
    Left = 144
    Top = 168
    Width = 21
    Height = 13
    Caption = #1042#1077#1089
  end
  object RxLabel3: TRxLabel
    Left = 336
    Top = 48
    Width = 37
    Height = 13
    Caption = #1054#1073#1098#1077#1084
  end
  object RxLabel4: TRxLabel
    Left = 408
    Top = 48
    Width = 21
    Height = 13
    Caption = #1042#1077#1089
  end
  object RxLabel5: TRxLabel
    Left = 16
    Top = 128
    Width = 28
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label5: TLabel
    Left = 8
    Top = 232
    Width = 158
    Height = 13
    Caption = #1056#1072#1079#1073#1080#1074#1082#1072' '#1087#1088#1086#1076#1091#1082#1090#1086#1074' '#1085#1072' '#1075#1088#1091#1087#1087#1099
  end
  object Button1: TButton
    Left = 344
    Top = 200
    Width = 75
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 432
    Top = 200
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 336
    Top = 8
    Width = 369
    Height = 97
    TabOrder = 2
    object Label4: TLabel
      Left = 11
      Top = 8
      Width = 102
      Height = 13
      Caption = #1055#1077#1088#1077#1074#1086#1076' '#1085#1072' '#1087#1088#1086#1076#1091#1082#1090
    end
    object cacled_ost_ves2: TRxCalcEdit
      Left = 32
      Top = 52
      Width = 65
      Height = 21
      AutoSize = False
      NumGlyphs = 2
      TabOrder = 0
    end
    object Cacled_ost_vol2: TRxCalcEdit
      Left = 232
      Top = 60
      Width = 65
      Height = 21
      AutoSize = False
      NumGlyphs = 2
      TabOrder = 1
    end
    object lookup_prod_to: TRxLookupEdit
      Left = 8
      Top = 24
      Width = 305
      Height = 21
      LookupDisplay = 'ABBR_NPR'
      LookupField = 'ABBR_NPR'
      LookupSource = DS_prod_to
      TabOrder = 2
      OnCloseUp = lookup_prod_toCloseUp
      OnChange = lookup_prod_toCloseUp
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 8
    Width = 329
    Height = 217
    TabOrder = 3
    object Label6: TLabel
      Left = 19
      Top = 8
      Width = 102
      Height = 13
      Caption = #1055#1077#1088#1077#1074#1086#1076' c '#1087#1088#1086#1076#1091#1082#1090#1072
    end
    object lookup_obj: TRxLookupEdit
      Left = 16
      Top = 24
      Width = 305
      Height = 21
      LookupDisplay = 'NAME'
      LookupDisplayIndex = 2
      LookupField = 'NAME'
      LookupSource = DS_obj
      TabOrder = 0
      Text = 'lookup_obj'
      OnCloseUp = lookup_objChange
      OnChange = lookup_objChange
    end
    object lookup_Sobstv: TRxLookupEdit
      Left = 16
      Top = 64
      Width = 305
      Height = 21
      LookupDisplay = 'SHORT_NAME'
      LookupDisplayIndex = 1
      LookupField = 'SHORT_NAME'
      LookupSource = DS_predpr
      TabOrder = 1
      Text = 'lookup_Sobstv'
      OnCloseUp = lookup_SobstvChange
      OnChange = lookup_SobstvChange
    end
    object lookup_product: TRxLookupEdit
      Left = 16
      Top = 104
      Width = 305
      Height = 21
      LookupDisplay = 'ABBR_NPR'
      LookupDisplayIndex = 1
      LookupField = 'ABBR_NPR'
      LookupSource = DS_prod
      TabOrder = 2
      Text = 'lookup_prod'
      OnCloseUp = lookup_productChange
      OnChange = lookup_productChange
    end
    object datee_: TDateEdit
      Left = 16
      Top = 144
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object CaclEd_ostatok: TRxCalcEdit
      Left = 16
      Top = 184
      Width = 65
      Height = 21
      AutoSize = False
      NumGlyphs = 2
      TabOrder = 4
    end
    object CaclEd_ostatok_ves: TRxCalcEdit
      Left = 136
      Top = 184
      Width = 65
      Height = 21
      AutoSize = False
      NumGlyphs = 2
      TabOrder = 5
    end
  end
  object bt_add: TButton
    Left = 568
    Top = 376
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Enabled = False
    TabOrder = 4
  end
  object bt_delete: TButton
    Left = 648
    Top = 376
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Enabled = False
    TabOrder = 5
    OnClick = bt_deleteClick
  end
  object lookup_prod_for_gr: TRxLookupEdit
    Left = 336
    Top = 376
    Width = 185
    Height = 21
    LookupDisplay = 'NAME_NPR'
    LookupField = 'ABBR_NPR'
    LookupSource = DS_prod_for_gr
    Enabled = False
    TabOrder = 6
    Text = 'lookup_prod_for_gr'
  end
  object ch_state: TCheckBox
    Left = 336
    Top = 360
    Width = 169
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1075#1088#1091#1087#1087#1091' '#1087#1088#1086#1076#1091#1082#1090
    TabOrder = 7
    OnClick = ch_stateClick
  end
  object ehProd: TDBGridEh
    Left = 344
    Top = 112
    Width = 361
    Height = 241
    DataSource = DS_prod_group
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME_NPR'
        Footers = <>
      end>
  end
  object ODS_obj: TOracleDataSet
    SQL.Strings = (
      'SELECT A.*'
      'FROM ORG_STRUCTURE A, ORG_RELATIONS B'
      'WHERE'
      'A.ID = B.ORG_STRU_1_ID'
      'AND B.ORG_STRU_2_ID = 31'
      'ORDER By NAME')
    QBEDefinition.QBEFieldDefs = {
      030000000E000000020000004944010000000006000000414452455353010000
      0000040000004E4F54450100000000040000004E414D4501000000000B000000
      4F52475F4B494E445F49440100000000090000005052454450525F4944010000
      00000B0000004F52475F545950455F494401000000000600000046494C49414C
      010000000008000000574F524B53484F50010000000003000000494E4E010000
      00000C00000049535F4155544F5F4B4F4E5301000000000C00000049535F4155
      544F5F4C494E4B010000000009000000504C414E5F5245414C01000000001000
      0000434954595F5052454649585F46494C450100000000}
    Session = f_main.ora_Session
    Left = 40
    Top = 8
    object ODS_objID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_objADRESS: TStringField
      FieldName = 'ADRESS'
      Required = True
      Size = 100
    end
    object ODS_objNOTE: TStringField
      FieldName = 'NOTE'
      Size = 100
    end
    object ODS_objNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object ODS_objORG_KIND_ID: TFloatField
      FieldName = 'ORG_KIND_ID'
      Required = True
    end
    object ODS_objPREDPR_ID: TIntegerField
      FieldName = 'PREDPR_ID'
    end
    object ODS_objORG_TYPE_ID: TFloatField
      FieldName = 'ORG_TYPE_ID'
    end
    object ODS_objFILIAL: TFloatField
      FieldName = 'FILIAL'
    end
    object ODS_objWORKSHOP: TStringField
      FieldName = 'WORKSHOP'
      Size = 10
    end
    object ODS_objINN: TStringField
      FieldName = 'INN'
      Size = 15
    end
    object ODS_objIS_AUTO_KONS: TIntegerField
      FieldName = 'IS_AUTO_KONS'
    end
    object ODS_objIS_AUTO_LINK: TIntegerField
      FieldName = 'IS_AUTO_LINK'
    end
    object ODS_objPLAN_REAL: TIntegerField
      FieldName = 'PLAN_REAL'
    end
    object ODS_objCITY_PREFIX_FILE: TStringField
      FieldName = 'CITY_PREFIX_FILE'
    end
  end
  object DS_obj: TDataSource
    DataSet = ODS_obj
    Left = 96
    Top = 8
  end
  object ODS_predpr: TOracleDataSet
    SQL.Strings = (
      
        'select kls_predpr.rowid,kls_predpr.id,  kls_predpr.SHORT_NAME fr' +
        'om kls_predpr'
      'order by kls_predpr.short_name')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A00000053484F52545F4E414D
      450100000000}
    Session = f_main.ora_Session
    Left = 56
    Top = 64
    object ODS_predprID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ODS_predprSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object DS_predpr: TDataSource
    DataSet = ODS_predpr
    Left = 88
    Top = 64
  end
  object ODS_prod: TOracleDataSet
    SQL.Strings = (
      'SELECT A.* FROM KLS_PROD A'
      'WHERE A.AZC_PR_GRP_ID IS NOT NULL'
      'ORDER BY A.ABBR_NPR')
    QBEDefinition.QBEFieldDefs = {
      03000000190000000600000049445F4E505201000000000B00000049445F4B49
      4E445F4E505201000000000C00000049445F47524F55505F4E50520100000000
      080000004E414D455F4E505201000000000D0000004C4F4E475F4E414D455F4E
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
      505F49440100000000}
    Session = f_main.ora_Session
    Left = 136
    Top = 56
    object ODS_prodID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object ODS_prodID_KIND_NPR: TStringField
      FieldName = 'ID_KIND_NPR'
      Size = 5
    end
    object ODS_prodID_GROUP_NPR: TStringField
      FieldName = 'ID_GROUP_NPR'
      Required = True
      Size = 5
    end
    object ODS_prodNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object ODS_prodLONG_NAME_NPR: TStringField
      FieldName = 'LONG_NAME_NPR'
      Required = True
      Size = 250
    end
    object ODS_prodABBR_NPR: TStringField
      FieldName = 'ABBR_NPR'
    end
    object ODS_prodID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_prodFLG_ALLOWED: TIntegerField
      FieldName = 'FLG_ALLOWED'
      Required = True
    end
    object ODS_prodGOST_NPR: TStringField
      FieldName = 'GOST_NPR'
      Size = 40
    end
    object ODS_prodGD_KOD_NPR: TStringField
      FieldName = 'GD_KOD_NPR'
      Size = 6
    end
    object ODS_prodGD_NAME_NPR: TStringField
      FieldName = 'GD_NAME_NPR'
      Size = 100
    end
    object ODS_prodKOD_10: TStringField
      FieldName = 'KOD_10'
      Size = 10
    end
    object ODS_prodKOD_OKDP: TStringField
      FieldName = 'KOD_OKDP'
      Size = 12
    end
    object ODS_prodKOD_FAS_MSK: TIntegerField
      FieldName = 'KOD_FAS_MSK'
    end
    object ODS_prodED_IZ: TStringField
      FieldName = 'ED_IZ'
      Size = 5
    end
    object ODS_prodNORMOTGR: TFloatField
      FieldName = 'NORMOTGR'
    end
    object ODS_prodFASOVKA: TIntegerField
      FieldName = 'FASOVKA'
    end
    object ODS_prodVOL_FAS: TFloatField
      FieldName = 'VOL_FAS'
    end
    object ODS_prodDOR_NALOG: TIntegerField
      FieldName = 'DOR_NALOG'
    end
    object ODS_prodAKCIZ: TIntegerField
      FieldName = 'AKCIZ'
    end
    object ODS_prodPROD_NAR_ID: TFloatField
      FieldName = 'PROD_NAR_ID'
      Required = True
    end
    object ODS_prodPROD_PLAN_ID: TFloatField
      FieldName = 'PROD_PLAN_ID'
    end
    object ODS_prodPROD_GU12_ID: TStringField
      FieldName = 'PROD_GU12_ID'
      Size = 10
    end
    object ODS_prodMOS_GRP_ID: TStringField
      FieldName = 'MOS_GRP_ID'
      Size = 10
    end
    object ODS_prodAZC_PR_GRP_ID: TFloatField
      FieldName = 'AZC_PR_GRP_ID'
    end
  end
  object DS_prod: TDataSource
    DataSet = ODS_prod
    Left = 168
    Top = 56
  end
  object ODS_ostatok: TOracleDataSet
    SQL.Strings = (
      
        'select for_azc.GET_AZC_OST_VOL(:v_obj, :v_prod, :v_sobstv,  :v_d' +
        'ate) as vol,'
      
        'for_azc.GET_AZC_OST_VES(:v_obj, :v_prod, :v_sobstv,  :v_date) as' +
        ' ves  '
      'from dual')
    Variables.Data = {
      0300000004000000060000003A565F4F424A0300000000000000000000000700
      00003A565F50524F44050000000000000000000000090000003A565F534F4253
      5456030000000000000000000000070000003A565F444154450C000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000200000003000000564F4C0100000000030000005645530100000000}
    Session = f_main.ora_Session
    Left = 56
    Top = 112
    object ODS_ostatokVOL: TFloatField
      FieldName = 'VOL'
    end
    object ODS_ostatokVES: TFloatField
      FieldName = 'VES'
    end
  end
  object DS_ostatok: TDataSource
    DataSet = ODS_ostatok
    Left = 88
    Top = 104
  end
  object DS_prod_to: TDataSource
    DataSet = ODS_prod_to
    Left = 272
    Top = 144
  end
  object ODS_prod_to: TOracleDataSet
    SQL.Strings = (
      'SELECT A.* FROM KLS_PROD A'
      'WHERE A.AZC_PR_GRP_ID IS NOT NULL'
      'ORDER BY A.ABBR_NPR'
      '')
    QBEDefinition.QBEFieldDefs = {
      03000000190000000600000049445F4E505201000000000B00000049445F4B49
      4E445F4E505201000000000C00000049445F47524F55505F4E50520100000000
      080000004E414D455F4E505201000000000D0000004C4F4E475F4E414D455F4E
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
      505F49440100000000}
    Session = f_main.ora_Session
    Left = 208
    Top = 144
    object ODS_prod_toID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object ODS_prod_toID_KIND_NPR: TStringField
      FieldName = 'ID_KIND_NPR'
      Size = 5
    end
    object ODS_prod_toID_GROUP_NPR: TStringField
      FieldName = 'ID_GROUP_NPR'
      Required = True
      Size = 5
    end
    object ODS_prod_toNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object ODS_prod_toLONG_NAME_NPR: TStringField
      FieldName = 'LONG_NAME_NPR'
      Required = True
      Size = 250
    end
    object ODS_prod_toABBR_NPR: TStringField
      FieldName = 'ABBR_NPR'
    end
    object ODS_prod_toID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_prod_toFLG_ALLOWED: TIntegerField
      FieldName = 'FLG_ALLOWED'
      Required = True
    end
    object ODS_prod_toGOST_NPR: TStringField
      FieldName = 'GOST_NPR'
      Size = 40
    end
    object ODS_prod_toGD_KOD_NPR: TStringField
      FieldName = 'GD_KOD_NPR'
      Size = 6
    end
    object ODS_prod_toGD_NAME_NPR: TStringField
      FieldName = 'GD_NAME_NPR'
      Size = 100
    end
    object ODS_prod_toKOD_10: TStringField
      FieldName = 'KOD_10'
      Size = 10
    end
    object ODS_prod_toKOD_OKDP: TStringField
      FieldName = 'KOD_OKDP'
      Size = 12
    end
    object ODS_prod_toKOD_FAS_MSK: TIntegerField
      FieldName = 'KOD_FAS_MSK'
    end
    object ODS_prod_toED_IZ: TStringField
      FieldName = 'ED_IZ'
      Size = 5
    end
    object ODS_prod_toNORMOTGR: TFloatField
      FieldName = 'NORMOTGR'
    end
    object ODS_prod_toFASOVKA: TIntegerField
      FieldName = 'FASOVKA'
    end
    object ODS_prod_toVOL_FAS: TFloatField
      FieldName = 'VOL_FAS'
    end
    object ODS_prod_toDOR_NALOG: TIntegerField
      FieldName = 'DOR_NALOG'
    end
    object ODS_prod_toAKCIZ: TIntegerField
      FieldName = 'AKCIZ'
    end
    object ODS_prod_toPROD_NAR_ID: TFloatField
      FieldName = 'PROD_NAR_ID'
      Required = True
    end
    object ODS_prod_toPROD_PLAN_ID: TFloatField
      FieldName = 'PROD_PLAN_ID'
    end
    object ODS_prod_toPROD_GU12_ID: TStringField
      FieldName = 'PROD_GU12_ID'
      Size = 10
    end
    object ODS_prod_toMOS_GRP_ID: TStringField
      FieldName = 'MOS_GRP_ID'
      Size = 10
    end
    object ODS_prod_toAZC_PR_GRP_ID: TFloatField
      FieldName = 'AZC_PR_GRP_ID'
    end
  end
  object OQ_work: TOracleQuery
    Session = f_main.ora_Session
    Left = 144
    Top = 8
  end
  object ODS_ostatki_: TOracleDataSet
    SQL.Strings = (
      
        'select for_azc.GET_AZC_OST_VOL(:v_obj, :v_prod, :v_sobstv,  :v_d' +
        'ate) as vol,'
      
        'for_azc.GET_AZC_OST_VES(:v_obj, :v_prod, :v_sobstv,  :v_date) as' +
        ' ves  '
      'from dual'
      '')
    Variables.Data = {
      0300000004000000060000003A565F4F424A0300000000000000000000000700
      00003A565F444154450C0000000000000000000000090000003A565F534F4253
      5456030000000000000000000000070000003A565F50524F4405000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000200000003000000564F4C0100000000030000005645530100000000}
    Session = f_main.ora_Session
    Left = 200
    Top = 248
    object ODS_ostatki_VOL: TFloatField
      FieldName = 'VOL'
    end
    object ODS_ostatki_VES: TFloatField
      FieldName = 'VES'
    end
  end
  object DS_ostatki: TDataSource
    DataSet = ODS_ostatki_
    Left = 240
    Top = 248
  end
  object ODS_locate: TOracleDataSet
    SQL.Strings = (
      'select A.*'
      'from azc_operation A'
      'where A.date_oper>=trunc(sysdate,'#39'MONTH'#39')'
      'and A.date_oper<=sysdate'
      'and A.type_oper_id=3'
      'and A.prod_id_npr=:v_prod'
      'and A.org_stru_id=:v_obj'
      'and A.sobstv_id=:v_sobstv')
    Variables.Data = {
      0300000003000000090000003A565F534F425354560300000000000000000000
      00060000003A565F4F424A030000000000000000000000070000003A565F5052
      4F44050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0300000010000000020000004944010000000009000000444154455F4F504552
      01000000000700000044454E43495459010000000006000000564F4C554D4501
      00000000030000005645530100000000040000004E4F544501000000000C0000
      00545950455F4F5045525F494401000000000D000000504C4143455F53454E44
      5F494401000000000B00000050524F445F49445F4E5052010000000009000000
      534F425354565F494401000000000B0000004F52475F535452555F4944010000
      00000500000053554D4D41010000000005000000505249434501000000000800
      0000444953434F554E5401000000000D000000444953434F554E545F54595045
      010000000009000000444154455F494E544F0100000000}
    Session = f_main.ora_Session
    Left = 360
    Top = 184
    object ODS_locateID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_locateDATE_OPER: TDateTimeField
      FieldName = 'DATE_OPER'
      Required = True
    end
    object ODS_locateDENCITY: TFloatField
      FieldName = 'DENCITY'
      Required = True
    end
    object ODS_locateVOLUME: TFloatField
      FieldName = 'VOLUME'
      Required = True
    end
    object ODS_locateVES: TFloatField
      FieldName = 'VES'
      Required = True
    end
    object ODS_locateNOTE: TStringField
      FieldName = 'NOTE'
      Size = 100
    end
    object ODS_locateTYPE_OPER_ID: TFloatField
      FieldName = 'TYPE_OPER_ID'
      Required = True
    end
    object ODS_locatePLACE_SEND_ID: TFloatField
      FieldName = 'PLACE_SEND_ID'
    end
    object ODS_locatePROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object ODS_locateSOBSTV_ID: TIntegerField
      FieldName = 'SOBSTV_ID'
      Required = True
    end
    object ODS_locateORG_STRU_ID: TFloatField
      FieldName = 'ORG_STRU_ID'
      Required = True
    end
    object ODS_locateSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object ODS_locatePRICE: TFloatField
      FieldName = 'PRICE'
    end
    object ODS_locateDISCOUNT: TIntegerField
      FieldName = 'DISCOUNT'
    end
    object ODS_locateDISCOUNT_TYPE: TStringField
      FieldName = 'DISCOUNT_TYPE'
      Size = 17
    end
    object ODS_locateDATE_INTO: TDateTimeField
      FieldName = 'DATE_INTO'
    end
  end
  object DS_locate: TDataSource
    DataSet = ODS_locate
    Left = 432
    Top = 184
  end
  object ODS_prod_group: TOracleDataSet
    SQL.Strings = (
      'select A.*from v_azc_prod_group A')
    QBEDefinition.QBEFieldDefs = {
      0300000003000000080000004E414D455F4E505201000000000D000000415A43
      5F50525F4752505F494401000000000200000049440100000000}
    Session = f_main.ora_Session
    Left = 408
    Top = 264
    object ODS_prod_groupID: TFloatField
      FieldName = 'ID'
    end
    object ODS_prod_groupNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Size = 70
    end
    object ODS_prod_groupAZC_PR_GRP_ID: TFloatField
      FieldName = 'AZC_PR_GRP_ID'
    end
  end
  object DS_prod_group: TDataSource
    DataSet = mteProd
    Left = 496
    Top = 256
  end
  object ODS_prod_for_gr: TOracleDataSet
    SQL.Strings = (
      'Select * from kls_prod'
      'where AZC_PR_GRP_ID is null')
    QBEDefinition.QBEFieldDefs = {
      03000000190000000600000049445F4E505201000000000B00000049445F4B49
      4E445F4E505201000000000C00000049445F47524F55505F4E50520100000000
      080000004E414D455F4E505201000000000D0000004C4F4E475F4E414D455F4E
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
      505F49440100000000}
    Session = f_main.ora_Session
    Left = 616
    Top = 152
    object ODS_prod_for_grID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object ODS_prod_for_grID_KIND_NPR: TStringField
      FieldName = 'ID_KIND_NPR'
      Size = 5
    end
    object ODS_prod_for_grID_GROUP_NPR: TStringField
      FieldName = 'ID_GROUP_NPR'
      Required = True
      Size = 5
    end
    object ODS_prod_for_grNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object ODS_prod_for_grLONG_NAME_NPR: TStringField
      FieldName = 'LONG_NAME_NPR'
      Required = True
      Size = 100
    end
    object ODS_prod_for_grABBR_NPR: TStringField
      FieldName = 'ABBR_NPR'
    end
    object ODS_prod_for_grID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_prod_for_grFLG_ALLOWED: TIntegerField
      FieldName = 'FLG_ALLOWED'
      Required = True
    end
    object ODS_prod_for_grGOST_NPR: TStringField
      FieldName = 'GOST_NPR'
      Size = 40
    end
    object ODS_prod_for_grGD_KOD_NPR: TStringField
      FieldName = 'GD_KOD_NPR'
      Size = 6
    end
    object ODS_prod_for_grGD_NAME_NPR: TStringField
      FieldName = 'GD_NAME_NPR'
      Size = 100
    end
    object ODS_prod_for_grKOD_10: TStringField
      FieldName = 'KOD_10'
      Size = 10
    end
    object ODS_prod_for_grKOD_OKDP: TStringField
      FieldName = 'KOD_OKDP'
      Size = 12
    end
    object ODS_prod_for_grKOD_FAS_MSK: TIntegerField
      FieldName = 'KOD_FAS_MSK'
    end
    object ODS_prod_for_grED_IZ: TStringField
      FieldName = 'ED_IZ'
      Size = 5
    end
    object ODS_prod_for_grNORMOTGR: TFloatField
      FieldName = 'NORMOTGR'
    end
    object ODS_prod_for_grFASOVKA: TIntegerField
      FieldName = 'FASOVKA'
    end
    object ODS_prod_for_grVOL_FAS: TFloatField
      FieldName = 'VOL_FAS'
    end
    object ODS_prod_for_grDOR_NALOG: TIntegerField
      FieldName = 'DOR_NALOG'
    end
    object ODS_prod_for_grAKCIZ: TIntegerField
      FieldName = 'AKCIZ'
    end
    object ODS_prod_for_grPROD_NAR_ID: TFloatField
      FieldName = 'PROD_NAR_ID'
      Required = True
    end
    object ODS_prod_for_grPROD_PLAN_ID: TFloatField
      FieldName = 'PROD_PLAN_ID'
    end
    object ODS_prod_for_grPROD_GU12_ID: TStringField
      FieldName = 'PROD_GU12_ID'
      Size = 10
    end
    object ODS_prod_for_grMOS_GRP_ID: TStringField
      FieldName = 'MOS_GRP_ID'
      Size = 10
    end
    object ODS_prod_for_grAZC_PR_GRP_ID: TFloatField
      FieldName = 'AZC_PR_GRP_ID'
    end
  end
  object DS_prod_for_gr: TDataSource
    DataSet = ODS_prod_for_gr
    Left = 632
    Top = 208
  end
  object mteProd: TMemTableEh
    Params = <>
    DataDriver = dsdProd
    Left = 360
    Top = 128
    object mteProdID: TFloatField
      FieldName = 'ID'
    end
    object mteProdNAME_NPR: TStringField
      DisplayLabel = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
      FieldName = 'NAME_NPR'
      Size = 70
    end
    object mteProdAZC_PR_GRP_ID: TFloatField
      FieldName = 'AZC_PR_GRP_ID'
    end
  end
  object dsdProd: TDataSetDriverEh
    ProviderDataSet = ODS_prod_group
    Left = 448
    Top = 128
  end
end
