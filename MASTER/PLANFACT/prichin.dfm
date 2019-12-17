object FormPrichin: TFormPrichin
  Left = 225
  Top = 104
  Width = 784
  Height = 541
  Caption = #1057#1087#1088#1072#1074#1082#1072' '#1086' '#1087#1088#1080#1095#1080#1085#1072#1093' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1086#1090' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1086#1082' '#1087#1086' '#1058#1059
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 776
    Height = 41
    Align = alTop
    TabOrder = 0
    object bt_XLS: TBitBtn
      Left = 56
      Top = 8
      Width = 89
      Height = 25
      Caption = 'XLS ('#1055#1088#1080#1095#1080#1085#1099')'
      TabOrder = 0
      OnClick = bt_XLSClick
    end
    object bt_DBF: TBitBtn
      Left = 8
      Top = 8
      Width = 41
      Height = 25
      Caption = 'DBF'
      TabOrder = 1
      OnClick = bt_DBFClick
    end
    object BitBtn1: TBitBtn
      Left = 472
      Top = 8
      Width = 177
      Height = 25
      Caption = 'XLS ('#1054#1078#1080#1076#1072#1077#1084#1086#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077')'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 152
      Top = 8
      Width = 137
      Height = 25
      Caption = 'XLS ('#1040#1085#1072#1083#1080#1079': '#1087#1088#1086#1076#1091#1082#1090#1099')'
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 296
      Top = 8
      Width = 169
      Height = 25
      Caption = 'XLS ('#1040#1085#1072#1083#1080#1079': '#1087#1086#1079#1080#1094#1080#1080' '#1087#1083#1072#1085#1072')'
      TabOrder = 4
      OnClick = BitBtn3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 776
    Height = 35
    Align = alTop
    TabOrder = 1
    object DBText1: TDBText
      Left = 112
      Top = 10
      Width = 449
      Height = 17
      DataField = 'naim_pr'
      DataSource = ds_prod
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object nav_Prod: TDBNavigator
      Left = 8
      Top = 6
      Width = 96
      Height = 25
      DataSource = ds_prod
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 590
      Top = 1
      Width = 185
      Height = 33
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object rg_Daval: TRadioGroup
        Left = 0
        Top = 0
        Width = 185
        Height = 33
        Align = alClient
        Columns = 2
        Items.Strings = (
          #1051#1059#1050#1054#1049#1051
          #1044#1072#1074#1072#1083#1100#1094#1099)
        TabOrder = 0
        OnClick = rg_DavalClick
      end
    end
  end
  object Panel4: TPanel
    Left = 320
    Top = 76
    Width = 456
    Height = 419
    Align = alClient
    TabOrder = 2
    object Label1: TLabel
      Left = 32
      Top = 59
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1087#1083#1072#1085':'
    end
    object Label2: TLabel
      Left = 5
      Top = 91
      Width = 102
      Height = 13
      Alignment = taRightJustify
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1082' '#1087#1083#1072#1085#1091':'
    end
    object Label3: TLabel
      Left = 70
      Top = 124
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1086#1088#1084#1072':'
    end
    object Label4: TLabel
      Left = 76
      Top = 156
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = #1060#1072#1082#1090':'
    end
    object Label5: TLabel
      Left = 90
      Top = 188
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = '+/-:'
    end
    object DBText2: TDBText
      Left = 20
      Top = 10
      Width = 405
      Height = 17
      Alignment = taCenter
      DataField = 'naim'
      DataSource = ds_struct
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lb_Prichin: TLabel
      Left = 16
      Top = 272
      Width = 401
      Height = 49
      AutoSize = False
      Caption = 'lb_Prichin'
      WordWrap = True
    end
    object lb_Comment: TLabel
      Left = 16
      Top = 368
      Width = 401
      Height = 49
      AutoSize = False
      Caption = 'lb_Comment'
      WordWrap = True
    end
    object Label6: TLabel
      Left = 239
      Top = 155
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = #1042#1089#1077#1075#1086' '#1079#1072#1103#1074#1083#1077#1085#1086':'
    end
    object Label7: TLabel
      Left = 225
      Top = 188
      Width = 98
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1103#1074#1082#1072':'
    end
    object Label8: TLabel
      Left = 262
      Top = 59
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = #1074' '#1090'.'#1095'. '#1054#1041#1055#1056':'
    end
    object Label9: TLabel
      Left = 227
      Top = 124
      Width = 96
      Height = 13
      Alignment = taRightJustify
      Caption = #1074' '#1090'.'#1095'. '#1085#1086#1088#1084#1072' '#1054#1041#1055#1056':'
    end
    object lcbox_Prichin: TDBLookupComboBox
      Left = 16
      Top = 248
      Width = 401
      Height = 21
      KeyField = 'kod_prich'
      ListField = 'kod_prich;prich_name'
      ListFieldIndex = 1
      ListSource = ds_kls_prich
      TabOrder = 1
      TabStop = False
      OnCloseUp = lcbox_PrichinCloseUp
      OnKeyDown = lcbox_PrichinKeyDown
    end
    object ed_Plan: TCurrencyEdit
      Left = 112
      Top = 56
      Width = 105
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      ReadOnly = True
      TabOrder = 3
      OnEnter = ed_PlanEnter
      OnKeyDown = ed_PlanKeyDown
    end
    object ed_IzmPlan: TCurrencyEdit
      Left = 112
      Top = 88
      Width = 105
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      ReadOnly = True
      TabOrder = 5
      OnEnter = ed_IzmPlanEnter
      OnKeyDown = ed_IzmPlanKeyDown
    end
    object ed_Norma: TCurrencyEdit
      Left = 112
      Top = 120
      Width = 105
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      ReadOnly = True
      TabOrder = 6
      OnEnter = ed_NormaEnter
      OnKeyDown = ed_NormaKeyDown
    end
    object ed_Fact: TCurrencyEdit
      Left = 112
      Top = 152
      Width = 105
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      ReadOnly = True
      TabOrder = 8
      OnEnter = ed_FactEnter
      OnKeyDown = ed_FactKeyDown
    end
    object ed_PlusMinus: TCurrencyEdit
      Left = 112
      Top = 184
      Width = 105
      Height = 21
      TabStop = False
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      ReadOnly = True
      TabOrder = 9
    end
    object cb_CanChange: TCheckBox
      Left = 112
      Top = 32
      Width = 281
      Height = 17
      TabStop = False
      Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1094#1080#1092#1088
      TabOrder = 12
      OnClick = cb_CanChangeClick
    end
    object ed_Comment: TLabeledEdit
      Left = 16
      Top = 344
      Width = 401
      Height = 21
      AutoSize = False
      EditLabel.Width = 73
      EditLabel.Height = 13
      EditLabel.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080':'
      TabOrder = 2
      Text = #1044#1086#1083#1078#1085#1086' '#1073#1099#1090#1100' '#1079#1072#1087#1086#1083#1085#1077#1085#1086
      OnChange = ed_CommentChange
      OnEnter = ed_CommentEnter
      OnKeyDown = ed_CommentKeyDown
    end
    object ed_KodPrich: TLabeledEdit
      Left = 16
      Top = 224
      Width = 65
      Height = 21
      EditLabel.Width = 155
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1088#1080#1095#1080#1085#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1086#1090' '#1087#1083#1072#1085#1072':'
      TabOrder = 0
      OnChange = ed_KodPrichChange
      OnEnter = ed_KodPrichEnter
      OnKeyDown = ed_KodPrichKeyDown
    end
    object ed_Zayvtonn: TCurrencyEdit
      Left = 328
      Top = 152
      Width = 97
      Height = 21
      TabStop = False
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      TabOrder = 10
      OnEnter = ed_PlanEnter
      OnKeyDown = ed_PlanKeyDown
    end
    object ed_Zayvdat: TEdit
      Left = 328
      Top = 184
      Width = 97
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 11
      Text = 'ed_Zayvdat'
    end
    object ed_Obpr: TCurrencyEdit
      Left = 328
      Top = 56
      Width = 97
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      ReadOnly = True
      TabOrder = 4
      OnEnter = ed_ObprEnter
      OnKeyDown = ed_ObprKeyDown
    end
    object ed_NormaObpr: TCurrencyEdit
      Left = 328
      Top = 120
      Width = 97
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      ReadOnly = True
      TabOrder = 7
      OnEnter = ed_NormaObprEnter
      OnKeyDown = ed_NormaObprKeyDown
    end
  end
  object grid_Struct: TDBGridEh
    Left = 0
    Top = 76
    Width = 320
    Height = 419
    TabStop = False
    Align = alLeft
    DataSource = ds_struct
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = grid_StructGetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'naim_plan'
        Footers = <>
      end>
  end
  object sb_Info: TStatusBar
    Left = 0
    Top = 495
    Width = 776
    Height = 19
    Panels = <
      item
        Text = 
          'Enter/Tab - '#1089#1083#1077#1076#1091#1102#1097#1077#1077' '#1087#1086#1083#1077'       PgUp/PgDown - '#1089#1084#1077#1085#1072' '#1087#1086#1079#1080#1094#1080#1080' '#1087#1083#1072 +
          #1085#1072'        Ctrl+PgUp/Ctrl+PgDown - '#1089#1084#1077#1085#1072' '#1085'/'#1087#1088#1086#1076#1091#1082#1090#1072
        Width = 50
      end>
  end
  object q_prod: TADOQuery
    Connection = f_f42_prich.PF_Conn
    CursorType = ctStatic
    BeforeScroll = q_prodBeforeScroll
    AfterScroll = q_prodAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  A.ORDNUNG,'
      '  A.KOD_NPR,'
      '  UPPER(B.NAim_pr) AS NAIM_PR'
      'FROM "C:\TMP\prichin.DBF" A,"U:\LUK\DBASES\PROD.DBF" B'
      'WHERE A.kod_sgr<>101 AND A.kod_npr=B.kod'
      'GROUP BY A.ORDNUNG, A.KOD_NPR, B.NAME,B.NAME1'
      'ORDER BY A.ORDNUNG, A.KOD_NPR, B.NAME,B.NAME1'
      ''
      ''
      ' '
      ' '
      '')
    Left = 48
    Top = 168
  end
  object ds_prod: TDataSource
    DataSet = q_prod
    Left = 120
    Top = 176
  end
  object ds_struct: TDataSource
    DataSet = q_struct
    Left = 120
    Top = 112
  end
  object q_struct: TADOQuery
    Connection = f_f42_prich.PF_Conn
    CursorType = ctStatic
    BeforeClose = q_structBeforeClose
    BeforeScroll = q_structBeforeScroll
    AfterScroll = q_structAfterScroll
    OnCalcFields = q_structCalcFields
    Parameters = <
      item
        Name = 'ordnung'
        DataType = ftInteger
        Size = -1
        Value = 2
      end
      item
        Name = 'kod_npr'
        DataType = ftString
        Size = 5
        Value = '10301'
      end>
    SQL.Strings = (
      
        'SELECT prichin.*, LEFT('#39'          '#39',kod_pos-1)+NAIM as NAIM_PLAN' +
        ' FROM "C:\TMP\prichin.DBF" '
      'WHERE ordnung=:ordnung  AND kod_npr=:kod_npr'
      '  AND kod_sgr<>101'
      'ORDER BY ordnung,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_grp'
      ' ')
    Left = 48
    Top = 112
    object q_structbeg_date: TDateField
      FieldName = 'beg_date'
    end
    object q_structend_date: TDateField
      FieldName = 'end_date'
    end
    object q_structordnung: TIntegerField
      FieldName = 'ordnung'
    end
    object q_structkod_npr: TStringField
      FieldName = 'kod_npr'
      FixedChar = True
      Size = 5
    end
    object q_structnaim_pr: TStringField
      FieldName = 'naim_pr'
      FixedChar = True
      Size = 40
    end
    object q_structkod_pos: TIntegerField
      FieldName = 'kod_pos'
    end
    object q_structkod_sgr: TIntegerField
      FieldName = 'kod_sgr'
    end
    object q_structkod_spg: TIntegerField
      FieldName = 'kod_spg'
    end
    object q_structkod_rzd: TIntegerField
      FieldName = 'kod_rzd'
    end
    object q_structkod_prz: TIntegerField
      FieldName = 'kod_prz'
    end
    object q_structkod_grp: TIntegerField
      FieldName = 'kod_grp'
    end
    object q_structnaim: TStringField
      FieldName = 'naim'
      FixedChar = True
      Size = 50
    end
    object q_structkod_sobs: TIntegerField
      FieldName = 'kod_sobs'
    end
    object q_structplan: TBCDField
      FieldName = 'plan'
      DisplayFormat = '0,000'
      EditFormat = '0,000'
      Precision = 15
      Size = 3
    end
    object q_structizm_plan: TBCDField
      FieldName = 'izm_plan'
      DisplayFormat = '0,000'
      EditFormat = '0,000'
      Precision = 15
      Size = 3
    end
    object q_structnorma: TBCDField
      FieldName = 'norma'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object q_structfact: TBCDField
      FieldName = 'fact'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object q_structzayv_tonn: TBCDField
      FieldName = 'zayv_tonn'
      Precision = 10
      Size = 3
    end
    object q_structzayv_dat: TDateField
      FieldName = 'zayv_dat'
    end
    object q_structkod_prich: TIntegerField
      FieldName = 'kod_prich'
    end
    object q_structPLUS_MINUS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PLUS_MINUS'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
      Calculated = True
    end
    object q_structto_mos: TBooleanField
      FieldName = 'to_mos'
    end
    object q_structcomment: TStringField
      FieldName = 'comment'
      FixedChar = True
      Size = 250
    end
    object q_structkod_struct: TBCDField
      FieldName = 'kod_struct'
      Precision = 16
      Size = 0
    end
    object q_structkod_parent: TBCDField
      FieldName = 'kod_parent'
      Precision = 16
      Size = 0
    end
    object q_structnaim_plan: TStringField
      FieldName = 'naim_plan'
      FixedChar = True
      Size = 50
    end
    object q_structrazn_tonn: TBCDField
      FieldName = 'razn_tonn'
      Precision = 10
      Size = 3
    end
    object q_structrazn_dat: TDateField
      FieldName = 'razn_dat'
    end
    object q_structobpr: TBCDField
      FieldName = 'obpr'
      Precision = 15
      Size = 3
    end
    object q_structnorma_obpr: TBCDField
      FieldName = 'norma_obpr'
      Precision = 15
      Size = 3
    end
  end
  object q_kls_prich: TADOQuery
    Connection = f_f42_prich.PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM kls_prch ORDER BY kod_prich')
    Left = 48
    Top = 312
  end
  object ds_kls_prich: TDataSource
    DataSet = q_kls_prich
    Left = 120
    Top = 312
  end
  object q_cmn: TADOQuery
    Connection = f_f42_prich.PF_Conn
    Parameters = <>
    Left = 48
    Top = 248
  end
  object q_to_mos: TADOQuery
    Connection = f_f42_prich.PF_Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '
      
        '  SUBSTR(ALLT(STR(kod_struct,15)),2,12)+PADL(ALLT(STR(prichin.ko' +
        'd_grp)),3,'#39'0'#39') AS kod_plan, gr_real.lukoil_id,'
      '  prichin.naim AS naim_plan,'
      '  prod.kod_10 AS kod_npr,'
      
        '  IIF(prichin.kod_prich<100,'#39'  0'#39',STR(prichin.kod_prich,3)) AS k' +
        'od_prich,'
      
        '  IIF(prichin.comment='#39#39',kls_prch.prich_name,prichin.comment) AS' +
        ' comment,'
      '  razn_tonn*1000 as razn_tonn,'
      '  zayv_tonn*1000 as zayv_tonn'
      
        'FROM "C:\TMP\prichin.dbf" prichin, prod, kls_prch,'#39'U:\LUK\DOGOVO' +
        'R\PLANM\DBF\gr_real.dbf'#39' gr_real'
      
        'WHERE prichin.KOD_SGR = gr_real.KOD_SGR AND prichin.KOD_SPG = gr' +
        '_real.KOD_SPG AND prichin.KOD_RZD = gr_real.KOD_RZD AND prichin.' +
        'KOD_PRZ = gr_real.KOD_PRZ AND prichin.KOD_GRP = gr_real.KOD_GRP ' +
        'AND'
      '  prichin.to_mos = .T. AND'
      '  prichin.kod_npr=prod.kod AND'
      
        '  prichin.kod_prich=kls_prch.kod_prich AND NOT EMPTY(gr_real.luk' +
        'oil_id)')
    Left = 192
    Top = 112
  end
end
