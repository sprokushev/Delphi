object f_SvodPF: Tf_SvodPF
  Left = 472
  Top = 254
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1076#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072' '#1086#1073' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1080' '#1087#1083#1072#1085#1086#1074
  ClientHeight = 332
  ClientWidth = 564
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
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 564
    Height = 203
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 256
      Height = 201
      Align = alLeft
      Caption = ' '#1055#1083#1072#1085' ('#1085#1072#1088#1072#1089#1090#1072#1102#1097#1080#1081') '
      TabOrder = 0
      object Label2: TLabel
        Left = 38
        Top = 84
        Width = 113
        Height = 13
        Caption = #1087#1086#1089#1090#1072#1074#1086#1082' '#1085'/'#1087#1088' '#1089' '#1076#1072#1090#1099':'
      end
      object Label3: TLabel
        Left = 12
        Top = 20
        Width = 139
        Height = 13
        Caption = #1087#1077#1088#1077#1088#1072#1073#1086#1090#1082#1080' '#1085#1077#1092#1090#1080' '#1089' '#1076#1072#1090#1099':'
      end
      object Label5: TLabel
        Left = 57
        Top = 146
        Width = 94
        Height = 13
        Caption = #1087#1077#1088#1077#1074#1086#1079#1086#1082' '#1089' '#1076#1072#1090#1099':'
      end
      object Label11: TLabel
        Left = 111
        Top = 106
        Width = 40
        Height = 13
        Caption = #1087#1086' '#1076#1072#1090#1091':'
      end
      object Label12: TLabel
        Left = 111
        Top = 43
        Width = 40
        Height = 13
        Caption = #1087#1086' '#1076#1072#1090#1091':'
      end
      object Label14: TLabel
        Left = 111
        Top = 169
        Width = 40
        Height = 13
        Caption = #1087#1086' '#1076#1072#1090#1091':'
      end
      object ed_DateBegPlanPost: TDateTimePicker
        Left = 154
        Top = 80
        Width = 95
        Height = 21
        Date = 36717.541841782390000000
        Time = 36717.541841782390000000
        MinDate = 36526.000000000000000000
        TabOrder = 0
      end
      object ed_DateBegPlanPererab: TDateTimePicker
        Left = 154
        Top = 17
        Width = 95
        Height = 21
        Date = 36717.541841782390000000
        Time = 36717.541841782390000000
        MinDate = 36526.000000000000000000
        TabOrder = 1
      end
      object ed_DateBegPlanGD: TDateTimePicker
        Left = 154
        Top = 144
        Width = 95
        Height = 21
        Date = 36717.541841782390000000
        Time = 36717.541841782390000000
        MinDate = 36526.000000000000000000
        TabOrder = 2
      end
      object ed_DateEndPlanPost: TDateTimePicker
        Left = 154
        Top = 102
        Width = 95
        Height = 21
        Date = 36717.541841782390000000
        Time = 36717.541841782390000000
        MinDate = 36526.000000000000000000
        TabOrder = 3
      end
      object ed_DateEndPlanPererab: TDateTimePicker
        Left = 154
        Top = 39
        Width = 95
        Height = 21
        Date = 36717.541841782390000000
        Time = 36717.541841782390000000
        MinDate = 36526.000000000000000000
        TabOrder = 4
      end
      object ed_DateEndPlanGD: TDateTimePicker
        Left = 154
        Top = 166
        Width = 95
        Height = 21
        Date = 36717.541841782390000000
        Time = 36717.541841782390000000
        MinDate = 36526.000000000000000000
        TabOrder = 5
      end
    end
    object Panel2: TPanel
      Left = 257
      Top = 1
      Width = 306
      Height = 201
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 306
        Height = 67
        Align = alTop
        Caption = ' '#1056#1077#1089#1091#1088#1089' '
        TabOrder = 0
        object Label7: TLabel
          Left = 10
          Top = 19
          Width = 118
          Height = 13
          Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082' '#1085#1072':'
        end
        object Label8: TLabel
          Left = 22
          Top = 41
          Width = 106
          Height = 13
          Caption = #1058#1077#1082#1091#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082' '#1085#1072':'
        end
        object ed_DateBegOst: TDateTimePicker
          Left = 202
          Top = 15
          Width = 95
          Height = 21
          Date = 36717.541841782390000000
          Time = 36717.541841782390000000
          MinDate = 36526.000000000000000000
          TabOrder = 0
        end
        object ed_TimeBegOst: TDateTimePicker
          Left = 133
          Top = 15
          Width = 68
          Height = 21
          Date = 36717.000000000000000000
          Time = 36717.000000000000000000
          Enabled = False
          Kind = dtkTime
          TabOrder = 1
        end
        object ed_TimeEndOst: TDateTimePicker
          Left = 133
          Top = 37
          Width = 68
          Height = 21
          Date = 36717.000000000000000000
          Time = 36717.000000000000000000
          Enabled = False
          Kind = dtkTime
          TabOrder = 2
        end
        object ed_DateEndOst: TDateTimePicker
          Left = 202
          Top = 37
          Width = 95
          Height = 21
          Date = 36717.541841782390000000
          Time = 36717.541841782390000000
          MinDate = 36526.000000000000000000
          TabOrder = 3
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 67
        Width = 306
        Height = 63
        Align = alTop
        Caption = ' '#1060#1072#1082#1090' '#1087#1086' '#1087#1083#1072#1085#1091' '#1087#1086#1089#1090#1072#1074#1086#1082' '
        TabOrder = 1
        object l_date1: TLabel
          Left = 89
          Top = 19
          Width = 38
          Height = 13
          Caption = #1057' '#1076#1072#1090#1099':'
        end
        object Label1: TLabel
          Left = 86
          Top = 41
          Width = 42
          Height = 13
          Caption = #1055#1086' '#1076#1072#1090#1091':'
        end
        object ed_DateBegFact: TDateTimePicker
          Left = 202
          Top = 14
          Width = 95
          Height = 21
          Date = 36717.541841782390000000
          Time = 36717.541841782390000000
          MinDate = 36526.000000000000000000
          TabOrder = 0
        end
        object ed_DateEndFact: TDateTimePicker
          Left = 202
          Top = 36
          Width = 95
          Height = 21
          Date = 36717.541841782390000000
          Time = 36717.541841782390000000
          MinDate = 36526.000000000000000000
          TabOrder = 1
        end
        object ed_TimeBegFact: TDateTimePicker
          Left = 133
          Top = 15
          Width = 68
          Height = 21
          Date = 36717.000000000000000000
          Time = 36717.000000000000000000
          Kind = dtkTime
          TabOrder = 2
        end
        object ed_TimeEndFact: TDateTimePicker
          Left = 133
          Top = 37
          Width = 68
          Height = 21
          Date = 36717.000000000000000000
          Time = 36717.000000000000000000
          Kind = dtkTime
          TabOrder = 3
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 130
        Width = 306
        Height = 71
        Align = alClient
        Caption = ' '#1060#1072#1082#1090' '#1087#1086' '#1087#1083#1072#1085#1091' '#1087#1077#1088#1077#1074#1086#1079#1086#1082' '
        TabOrder = 2
        object Label9: TLabel
          Left = 89
          Top = 19
          Width = 38
          Height = 13
          Caption = #1057' '#1076#1072#1090#1099':'
        end
        object Label10: TLabel
          Left = 86
          Top = 41
          Width = 42
          Height = 13
          Caption = #1055#1086' '#1076#1072#1090#1091':'
        end
        object ed_DateBegFactGD: TDateTimePicker
          Left = 202
          Top = 14
          Width = 95
          Height = 21
          Date = 36717.541841782390000000
          Time = 36717.541841782390000000
          MinDate = 36526.000000000000000000
          TabOrder = 0
        end
        object ed_DateEndFactGD: TDateTimePicker
          Left = 202
          Top = 36
          Width = 95
          Height = 21
          Date = 36717.541841782390000000
          Time = 36717.541841782390000000
          MinDate = 36526.000000000000000000
          TabOrder = 1
        end
        object ed_TimeBegFactGD: TDateTimePicker
          Left = 133
          Top = 15
          Width = 68
          Height = 21
          Date = 36717.708333333340000000
          Time = 36717.708333333340000000
          Kind = dtkTime
          TabOrder = 2
        end
        object ed_TimeEndFactGD: TDateTimePicker
          Left = 133
          Top = 37
          Width = 68
          Height = 21
          Date = 36717.708333333340000000
          Time = 36717.708333333340000000
          Kind = dtkTime
          TabOrder = 3
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 564
    Height = 33
    Align = alTop
    TabOrder = 1
    object Label17: TLabel
      Left = 16
      Top = 10
      Width = 50
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
    end
    object Label18: TLabel
      Left = 176
      Top = 10
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object ed_DateBeg: TDateTimePicker
      Left = 74
      Top = 6
      Width = 95
      Height = 21
      Date = 36717.541841782390000000
      Time = 36717.541841782390000000
      MinDate = 36526.000000000000000000
      TabOrder = 0
      OnChange = ed_DateBegChange
    end
    object ed_DateEnd: TDateTimePicker
      Left = 194
      Top = 6
      Width = 95
      Height = 21
      Date = 36717.541841782390000000
      Time = 36717.541841782390000000
      MinDate = 36526.000000000000000000
      TabOrder = 1
      OnChange = ed_DateEndChange
    end
  end
  object Button1: TButton
    Left = 8
    Top = 243
    Width = 169
    Height = 25
    Caption = #1055#1083#1072#1085' '#1087#1086#1089#1090#1072#1074#1086#1082
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 243
    Width = 185
    Height = 25
    Caption = #1055#1083#1072#1085#1099' '#1087#1077#1088#1077#1088#1072#1073#1086#1090#1082#1080' '#1080' '#1087#1077#1088#1077#1074#1086#1079#1082#1080
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 376
    Top = 275
    Width = 169
    Height = 25
    Caption = #1055#1083#1072#1085' '#1087#1086#1089#1090#1072#1074#1086#1082' '#1057#1053#1055
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 275
    Width = 169
    Height = 25
    Caption = #1054#1087#1077#1088#1072#1090#1080#1074#1085#1072#1103' '#1089#1074#1086#1076#1082#1072
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 376
    Top = 243
    Width = 169
    Height = 25
    Caption = #1044#1083#1103' '#1074#1080#1076#1077#1086#1082#1086#1085#1092#1077#1088#1077#1085#1094#1080#1080
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 184
    Top = 275
    Width = 185
    Height = 25
    Caption = #1055#1086#1076#1077#1082#1072#1076#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
    TabOrder = 7
    OnClick = Button6Click
  end
  object q_cmn: TADOQuery
    Connection = PF_Conn
    Parameters = <>
    Left = 336
    Top = 93
  end
  object PF_Conn: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=pf;Mode=ReadWrite;Extended Properties="DSN=pf;UID=;PWD=;So' +
      'urceDB=u:\luk\dbases;SourceType=DBF;Exclusive=No;BackgroundFetch' +
      '=Yes;Collate=RUSSIAN;Null=Yes;Deleted=Yes;"'
    CursorLocation = clUseServer
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'MSDASQL.1'
    Left = 76
    Top = 141
  end
  object ora_Package: TOraclePackage
    Session = f_main.ora_Session
    PackageName = 'FOR_PLANFACT'
    Left = 16
    Top = 144
  end
  object q_resurs_old: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=DBFORPLAN_ACC'
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select * from MASTER_priemka'
      'where data=#05/07/2003#')
    Left = 477
    Top = 72
  end
  object q_PlanPererabOil_old: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=RESURS_ACC'
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT'
      '  Plan.Kod as kod_plan,'
      '  Plan.Per as plan_per,'
      '  Produkt.'#1050#1086#1076' as PROD_KOD,'
      '  Produkt.Produkt as PROD_NAME,'
      '  Sum(Plan.Plan) AS PlanPost,'
      '  Sum(Plan.PlanPerer) AS PlanPerer,'
      '  Sum(Plan.Ostatki) AS Beg_ost'
      'FROM Plan, Produkt'
      'WHERE Plan.Prod = Produkt.'#1050#1086#1076
      'AND Plan.DataPlan=#05/01/2003#'
      'GROUP BY Plan.Kod, Plan.Per, Produkt.'#1050#1086#1076', Produkt.Produkt;'
      ''
      ''
      ''
      '')
    Left = 485
    Top = 128
  end
  object q_FactPererabOil_old: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=RESURS_ACC'
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT'
      '  Resurs.Kod_Plan,'
      '  Sum(Resurs.Post) AS FactPost,'
      '  Sum(Resurs.Perer) AS FactPerer,'
      '  Sum(Resurs.Ostat) AS FactOstat'
      'FROM Resurs'
      'WHERE Resurs.DataRes<=#05/10/2003#'
      '  AND Format(Resurs.DataRes,'#39'yyyymm'#39')='#39'200305'#39
      '  AND Resurs.Kod_Plan Is Not Null'
      'GROUP BY Resurs.Kod_Plan'
      '')
    Left = 485
    Top = 184
  end
  object q_Trans: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=DISPBASE_ACC'
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select DISTINCT transport,kod_gdpl,napr,prichday from _TRANS'
      'where date_send=#05/15/2003#'
      '  and time_send='#39'17:00:00'#39
      '  and prichday<>'#39#39' '
      ' ')
    Left = 245
    Top = 48
  end
  object q_cmn2: TADOQuery
    Connection = PF_Conn
    Parameters = <>
    Left = 416
    Top = 13
  end
  object adoProizv: TADODataSet
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=PLAN_ACC'
    CursorType = ctStatic
    CommandText = 
      'SELECT PROD.NAIM_PR, '#13#10'Dayly_fact.data, '#13#10'Sum(plan.plan) AS Max_' +
      'plan, '#13#10'Sum(plan.ostat) AS Sum_ostat, '#13#10'Sum(plan.hran) AS Sum_hr' +
      'an, '#13#10'Sum(IIf([PolezOstatki] Is Null,0,([PolezOstatki]))) AS Sum' +
      '_ostat_tek1, '#13#10'Sum(Dayly_fact.hran_tek) AS Sum_hran_tek, '#13#10'Sum(D' +
      'ayly_fact.plan_day) AS Sum_plan_day, '#13#10'Sum(Dayly_fact.plan_nar) ' +
      'AS Sum_plan_nar, '#13#10'Sum(Dayly_fact.graf_nar) AS Sum_graf_nar, '#13#10'S' +
      'um(Dayly_fact.proizv) AS Sum_fakt_nar, '#13#10'Sum(Dayly_fact.otgr_nar' +
      ') AS Sum_otgr_nar, '#13#10'Sum(Dayly_fact.reform) AS Sum_reform, '#13#10'Sum' +
      '(Dayly_fact.vsegoza) AS Sum_vsegoza, '#13#10'Max(plan.PlanUtMSK) AS Pl' +
      'anUtMSK, '#13#10'Sum(Dayly_fact.fakt_nar) AS Prin, '#13#10'Sum(Dayly_fact.Po' +
      'kup) AS Pok,'#13#10'Max(plan.DavUtMsk) AS DavUtMSK, '#13#10'Sum(plan.OstatTo' +
      'v) AS Sum_OstatTov, '#13#10'Sum(Dayly_fact.ostat_tek) AS Sum_ostat_tek' +
      ', '#13#10'Sum(plan.OperPlan) AS Sum_OperPlan'#13#10'FROM plan, PROD_ACC prod' +
      ', Dayly_fact'#13#10'Where  plan.kod = Dayly_fact.kod_plan'#13#10'And plan.pr' +
      'od = PROD.KOD'#13#10'and (Dayly_Fact.data<=datevalue('#39'25.02.2004'#39') AND' +
      ' Format(Dayly_fact.data,'#39'yyyymm'#39')=Format(datevalue('#39'25.02.2004'#39')' +
      ','#39'yyyymm'#39'))'#13#10'GROUP BY PROD.NAIM_PR, Dayly_fact.data'#13#10'HAVING Dayl' +
      'y_fact.data=datevalue('#39'25.02.2004'#39')'
    Parameters = <>
    Left = 480
    Top = 16
  end
  object dsProizv: TDataSource
    DataSet = q_Proizv
    Left = 368
    Top = 17
  end
  object q_Proizv: TOracleDataSet
    SQL.Strings = (
      'SELECT PROD.ID_NPR as KOD,'
      'Dayly_fact.data,'
      'Sum(plan.plan) AS Cur_Plan,'
      'Sum(plan.OperPlan) AS First_Plan,'
      'Sum(Dayly_fact.graf_nar) as Graf_nar,'
      'Sum(Dayly_fact.proizv) AS Cur_Fact,'
      'Sum(Dayly_fact.proizv) - Sum(Dayly_fact.graf_nar) as Otkl_Graf,'
      'Sum(Dayly_fact.proizv) - Sum(plan.plan) as Otkl_Plan'
      'FROM plan_refinery plan, kls_PROD prod, Dayly_fact'
      'Where plan.kod = Dayly_fact.kod_plan And plan.prod = PROD.ID_NPR'
      
        'and Dayly_Fact.data<=:Date1 AND TRUNC(Dayly_fact.data,'#39'MONTH'#39')=T' +
        'RUNC(:Date1,'#39'MONTH'#39')'
      'GROUP BY PROD.ID_NPR, Dayly_fact.data'
      'HAVING Dayly_fact.data=:Date1'
      'ORDER BY PROD.ID_NPR')
    Variables.Data = {0300000001000000060000003A44415445310C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 312
    Top = 16
  end
  object q_Resurs: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  plan_refinery.prod AS KOD_NPR, '
      '  Dayly_fact.data, '
      '  Sum(plan_refinery.plan) AS plan_ost, '
      '  Sum(ostatTov+hran) AS beg_ost, '
      '  Sum(PolezOstatki+hran_tek) AS end_ost'
      
        'FROM plan_refinery INNER JOIN Dayly_fact ON plan_refinery.kod = ' +
        'Dayly_fact.kod_plan'
      'GROUP BY plan_refinery.prod, Dayly_fact.data'
      'HAVING Dayly_fact.data=:Date1')
    Variables.Data = {0300000001000000060000003A44415445310C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 304
    Top = 136
  end
  object q_PlanPererabOil: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  Plan.Kod as kod_plan,'
      '  Plan.Per as plan_per,'
      '  plan.id_prod_npr as PROD_KOD,'
      '  Produkt.abbr_npr as PROD_NAME,'
      '  Sum(Plan.Plan) AS PlanPost,'
      '  Sum(Plan.PlanPerer) AS PlanPerer,'
      '  Sum(Plan.Ostatki) AS Beg_ost'
      'FROM oil_Plan plan, kls_prod, kls_prod Produkt'
      'WHERE Plan.id_Prod_npr = kls_prod.id_npr'
      'AND kls_prod.ID_KIND_NPR=Produkt.id_npr'
      'AND Plan.DataPlan=TRUNC(:Date1,'#39'MONTH'#39')'
      'GROUP BY Plan.Kod, Plan.Per, plan.id_prod_npr, Produkt.abbr_npr')
    Variables.Data = {0300000001000000060000003A44415445310C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 312
    Top = 192
  end
  object q_FactPererabOil: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT'
      '  Resurs.Kod_Plan,'
      '  Sum(Resurs.Post) AS FactPost,'
      '  Sum(Resurs.Perer) AS FactPerer,'
      '  Sum(Resurs.Ostat) AS FactOstat'
      'FROM oil_Resurs resurs'
      'WHERE Resurs.DataRes<=:Date1'
      '  AND TRUNC(Resurs.DataRes,'#39'MONTH'#39')=TRUNC(:Date1,'#39'MONTH'#39')'
      '  AND Resurs.Kod_Plan Is Not Null'
      'GROUP BY Resurs.Kod_Plan')
    Variables.Data = {0300000001000000060000003A44415445310C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0300000004000000080000004B4F445F504C414E010000000008000000464143
      54504F5354010000000009000000464143545045524552010000000009000000
      464143544F535441540100000000}
    Session = f_main.ora_Session
    Active = True
    Left = 304
    Top = 240
  end
end
