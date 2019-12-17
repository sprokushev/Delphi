object F_AddPlanPost: TF_AddPlanPost
  Left = 253
  Top = 156
  BorderStyle = bsDialog
  Caption = 'F_AddPlanPost'
  ClientHeight = 236
  ClientWidth = 692
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pInfo: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 195
    Align = alClient
    TabOrder = 0
    object Label3: TLabel
      Left = 57
      Top = 25
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1077#1088#1080#1086#1076':'
    end
    object Label1: TLabel
      Left = 53
      Top = 47
      Width = 45
      Height = 13
      Caption = #1055#1088#1086#1076#1091#1082#1090':'
    end
    object Label2: TLabel
      Left = 18
      Top = 70
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072':'
    end
    object Label4: TLabel
      Left = 48
      Top = 94
      Width = 50
      Height = 13
      Caption = #1044#1086#1075#1086#1074#1086#1088': '
    end
    object lb_PlanPer: TLabel
      Left = 104
      Top = 26
      Width = 520
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 69
      Top = 7
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1083#1072#1085':'
    end
    object lb_Plan: TLabel
      Left = 104
      Top = 8
      Width = 520
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 2
      Top = 118
      Width = 96
      Height = 13
      Caption = #1047#1072#1074#1086#1076'-'#1087#1086#1089#1090#1072#1074#1097#1080#1082': '
    end
    object Label8: TLabel
      Left = 23
      Top = 166
      Width = 80
      Height = 13
      Caption = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 282
      Top = 166
      Width = 35
      Height = 13
      Caption = #1062#1077#1085#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 434
      Top = 165
      Width = 33
      Height = 13
      Caption = #1088#1091#1073'/'#1090#1085
    end
    object Label21: TLabel
      Left = 651
      Top = 166
      Width = 11
      Height = 13
      Caption = #1090#1085
    end
    object Label7: TLabel
      Left = 485
      Top = 166
      Width = 27
      Height = 13
      Caption = #1042#1077#1089':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 142
      Width = 94
      Height = 13
      Caption = #1057#1082#1083#1072#1076'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100':'
    end
    object lc_Prod: TRxDBLookupCombo
      Left = 112
      Top = 43
      Width = 576
      Height = 21
      DropDownCount = 15
      EscapeClear = False
      LookupField = 'ID_NPR'
      LookupDisplay = 'NAME_NPR'
      LookupSource = ds_Prod
      TabOrder = 0
      OnChange = lc_ProdChange
      OnKeyDown = lc_ProdKeyDown
    end
    object lc_PlanStru: TRxDBLookupCombo
      Left = 112
      Top = 67
      Width = 577
      Height = 21
      DropDownCount = 15
      EscapeClear = False
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = ds_PlanStru
      TabOrder = 1
      OnKeyDown = lc_PlanStruKeyDown
    end
    object e_dog: TEdit
      Left = 112
      Top = 91
      Width = 145
      Height = 21
      TabOrder = 2
      Text = 'e_dog'
      OnChange = e_dogChange
      OnKeyDown = e_dogKeyDown
    end
    object lc_Dogs: TRxDBLookupCombo
      Left = 264
      Top = 91
      Width = 425
      Height = 21
      DropDownCount = 15
      EscapeClear = False
      LookupField = 'ID'
      LookupDisplay = 'DOG_NUMBER'
      LookupSource = ds_Dogs
      TabOrder = 3
      OnChange = lc_DogsChange
      OnKeyDown = lc_DogsKeyDown
    end
    object lc_Refinery: TRxDBLookupCombo
      Left = 112
      Top = 116
      Width = 577
      Height = 21
      DropDownCount = 15
      EscapeClear = False
      LookupField = 'ID'
      LookupDisplay = 'PREDPR_NAME'
      LookupSource = ds_Refinery
      TabOrder = 4
      OnChange = lc_DogsChange
      OnKeyDown = lc_DogsKeyDown
    end
    object lc_PayForm: TRxDBLookupCombo
      Left = 112
      Top = 162
      Width = 163
      Height = 21
      DropDownCount = 8
      EscapeClear = False
      DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1080#1076' '#1086#1087#1083#1072#1090#1099'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'PAYFORM_NAME'
      LookupSource = ds_PayForm
      TabOrder = 6
    end
    object edPrice: TRxCalcEdit
      Left = 324
      Top = 163
      Width = 107
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00'
      FormatOnEditing = True
      NumGlyphs = 2
      TabOrder = 7
    end
    object edVes: TRxCalcEdit
      Left = 519
      Top = 162
      Width = 120
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.000'
      FormatOnEditing = True
      NumGlyphs = 2
      TabOrder = 8
      OnKeyDown = edVesKeyDown
    end
    object lc_orgstru: TRxDBLookupCombo
      Left = 112
      Top = 138
      Width = 578
      Height = 21
      DropDownCount = 15
      EscapeClear = False
      DisplayEmpty = '< '#1053#1045' '#1042#1067#1041#1056#1040#1053' >'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = ds_orgstru
      TabOrder = 5
      OnChange = lc_DogsChange
      OnKeyDown = lc_DogsKeyDown
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 195
    Width = 692
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btOk: TBitBtn
      Left = 224
      Top = 8
      Width = 97
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = btOkClick
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
    object btCancel: TBitBtn
      Left = 328
      Top = 8
      Width = 113
      Height = 25
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object q_Tmp: TOracleDataSet
    Session = f_main.ora_Session
    Left = 24
    Top = 8
  end
  object q_Prod: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  KLS_PROD.ID_NPR,'
      '  KLS_PROD.NAME_NPR'
      'FROM KLS_PROD'
      'WHERE KLS_PROD.FLG_ALLOWED=1'
      'ORDER BY KLS_PROD.ID_NPR'
      '')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E50520100000000080000004E414D455F
      4E50520100000000}
    Session = f_main.ora_Session
    Left = 128
    Top = 48
    object q_ProdID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object q_ProdNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
  end
  object ds_Prod: TDataSource
    DataSet = q_Prod
    Left = 160
    Top = 48
  end
  object q_PlanStru: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,NAME'
      'FROM V_PLAN_STRU'
      'WHERE BEGIN_DATE<=TO_DATE('#39'31.12.2002'#39','#39'dd.mm.yyyy'#39')'
      '  AND END_DATE>=TO_DATE('#39'01.01.2002'#39','#39'dd.mm.yyyy'#39')'
      '  AND HAS_CHILD=0'
      '  AND 1=1'
      'ORDER BY KOD_SGR, KOD_SPG, KOD_RZD, KOD_PRZ, KOD_GRP, KOD_PGR')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = f_main.ora_Session
    Left = 224
    Top = 56
    object q_PlanStruID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_PlanStruNAME: TStringField
      FieldName = 'NAME'
      Size = 156
    end
  end
  object ds_PlanStru: TDataSource
    DataSet = q_PlanStru
    Left = 256
    Top = 56
  end
  object q_Dogs: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,DOG_NUMBER'
      'FROM KLS_DOG'
      'WHERE KLS_DOG.DOG_END_DATE>=TO_DATE('#39'01.01.2002'#39','#39'dd.mm.yyyy'#39')'
      '  AND KLS_DOG.DOG_BEGIN_DATE<=TO_DATE('#39'31.01.2002'#39','#39'dd.mm.yyyy'#39')')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A000000444F475F4E554D4245
      520100000000}
    Session = f_main.ora_Session
    Left = 336
    Top = 48
    object q_DogsID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_DogsDOG_NUMBER: TStringField
      FieldName = 'DOG_NUMBER'
      Required = True
      Size = 30
    end
  end
  object ds_Dogs: TDataSource
    DataSet = q_Dogs
    Left = 368
    Top = 48
  end
  object ora_Package: TOraclePackage
    Session = f_main.ora_Session
    PackageName = 'FOR_PLANPOST'
    Left = 592
    Top = 9
  end
  object q_Refinery: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  kls_predpr.ID,'
      '  kls_predpr.predpr_name'
      'FROM kls_predpr,predpr_role'
      'WHERE '
      '  predpr_role.PREDPR_ID=kls_predpr.ID and'
      '  predpr_role.KLS_ROLE_ID=4')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000B0000005052454450525F4E41
      4D450100000000}
    Session = f_main.ora_Session
    Left = 440
    Top = 48
    object q_RefineryID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_RefineryPREDPR_NAME: TStringField
      FieldName = 'PREDPR_NAME'
      Required = True
      Size = 60
    end
  end
  object ds_Refinery: TDataSource
    DataSet = q_Refinery
    Left = 488
    Top = 48
  end
  object q_Row: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      'FROM plan_post'
      'WHERE ID=:ID'
      '')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000001500000007000000504C414E5F494401000000000B000000504C414E
      5F5045525F494401000000000B00000050524F445F49445F4E50520100000000
      080000004E414D455F4E505201000000000B000000504C414E535452555F4944
      010000000006000000444F475F494401000000000A000000444F475F4E554D42
      4552010000000007000000504C41545F4944010000000009000000504C414E5F
      43454E41010000000008000000504C414E5F564553010000000008000000504C
      414E5F53554D01000000000A0000004341545F43454E5F494401000000000900
      0000444154455F43454E4101000000000E000000504C414E535452555F4F5244
      45520100000000090000004C4556454C5F504F5301000000000B000000524546
      494E4552595F494401000000000D000000524546494E4552595F4E414D450100
      0000000D000000504C414E535452555F4E414D45010000000009000000504C41
      545F4E414D4501000000000A0000004F5247535452555F494401000000000C00
      00004F5247535452555F4E414D450100000000}
    ReadOnly = True
    Session = f_main.ora_Session
    Left = 332
    Top = 6
  end
  object q_PayForm: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_payform'
      'order by id')
    QBEDefinition.QBEFieldDefs = {
      030000000400000002000000494401000000000C000000504159464F524D5F4E
      414D4501000000000D000000504159464F524D5F47525F494401000000000900
      00004D4F53434F575F49440100000000}
    Session = f_main.ora_Session
    Left = 184
    object q_PayFormID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_PayFormPAYFORM_NAME: TStringField
      FieldName = 'PAYFORM_NAME'
      Required = True
    end
    object q_PayFormPAYFORM_GR_ID: TFloatField
      FieldName = 'PAYFORM_GR_ID'
      Required = True
    end
    object q_PayFormMOSCOW_ID: TFloatField
      FieldName = 'MOSCOW_ID'
    end
  end
  object ds_PayForm: TDataSource
    DataSet = q_PayForm
    Left = 232
  end
  object q_orgstru: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ID,NAME || '#39' - ('#39' || FILIAL_NAME || '#39')'#39'  as NAME,FILIAL_I' +
        'D '
      'FROM V_ORG_STRUCTURE'
      'WHERE FILIAL_ID<>ID '
      '  AND FILIAL_ID>0'
      'ORDER BY FILIAL_ID, NAME')
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000040000004E414D450100000000
      0900000046494C49414C5F49440100000000}
    Session = f_main.ora_Session
    Left = 448
    Top = 8
    object q_orgstruID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_orgstruNAME: TStringField
      FieldName = 'NAME'
      Size = 205
    end
    object q_orgstruFILIAL_ID: TFloatField
      FieldName = 'FILIAL_ID'
    end
  end
  object ds_orgstru: TDataSource
    DataSet = q_orgstru
    Left = 480
    Top = 8
  end
  object q_price: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      
        '  FOR_TEMP.GET_AS_NUM('#39'PRICE_ID'#39','#39'MASTER'#39','#39'PLAN_POST'#39') as PRICE_' +
        'ID,'
      
        '  FOR_TEMP.GET_AS_NUM('#39'CAT_CEN_ID'#39','#39'MASTER'#39','#39'PLAN_POST'#39') as CAT_' +
        'CEN_ID,'
      
        '  FOR_TEMP.GET_AS_DATE('#39'DATE_CENA'#39','#39'MASTER'#39','#39'PLAN_POST'#39') as DATE' +
        '_CENA,'
      
        '  FOR_TEMP.GET_AS_NUM('#39'PLAN_CENA'#39','#39'MASTER'#39','#39'PLAN_POST'#39') as PLAN_' +
        'CENA'
      'FROM dual')
    QBEDefinition.QBEFieldDefs = {
      03000000040000000800000050524943455F494401000000000A000000434154
      5F43454E5F4944010000000009000000444154455F43454E4101000000000900
      0000504C414E5F43454E410100000000}
    Session = f_main.ora_Session
    Left = 576
    Top = 88
    object q_pricePRICE_ID: TFloatField
      FieldName = 'PRICE_ID'
    end
    object q_priceCAT_CEN_ID: TFloatField
      FieldName = 'CAT_CEN_ID'
    end
    object q_priceDATE_CENA: TDateTimeField
      FieldName = 'DATE_CENA'
    end
    object q_pricePLAN_CENA: TFloatField
      FieldName = 'PLAN_CENA'
    end
  end
end
