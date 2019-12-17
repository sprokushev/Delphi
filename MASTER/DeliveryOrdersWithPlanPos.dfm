inherited f_DeliveryOrdersWithPlanPos: Tf_DeliveryOrdersWithPlanPos
  Left = 249
  Top = 141
  Caption = #1047#1072#1082#1072#1079#1099' '#1087#1086#1089#1090#1072#1097#1080#1082#1086#1074' <-> '#1055#1086#1079#1080#1094#1080#1080' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1082#1080
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 369
    Top = 43
    Height = 345
  end
  object Panel1: TPanel
    Left = 0
    Top = 10
    Width = 752
    Height = 33
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 12
      Height = 13
      Caption = 'c '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 120
      Top = 8
      Width = 23
      Height = 13
      Caption = ' '#1087#1086' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edDateFrom: TDateTimePicker
      Left = 24
      Top = 4
      Width = 92
      Height = 21
      Date = 37839.826075081020000000
      Time = 37839.826075081020000000
      TabOrder = 0
    end
    object edDateTo: TDateTimePicker
      Left = 146
      Top = 5
      Width = 92
      Height = 21
      Date = 37839.826075081020000000
      Time = 37839.826075081020000000
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 388
    Width = 752
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 752
    Height = 10
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem2: TTBItem
        DisplayMode = nbdmImageAndText
      end
      object TBItem1: TTBItem
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object tvCatalog: TvgDBTreeView
    Left = 0
    Top = 43
    Width = 369
    Height = 345
    Hint = #1047#1072#1082#1072#1079#1099' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
    AutoExpand = True
    DataSource = dsDeliveryOrders
    DataFieldID = 'NRN'
    DataFieldParentID = 'NCRN'
    DataFieldText = 'SNAME'
    Options = [toQuickSearch]
    Align = alLeft
    Indent = 19
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
  end
  object DBGridEh1: TDBGridEh
    Left = 432
    Top = 72
    Width = 320
    Height = 120
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 536
    Top = 96
    StyleName = 'XP Style'
  end
  object ParusLogon: TOracleLogon
    Session = ora_Parus
    Retries = 5
    Options = [ldDatabase, ldDatabaseList, ldLogonHistory]
    HistoryRegSection = 'Software\SNP\Master\LogonHistory'
    HistoryWithPassword = True
    Caption = #1048#1084#1103' '#1080' '#1055#1072#1088#1086#1083#1100' '#1074' '#1057#1080#1089#1090#1077#1084#1077' "'#1055#1072#1088#1091#1089'"'
    Left = 528
    Top = 169
  end
  object ora_Parus: TOracleSession
    LogonUsername = 'VANEEV'
    LogonPassword = 'zpsbwv'
    LogonDatabase = 'P5'
    Connected = True
    Left = 568
    Top = 229
  end
  object oraDeliveryOrders: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  RN as nRN,'
      '  CRN as nCRN,'
      '  NAME as sNAME,'
      '  0 as PLANSTRU_ID'
      'from ACATALOG'
      'where DOCNAME='#39'DeliveryOrders'#39
      '  and COMPANY = 2'
      'UNION ALL'
      'SELECT'
      '  nRN,'
      '  nCRN,'
      
        '  TRIM(sORD_DOCTYPE)||'#39', '#39'||TRIM(sORD_PREF)||TRIM(sORD_NUMB)||'#39',' +
        ' '#39'||TO_CHAR(dORD_DATE,'#39'dd.mm.yyyy'#39')||'#39', '#39'||sFACEACC||'#39', '#39'||sAGEN' +
        'T||'#39', '#39'||sSTORE as sNAME,'
      '  NVL(B.PLANSTRU_ID,0) as PLANSTRU_ID'
      'FROM V_DELIVERYORD A, VANEEV.DELIVERYORDERS_WITH_PLANPOS B'
      'where A.NCOMPANY=2'
      'and A.nRN=B.DELIVERYORD_RN(+)'
      'and A.dORD_DATE>=TO_DATE('#39'01.03.2004'#39','#39'dd.mm.yyyy'#39')'
      'and A.dORD_DATE<=TO_DATE('#39'31.03.2004'#39','#39'dd.mm.yyyy'#39')'
      'ORDER BY sNAME')
    QBEDefinition.QBEFieldDefs = {
      0300000004000000030000004E524E0100000000040000004E43524E01000000
      0005000000534E414D4501000000000B000000504C414E535452555F49440100
      000000}
    ReadOnly = True
    Session = ora_Parus
    Active = True
    Left = 316
    Top = 140
    object oraDeliveryOrdersNRN: TFloatField
      FieldName = 'NRN'
    end
    object oraDeliveryOrdersNCRN: TFloatField
      FieldName = 'NCRN'
    end
    object oraDeliveryOrdersSNAME: TStringField
      FieldName = 'SNAME'
      Size = 160
    end
    object oraDeliveryOrdersPLANSTRU_ID: TFloatField
      FieldName = 'PLANSTRU_ID'
    end
  end
  object dsDeliveryOrders: TDataSource
    DataSet = oraDeliveryOrders
    Left = 325
    Top = 193
  end
end
