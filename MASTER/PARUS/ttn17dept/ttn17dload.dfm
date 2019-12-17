object frmTTN17d: TfrmTTN17d
  Left = 283
  Top = 373
  Width = 972
  Height = 636
  Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1086#1088#1076#1077#1088#1072' '#1074' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1074' '#1055#1072#1088#1091#1089
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
    Top = 100
    Height = 505
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 964
    Height = 100
    Align = alTop
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 464
      Top = 15
      Width = 118
      Height = 55
      Action = acLoad
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1055#1072#1088#1091#1089
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
      Layout = blGlyphTop
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 440
      Height = 89
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 1
      object Label2: TLabel
        Left = 6
        Top = 19
        Width = 6
        Height = 13
        Caption = #1089
      end
      object Label3: TLabel
        Left = 6
        Top = 51
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object deEnd: TDateEdit
        Left = 22
        Top = 51
        Width = 88
        Height = 21
        DefaultToday = True
        NumGlyphs = 2
        TabOrder = 0
        Text = '17.03.2003'
      end
      object deBeg: TDateEdit
        Left = 22
        Top = 17
        Width = 88
        Height = 21
        DefaultToday = True
        NumGlyphs = 2
        TabOrder = 1
        Text = '17.03.2003'
      end
      object rbArx: TRadioButton
        Left = 120
        Top = 10
        Width = 90
        Height = 17
        Caption = #1040#1088#1093#1072#1085#1075#1077#1083#1100#1089#1082
        TabOrder = 2
      end
      object rbSyk: TRadioButton
        Left = 224
        Top = 41
        Width = 90
        Height = 17
        Caption = #1057#1099#1082#1090#1099#1074#1082#1072#1088
        TabOrder = 3
      end
      object rbInta: TRadioButton
        Left = 120
        Top = 40
        Width = 90
        Height = 17
        Caption = #1048#1085#1090#1072
        TabOrder = 4
      end
      object rbVor: TRadioButton
        Left = 120
        Top = 25
        Width = 90
        Height = 17
        Caption = #1042#1086#1088#1082#1091#1090#1072
        TabOrder = 5
      end
      object rbKos: TRadioButton
        Left = 120
        Top = 67
        Width = 90
        Height = 17
        Caption = #1050#1086#1089#1083#1072#1085
        TabOrder = 6
      end
      object rbKp: TRadioButton
        Left = 120
        Top = 54
        Width = 90
        Height = 17
        Caption = #1050#1085#1103#1078#1055#1086#1075#1086#1089#1090
        TabOrder = 7
      end
      object rbPech: TRadioButton
        Left = 224
        Top = 26
        Width = 90
        Height = 17
        Caption = #1055#1077#1095#1086#1088#1072
        TabOrder = 8
      end
      object rbPAZS: TRadioButton
        Left = 224
        Top = 11
        Width = 90
        Height = 17
        Caption = #1055#1077#1095#1086#1088#1072' '#1040#1047#1057
        TabOrder = 9
      end
      object rbUh: TRadioButton
        Left = 224
        Top = 72
        Width = 90
        Height = 13
        Caption = #1059#1093#1090#1072
        TabOrder = 10
      end
      object rbUs: TRadioButton
        Left = 224
        Top = 58
        Width = 90
        Height = 13
        Caption = #1059#1089#1080#1085#1089#1082
        TabOrder = 11
      end
      object BitBtn1: TBitBtn
        Left = 344
        Top = 58
        Width = 89
        Height = 28
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
      object rbVog: TRadioButton
        Left = 342
        Top = 9
        Width = 90
        Height = 17
        Caption = #1042#1086#1075#1074#1072#1079#1076#1080#1085#1086
        TabOrder = 13
      end
      object rbLabyt: TRadioButton
        Left = 342
        Top = 25
        Width = 94
        Height = 17
        Caption = #1051#1072#1073#1099#1090#1085#1072#1085#1075#1080
        TabOrder = 14
      end
      object rbAviaTran: TRadioButton
        Left = 342
        Top = 41
        Width = 87
        Height = 17
        Caption = #1040#1074#1080#1072#1090#1088#1072#1085#1089
        TabOrder = 15
      end
    end
    object cbKorrekt: TCheckBox
      Left = 464
      Top = 74
      Width = 121
      Height = 14
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1086#1095#1085#1099#1077
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 188
    Top = 100
    Width = 776
    Height = 505
    Align = alClient
    TabOrder = 1
    object dbgPR17: TDBGridEh
      Left = 1
      Top = 1
      Width = 774
      Height = 503
      Align = alClient
      AllowedOperations = []
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
      TitleLines = 2
      OnGetCellParams = dbgPR17GetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SVED_NUM'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 116
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
          FieldName = 'DATE_KVIT'
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
          FieldName = 'MODIF'
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
          FieldName = 'MOD_MODIF'
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
          FieldName = 'VES'
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
          FieldName = 'CENA_OTP'
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
          FieldName = 'SUM_PROD'
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
          FieldName = 'SUM_PROD_NDS'
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
    Top = 100
    Width = 185
    Height = 505
    Align = alLeft
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 183
      Height = 503
      Align = alClient
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
    Left = 400
    Top = 128
  end
  object oraPR17: TOracleDataSet
    SQL.Strings = (
      'select /*+ ALL_ROWS*/'
      
        ' decode(k.sved_num,0,to_char(k.num_kvit),to_char(k.sved_num)) as' +
        ' sved_num ,decode(k.sved_num,0,k.id,k.num_cist) as num_cist,u.ca' +
        't_cen_id,'
      
        ' k.VES,k.cena_otp,k.date_cena as date_cen,k.num_kvit,k.date_kvit' +
        ','
      ' k.sum_prod, k.sum_akciz,k.sum_prod_nds,'
      ' k.nom_zd, k.id,pr.id as poluch_id,'
      ' pn.MODIF,pn.MOD_MODIF,m.stan_id'
      'from kvit k,'
      'month m, kls_planstru ps,'
      'usl_dog u,kls_dog d,'
      'kls_vid_otgr v,kls_predpr pr,'
      'kls_prod_nomenklator pn,zakaz z, zakaz unp'
      'where k.nom_zd=m.nom_zd and z.planstru_id=ps.id'
      'and k.PROD_ID_NPR=pn.PROD and m.zakaz_id=unp.ID'
      'and m.load_abbr=v.load_abbr and m.poluch_id=pr.id'
      'and (m.dog_id=u.DOG_ID and m.usl_number=u.USL_NUMBER)'
      'and z.dog_id=d.id and unp.LINK_ID=z.ID and z.IS_AGENT=2'
      
        'and k.bill_id is not null and k.sum_prod >0  and ((d.predpr_id=2' +
        '641))'
      'and m.nazn_otg_id<>2'
      
        'and (v.load_type_id=1 or v.load_type_id=6 or v.load_type_id=5) a' +
        'nd pn.is_actual<>0'
      
        'and not exists (select kvit_id from parus_fin where k.id = parus' +
        '_fin.kvit_id and task='#39'GoodsTransInvoicesToDepts'#39')'
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
      00444154455F4B5649540100000000000800000043454E415F4F545001000000
      00000800000053554D5F50524F440100000000000900000053554D5F414B4349
      5A0100000000000C00000053554D5F50524F445F4E4453010000000000060000
      004E4F4D5F5A44010000000000050000004D4F44494601000000000009000000
      4D4F445F4D4F44494601000000000009000000504F4C5543485F494401000000
      0000070000005354414E5F4944010000000000}
    ReadOnly = True
    Session = oraMain
    Left = 432
    Top = 128
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
    object oraPR17VES: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'VES'
      ReadOnly = True
      Required = True
    end
    object oraPR17CENA_OTP: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'CENA_OTP'
      ReadOnly = True
    end
    object oraPR17SUM_PROD: TFloatField
      DisplayLabel = #1047#1072' '#1087#1088#1086#1076#1091#1082#1090
      FieldName = 'SUM_PROD'
      ReadOnly = True
      Required = True
    end
    object oraPR17SUM_AKCIZ: TFloatField
      DisplayLabel = #1040#1082#1094#1080#1079
      FieldName = 'SUM_AKCIZ'
      ReadOnly = True
      Required = True
    end
    object oraPR17SUM_PROD_NDS: TFloatField
      DisplayLabel = #1053#1044#1057
      FieldName = 'SUM_PROD_NDS'
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
    object oraPR17MODIF: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      FieldName = 'MODIF'
      ReadOnly = True
      Required = True
    end
    object oraPR17MOD_MODIF: TStringField
      DisplayLabel = #1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103
      FieldName = 'MOD_MODIF'
      ReadOnly = True
    end
    object oraPR17SVED_NUM: TStringField
      DisplayLabel = #1057#1074#1077#1076#1077#1085#1080#1077
      FieldName = 'SVED_NUM'
      Size = 40
    end
    object oraPR17NUM_CIST: TFloatField
      DisplayLabel = #8470' '#1062#1080#1089#1090#1077#1088#1085#1099
      FieldName = 'NUM_CIST'
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
    Left = 496
    Top = 128
  end
  object ActionManager1: TActionManager
    Images = frmMain.ImageList1
    Left = 792
    Top = 104
    StyleName = 'XP Style'
    object acFilter: TAction
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100
      ImageIndex = 2
      OnExecute = acFilterExecute
    end
    object acLoad: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1055#1072#1088#1091#1089
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
    LogonUsername = 'pvz'
    LogonDatabase = 'P5'
    Left = 540
    Top = 180
  end
  object oraCatalog: TOracleDataSet
    SQL.Strings = (
      
        'select /*+ RULE */ rn,crn,name from v_acatalog where unitcode='#39'G' +
        'oodsTransInvoicesToDepts'#39)
    QBEDefinition.QBEFieldDefs = {
      040000000800000002000000524E0100000000000300000043524E0100000000
      00040000004E414D4501000000000008000000554E4954434F44450100000000
      000700000056455253494F4E01000000000007000000434F4D50414E59010000
      0000000400000050524956010000000000050000005349474E53010000000000}
    ReadOnly = True
    Session = oraParus
    Left = 396
    Top = 204
  end
  object dsCatalog: TDataSource
    DataSet = mteCatalog
    Left = 396
    Top = 252
  end
  object oraQ: TOracleQuery
    Session = oraParus
    Left = 604
    Top = 180
  end
  object oraInvIns: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_TRANSINVDEPT_INSERT'
      '('
      '  :nCOMPANY,'
      '  :nCRN,'
      '  :sJUR_PERS, '
      '  :sDOCTYPE ,'
      '  :sPREF    ,'
      '  :sNUMB    ,'
      '  :dDOCDATE ,'
      '  :sDIRDOC  ,'
      '  :sDIRNUMB ,'
      '  :dDIRDATE ,'
      '  :sSTOPER  ,'
      '  :sFACEACC ,'
      '  :sGRAPHPOINT,'
      '  :sSTORE     ,'
      '  :sMOL       ,'
      '  :sSHEEPVIEW ,'
      '  :sSUBDIV    ,'
      '  :sCURRENCY  ,'
      '  :nCURCOURS  ,'
      '  :nCURBASE   ,'
      '  :nSUMMWITHNDS,'
      '  :sRECIPDOC   ,'
      '  :sRECIPNUMB  ,'
      '  :dRECIPDATE  ,'
      '  :sFERRYMAN   ,'
      '  :sGETCONFIRM  ,'
      '  :sWAYBLADENUMB ,'
      '  :sDRIVER       ,'
      '  :sCAR          ,'
      '  :sROUTE        ,'
      '  :sTRAILER1     ,'
      '  :sTRAILER2     ,'
      '  :nFA_CURCOURS  ,'
      '  :nFA_CURBASE   ,'
      '  :sIN_STORE     ,'
      '  :sIN_MOL       ,'
      '  :sIN_STOPER    ,'
      '  :nIN_CURCOURS  ,'
      '  :nIN_CURBASE   ,'
      '  :sVALID_DOCTYPE,'
      '  :sVALID_DOCNUMB,'
      '  :dVALID_DOCDATE,'
      '  :sCOMMENTS     ,'
      '  :nRN           ,'
      '  :sMSG          '
      ');'
      'end;'
      '')
    Session = oraParus
    Variables.Data = {
      030000002D000000090000003A4E434F4D50414E590300000000000000000000
      00050000003A4E43524E0300000000000000000000000A0000003A534A55525F
      50455253050000000000000000000000090000003A53444F4354595045050000
      000000000000000000060000003A535052454605000000000000000000000006
      0000003A534E554D42050000000000000000000000090000003A44444F434441
      54450C0000000000000000000000080000003A53444952444F43050000000000
      000000000000090000003A534449524E554D4205000000000000000000000009
      0000003A44444952444154450C0000000000000000000000080000003A535354
      4F504552050000000000000000000000090000003A5346414345414343050000
      0000000000000000000C0000003A534752415048504F494E5405000000000000
      0000000000070000003A5353544F524505000000000000000000000005000000
      3A534D4F4C0500000000000000000000000B0000003A53534845455056494557
      050000000000000000000000080000003A535355424449560500000000000000
      000000000A0000003A5343555252454E43590500000000000000000000000A00
      00003A4E435552434F555253030000000000000000000000090000003A4E4355
      52424153450300000000000000000000000D0000003A4E53554D4D574954484E
      44530400000000000000000000000A0000003A535245434950444F4305000000
      00000000000000000B0000003A5352454349504E554D42050000000000000000
      0000000B0000003A445245434950444154450C00000000000000000000000A00
      00003A5346455252594D414E0500000000000000000000000C0000003A534745
      54434F4E4649524D0500000000000000000000000E0000003A53574159424C41
      44454E554D42050000000000000000000000080000003A534452495645520500
      00000000000000000000050000003A5343415205000000000000000000000007
      0000003A53524F5554450500000000000000000000000A0000003A5354524149
      4C4552310500000000000000000000000A0000003A53545241494C4552320500
      000000000000000000000D0000003A4E46415F435552434F5552530500000000
      000000000000000C0000003A4E46415F43555242415345050000000000000000
      0000000A0000003A53494E5F53544F5245050000000000000000000000080000
      003A53494E5F4D4F4C0500000000000000000000000B0000003A53494E5F5354
      4F5045520500000000000000000000000D0000003A4E494E5F435552434F5552
      530500000000000000000000000C0000003A4E494E5F43555242415345050000
      0000000000000000000F0000003A5356414C49445F444F435459504505000000
      00000000000000000F0000003A5356414C49445F444F434E554D420500000000
      000000000000000F0000003A4456414C49445F444F43444154450C0000000000
      0000000000000A0000003A53434F4D4D454E5453050000000000000000000000
      040000003A4E524E030000000000000000000000050000003A534D5347050000
      000000000000000000}
    Left = 536
    Top = 297
  end
  object oraInvsIns: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_TRANSINVDEPTSPECS_INSERT'
      '('
      '  :nCOMPANY       ,'
      '  :nPRN           ,'
      '  :sNOMEN         ,'
      '  :sSERNUMB       ,'
      '  :sCOUNTRY       ,'
      '  :sGTD           ,'
      '  :sNOMMODIF      ,'
      '  :sNOMNMODIFPACK ,'
      '  :sARTICLE       ,'
      '  :sCELL          ,'
      ' :sGOODSPARTY     ,'
      '  :nPRICE         ,'
      '  :nQUANT         ,'
      '  :nQUANTALT      ,'
      '  :nPRICEMEAS     ,'
      '  :nSUMMWITHNDS   ,'
      '  :dBEGINDATE     ,'
      '  :dENDDATE       ,'
      '  :sNOTE          ,'
      '  :nRN            ,'
      '  :sMSG          '
      ');'
      'end;')
    Session = oraParus
    Variables.Data = {
      0300000015000000090000003A4E434F4D50414E590300000000000000000000
      00050000003A4E50524E030000000000000000000000070000003A534E4F4D45
      4E050000000000000000000000090000003A535345524E554D42050000000000
      000000000000090000003A53434F554E54525905000000000000000000000005
      0000003A534754440500000000000000000000000A0000003A534E4F4D4D4F44
      4946050000000000000000000000090000003A5341525449434C450500000000
      00000000000000060000003A5343454C4C050000000000000000000000070000
      003A4E5155414E540400000000000000000000000A0000003A4E5155414E5441
      4C54040000000000000000000000070000003A4E505249434504000000000000
      00000000000B0000003A4E50524943454D454153040000000000000000000000
      0D0000003A4E53554D4D574954484E44530400000000000000000000000B0000
      003A44424547494E444154450C0000000000000000000000090000003A44454E
      44444154450C0000000000000000000000060000003A534E4F54450500000000
      00000000000000040000003A4E524E030000000000000000000000050000003A
      534D53470500000000000000000000000F0000003A534E4F4D4E4D4F44494650
      41434B0500000000000000000000000C0000003A53474F4F4453504152545905
      0000000000000000000000}
    Left = 608
    Top = 297
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
    Left = 320
    Top = 304
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
    Left = 392
    Top = 304
  end
end
