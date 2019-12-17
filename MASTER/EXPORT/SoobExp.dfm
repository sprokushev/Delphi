object f_SoobExp: Tf_SoobExp
  Left = 180
  Top = 112
  BorderStyle = bsDialog
  Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077' '#1069#1050#1057#1055
  ClientHeight = 426
  ClientWidth = 243
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object l_date1: TLabel
    Left = 31
    Top = 9
    Width = 83
    Height = 13
    Caption = #1054#1090#1095#1077#1090#1085#1099#1077' '#1089#1091#1090#1082#1080':'
  end
  object btCalc: TBitBtn
    Left = 8
    Top = 40
    Width = 225
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090' '#1080' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
    TabOrder = 0
    WordWrap = True
    OnClick = btCalcClick
    NumGlyphs = 2
  end
  object ed_Date: TDateTimePicker
    Left = 127
    Top = 6
    Width = 95
    Height = 21
    Date = 36717.541841782390000000
    Time = 36717.541841782390000000
    MinDate = 36526.000000000000000000
    TabOrder = 1
  end
  object q_plan_fact: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  kind_npr,'
      '  IIF(sortby=1,0,1) as sortby_grp,'
      '  plat_kod,'
      '  plat_name,'
      '  num_dog,'
      '  prod_kod,'
      '  prod_kod10,'
      '  prod_fas,'
      '  prod_name,'
      '  sortby,'
      '  stan_kod,'
      '  stan_name,'
      '  exped_kod,'
      '  exped_name,'
      '  vid_trans,'
      '  vid_tr_nam,'
      '  SUM(fact_year) as fact_year,'
      '  SUM(plan_post) as plan_post,'
      '  SUM(plan_izm) as plan_izm,'
      '  SUM(obpr) as obpr,'
      '  SUM(plan_gd) as plan_gd,'
      '  SUM(fact_mon) as fact_mon,'
      '  SUM(fact_sut) as fact_sut,'
      '  '#39' '#39' as prich'
      'FROM '#39'c:\tmp\pe_edit1'#39
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16')
    Left = 56
    Top = 265
  end
  object q_fact_year: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    BeforeOpen = q_fact_yearBeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  kvit.nom_zd,'
      '  kvit.kod_plat as plat_kod,'
      '  predpr.naim as plat_name,'
      '  kvit.n_dog as num_dog,'
      '  prod.kod as prod_kod,'
      '  prod.kod_10 as prod_kod10,'
      '  prod.kind_npr,'
      '  prod.naim_pr as prod_name,'
      '  IIF(EMPTY(kvit.kst),SPACE(10),STR(kvit.kst)) as stan_kod,'
      '  IIF(EMPTY(kvit.kst),SPACE(50),stan.naim) as stan_name,'
      '  STR(vid_otgr.kod_m) as vid_trans,'
      '  vid_otgr.type_otgr as vid_tr_nam,'
      '  000000000000 as zayv_mon,'
      '  kvit.exped as exped_kod, kvit.tipv, kvit.np,'
      '  SUM(ves*1000) as fact_year,'
      '  000000000000 as fact_mon,'
      '  000000000000 as fact_sut'
      'FROM kvit,prod,predpr,stan,vid_otgr'
      'WHERE kvit.date_otgr<{04/01/2003}'
      '  AND kvit.date_otgr>={01/01/2003}'
      '  AND kvit.prizn_mps=3'
      '  AND kvit.kod_npr=prod.kod'
      '  AND kvit.kst=stan.kod'
      '  AND kvit.tip_otgr=vid_otgr.kod'
      '  AND kvit.kod_plat=predpr.kod'
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16'
      '')
    Left = 76
    Top = 101
  end
  object q_cmn: TADOQuery
    Connection = PF_Conn
    Parameters = <>
    Left = 160
    Top = 213
  end
  object q_Exped: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT '
      '  kod as exped_kod,'
      '  name0 as exped_name '
      'FROM '#39'U:\luk\GD_KVIT\DBF\exped'#39)
    Left = 24
    Top = 213
    object q_Expedexped_name: TStringField
      FieldName = 'exped_name'
      FixedChar = True
      Size = 30
    end
    object q_Expedexped_kod: TIntegerField
      FieldName = 'exped_kod'
    end
  end
  object PF_Conn: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=pf;Mode=ReadWrite;Extended Properties="DSN=pf;UID=;PWD=;So' +
      'urceDB=u:\luk\dbases;SourceType=DBF;Exclusive=No;BackgroundFetch' +
      '=Yes;Collate=RUSSIAN;Null=Yes;Deleted=Yes;"'
    CursorLocation = clUseServer
    LoginPrompt = False
    Mode = cmReadWrite
    Left = 12
    Top = 101
  end
  object q_MonthExped: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  MAX(exped) as exped_kod'
      'FROM month'
      'WHERE ALLT(nom_zd)='#39'?'#39
      ''
      '')
    Left = 80
    Top = 209
    object q_MonthExpedexped_kod: TIntegerField
      FieldName = 'exped_kod'
    end
  end
  object q_fact_prev_mon: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    BeforeOpen = q_fact_prev_monBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  kvit.nom_zd,'
      '  kvit.kod_plat as plat_kod,'
      '  predpr.naim as plat_name,'
      '  kvit.n_dog as num_dog,'
      '  prod.kod as prod_kod,'
      '  prod.kod_10 as prod_kod10,'
      '  prod.kind_npr,'
      '  prod.naim_pr as prod_name,'
      '  IIF(EMPTY(kvit.kst),SPACE(10),STR(kvit.kst)) as stan_kod,'
      '  IIF(EMPTY(kvit.kst),SPACE(50),stan.naim) as stan_name,'
      '  STR(vid_otgr.kod_m) as vid_trans,'
      '  vid_otgr.type_otgr as vid_tr_nam,'
      '  000000000000 as zayv_mon,'
      '  kvit.exped as exped_kod, kvit.tipv, kvit.np,'
      '  SUM(ves*1000) as fact_year,'
      '  000000000000 as fact_mon,'
      '  000000000000 as fact_sut'
      'FROM kvit,prod,predpr,stan,vid_otgr'
      'WHERE kvit.date_otgr<{04/01/2003}'
      '  AND kvit.date_otgr>={03/01/2003}'
      '  AND kvit.date_otgr>={03/01/2003}'
      '  AND kvit.prizn_mps=3'
      '  AND kvit.kod_npr=prod.kod'
      '  AND kvit.kst=stan.kod'
      '  AND kvit.tip_otgr=vid_otgr.kod'
      '  AND kvit.kod_plat=predpr.kod'
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16')
    Left = 152
    Top = 101
  end
  object q_fact_cur_mon: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    BeforeOpen = q_fact_cur_monBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  kvit.nom_zd,'
      '  kvit.kod_plat as plat_kod,'
      '  predpr.naim as plat_name,'
      '  kvit.n_dog as num_dog,'
      '  prod.kod as prod_kod,'
      '  prod.kod_10 as prod_kod10,'
      '  prod.kind_npr,'
      '  prod.naim_pr as prod_name,'
      '  IIF(EMPTY(kvit.kst),SPACE(10),STR(kvit.kst)) as stan_kod,'
      '  IIF(EMPTY(kvit.kst),SPACE(50),stan.naim) as stan_name,'
      '  STR(vid_otgr.kod_m) as vid_trans,'
      '  vid_otgr.type_otgr as vid_tr_nam,'
      
        '  IIF(month.kod_npr=kvit.kod_npr,month.tonn*1000,000000000000) a' +
        's zayv_mon,'
      '  kvit.exped as exped_kod, kvit.tipv as tipv, kvit.np,'
      '  SUM(ves*1000) as fact_year,'
      '  SUM(ves*1000) as fact_mon,'
      '  000000000000 as fact_sut'
      
        'FROM '#39'U:\LUK\OTGR\OPERDATA\reestr'#39' kvit,prod,predpr,stan,vid_otg' +
        'r,month'
      'WHERE kvit.date_otgr<{04/01/2003}'
      '  AND kvit.date_otgr>={01/01/2003}'
      '  AND kvit.prizn_mps=3'
      '  AND kvit.kod_npr=prod.kod'
      '  AND kvit.kst=stan.kod'
      '  AND kvit.tip_otgr=vid_otgr.kod'
      '  AND kvit.kod_plat=predpr.kod'
      '  AND ALLT(kvit.nom_zd)=ALLT(month.nom_zd)'
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16')
    Left = 24
    Top = 157
  end
  object q_gdplan_old: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    BeforeOpen = q_gdplan_oldBeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  prod.kod as prod_kod,'
      '  prod.kod_10 as prod_kod10,'
      '  prod.kind_npr,'
      '  prod.naim_pr as prod_name,'
      '  STR(vid_otgr.kod_m) as vid_trans,'
      '  vid_otgr.type_otgr as vid_tr_nam,'
      '  SUM(plan_ves*1000) as plan_gd'
      'FROM '#39'U:\LUK\GD\DBF\gd_plan2'#39',prod,vid_otgr'
      'WHERE date_plan<{04/01/2003}'
      '  AND date_plan>={01/01/2003}'
      '  AND export=2'
      '  AND kod_npr=prod.kod'
      '  AND tip_otgr=vid_otgr.kod'
      'GROUP BY 1,2,3,4,5,6'
      'HAVING plan_gd<>0'
      '')
    Left = 100
    Top = 261
  end
  object q_planpost: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    BeforeOpen = q_planpostBeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  dog.kod_plat as plat_kod,'
      '  predpr.naim as plat_name,'
      '  plotg2.n_dog as num_dog,'
      '  prod.kod as prod_kod,'
      '  prod.kod_10 as prod_kod10,'
      '  prod.kind_npr,'
      '  prod.naim_pr as prod_name,'
      '  STR(vid_otgr.kod_m) as vid_trans,'
      '  vid_otgr.type_otgr as vid_tr_nam,'
      '  SUM(plotg2.t_itog*1000) as plan_post'
      
        'FROM '#39'U:\LUK\DOGOVOR\PLANM\PL03_05\plotg2'#39',prod,predpr,vid_otgr,' +
        'dog'
      'WHERE plotg2.kod_sgr=21'
      '  AND plotg2.kod_npr=prod.kod'
      '  AND vid_otgr.kod=1'
      '  AND plotg2.n_dog=dog.num_dog'
      '  AND dog.kod_plat=predpr.kod'
      'GROUP BY 1,2,3,4,5,6,7,8,9'
      'HAVING plan_post<>0'
      '')
    Left = 172
    Top = 269
  end
  object q_fact_sut: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    BeforeOpen = q_fact_sutBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  kvit.nom_zd,'
      '  kvit.kod_plat as plat_kod,'
      '  predpr.naim as plat_name,'
      '  kvit.n_dog as num_dog,'
      '  prod.kod as prod_kod,'
      '  prod.kod_10 as prod_kod10,'
      '  prod.kind_npr,'
      '  prod.naim_pr as prod_name,'
      '  IIF(EMPTY(kvit.kst),SPACE(10),STR(kvit.kst)) as stan_kod,'
      '  IIF(EMPTY(kvit.kst),SPACE(50),stan.naim) as stan_name,'
      '  STR(vid_otgr.kod_m) as vid_trans,'
      '  vid_otgr.type_otgr as vid_tr_nam,'
      '  000000000000 as zayv_mon,'
      '  kvit.exped as exped_kod, kvit.tipv, kvit.np,'
      '  000000000000 as fact_year,'
      '  000000000000 as fact_mon,'
      '  SUM(ves*1000) as fact_sut'
      
        'FROM '#39'U:\LUK\OTGR\OPERDATA\reestr'#39' kvit,prod,predpr,stan,vid_otg' +
        'r'
      'WHERE kvit.date_otgr={04/14/2003}'
      '  AND kvit.prizn_mps=3'
      '  AND kvit.kod_npr=prod.kod'
      '  AND kvit.kst=stan.kod'
      '  AND kvit.tip_otgr=vid_otgr.kod'
      '  AND kvit.kod_plat=predpr.kod'
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16')
    Left = 168
    Top = 157
  end
  object q_zayv: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    BeforeOpen = q_zayvBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  month.nom_zd,'
      '  month.kod_plat as plat_kod,'
      '  predpr.naim as plat_name,'
      '  month.n_dog as num_dog,'
      '  prod.kod as prod_kod,'
      '  prod.kod_10 as prod_kod10,'
      '  prod.kind_npr,'
      '  prod.naim_pr as prod_name,'
      '  IIF(EMPTY(month.kst),SPACE(10),STR(month.kst)) as stan_kod,'
      '  IIF(EMPTY(month.kst),SPACE(50),stan.naim) as stan_name,'
      '  STR(vid_otgr.kod_m) as vid_trans,'
      '  vid_otgr.type_otgr as vid_tr_nam,  month.exped as exped_kod,'
      '  month.tonn*1000 as zayv_mon'
      'FROM month,prod,predpr,stan,vid_otgr'
      'WHERE month.date_plan={04/01/2003}'
      '  AND month.kod_sgr=21'
      '  AND month.kod_npr=prod.kod'
      '  AND month.kst=stan.kod'
      '  AND vid_otgr.kod=1'
      '  AND month.kod_plat=predpr.kod'
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13')
    Left = 112
    Top = 157
  end
  object q_list: TADOQuery
    Connection = PF_Conn
    Parameters = <>
    Left = 8
    Top = 269
  end
  object q_seek: TADOQuery
    Connection = PF_Conn
    EnableBCD = False
    Parameters = <
      item
        Name = 'rep_date'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end>
    SQL.Strings = (
      'SELECT * FROM "U:\LUK\DBASES\SOOB_EXP.DBF" '
      'WHERE rep_date=:rep_date'
      '')
    Left = 104
    Top = 72
  end
  object t_pe_edit: TADOTable
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DSN=PF;UID=;SourceDB=c:\tmp;SourceType=DBF;Exclusive=No;Back' +
      'groundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"'
    CursorType = ctStatic
    TableName = 'pe_edit'
    Left = 160
    Top = 72
    object t_pe_editplat_kod: TStringField
      FieldName = 'plat_kod'
      FixedChar = True
      Size = 10
    end
    object t_pe_editplat_name: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'plat_name'
      FixedChar = True
      Size = 60
    end
    object t_pe_editprod_kod: TStringField
      FieldName = 'prod_kod'
      FixedChar = True
      Size = 6
    end
    object t_pe_editprod_kod10: TStringField
      FieldName = 'prod_kod10'
      FixedChar = True
      Size = 10
    end
    object t_pe_editkind_npr: TStringField
      FieldName = 'kind_npr'
      FixedChar = True
      Size = 6
    end
    object t_pe_editprod_fas: TStringField
      FieldName = 'prod_fas'
      FixedChar = True
      Size = 1
    end
    object t_pe_editprod_name: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'prod_name'
      FixedChar = True
      Size = 100
    end
    object t_pe_editstan_kod: TStringField
      FieldName = 'stan_kod'
      FixedChar = True
      Size = 10
    end
    object t_pe_editstan_name: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103
      FieldName = 'stan_name'
      FixedChar = True
      Size = 60
    end
    object t_pe_editexped_kod: TStringField
      FieldName = 'exped_kod'
      FixedChar = True
      Size = 10
    end
    object t_pe_editexped_name: TStringField
      DisplayLabel = #1069#1082#1089#1087#1077#1076#1080#1090#1086#1088
      FieldName = 'exped_name'
      FixedChar = True
      Size = 60
    end
    object t_pe_editvid_trans: TStringField
      FieldName = 'vid_trans'
      FixedChar = True
      Size = 10
    end
    object t_pe_editvid_tr_nam: TStringField
      DisplayLabel = #1058#1088#1072#1085#1089#1087#1086#1088#1090
      FieldName = 'vid_tr_nam'
      FixedChar = True
      Size = 30
    end
    object t_pe_editfact_year: TBCDField
      DisplayLabel = #1060#1072#1082#1090' '#1089' '#1085#1072#1095'.'#1075#1086#1076#1072
      FieldName = 'fact_year'
      Precision = 15
      Size = 0
    end
    object t_pe_editplan_post: TBCDField
      DisplayLabel = #1055#1083#1072#1085' '#1087#1086#1089#1090'. / '#1047#1072#1103#1074#1083#1077#1085#1086
      FieldName = 'plan_post'
      Precision = 15
      Size = 0
    end
    object t_pe_editplan_gd: TBCDField
      DisplayLabel = #1055#1083#1072#1085' '#1046#1044
      FieldName = 'plan_gd'
      Precision = 15
      Size = 0
    end
    object t_pe_editfact_mon: TBCDField
      DisplayLabel = #1060#1072#1082#1090' '#1089' '#1085#1072#1095'.'#1084#1077#1089'.'
      FieldName = 'fact_mon'
      Precision = 15
      Size = 0
    end
    object t_pe_editfact_sut: TBCDField
      DisplayLabel = #1060#1072#1082#1090' '#1079#1072' '#1089#1091#1090'.'
      FieldName = 'fact_sut'
      Precision = 15
      Size = 0
    end
    object t_pe_editprich: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103
      FieldName = 'prich'
      Size = 100
    end
    object t_pe_editnum_dog: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1082#1090
      FieldName = 'num_dog'
      FixedChar = True
      Size = 10
    end
    object t_pe_editsortby: TBCDField
      FieldName = 'sortby'
      Precision = 10
      Size = 0
    end
    object t_pe_editnorma_mon: TBCDField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1089' '#1085#1072#1095'.'#1084#1077#1089#1103#1094#1072
      FieldName = 'norma_mon'
      Precision = 15
      Size = 0
    end
    object t_pe_editis_bad: TIntegerField
      FieldName = 'is_bad'
    end
    object t_pe_editid: TBCDField
      FieldName = 'id'
      Precision = 10
      Size = 0
    end
    object t_pe_editSortByInfo: TStringField
      DisplayLabel = #1058#1080#1087' '#1079#1072#1087#1080#1089#1080
      FieldKind = fkCalculated
      FieldName = 'SortByInfo'
      ReadOnly = True
      Calculated = True
    end
    object t_pe_editzapr_mps: TStringField
      FieldName = 'zapr_mps'
      FixedChar = True
      Size = 250
    end
    object t_pe_editplan_izm: TBCDField
      FieldName = 'plan_izm'
      Precision = 15
      Size = 0
    end
    object t_pe_editobpr: TBCDField
      FieldName = 'obpr'
      Precision = 15
      Size = 0
    end
  end
  object q_last: TADOQuery
    Connection = PF_Conn
    Parameters = <>
    Left = 48
    Top = 69
  end
  object q_obpr: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'KLS_DOG.PREDPR_ID as PLAT_KOD,'
      'KLS_PREDPR.PREDPR_NAME as PLAT_NAME,'
      'KLS_DOG.SHORT_NUMBER as NUM_DOG,'
      'PLAN_POST.PROD_ID_NPR as prod_kod,'
      'KLS_PROD.KOD_10 as prod_kod10,'
      'KLS_PROD.ID_KIND_NPR as KIND_NPR,'
      'KLS_PROD.NAME_NPR as PROD_NAME,'
      'TO_CHAR(KLS_LOAD_TYPE.LOAD_MOS_ID) as VID_TRANS,'
      'KLS_LOAD_TYPE.TYPE_OTGR_NAME as VID_TR_NAM,'
      'SUM(PLAN_POST.PLAN_VES*1000) AS obpr'
      'FROM'
      
        'PLAN_POST, PLAN_PERIODS, KLS_DOG, KLS_PLANSTRU, KLS_PREDPR, KLS_' +
        'PROD, KLS_LOAD_TYPE'
      'WHERE KLS_PLANSTRU.KOD_SGR=21'
      '  and PLAN_POST.PLANSTRU_ID=KLS_PLANSTRU.ID'
      '  AND PLAN_POST.PLAN_ID=3'
      '  AND PLAN_POST.PLAN_PER_ID=PLAN_PERIODS.ID'
      '  AND PLAN_PERIODS.DATE_PLAN=TO_DATE('#39'01.12.2003'#39','#39'dd.mm.yyyy'#39')'
      '  AND PLAN_POST.PROD_ID_NPR = KLS_PROD.ID_NPR'
      '  AND KLS_LOAD_TYPE.ID=1'
      '  AND PLAN_POST.DOG_ID=KLS_DOG.ID'
      '  AND KLS_DOG.PREDPR_ID=KLS_PREDPR.ID'
      'GROUP BY'
      'KLS_DOG.PREDPR_ID,'
      'KLS_PREDPR.PREDPR_NAME,'
      'KLS_DOG.SHORT_NUMBER,'
      'PLAN_POST.PROD_ID_NPR,'
      'KLS_PROD.KOD_10,'
      'KLS_PROD.ID_KIND_NPR,'
      'KLS_PROD.NAME_NPR,'
      'TO_CHAR(KLS_LOAD_TYPE.LOAD_MOS_ID),'
      'KLS_LOAD_TYPE.TYPE_OTGR_NAME'
      'HAVING SUM(PLAN_POST.PLAN_VES*1000)<>0'
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000A000000080000004B494E445F4E5052010000000008000000504C41
      545F4B4F44010000000009000000504C41545F4E414D45010000000007000000
      4E554D5F444F4701000000000800000050524F445F4B4F4401000000000A0000
      0050524F445F4B4F44313001000000000900000050524F445F4E414D45010000
      0000090000005649445F5452414E530100000000040000004F42505201000000
      000A0000005649445F54525F4E414D0100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_obprBeforeOpen
    Left = 72
    Top = 160
    object q_obprPLAT_KOD: TIntegerField
      FieldName = 'PLAT_KOD'
      Required = True
    end
    object q_obprPLAT_NAME: TStringField
      FieldName = 'PLAT_NAME'
      Required = True
      Size = 60
    end
    object q_obprNUM_DOG: TStringField
      FieldName = 'NUM_DOG'
      Required = True
      Size = 10
    end
    object q_obprPROD_KOD: TStringField
      FieldName = 'PROD_KOD'
      Required = True
      Size = 5
    end
    object q_obprPROD_KOD10: TStringField
      FieldName = 'PROD_KOD10'
      Size = 10
    end
    object q_obprKIND_NPR: TStringField
      FieldName = 'KIND_NPR'
      Size = 5
    end
    object q_obprPROD_NAME: TStringField
      FieldName = 'PROD_NAME'
      Required = True
      Size = 40
    end
    object q_obprVID_TRANS: TStringField
      FieldName = 'VID_TRANS'
      Size = 40
    end
    object q_obprVID_TR_NAM: TStringField
      FieldName = 'VID_TR_NAM'
      Required = True
      Size = 30
    end
    object q_obprOBPR: TFloatField
      FieldName = 'OBPR'
    end
  end
  object q_allplan: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    BeforeOpen = q_allplanBeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  plat_kod,'
      '  plat_name,'
      '  num_dog,'
      '  prod_kod,'
      '  prod_kod10,'
      '  kind_npr,'
      '  prod_name,'
      '  vid_trans,'
      '  vid_tr_nam,'
      '  SUM(plan_post+obpr) as plan_post,'
      '  SUM(plan_izm) as plan_izm,'
      '  SUM(obpr) as obpr'
      'FROM '#39'C:\TMP\pe_plan'#39
      'GROUP BY 1,2,3,4,5,6,7,8,9'
      '')
    Left = 204
    Top = 229
  end
  object q_gdplan: TOracleDataSet
    SQL.Strings = (
      'SELECT /* */'
      '  GU12_B.PLAT_ID,'
      '  TO_CHAR(GU12_A.PROD_ID) as PROD_GU12_ID,'
      '  KLS_STAN.STAN_KOD,KLS_STAN.STAN_NAME,'
      
        '  PREDPR_ROLE.KOD_MOSCOW as EXPED_ID, TO_CHAR(KLS_LOAD_TYPE.LOAD' +
        '_MOS_ID) as VID_TRANS, KLS_LOAD_TYPE.TYPE_OTGR_NAME as VID_TR_NA' +
        'M,'
      '  SUM(GU12_BR.VES*1000) as plan_gd'
      'FROM GU12_BR,GU12_B,GU12_A,PREDPR_ROLE,KLS_STAN, KLS_LOAD_TYPE'
      
        'WHERE GU12_BR.ID_B=GU12_B.ID AND GU12_A.ID=GU12_B.ID_A AND KLS_L' +
        'OAD_TYPE.ID=1'
      '  AND GU12_BR.DATE_R<=TO_DATE('#39'28.02.2006'#39','#39'dd.mm.yyyy'#39')'
      '  AND GU12_BR.DATE_R>=TO_DATE('#39'01.02.2006'#39','#39'dd.mm.yyyy'#39')'
      '  AND GU12_A.EXPED_ID IS NOT NULL'
      '  AND GU12_A.EXPED_ID=PREDPR_ROLE.PREDPR_ID'
      '  AND PREDPR_ROLE.KLS_ROLE_ID=3'
      '  AND GU12_B.STAN_ID=KLS_STAN.ID'
      '  AND GU12_B.ISCOR<>2'
      'GROUP BY '
      '  GU12_B.PLAT_ID,'
      '  GU12_A.PROD_ID,'
      '  KLS_STAN.STAN_KOD,'
      '  KLS_STAN.STAN_NAME,'
      '  PREDPR_ROLE.KOD_MOSCOW,'
      '  TO_CHAR(KLS_LOAD_TYPE.LOAD_MOS_ID),'
      '  KLS_LOAD_TYPE.TYPE_OTGR_NAME  ')
    QBEDefinition.QBEFieldDefs = {
      030000000800000007000000504C41545F494401000000000C00000050524F44
      5F475531325F49440100000000080000005354414E5F4B4F4401000000000800
      000045585045445F4944010000000007000000504C414E5F4744010000000009
      0000005649445F5452414E5301000000000A0000005649445F54525F4E414D01
      00000000090000005354414E5F4E414D450100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_gdplanBeforeOpen
    Left = 144
    Top = 272
    object q_gdplanPLAT_ID: TIntegerField
      FieldName = 'PLAT_ID'
    end
    object q_gdplanPROD_GU12_ID: TStringField
      FieldName = 'PROD_GU12_ID'
      Size = 40
    end
    object q_gdplanSTAN_KOD: TIntegerField
      FieldName = 'STAN_KOD'
      Required = True
    end
    object q_gdplanSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Required = True
      Size = 50
    end
    object q_gdplanEXPED_ID: TStringField
      FieldName = 'EXPED_ID'
      Size = 10
    end
    object q_gdplanPLAN_GD: TFloatField
      FieldName = 'PLAN_GD'
    end
    object q_gdplanVID_TRANS: TStringField
      FieldName = 'VID_TRANS'
      Size = 40
    end
    object q_gdplanVID_TR_NAM: TStringField
      FieldName = 'VID_TR_NAM'
      Required = True
      Size = 30
    end
  end
  object q_prod: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  KOD_GU12,'
      '  KOD,'
      '  KOD_10,'
      '  KIND_NPR,'
      '  NAIM_PR'
      'FROM prod'
      'ORDER BY kod_gu12,kod'
      ''
      '')
    Left = 128
    Top = 209
  end
  object q_SvedExped: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  MAX(exped) as exped_kod'
      'FROM kvit'
      'WHERE ALLT(nom_zd)='#39'?'#39' and NP=0'
      ''
      '')
    Left = 80
    Top = 321
    object q_SvedExpedexped_kod: TIntegerField
      FieldName = 'exped_kod'
    end
  end
  object q_KvitExped: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  MAX(exped) as exped_kod'
      'FROM kvit'
      'WHERE ALLT(nom_zd)='#39'?'#39
      ''
      '')
    Left = 168
    Top = 329
    object q_KvitExpedexped_kod: TIntegerField
      FieldName = 'exped_kod'
    end
  end
end
