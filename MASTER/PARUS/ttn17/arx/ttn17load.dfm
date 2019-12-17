object frmTTN17: TfrmTTN17
  Left = 259
  Top = 183
  Width = 645
  Height = 449
  Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077
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
    Top = 121
    Width = 637
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 121
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 52
      Height = 13
      Caption = #1047#1072' '#1087#1077#1088#1080#1086#1076
    end
    object Label2: TLabel
      Left = 24
      Top = 35
      Width = 6
      Height = 13
      Caption = #1089
    end
    object Label3: TLabel
      Left = 24
      Top = 69
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object deBeg: TDateEdit
      Left = 40
      Top = 32
      Width = 97
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      TabOrder = 0
      Text = '17.03.2003'
    end
    object deEnd: TDateEdit
      Left = 40
      Top = 64
      Width = 99
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      TabOrder = 1
      Text = '17.03.2003'
    end
    object BitBtn1: TBitBtn
      Left = 192
      Top = 40
      Width = 75
      Height = 25
      Action = acFilter
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 2
    end
    object BitBtn2: TBitBtn
      Left = 280
      Top = 40
      Width = 75
      Height = 25
      Action = acLoad
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 124
    Width = 637
    Height = 295
    Align = alClient
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 1
      Top = 121
      Width = 635
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object dbgTTN17_cond: TDBGridEh
      Left = 1
      Top = 1
      Width = 635
      Height = 120
      Align = alTop
      DataSource = dsTTN17_cond
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object dbgTTN17: TDBGridEh
      Left = 1
      Top = 124
      Width = 635
      Height = 170
      Align = alClient
      DataSource = dsTTN17
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
  end
  object oraMain: TOracleSession
    Cursor = crHourGlass
    DesignConnection = False
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH.world'
    ConnectAs = caNormal
    ThreadSafe = False
    Preferences.FloatPrecision = 0
    Preferences.IntegerPrecision = 0
    Preferences.SmallIntPrecision = -1
    Preferences.UseOCI7 = False
    Preferences.ConvertCRLF = True
    Preferences.TrimStringFields = True
    Preferences.MaxStringFieldSize = 0
    Preferences.ZeroDateIsNull = True
    Preferences.NullLOBIsEmpty = False
    Pooling = spNone
    MTSOptions = [moImplicit, moUniqueServer]
    Connected = False
    RollbackOnDisconnect = False
    NullValue = nvUnAssigned
    SQLTrace = stUnchanged
    OptimizerGoal = ogUnchanged
    IsolationLevel = ilUnchanged
    BytesPerCharacter = bc1Byte
    Left = 120
    Top = 136
  end
  object oraTTN17: TOracleDataSet
    SQL.Strings = (
      'select'
      ' k.sved_num ,k.num_cist,u.cat_cen_id,m.date_cen,k.num_kvit,'
      ' k.date_kvit AS ddocdate,'
      ' k.date_kvit AS dwork_date,'
      ' k.date_kvit AS dsaledate,'
      ' p.SACCDOC AS saccdoc,'
      ' (d.dog_number) as saccnumb,'
      ' d.DOG_DATE as daccdate,'
      ' P.SFACEACC,'
      ' P.SAGENT,'
      ' p.STARIF,'
      ' p.sshipview,'
      ' p.spay_Type,'
      ' 1 as ncurcours,'
      ' 1 as ncurbase,'
      ' 1 as nfa_cours,'
      ' 1 as nfa_coursb,'
      ' k.VES,p.NPRICE,u.PROC_INSURE,prod.AKCIZ,m.GOSPROG_ID,'
      
        ' round(k.VES*1000*p.NPRICE/1.2,2) as d_41,round(round(k.VES*1000' +
        '*p.NPRICE,2)/1.2*0.2,2) as d_191,'
      
        ' round(k.ves*u.usl_sum,2)*(k.flg_dop_cist+1) as sum_nacen,round(' +
        'round(k.ves*u.usl_sum,2)*0.2,2)*(k.flg_dop_cist+1) as ndc_nal20,'
      
        ' round(round(iif_num(m.GOSPROG_ID,'#39'='#39',50,k.sum_prod+k.sum_akciz+' +
        'k.SUM_PROD_NDS,k.VES*1000*p.NPRICE),2)*u.PROC_INSURE/100,2) as s' +
        'um_insure,'
      ' k.tarif,k.tarif_nds,'
      ' k.nom_zd as srecipnumb,'
      ' trim(pr.GD_KOD)||'#39'/'#39'||trim(pr.OKPO) AS sagnfifo,'
      ' 1 as nincnds,'
      ' k.date_kvit AS drptdate,'
      ' p.sacc_agent,'
      ' p.ssubdiv,'
      ' p.sjur_pers,'
      ' 0 as nsactsgn, k.id,'
      ' p.SNOMEN,p.SNOMMODIF,stan.STAN_NAME'
      'from kvit k, month m, kls_dog d, '
      'v_parus_price p, kls_predpr pr, '
      'usl_dog u, kls_prod prod, kls_stan stan,kls_vid_otgr v'
      'where k.nom_zd=m.nom_zd'
      'and k.PROD_ID_NPR=prod.ID_npr'
      'and (k.PROD_ID_NPR=p.PROD_ID_NPR and d.id=p.dog_id)'
      'and m.NPODOG_ID=d.ID'
      'and m.dog_id=u.DOG_ID and m.usl_number=u.USL_NUMBER'
      'and m.poluch_ID=pr.ID'
      'and stan.ID=m.STAN_ID'
      'and m.load_abbr=v.load_abbr'
      'and m.DOG_ID='#39'787'#39
      'and m.nazn_otg_id<>2'
      'and (v.load_type_id=1 or v.load_type_id=6)'
      'and k.date_kvit between p.DBEGIN and p.Dend'
      
        'and k.id not in(select kvit_id from parus_fin where task='#39'ttn17'#39 +
        ')'
      ''
      ''
      ''
      'order by  k.sved_num')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      030000002C0000000800000044444F434441544501000000000A00000044574F
      524B5F444154450100000000090000004453414C454441544501000000000700
      000053414343444F43010000000008000000534143434E554D42010000000008
      0000004441434344415445010000000008000000534641434541434301000000
      0006000000534147454E54010000000006000000535441524946010000000009
      000000535348495056494557010000000009000000535041595F545950450100
      000000090000004E435552434F5552530100000000080000004E435552424153
      450100000000090000004E46415F434F55525301000000000A0000004E46415F
      434F555253420100000000030000005645530100000000060000004E50524943
      4501000000000B00000050524F435F494E53555245010000000005000000414B
      43495A01000000000A000000474F5350524F475F494401000000000400000044
      5F3431010000000005000000445F31393101000000000900000053554D5F4E41
      43454E0100000000090000004E44435F4E414C323001000000000A0000005355
      4D5F494E53555245010000000005000000544152494601000000000900000054
      415249465F4E445301000000000A0000005352454349504E554D420100000000
      080000005341474E4649464F0100000000070000004E494E434E445301000000
      0008000000445250544441544501000000000A000000534143435F4147454E54
      01000000000700000053535542444956010000000009000000534A55525F5045
      52530100000000080000004E5341435453474E01000000000200000049440100
      00000006000000534E4F4D454E010000000009000000534E4F4D4D4F44494601
      00000000090000005354414E5F4E414D45010000000008000000535645445F4E
      554D0100000000080000004E554D5F4349535401000000000A0000004341545F
      43454E5F4944010000000008000000444154455F43454E010000000008000000
      4E554D5F4B5649540100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = oraMain
    DesignActivation = False
    Active = False
    Left = 152
    Top = 136
  end
  object oraTTN17_cond: TOracleDataSet
    SQL.Strings = (
      'select '
      ' k.sved_num,k.num_cist,u.cat_cen_id,m.date_cen,k.num_kvit,'
      ' k.date_kvit AS ddocdate,'
      ' k.date_kvit AS dwork_date,'
      ' k.date_kvit AS dsaledate,'
      ' p.SACCDOC AS saccdoc,'
      ' (d.dog_number) as saccnumb,'
      ' d.DOG_DATE as daccdate,'
      ' P.SFACEACC,'
      ' P.SAGENT,'
      ' p.STARIF,'
      ' p.sshipview,'
      ' p.spay_Type,'
      ' 1 as ncurcours,'
      ' 1 as ncurbase,'
      ' 1 as nfa_cours,'
      ' 1 as nfa_coursb,'
      ' k.VES,p.NPRICE,u.PROC_INSURE,prod.AKCIZ,m.GOSPROG_ID,'
      
        ' round(k.VES*1000*p.NPRICE/1.2,2) as d_41,round(round(k.VES*1000' +
        '*p.NPRICE,2)/1.2*0.2,2) as d_191,'
      
        ' round(k.ves*u.usl_sum,2)*(k.flg_dop_cist+1) as sum_nacen,round(' +
        'round(k.ves*u.usl_sum,2)*0.2,2)*(k.flg_dop_cist+1) as ndc_nal20,'
      
        ' round(round(iif_num(m.GOSPROG_ID,'#39'='#39',50,k.sum_prod+k.sum_akciz+' +
        'k.SUM_PROD_NDS,k.VES*1000*p.NPRICE),2)*u.PROC_INSURE/100,2) as s' +
        'um_insure,'
      ' k.tarif,k.tarif_nds,'
      ' k.nom_zd as srecipnumb,'
      ' trim(pr.GD_KOD)||'#39'/'#39'||trim(pr.OKPO) AS sagnfifo,'
      ' 1 as nincnds,'
      ' k.date_kvit AS drptdate,'
      ' p.sacc_agent,'
      ' p.ssubdiv,'
      ' p.sjur_pers,'
      ' 0 as nsactsgn, k.id,'
      ' p.SNOMEN,p.SNOMMODIF,stan.STAN_NAME'
      'from kvit k, month m, kls_dog d, '
      'v_parus_price_cond p, kls_predpr pr, '
      'usl_dog u, kls_prod prod, kls_stan stan, kls_vid_otgr v'
      'where k.nom_zd=m.nom_zd'
      'and k.PROD_ID_NPR=prod.ID_npr'
      'and (k.PROD_ID_NPR=p.PROD_ID_NPR and d.id=p.dog_id)'
      'and m.NPODOG_ID=d.ID'
      'and m.dog_id=u.DOG_ID and m.usl_number=u.USL_NUMBER'
      'and m.poluch_ID=pr.ID'
      'and stan.ID=m.STAN_ID'
      'and m.load_abbr=v.load_abbr'
      'and m.DOG_ID='#39'787'#39
      'and m.nazn_otg_id<>2'
      'and (v.load_type_id=1 or v.load_type_id=6)'
      'and k.date_kvit between p.DBEGIN and p.Dend'
      
        'and k.id not in(select kvit_id from parus_fin where task='#39'ttn17'#39 +
        ')'
      ''
      ''
      ''
      ''
      ''
      'order by  k.sved_num')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      030000002B0000000800000044444F434441544501000000000A00000044574F
      524B5F444154450100000000090000004453414C454441544501000000000700
      000053414343444F43010000000008000000534143434E554D42010000000008
      0000004441434344415445010000000008000000534641434541434301000000
      0006000000534147454E54010000000006000000535441524946010000000009
      000000535348495056494557010000000009000000535041595F545950450100
      000000090000004E435552434F5552530100000000080000004E435552424153
      450100000000090000004E46415F434F55525301000000000A0000004E46415F
      434F555253420100000000030000005645530100000000060000004E50524943
      4501000000000B00000050524F435F494E53555245010000000005000000414B
      43495A01000000000A000000474F5350524F475F494401000000000400000044
      5F3431010000000005000000445F31393101000000000900000053554D5F4E41
      43454E0100000000090000004E44435F4E414C323001000000000A0000005355
      4D5F494E53555245010000000005000000544152494601000000000900000054
      415249465F4E445301000000000A0000005352454349504E554D420100000000
      080000005341474E4649464F0100000000070000004E494E434E445301000000
      0008000000445250544441544501000000000A000000534143435F4147454E54
      01000000000700000053535542444956010000000009000000534A55525F5045
      52530100000000080000004E5341435453474E01000000000200000049440100
      00000006000000534E4F4D454E010000000009000000534E4F4D4D4F44494601
      00000000090000005354414E5F4E414D45010000000008000000535645445F4E
      554D0100000000080000004E554D5F4349535401000000000A0000004341545F
      43454E5F4944010000000008000000444154455F43454E0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = oraMain
    DesignActivation = False
    Active = False
    Left = 192
    Top = 136
  end
  object dsTTN17: TDataSource
    DataSet = oraTTN17
    Left = 152
    Top = 168
  end
  object dsTTN17_cond: TDataSource
    DataSet = oraTTN17_cond
    Left = 192
    Top = 168
  end
  object ActionManager1: TActionManager
    Left = 200
    Top = 72
    StyleName = 'XP Style'
    object acFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088
      OnExecute = acFilterExecute
    end
    object acLoad: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      OnExecute = acLoadExecute
    end
  end
  object adoMain: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Ex' +
      'tended Properties="DSN=pf;UID=;SourceDB=C:\Borland\projs\parus\t' +
      'tn17\blank\;SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Coll' +
      'ate=Machine;Null=Yes;Deleted=Yes;"'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 192
    Top = 8
  end
  object adoTIC: TADOQuery
    AutoCalcFields = False
    Connection = adoMain
    CursorType = ctStatic
    MarshalOptions = moMarshalModifiedOnly
    Parameters = <>
    SQL.Strings = (
      'insert into tic values ('
      '')
    Left = 224
    Top = 8
  end
  object adoTICS: TADOQuery
    Connection = adoMain
    Parameters = <>
    Left = 264
    Top = 8
  end
  object XPManifest1: TXPManifest
    Left = 232
    Top = 72
  end
  object OraQuery: TOracleQuery
    Session = oraMain
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 224
    Top = 132
  end
  object oraLogon: TOracleLogon
    Session = oraMain
    Retries = 2
    Options = [ldDatabase, ldDatabaseList, ldLogonHistory]
    AliasDropDownCount = 8
    HistorySize = 6
    HistoryWithPassword = False
    Caption = #1042#1093#1086#1076' '#1074' '#1055#1072#1088#1091#1089
    Left = 88
    Top = 132
  end
end
