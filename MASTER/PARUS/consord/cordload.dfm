object frmCord: TfrmCord
  Left = 348
  Top = 392
  Width = 684
  Height = 599
  Caption = #1047#1072#1103#1074#1082#1080' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1077#1081' '#1074' '#1055#1072#1088#1091#1089
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
    Top = 68
    Height = 498
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 676
    Height = 68
    Align = alTop
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 346
      Top = 6
      Width = 107
      Height = 59
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
      Left = 6
      Top = 3
      Width = 331
      Height = 62
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 20
        Width = 6
        Height = 13
        Caption = #1089
      end
      object Label3: TLabel
        Left = 115
        Top = 22
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object deBeg: TDateEdit
        Left = 19
        Top = 17
        Width = 85
        Height = 21
        DefaultToday = True
        NumGlyphs = 2
        TabOrder = 0
        Text = '17.03.2003'
      end
      object deEnd: TDateEdit
        Left = 131
        Top = 17
        Width = 86
        Height = 21
        DefaultToday = True
        NumGlyphs = 2
        TabOrder = 1
        Text = '17.03.2003'
      end
      object BitBtn1: TBitBtn
        Left = 227
        Top = 12
        Width = 100
        Height = 42
        Action = acFilter
        Caption = #1054#1090#1086#1073#1088#1072#1090#1100
        TabOrder = 2
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
        Left = 12
        Top = 39
        Width = 90
        Height = 17
        Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1080
        TabOrder = 3
      end
      object rbArxPotr: TRadioButton
        Left = 106
        Top = 40
        Width = 112
        Height = 17
        Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1080'('#1040#1060')'
        TabOrder = 4
      end
    end
  end
  object Panel2: TPanel
    Left = 188
    Top = 68
    Width = 488
    Height = 498
    Align = alClient
    TabOrder = 1
    object dbgCord: TDBGridEh
      Left = 1
      Top = 1
      Width = 486
      Height = 496
      Align = alClient
      AllowedOperations = []
      DataSource = dsCord
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
      OnGetCellParams = dbgCordGetCellParams
      Columns = <
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
          FieldName = 'SAGENT'
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
          FieldName = 'SFACEACC'
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
          FieldName = 'STARIF'
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
          FieldName = 'TONN_DECLARED'
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
          FieldName = 'STAN_NAME'
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
    Top = 68
    Width = 185
    Height = 498
    Align = alLeft
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 183
      Height = 496
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
  object oraCord: TOracleDataSet
    SQL.Strings = (
      'select /*+ ALL_ROWS */'
      ' P.SFACEACC,P.SAGENT,p.STARIF, p.sshipview, p.spay_Type,'
      
        ' m.nom_zd,m.TONN_DECLARED, m.cist_declared, m.prim, m.date_plan,' +
        'm.input_date,'
      ' trim(pr.GD_KOD)||'#39'/'#39'||trim(pr.OKPO) AS sagnfifo,m.planstru_id,'
      
        ' p.ssubdiv, p.sjur_pers,pn.MODIF,pn.MOD_MODIF,s.stan_name,pn.tax' +
        'gr_code,pn.taxgr_code_new, kls_region.region_name'
      'from month m, kls_dog d, '
      'v_parus_dog p, kls_predpr pr, kls_vid_otgr v,kls_planstru ps,'
      
        'kls_prod_nomenklator pn,kls_stan s,zakaz z, zakaz unp, kls_regio' +
        'n'
      'where pn.PROD=m.prod_ID_NPR and m.planstru_id=ps.id'
      'and d.id=p.dog_id and (unp.ID=m.ZAKAZ_ID and unp.IS_AGENT=1)'
      'and unp.LINK_ID=z.id'
      
        'and z.DOG_ID=d.ID and not (m.planstru_id=178 or m.planstru_id=20' +
        '8)'
      'and m.poluch_ID=pr.ID and m.stan_id=s.id'
      'and m.load_abbr=v.load_abbr'
      'and z.IS_AGENT=2 and d.predpr_id<>2641'
      'and m.nazn_otg_id<>2 and pn.is_actual<>0'
      
        'and (v.load_type_id=1 or v.load_type_id=6)and not exists (select' +
        ' /*+ HASH_AJ */ month_id from parus_fin where m.nom_zd=month_id ' +
        'and task='#39'ConsumersOrders'#39')'
      ''
      ''
      ''
      'and s.region_id=kls_region.ID'
      'order by m.nom_zd')
    QBEDefinition.QBEFieldDefs = {
      0400000015000000080000005346414345414343010000000000060000005341
      47454E5401000000000006000000535441524946010000000000090000005353
      4849505649455701000000000009000000535041595F54595045010000000000
      080000005341474E4649464F0100000000000700000053535542444956010000
      00000009000000534A55525F50455253010000000000050000004D4F44494601
      0000000000090000004D4F445F4D4F444946010000000000060000004E4F4D5F
      5A440100000000000D000000544F4E4E5F4445434C4152454401000000000009
      000000444154455F504C414E0100000000000A000000494E5055545F44415445
      0100000000000A00000054415847525F434F4445010000000000090000005354
      414E5F4E414D450100000000000E00000054415847525F434F44455F4E455701
      00000000000B000000504C414E535452555F49440100000000000B0000005245
      47494F4E5F4E414D450100000000000D000000434953545F4445434C41524544
      010000000000040000005052494D010000000000}
    ReadOnly = True
    Session = DM.oraMain
    Left = 432
    Top = 232
    object oraCordSFACEACC: TStringField
      DisplayLabel = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
      FieldName = 'SFACEACC'
      Required = True
    end
    object oraCordSAGENT: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'SAGENT'
    end
    object oraCordSTARIF: TStringField
      DisplayLabel = #1058#1072#1088#1080#1092
      FieldName = 'STARIF'
    end
    object oraCordSSHIPVIEW: TStringField
      FieldName = 'SSHIPVIEW'
    end
    object oraCordSPAY_TYPE: TStringField
      FieldName = 'SPAY_TYPE'
    end
    object oraCordNOM_ZD: TStringField
      DisplayLabel = #1047#1072#1103#1074#1082#1072
      FieldName = 'NOM_ZD'
      Required = True
      Size = 12
    end
    object oraCordTONN_DECLARED: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'TONN_DECLARED'
      Required = True
    end
    object oraCordDATE_PLAN: TDateTimeField
      FieldName = 'DATE_PLAN'
      Required = True
    end
    object oraCordINPUT_DATE: TDateTimeField
      FieldName = 'INPUT_DATE'
      Required = True
    end
    object oraCordSAGNFIFO: TStringField
      FieldName = 'SAGNFIFO'
      Size = 23
    end
    object oraCordSSUBDIV: TStringField
      FieldName = 'SSUBDIV'
    end
    object oraCordSJUR_PERS: TStringField
      FieldName = 'SJUR_PERS'
      Required = True
    end
    object oraCordMODIF: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'MODIF'
      Required = True
    end
    object oraCordMOD_MODIF: TStringField
      DisplayLabel = #1052#1086#1076#1080#1092'.'
      FieldName = 'MOD_MODIF'
    end
    object oraCordSTAN_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103
      FieldName = 'STAN_NAME'
      Required = True
      Size = 50
    end
    object oraCordPLANSTRU_ID: TFloatField
      FieldName = 'PLANSTRU_ID'
    end
    object oraCordTAXGR_CODE: TStringField
      FieldName = 'TAXGR_CODE'
    end
    object oraCordTAXGR_CODE_NEW: TStringField
      FieldName = 'TAXGR_CODE_NEW'
    end
    object oraCordREGION_NAME: TStringField
      FieldName = 'REGION_NAME'
      Required = True
      Size = 30
    end
    object oraCordCIST_DECLARED: TIntegerField
      FieldName = 'CIST_DECLARED'
    end
    object oraCordPRIM: TStringField
      FieldName = 'PRIM'
      Size = 100
    end
  end
  object dsCord: TDataSource
    DataSet = oraCord
    Left = 432
    Top = 280
  end
  object ActionManager1: TActionManager
    Images = frmMain.ImageList1
    Left = 408
    Top = 112
    StyleName = 'XP Style'
    object acFilter: TAction
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100
      ImageIndex = 0
      OnExecute = acFilterExecute
    end
    object acLoad: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1055#1072#1088#1091#1089
      ImageIndex = 2
      OnExecute = acLoadExecute
    end
  end
  object OraQuery: TOracleQuery
    Session = DM.oraMain
    Left = 488
    Top = 233
  end
  object oraCatalog: TOracleDataSet
    SQL.Strings = (
      
        'select /*+ RULE */ * from v_acatalog where unitcode='#39'ConsumersOr' +
        'ders'#39)
    QBEDefinition.QBEFieldDefs = {
      040000000900000002000000524E0100000000000300000043524E0100000000
      00040000004E414D4501000000000008000000554E4954434F44450100000000
      000700000056455253494F4E01000000000007000000434F4D50414E59010000
      0000000400000050524956010000000000050000005349474E53010000000000
      0B0000004841534348494C4452454E010000000000}
    ReadOnly = True
    Session = DM.oraParus
    Left = 276
    Top = 108
  end
  object dsCatalog: TDataSource
    DataSet = mteCatalog
    Left = 276
    Top = 156
  end
  object oraQ: TOracleQuery
    Session = DM.oraParus
    Left = 325
    Top = 108
  end
  object oraInvIns: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_CONSUMERORD_INSERT'
      '('
      '  :nCOMPANY,'
      '  :nCRN,'
      '  :sJUR_PERS,'
      '  :sORD_DOCTYPE,'
      '  :sORD_PREF,'
      '  :sORD_NUMB,'
      '  :sAGENT,'
      '  :sFACEACC,'
      '  :sGRAPHPOINT,'
      '  :dORD_DATE,'
      '  :nORD_STATE,'
      '  :dSTATE_DATE,'
      '  :sDISP_TYPE,'
      '  :sPAY_TYPE,'
      '  :sTARIF,'
      '  :sCURRENCY,'
      '  :sSTORE,'
      '  :sACC_AGENT,'
      '  :sSUBDIV,'
      '  :dPAY_DATE,'
      '  :dRELEASE_DATE,'
      '  :dPRICE_DATE,'
      '  :nORD_PERIOD,'
      '  :nPERIOD_CORR,'
      '  :nPERIOD_QUANT,'
      '  :nPERIOD_TYPE,'
      '  :nPERIOD_LEN,'
      '  :nATSAMETIME,'
      '  :nPRICE_TYPE,'
      '  :nREDUCTION,'
      '  :sNOTE,'
      '  :sAGNFI,'
      '  :sCON_DOCTYPE,'
      '  :sCON_DOCPREF,'
      '  :sCON_DOCNUMB,'
      '  :sROUTE,'
      '  :nRN'
      ');'
      'end;')
    Session = DM.oraParus
    Variables.Data = {
      0300000025000000090000003A4E434F4D50414E590300000000000000000000
      00050000003A4E43524E0300000000000000000000000A0000003A534A55525F
      504552530500000000000000000000000D0000003A534F52445F444F43545950
      450500000000000000000000000A0000003A534F52445F505245460500000000
      000000000000000A0000003A534F52445F4E554D420500000000000000000000
      00070000003A534147454E54050000000000000000000000090000003A534641
      43454143430500000000000000000000000C0000003A534752415048504F494E
      540500000000000000000000000A0000003A444F52445F444154450C00000000
      000000000000000B0000003A4E4F52445F535441544503000000000000000000
      00000C0000003A4453544154455F444154450C00000000000000000000000B00
      00003A53444953505F545950450500000000000000000000000A0000003A5350
      41595F54595045050000000000000000000000070000003A5354415249460500
      000000000000000000000A0000003A5343555252454E43590500000000000000
      00000000070000003A5353544F52450500000000000000000000000B0000003A
      534143435F4147454E54050000000000000000000000080000003A5353554244
      49560500000000000000000000000A0000003A445041595F444154450C000000
      00000000000000000E0000003A4452454C454153455F444154450C0000000000
      0000000000000C0000003A4450524943455F444154450C000000000000000000
      00000C0000003A4E4F52445F504552494F440300000000000000000000000D00
      00003A4E504552494F445F434F52520300000000000000000000000E0000003A
      4E504552494F445F5155414E540300000000000000000000000D0000003A4E50
      4552494F445F545950450300000000000000000000000C0000003A4E50455249
      4F445F4C454E0300000000000000000000000C0000003A4E415453414D455449
      4D450300000000000000000000000C0000003A4E50524943455F545950450300
      000000000000000000000B0000003A4E524544554354494F4E03000000000000
      0000000000060000003A534E4F5445050000000000000000000000070000003A
      5341474E46490500000000000000000000000D0000003A53434F4E5F444F4354
      5950450500000000000000000000000D0000003A53434F4E5F444F4350524546
      0500000000000000000000000D0000003A53434F4E5F444F434E554D42050000
      000000000000000000070000003A53524F555445050000000000000000000000
      040000003A4E524E030000000000000000000000}
    Left = 232
    Top = 345
  end
  object oraInvsIns: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_CONSUMERORDS_INSERT'
      '('
      '  :nCOMPANY,'
      '  :nPRN,'
      '  :sNOMEN,'
      '  :sNOM_PACK,'
      '  :sNOM_MODIF,'
      '  :sNOMMOD_PACK,'
      '  :sPRODUCT,'
      '  :sTAX_GROUP,'
      '  :nEXP_PRICE,'
      '  :nPR_MEAS,'
      '  :sSTORE,'
      '  :nPOSREDUCT,'
      '  :sNOTE,'
      '  :sNAME,'
      '  :dBEGIN_DATE,'
      '  :dEND_DATE,'
      '  :dACTPF_DATE,'
      '  :nACTM_QUANT,'
      '  :nACTA_QUANT,'
      '  :nACTSWTAX,'
      '  :nACTSWOTAX,'
      '  :nRN,'
      '  :nSUMWOTAX_OUT,'
      '  :nSUMWTAX_OUT'
      ');'
      'end;')
    Session = DM.oraParus
    Variables.Data = {
      0300000018000000090000003A4E434F4D50414E590300000000000000000000
      00050000003A4E50524E030000000000000000000000070000003A534E4F4D45
      4E0500000000000000000000000A0000003A534E4F4D5F5041434B0500000000
      000000000000000B0000003A534E4F4D5F4D4F44494605000000000000000000
      00000D0000003A534E4F4D4D4F445F5041434B05000000000000000000000009
      0000003A5350524F445543540500000000000000000000000B0000003A535441
      585F47524F55500500000000000000000000000B0000003A4E4558505F505249
      4345030000000000000000000000090000003A4E50525F4D4541530300000000
      00000000000000070000003A5353544F52450500000000000000000000000B00
      00003A4E504F53524544554354030000000000000000000000060000003A534E
      4F5445050000000000000000000000060000003A534E414D4505000000000000
      00000000000C0000003A44424547494E5F444154450C00000000000000000000
      000A0000003A44454E445F444154450C00000000000000000000000C0000003A
      4441435450465F444154450C00000000000000000000000C0000003A4E414354
      4D5F5155414E540400000000000000000000000C0000003A4E414354415F5155
      414E540400000000000000000000000A0000003A4E4143545357544158040000
      0000000000000000000B0000003A4E41435453574F5441580400000000000000
      00000000040000003A4E524E0300000000000000000000000E0000003A4E5355
      4D574F5441585F4F55540400000000000000000000000D0000003A4E53554D57
      5441585F4F5554040000000000000000000000}
    Left = 344
    Top = 345
  end
  object oraProps: TOracleQuery
    SQL.Strings = (
      'BEGIN '
      'P_DOCS_PROPS_MODIFY ('
      ' :NCOMPANY,'
      ' :NRN,'
      ' :SUNITCODE,'
      ' :SCODE,'
      ' :NFORMAT,'
      ' :SSTR_VALUE,'
      ' :NNUM_VALUE,'
      ' :DDATE_VALUE); '
      'END;')
    Session = DM.oraParus
    Variables.Data = {
      0300000008000000090000003A4E434F4D50414E590300000000000000000000
      00040000003A4E524E0300000000000000000000000A0000003A53554E495443
      4F4445050000000000000000000000060000003A53434F444505000000000000
      0000000000080000003A4E464F524D41540300000000000000000000000B0000
      003A535354525F56414C55450500000000000000000000000B0000003A4E4E55
      4D5F56414C55450300000000000000000000000C0000003A44444154455F5641
      4C55450C0000000000000000000000}
    Left = 288
    Top = 345
  end
  object oraState: TOracleQuery
    SQL.Strings = (
      'BEGIN '
      'P_CONSUMERORD_SET_STATE'
      '('
      ':NFLAG_SMART,'
      ':NCOMPANY,'
      ':NRN,'
      ':NFLAG_MODE,'
      ':NNEW_STATE,'
      ':DSTATE_DATE,'
      ':nRESERV_SIGN,'
      ':nSIGN_WARN,'
      ':NRESULT,'
      ':sMSG); '
      'END;')
    Session = DM.oraParus
    Variables.Data = {
      030000000A0000000C0000003A4E464C41475F534D4152540300000000000000
      00000000090000003A4E434F4D50414E59030000000000000000000000040000
      003A4E524E0300000000000000000000000B0000003A4E464C41475F4D4F4445
      0300000000000000000000000B0000003A4E4E45575F53544154450300000000
      000000000000000C0000003A4453544154455F444154450C0000000000000000
      000000080000003A4E524553554C540300000000000000000000000D0000003A
      4E5245534552565F5349474E0500000000000000000000000B0000003A4E5349
      474E5F5741524E050000000000000000000000050000003A534D534705000000
      0000000000000000}
    Left = 288
    Top = 401
  end
  object oraDelIns: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_DELIVERYORD_INSERT'
      '('
      ':nCOMPANY,'
      ':nCRN,'
      ':sORD_PREF,'
      ':sORD_NUMB,'
      ':sAGENT,'
      ':sFACEACC,'
      ':sGRAPHPOINT,'
      ':sORD_DOCTYPE,'
      ':dORD_DATE,'
      ':nORD_STATE,'
      ':dSTATE_DATE,'
      ':sDISP_TYPE,'
      ':sPAY_TYPE,'
      ':sDELIV_DIAGR,'
      ':sCURRENCY,'
      ':sSTORE,'
      ':sACC_AGENT,'
      ':sSUBDIV,'
      ':dPAY_DATE,'
      ':dRELEASE_DATE,'
      ':nORD_PERIOD,'
      ':nPERIOD_CORR,'
      ':nPERIOD_QUANT,'
      ':nPERIOD_TYPE,'
      ':nPERIOD_LEN,'
      ':nATSAMETIME,'
      ':nINCLUDETAX,'
      ':nREDUCTION,'
      ':sNOTE,'
      ':sJUR_PERS,'
      ':sDELIVDOCNUMB,'
      ':dDELIVDOCDATE,'
      ':nRN'
      ');'
      'end;')
    Session = DM.oraParus
    Variables.Data = {
      0300000021000000090000003A4E434F4D50414E590300000000000000000000
      00050000003A4E43524E0300000000000000000000000A0000003A534A55525F
      504552530500000000000000000000000D0000003A534F52445F444F43545950
      450500000000000000000000000A0000003A534F52445F505245460500000000
      000000000000000A0000003A534F52445F4E554D420500000000000000000000
      00070000003A534147454E54050000000000000000000000090000003A534641
      43454143430500000000000000000000000C0000003A534752415048504F494E
      540500000000000000000000000A0000003A444F52445F444154450C00000000
      000000000000000B0000003A4E4F52445F535441544503000000000000000000
      00000C0000003A4453544154455F444154450C00000000000000000000000B00
      00003A53444953505F545950450500000000000000000000000A0000003A5350
      41595F545950450500000000000000000000000A0000003A5343555252454E43
      59050000000000000000000000070000003A5353544F52450500000000000000
      000000000B0000003A534143435F4147454E5405000000000000000000000008
      0000003A535355424449560500000000000000000000000A0000003A44504159
      5F444154450C00000000000000000000000E0000003A4452454C454153455F44
      4154450C00000000000000000000000C0000003A4E4F52445F504552494F4403
      00000000000000000000000D0000003A4E504552494F445F434F525203000000
      00000000000000000E0000003A4E504552494F445F5155414E54030000000000
      0000000000000D0000003A4E504552494F445F54595045030000000000000000
      0000000C0000003A4E504552494F445F4C454E0300000000000000000000000C
      0000003A4E415453414D4554494D450300000000000000000000000B0000003A
      4E524544554354494F4E030000000000000000000000060000003A534E4F5445
      050000000000000000000000040000003A4E524E030000000000000000000000
      0D0000003A5344454C49565F44494147520500000000000000000000000C0000
      003A4E494E434C5544455441580300000000000000000000000E0000003A5344
      454C4956444F434E554D420500000000000000000000000E0000003A4444454C
      4956444F43444154450C0000000000000000000000}
    Left = 232
    Top = 473
  end
  object oraDelsIns: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_DELIVERYORDS_INSERT'
      '('
      ':nCOMPANY,'
      ':nPRN,'
      ':sNOMEN,'
      ':sNOM_PACK,'
      ':sNOM_MODIF,'
      ':sNOMMOD_PACK,'
      ':sPRODUCT,'
      ':sTAX_GROUP,'
      ':nEXP_PRICE,'
      ':nPR_MEAS,'
      ':sSTORE,'
      ':nPOSREDUCT,'
      ':sNOTE,'
      ':dACTPF_DATE,'
      ':nACTM_QUANT,'
      ':nACTA_QUANT,'
      ':nACTSWTAX,'
      ':nACTSWOTAX,'
      ':nRN'
      ');'
      'end;')
    Session = DM.oraParus
    Variables.Data = {
      0300000013000000090000003A4E434F4D50414E590300000000000000000000
      00050000003A4E50524E030000000000000000000000070000003A534E4F4D45
      4E0500000000000000000000000A0000003A534E4F4D5F5041434B0500000000
      000000000000000B0000003A534E4F4D5F4D4F44494605000000000000000000
      00000D0000003A534E4F4D4D4F445F5041434B05000000000000000000000009
      0000003A5350524F445543540500000000000000000000000B0000003A535441
      585F47524F55500500000000000000000000000B0000003A4E4558505F505249
      4345030000000000000000000000090000003A4E50525F4D4541530300000000
      00000000000000070000003A5353544F52450500000000000000000000000B00
      00003A4E504F53524544554354030000000000000000000000060000003A534E
      4F54450500000000000000000000000C0000003A4441435450465F444154450C
      00000000000000000000000C0000003A4E4143544D5F5155414E540400000000
      000000000000000C0000003A4E414354415F5155414E54040000000000000000
      0000000A0000003A4E41435453575441580400000000000000000000000B0000
      003A4E41435453574F544158040000000000000000000000040000003A4E524E
      030000000000000000000000}
    Left = 344
    Top = 473
  end
  object oraDelCat: TOracleQuery
    SQL.Strings = (
      'begin'
      'FIND_ACATALOG_NAME'
      '('
      '  :nFLAG_SMART,'
      '  :nCOMPANY,'
      '  :nVERSION,'
      '  :sUNITCODE,'
      '  :sNAME,'
      '  :nRN'
      ');'
      'end;')
    Session = DM.oraParus
    Variables.Data = {
      03000000060000000C0000003A4E464C41475F534D4152540300000000000000
      00000000090000003A4E434F4D50414E59030000000000000000000000090000
      003A4E56455253494F4E0300000000000000000000000A0000003A53554E4954
      434F4445050000000000000000000000060000003A534E414D45050000000000
      000000000000040000003A4E524E030000000000000000000000}
    Left = 216
    Top = 153
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
    Left = 408
    Top = 344
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
    Left = 480
    Top = 344
  end
  object oraDelState: TOracleQuery
    SQL.Strings = (
      'BEGIN '
      'P_DELIVERYORD_SET_STATE'
      '('
      ':NFLAG_SMART,'
      ':NCOMPANY,'
      ':NRN,'
      ':NFLAG_MODE,'
      ':NNEW_STATE,'
      ':DSTATE_DATE,'
      ':NRESULT); '
      'END;')
    Session = DM.oraParus
    Variables.Data = {
      03000000070000000C0000003A4E464C41475F534D4152540300000000000000
      00000000090000003A4E434F4D50414E59030000000000000000000000040000
      003A4E524E0300000000000000000000000B0000003A4E464C41475F4D4F4445
      0300000000000000000000000B0000003A4E4E45575F53544154450300000000
      000000000000000C0000003A4453544154455F444154450C0000000000000000
      000000080000003A4E524553554C54030000000000000000000000}
    Left = 352
    Top = 401
  end
end
