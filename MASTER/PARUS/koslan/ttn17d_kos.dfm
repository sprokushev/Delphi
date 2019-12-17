object frmTTNd_kos: TfrmTTNd_kos
  Left = 1774
  Top = 323
  Width = 972
  Height = 637
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
    Top = 121
    Height = 486
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 964
    Height = 121
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 11
      Top = 99
      Width = 414
      Height = 16
      Caption = #1053#1077' '#1079#1072#1073#1099#1074#1072#1081#1090#1077' '#1074#1099#1073#1080#1088#1072#1090#1100' '#1087#1088#1072#1074#1080#1083#1100#1085#1099#1081' '#1082#1072#1090#1072#1083#1086#1075' '#1074' '#1055#1072#1088#1091#1089#1077'!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn2: TBitBtn
      Left = 464
      Top = 24
      Width = 147
      Height = 65
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
        Top = 12
        Width = 90
        Height = 17
        Caption = #1040#1088#1093#1072#1085#1075#1077#1083#1100#1089#1082
        TabOrder = 2
      end
      object rbSyk: TRadioButton
        Left = 223
        Top = 64
        Width = 90
        Height = 17
        Caption = #1057#1099#1082#1090#1099#1074#1082#1072#1088
        TabOrder = 3
      end
      object rbInta: TRadioButton
        Left = 120
        Top = 45
        Width = 90
        Height = 17
        Caption = #1048#1085#1090#1072
        TabOrder = 4
      end
      object rbVor: TRadioButton
        Left = 120
        Top = 28
        Width = 90
        Height = 17
        Caption = #1042#1086#1088#1082#1091#1090#1072
        TabOrder = 5
      end
      object rbKos: TRadioButton
        Left = 224
        Top = 12
        Width = 90
        Height = 17
        Caption = #1050#1086#1089#1083#1072#1085
        TabOrder = 6
      end
      object rbKp: TRadioButton
        Left = 120
        Top = 62
        Width = 90
        Height = 17
        Caption = #1050#1085#1103#1078#1055#1086#1075#1086#1089#1090
        TabOrder = 7
      end
      object rbPech: TRadioButton
        Left = 224
        Top = 48
        Width = 90
        Height = 17
        Caption = #1055#1077#1095#1086#1088#1072
        TabOrder = 8
      end
      object rbPAZS: TRadioButton
        Left = 224
        Top = 32
        Width = 90
        Height = 17
        Caption = #1055#1077#1095#1086#1088#1072' '#1040#1047#1057
        TabOrder = 9
      end
      object rbUh: TRadioButton
        Left = 343
        Top = 24
        Width = 90
        Height = 17
        Caption = #1059#1093#1090#1072
        TabOrder = 10
      end
      object rbUs: TRadioButton
        Left = 343
        Top = 8
        Width = 90
        Height = 17
        Caption = #1059#1089#1080#1085#1089#1082
        TabOrder = 11
      end
      object BitBtn1: TBitBtn
        Left = 344
        Top = 41
        Width = 89
        Height = 41
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
    end
    object cbKorrekt: TCheckBox
      Left = 464
      Top = 96
      Width = 129
      Height = 17
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1086#1095#1085#1099#1077
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 188
    Top = 121
    Width = 776
    Height = 486
    Align = alClient
    TabOrder = 1
    object dbgPR17: TDBGridEh
      Left = 1
      Top = 1
      Width = 774
      Height = 484
      Align = alClient
      AllowedOperations = []
      DataSource = dsPR17
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
          FieldName = 'SVED_NUM'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NUM_CIST'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NUM_KVIT'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NOM_ZD'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DATE_KVIT'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'MODIF'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'MOD_MODIF'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'VES'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'CENA_OTP'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUM_PROD'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUM_AKCIZ'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'SUM_PROD_NDS'
          Footers = <>
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 121
    Width = 185
    Height = 486
    Align = alLeft
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 1
      Top = 241
      Width = 183
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object tvCatalog: TvgDBTreeView
      Left = 1
      Top = 1
      Width = 183
      Height = 240
      DataSource = dsCatalog
      DataFieldID = 'RN'
      DataFieldParentID = 'CRN'
      DataFieldText = 'NAME'
      Options = []
      Align = alTop
      Indent = 19
      TabOrder = 0
      OnGetImageIndex = tvCatalogGetImageIndex
    end
    object mLog: TMemo
      Left = 1
      Top = 244
      Width = 183
      Height = 241
      Align = alClient
      TabOrder = 1
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
      'select /*+ ORDERED*/'
      
        ' decode(k.sved_num,0,k.id,k.sved_num) as sved_num ,k.num_cist,u.' +
        'cat_cen_id,k.date_cena as date_cen,k.num_kvit,k.date_kvit,'
      ' k.VES,k.cena_otp,'
      ' k.sum_prod, k.sum_akciz,k.sum_prod_nds,'
      ' k.nom_zd, k.id,'
      
        ' pn.MODIF,pn.PARUS_PRN,pn.MOD_MODIF,pn.PARUS_RN,pn.taxgr_rn,pn.T' +
        'AXGR_CODE'
      'from kvit k, '
      'month m, kls_planstru ps,'
      'usl_dog u,'
      'kls_vid_otgr v,'
      'kls_prod_nomenklator pn'
      'where k.nom_zd=m.nom_zd and m.planstru_id=ps.id'
      'and k.PROD_ID_NPR=pn.PROD'
      'and m.load_abbr=v.load_abbr'
      'and (m.dog_id=u.DOG_ID and m.usl_number=u.USL_NUMBER)'
      'and m.DOG_ID='#39'787'#39
      'and k.bill_id is not null and k.sum_prod >0'
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
      0300000013000000030000005645530100000000020000004944010000000008
      000000535645445F4E554D0100000000080000004E554D5F4349535401000000
      000A0000004341545F43454E5F4944010000000008000000444154455F43454E
      0100000000080000004E554D5F4B564954010000000009000000444154455F4B
      56495401000000000800000043454E415F4F545001000000000800000053554D
      5F50524F4401000000000900000053554D5F414B43495A01000000000C000000
      53554D5F50524F445F4E44530100000000060000004E4F4D5F5A440100000000
      050000004D4F44494601000000000900000050415255535F50524E0100000000
      090000004D4F445F4D4F44494601000000000800000050415255535F524E0100
      0000000800000054415847525F524E01000000000A00000054415847525F434F
      44450100000000}
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
    object oraPR17PARUS_PRN: TFloatField
      FieldName = 'PARUS_PRN'
      ReadOnly = True
      Required = True
    end
    object oraPR17MOD_MODIF: TStringField
      DisplayLabel = #1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103
      FieldName = 'MOD_MODIF'
      ReadOnly = True
    end
    object oraPR17PARUS_RN: TFloatField
      FieldName = 'PARUS_RN'
      ReadOnly = True
      Required = True
    end
    object oraPR17TAXGR_RN: TFloatField
      FieldName = 'TAXGR_RN'
      ReadOnly = True
    end
    object oraPR17SVED_NUM: TFloatField
      DisplayLabel = #1057#1074#1077#1076#1077#1085#1080#1077
      FieldName = 'SVED_NUM'
    end
    object oraPR17TAXGR_CODE: TStringField
      FieldName = 'TAXGR_CODE'
    end
  end
  object dsPR17: TDataSource
    DataSet = oraPR17
    Left = 496
    Top = 128
  end
  object ActionManager1: TActionManager
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
  object XPManifest1: TXPManifest
    Left = 824
    Top = 104
  end
  object OraQuery: TOracleQuery
    Session = oraMain
    Left = 464
    Top = 128
  end
  object oraParus: TOracleSession
    LogonUsername = 'pvz'
    LogonPassword = '123456'
    LogonDatabase = 'Pgood.world'
    Left = 60
    Top = 156
  end
  object oraCatalog: TOracleDataSet
    SQL.Strings = (
      
        'select /*+ RULE */ rn,crn,name from v_acatalog where unitcode='#39'G' +
        'oodsTransInvoicesToDepts'#39)
    QBEDefinition.QBEFieldDefs = {
      030000000800000002000000524E01000000000300000043524E010000000004
      0000004E414D45010000000008000000554E4954434F44450100000000070000
      0056455253494F4E010000000007000000434F4D50414E590100000000040000
      00505249560100000000050000005349474E530100000000}
    ReadOnly = True
    Session = oraParus
    Left = 92
    Top = 156
  end
  object dsCatalog: TDataSource
    DataSet = oraCatalog
    Left = 92
    Top = 204
  end
  object oraQ: TOracleQuery
    Session = oraParus
    Left = 124
    Top = 156
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
    Left = 56
    Top = 273
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
    Left = 128
    Top = 273
  end
end
