object frm1cVypPar: Tfrm1cVypPar
  Left = 273
  Top = 248
  Width = 733
  Height = 528
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1074#1099#1087#1080#1089#1082#1080
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
  object tvCatalog: TvgDBTreeView
    Left = 16
    Top = 88
    Width = 233
    Height = 232
    Hint = #1050#1072#1090#1072#1083#1086#1075#1080' '#1080#1079' '#1055#1072#1088#1091#1089#1072
    AutoExpand = True
    HotTrack = True
    DataSource = dsCatalog
    DataFieldID = 'RN'
    DataFieldParentID = 'CRN'
    DataFieldText = 'NAME'
    Options = [toQuickSearch]
    Images = frmMain.ImageList2
    Indent = 19
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  object DBGridEh1: TDBGridEh
    Left = 256
    Top = 88
    Width = 449
    Height = 377
    DataSource = dsCB
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
  end
  object BitBtn1: TBitBtn
    Left = 512
    Top = 16
    Width = 75
    Height = 25
    Action = acVyp2Par
    Caption = 'acVyp2Par'
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 592
    Top = 16
    Width = 75
    Height = 25
    Action = acReload
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 3
  end
  object oraCB: TOracleDataSet
    SQL.Strings = (
      
        'SELECT /*+ RULE*/ ROWIDTOCHAR (Vyp.ROWID) AS Rid, Vyp.Date_vyp A' +
        'S Bank_docdate,'
      '       Vyp.Num_vyp AS Bank_docnumb, Rs.Rs_rs, Rs.Rs_bik,'
      
        '       Rs.Rs_parus_agn AS Own_agn, Rs.Rs_parus_acc AS Own_acc, V' +
        'yp.Op_vyp AS vid,'
      
        '       Vyp.Sum_vyp AS Pay_sum, Vyp.Rem_vyp AS Pay_info, Ap.Agnab' +
        'br AS AGENT,'
      '       Ap.Strcode AS Acc,Vyp.Date_vyp AS pay_data, 0 AS tax_sum'
      
        '  FROM RUI_VYPISKA Vyp, RUI_ARX_AGN Agn, RUI_ARX_RS Rs, V_agnacc' +
        '3 Ap'
      ' WHERE  (Vyp.Acc_vyp) =  (Rs.Rs_abbr)'
      '   AND  (Vyp.Sc1) =  (Agn.Agn_abbr)'
      '   AND  (Ap.Agnabbr) =  (Agn.Agn_parus_agnabbr)'
      '   AND vyp.parus_rn_vyp=0')
    QBEDefinition.QBEFieldDefs = {
      030000000E0000000300000052494401000000000C00000042414E4B5F444F43
      4441544501000000000C00000042414E4B5F444F434E554D4201000000000500
      000052535F525301000000000600000052535F42494B0100000000070000004F
      574E5F41474E0100000000070000004F574E5F41434301000000000300000056
      49440100000000070000005041595F53554D0100000000080000005041595F49
      4E464F0100000000050000004147454E54010000000003000000414343010000
      0000080000005041595F444154410100000000070000005441585F53554D0100
      000000}
    Session = oraSesMain
    Left = 368
    Top = 8
  end
  object oraSesMain: TOracleSession
    LogonUsername = 'pvz'
    LogonDatabase = 'PTEST'
    Left = 16
    Top = 8
  end
  object oraCatalog: TOracleDataSet
    SQL.Strings = (
      
        'select * from v_acatalog where unitcode='#39'BankDocuments'#39' and comp' +
        'any=2 '
      'order by signs, crn, name')
    QBEDefinition.QBEFieldDefs = {
      030000000800000002000000524E01000000000300000043524E010000000004
      0000004E414D45010000000008000000554E4954434F44450100000000070000
      0056455253494F4E010000000007000000434F4D50414E590100000000040000
      00505249560100000000050000005349474E530100000000}
    QueryAllRecords = False
    Session = oraSesMain
    Left = 72
    Top = 281
  end
  object dsCatalog: TDataSource
    DataSet = oraCatalog
    Left = 133
    Top = 281
  end
  object oraInsert: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_BANKDOCS_INSERT ('
      '  :nCOMPANY,'
      '  :nCRN,'
      '  :sBANK_TYPEDOC,'
      '  :sBANK_PREFDOC,'
      '  :sBANK_NUMBDOC,'
      '  :dBANK_DATEDOC,'
      '  :sVALID_TYPEDOC,'
      '  :sVALID_NUMBDOC,'
      '  :dVALID_DATEDOC,'
      '  :sFROM_NUMB,'
      '  :dFROM_DATE,'
      '  :sAGENT_FROM,'
      '  :sAGENTF_ACC,'
      '  :sAGENT_TO,'
      '  :sAGENTT_ACC,'
      '  :sBUNIT_MNEMO,'
      '  :sTYPE_OPER,'
      '  :sPAY_SEQ,'
      '  :dPAY_DATA,'
      '  :sPAY_INFO,'
      '  :sPAY_NOTE,'
      '  :nPAY_SUM,'
      '  :nTAX_SUM,'
      '  :nPERCENT_TAX_SUM,'
      '  :sCURRENCY,'
      '  :sPAY_TYPE,'
      '  :sPAY_KIND,'
      '  :sJUR_PERS,'
      '  :nRN);'
      'end;')
    Session = oraSesMain
    Variables.Data = {
      030000001D000000090000003A4E434F4D50414E590300000000000000000000
      00050000003A4E43524E0300000000000000000000000E0000003A5342414E4B
      5F54595045444F430500000000000000000000000E0000003A5342414E4B5F50
      524546444F430500000000000000000000000E0000003A5342414E4B5F4E554D
      42444F430500000000000000000000000E0000003A4442414E4B5F4441544544
      4F430C00000000000000000000000F0000003A5356414C49445F54595045444F
      430500000000000000000000000F0000003A5356414C49445F4E554D42444F43
      0500000000000000000000000F0000003A4456414C49445F44415445444F4305
      00000000000000000000000B0000003A5346524F4D5F4E554D42050000000000
      0000000000000B0000003A4446524F4D5F444154450500000000000000000000
      000C0000003A534147454E545F46524F4D0500000000000000000000000C0000
      003A534147454E54465F4143430500000000000000000000000A0000003A5341
      47454E545F544F0500000000000000000000000C0000003A534147454E54545F
      4143430500000000000000000000000D0000003A5342554E49545F4D4E454D4F
      0500000000000000000000000B0000003A53545950455F4F5045520500000000
      00000000000000090000003A535041595F534551050000000000000000000000
      0A0000003A445041595F444154410C00000000000000000000000A0000003A53
      5041595F494E464F0500000000000000000000000A0000003A535041595F4E4F
      5445050000000000000000000000090000003A4E5041595F53554D0400000000
      00000000000000090000003A4E5441585F53554D040000000000000000000000
      110000003A4E50455243454E545F5441585F53554D0400000000000000000000
      000A0000003A5343555252454E43590500000000000000000000000A0000003A
      535041595F545950450500000000000000000000000A0000003A535041595F4B
      494E440500000000000000000000000A0000003A534A55525F50455253050000
      000000000000000000040000003A4E524E030000000000000000000000}
    Left = 229
    Top = 6
  end
  object oraNextNumb: TOracleQuery
    SQL.Strings = (
      'begin'
      'P_BANKDOCS_GETNEXTNUMB (:company, :pref ,:doctype, :snumb);'
      'end;')
    Session = oraSesMain
    Variables.Data = {
      0300000004000000080000003A434F4D50414E59030000000000000000000000
      050000003A50524546050000000000000000000000080000003A444F43545950
      45050000000000000000000000060000003A534E554D42050000000000000000
      000000}
    Left = 308
    Top = 6
  end
  object ActionManager1: TActionManager
    Left = 168
    Top = 8
    StyleName = 'XP Style'
    object acVyp2Par: TAction
      Caption = 'acVyp2Par'
      OnExecute = acVyp2ParExecute
    end
    object acReload: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = acReloadExecute
    end
  end
  object oraQ: TOracleQuery
    Session = oraSesMain
    Left = 104
    Top = 16
  end
  object dsCB: TDataSource
    DataSet = oraCB
    Left = 416
    Top = 8
  end
end
