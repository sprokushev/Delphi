object frmPP: TfrmPP
  Left = 374
  Top = 265
  Width = 532
  Height = 494
  Caption = #1055#1072#1088#1090#1080#1080' '#1080' '#1094#1077#1085#1099
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
  object Splitter1: TSplitter
    Left = 0
    Top = 273
    Width = 524
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 524
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 9
      Top = 13
      Width = 6
      Height = 13
      Caption = #1089
    end
    object Label3: TLabel
      Left = 9
      Top = 39
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object deBeg: TDateEdit
      Left = 25
      Top = 10
      Width = 95
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      TabOrder = 0
      Text = '17.03.2003'
    end
    object deEnd: TDateEdit
      Left = 25
      Top = 33
      Width = 95
      Height = 20
      DefaultToday = True
      NumGlyphs = 2
      TabOrder = 1
      Text = '17.03.2003'
    end
    object BitBtn1: TBitBtn
      Left = 136
      Top = 24
      Width = 75
      Height = 25
      Action = acFilter
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100
      TabOrder = 2
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 65
    Width = 524
    Height = 208
    Align = alTop
    DataSource = dsPP
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PP'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PRICE'
        Footers = <>
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 276
    Width = 524
    Height = 187
    Align = alClient
    DataSource = dsDetail
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'INDOCDATE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'INDOCPREF'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'INDOCNUMB'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'MODIF_CODE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PLANQUANT'
        Footers = <>
      end>
  end
  object oraPartyPrice: TOracleDataSet
    SQL.Strings = (
      'SELECT   ev_1.party, ev_1.price, ev_1.pp, ev_1.nommodif'
      
        '    FROM (SELECT   (p.code || '#39' '#39' || n.modif_code) AS pp, ic.pri' +
        'ce,'
      '                   p.entry_date, i.party, ic.nommodif'
      
        '              FROM inorders i, inorderspecs ic, incomdoc p, nomm' +
        'odif n'
      '             WHERE i.rn = ic.prn'
      '               AND i.party = p.rn'
      '               AND ic.nommodif = n.rn'
      '               AND i.indoctype IN (138152460, 138216525)'
      
        '               AND p.entry_date BETWEEN '#39'01-may-03'#39' AND '#39'31-may-' +
        '03'#39
      '          GROUP BY p.code,'
      '                   n.modif_code,'
      '                   ic.price,'
      '                   p.entry_date,'
      '                   i.party,'
      '                   ic.nommodif) ev_1,'
      '         (SELECT   ev_0.pp alias_19'
      
        '              FROM (SELECT   (p.code || '#39' '#39' || n.modif_code) AS ' +
        'pp, ic.price'
      '                        FROM inorders i,'
      '                             inorderspecs ic,'
      '                             incomdoc p,'
      '                             nommodif n'
      '                       WHERE i.rn = ic.prn'
      '                         AND i.party = p.rn'
      '                         AND ic.nommodif = n.rn'
      
        '                         AND i.indoctype IN (138152460, 13821652' +
        '5)'
      
        '                    GROUP BY p.code, n.modif_code, ic.price) ev_' +
        '0'
      '          GROUP BY ev_0.pp'
      '            HAVING COUNT (ev_0.pp) > 1) alias_18'
      '   WHERE alias_18.alias_19 = ev_1.pp'
      'ORDER BY ev_1.pp')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000050000005041525459010000000000050000005052494345
      010000000000020000005050010000000000080000004E4F4D4D4F4449460100
      00000000}
    ReadOnly = True
    Session = oraParus
    Left = 352
    Top = 40
    object oraPartyPricePARTY: TFloatField
      FieldName = 'PARTY'
    end
    object oraPartyPricePRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      Required = True
    end
    object oraPartyPricePP: TStringField
      DisplayLabel = #1055#1072#1088#1090#1080#1103
      FieldName = 'PP'
      Size = 41
    end
    object oraPartyPriceNOMMODIF: TFloatField
      FieldName = 'NOMMODIF'
      Required = True
    end
  end
  object dsPP: TDataSource
    DataSet = oraPartyPrice
    Left = 352
    Top = 16
  end
  object ActionManager1: TActionManager
    Left = 408
    Top = 24
    StyleName = 'XP Style'
    object acFilter: TAction
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100
      OnExecute = acFilterExecute
    end
  end
  object oraDetail: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ORDERED */'
      
        'i.indocdate, i.indocpref,i.indocnumb,  ic.planquant, n.modif_cod' +
        'e'
      '  FROM inorders i, inorderspecs ic, nommodif n'
      ' WHERE i.rn = ic.prn'
      '   AND ic.nommodif = n.rn'
      '   AND i.indoctype IN (138152460, 138216525)'
      '  and ic.PRICE=:price'
      '  and i.party=:party'
      '  and ic.nommodif=:nommodif')
    Variables.Data = {
      0300000003000000060000003A5052494345040000000800000013F241CF6655
      034000000000060000003A50415254590300000004000000797B1F0B00000000
      090000003A4E4F4D4D4F4449460300000004000000699F400800000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000009000000494E444F43444154450100000000000900000049
      4E444F435052454601000000000009000000494E444F434E554D420100000000
      0009000000504C414E5155414E540100000000000A0000004D4F4449465F434F
      4445010000000000}
    Master = oraPartyPrice
    MasterFields = 'party;price;nommodif'
    ReadOnly = True
    Session = oraParus
    Left = 264
    Top = 16
    object oraDetailINDOCDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'INDOCDATE'
      Required = True
    end
    object oraDetailINDOCPREF: TStringField
      DisplayLabel = #1055#1088#1077#1092#1080#1082#1089
      FieldName = 'INDOCPREF'
      Required = True
      Size = 10
    end
    object oraDetailINDOCNUMB: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'INDOCNUMB'
      Required = True
      Size = 10
    end
    object oraDetailPLANQUANT: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'PLANQUANT'
      Required = True
    end
    object oraDetailMODIF_CODE: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'MODIF_CODE'
      Required = True
    end
  end
  object dsDetail: TDataSource
    DataSet = oraDetail
    Left = 264
    Top = 48
  end
  object oraParus: TOracleSession
    LogonUsername = 'pvz'
    LogonDatabase = 'P5'
    Left = 400
    Top = 88
  end
end
