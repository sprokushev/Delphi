object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 208
  Top = 121
  Height = 346
  Width = 524
  object OracleSession1: TOracleSession
    Cursor = crHourGlass
    DesignConnection = False
    LogonDatabase = 'P5'
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
    Left = 32
    Top = 24
  end
  object Docs: TOracleDataSet
    SQL.Strings = (
      
        'select transinvdept.RN, pref, numb, docdate, summwithNDS as summ' +
        ', in_store,'
      
        #9'   (select AZS_Number from azsazslistmt where rn = transinvdept' +
        '.store) as src,'
      
        #9'   (select AGNABBR from agnlist where rn = transinvdept.MOL) as' +
        ' src_mol, '
      #9'   '
      
        #9'   (select AZS_NUMBER from azsazslistmt where rn = transinvdept' +
        '.IN_store) as dest,'
      
        #9'   (select AGNABBR from agnlist where rn = transinvdept.IN_MOL)' +
        ' as dest_mol'
      ''
      'from transinvdept'
      'where'
      'docType = 3562979'
      'and (transinvdept.IN_store =:ID_dest)'
      'and docdate >= :startDate'
      'and docdate <= :endDate'
      'and (status=1 or status=2)'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000080000003A49445F44455354030000000000000000000000
      0A0000003A535441525444415445050000000000000000000000080000003A45
      4E4444415445050000000000000000000000}
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
      030000000A00000002000000524E010000000004000000505245460100000000
      040000004E554D42010000000007000000444F43444154450100000000040000
      0053554D4D010000000008000000494E5F53544F524501000000000300000053
      52430100000000070000005352435F4D4F4C0100000000040000004445535401
      0000000008000000444553545F4D4F4C0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 16
    Top = 120
    object DocsRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object DocsPREF: TStringField
      FieldName = 'PREF'
      Required = True
      Size = 10
    end
    object DocsNUMB: TStringField
      FieldName = 'NUMB'
      Required = True
      Size = 10
    end
    object DocsDOCDATE: TDateTimeField
      FieldName = 'DOCDATE'
      Required = True
    end
    object DocsSUMM: TFloatField
      FieldName = 'SUMM'
      Required = True
    end
    object DocsIN_STORE: TFloatField
      FieldName = 'IN_STORE'
    end
    object DocsSRC: TStringField
      FieldName = 'SRC'
    end
    object DocsSRC_MOL: TStringField
      FieldName = 'SRC_MOL'
    end
    object DocsDEST: TStringField
      FieldName = 'DEST'
    end
    object DocsDEST_MOL: TStringField
      FieldName = 'DEST_MOL'
    end
  end
  object azs_ID: TOracleDataSet
    SQL.Strings = (
      'select rn from azsazslistmt'
      'where azs_number = :name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000050000003A4E414D45050000000000000000000000}
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
    QBEDefinition.QBEFieldDefs = {030000000100000002000000524E0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 272
    Top = 40
    object azs_IDRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
  end
  object PriceQ: TOracleDataSet
    SQL.Strings = (
      'select c.price'
      ''
      'from dicnomns a, rlprices b, rlpricespecs c'
      ''
      'where '
      'a.rn = :nomen'
      'and b.tarif = 79073090'
      'and b.nomen = a.rn'
      'and b.rn = c.prn'
      'and sysdate >= c.pricedate'
      'and (sysdate <= c.enddate or c.enddate is null) '
      ''
      'order by c.pricedate desc')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A4E4F4D454E030000000000000000000000}
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
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 136
    Top = 8
  end
  object LicardCode: TOracleDataSet
    SQL.Strings = (
      'select e.str_value, d.group_name'
      ''
      
        'from transinvdeptspecs a, nommodif b, dicnomns c, dicGnomn d, do' +
        'cs_props_vals e'
      ''
      'where '
      'a.rn = :ID'
      'and e.docs_prop_rn = 201072015'
      'and a.nommodif = b.rn'
      'and b.prn = c.rn '
      'and c.group_code =  d.rn'
      'and d.rn = e.unit_rn')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
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
      0300000002000000090000005354525F56414C554501000000000A0000004752
      4F55505F4E414D450100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 144
    Top = 64
    object LicardCodeSTR_VALUE: TStringField
      FieldName = 'STR_VALUE'
      Size = 240
    end
    object LicardCodeGROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Required = True
      Size = 80
    end
  end
  object spec: TOracleDataSet
    SQL.Strings = (
      
        'select a.rn, c.crn, a.quant as mainEI, a.quantalt as addEI, c.rn' +
        ' as nommodif,'
      #9'   b.modif_code, b.MODIF_NAME, price, a.summwithnds as summ, '
      
        #9'  (a.quant/f.quant) as count, (select meas_mnemo from dicmunts ' +
        'where rn = f.umeas) as unit'
      ''
      
        'from transinvdeptspecs a, nommodif b, dicnomns c, dicmunts d, no' +
        'mnmodifpack e, nomnPack f'
      ''
      'where '
      'a.prn = :ID1'
      'and e.nomenPack = f.rn'
      'and e.rn = a.nomnmodifpack'
      'and b.rn = a.nommodif'
      'and b.prn = c.rn'
      'and c.umeas_main = d.rn'
      ''
      'union'
      
        'select a.rn, c.crn, a.quant as mainEI, a.quantalt as addEI, c.rn' +
        ' as nommodif,'
      #9'   b.modif_code, b.MODIF_NAME, price, a.summwithnds as summ, '
      #9'  a.quant as count, '
      #9'  ('
      #9'   select meas_name '
      #9'   from dicmunts, dicnomns '
      
        #9'   where dicnomns.UMEAS_MAIN = dicmunts.rn and dicnomns.rn = b.' +
        'prn'
      #9'   ) as unit'
      ''
      'from transinvdeptspecs a, nommodif b, dicnomns c, dicmunts d'
      ''
      'where '
      'a.prn = :ID2'
      'and b.rn = a.nommodif'
      'and b.prn = c.rn'
      'and c.umeas_main = d.rn'
      'and a.nomnmodifpack is null')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A49443103000000000000000000000004000000
      3A494432030000000000000000000000}
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
      030000000B000000060000004D41494E45490100000000050000004144444549
      01000000000A0000004D4F4449465F434F444501000000000A0000004D4F4449
      465F4E414D45010000000005000000505249434501000000000400000053554D
      4D010000000004000000554E4954010000000002000000524E01000000000300
      000043524E010000000005000000434F554E540100000000080000004E4F4D4D
      4F4449460100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = False
    OnCalcFields = specCalcFields
    Left = 136
    Top = 129
    object specRN: TFloatField
      FieldName = 'RN'
    end
    object specCRN: TFloatField
      FieldName = 'CRN'
    end
    object specMAINEI: TFloatField
      FieldName = 'MAINEI'
    end
    object specADDEI: TFloatField
      FieldName = 'ADDEI'
    end
    object specNOMMODIF: TFloatField
      FieldName = 'NOMMODIF'
    end
    object specMODIF_CODE: TStringField
      FieldName = 'MODIF_CODE'
    end
    object specMODIF_NAME: TStringField
      FieldName = 'MODIF_NAME'
      Size = 160
    end
    object specPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object specSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object specCOUNT: TFloatField
      FieldName = 'COUNT'
    end
    object specUNIT: TStringField
      FieldName = 'UNIT'
      Size = 80
    end
    object specrealPrice: TFloatField
      FieldKind = fkCalculated
      FieldName = 'realPrice'
      Calculated = True
    end
    object speclicCodeArr: TStringField
      FieldKind = fkCalculated
      FieldName = 'licCodeArr'
      Calculated = True
    end
    object speclicCodeStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'licCodeStr'
      Calculated = True
    end
  end
  object SetTTNExport: TOracleQuery
    SQL.Strings = (
      'begin '
      'parus.P_DOCS_PROPS_VALS_MODIFY'
      '('
      '  2,'
      '  :ttn_rn,'
      '  '#39'GoodsTransInvoicesToDepts'#39','
      '  '#39#1055#1088#1080#1079#1085#1072#1082' '#1101#1082#1089#1087#1086#1088#1090#1072#39',         '
      '  '#39#39',          '
      '  :val,         '
      '  '#39#39',          '
      '  :nRN'
      ');'
      'end;'
      '')
    Session = OracleSession1
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000070000003A54544E5F524E03000000000000000000000004
      0000003A4E524E030000000000000000000000040000003A56414C0300000000
      00000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 272
    Top = 104
  end
  object getExportProp: TOracleDataSet
    SQL.Strings = (
      'select num_value '
      'from docs_props_vals'
      'where'
      'unitcode = '#39'GoodsTransInvoicesToDepts'#39
      'and unit_rn = :rn')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000030000003A524E030000000000000000000000}
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
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 232
    Top = 152
  end
  object outlook: TOutlookApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 184
    Top = 128
  end
  object getRNTTN: TOracleDataSet
    SQL.Strings = (
      'select rn '
      'from transinvdept'
      'where'
      'trim(pref)=:pref'
      'and trim(numb)=:numb'
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000050000003A50524546050000000000000000000000050000
      003A4E554D42050000000000000000000000}
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
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 416
    Top = 24
  end
  object DocsBack: TOracleDataSet
    SQL.Strings = (
      
        'select transinvdept.RN, pref, numb, docdate, summwithNDS as summ' +
        ', in_store,'
      
        #9'   (select AZS_Number from azsazslistmt where rn = transinvdept' +
        '.store) as src,'
      
        #9'   (select AGNABBR from agnlist where rn = transinvdept.MOL) as' +
        ' src_mol, '
      #9'   '
      
        #9'   (select AZS_NUMBER from azsazslistmt where rn = transinvdept' +
        '.IN_store) as dest,'
      
        #9'   (select AGNABBR from agnlist where rn = transinvdept.IN_MOL)' +
        ' as dest_mol'
      ''
      'from transinvdept'
      'where'
      'docType = 3562979'
      'and (transinvdept.store = :ID_Dest)'
      'and docdate >= :startDate'
      'and docdate <= :endDate'
      'and (status=1 or status=2)'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000080000003A49445F44455354030000000000000000000000
      0A0000003A535441525444415445050000000000000000000000080000003A45
      4E4444415445050000000000000000000000}
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
      030000000A00000002000000524E010000000004000000505245460100000000
      040000004E554D42010000000007000000444F43444154450100000000040000
      0053554D4D010000000008000000494E5F53544F524501000000000300000053
      52430100000000070000005352435F4D4F4C0100000000040000004445535401
      0000000008000000444553545F4D4F4C0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 64
    Top = 152
    object FloatField1: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'PREF'
      Required = True
      Size = 10
    end
    object StringField2: TStringField
      FieldName = 'NUMB'
      Required = True
      Size = 10
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DOCDATE'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'SUMM'
      Required = True
    end
    object FloatField3: TFloatField
      FieldName = 'IN_STORE'
    end
    object StringField3: TStringField
      FieldName = 'SRC'
    end
    object StringField4: TStringField
      FieldName = 'SRC_MOL'
    end
    object StringField5: TStringField
      FieldName = 'DEST'
    end
    object StringField6: TStringField
      FieldName = 'DEST_MOL'
    end
  end
  object Query12: TQuery
    SessionName = 'Session1_1'
    Left = 432
    Top = 72
  end
  object Session1: TSession
    AutoSessionName = True
    Left = 336
    Top = 72
  end
  object tempQ: TOracleQuery
    Session = OracleSession1
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 192
    Top = 232
  end
  object tempQ2: TOracleQuery
    Session = OracleSession1
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 248
    Top = 240
  end
  object tempQ3: TOracleQuery
    Session = OracleSession1
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 288
    Top = 256
  end
  object docsFull: TOracleDataSet
    SQL.Strings = (
      'select  *'
      ''
      'from v_transinvdept'
      ''
      'where ncrn = :catalog'
      'and ddocdate >= :startDate'
      'and ddocdate <= :endDate')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000080000003A434154414C4F47030000000000000000000000
      0A0000003A535441525444415445050000000000000000000000080000003A45
      4E4444415445050000000000000000000000}
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
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 32
    Top = 248
  end
  object Database1: TDatabase
    SessionName = 'Session1_1'
    Left = 384
    Top = 72
  end
  object specFull: TOracleDataSet
    SQL.Strings = (
      'select * '
      'from v_transinvdeptspecs'
      'where '
      'nPrn = :nprn')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000050000003A4E50524E030000000000000000000000}
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
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 88
    Top = 248
  end
  object OracleLogon1: TOracleLogon
    Session = OracleSession1
    Retries = 2
    Options = [ldDatabase, ldDatabaseList]
    AliasDropDownCount = 8
    HistorySize = 6
    HistoryWithPassword = False
    Left = 344
    Top = 16
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 336
    Top = 160
  end
  object Query1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 408
    Top = 160
  end
end
