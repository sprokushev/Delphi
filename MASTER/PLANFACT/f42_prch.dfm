object f_f42_prich: Tf_f42_prich
  Left = 346
  Top = 154
  BorderStyle = bsDialog
  Caption = #1055#1088#1080#1095#1080#1085#1099' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1086#1090' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1086#1082
  ClientHeight = 511
  ClientWidth = 375
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
  object GroupBox1: TGroupBox
    Left = 5
    Top = 8
    Width = 363
    Height = 241
    Caption = ' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '
    TabOrder = 0
    object l_date1: TLabel
      Left = 63
      Top = 89
      Width = 6
      Height = 13
      Caption = #1089
      Visible = False
    end
    object l_date2: TLabel
      Left = 183
      Top = 89
      Width = 12
      Height = 13
      Caption = #1087#1086
      Visible = False
    end
    object l_date: TLabel
      Left = 22
      Top = 139
      Width = 110
      Height = 13
      Caption = #1076#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1088#1072#1089#1095#1077#1090#1072
    end
    object l_month: TLabel
      Left = 22
      Top = 112
      Width = 33
      Height = 13
      Caption = #1052#1077#1089#1103#1094
    end
    object l_year: TLabel
      Left = 184
      Top = 111
      Width = 17
      Height = 13
      Caption = #1075#1086#1076
    end
    object Label1: TLabel
      Left = 7
      Top = 169
      Width = 73
      Height = 13
      Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086
    end
    object Label2: TLabel
      Left = 191
      Top = 169
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object date1: TDateTimePicker
      Left = 79
      Top = 86
      Width = 95
      Height = 21
      Date = 36717.541841782390000000
      Time = 36717.541841782390000000
      Enabled = False
      MinDate = 36526.000000000000000000
      TabOrder = 0
      Visible = False
      OnChange = date1Change
    end
    object date2: TDateTimePicker
      Left = 206
      Top = 86
      Width = 95
      Height = 21
      Date = 36717.541841782390000000
      Time = 36717.541841782390000000
      Enabled = False
      MinDate = 36526.000000000000000000
      TabOrder = 1
      Visible = False
      OnChange = date2Change
    end
    object rg_TypeSelect: TRadioGroup
      Left = 36
      Top = 11
      Width = 292
      Height = 35
      Caption = ' '#1074#1099#1073#1086#1088#1082#1072' '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #1054#1087#1077#1088#1072#1090#1080#1074#1085#1072#1103
        #1055#1086' '#1089#1095#1077#1090#1072#1084'-'#1092#1072#1082#1090#1091#1088#1072#1084)
      TabOrder = 2
      OnClick = rg_TypeSelectClick
    end
    object e_date: TDateTimePicker
      Left = 149
      Top = 135
      Width = 81
      Height = 21
      Date = 36685.479093865700000000
      Time = 36685.479093865700000000
      TabOrder = 3
      OnChange = e_dateChange
    end
    object e_time: TDateTimePicker
      Left = 247
      Top = 134
      Width = 81
      Height = 21
      Date = 36685.750000000000000000
      Time = 36685.750000000000000000
      Kind = dtkTime
      TabOrder = 4
    end
    object cb_Month: TComboBox
      Left = 64
      Top = 108
      Width = 111
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      OnChange = cb_MonthChange
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1084#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object e_year: TRxSpinEdit
      Left = 213
      Top = 108
      Width = 64
      Height = 21
      Value = 2000.000000000000000000
      TabOrder = 6
    end
    object rg_typeOtgr: TRadioGroup
      Left = 36
      Top = 48
      Width = 292
      Height = 35
      Caption = ' '#1086#1090#1075#1088#1091#1079#1082#1072' '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #1042#1089#1103' '
        #1041#1077#1079' '#1093#1088#1072#1085#1077#1085#1080#1103
        #1061#1088#1072#1085#1077#1085#1080#1077)
      TabOrder = 7
      OnClick = rg_TypeSelectClick
    end
    object date_proizv_from: TDateTimePicker
      Left = 87
      Top = 166
      Width = 95
      Height = 21
      Date = 36717.541841782390000000
      Time = 36717.541841782390000000
      MinDate = 36526.000000000000000000
      TabOrder = 8
    end
    object date_proizv_to: TDateTimePicker
      Left = 214
      Top = 166
      Width = 95
      Height = 21
      Date = 36717.541841782390000000
      Time = 36717.541841782390000000
      MinDate = 36526.000000000000000000
      TabOrder = 9
    end
    object cb_AddMonth: TCheckBox
      Left = 16
      Top = 192
      Width = 161
      Height = 17
      Caption = #1056#1072#1089#1095#1077#1090' "'#1042#1089#1077#1075#1086' '#1079#1072#1103#1074#1083#1077#1085#1086'"'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
    object cb_AddPlanHist: TCheckBox
      Left = 184
      Top = 192
      Width = 169
      Height = 17
      Caption = #1056#1072#1089#1095#1077#1090' "'#1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1082' '#1087#1083#1072#1085#1091'"'
      TabOrder = 11
    end
    object cb_AddResurs: TCheckBox
      Left = 16
      Top = 216
      Width = 137
      Height = 17
      Caption = #1056#1072#1089#1095#1077#1090' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
      TabOrder = 12
    end
  end
  object pbar: TProgressBar
    Left = 8
    Top = 285
    Width = 361
    Height = 16
    TabOrder = 1
    Visible = False
  end
  object btPrichin: TBitBtn
    Left = 64
    Top = 255
    Width = 241
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090' '#1080' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
    TabOrder = 2
    OnClick = btPrichinClick
    NumGlyphs = 2
  end
  object ds_plan: TDataSource
    DataSet = q_fact_otgr
    Left = 180
    Top = 329
  end
  object q_plan: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'pl_mos2.kod_npr,'
      'grplp2.kod_pos,'
      'grplp2.kod_sgr,'
      'grplp2.kod_spg,'
      'grplp2.kod_rzd,'
      'grplp2.kod_prz,'
      'grplp2.kod_grp,'
      'grplp2.kod_pgr,'
      'grplp2.naim AS naim,'
      'SUM(t_nvpl+t_deng) AS d_ves,'
      'SUM(T_VLUK+T_VOBL+T_VZCH+T_NOSV+T_AVIZ) AS v_ves,'
      'SUM(d_nvpl+d_deng) AS d_sum,'
      'SUM(d_VLUK+d_VOBL+d_VZCH+d_NOSV+d_AVIZ) AS v_sum,'
      'kindprod.pf_ordnung,'
      'prod.kod AS kind_npr,'
      'prod.naim_pr,'
      'kindprod.pg_gr_ordn,'
      'kindprod.pf_kod_gr,'
      'kindprod.pf_group'
      'FROM'
      'kindprod,prod,'
      #39'U:\luk\DOGOVOR\PLANM\pl00_07\grplp2.dbf'#39' grplp2,'
      #39'U:\luk\DOGOVOR\PLANM\pl00_07\PL_MOS2.DBF'#39' pl_mos2'
      'WHERE grplp2.kod_pos<=5  and grplp2.kod_sgr<>501'
      '  and grplp2.kod_sgr=pl_mos2.kod_sgr'
      '  and grplp2.kod_spg=pl_mos2.kod_spg'
      '  and grplp2.kod_rzd=pl_mos2.kod_rzd'
      '  and grplp2.kod_prz=pl_mos2.kod_prz'
      '  and grplp2.kod_grp=pl_mos2.kod_grp'
      '  and pl_mos2.kod_npr = prod.kod'
      '  and kindprod.kind_npr = prod.kind_npr'
      'ORDER BY 3,4,5,6,7'
      'GROUP BY  1,2,3,4,5,6,7'
      ''
      ''
      ''
      ' ')
    Left = 136
    Top = 329
    object q_plankod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_plankod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_plankod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_plankod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_plankod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_plankod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_plankod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_plankod_pgr: TIntegerField
      FieldName = 'kod_pgr'
    end
    object q_plannaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 40
    end
    object q_pland_ves: TBCDField
      FieldName = 'd_ves'
      Precision = 16
      Size = 6
    end
    object q_planv_ves: TBCDField
      FieldName = 'v_ves'
      Precision = 19
      Size = 6
    end
    object q_pland_sum: TBCDField
      FieldName = 'd_sum'
      Precision = 16
      Size = 2
    end
    object q_planv_sum: TBCDField
      FieldName = 'v_sum'
      Precision = 18
      Size = 2
    end
    object q_planpf_ordnung: TIntegerField
      FieldName = 'pf_ordnung'
    end
    object q_plankind_npr: TStringField
      FieldName = 'kind_npr'
      FixedChar = True
      Size = 5
    end
    object q_plannaim_pr: TStringField
      FieldName = 'naim_pr'
      FixedChar = True
      Size = 40
    end
    object q_planpg_gr_ordn: TIntegerField
      FieldName = 'pg_gr_ordn'
    end
    object q_planpf_kod_gr: TStringField
      FieldName = 'pf_kod_gr'
      FixedChar = True
      Size = 5
    end
    object q_planpf_group: TStringField
      FieldName = 'pf_group'
      FixedChar = True
      Size = 30
    end
  end
  object q_fact_plat: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'out_plat.kod_nfp as kod_npr,'
      'month.kod_pos,'
      'month.kod_sgr,'
      'month.kod_spg,'
      'month.kod_rzd,'
      'month.kod_prz,'
      'month.kod_grp,'
      'month.naim_p AS naim,'
      
        'sum(IIF(month.posred=10 or month.posred=0,OUT_PLAT.ves,0.000)) A' +
        'S d_ves,'
      
        'sum(IIF(month.posred<>10 and month.posred<>0,OUT_PLAT.ves,0.000)' +
        ') AS v_ves,'
      
        'sum(IIF(month.posred=10 or month.posred=0,OUT_PLAT.SUMMA_DOK,0.0' +
        '0)) AS d_sum,'
      
        'sum(IIF(month.posred<>10 and month.posred<>0,OUT_PLAT.SUMMA_DOK,' +
        '0.00)) AS v_sum,'
      'kindprod.pf_ordnung,'
      'prod.kod AS kind_npr,'
      'prod.naim_pr,'
      'kindprod.pg_gr_ordn,'
      'kindprod.pf_kod_gr,'
      
        'kindprod.pf_group, prod2.naim_pr AS fact_naim_pr, prod.prich_fac' +
        't'
      
        'FROM month,OUT_PLAT,prod,kindprod,'#39'U:\luk\DOGOVOR\PLANM\pl00_09\' +
        'plotg1_.dbf'#39' plotg, prod prod2'
      'WHERE'
      '  month.nom_zd=OUT_PLAT.nom_zd AND month.kod_sgr<>501 and'
      
        '  OUT_PLAT.data_buxg BETWEEN {09/01/2000} AND {09/01/2000} and m' +
        'onth.date_plan={09/01/2000}'
      
        '  and plotg.kod_npr = prod.kod and plotg.n_dog=month.n_dog and p' +
        'lotg.kod_pos=month.kod_pos and plotg.kod_sgr=month.kod_sgr and p' +
        'lotg.kod_spg=month.kod_spg and plotg.kod_rzd=month.kod_rzd and p' +
        'lotg.kod_prz=month.kod_prz and plotg.kod_grp=month.kod_grp'
      
        '  and kindprod.kind_npr = prod.kind_npr and plotg.kod_npr = MONT' +
        'H.KOD_NPR and out_plat.kod_nfp=prod2.kod'
      'GROUP BY 1,3,4,5,6,7,8,13,14,15,16,17,18'
      'UNION ALL'
      'SELECT'
      'kvit.kod_npr,'
      'month.kod_pos,'
      'month.kod_sgr,'
      'month.kod_spg,'
      'month.kod_rzd,'
      'month.kod_prz,'
      'month.kod_grp,'
      'month.naim_p AS naim,'
      'sum(kvit.ves) AS d_ves,'
      'sum(0) AS v_ves,'
      'sum(0) AS d_sum,'
      'sum(0) AS v_sum,'
      'kindprod.pf_ordnung,'
      'prod.kod AS kind_npr,'
      'prod.naim_pr,'
      'kindprod.pg_gr_ordn,'
      'kindprod.pf_kod_gr,'
      
        'kindprod.pf_group, prod2.naim_pr AS fact_naim_pr, prod.prich_fac' +
        't'
      
        'FROM month,kvit,prod,kindprod,'#39'U:\luk\DOGOVOR\PLANM\pl00_09\plot' +
        'g1_.dbf'#39' plotg, prod prod2'
      'WHERE'
      '  month.nom_zd=kvit.nom_zd AND'
      '  (kvit.kod_otgr=5 or kvit.kod_otgr=8) and'
      
        '  kvit.date_kvit BETWEEN {09/01/2000} AND {09/01/2000} and month' +
        '.date_plan={09/01/2000}'
      
        '  and plotg.kod_npr = prod.kod and plotg.n_dog=month.n_dog and p' +
        'lotg.kod_pos=month.kod_pos and plotg.kod_sgr=month.kod_sgr and p' +
        'lotg.kod_spg=month.kod_spg and plotg.kod_rzd=month.kod_rzd and p' +
        'lotg.kod_prz=month.kod_prz and plotg.kod_grp=month.kod_grp'
      
        '  and kindprod.kind_npr = prod.kind_npr and plotg.kod_npr = MONT' +
        'H.KOD_NPR and kvit.kod_npr=prod2.kod'
      'GROUP BY 1,3,4,5,6,7,8,13,14,15,16,17,18'
      'UNION ALL'
      'SELECT'
      'out_plat.kod_nfp as kod_npr,'
      'month.kod_pos,'
      'month.kod_sgr,'
      'month.kod_spg,'
      'month.kod_rzd,'
      'month.kod_prz,'
      'month.kod_grp,'
      'month.naim_p AS naim,'
      
        'sum(IIF(month.posred=10 or month.posred=0,OUT_PLAT.ves,0.000)) A' +
        'S d_ves,'
      
        'sum(IIF(month.posred<>10 and month.posred<>0,OUT_PLAT.ves,0.000)' +
        ') AS v_ves,'
      
        'sum(IIF(month.posred=10 or month.posred=0,OUT_PLAT.SUMMA_DOK,0.0' +
        '0)) AS d_sum,'
      
        'sum(IIF(month.posred<>10 and month.posred<>0,OUT_PLAT.SUMMA_DOK,' +
        '0.00)) AS v_sum,'
      'kindprod.pf_ordnung,'
      'prod.kod AS kind_npr,'
      'prod.naim_pr,'
      'kindprod.pg_gr_ordn,'
      'kindprod.pf_kod_gr,'
      
        'kindprod.pf_group, prod2.naim_pr AS fact_naim_pr, prod.prich_fac' +
        't'
      'FROM month,OUT_PLAT,prod,kindprod,prod prod2'
      'WHERE'
      '  month.nom_zd=OUT_PLAT.nom_zd AND month.kod_sgr<>501 and'
      
        '  OUT_PLAT.data_buxg BETWEEN {09/01/2000} AND {09/01/2000} and m' +
        'onth.date_plan={09/01/2000}'
      '  and month.kod_npr = prod.kod'
      
        '  and kindprod.kind_npr = prod.kind_npr and out_plat.kod_nfp=pro' +
        'd2.kod'
      
        '  and not exists (select plotg.n_dog from '#39'U:\luk\DOGOVOR\PLANM\' +
        'pl02_06\plotg1_.dbf'#39' plotg'
      '                  where plotg.kod_npr=month.kod_npr'
      
        '                    and plotg.n_dog=month.n_dog and plotg.kod_po' +
        's=month.kod_pos and plotg.kod_sgr=month.kod_sgr and plotg.kod_sp' +
        'g=month.kod_spg and plotg.kod_rzd=month.kod_rzd and plotg.kod_pr' +
        'z=month.kod_prz and plotg.kod_grp=month.kod_grp)'
      'GROUP BY 1,3,4,5,6,7,8,13,14,15,16,17,18'
      'UNION ALL'
      'SELECT'
      'kvit.kod_npr,'
      'month.kod_pos,'
      'month.kod_sgr,'
      'month.kod_spg,'
      'month.kod_rzd,'
      'month.kod_prz,'
      'month.kod_grp,'
      'month.naim_p AS naim,'
      'sum(kvit.ves) AS d_ves,'
      'sum(0) AS v_ves,'
      'sum(0) AS d_sum,'
      'sum(0) AS v_sum,'
      'kindprod.pf_ordnung,'
      'prod.kod AS kind_npr,'
      'prod.naim_pr,'
      'kindprod.pg_gr_ordn,'
      'kindprod.pf_kod_gr,'
      
        'kindprod.pf_group, prod2.naim_pr AS fact_naim_pr, prod.prich_fac' +
        't'
      'FROM month,kvit,prod,kindprod,prod prod2'
      'WHERE'
      '  month.nom_zd=kvit.nom_zd AND'
      '  (kvit.kod_otgr=5) and'
      
        '  kvit.date_kvit BETWEEN {09/01/2000} AND {09/01/2000} and month' +
        '.date_plan={09/01/2000}'
      '  and month.kod_npr = prod.kod'
      
        '  and kindprod.kind_npr = prod.kind_npr and kvit.kod_npr=prod2.k' +
        'od'
      
        '  and not exists (select plotg.n_dog from '#39'U:\luk\DOGOVOR\PLANM\' +
        'pl02_06\plotg1_.dbf'#39' plotg'
      '                  where plotg.kod_npr=month.kod_npr'
      
        '                    and plotg.n_dog=month.n_dog and plotg.kod_po' +
        's=month.kod_pos and plotg.kod_sgr=month.kod_sgr and plotg.kod_sp' +
        'g=month.kod_spg and plotg.kod_rzd=month.kod_rzd and plotg.kod_pr' +
        'z=month.kod_prz and plotg.kod_grp=month.kod_grp)'
      'GROUP BY 1,3,4,5,6,7,8,13,14,15,16,17,18'
      ''
      '')
    Left = 28
    Top = 325
    object q_fact_platkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_fact_platkod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_fact_platkod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_fact_platkod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_fact_platkod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_fact_platkod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_fact_platkod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_fact_platnaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 30
    end
    object q_fact_platd_ves: TFloatField
      FieldName = 'd_ves'
    end
    object q_fact_platv_ves: TFloatField
      FieldName = 'v_ves'
    end
    object q_fact_platd_sum: TFloatField
      FieldName = 'd_sum'
    end
    object q_fact_platv_sum: TFloatField
      FieldName = 'v_sum'
    end
    object q_fact_platpf_ordnung: TIntegerField
      FieldName = 'pf_ordnung'
    end
    object q_fact_platkind_npr: TStringField
      FieldName = 'kind_npr'
      FixedChar = True
      Size = 5
    end
    object q_fact_platnaim_pr: TStringField
      FieldName = 'naim_pr'
      FixedChar = True
      Size = 40
    end
    object q_fact_platpg_gr_ordn: TIntegerField
      FieldName = 'pg_gr_ordn'
    end
    object q_fact_platpf_kod_gr: TStringField
      FieldName = 'pf_kod_gr'
      FixedChar = True
      Size = 5
    end
    object q_fact_platpf_group: TStringField
      FieldName = 'pf_group'
      FixedChar = True
      Size = 30
    end
    object q_fact_platfact_naim_pr: TStringField
      FieldName = 'fact_naim_pr'
      FixedChar = True
    end
    object q_fact_platprich_fact: TBooleanField
      FieldName = 'prich_fact'
    end
  end
  object q_cmn: TADOQuery
    Connection = PF_Conn
    Parameters = <>
    Left = 312
    Top = 333
  end
  object q_cmn2: TADOQuery
    Connection = PF_Conn
    Parameters = <>
    Left = 276
    Top = 381
  end
  object q_grplp: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM'
      '"U:\luk\DOGOVOR\PLANM\DBF\gr_real.DBF" gr_real')
    Left = 112
    Top = 277
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
    Left = 36
    Top = 277
  end
  object q_plansum: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'kod_npr,'
      'kod_pos,'
      'kod_sgr,'
      'kod_spg,'
      'kod_rzd,'
      'kod_prz,'
      'kod_grp,'
      'naim,'
      'SUM(d_ves) AS d_ves,'
      'SUM(v_ves) AS v_ves,'
      'SUM(d_sum) AS d_sum,'
      'SUM(v_sum) AS v_sum'
      'FROM'
      '"C:\TMP\F42_SHBL.DBF"'
      'ORDER BY 3,4,5,6,7'
      'GROUP BY  1,2,3,4,5,6,7'
      ''
      ' ')
    Left = 180
    Top = 281
    object q_plansumkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_plansumkod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_plansumkod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_plansumkod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_plansumkod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_plansumkod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_plansumkod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_plansumnaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 50
    end
    object q_plansumd_ves: TBCDField
      FieldName = 'd_ves'
      Precision = 16
      Size = 3
    end
    object q_plansumv_ves: TBCDField
      FieldName = 'v_ves'
      Precision = 16
      Size = 3
    end
    object q_plansumd_sum: TBCDField
      FieldName = 'd_sum'
      Precision = 16
      Size = 0
    end
    object q_plansumv_sum: TBCDField
      FieldName = 'v_sum'
      Precision = 16
      Size = 0
    end
  end
  object q_fact_otgr: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'kvit.kod_npr,'
      'month.kod_pos,'
      'month.kod_sgr,'
      'month.kod_spg,'
      'month.kod_rzd,'
      'month.kod_prz,'
      'month.kod_grp,'
      'month.naim_p AS naim,'
      
        'sum(IIF(month.posred=10 or month.posred=0,kvit.ves,0.000)) AS d_' +
        'ves,'
      
        'sum(IIF(month.posred<>10 and month.posred<>0,kvit.ves,0.000)) AS' +
        ' v_ves,'
      
        'sum(IIF(month.posred=10 or month.posred=0,kvit.cena_otp*kvit.ves' +
        ',0.00)) AS d_sum,'
      
        'sum(IIF(month.posred<>10 and month.posred<>0,kvit.cena_otp*kvit.' +
        'ves,0.00)) AS v_sum,'
      
        'IIF(prod2.prich_fact,kindprod2.pf_ordnung, kindprod.pf_ordnung) ' +
        'AS pf_ordnung,'
      'IIF(prod2.prich_fact,kvit.kod_npr,prod.kod) AS kind_npr,'
      'IIF(prod2.prich_fact,prod2.naim_pr,prod.naim_pr) AS naim_pr,'
      'kindprod.pg_gr_ordn,'
      'kindprod.pf_kod_gr,'
      'kindprod.pf_group, prod2.prich_fact'
      
        'FROM '#39'U:\luk\OTGR\OPERDATA\REESTR.DBF'#39' kvit,month,prod,kindprod,' +
        #39'U:\luk\DOGOVOR\PLANM\pl04_01\plotg1_.dbf'#39' plotg, prod prod2,kin' +
        'dprod kindprod2'
      'WHERE'
      '  month.nom_zd=kvit.nom_zd AND month.kod_sgr<>501 and'
      
        '  kvit.date_otgr BETWEEN {01/01/2004} AND {01/31/2004} and month' +
        '.date_plan={01/01/2004}'
      
        '  and plotg.kod_npr = prod.kod and plotg.n_dog=month.n_dog and p' +
        'lotg.kod_pos=month.kod_pos and plotg.kod_sgr=month.kod_sgr and p' +
        'lotg.kod_spg=month.kod_spg and plotg.kod_rzd=month.kod_rzd and p' +
        'lotg.kod_prz=month.kod_prz and plotg.kod_grp=month.kod_grp'
      
        '  and kindprod.kind_npr = prod.kind_npr and plotg.kod_npr = MONT' +
        'H.KOD_NPR and kvit.kod_npr=prod2.kod and prod2.kind_npr=kindprod' +
        '2.kind_npr'
      'GROUP BY 1,3,4,5,6,7,8,13,14,15,16,17,18'
      'UNION ALL'
      'SELECT'
      'kvit.kod_npr,'
      'month.kod_pos,'
      'month.kod_sgr,'
      'month.kod_spg,'
      'month.kod_rzd,'
      'month.kod_prz,'
      'month.kod_grp,'
      'month.naim_p AS naim,'
      
        'sum(IIF(month.posred=10 or month.posred=0,kvit.ves,0.000)) AS d_' +
        'ves,'
      
        'sum(IIF(month.posred<>10 and month.posred<>0,kvit.ves,0.000)) AS' +
        ' v_ves,'
      
        'sum(IIF(month.posred=10 or month.posred=0,kvit.cena_otp*kvit.ves' +
        ',0.00)) AS d_sum,'
      
        'sum(IIF(month.posred<>10 and month.posred<>0,kvit.cena_otp*kvit.' +
        'ves,0.00)) AS v_sum,'
      
        'IIF(prod2.prich_fact,kindprod2.pf_ordnung, kindprod.pf_ordnung) ' +
        'AS pf_ordnung,'
      'IIF(prod2.prich_fact,kvit.kod_npr,prod.kod) AS kind_npr,'
      'IIF(prod2.prich_fact,prod2.naim_pr,prod.naim_pr) AS naim_pr,'
      'kindprod.pg_gr_ordn,'
      'kindprod.pf_kod_gr,'
      'kindprod.pf_group, prod2.prich_fact'
      
        'FROM '#39'U:\luk\OTGR\OPERDATA\REESTR.DBF'#39' kvit,month,prod,kindprod,' +
        ' prod prod2,kindprod kindprod2'
      'WHERE'
      '  month.nom_zd=kvit.nom_zd AND month.kod_sgr<>501 and'
      
        '  kvit.date_otgr BETWEEN {01/01/2004} AND {01/31/2004} and month' +
        '.date_plan={01/01/2004}'
      '  and month.kod_npr = prod.kod'
      
        '  and kindprod.kind_npr = prod.kind_npr and kvit.kod_npr=prod2.k' +
        'od and prod2.kind_npr=kindprod2.kind_npr'
      
        '  and not exists (select plotg.n_dog from '#39'U:\luk\DOGOVOR\PLANM\' +
        'pl04_01\plotg1_.dbf'#39' plotg'
      '                  where plotg.kod_npr=month.kod_npr'
      
        '                    and plotg.n_dog=month.n_dog and plotg.kod_po' +
        's=month.kod_pos and plotg.kod_sgr=month.kod_sgr and plotg.kod_sp' +
        'g=month.kod_spg and plotg.kod_rzd=month.kod_rzd and plotg.kod_pr' +
        'z=month.kod_prz and plotg.kod_grp=month.kod_grp)'
      'GROUP BY 1,3,4,5,6,7,8,13,14,15,16,17,18'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 80
    Top = 325
    object q_fact_otgrkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_fact_otgrkod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_fact_otgrkod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_fact_otgrkod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_fact_otgrkod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_fact_otgrkod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_fact_otgrkod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_fact_otgrnaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 30
    end
    object q_fact_otgrd_ves: TBCDField
      FieldName = 'd_ves'
      Precision = 16
      Size = 3
    end
    object q_fact_otgrv_ves: TBCDField
      FieldName = 'v_ves'
      Precision = 16
      Size = 3
    end
    object q_fact_otgrd_sum: TBCDField
      FieldName = 'd_sum'
      Precision = 20
      Size = 6
    end
    object q_fact_otgrv_sum: TBCDField
      FieldName = 'v_sum'
      Precision = 16
      Size = 2
    end
    object q_fact_otgrpf_ordnung: TIntegerField
      FieldName = 'pf_ordnung'
    end
    object q_fact_otgrkind_npr: TStringField
      FieldName = 'kind_npr'
      FixedChar = True
      Size = 5
    end
    object q_fact_otgrnaim_pr: TStringField
      FieldName = 'naim_pr'
      FixedChar = True
      Size = 40
    end
    object q_fact_otgrpg_gr_ordn: TIntegerField
      FieldName = 'pg_gr_ordn'
    end
    object q_fact_otgrpf_kod_gr: TStringField
      FieldName = 'pf_kod_gr'
      FixedChar = True
      Size = 5
    end
    object q_fact_otgrpf_group: TStringField
      FieldName = 'pf_group'
      FixedChar = True
      Size = 30
    end
    object q_fact_otgrprich_fact: TBooleanField
      FieldName = 'prich_fact'
    end
  end
  object q_acc: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=pf_acc;Mode=ReadWrite'
    Parameters = <>
    Left = 33
    Top = 383
  end
  object q_month: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'month.kod_npr,'
      'month.kod_pos,'
      'month.kod_sgr,'
      'month.kod_spg,'
      'month.kod_rzd,'
      'month.kod_prz,'
      'month.kod_grp, month.nom_zd,'
      'month.naim_p AS naim,'
      'sum(raznar.tonn) as tonn,'
      'max(month.vvoddat) as vvoddat,'
      'kindprod.pf_ordnung,'
      'prod.kod AS kind_npr,'
      'prod.naim_pr,'
      'kindprod.pg_gr_ordn,'
      'kindprod.pf_kod_gr,'
      'kindprod.pf_group'
      
        'FROM raznar, month, prod, kindprod,'#39'U:\luk\DOGOVOR\PLANM\pl04_01' +
        '\plotg1_.dbf'#39' plotg'
      'WHERE'
      '  month.kod_sgr<>501 AND month.nom_zd=raznar.nom_zd AND'
      '  month.vvoddat<={01/07/2004} and month.date_plan={01/01/2004}'
      
        '  and plotg.kod_npr = prod.kod and plotg.n_dog=month.n_dog and p' +
        'lotg.kod_pos=month.kod_pos and plotg.kod_sgr=month.kod_sgr and p' +
        'lotg.kod_spg=month.kod_spg and plotg.kod_rzd=month.kod_rzd and p' +
        'lotg.kod_prz=month.kod_prz and plotg.kod_grp=month.kod_grp'
      
        '  and kindprod.kind_npr = prod.kind_npr and plotg.kod_npr = MONT' +
        'H.KOD_NPR'
      'GROUP BY 1,3,4,5,6,7,8'
      ''
      ' '
      '')
    Left = 157
    Top = 384
    object q_monthkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_monthkod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_monthkod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_monthkod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_monthkod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_monthkod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_monthkod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_monthnaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 30
    end
    object q_monthtonn: TBCDField
      FieldName = 'tonn'
      Precision = 16
      Size = 3
    end
    object q_monthvvoddat: TDateField
      FieldName = 'vvoddat'
    end
    object q_monthpf_ordnung: TIntegerField
      FieldName = 'pf_ordnung'
    end
    object q_monthkind_npr: TStringField
      FieldName = 'kind_npr'
      FixedChar = True
      Size = 5
    end
    object q_monthnaim_pr: TStringField
      FieldName = 'naim_pr'
      FixedChar = True
      Size = 40
    end
    object q_monthpg_gr_ordn: TIntegerField
      FieldName = 'pg_gr_ordn'
    end
    object q_monthpf_kod_gr: TStringField
      FieldName = 'pf_kod_gr'
      FixedChar = True
      Size = 5
    end
    object q_monthpf_group: TStringField
      FieldName = 'pf_group'
      FixedChar = True
      Size = 30
    end
    object q_monthnom_zd: TStringField
      FieldName = 'nom_zd'
      FixedChar = True
      Size = 12
    end
  end
  object q_plan_hist: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'pl_hist.kod_npr,'
      'grplp2.kod_pos,'
      'grplp2.kod_sgr,'
      'grplp2.kod_spg,'
      'grplp2.kod_rzd,'
      'grplp2.kod_prz,'
      'grplp2.kod_grp,'
      'grplp2.kod_pgr,'
      'grplp2.naim AS naim,'
      'SUM(t_nvpl+t_deng) AS d_ves,'
      'SUM(T_VLUK+T_VOBL+T_VZCH+T_NOSV+T_AVIZ) AS v_ves,'
      'SUM(d_nvpl+d_deng) AS d_sum,'
      'SUM(d_VLUK+d_VOBL+d_VZCH+d_NOSV+d_AVIZ) AS v_sum,'
      'kindprod.pf_ordnung,'
      'prod.kod AS kind_npr,'
      'prod.naim_pr,'
      'kindprod.pg_gr_ordn,'
      'kindprod.pf_kod_gr,'
      'kindprod.pf_group'
      'FROM'
      'kindprod,prod,'
      #39'U:\luk\DOGOVOR\PLANM\pl01_07\grplp2.dbf'#39' grplp2,'
      #39'U:\luk\DOGOVOR\PLANM\pl01_07\PL_HIS2.DBF'#39' pl_hist'
      'WHERE grplp2.kod_pos<=5  and grplp2.kod_sgr<>501'
      '  and grplp2.kod_sgr=pl_hist.kod_sgr'
      '  and grplp2.kod_spg=pl_hist.kod_spg'
      '  and grplp2.kod_rzd=pl_hist.kod_rzd'
      '  and grplp2.kod_prz=pl_hist.kod_prz'
      '  and grplp2.kod_grp=pl_hist.kod_grp'
      '  and pl_hist.num_izm>0'
      '  and pl_hist.kod_npr = prod.kod'
      '  and kindprod.kind_npr = prod.kind_npr'
      'ORDER BY 3,4,5,6,7'
      'GROUP BY  1,2,3,4,5,6,7'
      ''
      ''
      ''
      '')
    Left = 216
    Top = 384
    object q_plan_histkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_plan_histkod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_plan_histkod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_plan_histkod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_plan_histkod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_plan_histkod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_plan_histkod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_plan_histkod_pgr: TIntegerField
      FieldName = 'kod_pgr'
    end
    object q_plan_histnaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 40
    end
    object q_plan_histd_ves: TBCDField
      FieldName = 'd_ves'
      Precision = 16
      Size = 6
    end
    object q_plan_histv_ves: TBCDField
      FieldName = 'v_ves'
      Precision = 19
      Size = 6
    end
    object q_plan_histd_sum: TBCDField
      FieldName = 'd_sum'
      Precision = 16
      Size = 2
    end
    object q_plan_histv_sum: TBCDField
      FieldName = 'v_sum'
      Precision = 18
      Size = 2
    end
    object q_plan_histpf_ordnung: TIntegerField
      FieldName = 'pf_ordnung'
    end
    object q_plan_histkind_npr: TStringField
      FieldName = 'kind_npr'
      FixedChar = True
      Size = 5
    end
    object q_plan_histnaim_pr: TStringField
      FieldName = 'naim_pr'
      FixedChar = True
      Size = 40
    end
    object q_plan_histpg_gr_ordn: TIntegerField
      FieldName = 'pg_gr_ordn'
    end
    object q_plan_histpf_kod_gr: TStringField
      FieldName = 'pf_kod_gr'
      FixedChar = True
      Size = 5
    end
    object q_plan_histpf_group: TStringField
      FieldName = 'pf_group'
      FixedChar = True
      Size = 30
    end
  end
  object q_prichsum: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'ordnung,'
      'kod_npr,'
      'naim_pr,'
      'kod_pos,'
      'kod_sgr,'
      'kod_spg,'
      'kod_rzd,'
      'kod_prz,'
      'kod_grp,'
      'naim,'
      'kod_sobs,'
      'SUM(d_ves) AS d_ves,'
      'SUM(v_ves) AS v_ves,'
      'SUM(d_sum) AS d_sum,'
      'SUM(v_sum) AS v_sum,'
      'SUM(hd_ves) AS hd_ves,'
      'SUM(hv_ves) AS hv_ves,'
      'SUM(hd_sum) AS hd_sum,'
      'SUM(hv_sum) AS hv_sum,'
      'SUM(od_ves) AS od_ves,'
      'SUM(ov_ves) AS ov_ves,'
      'SUM(od_sum) AS od_sum,'
      'SUM(ov_sum) AS ov_sum,'
      'SUM(fd_ves) AS fd_ves,'
      'SUM(fv_ves) AS fv_ves,'
      'SUM(fd_sum) AS fd_sum,'
      'SUM(fv_sum) AS fv_sum,'
      'SUM(razn_tonn) AS razn_tonn,MAX(razn_dat) AS razn_dat,'
      'SUM(zayv_tonn) AS zayv_tonn,MAX(zayv_dat) AS zayv_dat,'
      'MIN(IIF(to_mos,'#39'.T.'#39','#39'.F.'#39')) AS to_mos'
      'FROM "C:\TMP\F42_SHB3.DBF"'
      'WHERE (d_ves<>0 OR v_ves<>0 OR d_sum<>0 OR v_sum<>0'
      '   OR hd_ves<>0 OR hv_ves<>0 OR hd_sum<>0 OR hv_sum<>0'
      '   OR od_ves<>0 OR ov_ves<>0 OR od_sum<>0 OR ov_sum<>0'
      '   OR fd_ves<>0 OR fv_ves<>0 OR fd_sum<>0 OR fv_sum<>0'
      '   OR zayv_tonn<>0 OR razn_tonn<>0) AND kod_pos<>0'
      'ORDER BY 1,2,5,6,7,8,9,4,11'
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11'
      ''
      '')
    Left = 229
    Top = 448
    object q_prichsumordnung: TIntegerField
      FieldName = 'ordnung'
    end
    object q_prichsumkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_prichsumnaim_pr: TStringField
      FieldName = 'naim_pr'
      FixedChar = True
      Size = 40
    end
    object q_prichsumkod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_prichsumkod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_prichsumkod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_prichsumkod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_prichsumkod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_prichsumkod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_prichsumnaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 50
    end
    object q_prichsumkod_sobs: TIntegerField
      FieldName = 'kod_sobs'
    end
    object q_prichsumd_ves: TBCDField
      FieldName = 'd_ves'
      Precision = 16
      Size = 3
    end
    object q_prichsumv_ves: TBCDField
      FieldName = 'v_ves'
      Precision = 16
      Size = 3
    end
    object q_prichsumd_sum: TBCDField
      FieldName = 'd_sum'
      Precision = 16
      Size = 0
    end
    object q_prichsumv_sum: TBCDField
      FieldName = 'v_sum'
      Precision = 16
      Size = 0
    end
    object q_prichsumhd_ves: TBCDField
      FieldName = 'hd_ves'
      Precision = 16
      Size = 3
    end
    object q_prichsumhv_ves: TBCDField
      FieldName = 'hv_ves'
      Precision = 16
      Size = 3
    end
    object q_prichsumhd_sum: TBCDField
      FieldName = 'hd_sum'
      Precision = 16
      Size = 0
    end
    object q_prichsumhv_sum: TBCDField
      FieldName = 'hv_sum'
      Precision = 16
      Size = 0
    end
    object q_prichsumfd_ves: TBCDField
      FieldName = 'fd_ves'
      Precision = 16
      Size = 3
    end
    object q_prichsumfv_ves: TBCDField
      FieldName = 'fv_ves'
      Precision = 16
      Size = 3
    end
    object q_prichsumfd_sum: TBCDField
      FieldName = 'fd_sum'
      Precision = 16
      Size = 0
    end
    object q_prichsumfv_sum: TBCDField
      FieldName = 'fv_sum'
      Precision = 16
      Size = 0
    end
    object q_prichsumzayv_tonn: TBCDField
      FieldName = 'zayv_tonn'
      Precision = 16
      Size = 3
    end
    object q_prichsumzayv_dat: TDateField
      FieldName = 'zayv_dat'
    end
    object q_prichsumto_mos: TStringField
      FieldName = 'to_mos'
      FixedChar = True
      Size = 3
    end
    object q_prichsumrazn_tonn: TBCDField
      FieldName = 'razn_tonn'
      Precision = 16
      Size = 3
    end
    object q_prichsumrazn_dat: TDateField
      FieldName = 'razn_dat'
    end
    object q_prichsumod_ves: TBCDField
      FieldName = 'od_ves'
      Precision = 16
      Size = 3
    end
    object q_prichsumov_ves: TBCDField
      FieldName = 'ov_ves'
      Precision = 16
      Size = 3
    end
    object q_prichsumod_sum: TBCDField
      FieldName = 'od_sum'
      Precision = 16
      Size = 0
    end
    object q_prichsumov_sum: TBCDField
      FieldName = 'ov_sum'
      Precision = 16
      Size = 0
    end
  end
  object q_resurs: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=DBFORPLAN_ACC'
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select * from resurs')
    Left = 13
    Top = 440
  end
  object q_JRSobstv: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=RESUR' +
      'S_ACC'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from sobstv')
    Left = 93
    Top = 384
  end
  object q_RES_GRP: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'prch_npr.kod_npr_p AS kod_npr,'
      '"'#1055#1056#1054#1048#1047#1042#1054#1044#1057#1058#1042#1054' ('#1087#1088#1086#1076#1091#1082#1090' "+TRIM(spr_sob.NAIM)+")" AS naim,'
      'resurs.kod_sgr,'
      'sum(resurs.plan) AS plan,'
      'SUM(resurs.fact) as fact,'
      'kindprod.pf_ordnung,'
      'kindprod.kind_npr,'
      'prod.naim_pr,'
      'kindprod.pg_gr_ordn,'
      'kindprod.pf_kod_gr,'
      'kindprod.pf_group,resurs.kod_sobs'
      
        'FROM "C:\TMP\F42_RESU.DBF" resurs, prod, kindprod, spr_sob, "C:\' +
        'TMP\prch_npr.DBF" prch_npr'
      'WHERE'
      '      resurs.kod_sgr<>501'
      '  and prch_npr.kod_npr_p = prod.kod'
      '  and kindprod.kind_npr = prod.kind_npr'
      '  and resurs.kod_sobs = spr_sob.kod_sob'
      '  and resurs.kod_npr = prch_npr.kod_npr_f'
      'GROUP BY 1,2,3,6,7,8'
      ''
      ' '
      ' ')
    Left = 101
    Top = 464
    object q_RES_GRPkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_RES_GRPnaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 53
    end
    object q_RES_GRPkod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_RES_GRPplan: TBCDField
      FieldName = 'plan'
      Precision = 16
      Size = 3
    end
    object q_RES_GRPfact: TBCDField
      FieldName = 'fact'
      Precision = 15
      Size = 3
    end
    object q_RES_GRPpf_ordnung: TIntegerField
      FieldName = 'pf_ordnung'
    end
    object q_RES_GRPkind_npr: TStringField
      FieldName = 'kind_npr'
      FixedChar = True
      Size = 5
    end
    object q_RES_GRPnaim_pr: TStringField
      FieldName = 'naim_pr'
      FixedChar = True
      Size = 40
    end
    object q_RES_GRPpg_gr_ordn: TIntegerField
      FieldName = 'pg_gr_ordn'
    end
    object q_RES_GRPpf_kod_gr: TStringField
      FieldName = 'pf_kod_gr'
      FixedChar = True
      Size = 5
    end
    object q_RES_GRPpf_group: TStringField
      FieldName = 'pf_group'
      FixedChar = True
      Size = 30
    end
    object q_RES_GRPkod_sobs: TBCDField
      FieldName = 'kod_sobs'
      Precision = 10
      Size = 0
    end
  end
  object q_new_prich: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'beg_date'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end
      item
        Name = 'end_date'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end>
    SQL.Strings = (
      
        'select *,IIF(to_mos,'#39'.T.'#39','#39'.F.'#39') AS to_mos_str from "c:\tmp\f42_' +
        'prch.dbf" new_prich'
      'where beg_date=:beg_date and end_date=:end_date')
    Left = 328
    Top = 384
  end
  object ds_new_prich: TDataSource
    DataSet = q_new_prich
    Left = 336
    Top = 432
  end
  object q_seek_prich: TADOQuery
    Connection = PF_Conn
    DataSource = ds_new_prich
    EnableBCD = False
    Parameters = <
      item
        Name = 'beg_date'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end
      item
        Name = 'end_date'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end>
    SQL.Strings = (
      
        'SELECT *, IIF(to_mos,'#39'.T.'#39','#39'.F.'#39') AS to_mos_str FROM "U:\LUK\DBA' +
        'SES\PRICHIN.DBF" '
      'WHERE beg_date=:beg_date '
      'AND end_date=:end_date ')
    Left = 312
    Top = 288
  end
  object q_tmp_prich: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select *, IIF(to_mos,'#39'.T.'#39','#39'.F.'#39') AS to_mos_str from "c:\tmp\pri' +
        'chin.dbf"')
    Left = 288
    Top = 448
  end
  object q_kindprod: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT DISTINCT f42.kod_npr'
      'FROM "C:\TMP\F42_SHB2.DBF" f42'
      ''
      ' '
      '')
    Left = 168
    Top = 448
  end
  object q_f42_2: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  f42.*,'
      '  IIF(f42.to_mos,'#39'.T.'#39','#39'.F.'#39') AS to_mos_str,'
      '  gr_real.naim2,'
      '  gr_real.kod_pos1,'
      '  gr_real.kod_sgr1,'
      '  gr_real.kod_spg1,'
      '  gr_real.kod_rzd1,'
      '  gr_real.kod_prz1,'
      '  gr_real.kod_grp1,'
      '  gr_real.kod_pgr1'
      
        'FROM "C:\TMP\F42_SHB2.DBF" f42,"U:\LUK\DOGOVOR\PLANM\DBF\gr_real' +
        '.DBF" gr_real'
      'WHERE f42.kod_pos = gr_real.kod_pos'
      '  AND f42.kod_sgr = gr_real.kod_sgr'
      '  AND f42.kod_spg = gr_real.kod_spg'
      '  AND f42.kod_rzd = gr_real.kod_rzd'
      '  AND f42.kod_prz = gr_real.kod_prz'
      '  AND f42.kod_grp = gr_real.kod_grp'
      '')
    Left = 252
    Top = 285
    object q_f42_2to_mos: TBooleanField
      FieldName = 'to_mos'
    end
    object q_f42_2ordnung: TIntegerField
      FieldName = 'ordnung'
    end
    object q_f42_2kod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_f42_2naim_pr: TStringField
      FieldName = 'naim_pr'
      FixedChar = True
      Size = 40
    end
    object q_f42_2kod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_f42_2kod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_f42_2kod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_f42_2kod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_f42_2kod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_f42_2kod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_f42_2naim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 50
    end
    object q_f42_2kod_sobs: TIntegerField
      FieldName = 'kod_sobs'
    end
    object q_f42_2d_ves: TBCDField
      FieldName = 'd_ves'
      Precision = 15
      Size = 3
    end
    object q_f42_2v_ves: TBCDField
      FieldName = 'v_ves'
      Precision = 15
      Size = 3
    end
    object q_f42_2d_sum: TBCDField
      FieldName = 'd_sum'
      Precision = 15
      Size = 0
    end
    object q_f42_2v_sum: TBCDField
      FieldName = 'v_sum'
      Precision = 15
      Size = 0
    end
    object q_f42_2hd_ves: TBCDField
      FieldName = 'hd_ves'
      Precision = 15
      Size = 3
    end
    object q_f42_2hv_ves: TBCDField
      FieldName = 'hv_ves'
      Precision = 15
      Size = 3
    end
    object q_f42_2hd_sum: TBCDField
      FieldName = 'hd_sum'
      Precision = 15
      Size = 0
    end
    object q_f42_2hv_sum: TBCDField
      FieldName = 'hv_sum'
      Precision = 15
      Size = 0
    end
    object q_f42_2fd_ves: TBCDField
      FieldName = 'fd_ves'
      Precision = 15
      Size = 3
    end
    object q_f42_2fv_ves: TBCDField
      FieldName = 'fv_ves'
      Precision = 15
      Size = 3
    end
    object q_f42_2fd_sum: TBCDField
      FieldName = 'fd_sum'
      Precision = 15
      Size = 0
    end
    object q_f42_2fv_sum: TBCDField
      FieldName = 'fv_sum'
      Precision = 15
      Size = 0
    end
    object q_f42_2zayv_tonn: TBCDField
      FieldName = 'zayv_tonn'
      Precision = 10
      Size = 3
    end
    object q_f42_2zayv_dat: TDateField
      FieldName = 'zayv_dat'
    end
    object q_f42_2to_mos_str: TStringField
      FieldName = 'to_mos_str'
      FixedChar = True
      Size = 3
    end
    object q_f42_2naim2: TStringField
      FieldName = 'naim2'
      FixedChar = True
      Size = 40
    end
    object q_f42_2kod_pos1: TIntegerField
      FieldName = 'kod_pos1'
    end
    object q_f42_2kod_sgr1: TIntegerField
      FieldName = 'kod_sgr1'
    end
    object q_f42_2kod_spg1: TIntegerField
      FieldName = 'kod_spg1'
    end
    object q_f42_2kod_rzd1: TIntegerField
      FieldName = 'kod_rzd1'
    end
    object q_f42_2kod_prz1: TIntegerField
      FieldName = 'kod_prz1'
    end
    object q_f42_2kod_grp1: TIntegerField
      FieldName = 'kod_grp1'
    end
    object q_f42_2kod_pgr1: TIntegerField
      FieldName = 'kod_pgr1'
    end
    object q_f42_2razn_tonn: TBCDField
      FieldName = 'razn_tonn'
      Precision = 10
      Size = 3
    end
    object q_f42_2razn_dat: TDateField
      FieldName = 'razn_dat'
    end
    object q_f42_2od_ves: TBCDField
      FieldName = 'od_ves'
      Precision = 15
      Size = 3
    end
    object q_f42_2ov_ves: TBCDField
      FieldName = 'ov_ves'
      Precision = 15
      Size = 3
    end
    object q_f42_2od_sum: TBCDField
      FieldName = 'od_sum'
      Precision = 15
      Size = 0
    end
    object q_f42_2ov_sum: TBCDField
      FieldName = 'ov_sum'
      Precision = 15
      Size = 0
    end
  end
  object q_f42: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'kod_npr,'
      'kod_pos,'
      'kod_sgr,'
      'kod_spg,'
      'kod_rzd,'
      'kod_prz,'
      'kod_grp,'
      'naim_pr,'
      'naim,'
      'ordnung,'
      'MIN(IIF(to_mos,'#39'.T.'#39','#39'.F.'#39')) AS to_mos,'
      'SUM(fd_ves) AS fd_ves,'
      'SUM(fv_ves) AS fv_ves,'
      'SUM(fd_sum) AS fd_sum,'
      'SUM(fv_sum) AS fv_sum,'
      'SUM(od_ves) AS od_ves,'
      'SUM(ov_ves) AS ov_ves,'
      'SUM(od_sum) AS od_sum,'
      'SUM(ov_sum) AS ov_sum,'
      'SUM(razn_tonn) AS razn_tonn, MAX(razn_dat) AS razn_dat,'
      'SUM(zayv_tonn) AS zayv_tonn, MAX(zayv_dat) AS zayv_dat'
      'FROM "C:\TMP\F42_SHB2.DBF"'
      'WHERE kod_pos=2'
      'GROUP BY  1,2,3,4,5,6,7,8'
      'ORDER BY 3,4,5,6,7,8,9'
      ''
      '')
    Left = 248
    Top = 328
    object q_f42kod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_f42kod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_f42kod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_f42kod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_f42kod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_f42kod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_f42kod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_f42naim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 50
    end
    object q_f42ordnung: TIntegerField
      FieldName = 'ordnung'
    end
    object q_f42naim_pr: TStringField
      FieldName = 'naim_pr'
      FixedChar = True
      Size = 40
    end
    object q_f42to_mos: TStringField
      FieldName = 'to_mos'
      FixedChar = True
      Size = 3
    end
    object q_f42fd_ves: TBCDField
      FieldName = 'fd_ves'
      Precision = 16
      Size = 3
    end
    object q_f42fv_ves: TBCDField
      FieldName = 'fv_ves'
      Precision = 16
      Size = 3
    end
    object q_f42fd_sum: TBCDField
      FieldName = 'fd_sum'
      Precision = 16
      Size = 0
    end
    object q_f42fv_sum: TBCDField
      FieldName = 'fv_sum'
      Precision = 16
      Size = 0
    end
    object q_f42zayv_tonn: TBCDField
      FieldName = 'zayv_tonn'
      Precision = 16
      Size = 3
    end
    object q_f42zayv_dat: TDateField
      FieldName = 'zayv_dat'
    end
    object q_f42razn_tonn: TBCDField
      FieldName = 'razn_tonn'
      Precision = 16
      Size = 3
    end
    object q_f42razn_dat: TDateField
      FieldName = 'razn_dat'
    end
    object q_f42od_ves: TBCDField
      FieldName = 'od_ves'
      Precision = 16
      Size = 3
    end
    object q_f42ov_ves: TBCDField
      FieldName = 'ov_ves'
      Precision = 16
      Size = 3
    end
    object q_f42od_sum: TBCDField
      FieldName = 'od_sum'
      Precision = 16
      Size = 0
    end
    object q_f42ov_sum: TBCDField
      FieldName = 'ov_sum'
      Precision = 16
      Size = 0
    end
  end
  object q_npr: TADOQuery
    Connection = PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM '#39'C:\TMP\prch_np1.DBF'#39
      'GROUP BY 1,2'
      ''
      ' '
      ''
      ' ')
    Left = 128
    Top = 429
  end
  object q_DateUpdate: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=DBFORPLAN_ACC'
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select * from resurs')
    Left = 61
    Top = 448
  end
  object q_obpr: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'PLAN_POST.PROD_ID_NPR as kod_npr,'
      'KLS_PLANSTRU.LEVEL_POS as kod_pos,'
      'KLS_PLANSTRU.kod_sgr,'
      'KLS_PLANSTRU.kod_spg,'
      'KLS_PLANSTRU.kod_rzd,'
      'KLS_PLANSTRU.kod_prz,'
      'KLS_PLANSTRU.kod_grp,'
      'KLS_PLANSTRU.kod_pgr,'
      'KLS_PLANSTRU.NAME AS naim,'
      'SUM(PLAN_POST.PLAN_VES) AS d_ves,'
      '0 AS v_ves,'
      'SUM(PLAN_POST.PLAN_CENA*PLAN_POST.PLAN_VES) AS d_sum,'
      '0 AS v_sum,'
      'KLS_PROD_PLAN.ORDER_NPR as pf_ordnung,'
      'KLS_PROD.ID_NPR AS kind_npr,'
      'KLS_PROD.NAME_NPR as naim_pr,'
      'PARENT_PROD_PLAN.ORDER_NPR as pg_gr_ordn,'
      
        'DECODE(KLS_PROD_PLAN.PARENT_ID,NULL,'#39#39',TO_CHAR(KLS_PROD_PLAN.PAR' +
        'ENT_ID-100000)) as pf_kod_gr,'
      'PARENT_PROD_PLAN.NAME_NPR as pf_group'
      'FROM'
      
        'PLAN_POST, PLAN_PERIODS, KLS_PLANSTRU, KLS_PROD, KLS_PROD_PLAN, ' +
        'KLS_PROD_PLAN PARENT_PROD_PLAN'
      'WHERE KLS_PLANSTRU.LEVEL_POS<=5'
      '  AND KLS_PLANSTRU.kod_sgr<>501'
      '  and PLAN_POST.PLANSTRU_ID=KLS_PLANSTRU.ID'
      '  AND PLAN_POST.PLAN_ID=3'
      '  AND PLAN_POST.PLAN_PER_ID=PLAN_PERIODS.ID'
      '  AND PLAN_PERIODS.DATE_PLAN=TO_DATE('#39'01.12.2003'#39','#39'dd.mm.yyyy'#39')'
      '  AND PLAN_POST.PROD_ID_NPR = KLS_PROD.ID_NPR'
      '  AND KLS_PROD.PROD_PLAN_ID=KLS_PROD_PLAN.ID'
      '  AND KLS_PROD_PLAN.PARENT_ID=PARENT_PROD_PLAN.ID(+)'
      'GROUP BY'
      '  PLAN_POST.PROD_ID_NPR,'
      '  KLS_PLANSTRU.LEVEL_POS,'
      '  KLS_PLANSTRU.kod_sgr,'
      '  KLS_PLANSTRU.kod_spg,'
      '  KLS_PLANSTRU.kod_rzd,'
      '  KLS_PLANSTRU.kod_prz,'
      '  KLS_PLANSTRU.kod_grp,'
      '  KLS_PLANSTRU.kod_pgr,'
      '  KLS_PLANSTRU.NAME,'
      '  KLS_PROD_PLAN.ORDER_NPR,'
      '  KLS_PROD.ID_NPR,'
      '  KLS_PROD.NAME_NPR,'
      '  PARENT_PROD_PLAN.ORDER_NPR,'
      
        '  DECODE(KLS_PROD_PLAN.PARENT_ID,NULL,'#39#39',TO_CHAR(KLS_PROD_PLAN.P' +
        'ARENT_ID-100000)),'
      '  PARENT_PROD_PLAN.NAME_NPR'
      'ORDER BY '
      '  KLS_PLANSTRU.kod_sgr,'
      '  KLS_PLANSTRU.kod_spg,'
      '  KLS_PLANSTRU.kod_rzd,'
      '  KLS_PLANSTRU.kod_prz,'
      '  KLS_PLANSTRU.kod_grp,'
      '  KLS_PLANSTRU.kod_pgr,'
      '  KLS_PLANSTRU.NAME')
    QBEDefinition.QBEFieldDefs = {
      0300000013000000070000004B4F445F4E50520100000000070000004B4F445F
      504F530100000000070000004B4F445F5347520100000000070000004B4F445F
      5350470100000000070000004B4F445F525A440100000000070000004B4F445F
      50525A0100000000070000004B4F445F4752500100000000070000004B4F445F
      5047520100000000040000004E41494D010000000005000000445F5645530100
      00000005000000565F564553010000000005000000445F53554D010000000005
      000000565F53554D01000000000A00000050465F4F52444E554E470100000000
      080000004B494E445F4E50520100000000070000004E41494D5F505201000000
      000A00000050475F47525F4F52444E01000000000900000050465F4B4F445F47
      5201000000000800000050465F47524F55500100000000}
    Session = f_main.ora_Session
    Left = 320
    Top = 224
    object q_obprKOD_NPR: TStringField
      FieldName = 'KOD_NPR'
      Required = True
      Size = 5
    end
    object q_obprKOD_POS: TIntegerField
      FieldName = 'KOD_POS'
      Required = True
    end
    object q_obprKOD_SGR: TIntegerField
      FieldName = 'KOD_SGR'
      Required = True
    end
    object q_obprKOD_SPG: TIntegerField
      FieldName = 'KOD_SPG'
      Required = True
    end
    object q_obprKOD_RZD: TIntegerField
      FieldName = 'KOD_RZD'
      Required = True
    end
    object q_obprKOD_PRZ: TIntegerField
      FieldName = 'KOD_PRZ'
      Required = True
    end
    object q_obprKOD_GRP: TIntegerField
      FieldName = 'KOD_GRP'
      Required = True
    end
    object q_obprKOD_PGR: TIntegerField
      FieldName = 'KOD_PGR'
      Required = True
    end
    object q_obprNAIM: TStringField
      FieldName = 'NAIM'
      Required = True
      Size = 50
    end
    object q_obprD_VES: TFloatField
      FieldName = 'D_VES'
    end
    object q_obprV_VES: TFloatField
      FieldName = 'V_VES'
    end
    object q_obprD_SUM: TFloatField
      FieldName = 'D_SUM'
    end
    object q_obprV_SUM: TFloatField
      FieldName = 'V_SUM'
    end
    object q_obprPF_ORDNUNG: TIntegerField
      FieldName = 'PF_ORDNUNG'
      Required = True
    end
    object q_obprKIND_NPR: TStringField
      FieldName = 'KIND_NPR'
      Required = True
      Size = 5
    end
    object q_obprNAIM_PR: TStringField
      FieldName = 'NAIM_PR'
      Required = True
      Size = 40
    end
    object q_obprPG_GR_ORDN: TIntegerField
      FieldName = 'PG_GR_ORDN'
    end
    object q_obprPF_KOD_GR: TStringField
      FieldName = 'PF_KOD_GR'
      Size = 40
    end
    object q_obprPF_GROUP: TStringField
      FieldName = 'PF_GROUP'
      Size = 30
    end
  end
end
