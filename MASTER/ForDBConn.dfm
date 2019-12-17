object DBConn: TDBConn
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'DBConn'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cnn_DOA: TOracleSession
    Cursor = crHourGlass
    DesignConnection = False
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
    Left = 88
    Top = 16
  end
  object cnn_ADO: TADOConnection
    LoginPrompt = False
    Provider = 'MSDAORA.1'
    Left = 24
    Top = 16
  end
  object q_DOA: TOracleQuery
    Session = cnn_DOA
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 144
    Top = 16
  end
  object q_ADO: TADOQuery
    Connection = cnn_ADO
    Parameters = <>
    Left = 208
    Top = 16
  end
end
