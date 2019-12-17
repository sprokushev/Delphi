object f_disprep: Tf_disprep
  Left = 476
  Top = 368
  Width = 324
  Height = 283
  Caption = #1044#1080#1089#1087#1077#1090#1095#1077#1088': '#1045#1078#1077#1089#1091#1090#1086#1095#1085#1072#1103' '#1086#1090#1075#1088#1091#1079#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 9
    Width = 33
    Height = 13
    Caption = #1052#1077#1089#1103#1094
  end
  object Label2: TLabel
    Left = 182
    Top = 8
    Width = 17
    Height = 13
    Caption = #1075#1086#1076
  end
  object Label5: TLabel
    Left = 8
    Top = 117
    Width = 140
    Height = 13
    Caption = #1044#1072#1090#1072' '#1084#1086#1089#1082#1086#1074#1089#1082#1086#1075#1086' '#1088#1077#1077#1089#1090#1088#1072
  end
  object Label6: TLabel
    Left = 16
    Top = 176
    Width = 289
    Height = 65
    Caption = 
      '                                  '#1055#1088#1072#1074#1080#1083#1072' '#1074#1074#1086#1076#1072#13#10#1059#1090#1088#1086#1084': '#1089' 18:00 ' +
      #1087#1088#1077#1076'.'#1076#1085#1103' '#1087#1086' 06:00 '#1090#1077#1082'.'#1076#1085#1103#13#10#1042#1077#1095#1077#1088#1086#1084': '#1089' 18:00 '#1087#1088#1077#1076'.'#1076#1085#1103' '#1087#1086' 18:00 '#1090#1077 +
      #1082'.'#1076#1085#1103#13#10#1055#1086' '#1074#1099#1093#1086#1076#1085#1099#1084': '#1089'   18:00 '#1087#1103#1090#1085#1080#1094#1099#13#10'      '#1087#1086' 06:00 (18:00) '#1089#1091 +
      #1073#1073#1086#1090#1099'/'#1074#1086#1089#1082#1088#1077#1089#1077#1085#1100#1103'/'#1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082#1072
  end
  object cb_Month: TComboBox
    Left = 62
    Top = 5
    Width = 111
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
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
    Left = 211
    Top = 5
    Width = 64
    Height = 21
    Value = 2000.000000000000000000
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 31
    Width = 310
    Height = 77
    Caption = ' '#1079#1072' '#1089#1091#1090#1082#1080' '
    TabOrder = 2
    object Label3: TLabel
      Left = 54
      Top = 18
      Width = 6
      Height = 13
      Caption = #1089
    end
    object Label4: TLabel
      Left = 53
      Top = 48
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object time1: TDateTimePicker
      Left = 71
      Top = 15
      Width = 68
      Height = 21
      Date = 36717.000000000000000000
      Time = 36717.000000000000000000
      Kind = dtkTime
      TabOrder = 0
    end
    object time2: TDateTimePicker
      Left = 71
      Top = 45
      Width = 68
      Height = 21
      Date = 36717.250000000000000000
      Time = 36717.250000000000000000
      Kind = dtkTime
      TabOrder = 1
    end
    object date1: TDateTimePicker
      Left = 158
      Top = 15
      Width = 95
      Height = 21
      Date = 36717.541841782390000000
      Time = 36717.541841782390000000
      MinDate = 36708.000000000000000000
      TabOrder = 2
    end
    object date2: TDateTimePicker
      Left = 157
      Top = 45
      Width = 95
      Height = 21
      Date = 36717.541841782390000000
      Time = 36717.541841782390000000
      MinDate = 36708.000000000000000000
      TabOrder = 3
    end
  end
  object date3: TDateTimePicker
    Left = 160
    Top = 112
    Width = 95
    Height = 21
    Date = 36717.541841782390000000
    Time = 36717.541841782390000000
    MinDate = 36708.000000000000000000
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 84
    Top = 140
    Width = 149
    Height = 25
    Caption = #1054#1090#1095#1077#1090
    TabOrder = 4
    OnClick = BitBtn2Click
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
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 8
    Top = 44
  end
  object ds_plan: TDataSource
    DataSet = q_plan
    Left = 276
    Top = 67
  end
  object q_plan: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_planBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'pl_mos2.kod_npr,'
      'prod.naim_pr as nm_npr,'
      'grplp2.kod_pos,'
      'grplp2.kod_sgr,'
      'grplp2.kod_spg,'
      'grplp2.kod_rzd,grplp2.kod_prz,'
      'grplp2.naim AS naim,'
      'pl_mos2.t_itog AS plan'
      'FROM prod,'
      #39'U:\luk\DOGOVOR\PLANM\pl00_07\grplp2.dbf'#39' grplp2,'
      #39'U:\luk\DOGOVOR\PLANM\pl00_07\PL_MOS2.DBF'#39' pl_mos2'
      'WHERE grplp2.kod_pos<=4 AND pl_mos2.kod_npr=prod.kod'
      '  and grplp2.kod_sgr=pl_mos2.kod_sgr'
      '  and grplp2.kod_spg=pl_mos2.kod_spg'
      '  and grplp2.kod_rzd=pl_mos2.kod_rzd'
      '  and grplp2.kod_sgr<>101'
      '  and grplp2.kod_prz=pl_mos2.kod_prz'
      '  and pl_mos2.kod_grp=0'
      '  and pl_mos2.kod_pgr=0'
      '  and grplp2.kod_otgr<>10'
      'ORDER BY 1,2,4,5,6,7'
      ' '
      ' ')
    Left = 248
    Top = 68
    object q_plankod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_plannm_npr: TStringField
      FieldName = 'nm_npr'
      FixedChar = True
      Size = 40
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
    object q_plannaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 40
    end
    object q_planplan: TBCDField
      FieldName = 'plan'
      Precision = 15
      Size = 6
    end
  end
  object q_fact: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_factBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'KVIT.kod_npr,'
      'prod.naim_pr,'
      'month.kod_pos,'
      'month.kod_sgr,'
      'month.kod_spg,'
      'month.kod_rzd,month.kod_prz,'
      'month.naim_p AS naim,'
      
        'sum(IIF(DTOS(np_data_o)+np_timep<="2000070906:00:00",kvit.ves*10' +
        '00,0)) AS fact_bef,'
      
        'sum(IIF(DTOS(np_data_o)+np_timep >"2000070906:00:00",kvit.ves*10' +
        '00,0)) AS fact_aft'
      'FROM month,'#39'u:\luk\otgr\operdata\reestr'#39' kvit,prod'
      'WHERE'
      '  prod.kod=month.kod_npr AND  month.kod_sgr<>101 AND '
      '  kvit.nom_zd=month.nom_zd AND month.kod_pos>0 AND'
      '  DTOS(np_data_o)+np_timep<='#39'2000071006:00:00'#39' AND'
      '  month.date_plan={07/01/2000}'
      '  AND month.kod_otgr<>10'
      'GROUP BY 1,2,3,4,5,6,7'
      ''
      ' '
      ' ')
    Left = 248
    Top = 96
    object q_factkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_factnaim_pr: TStringField
      FieldName = 'naim_pr'
      FixedChar = True
      Size = 40
    end
    object q_factkod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_factkod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_factkod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_factkod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_factkod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_factnaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 30
    end
    object q_factfact_bef: TBCDField
      FieldName = 'fact_bef'
      Precision = 17
      Size = 3
    end
    object q_factfact_aft: TBCDField
      FieldName = 'fact_aft'
      Precision = 16
      Size = 0
    end
  end
  object q_grplp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_grplpBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM'
      '"U:\luk\DOGOVOR\PLANM\pl00_07\grplp2.dbf" grplp2')
    Left = 16
    Top = 136
  end
  object q_reestr: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeOpen = q_reestrBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'month.kod_npr,'
      'prod.naim_pr,'
      'month.kod_pos,'
      'month.kod_sgr,'
      'month.kod_spg,'
      'month.kod_rzd, month.kod_prz,'
      'month.naim_p AS naim,'
      'SUM(mosc_ree.val_zd*1000) AS val_zd'
      'FROM month,prod,'#39'U:\luk\Reestr\Prepare\MOSC_REE.DBF'#39' mosc_ree'
      'WHERE'
      
        '  prod.kod=month.kod_npr AND month.kod_sgr<>101 AND month.kod_sg' +
        'r<>102 AND'
      '  mosc_ree.nom_zd=month.nom_zd AND month.kod_pos>0 AND'
      '  mosc_ree.val_zd<>0 AND'
      '  mosc_ree.date_ree={09/19/2000}'
      'GROUP BY 1,2,3,4,5,6,7'
      ''
      ' ')
    Left = 276
    Top = 96
    object q_reestrkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_reestrnaim_pr: TStringField
      FieldName = 'naim_pr'
      FixedChar = True
      Size = 40
    end
    object q_reestrkod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_reestrkod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_reestrkod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_reestrkod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_reestrkod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_reestrnaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 30
    end
    object q_reestrval_zd: TBCDField
      FieldName = 'val_zd'
      Precision = 17
      Size = 3
    end
  end
  object q_cmn: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 264
    Top = 152
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
    Left = 188
    Top = 46
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
      'KLS_PLANSTRU.NAME AS naim,'
      'SUM(PLAN_POST.PLAN_VES) AS plan'
      'FROM PLAN_POST, PLAN_PERIODS, KLS_PLANSTRU, KLS_PROD'
      'WHERE KLS_PLANSTRU.LEVEL_POS<=4'
      '  AND KLS_PLANSTRU.kod_sgr<>101'
      '  AND KLS_PLANSTRU.NAZN_OTG_ID<>10'
      '  AND PLAN_POST.PLANSTRU_ID=KLS_PLANSTRU.ID'
      '  AND PLAN_POST.PLAN_ID=3'
      '  AND PLAN_POST.PLAN_PER_ID=PLAN_PERIODS.ID'
      '  AND PLAN_PERIODS.DATE_PLAN=TO_DATE('#39'01.01.2004'#39','#39'dd.mm.yyyy'#39')'
      '  AND PLAN_POST.PROD_ID_NPR = KLS_PROD.ID_NPR'
      'GROUP BY'
      'PLAN_POST.PROD_ID_NPR,'
      'KLS_PROD.NAME_NPR,'
      'KLS_PLANSTRU.LEVEL_POS,'
      'KLS_PLANSTRU.kod_sgr,'
      'KLS_PLANSTRU.kod_spg,'
      'KLS_PLANSTRU.kod_rzd,'
      'KLS_PLANSTRU.kod_prz,'
      'KLS_PLANSTRU.NAME'
      'ORDER BY'
      'PLAN_POST.PROD_ID_NPR,'
      'KLS_PLANSTRU.kod_sgr,'
      'KLS_PLANSTRU.kod_spg,'
      'KLS_PLANSTRU.kod_rzd,'
      'KLS_PLANSTRU.kod_prz,'
      'KLS_PLANSTRU.LEVEL_POS,'
      'KLS_PLANSTRU.NAME'
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      0300000009000000070000004B4F445F4E50520100000000070000004B4F445F
      504F530100000000070000004B4F445F5347520100000000070000004B4F445F
      5350470100000000070000004B4F445F525A440100000000070000004B4F445F
      50525A0100000000040000004E41494D010000000004000000504C414E010000
      0000060000004E41494D5F310100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_obprBeforeOpen
    Left = 232
    Top = 168
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
    object q_obprNAIM: TStringField
      FieldName = 'NAIM'
      Required = True
      Size = 50
    end
    object q_obprPLAN: TFloatField
      FieldName = 'PLAN'
    end
  end
end
