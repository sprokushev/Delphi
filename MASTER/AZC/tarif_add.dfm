inherited f_MDIForm1: Tf_MDIForm1
  Left = 207
  Top = 194
  Width = 736
  Height = 484
  Caption = 'f_MDIForm1'
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 56
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 176
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
  end
  object Button3: TButton
    Left = 528
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 2
  end
  object OQ_: TOracleQuery
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 120
    Top = 32
  end
  object DS_postav: TDataSource
    DataSet = ODS_postav
    Left = 104
    Top = 104
  end
  object ODS_postav: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM agnlist@ORACLE')
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
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = f_main.ora_Session
    DesignActivation = False
    Active = False
    Left = 104
    Top = 72
  end
end
