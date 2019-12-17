object f_forAZC_oper_all: Tf_forAZC_oper_all
  Left = 702
  Top = 250
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1054#1087#1077#1088#1072#1094#1080#1080
  ClientHeight = 406
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 361
    Height = 369
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 136
      Top = 222
      Width = 70
      Height = 17
      Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
      TabOrder = 0
    end
    object StaticText2: TStaticText
      Left = 136
      Top = 174
      Width = 84
      Height = 17
      Caption = #1052#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080
      TabOrder = 1
    end
    object StaticText3: TStaticText
      Left = 169
      Top = 268
      Width = 23
      Height = 17
      Caption = #1042#1077#1089
      TabOrder = 2
    end
    object StaticText4: TStaticText
      Left = 56
      Top = 83
      Width = 46
      Height = 17
      Caption = #1055#1088#1086#1076#1091#1082#1090
      TabOrder = 3
    end
    object StaticText5: TStaticText
      Left = 56
      Top = 3
      Width = 42
      Height = 17
      Caption = #1054#1073#1098#1077#1082#1090
      TabOrder = 4
    end
    object StaticText6: TStaticText
      Left = 40
      Top = 138
      Width = 30
      Height = 17
      Caption = #1044#1072#1090#1072
      TabOrder = 5
    end
    object StaticText7: TStaticText
      Left = 38
      Top = 268
      Width = 39
      Height = 17
      Caption = #1054#1073#1098#1077#1084
      TabOrder = 6
    end
    object StaticText8: TStaticText
      Left = 280
      Top = 269
      Width = 58
      Height = 17
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
      TabOrder = 7
    end
    object StaticText9: TStaticText
      Left = 40
      Top = 310
      Width = 30
      Height = 17
      Caption = #1062#1077#1085#1072
      TabOrder = 8
    end
    object StaticText13: TStaticText
      Left = 285
      Top = 311
      Width = 38
      Height = 17
      Caption = #1057#1091#1084#1084#1072
      TabOrder = 9
    end
    object StaticText12: TStaticText
      Left = 268
      Top = 128
      Width = 46
      Height = 17
      Caption = #1054#1089#1090#1072#1090#1082#1080
      TabOrder = 10
    end
    object StaticText_sub: TStaticText
      Left = 256
      Top = 3
      Width = 45
      Height = 17
      Caption = #1060#1080#1083#1080#1072#1083
      TabOrder = 11
    end
    object lookup_cat: TRxLookupEdit
      Left = 128
      Top = 333
      Width = 113
      Height = 21
      LookupField = 'FOR_AZC'
      LookupSource = DS_category
      Enabled = False
      TabOrder = 12
      Visible = False
      OnCloseUp = lookup_catCloseUp
      OnChange = lookup_catCloseUp
    end
    object text_cat: TStaticText
      Left = 141
      Top = 311
      Width = 86
      Height = 17
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1094#1077#1085#1099
      TabOrder = 13
      Visible = False
    end
    object chbox_correct: TCheckBox
      Left = 136
      Top = 128
      Width = 97
      Height = 17
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072
      TabOrder = 14
    end
    object StaticText10: TStaticText
      Left = 40
      Top = 43
      Width = 94
      Height = 17
      Caption = #1043#1088#1091#1087#1087#1072' '#1087#1088#1086#1076#1091#1082#1090#1086#1074
      TabOrder = 15
    end
    object Panel2: TPanel
      Left = 184
      Top = 48
      Width = 169
      Height = 73
      BevelOuter = bvLowered
      TabOrder = 16
      object lookup_type_op: TRxLookupEdit
        Left = 5
        Top = 45
        Width = 159
        Height = 21
        LookupDisplayIndex = 1
        LookupField = 'NAME'
        LookupSource = DS_type_operation
        Enabled = False
        TabOrder = 0
        OnCloseUp = lookup_type_opCloseUp
        OnKeyDown = lookup_type_opKeyDown
      end
      object StaticText11: TStaticText
        Left = 8
        Top = 3
        Width = 54
        Height = 17
        Caption = #1054#1087#1077#1088#1072#1094#1080#1103
        TabOrder = 1
      end
    end
    object rb_vol: TRadioButton
      Left = 240
      Top = 142
      Width = 89
      Height = 17
      Caption = #1054#1073#1098#1077#1084'/'#1042#1077#1089
      Checked = True
      TabOrder = 17
      TabStop = True
      OnClick = rb_volClick
    end
    object rb_ves: TRadioButton
      Left = 320
      Top = 142
      Width = 25
      Height = 17
      TabOrder = 18
      OnClick = rb_volClick
    end
  end
  object Lookup_obj: TRxLookupEdit
    Left = 9
    Top = 19
    Width = 159
    Height = 21
    LookupDisplay = 'NAME_ORG'
    LookupField = 'NAME_ORG'
    LookupSource = DS_obj
    DirectInput = False
    TabOrder = 1
    OnCloseUp = Lookup_objCloseUp
    OnChange = Lookup_objCloseUp
    OnKeyDown = Lookup_objKeyDown
  end
  object lookup_prod: TRxLookupEdit
    Left = 9
    Top = 97
    Width = 161
    Height = 21
    LookupDisplay = 'NAME_NPR'
    LookupField = 'NAME_NPR'
    LookupSource = DS_prod
    PopupOnlyLocate = False
    DirectInput = False
    TabOrder = 2
    OnCloseUp = lookup_prodCloseUp
    OnKeyDown = lookup_prodKeyDown
  end
  object Edit1: TEdit
    Left = 240
    Top = 159
    Width = 97
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  object DateEd: TDateEdit
    Left = 9
    Top = 156
    Width = 97
    Height = 21
    CheckOnExit = True
    ClickKey = 112
    NumGlyphs = 2
    CalendarStyle = csDialog
    TabOrder = 4
    OnExit = DateEdExit
    OnKeyDown = DateEdKeyDown
  end
  object LUPED_PLACE: TRxLookupEdit
    Left = 9
    Top = 195
    Width = 345
    Height = 21
    LookupField = 'NAME'
    LookupSource = DS_place
    DirectInput = False
    Enabled = False
    TabOrder = 5
    OnKeyDown = LUPED_PLACEKeyDown
  end
  object LUPED_SOBSTV: TRxLookupEdit
    Left = 9
    Top = 240
    Width = 345
    Height = 21
    LookupField = 'SHORT_NAME'
    LookupSource = Ds_predpr
    DirectInput = False
    TabOrder = 6
    OnCloseUp = LUPED_SOBSTVCloseUp
    OnKeyDown = LUPED_SOBSTVKeyDown
  end
  object CalcEd_vol: TRxCalcEdit
    Left = 9
    Top = 285
    Width = 97
    Height = 21
    AutoSize = False
    DisplayFormat = '0.##'
    NumGlyphs = 2
    TabOrder = 7
    OnChange = CalcEd_volChange
    OnExit = CalcEd_volChange
  end
  object CalcEd_ves: TRxCalcEdit
    Left = 144
    Top = 285
    Width = 73
    Height = 21
    AutoSize = False
    DisplayFormat = '0.##'
    NumGlyphs = 2
    TabOrder = 8
    OnChange = CalcEd_volChange
    OnExit = CalcEd_vesChange
  end
  object CalcEd_de: TRxCalcEdit
    Left = 264
    Top = 285
    Width = 89
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = '#0.0000'
    NumGlyphs = 2
    TabOrder = 9
  end
  object calced_price1: TRxCalcEdit
    Left = 9
    Top = 333
    Width = 96
    Height = 21
    AutoSize = False
    DisplayFormat = '0.##'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 10
    OnChange = CalcEd_volChange
    OnExit = calced_price1Exit
  end
  object CalcEd_price: TRxCalcEdit
    Left = 264
    Top = 331
    Width = 89
    Height = 22
    AutoSize = False
    DisplayFormat = '0.##'
    Enabled = False
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 11
  end
  object ED_note: TEdit
    Left = 136
    Top = 376
    Width = 65
    Height = 21
    Enabled = False
    TabOrder = 12
    Visible = False
  end
  object Button1: TButton
    Left = 8
    Top = 376
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 13
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 280
    Top = 376
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 14
    OnClick = Button2Click
  end
  object Lookup_sub: TRxLookupEdit
    Left = 192
    Top = 19
    Width = 159
    Height = 21
    LookupDisplay = 'NAME_ORG'
    LookupField = 'NAME_ORG'
    LookupSource = DS_sub
    PopupOnlyLocate = False
    TabOrder = 15
    OnCloseUp = Lookup_subCloseUp
  end
  object lookup_prod_group: TRxLookupEdit
    Left = 9
    Top = 57
    Width = 161
    Height = 21
    LookupDisplay = 'NAME'
    LookupField = 'NAME'
    LookupSource = DS_prod_group
    PopupOnlyLocate = False
    DirectInput = False
    TabOrder = 16
    OnCloseUp = lookup_prod_groupCloseUp
    OnChange = lookup_prod_groupCloseUp
  end
  object chb_correct: TCheckBox
    Left = 104
    Top = 376
    Width = 161
    Height = 25
    Caption = #1057#1080#1090#1091#1072#1094#1080#1103': '#1054#1073#1098#1077#1084'/'#1074#1077#1089
    TabOrder = 17
    OnClick = chb_correctClick
  end
  object OQ_operation: TOracleQuery
    Left = 24
    Top = 24
  end
  object ODS_operation: TOracleDataSet
    SQL.Strings = (
      'SELECT AZC_OPERATION.ROWID, AZC_OPERATION.* FROM AZC_OPERATION, '
      '(SELECT MAX(A.ID) AS ID_ '
      'FROM AZC_OPERATION A) B'
      'WHERE '
      'AZC_OPERATION.ID = B.ID_')
    ReadOnly = True
    Left = 240
    Top = 16
  end
  object DS_operation: TDataSource
    DataSet = ODS_operation
    Left = 200
    Top = 288
  end
  object ODS_prod: TOracleDataSet
    SQL.Strings = (
      
        'SELECT kls_prod.ROWID, kls_prod.ID_npr, kls_prod.ID_GROUP_NPR, k' +
        'ls_prod.NAME_NPR, kls_prod.AZC_PR_GRP_ID,azc_operation.DATE_OPER'
      
        'FROM kls_prod ,azc_prod_group, azc_operation, (SELECT MAX(A.ID) ' +
        'AS ID_ '
      'FROM AZC_OPERATION A) B'
      
        'WHERE (kls_prod.ID_GROUP_NPR <>'#39'00000'#39' and  kls_prod.ID_GROUP_NP' +
        'R <>'#39'80000'#39' )  AND trim(kls_prod.ID_GROUP_NPR)<>'#39'  '#39
      ''
      'AND kls_prod.AZC_PR_GRP_ID= azc_prod_group.ID'
      'AND azc_operation.PROD_ID_NPR = kls_prod.ID_NPR'
      'AND AZC_OPERATION.ID = B.ID_ '
      'ORDER BY kls_prod.name_npr')
    QBEDefinition.QBEFieldDefs = {
      03000000050000000600000049445F4E505201000000000C00000049445F4752
      4F55505F4E50520100000000080000004E414D455F4E505201000000000D0000
      00415A435F50525F4752505F4944010000000009000000444154455F4F504552
      0100000000}
    ReadOnly = True
    Left = 112
    Top = 152
  end
  object DS_prod: TDataSource
    DataSet = ODS_prod
    Left = 160
    Top = 216
  end
  object ODS_obj: TOracleDataSet
    SQL.Strings = (
      'select * from v_azc_org where ID_PARENT_ORG = :var_org')
    Variables.Data = {
      0300000001000000080000003A5641525F4F5247030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000050000000600000049445F4F52470100000000080000004E414D455F
      4F524701000000000D00000049445F504152454E545F4F524701000000000B00
      000049445F4F52475F5459504501000000000700000049535F524F4F54010000
      0000}
    ReadOnly = True
    Left = 296
    Top = 24
    object ODS_objID_ORG: TFloatField
      FieldName = 'ID_ORG'
      Required = True
    end
    object ODS_objNAME_ORG: TStringField
      FieldName = 'NAME_ORG'
      Required = True
      Size = 100
    end
    object ODS_objID_PARENT_ORG: TFloatField
      FieldName = 'ID_PARENT_ORG'
    end
    object ODS_objID_ORG_TYPE: TFloatField
      FieldName = 'ID_ORG_TYPE'
      Required = True
    end
    object ODS_objIS_ROOT: TIntegerField
      FieldName = 'IS_ROOT'
    end
  end
  object DS_obj: TDataSource
    DataSet = ODS_obj
    Left = 120
    Top = 232
  end
  object ODS_place: TOracleDataSet
    SQL.Strings = (
      
        'select azc_place_send.rowid, azc_place_send.* from azc_place_sen' +
        'd'
      ' order by name')
    Left = 176
    Top = 160
  end
  object DS_place: TDataSource
    DataSet = ODS_place
    Left = 128
    Top = 304
  end
  object ODS_predp: TOracleDataSet
    SQL.Strings = (
      
        'SELECT kls_predpr.ROWID,kls_predpr.id,  kls_predpr.SHORT_NAME FR' +
        'OM kls_predpr'
      'WHERE kls_predpr.id=1')
    ReadOnly = True
    Left = 144
    Top = 160
  end
  object Ds_predpr: TDataSource
    DataSet = ODS_predp
    Left = 96
    Top = 304
  end
  object ODS_price: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  KLS_PROD.ID_NPR,'
      '  KLS_PROD.NAME_NPR,'
      '  KLS_CAT_CEN.ID AS CAT_CEN_ID,'
      '  KLS_CAT_CEN.CAT_CEN_NAME,'
      '  NPR_PRICES.ID,'
      '  NPR_PRICES.CENA,'
      '  NPR_PRICES.AKCIZ,'
      '  NPR_PRICES.NDS20,'
      '  NPR_PRICES.NGSM25,'
      '  NPR_PRICES.CENA_OTP_NPO,'
      '  NPR_PRICES.BEGIN_DATE,'
      '  NPR_PRICES.END_DATE,'
      '  NPR_PRICES.PROD_ID_NPR,'
      '  NPR_PRICES.OWNERSHIP_ID,'
      '  KLS_OWNERSHIP.OWNERSHIP_NAME,'
      '  SUPPLIER.PREDPR_NAME AS supplier,'
      
        '  SUPPLIER_ID,protokol_num,protokol_date,is_original,protokol_be' +
        'gin_date,cena_npo,cena_otp_npo,nds20_npo'
      
        'FROM NPR_PRICES, KLS_CAT_CEN, KLS_PROD, KLS_OWNERSHIP, KLS_PREDP' +
        'R SUPPLIER, PREDPR_ROLE'
      'WHERE ((NPR_PRICES.CAT_CEN_ID = KLS_CAT_CEN.ID) AND'
      '       (NPR_PRICES.PROD_ID_NPR = KLS_PROD.ID_NPR) AND'
      '       (NPR_PRICES.OWNERSHIP_ID=KLS_OWNERSHIP.ID) AND'
      #9'   (NPR_PRICES.SUPPLIER_ID=SUPPLIER.ID) AND'
      #9'   (PREDPR_ROLE.PREDPR_ID=SUPPLIER.ID) AND'
      #9'   (KLS_PROD.ID_NPR=:VAR_PROD) AND'
      #9'   (PREDPR_ROLE.KLS_ROLE_ID=1))'
      '   AND NPR_PRICES.IS_ORIGINAL = 1'
      '   AND SUPPLIER.ID=:VAR_PREDPR'
      '   AND KLS_CAT_CEN.ID=:VAR_CAT')
    Variables.Data = {
      0300000003000000090000003A5641525F50524F440500000000000000000000
      000B0000003A5641525F50524544505203000000000000000000000008000000
      3A5641525F434154030000000000000000000000}
    ReadOnly = True
    Left = 112
    Top = 56
  end
  object DS_price: TDataSource
    DataSet = ODS_price
    Left = 200
    Top = 216
  end
  object DS_type_operation: TDataSource
    DataSet = ODS_type_operation
    Left = 120
    Top = 224
  end
  object ODS_type_operation: TOracleDataSet
    SQL.Strings = (
      
        'select azc_type_operation.* , azc_type_operation.rowid from azc_' +
        'type_operation'
      'WHERE KIND_OPER=1'
      'order by name')
    Left = 280
    Top = 64
  end
  object DS_category: TDataSource
    DataSet = ODS_category
    Left = 208
    Top = 208
  end
  object ODS_category: TOracleDataSet
    SQL.Strings = (
      'select A.rowid, A.* from kls_cat_cen A '
      'where A.ID>800 and A.ID<850')
    QBEDefinition.QBEFieldDefs = {
      030000000800000002000000494401000000000C0000004341545F43454E5F4E
      414D4501000000000B00000047524F5550444F475F4944010000000009000000
      5052454450525F49440100000000100000004341545F43454E5F47524F55505F
      4944010000000006000000464F585F4944010000000006000000444F475F4944
      010000000007000000464F525F415A430100000000}
    ReadOnly = True
    Session = f_main.ora_Session
    Active = True
    Left = 120
    Top = 88
    object ODS_categoryID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ODS_categoryCAT_CEN_NAME: TStringField
      FieldName = 'CAT_CEN_NAME'
      Required = True
      Size = 70
    end
    object ODS_categoryGROUPDOG_ID: TIntegerField
      FieldName = 'GROUPDOG_ID'
    end
    object ODS_categoryPREDPR_ID: TIntegerField
      FieldName = 'PREDPR_ID'
    end
    object ODS_categoryCAT_CEN_GROUP_ID: TIntegerField
      FieldName = 'CAT_CEN_GROUP_ID'
      Required = True
    end
    object ODS_categoryFOX_ID: TIntegerField
      FieldName = 'FOX_ID'
    end
    object ODS_categoryDOG_ID: TIntegerField
      FieldName = 'DOG_ID'
    end
    object ODS_categoryFOR_AZC: TStringField
      FieldName = 'FOR_AZC'
      Size = 21
    end
  end
  object ODS_sub: TOracleDataSet
    SQL.Strings = (
      'Select * from V_azc_org'
      'Where ID_PARENT_ORG = 2'
      'order by name_org')
    QBEDefinition.QBEFieldDefs = {
      03000000050000000600000049445F4F52470100000000080000004E414D455F
      4F524701000000000D00000049445F504152454E545F4F524701000000000B00
      000049445F4F52475F5459504501000000000700000049535F524F4F54010000
      0000}
    ReadOnly = True
    Session = f_main.ora_Session
    Active = True
    Left = 168
    Top = 40
    object ODS_subID_ORG: TFloatField
      FieldName = 'ID_ORG'
      Required = True
    end
    object ODS_subNAME_ORG: TStringField
      FieldName = 'NAME_ORG'
      Required = True
      Size = 100
    end
    object ODS_subID_PARENT_ORG: TFloatField
      FieldName = 'ID_PARENT_ORG'
    end
    object ODS_subID_ORG_TYPE: TFloatField
      FieldName = 'ID_ORG_TYPE'
    end
  end
  object DS_sub: TDataSource
    DataSet = ODS_sub
    Left = 200
    Top = 224
  end
  object ODS_prod_group: TOracleDataSet
    SQL.Strings = (
      'Select * from azc_prod_group'
      'order by name')
    QBEDefinition.QBEFieldDefs = {
      03000000040000000200000049440100000000040000004E414D450100000000
      050000004E4F54455F0100000000060000004752505F49440100000000}
    Session = f_main.ora_Session
    Active = True
    Left = 88
    Top = 200
    object ODS_prod_groupID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_prod_groupNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 70
    end
  end
  object DS_prod_group: TDataSource
    DataSet = ODS_prod_group
    Left = 88
    Top = 232
  end
end
