object frmZakaz: TfrmZakaz
  Left = 348
  Top = 392
  Width = 684
  Height = 599
  Caption = #1047#1072#1082#1072#1079#1099' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1077#1081' '#1076#1083#1103' '#1087#1083#1072#1085#1072' '#1074' '#1055#1072#1088#1091#1089
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
    Height = 500
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
    object Button1: TButton
      Left = 496
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 188
    Top = 68
    Width = 488
    Height = 500
    Align = alClient
    TabOrder = 1
    object dbgCord: TDBGridEh
      Left = 1
      Top = 1
      Width = 486
      Height = 498
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
          FieldName = 'INPUT_NUMBER'
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
          FieldName = 'INPUT_DATE'
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
          FieldName = 'POLUCH'
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
        end
        item
          EditButtons = <>
          FieldName = 'DATA_PLAN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'MOD_MODIF'
          Footers = <>
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 68
    Width = 185
    Height = 500
    Align = alLeft
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 183
      Height = 498
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
      'SELECT zakaz.input_number, zakaz.input_date, '
      '      TRUNC(zakaz.date_plan,'#39'Q'#39') data_plan,'
      
        '      zakaz.tip_corp_id, zakaz.period_id, zakaz.filial_id, zakaz' +
        '.stan_id,'
      
        '      (To_char(TRUNC(zakaz.date_plan,'#39'Q'#39'),'#39'YY'#39') || to_char(TRUNC' +
        '(zakaz.date_plan,'#39'Q'#39'),'#39'MM'#39') || zakaz.client_number || zakaz.peri' +
        'od_id || zakaz.filial_id || zakaz.stan_id) idz,'
      '      zakaz.gr4, '
      '      kls_zakaz_tip_corp.NAME tip_corp,'
      '      poluc.predpr_name poluch,'
      '      kls_stan.stan_name, kls_stan.stan_kod,'
      '      kls_region.region_name, kls_region.kod_moscow,'
      '      kls_zakaz_period.NAME period, '
      
        '       v_parus_dog.sagent, v_parus_dog.sfaceacc, v_parus_dog.ssh' +
        'ipview,'
      
        '       v_parus_dog.spay_type, v_parus_dog.ssubdiv, v_parus_dog.s' +
        'jur_pers, '
      '       v_parus_dog.starif,'
      '       trim(poluc.GD_KOD)||'#39'/'#39'||trim(poluc.OKPO) AS sagnfifo'
      '  FROM zakaz,'
      '       kls_predpr poluc,'
      '       kls_stan,'
      '       kls_region,'
      '       kls_zakaz_period,'
      '       kls_zakaz_tip_corp,'
      '       v_parus_dog'
      ' WHERE     (zakaz.poluch_id = poluc.ID(+))'
      '        AND (zakaz.stan_id = kls_stan.ID)'
      '        AND (kls_region.ID = kls_stan.region_id)'
      '        AND (kls_zakaz_period.ID = zakaz.period_id)'
      '        AND (kls_zakaz_tip_corp.ID = zakaz.tip_corp_id)'
      '        AND (zakaz.dog_id = v_parus_dog.dog_id)'
      
        '        AND (v_parus_dog.nfaceacc=(Select max(nfaceacc) from v_p' +
        'arus_dog where zakaz.dog_id = v_parus_dog.dog_id))'
      '        AND (zakaz.is_agent = 2)'
      '        --AND (zakaz.is_accept<>0)'
      
        #9' --AND not exists (select /*+ HASH_AJ */ month_id from parus_fi' +
        'n where zakaz.id=month_id and task='#39'ConsumersOrdersZ'#39')'
      #9' AND zakaz.period_id > 2'
      
        #9' and (zakaz.client_date between TO_DATE('#39'01.01.2006'#39','#39'dd.mm.yyy' +
        'y'#39') and TO_DATE('#39'01.01.2007'#39','#39'dd.mm.yyyy'#39'))'
      ''
      ''
      ''
      '  '
      'GROUP BY'
      '        zakaz.input_number, zakaz.input_date, '
      '        TRUNC(zakaz.date_plan,'#39'Q'#39'),'
      
        '        zakaz.tip_corp_id, zakaz.period_id, zakaz.filial_id, zak' +
        'az.stan_id,'
      
        '        (To_char(TRUNC(zakaz.date_plan,'#39'Q'#39'),'#39'YY'#39') || to_char(TRU' +
        'NC(zakaz.date_plan,'#39'Q'#39'),'#39'MM'#39') || zakaz.client_number || zakaz.pe' +
        'riod_id || zakaz.filial_id || zakaz.stan_id),'
      '        poluc.predpr_name, '
      '       kls_stan.stan_name, kls_stan.stan_kod,'
      '       kls_region.region_name, kls_region.kod_moscow,'
      
        '       kls_zakaz_period.NAME, kls_zakaz_tip_corp.NAME, zakaz.dog' +
        '_id, v_parus_dog.sagent,'
      
        '       v_parus_dog.sfaceacc, v_parus_dog.sshipview, v_parus_dog.' +
        'spay_type,'
      
        '       v_parus_dog.ssubdiv, v_parus_dog.sjur_pers, v_parus_dog.s' +
        'tarif,'
      '       zakaz.gr4, trim(poluc.GD_KOD)||'#39'/'#39'||trim(poluc.OKPO)')
    QBEDefinition.QBEFieldDefs = {
      04000000180000000A000000494E5055545F4441544501000000000009000000
      5354414E5F4E414D450100000000000B000000524547494F4E5F4E414D450100
      000000000C000000494E5055545F4E554D424552010000000000080000005354
      414E5F4B4F440100000000000A0000004B4F445F4D4F53434F57010000000000
      0B0000005449505F434F52505F494401000000000009000000504552494F445F
      494401000000000006000000504F4C5543480100000000000600000050455249
      4F44010000000000080000005449505F434F5250010000000000060000005341
      47454E5401000000000008000000534641434541434301000000000009000000
      53534849505649455701000000000009000000535041595F5459504501000000
      0000070000005353554244495601000000000009000000534A55525F50455253
      01000000000006000000535441524946010000000000080000005341474E4649
      464F0100000000000300000047523401000000000009000000444154415F504C
      414E0100000000000900000046494C49414C5F49440100000000000300000049
      445A010000000000070000005354414E5F4944010000000000}
    ReadOnly = True
    Session = DM.oraMain
    Left = 432
    Top = 232
    object oraCordINPUT_NUMBER: TStringField
      FieldName = 'INPUT_NUMBER'
      Required = True
      Size = 50
    end
    object oraCordINPUT_DATE: TDateTimeField
      FieldName = 'INPUT_DATE'
      Required = True
    end
    object oraCordPOLUCH: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'POLUCH'
      Required = True
      Size = 60
    end
    object oraCordSTAN_NAME: TStringField
      FieldName = 'STAN_NAME'
      Required = True
      Size = 50
    end
    object oraCordSTAN_KOD: TIntegerField
      FieldName = 'STAN_KOD'
      Required = True
    end
    object oraCordREGION_NAME: TStringField
      FieldName = 'REGION_NAME'
      Required = True
      Size = 30
    end
    object oraCordKOD_MOSCOW: TStringField
      FieldName = 'KOD_MOSCOW'
      Required = True
      Size = 3
    end
    object oraCordTIP_CORP_ID: TFloatField
      FieldName = 'TIP_CORP_ID'
      Required = True
    end
    object oraCordPERIOD_ID: TFloatField
      FieldName = 'PERIOD_ID'
      Required = True
    end
    object oraCordPERIOD: TStringField
      FieldName = 'PERIOD'
      Size = 30
    end
    object oraCordSSHIPVIEW: TStringField
      FieldName = 'SSHIPVIEW'
    end
    object oraCordSPAY_TYPE: TStringField
      FieldName = 'SPAY_TYPE'
    end
    object oraCordSSUBDIV: TStringField
      FieldName = 'SSUBDIV'
    end
    object oraCordSJUR_PERS: TStringField
      FieldName = 'SJUR_PERS'
      Required = True
    end
    object oraCordSTARIF: TStringField
      FieldName = 'STARIF'
    end
    object oraCordGR4: TStringField
      FieldName = 'GR4'
      Size = 100
    end
    object oraCordDATA_PLAN: TDateTimeField
      FieldName = 'DATA_PLAN'
    end
    object oraCordSAGNFIFO: TStringField
      FieldName = 'SAGNFIFO'
      Size = 23
    end
    object oraCordFILIAL_ID: TFloatField
      FieldName = 'FILIAL_ID'
      Required = True
    end
    object oraCordSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
    object oraCordIDZ: TStringField
      FieldName = 'IDZ'
      Size = 174
    end
    object oraCordSAGENT: TStringField
      FieldName = 'SAGENT'
    end
    object oraCordSFACEACC: TStringField
      FieldName = 'SFACEACC'
      Required = True
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
  object oraInvState: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_CONSUMERORD_SET_STATE'
      '('
      '0,   '
      ':nCOMPANY,   '
      ':nRN,'
      '0,'
      '1,'
      ':dSTATE_DATE,'
      '0,'
      '0,'
      ':nRESULT,'
      ':sMSG'
      ');'
      'end;')
    Session = DM.oraParus
    Variables.Data = {
      0300000005000000090000003A4E434F4D50414E590500000000000000000000
      00040000003A4E524E0500000000000000000000000C0000003A445354415445
      5F44415445050000000000000000000000080000003A4E524553554C54050000
      000000000000000000050000003A534D5347050000000000000000000000}
    Left = 400
    Top = 440
  end
  object oraCords: TOracleDataSet
    SQL.Strings = (
      'SELECT zakaz.input_number, zakaz.input_date,'
      '       TRUNC(zakaz.date_plan,'#39'Q'#39') data_plan,'
      
        '       zakaz.tip_corp_id, zakaz.period_id, zakaz.filial_id, zaka' +
        'z.stan_id,'
      '       zakaz.gr4,'
      '       kls_zakaz_tip_corp.NAME tip_corp,       '
      
        '      (To_char(TRUNC(zakaz.date_plan,'#39'Q'#39'),'#39'YY'#39') || to_char(TRUNC' +
        '(zakaz.date_plan,'#39'Q'#39'),'#39'MM'#39') || zakaz.client_number || zakaz.peri' +
        'od_id || zakaz.filial_id || zakaz.stan_id) idz,'#9' '
      '        kls_gosprog.gosprog_name,'
      '        --postav.predpr_name postavchik,'
      
        '        kls_prod_nomenklator.modif, kls_prod_nomenklator.mod_mod' +
        'if,'
      
        #9'sum(zakaz.fact_ves) fsum_ves, sum(zakaz.speed_ves) ssum_ves, su' +
        'm(zakaz.ves) sum_ves'
      '  FROM zakaz,'
      '       kls_gosprog,'
      '       --kls_dog,'
      '       --kls_predpr postav,'
      '       kls_zakaz_tip_corp,'
      '       kls_prod_nomenklator'
      ' WHERE   ( (kls_zakaz_tip_corp.ID = zakaz.tip_corp_id)'
      '        --AND (zakaz.lukdog_id = kls_dog.ID(+))'
      '        --AND (postav.ID(+) = kls_dog.agent_id)'
      '        AND (zakaz.prod_id_npr = kls_prod_nomenklator.prod)'
      '        AND (zakaz.gosprog_id = kls_gosprog.ID(+))'
      '        AND (zakaz.is_agent = 2)'
      '        --AND (zakaz.is_accept<>0)'
      '        AND (kls_prod_nomenklator.is_actual <> 0)'
      #9' AND zakaz.period_id > 2'
      
        #9' and (zakaz.client_date between TO_DATE('#39'01.01.2006'#39','#39'dd.mm.yyy' +
        'y'#39') and TO_DATE('#39'01.01.2007'#39','#39'dd.mm.yyyy'#39'))'
      
        '        and (To_char(TRUNC(zakaz.date_plan,'#39'Q'#39'),'#39'YY'#39') || to_char' +
        '(TRUNC(zakaz.date_plan,'#39'Q'#39'),'#39'MM'#39') || zakaz.client_number || zaka' +
        'z.period_id || zakaz.filial_id || zakaz.stan_id) ='#39'0710743312983' +
        #39#9
      ''
      '  )'
      'GROUP BY'
      
        #9'  zakaz.input_number, zakaz.input_date, TRUNC(zakaz.date_plan,'#39 +
        'Q'#39'),  '
      
        '       zakaz.tip_corp_id, zakaz.period_id, zakaz.filial_id, zaka' +
        'z.stan_id, '
      
        '      (To_char(TRUNC(zakaz.date_plan,'#39'Q'#39'),'#39'YY'#39') || to_char(TRUNC' +
        '(zakaz.date_plan,'#39'Q'#39'),'#39'MM'#39') || zakaz.client_number || zakaz.peri' +
        'od_id || zakaz.filial_id || zakaz.stan_id),'
      '       kls_gosprog.gosprog_name,'
      '       zakaz.prim, zakaz.neftebasa, zakaz.gr4,'
      '       kls_zakaz_tip_corp.NAME, --zakaz.dog_id, '
      
        '       kls_prod_nomenklator.modif, kls_prod_nomenklator.mod_modi' +
        'f')
    QBEDefinition.QBEFieldDefs = {
      04000000100000000C000000494E5055545F4E554D4245520100000000000A00
      0000494E5055545F4441544501000000000009000000444154415F504C414E01
      00000000000B0000005449505F434F52505F4944010000000000090000005045
      52494F445F49440100000000000900000046494C49414C5F4944010000000000
      070000005354414E5F4944010000000000030000004752340100000000000800
      00005449505F434F52500100000000000300000049445A0100000000000C0000
      00474F5350524F475F4E414D45010000000000050000004D4F44494601000000
      0000090000004D4F445F4D4F444946010000000000080000004653554D5F5645
      53010000000000080000005353554D5F5645530100000000000700000053554D
      5F564553010000000000}
    Session = DM.oraMain
    Left = 384
    Top = 232
    object oraCordsINPUT_NUMBER: TStringField
      FieldName = 'INPUT_NUMBER'
      Required = True
      Size = 50
    end
    object oraCordsINPUT_DATE: TDateTimeField
      FieldName = 'INPUT_DATE'
      Required = True
    end
    object oraCordsDATA_PLAN: TDateTimeField
      FieldName = 'DATA_PLAN'
    end
    object oraCordsTIP_CORP_ID: TFloatField
      FieldName = 'TIP_CORP_ID'
      Required = True
    end
    object oraCordsPERIOD_ID: TFloatField
      FieldName = 'PERIOD_ID'
      Required = True
    end
    object oraCordsFILIAL_ID: TFloatField
      FieldName = 'FILIAL_ID'
      Required = True
    end
    object oraCordsSTAN_ID: TFloatField
      FieldName = 'STAN_ID'
    end
    object oraCordsGR4: TStringField
      FieldName = 'GR4'
      Size = 100
    end
    object oraCordsTIP_CORP: TStringField
      FieldName = 'TIP_CORP'
      Required = True
      Size = 30
    end
    object oraCordsIDZ: TStringField
      FieldName = 'IDZ'
      Size = 174
    end
    object oraCordsGOSPROG_NAME: TStringField
      FieldName = 'GOSPROG_NAME'
      Size = 30
    end
    object oraCordsMODIF: TStringField
      FieldName = 'MODIF'
      Required = True
    end
    object oraCordsMOD_MODIF: TStringField
      FieldName = 'MOD_MODIF'
    end
    object oraCordsFSUM_VES: TFloatField
      FieldName = 'FSUM_VES'
    end
    object oraCordsSSUM_VES: TFloatField
      FieldName = 'SSUM_VES'
    end
    object oraCordsSUM_VES2: TFloatField
      FieldName = 'SUM_VES'
    end
  end
end
