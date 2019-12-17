object frmINS17: TfrmINS17
  Left = 544
  Top = 278
  Width = 687
  Height = 659
  Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1086#1088#1076#1077#1088#1072' '#1089#1090#1088#1072#1093#1086#1074#1082#1080' '#1074' '#1055#1072#1088#1091#1089
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
  object Splitter3: TSplitter
    Left = 219
    Top = 99
    Height = 526
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 679
    Height = 99
    Align = alTop
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 456
      Top = 13
      Width = 103
      Height = 80
      Action = acLoad
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1074' '#1055#1072#1088#1091#1089
      TabOrder = 0
      WordWrap = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000C0C0C000FFFFFF00FF00
        0000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FFFFFF00FFFFFF00C0C0
        C000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00C0C0C000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C0C0C000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0080808000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
        0000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF000000C0C0C000FFFFFF00FFFFFF0080000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF000000FFFFFF00C0C0C000FF000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF000000FF00000080000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0080000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Layout = blGlyphTop
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 5
      Width = 441
      Height = 91
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 1
      object Label2: TLabel
        Left = 9
        Top = 20
        Width = 6
        Height = 13
        Caption = #1089
      end
      object Label3: TLabel
        Left = 9
        Top = 52
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object deBeg: TDateEdit
        Left = 25
        Top = 17
        Width = 96
        Height = 21
        DefaultToday = True
        NumGlyphs = 2
        TabOrder = 0
        Text = '17.03.2003'
      end
      object deEnd: TDateEdit
        Left = 25
        Top = 47
        Width = 96
        Height = 21
        DefaultToday = True
        NumGlyphs = 2
        TabOrder = 1
        Text = '17.03.2003'
      end
      object rbKp: TRadioButton
        Left = 128
        Top = 54
        Width = 90
        Height = 17
        Caption = #1050#1085#1103#1078#1055#1086#1075#1086#1089#1090
        TabOrder = 2
      end
      object rbInta: TRadioButton
        Left = 128
        Top = 39
        Width = 90
        Height = 17
        Caption = #1048#1085#1090#1072
        TabOrder = 3
      end
      object rbVor: TRadioButton
        Left = 128
        Top = 24
        Width = 90
        Height = 17
        Caption = #1042#1086#1088#1082#1091#1090#1072
        TabOrder = 4
      end
      object rbArx: TRadioButton
        Left = 128
        Top = 9
        Width = 90
        Height = 17
        Caption = #1040#1088#1093#1072#1085#1075#1077#1083#1100#1089#1082
        TabOrder = 5
      end
      object rbKos: TRadioButton
        Left = 224
        Top = 9
        Width = 90
        Height = 17
        Caption = #1050#1086#1089#1083#1072#1085
        TabOrder = 6
      end
      object rbPech: TRadioButton
        Left = 224
        Top = 24
        Width = 90
        Height = 17
        Caption = #1055#1077#1095#1086#1088#1072
        TabOrder = 7
      end
      object rbSyk: TRadioButton
        Left = 224
        Top = 39
        Width = 90
        Height = 17
        Caption = #1057#1099#1082#1090#1099#1074#1082#1072#1088
        TabOrder = 8
      end
      object rbUs: TRadioButton
        Left = 224
        Top = 54
        Width = 90
        Height = 17
        Caption = #1059#1089#1080#1085#1089#1082
        TabOrder = 9
      end
      object BitBtn1: TBitBtn
        Left = 318
        Top = 58
        Width = 83
        Height = 27
        Action = acFilter
        Caption = #1054#1090#1086#1073#1088#1072#1090#1100
        TabOrder = 10
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF008080800080808000FFFF
          FF00FFFFFF008080800080808000808080008080800000000000FF00FF00FF00
          FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FFFFFF008080800000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FFFFFF008080800080800000FFFF
          FF00FFFFFF000000FF000000FF00808080008080800000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FFFFFF008080800080800000FFFF
          FF00FFFFFF000000FF000000FF00808080008080800000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FFFFFF008080800080800000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FFFFFF008080800080800000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF008000000000000000FFFFFF0080808000808000008000
          0000800000008000000080000000800000008000000080000000FF00FF00FF00
          FF00FF00FF00FF00FF008000000000000000FFFFFF0080808000808000008000
          0000800000008000000080000000800000008000000080000000FF00FF00FF00
          FF00FF00FF00FF00FF008000000080800000FFFFFF0080808000808000000000
          0000800000008000000080000000800000008000000080000000FF00FF00FF00
          FF00FF00FF000000000080800000FFFFFF00FFFFFF00C0C0C000C0C0C0008080
          000080800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF008080000080800000FFFFFF00FFFFFF00C0C0C000C0C0C0008080
          80008080000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          00008080000080808000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
          C000808080008080000080800000FF00FF00FF00FF00FF00FF00FF00FF008080
          000080800000C0C0C000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
          C000C0C0C000808000008080000000000000FF00FF00FF00FF00FF00FF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00}
      end
      object rbPotreb: TRadioButton
        Left = 310
        Top = 24
        Width = 90
        Height = 17
        Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1080
        TabOrder = 11
      end
      object rbUh: TRadioButton
        Left = 310
        Top = 9
        Width = 90
        Height = 17
        Caption = #1059#1093#1090#1072
        TabOrder = 12
      end
      object rbArxPotr: TRadioButton
        Left = 310
        Top = 39
        Width = 112
        Height = 17
        Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1080'('#1040#1060')'
        TabOrder = 13
      end
    end
  end
  object Panel2: TPanel
    Left = 222
    Top = 99
    Width = 457
    Height = 526
    Align = alClient
    TabOrder = 1
    object dbgPR17: TDBGridEh
      Left = 1
      Top = 1
      Width = 455
      Height = 524
      Align = alClient
      AllowedOperations = []
      AutoFitColWidths = True
      DataSource = dsPR17
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghRowHighlight]
      ReadOnly = True
      RowHeight = 4
      RowLines = 1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = dbgPR17GetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DATE_KVIT'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SVED_NUM'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NOM_ZD'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NUM_KVIT'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NUM_CIST'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'STAN_NAME'
          Footers = <>
          Width = 152
        end
        item
          EditButtons = <>
          FieldName = 'TARIF'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TARIF_NDS'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'VES'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TARIF_GUARD'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TARIF_GUARD_NDS'
          Footers = <>
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 99
    Width = 219
    Height = 526
    Align = alLeft
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 1
      Top = 321
      Width = 217
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object mLog: TMemo
      Left = 1
      Top = 324
      Width = 217
      Height = 201
      Align = alClient
      TabOrder = 0
      WordWrap = False
    end
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 217
      Height = 320
      Align = alTop
      AllowedOperations = []
      AutoFitColWidths = True
      DataSource = dsCatalog
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghRowHighlight, dghDialogFind]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          ImageList = frmMain.ImageList2
          ShowImageAndText = True
          Width = 206
          OnGetCellParams = DBGridEh1Columns0GetCellParams
        end>
    end
  end
  object oraMain: TOracleSession
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH.world'
    Connected = True
    Left = 400
    Top = 128
  end
  object oraPR17: TOracleDataSet
    SQL.Strings = (
      'select /*+ ALL_ROWS*/'
      
        ' decode(k.sved_num,0,k.id,k.sved_num) as sved_num ,k.num_cist,u.' +
        'cat_cen_id,m.date_cen,k.num_kvit,k.date_kvit,'
      ' k.VES,'
      
        ' k.nom_zd, k.id,m.date_plan,TRIM (pr.gd_kod) || '#39'/'#39' || TRIM (pr.' +
        'okpo) AS sagnfifo,pr.id as poluch_id,'
      ' k.SUM_STRAH,u.PROC_INSURE  '
      'from kvit k, '
      'month m,kls_predpr pr, '
      'usl_dog u,'
      'kls_vid_otgr v,'
      'kls_planstru ps,kls_dog d'
      'where k.nom_zd=m.nom_zd and m.planstru_id=ps.id'
      'and m.load_abbr=v.load_abbr AND m.poluch_id = pr.ID'
      'and m.npodog_id=d.id (+)'
      'and (m.dog_id=u.DOG_ID and m.usl_number=u.USL_NUMBER)'
      'and m.DOG_ID in ('#39'787'#39','#39'1977'#39') and k.TEX_PD_ID=7176316'
      'and k.bill_id is not null and k.SUM_STRAH>0'
      'and m.nazn_otg_id<>2'
      'and (v.load_type_id=1 or v.load_type_id=6 or v.load_type_id=5)'
      
        'and not exists (select kvit_id from parus_fin where k.id = parus' +
        '_fin.kvit_id and task='#39'IncomingOrders'#39' and subtask=2)'
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
      'order by  k.sved_num')
    QBEDefinition.QBEFieldDefs = {
      0400000011000000030000005645530100000000000200000049440100000000
      0008000000535645445F4E554D010000000000080000004E554D5F4349535401
      00000000000A0000004341545F43454E5F494401000000000008000000444154
      455F43454E010000000000080000004E554D5F4B564954010000000000090000
      00444154455F4B564954010000000000060000004E4F4D5F5A44010000000000
      0500000054415249460100000000000900000054415249465F4E445301000000
      0000090000005354414E5F4E414D450100000000000B00000054415249465F47
      554152440100000000000F00000054415249465F47554152445F4E4453010000
      00000009000000444154455F504C414E010000000000080000005341474E4649
      464F01000000000009000000504F4C5543485F4944010000000000}
    ReadOnly = True
    Session = oraMain
    Left = 432
    Top = 128
    object oraPR17NUM_CIST: TStringField
      DisplayLabel = #8470' '#1062#1080#1089#1090#1077#1088#1085#1099
      FieldName = 'NUM_CIST'
      ReadOnly = True
      Size = 10
    end
    object oraPR17CAT_CEN_ID: TIntegerField
      FieldName = 'CAT_CEN_ID'
      ReadOnly = True
      Required = True
    end
    object oraPR17DATE_CEN: TDateTimeField
      FieldName = 'DATE_CEN'
      ReadOnly = True
    end
    object oraPR17NUM_KVIT: TFloatField
      DisplayLabel = #8470' '#1050#1074#1080#1090#1072#1085#1094#1080#1080
      FieldName = 'NUM_KVIT'
      ReadOnly = True
      Required = True
    end
    object oraPR17DATE_KVIT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATE_KVIT'
      ReadOnly = True
    end
    object oraPR17VES: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'VES'
      ReadOnly = True
      Required = True
    end
    object oraPR17TARIF: TFloatField
      DisplayLabel = #1058#1072#1088#1080#1092
      FieldName = 'TARIF'
      ReadOnly = True
      Required = True
    end
    object oraPR17TARIF_NDS: TFloatField
      DisplayLabel = #1053#1044#1057
      FieldName = 'TARIF_NDS'
      ReadOnly = True
      Required = True
    end
    object oraPR17NOM_ZD: TStringField
      DisplayLabel = #1047#1072#1103#1074#1082#1072
      FieldName = 'NOM_ZD'
      ReadOnly = True
      Required = True
      Size = 12
    end
    object oraPR17ID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object oraPR17STAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103
      FieldName = 'STAN_NAME'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object oraPR17SVED_NUM: TFloatField
      DisplayLabel = #8470' '#1057#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_NUM'
    end
    object oraPR17TARIF_GUARD: TFloatField
      DisplayLabel = #1046'/'#1044' '#1086#1093#1088#1072#1085#1072
      FieldName = 'TARIF_GUARD'
      Required = True
    end
    object oraPR17TARIF_GUARD_NDS: TFloatField
      DisplayLabel = #1046'/'#1044' '#1086#1093#1088#1072#1085#1072' '#1053#1044#1057
      FieldName = 'TARIF_GUARD_NDS'
      Required = True
    end
    object oraPR17DATE_PLAN: TDateTimeField
      FieldName = 'DATE_PLAN'
      Required = True
    end
    object oraPR17SAGNFIFO: TStringField
      FieldName = 'SAGNFIFO'
      Size = 23
    end
    object oraPR17POLUCH_ID: TIntegerField
      FieldName = 'POLUCH_ID'
      Required = True
    end
  end
  object dsPR17: TDataSource
    DataSet = oraPR17
    Left = 496
    Top = 128
  end
  object ActionManager1: TActionManager
    Images = frmMain.ImageList1
    Left = 544
    Top = 128
    StyleName = 'XP Style'
    object acFilter: TAction
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100
      ImageIndex = 2
      OnExecute = acFilterExecute
    end
    object acLoad: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1074' '#1055#1072#1088#1091#1089
      ImageIndex = 8
      OnExecute = acLoadExecute
    end
  end
  object OraQuery: TOracleQuery
    Session = oraMain
    Left = 464
    Top = 128
  end
  object oraParus: TOracleSession
    Left = 452
    Top = 196
  end
  object oraCatalog: TOracleDataSet
    SQL.Strings = (
      
        'select rn,crn,name from v_acatalog where unitcode='#39'IncomingOrder' +
        's'#39)
    QBEDefinition.QBEFieldDefs = {
      040000000800000002000000524E0100000000000300000043524E0100000000
      00040000004E414D4501000000000008000000554E4954434F44450100000000
      000700000056455253494F4E01000000000007000000434F4D50414E59010000
      0000000400000050524956010000000000050000005349474E53010000000000}
    ReadOnly = True
    Session = oraParus
    Left = 268
    Top = 132
  end
  object dsCatalog: TDataSource
    DataSet = mteCatalog
    Left = 268
    Top = 204
  end
  object oraQ: TOracleQuery
    Session = oraParus
    Left = 548
    Top = 196
  end
  object InOrs_ins: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_INORDERSPECS_INSERT('
      '  :nCOMPANY,'
      '  :nPRN,'
      '  :sNOMEN,'
      '  :sNOMMODIF,'
      '  :sNOMNMODIFPACK,'
      '  :sARTICLE,'
      '  :sCELL,'
      '  :sTAXGR,'
      '  :nPLANQUANT,'
      '  :nFACTQUANT,'
      '  :nPLANQUANTALT,'
      '  :nFACTQUANTALT,'
      '  :nPRICE,'
      '  :nPRICEMEAS,'
      '  :nPRICE_CALC_RULE,'
      '  :nACC_PRICE,'
      '  :nACC_PRICEMEAS,'
      '  :dEXPIRY_DATE,'
      '  :sCERTIFICATE,'
      '  :nPLANSUM,'
      '  :nPLANSUMTAX,'
      '  :nFACTSUM,'
      '  :nFACTSUMTAX,'
      '  :sNOTE,'
      '  :sSERNUMB,'
      '  :sBARCODE,'
      '  :sCOUNTRY,'
      '  :sGTD,'
      '  :sPRODUCER,'
      '  :nSTORAGE_TIME,'
      '  :sUMEAS_STORAGE,'
      '  :nRN);'
      'end;')
    Session = oraParus
    Variables.Data = {
      0300000020000000090000003A4E434F4D50414E590300000000000000000000
      00050000003A4E50524E030000000000000000000000070000003A534E4F4D45
      4E0500000000000000000000000A0000003A534E4F4D4D4F4449460500000000
      000000000000000F0000003A534E4F4D4E4D4F4449465041434B050000000000
      000000000000090000003A5341525449434C4505000000000000000000000006
      0000003A5343454C4C050000000000000000000000070000003A535441584752
      0500000000000000000000000B0000003A4E504C414E5155414E540400000000
      000000000000000B0000003A4E464143545155414E5404000000000000000000
      00000E0000003A4E504C414E5155414E54414C54040000000000000000000000
      0E0000003A4E464143545155414E54414C540400000000000000000000000700
      00003A4E50524943450400000000000000000000000B0000003A4E5052494345
      4D454153040000000000000000000000110000003A4E50524943455F43414C43
      5F52554C450500000000000000000000000B0000003A4E4143435F5052494345
      0400000000000000000000000F0000003A4E4143435F50524943454D45415304
      00000000000000000000000D0000003A444558504952595F444154450C000000
      00000000000000000D0000003A53434552544946494341544505000000000000
      0000000000090000003A4E504C414E53554D0400000000000000000000000C00
      00003A4E504C414E53554D544158040000000000000000000000090000003A4E
      4641435453554D0400000000000000000000000C0000003A4E4641435453554D
      544158040000000000000000000000060000003A534E4F544505000000000000
      0000000000090000003A535345524E554D420500000000000000000000000900
      00003A53424152434F4445050000000000000000000000090000003A53434F55
      4E545259050000000000000000000000050000003A5347544405000000000000
      00000000000A0000003A5350524F445543455205000000000000000000000004
      0000003A4E524E0300000000000000000000000E0000003A4E53544F52414745
      5F54494D450300000000000000000000000F0000003A53554D4541535F53544F
      52414745050000000000000000000000}
    Left = 440
    Top = 273
  end
  object InOr_ins: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_INORDERS_INSERT('
      '  :nCOMPANY,'
      '  :nCRN,'
      '  :sJUR_PERS,'
      '  :sSELLER,'
      '  :sFACEACC,'
      '  :sGRAPHPOINT,'
      '  :sPARTY,'
      '  :sSTORE,'
      '  :sSTOPERTYPE,'
      '  :sINDOCTYPE,'
      '  :sINDOCPREF,'
      '  :sINDOCNUMB,'
      '  :dINDOCDATE,'
      '  :nDOCSTATUS,'
      '  :sDIRECTDOCTYPE,'
      '  :sDIRECTDOCNUMB,'
      '  :dDIRECTDOCDATE,'
      '  :sINVDOCTYPE,'
      '  :sINVDOCNUMB,'
      '  :dINVDOCDATE,'
      '  :sCONFDOCTYPE,'
      '  :sCONFDOCNUMB,'
      '  :dCONFDOCDATE,'
      '  :nSIGNTAX,'
      '  :sCURRENCY,'
      '  :nCURCOURS,'
      '  :nCURBASECOURS,'
      '  :nACC_COURS,'
      '  :nACC_BASECOURS,'
      '  :nFA_COURS,'
      '  :nFA_BASECOURS,'
      '  :sAGENT,'
      '  :sCOMMENTS,'
      '  :sALTSIGN1,'
      '  :sALTSIGN2,'
      '  :sALTSIGN3,'
      '  :sALTSIGN4,'
      '  :sALTSIGN5,'
      '  :sALTSIGN6,'
      '  :sALTSIGN7,'
      '  :sALTSIGN8,'
      '  :sALTSIGN9,'
      '  :sALTSIGN10,'
      '  :sAGNFIFO,'
      '  :nRN);'
      'end;')
    Session = oraParus
    Variables.Data = {
      030000002D000000090000003A4E434F4D50414E590300000000000000000000
      00050000003A4E43524E0300000000000000000000000A0000003A534A55525F
      50455253050000000000000000000000080000003A5353454C4C455205000000
      0000000000000000090000003A53464143454143430500000000000000000000
      000C0000003A534752415048504F494E54050000000000000000000000070000
      003A535041525459050000000000000000000000070000003A5353544F524505
      00000000000000000000000C0000003A5353544F504552545950450500000000
      000000000000000B0000003A53494E444F435459504505000000000000000000
      00000B0000003A53494E444F43505245460500000000000000000000000B0000
      003A53494E444F434E554D420500000000000000000000000B0000003A44494E
      444F43444154450C00000000000000000000000B0000003A4E444F4353544154
      55530300000000000000000000000F0000003A53444952454354444F43545950
      450500000000000000000000000F0000003A53444952454354444F434E554D42
      0500000000000000000000000F0000003A44444952454354444F43444154450C
      00000000000000000000000C0000003A53494E56444F43545950450500000000
      000000000000000C0000003A53494E56444F434E554D42050000000000000000
      0000000C0000003A44494E56444F43444154450C00000000000000000000000D
      0000003A53434F4E46444F43545950450500000000000000000000000D000000
      3A53434F4E46444F434E554D420500000000000000000000000D0000003A4443
      4F4E46444F43444154450C0000000000000000000000090000003A4E5349474E
      5441580300000000000000000000000A0000003A5343555252454E4359050000
      0000000000000000000A0000003A4E435552434F555253030000000000000000
      0000000E0000003A4E43555242415345434F5552530300000000000000000000
      000B0000003A4E4143435F434F5552530300000000000000000000000F000000
      3A4E4143435F42415345434F5552530300000000000000000000000A0000003A
      4E46415F434F5552530300000000000000000000000E0000003A4E46415F4241
      5345434F555253030000000000000000000000070000003A534147454E540500
      000000000000000000000A0000003A53434F4D4D454E54530500000000000000
      000000000A0000003A53414C545349474E310500000000000000000000000A00
      00003A53414C545349474E320500000000000000000000000A0000003A53414C
      545349474E330500000000000000000000000A0000003A53414C545349474E34
      0500000000000000000000000A0000003A53414C545349474E35050000000000
      0000000000000A0000003A53414C545349474E36050000000000000000000000
      0A0000003A53414C545349474E370500000000000000000000000A0000003A53
      414C545349474E380500000000000000000000000A0000003A53414C54534947
      4E390500000000000000000000000B0000003A53414C545349474E3130050000
      000000000000000000090000003A5341474E4649464F05000000000000000000
      0000040000003A4E524E030000000000000000000000}
    Left = 552
    Top = 273
  end
  object oraState: TOracleQuery
    SQL.Strings = (
      'BEGIN '
      'P_INORDERS_SET_STATUS '
      '('
      ' :NCOMPANY,'
      ' :NRN,'
      ' :NSTATUS,'
      ' :DWORK_DATE,'
      ' :NWARNING,'
      ' :SMSG);'
      'END;')
    Session = oraParus
    Variables.Data = {
      0300000006000000090000003A4E434F4D50414E590300000000000000000000
      00040000003A4E524E030000000000000000000000080000003A4E5354415455
      530300000000000000000000000B0000003A44574F524B5F444154450C000000
      0000000000000000090000003A4E5741524E494E470300000000000000000000
      00050000003A534D5347050000000000000000000000}
    Left = 504
    Top = 354
  end
  object FindMOL: TOracleQuery
    SQL.Strings = (
      'begin'
      'FIND_DICSTORE_ATTR('
      ':nFLAG_SMART,'
      ':nFLAG_AZS,'
      ':nCOMPANY,'
      ':sNUMB,'
      ':nRN,'
      ':nMOL,'
      ':sMOL,'
      ':nPBE,'
      ':sPBE,'
      ':nCURRENCY,'
      ':sCURRENCY);'
      'end;')
    Session = oraParus
    Variables.Data = {
      030000000B0000000C0000003A4E464C41475F534D4152540300000000000000
      000000000A0000003A4E464C41475F415A530300000000000000000000000900
      00003A4E434F4D50414E59030000000000000000000000060000003A534E554D
      42050000000000000000000000040000003A4E524E0300000000000000000000
      00050000003A4E4D4F4C030000000000000000000000050000003A534D4F4C05
      0000000000000000000000050000003A4E504245030000000000000000000000
      050000003A535042450500000000000000000000000A0000003A4E4355525245
      4E43590300000000000000000000000A0000003A5343555252454E4359050000
      000000000000000000}
    Left = 492
    Top = 236
  end
  object dsdCatalog: TDataSetDriverEh
    KeyFields = 'rn'
    ProviderDataSet = oraCatalog
    ResolveToDataSet = False
    Left = 344
    Top = 256
  end
  object mteCatalog: TMemTableEh
    FieldDefs = <>
    FetchAllOnOpen = True
    IndexDefs = <
      item
        Name = 'mteCatalogIndex1'
        Fields = 'rn'
      end>
    Params = <>
    DataDriver = dsdCatalog
    StoreDefs = True
    TreeList.Active = True
    TreeList.KeyFieldName = 'rn'
    TreeList.RefParentFieldName = 'crn'
    Left = 272
    Top = 256
    object mteCatalogRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object mteCatalogCRN: TFloatField
      FieldName = 'CRN'
    end
    object mteCatalogNAME: TStringField
      DisplayLabel = #1050#1072#1090#1072#1083#1086#1075
      FieldName = 'NAME'
      Required = True
      Size = 160
    end
  end
end
