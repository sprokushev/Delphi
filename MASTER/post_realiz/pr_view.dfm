object frmPRView: TfrmPRView
  Left = 230
  Top = 189
  Width = 986
  Height = 610
  Caption = #1055#1083#1072#1085' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
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
    Width = 978
    Height = 77
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 392
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
      Left = 504
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
      Top = 5
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
      Top = 5
      Width = 161
      Height = 21
      DropDownCount = 20
      DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1086#1076#1091#1082#1090'>'
      EmptyValue = '0'
      LookupField = 'ID_NPR'
      LookupDisplay = 'NAME_NPR'
      LookupSource = dsProd
      TabOrder = 1
    end
    object cbOrg_stru: TRxDBLookupCombo
      Left = 224
      Top = 53
      Width = 169
      Height = 21
      DropDownCount = 12
      DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1080#1083#1080#1072#1083'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = dsOrg_Stru
      TabOrder = 2
      OnChange = cbOrg_struChange
      OnCloseUp = cbOrg_struChange
      OnExit = cbOrg_struChange
    end
    object cbOrg_kind: TRxDBLookupCombo
      Left = 224
      Top = 30
      Width = 169
      Height = 21
      DropDownCount = 8
      DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1080#1076' '#1086#1073#1098#1077#1082#1090#1072'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = dsOrg_kind
      TabOrder = 3
      OnChange = cbOrg_kindChange
      OnCloseUp = cbOrg_kindChange
      OnExit = cbOrg_kindChange
    end
    object cbVid_Real: TRxDBLookupCombo
      Left = 6
      Top = 51
      Width = 214
      Height = 21
      DropDownCount = 8
      DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1080#1076' '#1088#1077#1072#1083'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = dsVid_real
      TabOrder = 4
    end
    object cbTip_real: TRxDBLookupCombo
      Left = 5
      Top = 29
      Width = 215
      Height = 21
      DropDownCount = 8
      DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1088#1077#1072#1083'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = dsTip_real
      TabOrder = 5
    end
    object edDateFrom: TDateTimePicker
      Left = 408
      Top = 4
      Width = 92
      Height = 21
      Date = 37839.826075081020000000
      Time = 37839.826075081020000000
      TabOrder = 6
    end
    object edDateTo: TDateTimePicker
      Left = 530
      Top = 4
      Width = 92
      Height = 21
      Date = 37839.826075081020000000
      Time = 37839.826075081020000000
      TabOrder = 7
    end
    object cb_Sklad: TRxDBLookupCombo
      Left = 397
      Top = 52
      Width = 169
      Height = 21
      DropDownCount = 12
      DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1073#1098#1077#1082#1090'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = ds_Sklad
      TabOrder = 8
    end
    object cb_Korr: TCheckBox
      Left = 630
      Top = 5
      Width = 97
      Height = 17
      Caption = #1042#1089#1077
      TabOrder = 9
      OnClick = cb_KorrClick
    end
    object cb_PlanStru: TRxDBLookupCombo
      Left = 573
      Top = 28
      Width = 241
      Height = 21
      DropDownCount = 12
      DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1079#1080#1094#1080#1102'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = dsPlanStru
      TabOrder = 10
    end
    object cb_Uchastok: TRxDBLookupCombo
      Left = 397
      Top = 28
      Width = 169
      Height = 21
      DropDownCount = 12
      DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1091#1095#1072#1089#1090#1086#1082'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = ds_Uch
      TabOrder = 11
      OnChange = cb_UchastokChange
      OnCloseUp = cb_UchastokChange
      OnExit = cb_UchastokChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 103
    Width = 978
    Height = 473
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object GridPlan: TDBGridEh
      Left = 1
      Top = 1
      Width = 976
      Height = 471
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      ColumnDefValues.Title.TitleButton = True
      DataSource = dsPP
      EvenRowColor = clInfoBk
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight]
      PopupMenu = TBPopupMenu2
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnExit = GridPlanExit
      Columns = <
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'IS_SIGN1'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          ReadOnly = True
          Width = 31
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'IS_SIGN2'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          ReadOnly = True
          Width = 33
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'IS_KORR'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          ReadOnly = True
          Width = 30
        end
        item
          EditButtons = <>
          FieldName = 'PREDPR'
          Footers = <>
          Width = 222
        end
        item
          EditButtons = <>
          FieldName = 'NPR'
          Footers = <>
          Width = 201
        end
        item
          EditButtons = <>
          FieldName = 'D_PLAN'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'VES'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'FIRST_PLAN'
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUMMA'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'SKLAD'
          Footers = <>
          Width = 133
        end
        item
          EditButtons = <>
          FieldName = 'ORG_STRU'
          Footers = <>
          Width = 226
        end
        item
          EditButtons = <>
          FieldName = 'UCHASTOK'
          Footers = <>
          Width = 220
        end
        item
          EditButtons = <>
          FieldName = 'VID_REAL'
          Footers = <>
          Width = 122
        end
        item
          EditButtons = <>
          FieldName = 'TIP_REAL'
          Footers = <>
          Width = 147
        end
        item
          EditButtons = <>
          FieldName = 'ORG_KIND'
          Footers = <>
          Width = 92
        end
        item
          EditButtons = <>
          FieldName = 'PLANSTRU_NAME'
          Footers = <>
          Width = 345
        end
        item
          EditButtons = <>
          FieldName = 'FROM_NAME'
          Footers = <>
          Width = 314
        end>
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 978
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acAddPlanR
        DisplayMode = nbdmImageAndText
      end
      object TBItem4: TTBItem
        Action = acEditPlanR
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = acDelPlanR
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acApplyPlanR
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object oraSes: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'BUH'
    Connected = True
    Left = 96
    Top = 136
  end
  object oraPP: TOracleDataSet
    SQL.Strings = (
      
        'SELECT /*+ RULE */ predpr.short_name as predpr,pr.IS_SIGN1,pr.IS' +
        '_SIGN2,'
      #9'   PROD.NAME_NPR || '#39' - '#39' || PROD.GOST_NPR as npr,'
      #9'   vid_real.NAME as vid_real,'
      #9'   tip_real.NAME as tip_real,'
      
        '     org_stru.NAME as org_stru, sklad.NAME as sklad, sklad.id as' +
        ' sklad_id,sklad.UCHASTOK_NAME as UCHASTOK, sklad.UCHASTOK_id,'
      
        #9'   org.NAME as org_kind, pr.ves, pr.summa, pr.date_plan, pr.fir' +
        'st_plan,'
      
        #9'   TO_CHAR (pr.date_plan, '#39'DD.MM.YYYY'#39') AS d_plan,pr.rowid, pr.' +
        'ID, predpr.ID as PREDPR_ID,prod.ID_NPR,vid_real.id as vid_real_i' +
        'd,tip_real.id as tip_real_id, org.id as ORG_KIND_ID, org_stru.ID' +
        ' as ORG_STRU_ID, KLS_PLANSTRU.NAME as PLANSTRU_NAME, PLANSTRU_ID' +
        ', IS_KORR,sklad_id_from,from_s.name as from_name,pr.ROWID'
      '  FROM plan_realiz pr,'
      '       kls_org_kind org,'
      '       kls_predpr predpr,'
      '       kls_prod prod,'
      '       kls_vid_real_kons vid_real,'
      '       kls_tip_real_kons tip_real,'
      
        '       org_structure org_stru, v_org_structure sklad, KLS_PLANST' +
        'RU,org_structure from_s'
      ' WHERE pr.PARUS_RN IS NULL AND (pr.org_kind_id = org.ID(+))'
      '        AND (pr.vid_real_id = vid_real.ID(+))'
      '        AND (pr.tip_real_id = tip_real.ID)'
      '        AND (pr.prod_id_npr = prod.id_npr)'
      '        AND (pr.org_stru_id = org_stru.ID)'
      '        AND (pr.supplier_id = predpr.ID)'
      
        '        AND (pr.org_stru_id = org_stru.ID) AND (pr.sklad_id = sk' +
        'lad.ID(+)) AND (pr.planstru_id=KLS_PLANSTRU.ID(+)) AND (pr.sklad' +
        '_id_from=from_s.ID(+)) '
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '--ORDER BY org.NAME,predpr.short_name,prod.id_npr')
    QBEDefinition.QBEFieldDefs = {
      030000001E00000003000000564553010000000006000000445F504C414E0100
      00000009000000444154455F504C414E01000000000600000050524544505201
      00000000030000004E50520100000000080000005649445F5245414C01000000
      00080000005449505F5245414C0100000000080000004F52475F535452550100
      000000080000004F52475F4B494E440100000000020000004944010000000009
      0000005052454450525F494401000000000600000049445F4E50520100000000
      0B0000005649445F5245414C5F494401000000000B0000005449505F5245414C
      5F494401000000000B0000004F52475F535452555F494401000000000B000000
      4F52475F4B494E445F4944010000000005000000534B4C414401000000000800
      0000534B4C41445F494401000000000700000049535F4B4F525201000000000D
      000000504C414E535452555F4E414D4501000000000B000000504C414E535452
      555F494401000000000500000053554D4D4101000000000800000049535F5349
      474E3101000000000800000049535F5349474E3201000000000A000000464952
      53545F504C414E010000000005000000524F57494401000000000D000000534B
      4C41445F49445F46524F4D01000000000900000046524F4D5F4E414D45010000
      0000080000005543484153544F4B01000000000B0000005543484153544F4B5F
      49440100000000}
    UniqueFields = 'ID'
    RefreshOptions = [roBeforeEdit, roAfterUpdate]
    UpdatingTable = 'PLAN_REALIZ'
    Session = oraSes
    AfterOpen = oraPPAfterOpen
    OnFilterRecord = oraPPFilterRecord
    Left = 136
    Top = 136
    object oraPPPREDPR: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldName = 'PREDPR'
      ReadOnly = True
      Size = 30
    end
    object oraPPNPR: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'NPR'
      ReadOnly = True
      Required = True
      Size = 60
    end
    object oraPPVID_REAL: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1077#1072#1083'.'
      FieldName = 'VID_REAL'
      ReadOnly = True
      Required = True
      Size = 30
    end
    object oraPPTIP_REAL: TStringField
      DisplayLabel = #1058#1080#1087' '#1088#1077#1072#1083'.'
      FieldName = 'TIP_REAL'
      ReadOnly = True
      Required = True
      Size = 30
    end
    object oraPPORG_STRU: TStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'ORG_STRU'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object oraPPORG_KIND: TStringField
      DisplayLabel = #1042#1080#1076' '#1086#1073#1098#1077#1082#1090#1072
      FieldName = 'ORG_KIND'
      ReadOnly = True
      Size = 70
    end
    object oraPPVES: TFloatField
      DisplayLabel = #1058#1077#1082#1091#1097#1080#1081' '#1087#1083#1072#1085
      FieldName = 'VES'
      Required = True
      DisplayFormat = '#.###'
      EditFormat = '#.###'
    end
    object oraPPDATE_PLAN: TDateTimeField
      FieldName = 'DATE_PLAN'
      ReadOnly = True
      Required = True
    end
    object oraPPD_PLAN: TStringField
      DisplayLabel = #1055#1077#1088#1080#1086#1076
      FieldName = 'D_PLAN'
      ReadOnly = True
      Size = 10
    end
    object oraPPID: TFloatField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object oraPPPREDPR_ID: TIntegerField
      FieldName = 'PREDPR_ID'
      ReadOnly = True
      Required = True
    end
    object oraPPID_NPR: TStringField
      FieldName = 'ID_NPR'
      ReadOnly = True
      Required = True
      Size = 5
    end
    object oraPPVID_REAL_ID: TFloatField
      FieldName = 'VID_REAL_ID'
      ReadOnly = True
    end
    object oraPPTIP_REAL_ID: TFloatField
      FieldName = 'TIP_REAL_ID'
      ReadOnly = True
      Required = True
    end
    object oraPPORG_KIND_ID: TFloatField
      FieldName = 'ORG_KIND_ID'
      ReadOnly = True
    end
    object oraPPORG_STRU_ID: TFloatField
      FieldName = 'ORG_STRU_ID'
      ReadOnly = True
    end
    object oraPPSKLAD: TStringField
      DisplayLabel = #1054#1073#1098#1077#1082#1090
      FieldName = 'SKLAD'
      ReadOnly = True
      Size = 100
    end
    object oraPPSKLAD_ID: TFloatField
      FieldName = 'SKLAD_ID'
      ReadOnly = True
    end
    object oraPPIS_KORR: TIntegerField
      DisplayLabel = #1050#1086#1088'- '#1088#1077#1082'- '#1090#1080'- '#1088#1086#1074'- '#1082#1072
      FieldName = 'IS_KORR'
    end
    object oraPPPLANSTRU_NAME: TStringField
      DisplayLabel = #1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1086#1082
      FieldName = 'PLANSTRU_NAME'
      ReadOnly = True
      Size = 50
    end
    object oraPPPLANSTRU_ID: TFloatField
      FieldName = 'PLANSTRU_ID'
      ReadOnly = True
    end
    object oraPPSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Required = True
      DisplayFormat = '#.##'
      EditFormat = '#.##'
    end
    object oraPPIS_SIGN1: TIntegerField
      DisplayLabel = #1042#1085#1077'- '#1089#1077'- '#1085#1086
      FieldName = 'IS_SIGN1'
    end
    object oraPPIS_SIGN2: TIntegerField
      DisplayLabel = #1059#1090'- '#1074#1077#1088#1078'- '#1076#1077'- '#1085#1086
      FieldName = 'IS_SIGN2'
    end
    object oraPPFIRST_PLAN: TFloatField
      DisplayLabel = #1055#1077#1088#1074#1086#1085#1072'- '#1095#1072#1083#1100#1085#1099#1081' '#1087#1083#1072#1085
      FieldName = 'FIRST_PLAN'
      Required = True
      DisplayFormat = '#.###'
      EditFormat = '#.###'
    end
    object oraPPROWID: TStringField
      FieldName = 'ROWID'
      Size = 18
    end
    object oraPPSKLAD_ID_FROM: TFloatField
      FieldName = 'SKLAD_ID_FROM'
    end
    object oraPPFROM_NAME: TStringField
      DisplayLabel = #1057#1082#1083#1072#1076' '#1089#1085#1072#1073#1078#1077#1085#1080#1103
      FieldName = 'FROM_NAME'
      Size = 100
    end
    object oraPPUCHASTOK_ID: TFloatField
      FieldName = 'UCHASTOK_ID'
    end
    object oraPPUCHASTOK: TStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1086#1082
      FieldName = 'UCHASTOK'
      Size = 100
    end
  end
  object dsPP: TDataSource
    DataSet = oraPP
    Left = 176
    Top = 136
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 448
    Top = 145
    StyleName = 'XP Style'
    object acAddPlanR: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 20
      OnExecute = acAddPlanRExecute
    end
    object acApplyPlanR: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acApplyPlanRExecute
    end
    object acCopyPlanR: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 39
      OnExecute = acCopyPlanRExecute
    end
    object acEditPlanR: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 8
      OnExecute = acEditPlanRExecute
    end
    object acDelPlanR: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      OnExecute = acDelPlanRExecute
    end
    object acToXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      ImageIndex = 42
      OnExecute = acToXLSExecute
    end
  end
  object oraKls_prod: TOracleDataSet
    SQL.Strings = (
      
        'SELECT KLS_PROD.*, KLS_PROD.NAME_NPR || '#39' - '#39' || KLS_PROD.GOST_N' +
        'PR as DISPLAY_NAME FROM KLS_PROD'
      'WHERE EXISTS '
      '(SELECT NULL'
      '  FROM KLS_PROD_NOMENKLATOR A'
      ' WHERE A.PROD=KLS_PROD.ID_NPR)'
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
  object oraTip_real: TOracleDataSet
    SQL.Strings = (
      '-- '#1058#1080#1087' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      'SELECT * FROM KLS_TIP_REAL_KONS')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = oraSes
    Left = 274
    Top = 88
  end
  object dsTip_real: TDataSource
    DataSet = oraTip_real
    Left = 309
    Top = 88
  end
  object dsVid_real: TDataSource
    DataSet = oraVid_real
    Left = 309
    Top = 117
  end
  object oraVid_real: TOracleDataSet
    SQL.Strings = (
      '-- '#1042#1080#1076' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      'SELECT * FROM KLS_VID_REAL_KONS WHERE ID IN (1,5)')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = oraSes
    Left = 274
    Top = 117
  end
  object oraOrg_kind: TOracleDataSet
    SQL.Strings = (
      '-- '#1042#1080#1076' '#1086#1073#1098#1077#1082#1090#1072
      'SELECT * FROM KLS_ORG_KIND WHERE ID IN (1,5)')
    QBEDefinition.QBEFieldDefs = {
      03000000040000000200000049440100000000040000004E414D450100000000
      0D00000047524F55505F4B494E445F494401000000000F00000047524F55505F
      4B494E445F4E414D450100000000}
    Session = oraSes
    Left = 274
    Top = 146
  end
  object dsOrg_kind: TDataSource
    DataSet = oraOrg_kind
    Left = 309
    Top = 146
  end
  object dsOrg_Stru: TDataSource
    DataSet = oraOrg_Stru
    Left = 309
    Top = 175
  end
  object oraOrg_Stru: TOracleDataSet
    SQL.Strings = (
      '-- '#1060#1080#1083#1080#1072#1083#1099
      'SELECT * FROM ORG_STRUCTURE WHERE PLAN_REAL<>0')
    QBEDefinition.QBEFieldDefs = {
      030000000E000000020000004944010000000006000000414452455353010000
      0000040000004E4F54450100000000040000004E414D4501000000000B000000
      4F52475F4B494E445F49440100000000090000005052454450525F4944010000
      00000B0000004F52475F545950455F494401000000000700000049535F415554
      4F01000000000600000046494C49414C010000000008000000574F524B53484F
      50010000000003000000494E4E01000000000C00000049535F4155544F5F4B4F
      4E53010000000009000000504C414E5F5245414C010000000010000000434954
      595F5052454649585F46494C450100000000}
    Session = oraSes
    Left = 274
    Top = 175
  end
  object ora_Sklad: TOracleDataSet
    SQL.Strings = (
      '-- '#1040#1047#1057
      'SELECT * FROM V_ORG_STRUCTURE '
      'WHERE 1=1'
      '  AND 1=1'
      '  AND 1=1'
      '  AND ID<>FILIAL_ID'
      'ORDER BY FILIAL,FILIAL_ID,TRIM(AZS_NUMB)     ')
    QBEDefinition.QBEFieldDefs = {
      030000001F000000020000004944010000000006000000414452455353010000
      0000040000004E4F54450100000000040000004E414D4501000000000B000000
      4F52475F4B494E445F49440100000000090000005052454450525F4944010000
      00000B0000004F52475F545950455F494401000000000600000046494C49414C
      010000000008000000574F524B53484F50010000000003000000494E4E010000
      00000C00000049535F4155544F5F4B4F4E53010000000009000000504C414E5F
      5245414C010000000010000000434954595F5052454649585F46494C45010000
      00000C00000049535F4155544F5F4C494E4B01000000000B000000434954595F
      494E5F584C5301000000000900000046554C4C5F4E414D4501000000000E0000
      0050415255535F43524E5F4155544F01000000000D00000050415255535F4352
      4E5F4B4E5401000000001000000050415255535F4445504152544D454E540100
      0000001200000050415255535F504C414E5F415A435F44455001000000001300
      000050415255535F504C414E5F4155544F5F4445500100000000110000005041
      5255535F504C414E5F4D425F44455001000000001300000050415255535F504C
      414E5F5452414E5F44455001000000001400000050415255535F504C414E5F41
      5A435F4445505F3201000000001500000050415255535F504C414E5F4155544F
      5F4445505F3201000000001500000050415255535F504C414E5F5452414E5F44
      45505F320100000000040000004142425201000000000900000046494C49414C
      5F494401000000000B00000046494C49414C5F4E414D4501000000000B000000
      46494C49414C5F41424252010000000008000000415A535F4E554D4201000000
      00}
    Session = oraSes
    Left = 274
    Top = 215
  end
  object ds_Sklad: TDataSource
    DataSet = ora_Sklad
    Left = 309
    Top = 215
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = GridPlan
    Options = [pghFitGridToPageWidth, pghRowAutoStretch, pghFitingByColWidths, pghOptimalColWidths]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = RUSSIAN_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -8
    PageHeader.Font.Name = 'Times New Roman'
    PageHeader.Font.Style = []
    PrintFontName = 'MS Sans Serif'
    Units = MM
    Left = 203
    Top = 321
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 448
    Top = 280
  end
  object oraPlanStru: TOracleDataSet
    SQL.Strings = (
      '-- '#1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072
      'SELECT * FROM V_KLS_PLANSTRU_SNP'
      'WHERE SPF_GROUP_NAME='#39#1042#1053#1059#1058#1056#1048#1050#1054#1056#1055#1054#1056#1040#1058#1048#1042#1053#1067#1049' '#1058#1056#1040#1053#1047#1048#1058#39
      'and parent_id<>218'
      'ORDER BY name')
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
  object TBPopupMenu2: TTBPopupMenu
    Images = f_main.img_Common
    Left = 576
    Top = 248
    object TBItem15: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem1: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem1AcceptText
    end
    object TBItem17: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem17Click
    end
    object TBItem18: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem18Click
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem21: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem21Click
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem5: TTBItem
      Action = acToXLS
    end
  end
  object oraFromSklad: TOracleDataSet
    SQL.Strings = (
      '-- '#1060#1080#1083#1080#1072#1083#1099
      'SELECT * FROM ORG_STRUCTURE WHERE PLAN_REAL<>0')
    QBEDefinition.QBEFieldDefs = {
      030000000E000000020000004944010000000006000000414452455353010000
      0000040000004E4F54450100000000040000004E414D4501000000000B000000
      4F52475F4B494E445F49440100000000090000005052454450525F4944010000
      00000B0000004F52475F545950455F494401000000000700000049535F415554
      4F01000000000600000046494C49414C010000000008000000574F524B53484F
      50010000000003000000494E4E01000000000C00000049535F4155544F5F4B4F
      4E53010000000009000000504C414E5F5245414C010000000010000000434954
      595F5052454649585F46494C450100000000}
    Session = oraSes
    Left = 274
    Top = 311
  end
  object dsFromSklad: TDataSource
    DataSet = oraFromSklad
    Left = 309
    Top = 311
  end
  object ora_Uch: TOracleDataSet
    SQL.Strings = (
      '-- '#1059#1095#1072#1089#1090#1082#1080
      'SELECT * FROM V_ORG_STRUCTURE WHERE UCHASTOK_ID<>0'
      ''
      ''
      ''
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000E000000020000004944010000000006000000414452455353010000
      0000040000004E4F54450100000000040000004E414D4501000000000B000000
      4F52475F4B494E445F49440100000000090000005052454450525F4944010000
      00000B0000004F52475F545950455F494401000000000700000049535F415554
      4F01000000000600000046494C49414C010000000008000000574F524B53484F
      50010000000003000000494E4E01000000000C00000049535F4155544F5F4B4F
      4E53010000000009000000504C414E5F5245414C010000000010000000434954
      595F5052454649585F46494C450100000000}
    Session = oraSes
    Left = 354
    Top = 375
  end
  object ds_Uch: TDataSource
    DataSet = ora_Uch
    Left = 389
    Top = 375
  end
end
