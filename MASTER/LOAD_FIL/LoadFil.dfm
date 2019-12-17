object f_LoadFil: Tf_LoadFil
  Left = 279
  Top = 106
  Width = 585
  Height = 485
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086#1090' '#1092#1080#1083#1080#1072#1083#1086#1074
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 169
    Width = 577
    Height = 289
    Align = alClient
    DataSource = ds_test
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Width = 252
      end
      item
        EditButtons = <>
        FieldName = 'REAL'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'OST'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 98
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 169
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 112
      Top = 59
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #1060#1080#1083#1080#1072#1083':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 61
      Top = 82
      Width = 103
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1090#1095#1077#1090#1085#1099#1081' '#1084#1077#1089#1103#1094':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 126
      Top = 35
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = #1060#1072#1081#1083':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 5
      Top = 11
      Width = 159
      Height = 13
      Alignment = taRightJustify
      Caption = #1058#1080#1087' '#1079#1072#1075#1088#1091#1078#1072#1077#1084#1086#1075#1086' '#1086#1090#1095#1077#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 282
      Top = 82
      Width = 186
      Height = 13
      Caption = '('#1074#1099#1073#1088#1072#1090#1100' '#1083#1102#1073#1086#1077' '#1095#1080#1089#1083#1086' '#1084#1077#1089#1103#1094#1072')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lc_Filial: TDBLookupComboBox
      Left = 168
      Top = 54
      Width = 393
      Height = 21
      DropDownRows = 10
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = ds_Filials
      TabOrder = 0
    end
    object ed_DateRep: TDateTimePicker
      Left = 168
      Top = 78
      Width = 105
      Height = 21
      Date = 0.367175925925925900
      Time = 0.367175925925925900
      TabOrder = 1
    end
    object ed_Filename: TFilenameEdit
      Left = 168
      Top = 30
      Width = 393
      Height = 21
      OnAfterDialog = ed_FilenameAfterDialog
      DefaultExt = 'XLS'
      Filter = 'Microsoft Excel (*.XLS)|*.XLS'
      DialogOptions = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofShareAware]
      DialogTitle = #1060#1072#1081#1083#1099' '#1080#1079' '#1092#1080#1083#1080#1072#1083#1086#1074
      NumGlyphs = 1
      TabOrder = 2
      OnChange = ed_FilenameChange
    end
    object lc_RepTypes: TDBLookupComboBox
      Left = 168
      Top = 6
      Width = 393
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = ds_FilRepTypes
      TabOrder = 3
    end
    object btToBuf: TBitBtn
      Left = 128
      Top = 136
      Width = 100
      Height = 25
      Caption = #1042' '#1073#1091#1092#1077#1088
      TabOrder = 4
      OnClick = btToBufClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
        44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
        00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
        33833F333383F33300003333AA463362A433333333383F333833F33300003333
        6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
        33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
        6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
        000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
        333383333333F3330000333333322AAA4333333333333833333F333300003333
        333322A4333333333333338333F333330000333333344A433333333333333338
        3F333333000033333336A24333333333333333833F333333000033333336AA43
        33333333333333833F3333330000333333336663333333333333333888333333
        0000}
      NumGlyphs = 2
    end
    object btCancel: TBitBtn
      Left = 464
      Top = 136
      Width = 100
      Height = 25
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 5
      Kind = bkCancel
    end
    object btTest: TBitBtn
      Left = 240
      Top = 136
      Width = 100
      Height = 25
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
      TabOrder = 6
      OnClick = btTestClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btLoad: TBitBtn
      Left = 352
      Top = 136
      Width = 100
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Enabled = False
      TabOrder = 7
      OnClick = btLoadClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object btOpen: TBitBtn
      Left = 16
      Top = 136
      Width = 100
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100
      Enabled = False
      TabOrder = 8
      OnClick = btOpenClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object Panel1: TPanel
      Left = 16
      Top = 104
      Width = 545
      Height = 25
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 9
      object Label6: TLabel
        Left = 7
        Top = 5
        Width = 98
        Height = 13
        Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lb_OrgName: TLabel
        Left = 109
        Top = 5
        Width = 59
        Height = 13
        Caption = 'lb_OrgName'
      end
    end
  end
  object q_FilRepTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM load_fil_rep_types')
    Session = f_main.ora_Session
    Left = 304
    Top = 16
  end
  object ds_FilRepTypes: TDataSource
    DataSet = q_FilRepTypes
    Left = 344
    Top = 16
  end
  object q_Filials: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM ORG_STRUCTURE WHERE filial IS NOT NULL')
    Session = f_main.ora_Session
    Left = 24
    Top = 8
  end
  object ds_Filials: TDataSource
    DataSet = q_Filials
    Left = 64
    Top = 8
  end
  object q_tmp: TOracleDataSet
    Left = 104
    Top = 8
  end
  object pck_Filial: TOraclePackage
    PackageName = 'FOR_FILIAL'
    Left = 456
    Top = 16
  end
  object q_Test: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  NAME,'
      '  REAL,'
      
        '  For_Filial.LAST_OST(FILIAL_ID,FIL_PERIOD_ID,FIL_ORG_ID,REP_TYP' +
        'E_ID) AS OST'
      'FROM'
      '('
      'SELECT'
      '  A.FILIAL_ID,A.FIL_PERIOD_ID,A.FIL_ORG_ID,A.REP_TYPE_ID, '
      '  B.NAME, '
      '  SUM(A.FACT) AS REAL'
      'FROM LOAD_FIL_REALIZ A, LOAD_FIL_ORG B'
      'WHERE A.FIL_ORG_ID=B.ID'
      'AND A.FILIAL_ID=30'
      'AND A.FIL_PERIOD_ID=3'
      'AND A.TYPE_OPER_ID=1'
      'AND A.REP_TYPE_ID=1 '
      'GROUP BY'
      '  A.FILIAL_ID,A.FIL_PERIOD_ID,A.FIL_ORG_ID,A.REP_TYPE_ID, '
      '  B.NAME '
      ')'
      '')
    Session = f_main.ora_Session
    BeforeOpen = q_TestBeforeOpen
    Left = 416
    Top = 80
    object q_TestNAME: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'NAME'
      Size = 100
    end
    object q_TestREAL: TFloatField
      DisplayLabel = #1056#1077#1072#1083#1080#1079#1086#1074#1072#1085#1086' '#1089' '#1085#1072#1095#1072#1083#1072' '#1084#1077#1089#1103#1094#1072
      FieldName = 'REAL'
    end
    object q_TestOST: TFloatField
      DisplayLabel = #1058#1077#1082#1091#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
      FieldName = 'OST'
    end
  end
  object ds_test: TDataSource
    DataSet = q_Test
    Left = 456
    Top = 80
  end
  object q_InsertTmp: TOracleQuery
    SQL.Strings = (
      'INSERT INTO LOAD_BUFFER.TMP_FIL_REALIZ '
      '  (TERMINAL_NAME, OSUSER_NAME, FILIAL_ID, '
      '  DATE_REPORT, FILENAME, DATE_LOAD, REP_TYPE_ID, '
      '  TIP_ORG, NAME_ORG, PROD_TAG, PROD_NAME, FACT) '
      'VALUES ('
      '  For_init.GetCurrTerm,For_init.GetCurrUser, :FILIAL_ID, '
      '  :DATE_REPORT, :FILENAME, :DATE_LOAD, 1, '
      '  :TIP_ORG, :NAME_ORG, :PROD_TAG, :PROD_NAME, :FACT'
      ')')
    Session = f_main.ora_Session
    Variables.Data = {
      03000000090000000A0000003A46494C49414C5F494403000000000000000000
      00000C0000003A444154455F5245504F52540C00000000000000000000000900
      00003A46494C454E414D450500000000000000000000000A0000003A44415445
      5F4C4F41440C0000000000000000000000080000003A5449505F4F5247030000
      000000000000000000090000003A4E414D455F4F524705000000000000000000
      0000090000003A50524F445F5441470500000000000000000000000A0000003A
      50524F445F4E414D45050000000000000000000000050000003A464143540400
      00000000000000000000}
    Left = 88
    Top = 192
  end
end
