object f_f42: Tf_f42
  Left = 276
  Top = 186
  BorderStyle = bsDialog
  Caption = #1055#1083#1072#1085'-'#1092#1072#1082#1090' '#1087#1086#1089#1090#1072#1074#1086#1082' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
  ClientHeight = 280
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 5
    Top = 25
    Width = 363
    Height = 166
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
    end
    object e_time: TDateTimePicker
      Left = 247
      Top = 134
      Width = 81
      Height = 21
      Date = 36685.250000000000000000
      Time = 36685.250000000000000000
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
  end
  object BitBtn1: TBitBtn
    Left = 4
    Top = 230
    Width = 93
    Height = 27
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
      00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
      00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
      F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
      FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
      0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
      0033333337FFFFFF773333333000000003333333377777777333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 274
    Top = 230
    Width = 96
    Height = 25
    Caption = #1055#1083#1072#1085'-'#1060#1072#1082#1090' DBF'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 101
    Top = 230
    Width = 93
    Height = 25
    Caption = #1054#1090#1095#1077#1090' XLS'
    TabOrder = 3
    OnClick = BitBtn3Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000D80E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
      222200000000000022000FFFFFFFFFF020000FFFFFFF000080020FFFFFF08778
      08220FFFFF0877E880220FFFFF07777870220FFFFF07E77870220FFFFF08EE78
      80220FFFFFF0877802220FFFFFFF000022220FFFFFFFFFF022220FFFFFFF0000
      22220FFFFFFF070222220FFFFFFF002222220000000002222222}
  end
  object pbar: TProgressBar
    Left = 8
    Top = 262
    Width = 361
    Height = 16
    TabOrder = 4
    Visible = False
  end
  object cb_FullPlan: TCheckBox
    Left = 8
    Top = 193
    Width = 353
    Height = 17
    Caption = #1055#1086#1083#1085#1072#1103' '#1089#1090#1088#1091#1082#1090#1091#1088#1072' '#1087#1083#1072#1085#1072' ('#1076#1072#1078#1077' '#1089' '#1085#1091#1083#1103#1084#1080')'
    TabOrder = 5
  end
  object cb_OnlyPlanSNP: TCheckBox
    Left = 8
    Top = 209
    Width = 353
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1086' '#1087#1083#1072#1085' '#1054#1054#1054' "'#1051#1059#1050#1054#1049#1051'-'#1057#1077#1074#1077#1088#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090'"'
    TabOrder = 6
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 372
    Height = 23
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      TabOrder = 0
      object bt_pfLukoil: TTBItem
        AutoCheck = True
        Caption = #1055#1083#1072#1085'-'#1092#1072#1082#1090' '#1054#1040#1054' "'#1051#1059#1050#1054#1049#1051'"'
        Checked = True
        GroupIndex = 1
      end
      object bt_PFOutsiders: TTBItem
        AutoCheck = True
        Caption = #1055#1083#1072#1085'-'#1092#1072#1082#1090' ('#1074#1085#1077#1096#1085#1080#1077' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1080')'
        GroupIndex = 1
      end
    end
  end
  object btPLNP: TBitBtn
    Left = 198
    Top = 230
    Width = 72
    Height = 25
    Caption = #1055#1083#1072#1085' DBF'
    TabOrder = 8
    OnClick = btPLNPClick
  end
  object ds_plan: TDataSource
    DataSet = q_plan
    Left = 536
    Top = 226
  end
  object q_plan: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_planBeforeOpen
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
      'SUM(d_VLUK+d_VOBL+d_VZCH+d_NOSV+d_AVIZ) AS v_sum'
      'FROM'
      #39'U:\luk\DOGOVOR\PLANM\DBF\gr_real.dbf'#39' grplp2,'
      #39'U:\luk\DOGOVOR\PLANM\pl00_07\PL_MOS2.DBF'#39' pl_mos2'
      'WHERE grplp2.kod_pos<=5  and grplp2.kod_sgr<>501'
      '  and grplp2.kod_sgr=pl_mos2.kod_sgr'
      '  and grplp2.kod_spg=pl_mos2.kod_spg'
      '  and grplp2.kod_rzd=pl_mos2.kod_rzd'
      '  and grplp2.kod_prz=pl_mos2.kod_prz'
      '  and grplp2.kod_grp=pl_mos2.kod_grp'
      'ORDER BY 3,4,5,6,7'
      'GROUP BY  1,2,3,4,5,6,7'
      ''
      ' '
      ' '
      ' ')
    Left = 536
    Top = 122
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
  end
  object q_fact_plat: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_fact_platBeforeOpen
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
        '0.00)) AS v_sum'
      'FROM month,OUT_PLAT'
      'WHERE'
      '  month.nom_zd=OUT_PLAT.nom_zd AND month.kod_sgr<>501 and'
      '  OUT_PLAT.data_kvit BETWEEN {09/01/2000} AND {09/01/2000}'
      'GROUP BY 1,3,4,5,6,7'
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
      'sum(0) AS v_sum'
      'FROM month,kvit'
      'WHERE'
      '  month.nom_zd=kvit.nom_zd AND'
      '  (kvit.kod_otgr=5 or kvit.kod_otgr=8) and'
      '  kvit.date_kvit BETWEEN {09/01/2000} AND {09/01/2000}'
      'GROUP BY 1,3,4,5,6,7'
      ' '
      '')
    Left = 600
    Top = 75
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
    object q_fact_platd_ves: TBCDField
      FieldName = 'd_ves'
      Precision = 16
      Size = 3
    end
    object q_fact_platv_ves: TBCDField
      FieldName = 'v_ves'
      Precision = 16
      Size = 3
    end
    object q_fact_platd_sum: TBCDField
      FieldName = 'd_sum'
      Precision = 16
      Size = 2
    end
    object q_fact_platv_sum: TBCDField
      FieldName = 'v_sum'
      Precision = 16
      Size = 2
    end
  end
  object q_cmn: TADOQuery
    Connection = ADOConnection1
    BeforeOpen = q_cmnBeforeOpen
    Parameters = <>
    Left = 536
    Top = 174
  end
  object q_cmn2: TADOQuery
    Connection = ADOConnection1
    BeforeOpen = q_cmn2BeforeOpen
    Parameters = <>
    Left = 600
    Top = 174
  end
  object q_grplp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_grplpBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM'
      '"U:\luk\DOGOVOR\PLANM\DBF\gr_real.DBF" gr_real')
    Left = 460
    Top = 122
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=pf;Mode=ReadWrite;Extended Properties="DSN=pf;UID=;PWD=;So' +
      'urceDB=u:\luk\dbases;SourceType=DBF;Exclusive=No;BackgroundFetch' +
      '=Yes;Collate=RUSSIAN;Null=Yes;Deleted=Yes;"'
    CursorLocation = clUseServer
    DefaultDatabase = 'u:\luk\dbases'
    LoginPrompt = False
    Mode = cmReadWrite
    BeforeConnect = ADOConnection1BeforeConnect
    Left = 400
    Top = 226
  end
  object q_plansum: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_plansumBeforeOpen
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
      'SUM(v_sum) AS v_sum,'
      'SUM(od_ves) AS od_ves,'
      'SUM(ov_ves) AS ov_ves,'
      'SUM(od_sum) AS od_sum,'
      'SUM(ov_sum) AS ov_sum'
      'FROM'
      '"C:\TMP\F42_SHBL.DBF"'
      'ORDER BY 3,4,5,6,7'
      'GROUP BY  1,2,3,4,5,6,7'
      ' ')
    Left = 460
    Top = 75
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
    object q_plansumod_ves: TBCDField
      FieldName = 'od_ves'
      Precision = 16
      Size = 3
    end
    object q_plansumov_ves: TBCDField
      FieldName = 'ov_ves'
      Precision = 16
      Size = 3
    end
    object q_plansumod_sum: TBCDField
      FieldName = 'od_sum'
      Precision = 16
      Size = 0
    end
    object q_plansumov_sum: TBCDField
      FieldName = 'ov_sum'
      Precision = 16
      Size = 0
    end
  end
  object q_f42: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_f42BeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM "c:\tmp\f42_pln1.dbf" '
      'WHERE kod_pos=1')
    Left = 600
    Top = 122
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
    object q_f42d_ves: TBCDField
      FieldName = 'd_ves'
      Precision = 15
      Size = 3
    end
    object q_f42v_ves: TBCDField
      FieldName = 'v_ves'
      Precision = 15
      Size = 3
    end
    object q_f42d_sum: TBCDField
      FieldName = 'd_sum'
      Precision = 15
      Size = 0
    end
    object q_f42v_sum: TBCDField
      FieldName = 'v_sum'
      Precision = 15
      Size = 0
    end
    object q_f42fd_ves: TBCDField
      FieldName = 'fd_ves'
      Precision = 15
      Size = 3
    end
    object q_f42fv_ves: TBCDField
      FieldName = 'fv_ves'
      Precision = 15
      Size = 3
    end
    object q_f42fd_sum: TBCDField
      FieldName = 'fd_sum'
      Precision = 15
      Size = 0
    end
    object q_f42fv_sum: TBCDField
      FieldName = 'fv_sum'
      Precision = 15
      Size = 0
    end
    object q_f42zayv_tonn: TBCDField
      FieldName = 'zayv_tonn'
      Precision = 10
      Size = 3
    end
    object q_f42zayv_dat: TDateField
      FieldName = 'zayv_dat'
    end
    object q_f42od_ves: TBCDField
      FieldName = 'od_ves'
      Precision = 15
      Size = 3
    end
    object q_f42ov_ves: TBCDField
      FieldName = 'ov_ves'
      Precision = 15
      Size = 3
    end
    object q_f42od_sum: TBCDField
      FieldName = 'od_sum'
      Precision = 15
      Size = 0
    end
    object q_f42ov_sum: TBCDField
      FieldName = 'ov_sum'
      Precision = 15
      Size = 0
    end
  end
  object q_fact_otgr: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_fact_otgrBeforeOpen
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
        'ves,0.00)) AS v_sum'
      'FROM '#39'U:\luk\OTGR\OPERDATA\REESTR.DBF'#39' kvit,month'
      'WHERE'
      '  month.nom_zd=kvit.nom_zd AND month.kod_sgr<>501 and'
      '  kvit.date_otgr BETWEEN {09/01/2000} AND {09/01/2000}'
      'GROUP BY 1,3,4,5,6,7'
      ''
      ' ')
    Left = 600
    Top = 227
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
  end
  object q_pryam: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_pryamBeforeOpen
    Parameters = <>
    SQL.Strings = (
      
        'SELECT month.kod_plat,kvit.kod_npr,SUM(kvit.ves*1000) AS ves,SUM' +
        '(Round(kvit.ves*1000*month.cena_otp,0)) AS sum'
      'FROM '#39'u:\luk\otgr\operdata\reestr.dbf'#39' kvit,month'
      'WHERE'
      '  month.date_plan={06/01/2000}'
      
        '  AND ((month.kod_sgr=20) or (month.kod_sgr in (90,91) and month' +
        '.kod_spg=10))'
      '  AND month.nom_zd=kvit.nom_zd'
      '  AND kvit.date_otgr={06/07/2000}'
      'GROUP BY 1,2'
      '')
    Left = 664
    Top = 122
    object q_pryamkod_plat: TIntegerField
      FieldName = 'kod_plat'
    end
    object q_pryamkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_pryamves: TBCDField
      FieldName = 'ves'
      Precision = 17
      Size = 3
    end
    object q_pryamsum: TBCDField
      FieldName = 'sum'
      Precision = 20
      Size = 0
    end
  end
  object q_pf_dbf: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_pf_dbfBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      
        '  str(f42_plan.KOD_SGR,3)+IIF(f42_plan.kod_sgr=90 and f42_plan.k' +
        'od_spg=10,'#39'999'#39',str(f42_plan.KOD_SPG,3))+str(f42_plan.KOD_rzd,3)' +
        '+str(f42_plan.KOD_PRZ,3)+str(f42_plan.KOD_GRP,3) AS kod_plan,gr_' +
        'real.lukoil_id,f42_plan.kod_pos,'
      '  F42_PLAN.NAIM AS naim_plan,'
      '  PROD.KOD_10,'
      '  Sum(D_VES*1000) AS plan_d,'
      '  Sum(0) AS plan_v,'
      '  Sum(V_VES*1000) AS plan_vz,'
      '  Sum(D_SUM) AS splan_d,'
      '  Sum(0) AS splan_v,'
      '  Sum(V_SUM) AS splan_vz,'
      '  Sum(FD_VES*1000) AS fact_d,'
      '  Sum(0) AS fact_v,'
      '  Sum(FV_VES*1000) AS fact_vz,'
      '  Sum(FD_SUM) AS sfact_d,'
      '  Sum(0) AS sfact_v,'
      '  Sum(FV_SUM) AS sfact_vz'
      
        'FROM '#39'c:\tmp\F42_PLAN'#39' F42_PLAN,PROD,KINDPROD,'#39'U:\LUK\DOGOVOR\PL' +
        'ANM\DBF\gr_real.dbf'#39' gr_real'
      
        'WHERE F42_PLAN.KOD_NPR = PROD.KOD AND F42_PLAN.KOD_SGR<>101 AND ' +
        'F42_PLAN.KOD_SGR<>103 AND PROD.KIND_NPR=KINDPROD.KIND_NPR'
      
        '  AND F42_PLAN.KOD_NPR <> '#39'10008'#39' AND F42_PLAN.KOD_NPR <> '#39'90000' +
        #39' AND F42_PLAN.KOD_SGR = gr_real.KOD_SGR AND F42_PLAN.KOD_SPG = ' +
        'gr_real.KOD_SPG AND F42_PLAN.KOD_RZD = gr_real.KOD_RZD AND F42_P' +
        'LAN.KOD_PRZ = gr_real.KOD_PRZ AND F42_PLAN.KOD_GRP = gr_real.KOD' +
        '_GRP'
      'GROUP BY 1,2,3,4,5'
      'HAVING (plan_d+plan_v+plan_vz+fact_d+fact_v+fact_vz<>0)'
      'UNION ALL'
      'SELECT'
      
        '  str(f42_plan.KOD_SGR,3)+IIF(f42_plan.kod_sgr=90 and f42_plan.k' +
        'od_spg=10,'#39'999'#39',str(f42_plan.KOD_SPG,3))+str(f42_plan.KOD_rzd,3)' +
        '+str(f42_plan.KOD_PRZ,3)+str(f42_plan.KOD_GRP,3) AS kod_plan,gr_' +
        'real.lukoil_id,f42_plan.kod_pos,'
      '  F42_PLAN.NAIM AS naim_plan,'
      '  PROD.KOD_10,'
      '  Sum(0) AS plan_d,'
      '  Sum(0) AS plan_v,'
      '  Sum(0) AS plan_vz,'
      '  Sum(0) AS splan_d,'
      '  Sum(0) AS splan_v,'
      '  Sum(0) AS splan_vz,'
      '  Sum(0) AS fact_d,'
      '  Sum(0) AS fact_v,'
      '  Sum(0) AS fact_vz,'
      '  Sum(F42_PLAN.FD_SUM) AS sfact_d,'
      '  Sum(0) AS sfact_v,'
      '  Sum(F42_PLAN.FV_SUM) AS sfact_vz'
      
        'FROM '#39'c:\tmp\F42_PLAN'#39' F42_PLAN,PROD,'#39'U:\LUK\DOGOVOR\PLANM\DBF\g' +
        'r_real.dbf'#39' gr_real'
      
        'WHERE F42_PLAN.KOD_NPR = PROD.KOD AND F42_PLAN.KOD_SGR<>101 AND ' +
        'F42_PLAN.KOD_SGR<>103'
      
        '  AND F42_PLAN.KOD_NPR = '#39'10008'#39' AND F42_PLAN.KOD_NPR <> '#39'90000'#39 +
        ' AND F42_PLAN.KOD_SGR = gr_real.KOD_SGR AND F42_PLAN.KOD_SPG = g' +
        'r_real.KOD_SPG AND F42_PLAN.KOD_RZD = gr_real.KOD_RZD AND F42_PL' +
        'AN.KOD_PRZ = gr_real.KOD_PRZ AND F42_PLAN.KOD_GRP = gr_real.KOD_' +
        'GRP'
      'GROUP BY 1,2,3,4,5'
      'ORDER By 1,2,3,4,5')
    Left = 664
    Top = 226
  end
  object q_acc: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=pf_acc;Mode=ReadWrite'
    BeforeOpen = q_accBeforeOpen
    Parameters = <>
    Left = 153
    Top = 72
  end
  object q_pryam_sf: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_pryam_sfBeforeOpen
    Parameters = <>
    SQL.Strings = (
      
        'SELECT month.kod_plat,out_plat.kod_nfp AS kod_npr,SUM(out_plat.v' +
        'es*1000) AS ves,SUM(Round(out_plat.summa_dok,0)) AS sum'
      'FROM out_plat,month'
      'WHERE'
      
        '   ((month.kod_sgr=20) or (month.kod_sgr in (90,91) and month.ko' +
        'd_spg=10))'
      '  AND out_plat.nom_zd=month.nom_zd'
      '  AND out_plat.data_buxg={06/07/2000}'
      'GROUP BY 1,2'
      ' '
      ' '
      ' ')
    Left = 664
    Top = 74
    object q_pryam_sfkod_plat: TIntegerField
      FieldName = 'kod_plat'
    end
    object q_pryam_sfkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_pryam_sfves: TBCDField
      FieldName = 'ves'
      Precision = 16
      Size = 3
    end
    object q_pryam_sfsum: TBCDField
      FieldName = 'sum'
      Precision = 16
      Size = 0
    end
  end
  object q_fullplan: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_fullplanBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'prod.kod AS kod_npr,'
      'gr_real.kod_pos,'
      'gr_real.kod_sgr,'
      'gr_real.kod_spg,'
      'gr_real.kod_rzd,'
      'gr_real.kod_prz,'
      'gr_real.kod_grp,'
      'gr_real.kod_pgr,'
      'gr_real.naim AS naim'
      'FROM'
      #39'U:\luk\DOGOVOR\PLANM\DBF\gr_real.dbf'#39' gr_real,'
      #39'U:\luk\DBASES\prod.dbf'#39' prod'
      'WHERE prod.kod_gr<>'#39'10000'#39
      ''
      ' '
      ' '
      ' ')
    Left = 400
    Top = 174
    object q_fullplankod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_fullplankod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_fullplankod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_fullplankod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_fullplankod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_fullplankod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_fullplankod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_fullplankod_pgr: TIntegerField
      FieldName = 'kod_pgr'
    end
    object q_fullplannaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 40
    end
  end
  object q_sev_np_sf: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_sev_np_sfBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  out_plat.kod_nfp AS kod_npr,'
      '  month.kod_pos,month.kod_sgr,'
      '  month.kod_spg,'
      '  month.kod_rzd,'
      '  month.kod_prz,'
      '  month.kod_grp,'
      '  month.kod_pgr,month.naim_p AS naim,'
      '  luk_dog.num_dog AS luk_dog_id,'
      '  luk_dog.kod_plat AS luk_plt_id,'
      '  month.n_dog AS snp_dog_id,'
      '  month.kod_plat AS snp_plt_id,'
      '  SUM(out_plat.ves*1000) AS ves,'
      '  SUM(Round(out_plat.summa_dok,0)) AS sum'
      'FROM "U:\LUK\TMP\OUT_PLAT.dbf" out_plat,month,dog,dog luk_dog'
      'WHERE'
      '  out_plat.data_buxg={06/07/2000}'
      '  AND month.nom_zd=out_plat.nom_zd'
      '  AND month.n_dog = dog.num_dog'
      '  AND dog.num_dog2 = luk_dog.num_dog'
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13'
      'UNION ALL'
      'SELECT'
      '  out_plat.kod_nfp AS kod_npr,'
      '  month.kod_pos,month.kod_sgr,'
      '  month.kod_spg,'
      '  month.kod_rzd,'
      '  month.kod_prz,'
      '  month.kod_grp,'
      '  month.kod_pgr,month.naim_p AS naim,'
      '  month.n_dog AS luk_dog_id,'
      '  month.kod_plat AS luk_plt_id,'
      '  month.n_dog2 AS snp_dog_id,'
      '  month.kod_plat2 AS snp_plt_id,'
      '  SUM(out_plat.ves*1000) AS ves,'
      '  SUM(Round(out_plat.summa_dok,0)) AS sum'
      'FROM "U:\LUK\TMP\OUT_PLAT.dbf" out_plat,month,dog'
      'WHERE'
      '  out_plat.data_buxg={06/07/2000}'
      '  AND month.nom_zd=out_plat.nom_zd'
      '  AND month.n_dog = dog.num_dog'
      '  AND dog.num_dog2 = '#39#39
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13')
    Left = 536
    Top = 75
    object q_sev_np_sfkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_sev_np_sfves: TBCDField
      FieldName = 'ves'
      Precision = 16
      Size = 3
    end
    object q_sev_np_sfsum: TBCDField
      FieldName = 'sum'
      Precision = 16
      Size = 0
    end
    object q_sev_np_sfkod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_sev_np_sfkod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_sev_np_sfkod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_sev_np_sfkod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_sev_np_sfkod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_sev_np_sfkod_pgr: TIntegerField
      FieldName = 'kod_pgr'
    end
    object q_sev_np_sfluk_dog_id: TStringField
      FieldName = 'luk_dog_id'
      FixedChar = True
      Size = 10
    end
    object q_sev_np_sfluk_plt_id: TIntegerField
      FieldName = 'luk_plt_id'
    end
    object q_sev_np_sfsnp_dog_id: TStringField
      FieldName = 'snp_dog_id'
      FixedChar = True
      Size = 10
    end
    object q_sev_np_sfsnp_plt_id: TIntegerField
      FieldName = 'snp_plt_id'
    end
    object q_sev_np_sfnaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 30
    end
    object q_sev_np_sfkod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
  end
  object q_sev_np: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_sev_npBeforeOpen
    Parameters = <>
    SQL.Strings = (
      ' SELECT'
      '  kvit.kod_npr,'
      '  month.kod_pos,month.kod_sgr,'
      '  month.kod_spg,'
      '  month.kod_rzd,'
      '  month.kod_prz,'
      '  month.kod_grp,'
      '  month.kod_pgr, month.naim_p AS naim,'
      '  luk_dog.num_dog AS luk_dog_id,'
      '  luk_dog.kod_plat AS luk_plt_id,'
      '  month.n_dog AS snp_dog_id,'
      '  month.kod_plat AS snp_plt_id,'
      '  SUM(kvit.ves*1000) AS ves,'
      '  SUM(Round(kvit.ves*1000*month.cena_otp,0)) AS sum'
      
        'FROM '#39'u:\luk\otgr\operdata\reestr.dbf'#39' kvit,month,dog,dog luk_do' +
        'g'
      'WHERE'
      '  month.date_plan={02/01/2002}'
      '  AND kvit.date_otgr>{02/01/2002}'
      '  AND month.nom_zd=kvit.nom_zd'
      '  AND month.n_dog = dog.num_dog'
      '  AND dog.num_dog2 = luk_dog.num_dog'
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13'
      'UNION ALL'
      'SELECT'
      '  kvit.kod_npr,'
      '  month.kod_pos,month.kod_sgr,'
      '  month.kod_spg,'
      '  month.kod_rzd,'
      '  month.kod_prz,'
      '  month.kod_grp,'
      '  month.kod_pgr,month.naim_p AS naim,'
      '  month.n_dog AS luk_dog_id,'
      '  month.kod_plat AS luk_plt_id,'
      '  month.n_dog2 AS snp_dog_id,'
      '  month.kod_plat2 AS snp_plt_id,'
      '  SUM(kvit.ves*1000) AS ves,'
      '  SUM(Round(kvit.ves*1000*month.cena_otp,0)) AS sum'
      'FROM '#39'u:\luk\otgr\operdata\reestr.dbf'#39' kvit,month,dog'
      'WHERE'
      '  month.date_plan={02/01/2002}'
      '  AND kvit.date_otgr>{02/01/2002}'
      '  AND month.kod_plat2<>0'
      '  AND month.nom_zd=kvit.nom_zd'
      '  AND month.n_dog = dog.num_dog'
      '  AND dog.num_dog2 = '#39#39
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13'
      ''
      '')
    Left = 400
    Top = 122
    object q_sev_npkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_sev_npves: TBCDField
      FieldName = 'ves'
      Precision = 17
      Size = 3
    end
    object q_sev_npsum: TBCDField
      FieldName = 'sum'
      Precision = 20
      Size = 0
    end
    object q_sev_npkod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_sev_npkod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_sev_npkod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_sev_npkod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_sev_npkod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_sev_npkod_pgr: TIntegerField
      FieldName = 'kod_pgr'
    end
    object q_sev_npluk_dog_id: TStringField
      FieldName = 'luk_dog_id'
      FixedChar = True
      Size = 10
    end
    object q_sev_npluk_plt_id: TIntegerField
      FieldName = 'luk_plt_id'
    end
    object q_sev_npsnp_dog_id: TStringField
      FieldName = 'snp_dog_id'
      FixedChar = True
      Size = 10
    end
    object q_sev_npsnp_plt_id: TIntegerField
      FieldName = 'snp_plt_id'
    end
    object q_sev_npnaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 30
    end
    object q_sev_npkod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
  end
  object DataSource1: TDataSource
    DataSet = q_sev_np
    Left = 288
    Top = 41
  end
  object q_f42_2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_f42_2BeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  f42.*,'
      '  gr_real.naim2,'
      '  gr_real.kod_pos1,'
      '  gr_real.kod_sgr1,'
      '  gr_real.kod_spg1,'
      '  gr_real.kod_rzd1,'
      '  gr_real.kod_prz1,'
      '  gr_real.kod_grp1,'
      '  gr_real.kod_pgr1'
      
        'FROM "C:\TMP\F42_PLN1.DBF" f42,"U:\LUK\DOGOVOR\PLANM\DBF\gr_real' +
        '.DBF" gr_real'
      'WHERE f42.kod_pos = gr_real.kod_pos'
      '  AND f42.kod_sgr = gr_real.kod_sgr'
      '  AND f42.kod_spg = gr_real.kod_spg'
      '  AND f42.kod_rzd = gr_real.kod_rzd'
      '  AND f42.kod_prz = gr_real.kod_prz'
      '  AND f42.kod_grp = gr_real.kod_grp'
      '  AND gr_real.kod_pos1<>0'
      '')
    Left = 664
    Top = 174
    object q_f42_2kod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
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
    object q_f42_2zayv_tonn: TBCDField
      FieldName = 'zayv_tonn'
      Precision = 10
      Size = 3
    end
    object q_f42_2zayv_dat: TDateField
      FieldName = 'zayv_dat'
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
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 16
    Top = 105
  end
  object q_month: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_monthBeforeOpen
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
      'month.tonn as tonn,'
      'month.vvoddat as vvoddat,'
      'kindprod.pf_ordnung,'
      'prod.kod AS kind_npr,'
      'prod.naim_pr,'
      'kindprod.pg_gr_ordn,'
      'kindprod.pf_kod_gr,'
      'kindprod.pf_group'
      
        'FROM month, prod, kindprod,'#39'U:\luk\DOGOVOR\PLANM\pl01_08\plotg2.' +
        'dbf'#39' plotg'
      'WHERE'
      '  month.kod_sgr<>501 AND'
      '  month.date_plan={08/01/2001} AND month.vvoddat={08/01/2001}'
      
        '  and plotg.kod_npr = prod.kod and plotg.n_dog=month.n_dog and p' +
        'lotg.kod_pos=month.kod_pos and plotg.kod_sgr=month.kod_sgr and p' +
        'lotg.kod_spg=month.kod_spg and plotg.kod_rzd=month.kod_rzd and p' +
        'lotg.kod_prz=month.kod_prz and plotg.kod_grp=month.kod_grp'
      
        '  and kindprod.kind_npr = prod.kind_npr and plotg.kod_npr = MONT' +
        'H.KOD_NPR'
      'GROUP BY 1,3,4,5,6,7,8'
      ''
      ' '
      ' ')
    Left = 460
    Top = 174
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
    Left = 400
    Top = 24
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
  object q_plnp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_plnpBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      
        '  str(f42_plan.KOD_SGR,3)+IIF(f42_plan.kod_sgr=90 and f42_plan.k' +
        'od_spg=10,'#39'999'#39',str(f42_plan.KOD_SPG,3))+str(f42_plan.KOD_rzd,3)' +
        '+str(f42_plan.KOD_PRZ,3)+str(f42_plan.KOD_GRP,3) AS kod_plan,gr_' +
        'real.lukoil_id,f42_plan.kod_pos,'
      '  F42_PLAN.NAIM AS naim_plan,'
      '  PROD.KOD_10,'
      '  Sum((D_VES+V_VES-OD_VES-OV_VES)*1000) AS plan,'
      '  Sum((D_SUM+V_SUM-OD_SUM-OV_SUM)) AS splan,'
      '  '#39'1'#39' as plan_typ,'
      '  '#39'{12/01/2003}'#39' as date_plan'
      
        'FROM '#39'c:\tmp\F42_PLAN'#39' F42_PLAN,PROD,KINDPROD,'#39'U:\LUK\DOGOVOR\PL' +
        'ANM\DBF\gr_real.dbf'#39' gr_real'
      
        'WHERE F42_PLAN.KOD_NPR = PROD.KOD AND F42_PLAN.KOD_SGR = gr_real' +
        '.KOD_SGR AND F42_PLAN.KOD_SPG = gr_real.KOD_SPG AND F42_PLAN.KOD' +
        '_RZD = gr_real.KOD_RZD AND F42_PLAN.KOD_PRZ = gr_real.KOD_PRZ AN' +
        'D F42_PLAN.KOD_GRP = gr_real.KOD_GRP'
      '  AND F42_PLAN.KOD_SGR<>101 AND F42_PLAN.KOD_SGR<>103'
      
        '  AND PROD.KIND_NPR=KINDPROD.KIND_NPR AND F42_PLAN.KOD_NPR <> '#39'9' +
        '0000'#39
      '  AND 1=1'
      'GROUP BY 1,2,3,4,5'
      ''
      ''
      '')
    Left = 460
    Top = 226
  end
  object q_tr_rash: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_tr_rashBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      #39'10008'#39' as kod_npr,'
      'month.kod_pos,'
      'month.kod_sgr,'
      'month.kod_spg,'
      'month.kod_rzd,'
      'month.kod_prz,'
      'month.kod_grp,'
      'month.naim_p AS naim,'
      
        'sum(IIF(month.posred=10 or month.posred=0,KVIT.TARIF+KVIT.DOP_TA' +
        'RIF+IIF(TARIF19-TARIF>0,TARIF19-TARIF,0.00),0.00)) AS d_sum,'
      
        'sum(IIF(month.posred<>10 and month.posred<>0,KVIT.TARIF+KVIT.DOP' +
        '_TARIF+IIF(TARIF19-TARIF>0,TARIF19-TARIF,0.00),0.00)) AS v_sum'
      'FROM month,KVIT,DOG'
      
        'WHERE ALLT(month.nom_zd)=ALLT(KVIT.nom_zd) AND month.kod_sgr<>50' +
        '1 and month.n_dog=dog.num_dog and'
      '  KVIT.date_kvit BETWEEN {09/01/2000} AND {09/01/2000}'
      
        '  AND dog.is_agent=1 AND (kvit.tip_otgr=1 OR kvit.tip_otgr=6) AN' +
        'D kvit.kod_otgr<>5 AND kvit.kod_otgr<>8'
      'GROUP BY 1,3,4,5,6,7'
      'HAVING d_sum+v_sum<>0'
      '')
    Left = 400
    Top = 75
    object StringField1: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object IntegerField1: TIntegerField
      FieldName = 'kod_pos'
    end
    object IntegerField2: TIntegerField
      FieldName = 'kod_sgr'
    end
    object IntegerField3: TIntegerField
      FieldName = 'kod_spg'
    end
    object IntegerField4: TIntegerField
      FieldName = 'kod_rzd'
    end
    object IntegerField5: TIntegerField
      FieldName = 'kod_prz'
    end
    object IntegerField6: TIntegerField
      FieldName = 'kod_grp'
    end
    object StringField2: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 30
    end
    object BCDField3: TBCDField
      FieldName = 'd_sum'
      Precision = 16
      Size = 2
    end
    object BCDField4: TBCDField
      FieldName = 'v_sum'
      Precision = 16
      Size = 2
    end
  end
  object q_pryam_sf_ora: TOracleDataSet
    SQL.Strings = (
      'SELECT '#9'/*+ RULE*/'
      '  kls_dog.PREDPR_ID as kod_plat,'
      '  v_out_plat_dbf.kod_nfp AS kod_npr,'
      '  SUM(v_out_plat_dbf.ves*1000) AS ves,'
      '  SUM(Round(v_out_plat_dbf.summa_dok,0)) AS sum'
      'FROM v_out_plat_dbf,month,kls_dog,kls_planstru'
      'WHERE'
      
        '  ((kls_planstru.kod_sgr=20) or (kls_planstru.kod_sgr in (90,91)' +
        ' and kls_planstru.kod_spg=10))'
      '  AND v_out_plat_dbf.nom_zd=month.nom_zd'
      '  AND month.DOG_ID=kls_dog.ID'
      '  AND month.PLANSTRU_ID=kls_planstru.ID'
      '  AND V_OUT_PLAT_DBF.DATA_KVIT BETWEEN :BEG_DATE AND :END_DATE'
      'GROUP BY kls_dog.predpr_id,v_out_plat_dbf.kod_nfp')
    Variables.Data = {
      0300000002000000090000003A4245475F444154450C00000000000000000000
      00090000003A454E445F444154450C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 461
    Top = 24
  end
  object q_fact_plat_ora: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE*/'
      'v_out_plat_dbf.kod_nfp as kod_npr,'
      'kls_planstru.level_pos as kod_pos,'
      'kls_planstru.kod_sgr,'
      'kls_planstru.kod_spg,'
      'kls_planstru.kod_rzd,'
      'kls_planstru.kod_prz,'
      'kls_planstru.kod_grp,'
      'kls_planstru.name AS naim,'
      '/*'
      
        'sum(IIF(month.posred=10 or month.posred=0,OUT_PLAT.ves,0.000)) A' +
        'S d_ves,'
      
        'sum(IIF(month.posred<>10 and month.posred<>0,OUT_PLAT.ves,0.000)' +
        ') AS v_ves,'
      
        'sum(IIF(month.posred=10 or month.posred=0,OUT_PLAT.SUMMA_DOK,0.0' +
        '0)) AS d_sum,'
      
        'sum(IIF(month.posred<>10 and month.posred<>0,OUT_PLAT.SUMMA_DOK,' +
        '0.00)) AS v_sum'
      '*/'
      'sum(case'
      
        #9'  when kls_planstru.POS_PREDPR_ID=10 or kls_planstru.POS_PREDPR' +
        '_ID=0 then v_out_plat_dbf.ves'
      #9'  else 0'
      #9'end) AS d_ves,'
      'sum(case'
      
        #9'  when kls_planstru.POS_PREDPR_ID<>10 and kls_planstru.POS_PRED' +
        'PR_ID<>0 then v_out_plat_dbf.ves'
      #9'  else 0'
      #9'end) AS v_ves,'
      'sum(case'
      
        #9'  when kls_planstru.POS_PREDPR_ID=10 or kls_planstru.POS_PREDPR' +
        '_ID=0 then v_out_plat_dbf.SUMMA_DOK'
      #9'  else 0'
      #9'end) AS d_sum,'
      'sum(case'
      
        #9'  when kls_planstru.POS_PREDPR_ID<>10 and kls_planstru.POS_PRED' +
        'PR_ID<>0 then v_out_plat_dbf.SUMMA_DOK'
      #9'  else 0'
      #9'end) AS v_sum'
      'FROM month,V_OUT_PLAT_DBF,kls_planstru'
      'WHERE'
      '  month.nom_zd=v_out_plat_dbf.nom_zd'
      '  AND month.planstru_id=kls_planstru.id'
      '  AND kls_planstru.kod_sgr<>501'
      '  AND v_out_plat_dbf.data_kvit BETWEEN :BEG_DATE AND :END_DATE'
      
        'GROUP BY v_out_plat_dbf.kod_nfp,kls_planstru.level_pos,kls_plans' +
        'tru.kod_sgr,kls_planstru.kod_spg,kls_planstru.kod_rzd,kls_planst' +
        'ru.kod_prz,kls_planstru.kod_grp,kls_planstru.name'
      'UNION ALL'
      'SELECT'
      'kvit.prod_id_npr as kod_npr,'
      'kls_planstru.level_pos as kod_pos,'
      'kls_planstru.kod_sgr,'
      'kls_planstru.kod_spg,'
      'kls_planstru.kod_rzd,'
      'kls_planstru.kod_prz,'
      'kls_planstru.kod_grp,'
      'kls_planstru.name AS naim,'
      'sum(kvit.ves) AS d_ves,'
      'sum(0) AS v_ves,'
      'sum(0) AS d_sum,'
      'sum(0) AS v_sum'
      'FROM month,kvit,kls_planstru,kls_vid_otgr,kls_dog'
      'WHERE'
      '  month.nom_zd=kvit.nom_zd'
      '  AND month.PLANSTRU_ID=kls_planstru.ID'
      '  AND month.LOAD_ABBR=kls_vid_otgr.LOAD_ABBR'
      '  AND month.DOG_ID=kls_dog.ID'
      
        '  AND (kls_vid_otgr.load_type_id=5 or kls_vid_otgr.load_type_id=' +
        '8 or kls_dog.predpr_id=8)'
      '  AND kvit.date_kvit BETWEEN :BEG_DATE AND :END_DATE'
      
        'GROUP BY kvit.prod_id_npr,kls_planstru.level_pos,kls_planstru.ko' +
        'd_sgr,kls_planstru.kod_spg,kls_planstru.kod_rzd,kls_planstru.kod' +
        '_prz,kls_planstru.kod_grp,kls_planstru.name')
    Variables.Data = {
      0300000002000000090000003A4245475F444154450C00000000000000000000
      00090000003A454E445F444154450C0000000000000000000000}
    Session = f_main.ora_Session
    BeforeOpen = q_fact_plat_oraBeforeOpen
    Left = 544
    Top = 24
  end
  object q_sev_np_sf_ora: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '  v_out_plat_dbf.kod_nfp AS kod_npr,'
      '  kls_planstru.level_pos as kod_pos,'
      '  kls_planstru.kod_sgr,'
      '  kls_planstru.kod_spg,'
      '  kls_planstru.kod_rzd,'
      '  kls_planstru.kod_prz,'
      '  kls_planstru.kod_grp,'
      '  kls_planstru.kod_pgr,'
      '  kls_planstru.name AS naim,'
      '  kls_dog.dog_number AS luk_dog_id,'
      '  kls_dog.predpr_id AS luk_plt_id,'
      '  luk_dog.dog_number AS snp_dog_id,'
      '  luk_dog.predpr_id AS snp_plt_id,'
      '  SUM(v_out_plat_dbf.ves*1000) AS ves,'
      '  SUM(Round(v_out_plat_dbf.summa_dok,0)) AS sum'
      
        'FROM v_out_plat_dbf,month,kls_dog,kls_planstru,kls_dog luk_dog,k' +
        'ls_dog_main'
      'WHERE'
      '  v_out_plat_dbf.data_buxg between :beg_date and :end_date'
      '  AND month.nom_zd=v_out_plat_dbf.nom_zd'
      '  AND month.planstru_id=kls_planstru.id'
      '  AND month.DOG_ID = kls_dog.ID'
      '  AND kls_dog.maindog_ID = kls_dog_main.DOG_ID'
      '  AND kls_dog_main.DOG_ID=luk_dog.ID'
      'group by   v_out_plat_dbf.kod_nfp,'
      '  kls_planstru.level_pos,'
      '  kls_planstru.kod_sgr,'
      '  kls_planstru.kod_spg,'
      '  kls_planstru.kod_rzd,'
      '  kls_planstru.kod_prz,'
      '  kls_planstru.kod_grp,'
      '  kls_planstru.kod_pgr,'
      '  kls_planstru.name,'
      '  kls_dog.dog_number,'
      '  kls_dog.predpr_id,'
      '  luk_dog.dog_number,'
      '  luk_dog.predpr_id'
      'UNION ALL'
      'SELECT /*+ RULE */'
      '  v_out_plat_dbf.kod_nfp AS kod_npr,'
      '  kls_planstru.level_pos as kod_pos,'
      '  kls_planstru.kod_sgr,'
      '  kls_planstru.kod_spg,'
      '  kls_planstru.kod_rzd,'
      '  kls_planstru.kod_prz,'
      '  kls_planstru.kod_grp,'
      '  kls_planstru.kod_pgr,'
      '  kls_planstru.name AS naim,'
      '  kls_dog.dog_number AS luk_dog_id,'
      '  kls_dog.predpr_id AS luk_plt_id,'
      '  luk_dog.dog_number AS snp_dog_id,'
      '  luk_dog.predpr_id AS snp_plt_id,'
      '  SUM(v_out_plat_dbf.ves*1000) AS ves,'
      '  SUM(Round(v_out_plat_dbf.summa_dok,0)) AS sum'
      
        'FROM v_out_plat_dbf,month,kls_dog,kls_planstru,kls_dog luk_dog,k' +
        'ls_dog_main'
      'WHERE'
      '  v_out_plat_dbf.data_buxg between :beg_date and :end_date'
      '  AND month.nom_zd=v_out_plat_dbf.nom_zd'
      '  AND month.planstru_id=kls_planstru.id'
      '  AND month.DOG_ID = kls_dog.ID'
      '  AND kls_dog.maindog_ID = kls_dog_main.DOG_ID'
      '  AND kls_dog.maindog_ID=0'
      'group by   v_out_plat_dbf.kod_nfp,'
      '  kls_planstru.level_pos,'
      '  kls_planstru.kod_sgr,'
      '  kls_planstru.kod_spg,'
      '  kls_planstru.kod_rzd,'
      '  kls_planstru.kod_prz,'
      '  kls_planstru.kod_grp,'
      '  kls_planstru.kod_pgr,'
      '  kls_planstru.name,'
      '  kls_dog.dog_number,'
      '  kls_dog.predpr_id,'
      '  luk_dog.dog_number,'
      '  luk_dog.predpr_id'
      '')
    Variables.Data = {
      0300000002000000090000003A4245475F444154450C00000000000000000000
      00090000003A454E445F444154450C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 640
    Top = 24
  end
end
