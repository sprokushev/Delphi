object frmUSL17: TfrmUSL17
  Left = 85
  Top = 170
  Width = 990
  Height = 709
  Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1086#1088#1076#1077#1088#1072' ('#1091#1089#1083#1091#1075#1080') '#1074' '#1055#1072#1088#1091#1089
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
    Left = 185
    Top = 89
    Height = 589
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 982
    Height = 89
    Align = alTop
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 507
      Top = 4
      Width = 126
      Height = 52
      Action = acLoad
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1074' '#1055#1072#1088#1091#1089
      TabOrder = 0
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
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = -1
      Width = 491
      Height = 88
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 1
      object Label2: TLabel
        Left = 9
        Top = 19
        Width = 6
        Height = 13
        Caption = #1089
      end
      object Label3: TLabel
        Left = 9
        Top = 53
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object deBeg: TDateEdit
        Left = 25
        Top = 16
        Width = 84
        Height = 21
        DefaultToday = True
        NumGlyphs = 2
        TabOrder = 0
        Text = '17.03.2003'
      end
      object deEnd: TDateEdit
        Left = 25
        Top = 48
        Width = 84
        Height = 21
        DefaultToday = True
        NumGlyphs = 2
        TabOrder = 1
        Text = '17.03.2003'
      end
      object rbArx: TRadioButton
        Left = 113
        Top = 8
        Width = 90
        Height = 17
        Caption = #1040#1088#1093#1072#1085#1075#1077#1083#1100#1089#1082
        TabOrder = 2
      end
      object rbVor: TRadioButton
        Left = 113
        Top = 22
        Width = 90
        Height = 17
        Caption = #1042#1086#1088#1082#1091#1090#1072
        TabOrder = 3
      end
      object rbInta: TRadioButton
        Left = 113
        Top = 38
        Width = 90
        Height = 17
        Caption = #1048#1085#1090#1072
        TabOrder = 4
      end
      object rbKp: TRadioButton
        Left = 113
        Top = 54
        Width = 90
        Height = 17
        Caption = #1050#1085#1103#1078#1055#1086#1075#1086#1089#1090
        TabOrder = 5
      end
      object rbUs: TRadioButton
        Left = 294
        Top = 9
        Width = 90
        Height = 17
        Caption = #1059#1089#1080#1085#1089#1082
        TabOrder = 6
      end
      object rbSyk: TRadioButton
        Left = 203
        Top = 54
        Width = 90
        Height = 17
        Caption = #1057#1099#1082#1090#1099#1074#1082#1072#1088
        TabOrder = 7
      end
      object rbPech: TRadioButton
        Left = 203
        Top = 23
        Width = 90
        Height = 17
        Caption = #1055#1077#1095#1086#1088#1072
        TabOrder = 8
      end
      object rbKos: TRadioButton
        Left = 203
        Top = 8
        Width = 90
        Height = 17
        Caption = #1050#1086#1089#1083#1072#1085
        TabOrder = 9
      end
      object rbUh: TRadioButton
        Left = 294
        Top = 24
        Width = 90
        Height = 17
        Caption = #1059#1093#1090#1072
        TabOrder = 10
      end
      object rbPotreb: TRadioButton
        Left = 294
        Top = 38
        Width = 90
        Height = 17
        Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1080
        TabOrder = 11
      end
      object BitBtn1: TBitBtn
        Left = 407
        Top = 59
        Width = 81
        Height = 26
        Action = acFilter
        Caption = #1054#1090#1086#1073#1088#1072#1090#1100
        TabOrder = 12
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
      object rbArxPotr: TRadioButton
        Left = 294
        Top = 54
        Width = 112
        Height = 17
        Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1080'('#1040#1060')'
        TabOrder = 13
      end
      object rbPAZS: TRadioButton
        Left = 203
        Top = 38
        Width = 90
        Height = 17
        Caption = #1055#1077#1095#1086#1088#1072' '#1040#1047#1057
        TabOrder = 14
      end
      object rbVog: TRadioButton
        Left = 400
        Top = 9
        Width = 88
        Height = 17
        Caption = #1042#1086#1075#1074#1072#1079#1076#1080#1085#1086
        TabOrder = 15
      end
      object rbLabyt: TRadioButton
        Left = 401
        Top = 24
        Width = 87
        Height = 17
        Caption = #1051#1072#1073#1099#1090#1085#1072#1085#1075#1080
        TabOrder = 16
      end
      object rbAviaTran: TRadioButton
        Left = 402
        Top = 40
        Width = 87
        Height = 17
        Caption = #1040#1074#1080#1072#1090#1088#1072#1085#1089
        TabOrder = 17
      end
    end
    object cbKorrekt: TCheckBox
      Left = 504
      Top = 60
      Width = 129
      Height = 17
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1086#1095#1085#1099#1077
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 188
    Top = 89
    Width = 794
    Height = 589
    Align = alClient
    TabOrder = 1
    object dbgPR17: TDBGridEh
      Left = 1
      Top = 1
      Width = 792
      Height = 587
      Align = alClient
      AllowedOperations = []
      AutoFitColWidths = True
      DataSource = dsPR17
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clScrollBar
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghRowHighlight]
      ParentFont = False
      ReadOnly = True
      RowHeight = 4
      RowLines = 1
      SumList.Active = True
      SumList.VirtualRecords = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleHeight = 30
      OnGetCellParams = dbgPR17GetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DATE_KVIT'
          Footer.Value = #1048#1090#1086#1075#1086':'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 51
        end
        item
          EditButtons = <>
          FieldName = 'SVED_NUM'
          Footer.FieldName = 'ID'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
        end
        item
          EditButtons = <>
          FieldName = 'NUM_CIST'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'NUM_KVIT'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'NOM_ZD'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
        end
        item
          EditButtons = <>
          FieldName = 'SUM'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
        end
        item
          EditButtons = <>
          FieldName = 'NDS'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 89
    Width = 185
    Height = 589
    Align = alLeft
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 183
      Height = 587
      Align = alClient
      AllowedOperations = []
      AutoFitColWidths = True
      DataSource = dsCat
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
      TabOrder = 0
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
    BytesPerCharacter = bc2Bytes
    Left = 368
    Top = 176
  end
  object oraPR17: TOracleDataSet
    SQL.Strings = (
      'select /*+ ALL_ROWS*/'
      
        ' decode(k.sved_num,0,to_char(k.num_kvit),to_char(k.sved_num)) as' +
        ' sved_num ,decode(k.sved_num,0,k.id,k.num_cist) as num_cist,u.ca' +
        't_cen_id,'
      
        ' last_day(k.date_kvit) as date_kvit,k.date_cena as date_cen,k.nu' +
        'm_kvit, '
      
        ' k.SUM_VOZN11+k.SUM_VOZN12 as sum, k.SUM_VOZN11_NDS+k.SUM_VOZN12' +
        '_NDS as nds,pr.id as poluch_id,'
      ' k.nom_zd, k.id,k.mesto_id,m.date_plan,m.stan_id'
      ' from kvit k, '
      'month m, kls_planstru ps,'
      'usl_dog u,kls_predpr pr,'
      'kls_vid_otgr v,'
      'kls_dog d,zakaz z, zakaz unp'
      'where k.nom_zd=m.nom_zd and m.planstru_id=ps.id'
      'and m.load_abbr=v.load_abbr and m.poluch_id=pr.id'
      'and (m.dog_id=u.DOG_ID and m.usl_number=u.USL_NUMBER)'
      'and z.dog_id=d.id '
      'and m.ZAKAZ_ID=unp.ID and unp.IS_AGENT=1'
      'and k.bill_id is not null '
      'and k.SUM_VOZN11+k.SUM_VOZN12 >0'
      'and m.nazn_otg_id<>2 and unp.LINK_ID=z.ID and z.IS_AGENT=2'
      'and (v.load_type_id=1 or v.load_type_id=6 or v.load_type_id=5)'
      
        'and not exists (select kvit_id from parus_fin where k.id = parus' +
        '_fin.kvit_id and parus_fin.task='#39'IncomingOrders'#39' and parus_fin.s' +
        'ubtask=3)'
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
      040000000E00000002000000494401000000000008000000535645445F4E554D
      010000000000080000004E554D5F434953540100000000000A0000004341545F
      43454E5F494401000000000008000000444154455F43454E0100000000000800
      00004E554D5F4B56495401000000000009000000444154455F4B564954010000
      000000060000004E4F4D5F5A44010000000000080000004D4553544F5F494401
      000000000009000000444154455F504C414E0100000000000300000053554D01
      0000000000030000004E445301000000000009000000504F4C5543485F494401
      0000000000070000005354414E5F4944010000000000}
    ReadOnly = True
    Session = oraMain
    Left = 432
    Top = 176
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
      DisplayLabel = #1050#1074#1080#1090#1072#1085#1094#1080#1103
      FieldName = 'NUM_KVIT'
      ReadOnly = True
      Required = True
    end
    object oraPR17DATE_KVIT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATE_KVIT'
      ReadOnly = True
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
    object oraPR17MESTO_ID: TIntegerField
      FieldName = 'MESTO_ID'
      Required = True
    end
    object oraPR17DATE_PLAN: TDateTimeField
      FieldName = 'DATE_PLAN'
      Required = True
    end
    object oraPR17SVED_NUM: TStringField
      DisplayLabel = #8470' '#1057#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_NUM'
      Size = 40
    end
    object oraPR17NUM_CIST: TFloatField
      DisplayLabel = #8470' '#1062#1080#1089#1090#1077#1088#1085#1099
      FieldName = 'NUM_CIST'
    end
    object oraPR17SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUM'
    end
    object oraPR17NDS: TFloatField
      DisplayLabel = #1053#1044#1057
      FieldName = 'NDS'
    end
    object oraPR17POLUCH_ID: TIntegerField
      FieldName = 'POLUCH_ID'
      Required = True
    end
    object oraPR17STAN_ID: TFloatField
      FieldName = 'STAN_ID'
      Required = True
    end
  end
  object dsPR17: TDataSource
    DataSet = oraPR17
    Left = 552
    Top = 176
  end
  object ActionManager1: TActionManager
    Images = frmMain.ImageList1
    Left = 656
    Top = 16
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
    Left = 496
    Top = 176
  end
  object oraParus: TOracleSession
    Left = 35
    Top = 156
  end
  object oraCatalog: TOracleDataSet
    SQL.Strings = (
      
        'select RN, CRN, NAME from v_acatalog where unitcode='#39'IncomingOrd' +
        'ers'#39' order by signs,crn nulls first ')
    QBEDefinition.QBEFieldDefs = {
      040000000800000002000000524E0100000000000300000043524E0100000000
      00040000004E414D4501000000000008000000554E4954434F44450100000000
      000700000056455253494F4E01000000000007000000434F4D50414E59010000
      0000000400000050524956010000000000050000005349474E53010000000000}
    ReadOnly = True
    Session = oraParus
    Left = 92
    Top = 156
  end
  object oraQ: TOracleQuery
    Session = oraParus
    Left = 142
    Top = 156
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
    Left = 144
    Top = 207
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
    Left = 31
    Top = 207
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
    Left = 96
    Top = 282
  end
  object qLinkIn: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_DOCINPT_BASE_INSERT'
      '('
      '  :nCOMPANY,'
      '  :sUNITCODE,'
      '  :nDOCUMENT,'
      '  :nPRN_DOCUMENT,'
      '  :dIN_DATE,'
      '  :nSTATUS,'
      '  :nBREAKUP_KIND,'
      '  :nRN'
      ');'
      'end;')
    Session = oraParus
    Variables.Data = {
      0300000008000000090000003A4E434F4D50414E590300000000000000000000
      000A0000003A53554E4954434F44450500000000000000000000000A0000003A
      4E444F43554D454E540300000000000000000000000E0000003A4E50524E5F44
      4F43554D454E54030000000000000000000000090000003A44494E5F44415445
      0C0000000000000000000000080000003A4E5354415455530300000000000000
      000000000E0000003A4E425245414B55505F4B494E4403000000000000000000
      0000040000003A4E524E030000000000000000000000}
    Left = 20
    Top = 326
  end
  object qInS: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_DOCINPT_FIND('
      '  1,'
      '  2,'
      '  '#39'DeliveryOrders'#39','
      '  :nDOCUMENT,'
      '  :nRESULT,'
      '  1);'
      'end;')
    Session = oraParus
    Variables.Data = {
      03000000020000000A0000003A4E444F43554D454E5403000000000000000000
      0000080000003A4E524553554C54030000000000000000000000}
    Left = 20
    Top = 411
  end
  object qLink: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_DOCLINKS_INSERT'
      '('
      '  :nIN_DOC,'
      '  :nOUT_DOC'
      ');'
      'end;')
    Session = oraParus
    Variables.Data = {
      0300000002000000080000003A4E494E5F444F43030000000000000000000000
      090000003A4E4F55545F444F43030000000000000000000000}
    Left = 76
    Top = 325
  end
  object qLinkOut: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_DOCOUTPT_BASE_INSERT'
      '('
      '  :nCOMPANY,'
      '  :sUNITCODE,'
      '  :nDOCUMENT,'
      '  :nPRN_DOCUMENT,'
      '  :dIN_DATE,'
      '  :nSTATUS,'
      '  :nBREAKUP_KIND,'
      '  :nRN'
      ');'
      'end;'
      '')
    Session = oraParus
    Variables.Data = {
      0300000008000000090000003A4E434F4D50414E590300000000000000000000
      000A0000003A53554E4954434F44450500000000000000000000000A0000003A
      4E444F43554D454E540300000000000000000000000E0000003A4E50524E5F44
      4F43554D454E54030000000000000000000000090000003A44494E5F44415445
      0C0000000000000000000000080000003A4E5354415455530300000000000000
      000000000E0000003A4E425245414B55505F4B494E4403000000000000000000
      0000040000003A4E524E030000000000000000000000}
    Left = 140
    Top = 326
  end
  object dsCat: TDataSource
    DataSet = mteCatalog
    Left = 376
    Top = 280
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
    Left = 424
    Top = 280
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
  object dsdCatalog: TDataSetDriverEh
    KeyFields = 'rn'
    ProviderDataSet = oraCatalog
    ResolveToDataSet = False
    Left = 496
    Top = 280
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
    Left = 572
    Top = 228
  end
end
