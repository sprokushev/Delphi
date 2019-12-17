object f_azc_filter: Tf_azc_filter
  Left = 404
  Top = 224
  Width = 307
  Height = 288
  Caption = #1060#1080#1083#1100#1090#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  DesignSize = (
    299
    261)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 198
    Top = 232
    Width = 101
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Ok'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ODS_query: TOracleDataSet
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
    Left = 200
    Top = 72
  end
  object DS_query: TDataSource
    DataSet = ODS_query
    Left = 208
    Top = 120
  end
end
