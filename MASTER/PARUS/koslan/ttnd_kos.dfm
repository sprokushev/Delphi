object frmTTNdKos: TfrmTTNdKos
  Left = 502
  Top = 221
  Width = 815
  Height = 621
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1058#1058#1053' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081' '#1074' '#1055#1072#1088#1091#1089
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
    Top = 70
    Height = 520
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 807
    Height = 70
    Align = alTop
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 474
      Top = 16
      Width = 126
      Height = 50
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
      Left = 7
      Top = 5
      Width = 449
      Height = 60
      Caption = ' '#1048#1084#1087#1086#1088#1090' '#1074' '#1055#1072#1088#1091#1089' '
      TabOrder = 1
      object Label1: TLabel
        Left = 10
        Top = 18
        Width = 130
        Height = 13
        Caption = #1050#1072#1090#1072#1083#1086#1075' '#1074#1093#1086#1076#1085#1099#1093' '#1092#1072#1081#1083#1086#1074':'
      end
      object edPath: TDirectoryEdit
        Left = 12
        Top = 32
        Width = 313
        Height = 21
        DialogText = #1042#1099#1073#1080#1088#1080#1090#1077' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1102
        NumGlyphs = 1
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 344
        Top = 14
        Width = 100
        Height = 25
        Action = acFilter
        Caption = #1054#1090#1082#1088#1099#1090#1100
        TabOrder = 1
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
  end
  object Panel2: TPanel
    Left = 188
    Top = 70
    Width = 619
    Height = 520
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 1
      Top = 217
      Width = 617
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object dbgTTN17_cond: TDBGridEh
      Left = 1
      Top = 1
      Width = 617
      Height = 216
      Align = alTop
      AllowedOperations = [alopUpdateEh]
      DataSource = dsTTN
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghRowHighlight]
      RowHeight = 4
      RowLines = 1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object dbgTTN17_new: TDBGridEh
      Left = 1
      Top = 220
      Width = 617
      Height = 299
      Align = alClient
      AllowedOperations = []
      DataSource = dsTTN17specs
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghRowHighlight]
      ReadOnly = True
      RowHeight = 4
      RowLines = 1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 70
    Width = 185
    Height = 520
    Align = alLeft
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 183
      Height = 518
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
  object ActionManager1: TActionManager
    Left = 720
    Top = 152
    StyleName = 'XP Style'
    object acFilter: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100
      ImageIndex = 0
      OnExecute = acFilterExecute
    end
    object acLoad: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1055#1072#1088#1091#1089
      ImageIndex = 2
      OnExecute = acLoadExecute
    end
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
      0300000002000000080000003A4E494E5F444F43050000000000000000000000
      090000003A4E4F55545F444F43050000000000000000000000}
    Left = 468
    Top = 301
  end
  object oraParus: TOracleSession
    Left = 452
    Top = 148
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
    Left = 588
    Top = 84
  end
  object dsCatalog: TDataSource
    DataSet = mteCatalog
    Left = 588
    Top = 132
  end
  object dsTTN: TDataSource
    DataSet = tttn
    Left = 280
    Top = 160
  end
  object dsTTN17specs: TDataSource
    AutoEdit = False
    DataSet = tTTNspecs
    Left = 280
    Top = 376
  end
  object tTTN1: TADODataSet
    Connection = adoMain
    CursorType = ctStatic
    CommandText = 
      'select * from "c:\borland\projs\parus\pech\input\transinvcust.db' +
      'f"'
    Parameters = <>
    Prepared = True
    Left = 280
    Top = 112
  end
  object tTTNspecs: TADODataSet
    Connection = adoMain
    CursorType = ctStatic
    CommandText = 'select * from transinvcustspecs'
    DataSource = dsTTN
    IndexFieldNames = 'nprn'
    MasterFields = 'nrn'
    Parameters = <>
    Left = 280
    Top = 328
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
      4E444F43554D454E540500000000000000000000000E0000003A4E50524E5F44
      4F43554D454E54030000000000000000000000090000003A44494E5F44415445
      0C0000000000000000000000080000003A4E5354415455530300000000000000
      000000000E0000003A4E425245414B55505F4B494E4403000000000000000000
      0000040000003A4E524E030000000000000000000000}
    Left = 412
    Top = 302
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
      4E444F43554D454E540500000000000000000000000E0000003A4E50524E5F44
      4F43554D454E54030000000000000000000000090000003A44494E5F44415445
      0C0000000000000000000000080000003A4E5354415455530300000000000000
      000000000E0000003A4E425245414B55505F4B494E4403000000000000000000
      0000040000003A4E524E030000000000000000000000}
    Left = 532
    Top = 302
  end
  object qInS: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_DOCINPT_FIND('
      '  1,'
      '  2,'
      '  '#39'SheepDirectToDepts'#39','
      '  :nDOCUMENT,'
      '  :nRESULT,'
      '  1);'
      'end;')
    Session = oraParus
    Variables.Data = {
      03000000020000000A0000003A4E444F43554D454E5405000000000000000000
      0000080000003A4E524553554C54050000000000000000000000}
    Left = 412
    Top = 387
  end
  object oraFindPack: TOracleQuery
    SQL.Strings = (
      
        'SELECT nquant FROM V_NOMNMODIFPACK v  WHERE trim(v.SMODIF_CODE)=' +
        ':code')
    Session = oraParus
    Variables.Data = {0300000001000000050000003A434F4445050000000000000000000000}
    Scrollable = True
    Left = 532
    Top = 387
  end
  object adoMain: TADOConnection
    LoginPrompt = False
    Left = 452
    Top = 101
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'Koslan'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      'Panel1.GroupBox1.edPath.<P>.Text')
    Left = 720
    Top = 248
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'load'
    Left = 720
    Top = 200
  end
  object oraS: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_DOCINPT_FIND('
      '  1,'
      '  2,'
      '  '#39'ConsumersOrders'#39','
      '  :nDOCUMENT,'
      '  :nRESULT,'
      '  1);'
      'end;')
    Session = oraParus
    Variables.Data = {
      03000000020000000A0000003A4E444F43554D454E5403000000000000000000
      0000080000003A4E524553554C54030000000000000000000000}
    Left = 468
    Top = 387
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
    Left = 416
    Top = 249
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
    Left = 528
    Top = 249
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
    Session = oraParus
    Variables.Data = {
      0300000008000000090000003A4E434F4D50414E590300000000000000000000
      00040000003A4E524E0300000000000000000000000A0000003A53554E495443
      4F4445050000000000000000000000060000003A53434F444505000000000000
      0000000000080000003A4E464F524D41540300000000000000000000000B0000
      003A535354525F56414C55450500000000000000000000000B0000003A4E4E55
      4D5F56414C55450400000000000000000000000C0000003A44444154455F5641
      4C55450C0000000000000000000000}
    Left = 464
    Top = 441
  end
  object tttn: TDbf
    FilePath = 'C:\Borland\projs\parus\koslan\input\'
    IndexDefs = <>
    TableName = 'transinvdept.DBF'
    TableLevel = 4
    Left = 324
    Top = 110
    object tttnNRN: TFloatField
      FieldName = 'NRN'
      ReadOnly = True
    end
    object tttnSDOCTYPE: TStringField
      FieldName = 'SDOCTYPE'
      ReadOnly = True
      Size = 10
    end
    object tttnSPREF: TStringField
      FieldName = 'SPREF'
      Size = 10
    end
    object tttnSNUMB: TStringField
      FieldName = 'SNUMB'
      ReadOnly = True
      Size = 10
    end
    object tttnDDOCDATE: TDateField
      FieldName = 'DDOCDATE'
      ReadOnly = True
    end
    object tttnNSTATUS: TFloatField
      FieldName = 'NSTATUS'
      ReadOnly = True
    end
    object tttnNIN_STATUS: TFloatField
      FieldName = 'NIN_STATUS'
      ReadOnly = True
    end
    object tttnDWORK_DATE: TDateField
      FieldName = 'DWORK_DATE'
      ReadOnly = True
    end
    object tttnDIN_WORK_D: TDateField
      FieldName = 'DIN_WORK_D'
      ReadOnly = True
    end
    object tttnSDIRDOC: TStringField
      FieldName = 'SDIRDOC'
      ReadOnly = True
      Size = 10
    end
    object tttnSDIRNUMB: TStringField
      FieldName = 'SDIRNUMB'
      ReadOnly = True
    end
    object tttnDDIRDATE: TDateField
      FieldName = 'DDIRDATE'
      ReadOnly = True
    end
    object tttnSSTOPER: TStringField
      FieldName = 'SSTOPER'
      ReadOnly = True
    end
    object tttnSFACEACC: TStringField
      FieldName = 'SFACEACC'
      ReadOnly = True
    end
    object tttnSFACC_CURR: TStringField
      FieldName = 'SFACC_CURR'
      ReadOnly = True
      Size = 10
    end
    object tttnSSTORE: TStringField
      FieldName = 'SSTORE'
      ReadOnly = True
    end
    object tttnSMOL: TStringField
      FieldName = 'SMOL'
      ReadOnly = True
    end
    object tttnSSHEEPVIEW: TStringField
      FieldName = 'SSHEEPVIEW'
      ReadOnly = True
    end
    object tttnSSUBDIV: TStringField
      FieldName = 'SSUBDIV'
      ReadOnly = True
    end
    object tttnSCURRENCY: TStringField
      FieldName = 'SCURRENCY'
      ReadOnly = True
      Size = 10
    end
    object tttnNCURCOURS: TFloatField
      FieldName = 'NCURCOURS'
      ReadOnly = True
    end
    object tttnNCURBASE: TFloatField
      FieldName = 'NCURBASE'
      ReadOnly = True
    end
    object tttnNFA_CURCOU: TFloatField
      FieldName = 'NFA_CURCOU'
      ReadOnly = True
    end
    object tttnNFA_CURBAS: TFloatField
      FieldName = 'NFA_CURBAS'
      ReadOnly = True
    end
    object tttnSRECIPDOC: TStringField
      FieldName = 'SRECIPDOC'
      ReadOnly = True
      Size = 10
    end
    object tttnSRECIPNUMB: TStringField
      FieldName = 'SRECIPNUMB'
      ReadOnly = True
    end
    object tttnDRECIPDATE: TDateField
      FieldName = 'DRECIPDATE'
      ReadOnly = True
    end
    object tttnSFERRYMAN: TStringField
      FieldName = 'SFERRYMAN'
      ReadOnly = True
    end
    object tttnSGETCONFIR: TStringField
      FieldName = 'SGETCONFIR'
      ReadOnly = True
      Size = 80
    end
    object tttnSWAYBLADEN: TStringField
      FieldName = 'SWAYBLADEN'
      ReadOnly = True
    end
    object tttnSDRIVER: TStringField
      FieldName = 'SDRIVER'
      ReadOnly = True
    end
    object tttnSCAR: TStringField
      FieldName = 'SCAR'
      ReadOnly = True
    end
    object tttnSROUTE: TStringField
      FieldName = 'SROUTE'
      ReadOnly = True
      Size = 10
    end
    object tttnSTRAILER1: TStringField
      FieldName = 'STRAILER1'
      ReadOnly = True
    end
    object tttnSTRAILER2: TStringField
      FieldName = 'STRAILER2'
      ReadOnly = True
    end
    object tttnSIN_STORE: TStringField
      FieldName = 'SIN_STORE'
      ReadOnly = True
    end
    object tttnSIN_MOL: TStringField
      FieldName = 'SIN_MOL'
      ReadOnly = True
    end
    object tttnSIN_STOPER: TStringField
      FieldName = 'SIN_STOPER'
      ReadOnly = True
    end
    object tttnNIN_CURCOU: TFloatField
      FieldName = 'NIN_CURCOU'
      ReadOnly = True
    end
    object tttnNIN_CURBAS: TFloatField
      FieldName = 'NIN_CURBAS'
      ReadOnly = True
    end
    object tttnSIN_CURREN: TStringField
      FieldName = 'SIN_CURREN'
      ReadOnly = True
      Size = 10
    end
    object tttnSCOMMENTS: TStringField
      FieldName = 'SCOMMENTS'
      ReadOnly = True
      Size = 160
    end
    object tttnSOUT_SUBDI: TStringField
      FieldName = 'SOUT_SUBDI'
      ReadOnly = True
    end
    object tttnSVDOCTYPE: TStringField
      FieldName = 'SVDOCTYPE'
      ReadOnly = True
      Size = 10
    end
    object tttnSVDOCNUMB: TStringField
      FieldName = 'SVDOCNUMB'
      ReadOnly = True
    end
    object tttnDVDOCDATE: TDateField
      FieldName = 'DVDOCDATE'
      ReadOnly = True
    end
    object tttnSGRAPHP: TStringField
      FieldName = 'SGRAPHP'
      ReadOnly = True
    end
    object tttnSJUR_PERS: TStringField
      FieldName = 'SJUR_PERS'
      ReadOnly = True
    end
    object tttnNRN_CORD: TFloatField
      FieldName = 'NRN_CORD'
    end
    object tttnNSUMMWITHN: TFloatField
      FieldName = 'NSUMMWITHN'
    end
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
    Left = 648
    Top = 88
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
    Left = 720
    Top = 88
  end
  object oraIns: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_AGNDRIVERS_INSERT'
      '( '
      '  :nCOMPANY,'
      '  :nPRN,'
      '  :sSELF_CODE,'
      '  :sCODE,'
      '  :sNAME,'
      '  :nIS_DRV,'
      '  :nIS_ECS,'
      '  :nRN'
      ');'
      'end;')
    Session = oraParus
    Left = 536
    Top = 440
  end
  object orafindAgent: TOracleQuery
    SQL.Strings = (
      'begin '
      'FIND_AGENT_BY_MNEMO('
      '2,'
      ':code,'
      ':RN); '
      'end;')
    Session = oraParus
    Variables.Data = {
      0300000002000000050000003A434F4445050000000000000000000000030000
      003A524E030000000000000000000000}
    Left = 616
    Top = 352
  end
  object oracarins: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_AGENTCARS_INSERT( '
      '2,'
      ':prn,'
      ':sCAR_NUMBER,'
      #39'1'#39', '
      'null, '
      ':nRN'
      ');  '
      'end;')
    Session = oraParus
    Variables.Data = {
      0300000003000000040000003A50524E0300000000000000000000000C000000
      3A534341525F4E554D424552050000000000000000000000040000003A4E524E
      030000000000000000000000}
    Left = 616
    Top = 392
  end
end
