object frmPPNew: TfrmPPNew
  Left = 286
  Top = 220
  Width = 500
  Height = 259
  Caption = #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1087#1083#1072#1085#1072' '#1079#1072#1082#1091#1087#1086#1082
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
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 68
    Height = 13
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 34
    Width = 50
    Height = 13
    Caption = #1055#1088#1086#1076#1091#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 39
    Height = 13
    Caption = #1052#1077#1089#1103#1094
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 104
    Width = 30
    Height = 13
    Caption = #1042#1089#1077#1075#1086
  end
  object Label5: TLabel
    Left = 8
    Top = 126
    Width = 62
    Height = 13
    Caption = #1085#1072' '#1093#1088#1072#1085#1077#1085#1080#1077
  end
  object Label6: TLabel
    Left = 8
    Top = 56
    Width = 52
    Height = 13
    Caption = #1055#1086#1079#1080#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbPredpr: TRxDBLookupCombo
    Left = 81
    Top = 8
    Width = 400
    Height = 21
    DropDownCount = 10
    EscapeClear = False
    DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072'>'
    EmptyValue = '0'
    LookupField = 'ID'
    LookupDisplay = 'SHORT_NAME'
    LookupSource = dsPredpr
    TabOrder = 0
  end
  object cbProd: TRxDBLookupCombo
    Left = 81
    Top = 30
    Width = 400
    Height = 21
    DropDownCount = 20
    EscapeClear = False
    DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1086#1076#1091#1082#1090'>'
    EmptyValue = '0'
    LookupField = 'ID_NPR'
    LookupDisplay = 'NAME_NPR'
    LookupSource = dsProd
    TabOrder = 1
  end
  object edAll: TRxCalcEdit
    Left = 80
    Top = 100
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.000'
    NumGlyphs = 2
    TabOrder = 4
  end
  object edHran: TRxCalcEdit
    Left = 80
    Top = 123
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.000'
    NumGlyphs = 2
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 171
    Width = 75
    Height = 25
    Action = acSave
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 6
  end
  object BitBtn2: TBitBtn
    Left = 296
    Top = 171
    Width = 75
    Height = 25
    Action = acExit
    Cancel = True
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 7
  end
  object cbPlanstru: TRxDBLookupCombo
    Left = 81
    Top = 52
    Width = 400
    Height = 21
    DropDownCount = 15
    EscapeClear = False
    DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1079#1080#1094#1080#1102'>'
    EmptyValue = '0'
    LookupField = 'ID'
    LookupDisplay = 'NAME'
    LookupSource = ds_planStru
    TabOrder = 2
  end
  object edDatePlan: TDateTimePicker
    Left = 80
    Top = 76
    Width = 97
    Height = 21
    Date = 37839.812709131950000000
    Time = 37839.812709131950000000
    TabOrder = 3
  end
  object cb_korr: TCheckBox
    Left = 80
    Top = 152
    Width = 97
    Height = 17
    Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
    TabOrder = 8
  end
  object oraQIns: TOracleQuery
    SQL.Strings = (
      'insert into plan_post_svod'
      
        '(DATE_PLAN,VES, HRAN, SUPPLIER_ID, PROD_ID_npr,planstru_id,is_ko' +
        'rr)'
      'values'
      
        '(:DATE_PLAN,:VES, :HRAN, :SUPPLIER_ID, :PROD_ID_npr,:planstru_id' +
        ',:is_korr)')
    Session = oraTSes
    Variables.Data = {
      03000000070000000A0000003A444154455F504C414E0C000000000000000000
      0000040000003A564553040000000000000000000000050000003A4852414E04
      00000000000000000000000C0000003A535550504C4945525F49440300000000
      000000000000000C0000003A50524F445F49445F4E5052030000000000000000
      0000000C0000003A504C414E535452555F494403000000000000000000000008
      0000003A49535F4B4F5252030000000000000000000000}
    Left = 225
    Top = 6
  end
  object oraTSes: TOracleSession
    DesignConnection = True
    Left = 256
    Top = 6
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
    Session = oraTSes
    Left = 225
    Top = 32
  end
  object dsPredpr: TDataSource
    DataSet = oraKls_predpr
    Left = 256
    Top = 32
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
    Session = oraTSes
    Left = 225
    Top = 59
  end
  object dsProd: TDataSource
    DataSet = oraKls_prod
    Left = 257
    Top = 59
  end
  object ActionManager1: TActionManager
    Left = 269
    Top = 134
    StyleName = 'XP Style'
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnExecute = acSaveExecute
    end
    object acExit: TAction
      Caption = #1042#1099#1093#1086#1076
      OnExecute = acExitExecute
    end
  end
  object ora_planStru: TOracleDataSet
    SQL.Strings = (
      '-- '#1055#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072
      'SELECT '
      'ID,'
      'SPF_GROUP_NAME || '#39'-'#39' || NAME as NAME '
      'FROM V_KLS_PLANSTRU_SNP'
      'WHERE parent_id<>218 and id<>218 and spf_group_name<>'#39#1055#1056#1054#1063#1045#1045#39
      'order by spf_order'
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000F00000002000000494401000000000A000000424547494E5F444154
      45010000000008000000454E445F444154450100000000040000004E414D4501
      00000000090000004C4556454C5F504F5301000000000A000000494E5055545F
      444154450100000000070000004B4F445F5347520100000000070000004B4F44
      5F5350470100000000070000004B4F445F525A440100000000070000004B4F44
      5F50525A0100000000070000004B4F445F4752500100000000070000004B4F44
      5F504752010000000009000000504152454E545F494401000000000B0000004E
      415A4E5F4F54475F494401000000000A000000564945575F4C4556454C010000
      0000}
    Session = oraTSes
    Left = 225
    Top = 89
  end
  object ds_planStru: TDataSource
    DataSet = ora_planStru
    Left = 257
    Top = 89
  end
  object oraQUpd: TOracleQuery
    SQL.Strings = (
      'UPDATE plan_post_svod SET'
      
        '(DATE_PLAN,VES, HRAN, SUPPLIER_ID, PROD_ID_npr,planstru_id,is_ko' +
        'rr) ='
      
        '(SELECt :DATE_PLAN,:VES, :HRAN, :SUPPLIER_ID, :PROD_ID_npr,:plan' +
        'stru_id,:is_korr from dual)'
      'WHERE ID=:ID')
    Session = oraTSes
    Variables.Data = {
      03000000080000000A0000003A444154455F504C414E0C000000000000000000
      0000040000003A564553040000000000000000000000050000003A4852414E04
      00000000000000000000000C0000003A535550504C4945525F49440300000000
      000000000000000C0000003A50524F445F49445F4E5052030000000000000000
      0000000C0000003A504C414E535452555F494403000000000000000000000003
      0000003A4944030000000000000000000000080000003A49535F4B4F52520300
      00000000000000000000}
    Left = 321
    Top = 86
  end
end
