object frmResourceProizv: TfrmResourceProizv
  Left = 231
  Top = 242
  Width = 817
  Height = 539
  Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 809
    Height = 31
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 35
      Height = 13
      Caption = #1044#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object deDate: TDateTimePicker
      Left = 44
      Top = 6
      Width = 95
      Height = 21
      Date = 36717.541841782390000000
      Time = 36717.541841782390000000
      MinDate = 36526.000000000000000000
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 145
      Top = 3
      Width = 97
      Height = 25
      Action = acApply
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF008400000084000000840000008400
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084000000840000008400000084000000840000008400
        00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00
        FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
        FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
        FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
        FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF008400
        0000FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF008400
        0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008400
        00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008400
        0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 31
    Width = 809
    Height = 474
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 807
      Height = 472
      Align = alClient
      AutoFitColWidths = True
      DataSource = dsProizv
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      SumList.Active = True
      SumList.VirtualRecords = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnGetCellParams = DBGridEh1GetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME_NPR'
          Footers = <>
          Title.TitleButton = True
          Width = 156
        end
        item
          EditButtons = <>
          FieldName = 'Sum_OperPlan'
          Footer.FieldName = 'Sum_OperPlan'
          Footer.ValueType = fvtSum
          Footers = <>
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'Max_plan'
          Footer.FieldName = 'Max_plan'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'Sum_ostat'
          Footer.FieldName = 'Sum_ostat'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Sum_hran'
          Footer.FieldName = 'Sum_hran'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Sum_fakt_nar'
          Footer.FieldName = 'Sum_fakt_nar'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
          Width = 79
        end
        item
          EditButtons = <>
          FieldName = 'OtklGraf'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'Prin'
          Footer.FieldName = 'Prin'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Sum_otgr_nar'
          Footer.FieldName = 'Sum_otgr_nar'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Sum_ostat_tek'
          Footer.FieldName = 'Sum_ostat_tek'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Sum_hran_tek'
          Footer.FieldName = 'Sum_hran_tek'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end>
    end
  end
  object dsProizv: TDataSource
    DataSet = oraPP
    Left = 248
    Top = 17
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 592
    Top = 65
    StyleName = 'XP Style'
    object acApply: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acApplyExecute
    end
  end
  object oraSes: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'BUH'
    Connected = True
    Left = 256
    Top = 104
  end
  object oraPP: TOracleDataSet
    SQL.Strings = (
      'SELECT PROD.NAME_NPR , '
      'Dayly_fact.data, '
      'Sum(plan.plan) AS Max_plan, '
      'Sum(plan.ostat) AS Sum_ostat, '
      'Sum(plan.hran) AS Sum_hran, '
      'Sum(NVL(Dayly_fact.PolezOstatki,0)) AS Sum_ostat_tek1, '
      'Sum(Dayly_fact.hran_tek) AS Sum_hran_tek, '
      'Sum(Dayly_fact.plan_day) AS Sum_plan_day, '
      'Sum(Dayly_fact.plan_nar) AS Sum_plan_nar, '
      'Sum(Dayly_fact.graf_nar) AS Sum_graf_nar, '
      'Sum(Dayly_fact.proizv) AS Sum_fakt_nar, '
      'Sum(Dayly_fact.otgr_nar) AS Sum_otgr_nar, '
      'Sum(Dayly_fact.reform) AS Sum_reform, '
      'Sum(Dayly_fact.vsegoza) AS Sum_vsegoza, '
      'Max(plan.PlanUtMSK) AS PlanUtMSK, '
      'Sum(Dayly_fact.fakt_nar) AS Prin, '
      'Sum(Dayly_fact.Pokup) AS Pok,'
      'Max(plan.DavUtMsk) AS DavUtMSK, '
      'Sum(plan.OstatTov) AS Sum_OstatTov, '
      'Sum(Dayly_fact.ostat_tek) AS Sum_ostat_tek, '
      'Sum(plan.OperPlan) AS Sum_OperPlan'
      'FROM plan_refinery plan, kls_PROD prod, Dayly_fact'
      'Where  plan.kod = Dayly_fact.kod_plan'
      'And plan.prod = PROD.id_npr'
      
        'and Dayly_Fact.data between trunc(to_date(:db,'#39'dd.mm.yyyy'#39'),'#39'MON' +
        'TH'#39') AND to_date('#39'21.06.2005'#39','#39'dd.mm.yyyy'#39')'
      'GROUP BY PROD.NAME_NPR, Dayly_fact.data'
      'HAVING Dayly_fact.data=to_date(:db,'#39'dd.mm.yyyy'#39')')
    Variables.Data = {0300000001000000030000003A4442050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000015000000080000004E414D455F4E5052010000000000040000004441
      5441010000000000080000004D41585F504C414E010000000000090000005355
      4D5F4F535441540100000000000800000053554D5F4852414E0100000000000E
      00000053554D5F4F535441545F54454B310100000000000C00000053554D5F48
      52414E5F54454B0100000000000C00000053554D5F504C414E5F444159010000
      0000000C00000053554D5F504C414E5F4E41520100000000000C00000053554D
      5F475241465F4E41520100000000000C00000053554D5F46414B545F4E415201
      00000000000C00000053554D5F4F5447525F4E41520100000000000A00000053
      554D5F5245464F524D0100000000000B00000053554D5F565345474F5A410100
      0000000009000000504C414E55544D534B010000000000040000005052494E01
      000000000003000000504F4B0100000000000800000044415655544D534B0100
      000000000C00000053554D5F4F53544154544F560100000000000D0000005355
      4D5F4F535441545F54454B0100000000000C00000053554D5F4F504552504C41
      4E010000000000}
    UniqueFields = 'ID'
    RefreshOptions = [roBeforeEdit, roAfterUpdate]
    UpdatingTable = 'PLAN_REALIZ'
    Session = oraSes
    OnCalcFields = oraPPCalcFields
    Left = 296
    Top = 104
    object oraPPdata: TDateTimeField
      FieldName = 'data'
    end
    object oraPPMax_plan: TFloatField
      DisplayLabel = #1055#1083#1072#1085'|'#1086#1087#1077#1088#1072#1090#1080#1074#1085#1099#1081
      FieldName = 'Max_plan'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_ostat: TFloatField
      DisplayLabel = #1053#1072' '#1085#1072#1095#1072#1083#1086' '#1084#1077#1089#1103#1094#1072'|'#1086#1089#1090#1072#1090#1082#1080
      FieldName = 'Sum_ostat'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_hran: TFloatField
      DisplayLabel = #1053#1072' '#1085#1072#1095#1072#1083#1086' '#1084#1077#1089#1103#1094#1072'|'#1085#1072' '#1093#1088#1072#1085#1077#1085#1080#1080
      FieldName = 'Sum_hran'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_ostat_tek1: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1082#1080' '#1090#1077#1082#1091#1097#1080#1077
      FieldName = 'Sum_ostat_tek1'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_hran_tek: TFloatField
      DisplayLabel = #1058#1077#1082#1091#1097#1080#1077' '#1086#1089#1090#1072#1090#1082#1080'|'#1085#1072' '#1093#1088#1072#1085#1077#1085#1080#1080
      FieldName = 'Sum_hran_tek'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_plan_day: TFloatField
      FieldName = 'Sum_plan_day'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_plan_nar: TFloatField
      FieldName = 'Sum_plan_nar'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_graf_nar: TFloatField
      FieldName = 'Sum_graf_nar'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_fakt_nar: TFloatField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1077#1076#1077#1085#1086
      FieldName = 'Sum_fakt_nar'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_otgr_nar: TFloatField
      DisplayLabel = #1054#1090#1075#1088#1091#1078#1077#1085#1086
      FieldName = 'Sum_otgr_nar'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_reform: TFloatField
      FieldName = 'Sum_reform'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_vsegoza: TFloatField
      DisplayLabel = #1047#1072#1103#1074#1083#1077#1085#1086
      FieldName = 'Sum_vsegoza'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPPlanUtMSK: TFloatField
      FieldName = 'PlanUtMSK'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPPrin: TFloatField
      DisplayLabel = #1055#1088#1080#1085#1103#1090#1086
      FieldName = 'Prin'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPPok: TFloatField
      FieldName = 'Pok'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPDavUtMSK: TFloatField
      FieldName = 'DavUtMSK'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_OstatTov: TFloatField
      DisplayLabel = #1055#1086#1083#1077#1079#1085#1099#1077' '#1086#1089#1090#1072#1090#1082#1080
      FieldName = 'Sum_OstatTov'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_ostat_tek: TFloatField
      DisplayLabel = #1058#1077#1082#1091#1097#1080#1077' '#1086#1089#1090#1072#1090#1082#1080'|'#1053#1055#1047
      FieldName = 'Sum_ostat_tek'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPSum_OperPlan: TFloatField
      DisplayLabel = #1055#1083#1072#1085'|'#1085#1072' '#1084#1077#1089#1103#1094
      FieldName = 'Sum_OperPlan'
      DisplayFormat = '### ### ### ###.000'
    end
    object oraPPOtklGraf: TFloatField
      DisplayLabel = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077'|'#1086#1090' '#1075#1088#1072#1092#1080#1082#1072
      FieldKind = fkCalculated
      FieldName = 'OtklGraf'
      DisplayFormat = '### ### ### ###.000'
      Calculated = True
    end
    object oraPPNAME_NPR: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
  end
end
