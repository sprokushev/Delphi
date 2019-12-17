object frmPPView: TfrmPPView
  Left = 112
  Top = 56
  Width = 811
  Height = 610
  Caption = #1055#1083#1072#1085' '#1079#1072#1082#1091#1087#1086#1082
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
    Top = 26
    Width = 803
    Height = 55
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 424
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
      Left = 544
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
    object cbPredpr: TRxDBLookupCombo
      Left = 5
      Top = 4
      Width = 215
      Height = 21
      DropDownCount = 10
      DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'SHORT_NAME'
      LookupSource = dsPredpr
      TabOrder = 0
    end
    object cbProd: TRxDBLookupCombo
      Left = 224
      Top = 4
      Width = 185
      Height = 21
      DropDownCount = 20
      DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1086#1076#1091#1082#1090'>'
      EmptyValue = '0'
      LookupField = 'ID_NPR'
      LookupDisplay = 'NAME_NPR'
      LookupSource = dsProd
      TabOrder = 1
    end
    object edDateFrom: TDateTimePicker
      Left = 445
      Top = 4
      Width = 92
      Height = 21
      Date = 37839.826075081020000000
      Time = 37839.826075081020000000
      TabOrder = 2
    end
    object edDateTo: TDateTimePicker
      Left = 570
      Top = 5
      Width = 92
      Height = 21
      Date = 37839.826075081020000000
      Time = 37839.826075081020000000
      TabOrder = 3
    end
    object cb_PlanStru: TRxDBLookupCombo
      Left = 4
      Top = 28
      Width = 405
      Height = 21
      DropDownCount = 12
      DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1079#1080#1094#1080#1102'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = dsPlanStru
      TabOrder = 4
    end
    object cb_Korr: TCheckBox
      Left = 422
      Top = 29
      Width = 97
      Height = 17
      Caption = #1042#1089#1077
      TabOrder = 5
      OnClick = cb_KorrClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 803
    Height = 502
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 801
      Height = 500
      Align = alClient
      AllowedOperations = []
      DataSource = dsPP
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnDblClick = acEditSvodPPExecute
      OnSortMarkingChanged = DBGridEh1SortMarkingChanged
      Columns = <
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'IS_KORR'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Width = 33
        end
        item
          EditButtons = <>
          FieldName = 'SHORT_NAME'
          Footers = <>
          Title.TitleButton = True
          Width = 242
        end
        item
          EditButtons = <>
          FieldName = 'NAME_NPR'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'VES'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'HRAN'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'PLANSTRU_NAME'
          Footers = <>
          Title.TitleButton = True
          Width = 287
        end
        item
          EditButtons = <>
          FieldName = 'D_PLAN'
          Footers = <>
          Title.TitleButton = True
          Width = 74
        end>
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 803
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acAddSvodPP
        DisplayMode = nbdmImageAndText
      end
      object TBItem4: TTBItem
        Action = acEditSvodPP
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = acDelSvodPP
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acApplySvodPP
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object oraSes: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'BUH'
    Left = 96
    Top = 136
  end
  object oraPP: TOracleDataSet
    SQL.Strings = (
      'SELECT prod.name_npr,'
      #9'   predpr.short_name,'
      #9'   pp.ves, pp.hran,pp.date_plan,pp.is_korr,'
      
        #9'   TO_CHAR (pp.date_plan, '#39'DD.MM.YYYY'#39') AS d_plan,pp.rowid,prod' +
        '.id_npr,predpr.id as predpr_id,planstru.id as planstru_id,pp.ID,' +
        'planstru.SPF_GROUP_NAME || '#39'-'#39' || planstru.NAME as PLANSTRU_NAME' +
        ' '
      
        '  FROM plan_post_svod pp, kls_predpr predpr, kls_prod prod, kls_' +
        'planstru planstru'
      ' WHERE (predpr.ID = pp.supplier_id)'
      '   AND (prod.id_npr = pp.prod_id_npr)'
      '   and (pp.planstru_id=planstru.id(+))'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      
        'ORDER BY predpr.short_name,kod_sgr,kod_spg,kod_rzd,kod_prz,kod_g' +
        'rp,kod_pgr,prod.id_npr')
    QBEDefinition.QBEFieldDefs = {
      030000000D000000080000004E414D455F4E505201000000000A00000053484F
      52545F4E414D450100000000030000005645530100000000040000004852414E
      010000000006000000445F504C414E010000000009000000444154455F504C41
      4E010000000008000000504C535F4E414D4501000000000600000049445F4E50
      520100000000090000005052454450525F494401000000000B000000504C414E
      535452555F4944010000000002000000494401000000000D000000504C414E53
      5452555F4E414D4501000000000700000049535F4B4F52520100000000}
    UniqueFields = 'ID'
    UpdatingTable = 'plan_post_svod'
    Session = oraSes
    Left = 136
    Top = 136
    object oraPPNAME_NPR: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'NAME_NPR'
      Required = True
      Size = 30
    end
    object oraPPSHORT_NAME: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldName = 'SHORT_NAME'
      Size = 30
    end
    object oraPPVES: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'VES'
      Required = True
    end
    object oraPPHRAN: TFloatField
      DisplayLabel = #1061#1088#1072#1085#1077#1085#1080#1077
      FieldName = 'HRAN'
      Required = True
    end
    object oraPPD_PLAN: TStringField
      DisplayLabel = #1055#1077#1088#1080#1086#1076
      FieldName = 'D_PLAN'
      Size = 10
    end
    object oraPPDATE_PLAN: TDateTimeField
      FieldName = 'DATE_PLAN'
      Required = True
    end
    object oraPPID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object oraPPPREDPR_ID: TIntegerField
      FieldName = 'PREDPR_ID'
      Required = True
    end
    object oraPPPLANSTRU_ID: TFloatField
      FieldName = 'PLANSTRU_ID'
    end
    object oraPPID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object oraPPPLANSTRU_NAME: TStringField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072
      FieldName = 'PLANSTRU_NAME'
      Size = 81
    end
    object oraPPIS_KORR: TIntegerField
      DisplayLabel = #1050#1086#1088'- '#1088#1077#1082'- '#1090#1080'- '#1088#1086#1074'- '#1082#1072
      FieldName = 'IS_KORR'
    end
  end
  object dsPP: TDataSource
    DataSet = oraPP
    Left = 176
    Top = 136
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 352
    Top = 137
    StyleName = 'XP Style'
    object acAddSvodPP: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 20
      OnExecute = acAddSvodPPExecute
    end
    object acEditSvodPP: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 8
      OnExecute = acEditSvodPPExecute
    end
    object acDelSvodPP: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acDelSvodPPExecute
    end
    object acApplySvodPP: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acApplySvodPPExecute
    end
  end
  object oraKls_prod: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_PROD'
      'WHERE EXISTS '
      '(SELECT NULL '
      '  FROM KLS_PROD_GROUPS_DESC A, KLS_PROD_GROUPS B '
      ' WHERE A.PROD_GROUPS_ID=B.ID'
      '   AND B.PROD_TYPE_GRP_ID =4'
      '   AND A.PROD_ID_NPR=KLS_PROD.ID_NPR'
      '   )'
      'order by name_npr')
    QBEDefinition.QBEFieldDefs = {
      030000001A0000000600000049445F4E50520100000000080000004E414D455F
      4E505201000000000B00000049445F4B494E445F4E505201000000000C000000
      49445F47524F55505F4E505201000000000D0000004C4F4E475F4E414D455F4E
      5052010000000008000000414242525F4E505201000000000200000049440100
      0000000B000000464C475F414C4C4F574544010000000008000000474F53545F
      4E505201000000000A00000047445F4B4F445F4E505201000000000B00000047
      445F4E414D455F4E50520100000000060000004B4F445F313001000000000800
      00004B4F445F4F4B445001000000000B0000004B4F445F4641535F4D534B0100
      0000000500000045445F495A0100000000080000004E4F524D4F544752010000
      0000070000004641534F564B41010000000007000000564F4C5F464153010000
      000009000000444F525F4E414C4F47010000000005000000414B43495A010000
      00000B00000050524F445F4E41525F494401000000000C00000050524F445F50
      4C414E5F494401000000000C00000050524F445F475531325F49440100000000
      0A0000004D4F535F4752505F494401000000000D000000415A435F50525F4752
      505F494401000000000F00000049445F47524F55505F4E50525F474401000000
      00}
    Session = oraSes
    Left = 241
    Top = 147
  end
  object dsProd: TDataSource
    DataSet = oraKls_prod
    Left = 273
    Top = 147
  end
  object oraKls_predpr: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_PREDPR'
      'WHERE EXISTS'
      '(SELECT NULL'
      '  FROM PREDPR_ROLE A '
      '  WHERE A.PREDPR_ID=KLS_PREDPR.ID '
      '    AND A.KLS_ROLE_ID=4)'
      'order by short_name')
    QBEDefinition.QBEFieldDefs = {
      030000001C00000002000000494401000000000A00000053484F52545F4E414D
      4501000000000B0000005052454450525F4E414D45010000000003000000494E
      4E01000000000B000000504F5354494E4445585F4A01000000000B000000504F
      5354494E4445585F50010000000006000000434954595F500100000000060000
      00434954595F4A010000000009000000414444524553535F5001000000000900
      0000414444524553535F4A0100000000050000004F4B4F4E4801000000000400
      00004F4B504F010000000005000000454D41494C010000000003000000464158
      01000000000500000050484F4E4501000000000900000042414E4B5F4B4F5253
      010000000009000000524547494F4E5F494401000000000A000000484F4C4449
      4E475F494401000000000A000000504552545950455F49440100000000090000
      0054414C4741525F494401000000000600000047445F4B4F4401000000000200
      0000525301000000000800000042414E4B535F49440100000000090000005354
      415445535F4944010000000008000000434C4153535F494401000000000E0000
      00414B43495A5F535645445F4E554D01000000000800000049535F424C4F434B
      0100000000050000004F4B5645440100000000}
    Session = oraSes
    Left = 241
    Top = 120
  end
  object dsPredpr: TDataSource
    DataSet = oraKls_predpr
    Left = 272
    Top = 120
  end
  object oraPlanStru: TOracleDataSet
    SQL.Strings = (
      '-- '#1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072
      'SELECT '
      'ID,'
      'SPF_GROUP_NAME || '#39'-'#39' || NAME as NAME '
      'FROM V_KLS_PLANSTRU_SNP'
      'WHERE parent_id<>218 and id<>218 and spf_group_name<>'#39#1055#1056#1054#1063#1045#1045#39
      'order by spf_order')
    QBEDefinition.QBEFieldDefs = {
      030000001A0000000200000049440100000000040000004E414D450100000000
      0B0000004F52475F4B494E445F494401000000000A000000424547494E5F4441
      5445010000000008000000454E445F444154450100000000090000004C455645
      4C5F504F5301000000000A000000494E5055545F444154450100000000070000
      004B4F445F5347520100000000070000004B4F445F5350470100000000070000
      004B4F445F525A440100000000070000004B4F445F50525A0100000000070000
      004B4F445F4752500100000000070000004B4F445F5047520100000000090000
      00504152454E545F494401000000000B0000004E415A4E5F4F54475F49440100
      0000000A000000564945575F4C4556454C010000000009000000524547494F4E
      5F494401000000000B0000005449505F5245414C5F4944010000000006000000
      464F525F4944010000000008000000464F525F4E414D4501000000000A000000
      464F525F4D4F535F494401000000000F0000005350465F47524F55505F4F5244
      455201000000000E0000005350465F47524F55505F4E414D4501000000000900
      00005350465F4F524445520100000000080000005350465F4E414D4501000000
      00090000004C554B4F494C5F49440100000000}
    Session = oraSes
    Left = 274
    Top = 263
  end
  object dsPlanStru: TDataSource
    DataSet = oraPlanStru
    Left = 309
    Top = 263
  end
end
