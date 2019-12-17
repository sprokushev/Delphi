object f_GDPLan4Anton: Tf_GDPLan4Anton
  Left = 132
  Top = 177
  Width = 858
  Height = 480
  Caption = 'f_GDPLan4Anton'
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 29
    Width = 850
    Height = 424
    Align = alClient
    DataSource = ds_GD_Plan
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
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
        AlwaysShowEditButton = True
        AutoDropDown = True
        EditButtons = <>
        FieldName = 'plat_name'
        Footers = <>
        Width = 242
      end
      item
        AlwaysShowEditButton = True
        AutoDropDown = True
        EditButtons = <>
        FieldName = 'stan_name'
        Footers = <>
        Width = 211
      end
      item
        AlwaysShowEditButton = True
        AutoDropDown = True
        EditButtons = <>
        FieldName = 'Name_npr'
        Footers = <>
      end
      item
        AlwaysShowEditButton = True
        EditButtons = <>
        FieldName = 'ves'
        Footers = <>
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'Tarif'
        Footers = <>
        Width = 98
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 850
    Height = 29
    object TBToolWindow1: TTBToolWindow
      Left = 0
      Top = 0
      Caption = 'TBToolWindow1'
      ClientAreaHeight = 25
      ClientAreaWidth = 840
      FullSize = True
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 7
        Width = 59
        Height = 13
        Caption = #1044#1072#1090#1072' '#1087#1083#1072#1085#1072
      end
      object e_DatePlan: TDateTimePicker
        Left = 78
        Top = 2
        Width = 82
        Height = 21
        Date = 37858.000000000000000000
        Time = 37858.000000000000000000
        TabOrder = 0
        OnCloseUp = e_DatePlanCloseUp
        OnChange = e_DatePlanChange
      end
      object TBToolbar1: TTBToolbar
        Left = 168
        Top = 1
        Width = 63
        Height = 22
        Caption = 'TBToolbar1'
        Images = f_main.img_Common
        TabOrder = 1
        object TBItem1: TTBItem
          Caption = #1042' Excel'
          DisplayMode = nbdmImageAndText
          ImageIndex = 42
          Images = f_main.img_Common
          OnClick = TBItem1Click
        end
      end
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Left = 440
    Top = 40
  end
  object t_GD_Plan: TOracleDataSet
    SQL.Strings = (
      'SELECT a.rowid,a.* FROM AGENT_GDPLAN_FOR_ANTON a'
      'WHERE date_plan=sysdate')
    QBEDefinition.QBEFieldDefs = {
      0300000006000000070000005354414E5F494401000000000B00000050524F44
      5F4E50525F494401000000000300000056455301000000000500000054415249
      46010000000007000000504C41545F4944010000000009000000444154455F50
      4C414E0100000000}
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    UpdatingTable = 'AGENT_GDPLAN_FOR_ANTON'
    Session = ora_Session
    BeforeOpen = t_GD_PlanBeforeOpen
    BeforePost = t_GD_PlanBeforePost
    Left = 472
    Top = 40
    object t_GD_PlanPlat_Name: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldKind = fkLookup
      FieldName = 'plat_name'
      LookupDataSet = t_Plat
      LookupKeyFields = 'ID'
      LookupResultField = 'SHORT_NAME'
      KeyFields = 'PLAT_ID'
      Size = 75
      Lookup = True
    end
    object t_GD_PlanStan_name: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103
      FieldKind = fkLookup
      FieldName = 'stan_name'
      LookupDataSet = t_Stan
      LookupKeyFields = 'ID'
      LookupResultField = 'STAN_NAME'
      KeyFields = 'STAN_ID'
      Size = 40
      Lookup = True
    end
    object t_GD_PlanSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
    object t_GD_PlanPROD_NPR_ID: TStringField
      FieldName = 'PROD_NPR_ID'
      Size = 5
    end
    object t_GD_PlanVES: TFloatField
      DisplayLabel = #1054#1073#1098#1077#1084' ('#1090#1085')'
      FieldName = 'ves'
      DisplayFormat = '#0.000'
      EditFormat = '#0.000'
    end
    object t_GD_PlanTARIF: TFloatField
      DisplayLabel = #1058#1072#1088#1080#1092
      FieldName = 'Tarif'
      ReadOnly = True
      DisplayFormat = '### ### ### ##0'
    end
    object t_GD_PlanPLAT_ID: TFloatField
      FieldName = 'PLAT_ID'
    end
    object t_GD_PlanDATE_PLAN: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1083#1072#1085#1072
      FieldName = 'date_plan'
    end
    object t_GD_PlanName_npr: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldKind = fkLookup
      FieldName = 'Name_npr'
      LookupDataSet = t_prod
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME_NPR'
      KeyFields = 'PROD_NPR_ID'
      Size = 40
      Lookup = True
    end
  end
  object ds_GD_Plan: TDataSource
    DataSet = t_GD_Plan
    Left = 504
    Top = 40
  end
  object t_Plat: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT kls_predpr.id,short_name FROM kls_predpr,kls_dog'
      'WHERE kls_predpr.id=kls_dog.predpr_id AND kls_dog.is_agent=1'
      ' ORDER BY 2')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A00000053484F52545F4E414D
      450100000000}
    UpdatingTable = 'AGENT_GDPLAN_FOR_ANTON'
    Session = ora_Session
    Left = 472
    Top = 72
    object t_PlatID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object t_PlatSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object t_Stan: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id,stan_name || '#39' ('#39' || TO_CHAR(stan_kod) || '#39')'#39' AS stan_' +
        'name FROM kls_stan ORDER BY 2')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000090000005354414E5F4E414D45
      0100000000}
    UpdatingTable = 'AGENT_GDPLAN_FOR_ANTON'
    Session = ora_Session
    Left = 504
    Top = 72
    object t_StanID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object t_StanSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Size = 93
    end
  end
  object t_prod: TOracleDataSet
    SQL.Strings = (
      'SELECT id,name_npr FROM kls_prod_plan '
      'WHERE id between '#39'10300'#39' AND '#39'30000'#39
      'ORDER BY 2')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000080000004E414D455F4E505201
      00000000}
    UpdatingTable = 'AGENT_GDPLAN_FOR_ANTON'
    Session = ora_Session
    Left = 472
    Top = 104
    object t_prodID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object t_prodNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 504
    Top = 104
  end
end
