object f_EdOtpCen: Tf_EdOtpCen
  Left = 260
  Top = 183
  Width = 885
  Height = 454
  Caption = #1054#1090#1087#1091#1089#1082#1085#1072#1103' '#1094#1077#1085#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grid_Prod: TDBGridEh
    Left = 0
    Top = 0
    Width = 312
    Height = 420
    Align = alClient
    DataSource = ds_prod
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'LONG_NAME_NPR'
        Footers = <>
      end>
  end
  object Panel1: TPanel
    Left = 312
    Top = 0
    Width = 565
    Height = 420
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 7
      Top = 5
      Width = 554
      Height = 47
      Caption = ' '#1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1094#1077#1085#1099' '
      TabOrder = 0
      object e_CatCen: TEdit
        Left = 11
        Top = 16
        Width = 91
        Height = 21
        TabOrder = 0
        OnExit = e_CatCenExit
      end
      object lc_CatCen: TRxDBLookupCombo
        Left = 112
        Top = 15
        Width = 433
        Height = 22
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'ID'
        LookupDisplay = 'ID;CAT_CEN_NAME'
        LookupDisplayIndex = 1
        LookupSource = ds_CatCen
        TabOrder = 1
        TabStop = False
        OnChange = lc_CatCenChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 7
      Top = 151
      Width = 555
      Height = 114
      Caption = ' '#1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      TabOrder = 1
      object lbCena: TLabel
        Left = 24
        Top = 64
        Width = 89
        Height = 13
        Caption = #1094#1077#1085#1072' '#1073#1077#1079' '#1085#1072#1083#1086#1075#1086#1074
      end
      object Label2: TLabel
        Left = 388
        Top = 40
        Width = 30
        Height = 13
        Caption = #1072#1082#1094#1080#1079
      end
      object Label3: TLabel
        Left = 56
        Top = 88
        Width = 60
        Height = 13
        Caption = #1089#1091#1084#1084#1072' '#1053#1044#1057
      end
      object Label5: TLabel
        Left = 328
        Top = 87
        Width = 91
        Height = 13
        Caption = #1042#1089#1077#1075#1086' '#1089' '#1085#1072#1083#1086#1075#1072#1084#1080
      end
      object lbCenaBN: TLabel
        Left = 24
        Top = 40
        Width = 84
        Height = 13
        Caption = #1094#1077#1085#1072' '#1073#1077#1079' '#1072#1082#1094#1080#1079#1072
      end
      object Label11: TLabel
        Left = 16
        Top = 16
        Width = 131
        Height = 13
        Caption = #1040#1082#1094#1080#1079#1085#1086#1077' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086':'
      end
      object DBText1: TDBText
        Left = 160
        Top = 16
        Width = 377
        Height = 17
        DataField = 'SVID_NUMB'
        DataSource = ds_PredprAkciz
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object e_Cena: TCurrencyEdit
        Left = 122
        Top = 60
        Width = 121
        Height = 21
        AutoSize = False
        TabOrder = 0
        ZeroEmpty = False
        OnChange = e_CenaChange
      end
      object e_Akciz: TCurrencyEdit
        Left = 426
        Top = 36
        Width = 121
        Height = 21
        AutoSize = False
        Enabled = False
        TabOrder = 1
        ZeroEmpty = False
      end
      object e_nds20: TCurrencyEdit
        Left = 122
        Top = 84
        Width = 121
        Height = 21
        AutoSize = False
        TabOrder = 2
        ZeroEmpty = False
        OnChange = e_nds20Change
      end
      object e_Cena_otp: TCurrencyEdit
        Left = 426
        Top = 83
        Width = 121
        Height = 21
        AutoSize = False
        Enabled = False
        TabOrder = 3
        ZeroEmpty = False
      end
      object e_cena_bn: TCurrencyEdit
        Left = 122
        Top = 36
        Width = 121
        Height = 21
        AutoSize = False
        Enabled = False
        TabOrder = 4
        ZeroEmpty = False
      end
      object cb_NoAkciz: TCheckBox
        Left = 248
        Top = 62
        Width = 97
        Height = 17
        Caption = #1041#1045#1047' '#1040#1050#1062#1048#1047#1040
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = e_CenaChange
      end
    end
    object GroupBox3: TGroupBox
      Left = 329
      Top = 315
      Width = 233
      Height = 55
      Caption = ' '#1055#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1094#1077#1085#1099' '
      TabOrder = 2
      object Label6: TLabel
        Left = 7
        Top = 24
        Width = 6
        Height = 13
        Caption = #1089
      end
      object e_BeginDate: TDateTimePicker
        Left = 19
        Top = 20
        Width = 80
        Height = 21
        Date = 37046.458587488400000000
        Time = 37046.458587488400000000
        TabOrder = 0
        OnChange = e_BeginDateChange
      end
      object e_EndDate: TDateTimePicker
        Left = 148
        Top = 20
        Width = 78
        Height = 21
        Date = 37046.458587488400000000
        Time = 37046.458587488400000000
        Enabled = False
        TabOrder = 2
        OnChange = e_EndDateChange
      end
      object cb_To: TCheckBox
        Left = 107
        Top = 22
        Width = 35
        Height = 17
        Caption = #1087#1086
        TabOrder = 1
        OnClick = cb_ToClick
      end
    end
    object BitBtn1: TBitBtn
      Left = 333
      Top = 380
      Width = 110
      Height = 25
      TabOrder = 3
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 449
      Top = 380
      Width = 110
      Height = 25
      TabOrder = 4
      Kind = bkCancel
    end
    object GroupBox4: TGroupBox
      Left = 6
      Top = 54
      Width = 554
      Height = 46
      Caption = ' '#1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100' '#1087#1088#1086#1076#1091#1082#1090#1072' '
      TabOrder = 5
      object e_sobstv: TEdit
        Left = 11
        Top = 16
        Width = 91
        Height = 21
        TabOrder = 0
        OnExit = e_sobstvExit
      end
      object lc_Sobstv: TRxDBLookupCombo
        Left = 112
        Top = 15
        Width = 433
        Height = 22
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'ID'
        LookupDisplay = 'ID;OWNERSHIP_NAME'
        LookupDisplayIndex = 1
        LookupSource = ds_sobstv
        TabOrder = 1
        TabStop = False
        OnChange = lc_SobstvChange
      end
    end
    object GroupBox5: TGroupBox
      Left = 6
      Top = 102
      Width = 554
      Height = 46
      Caption = ' '#1055#1086#1089#1090#1072#1074#1097#1080#1082' '#1087#1088#1086#1076#1091#1082#1090#1072' '
      TabOrder = 6
      object e_post: TEdit
        Left = 11
        Top = 16
        Width = 91
        Height = 21
        TabOrder = 0
        OnExit = e_postExit
      end
      object lc_post: TRxDBLookupCombo
        Left = 112
        Top = 15
        Width = 433
        Height = 22
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'PREDPR_ID'
        LookupDisplay = 'SHORT_NAME'
        LookupDisplayIndex = 1
        LookupSource = ds_post
        TabOrder = 1
        TabStop = False
        OnChange = lc_postChange
      end
    end
    object GroupBox6: TGroupBox
      Left = 7
      Top = 312
      Width = 316
      Height = 105
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083
      TabOrder = 7
      object Label7: TLabel
        Left = 9
        Top = 24
        Width = 11
        Height = 13
        Caption = #8470
      end
      object Label8: TLabel
        Left = 170
        Top = 24
        Width = 11
        Height = 13
        Caption = #1086#1090
      end
      object Bevel1: TBevel
        Left = 8
        Top = 69
        Width = 303
        Height = 6
        Shape = bsTopLine
      end
      object Label9: TLabel
        Left = 146
        Top = 48
        Width = 36
        Height = 13
        Caption = #1074#1074#1077#1076#1077#1085
      end
      object e_protokolnum: TEdit
        Left = 26
        Top = 20
        Width = 135
        Height = 21
        TabOrder = 0
      end
      object e_protokoldate: TDateTimePicker
        Left = 188
        Top = 20
        Width = 80
        Height = 21
        Date = 37046.458587488400000000
        Time = 37046.458587488400000000
        TabOrder = 1
        OnChange = e_BeginDateChange
      end
      object cb_Original: TCheckBox
        Left = 24
        Top = 80
        Width = 97
        Height = 17
        Caption = #1069#1090#1086' '#1086#1088#1080#1075#1080#1085#1072#1083
        TabOrder = 3
      end
      object e_protokolbegindate: TDateTimePicker
        Left = 188
        Top = 44
        Width = 80
        Height = 21
        Date = 37046.458587488400000000
        Time = 37046.458587488400000000
        TabOrder = 2
        OnChange = e_BeginDateChange
      end
    end
    object GroupBox7: TGroupBox
      Left = 7
      Top = 267
      Width = 555
      Height = 41
      Caption = ' '#1062#1077#1085#1072' '#1087#1088#1086#1076#1072#1078#1080' '
      TabOrder = 8
      object Label10: TLabel
        Left = 8
        Top = 16
        Width = 62
        Height = 13
        Caption = #1073#1077#1079' '#1085#1072#1083#1086#1075#1086#1074
      end
      object Label12: TLabel
        Left = 200
        Top = 16
        Width = 24
        Height = 13
        Caption = #1053#1044#1057
      end
      object Label14: TLabel
        Left = 362
        Top = 15
        Width = 30
        Height = 13
        Caption = #1042#1089#1077#1075#1086
      end
      object e_Cena_NPO: TCurrencyEdit
        Left = 74
        Top = 12
        Width = 121
        Height = 21
        AutoSize = False
        TabOrder = 0
        ZeroEmpty = False
        OnChange = e_Cena_NPOChange
      end
      object e_nds20_npo: TCurrencyEdit
        Left = 234
        Top = 12
        Width = 121
        Height = 21
        AutoSize = False
        TabOrder = 1
        ZeroEmpty = False
        OnChange = e_nds20_npoChange
      end
      object e_Cena_otp_npo: TCurrencyEdit
        Left = 402
        Top = 11
        Width = 121
        Height = 21
        AutoSize = False
        TabOrder = 2
        ZeroEmpty = False
        OnExit = e_Cena_otp_npoExit
      end
    end
  end
  object q_Prod: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  KLS_PROD.ID_NPR,'
      
        '  KLS_PROD.name_npr AS LONG_NAME_NPR, KLS_PROD.AKCIZ, NVL(gd.PRO' +
        'D_GROUPS_ID,0) as PROD_GROUPS_ID, NVL(akciz.VALUE,0) as Akciz_Va' +
        'lue'
      
        'FROM KLS_PROD, (SELECT * FROM KLS_PROD_AKCIZ WHERE :FROM_DATE BE' +
        'TWEEN FROM_DATE AND TO_DATE) akciz, (SELECT * FROM KLS_PROD_GROU' +
        'PS_DESC WHERE PROD_TYPE_GRP_ID=6) gd'
      'WHERE ((KLS_PROD.ID_NPR <> KLS_PROD.ID_GROUP_NPR)'
      '  AND (kls_prod.flg_allowed in (1)'
      '  AND KLS_PROD.ID_GROUP_NPR NOT IN ('#39'10000'#39','#39'00000'#39'))'
      '  OR'
      '  KLS_PROD.ID_NPR = 10400'
      
        ') AND KLS_PROD.ID_NPR=gd.PROD_ID_NPR(+) AND gd.PROD_GROUPS_ID=ak' +
        'ciz.PROD_GROUPS_ID(+)'
      'ORDER BY KLS_PROD.ID_NPR ASC'
      ' ')
    Variables.Data = {
      03000000010000000A0000003A46524F4D5F444154450C000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      03000000050000000600000049445F4E505201000000000D0000004C4F4E475F
      4E414D455F4E5052010000000005000000414B43495A01000000000E00000050
      524F445F47524F5550535F494401000000000B000000414B43495A5F56414C55
      450100000000}
    Session = f_main.ora_Session
    AfterScroll = q_ProdAfterScroll
    Left = 144
    Top = 104
    object q_ProdID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object q_ProdLONG_NAME_NPR: TStringField
      DisplayLabel = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
      FieldName = 'LONG_NAME_NPR'
      Required = True
      Size = 40
    end
    object q_ProdAKCIZ: TIntegerField
      FieldName = 'AKCIZ'
    end
    object q_ProdPROD_GROUPS_ID: TFloatField
      FieldName = 'PROD_GROUPS_ID'
    end
    object q_ProdAKCIZ_VALUE: TFloatField
      FieldName = 'AKCIZ_VALUE'
    end
  end
  object ds_prod: TDataSource
    DataSet = q_Prod
    Left = 144
    Top = 132
  end
  object q_CatCen: TOracleDataSet
    SQL.Strings = (
      
        'SELECT KLS_CAT_CEN.ID, KLS_CAT_CEN.CAT_CEN_NAME , PREDPR_ID AS P' +
        'LAT_ID, NVL(KLS_PREDPR.EX_SVID,0) AS EX_SVID'
      'FROM KLS_CAT_CEN,KLS_PREDPR'
      'WHERE KLS_CAT_CEN.PREDPR_ID=KLS_PREDPR.ID(+) '
      'ORDER BY KLS_CAT_CEN.ID ASC')
    QBEDefinition.QBEFieldDefs = {
      030000000400000002000000494401000000000C0000004341545F43454E5F4E
      414D45010000000007000000504C41545F494401000000000700000045585F53
      5649440100000000}
    Left = 116
    Top = 104
    object q_CatCenID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_CatCenCAT_CEN_NAME: TStringField
      FieldName = 'CAT_CEN_NAME'
      Required = True
      Size = 70
    end
    object q_CatCenPLAT_ID: TIntegerField
      FieldName = 'PLAT_ID'
    end
    object q_CatCenEX_SVID: TFloatField
      FieldName = 'EX_SVID'
    end
  end
  object ds_CatCen: TDataSource
    DataSet = q_CatCen
    Left = 116
    Top = 132
  end
  object q_sobstv: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_ownership ORDER BY 1 ASC'
      ' ')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000E0000004F574E455253484950
      5F4E414D450100000000}
    Left = 172
    Top = 104
    object q_sobstvID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_sobstvOWNERSHIP_NAME: TStringField
      FieldName = 'OWNERSHIP_NAME'
      Required = True
      Size = 70
    end
  end
  object ds_sobstv: TDataSource
    DataSet = q_sobstv
    Left = 172
    Top = 132
  end
  object q_post: TOracleDataSet
    SQL.Strings = (
      'SELECT PREDPR_ROLE.PREDPR_ID, KLS_PREDPR.SHORT_NAME '
      'FROM KLS_PREDPR , PREDPR_ROLE '
      'WHERE ( (KLS_PREDPR.ID = PREDPR_ROLE.PREDPR_ID) ) '
      'ORDER BY PREDPR_ROLE.PREDPR_ID ASC')
    QBEDefinition.QBEFieldDefs = {
      0300000002000000090000005052454450525F494401000000000A0000005348
      4F52545F4E414D450100000000}
    Left = 200
    Top = 104
    object q_postPREDPR_ID: TIntegerField
      FieldName = 'PREDPR_ID'
      Required = True
    end
    object q_postSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object ds_post: TDataSource
    DataSet = q_post
    Left = 200
    Top = 132
  end
  object q_PredprAkciz: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.*,a.EX_SVID_PREF||'#39'-'#39'||a.EX_SVID_NUMB||'#39' '#1086#1090' '#39'||TO_CHAR(' +
        'a.DATE_GIVE,'#39'dd.mm.yyyy'#39') as SVID_NUMB FROM KLS_PREDPR_AKCIZ a'
      'WHERE PLAT_ID=:PLAT_ID'
      '  AND PROD_GROUPS_ID=:PROD_GROUPS_ID'
      '  AND DATE_BEG-1<:DATE_END'
      '  AND NVL(DATE_END,LAST_DAY(SYSDATE))+1>:DATE_BEG'
      '  AND EX_SVID=1'
      '')
    Variables.Data = {
      0300000004000000080000003A504C41545F4944030000000000000000000000
      0F0000003A50524F445F47524F5550535F494403000000000000000000000009
      0000003A444154455F4245470C0000000000000000000000090000003A444154
      455F454E440C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000D000000020000004944010000000007000000504C41545F49440100
      00000008000000444154455F424547010000000008000000444154455F454E44
      01000000000700000045585F5356494401000000000C00000045585F53564944
      5F5052454601000000000C00000045585F535649445F4E554D4201000000000B
      000000444154455F43414E43454C010000000009000000444154455F47495645
      01000000000600000049535F4F505401000000000700000049535F524F5A4E01
      000000000E00000050524F445F47524F5550535F494401000000000900000053
      5649445F4E554D420100000000}
    Session = f_main.ora_Session
    Left = 52
    Top = 104
    object q_PredprAkcizID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_PredprAkcizPLAT_ID: TFloatField
      FieldName = 'PLAT_ID'
      Required = True
    end
    object q_PredprAkcizDATE_BEG: TDateTimeField
      FieldName = 'DATE_BEG'
      Required = True
    end
    object q_PredprAkcizDATE_END: TDateTimeField
      FieldName = 'DATE_END'
      Required = True
    end
    object q_PredprAkcizEX_SVID: TFloatField
      FieldName = 'EX_SVID'
      Required = True
    end
    object q_PredprAkcizEX_SVID_PREF: TStringField
      FieldName = 'EX_SVID_PREF'
      Size = 15
    end
    object q_PredprAkcizEX_SVID_NUMB: TStringField
      FieldName = 'EX_SVID_NUMB'
      Size = 30
    end
    object q_PredprAkcizDATE_CANCEL: TDateTimeField
      FieldName = 'DATE_CANCEL'
    end
    object q_PredprAkcizDATE_GIVE: TDateTimeField
      FieldName = 'DATE_GIVE'
    end
    object q_PredprAkcizIS_OPT: TIntegerField
      FieldName = 'IS_OPT'
      Required = True
    end
    object q_PredprAkcizIS_ROZN: TIntegerField
      FieldName = 'IS_ROZN'
      Required = True
    end
    object q_PredprAkcizPROD_GROUPS_ID: TFloatField
      FieldName = 'PROD_GROUPS_ID'
      Required = True
    end
    object q_PredprAkcizSVID_NUMB: TStringField
      FieldName = 'SVID_NUMB'
      Size = 60
    end
  end
  object ds_PredprAkciz: TDataSource
    DataSet = q_PredprAkciz
    Left = 52
    Top = 132
  end
  object pckBILLS: TOraclePackage
    Session = f_main.ora_Session
    PackageName = 'FOR_BILLS'
    Left = 208
    Top = 224
  end
end
