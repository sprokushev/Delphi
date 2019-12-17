object FormMain: TFormMain
  Left = 264
  Top = 108
  Width = 593
  Height = 472
  Caption = 
    '"'#1047#1072#1082#1072#1095#1082#1072' '#1074' ORACLE" v2.6 Copyright @ 2001,2002 '#1042#1072#1085#1077#1077#1074' '#1045#1074#1075#1077#1085#1080#1081', '#1055#1088 +
    #1086#1082#1091#1096#1077#1074' '#1057#1077#1088#1075#1077#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 56
    Height = 13
    Caption = 'Label1        '
  end
  object lbTableName: TLabel
    Left = 16
    Top = 8
    Width = 63
    Height = 13
    Caption = 'lbTableName'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 48
    Width = 569
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 0
  end
  object slMain: TStatusBar
    Left = 0
    Top = 426
    Width = 585
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object cnn_ADO_SRC: TADOConnection
    LoginPrompt = False
    Provider = 'MSDAORA.1'
    Left = 32
    Top = 256
  end
  object cnn_DBFTOORA: TADOConnection
    LoginPrompt = False
    Provider = 'MSDAORA.1'
    Left = 32
    Top = 192
  end
  object cmm_ADO_Insert: TADOCommand
    Connection = cnn_ADO_DST
    Parameters = <>
    Left = 480
    Top = 256
  end
  object cmm_ADO_SRC_Select: TADOQuery
    Connection = cnn_ADO_SRC
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select count(*) as cnt1 from '#39'u:\luk\protokol\ident.dbf'#39)
    Left = 232
    Top = 256
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 32
    Top = 72
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = cnn_ADO_SP
    Parameters = <>
    Left = 128
    Top = 352
  end
  object cmm_DOA_SRC_Select: TOracleQuery
    Session = cnn_DOA_SRC
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 232
    Top = 304
  end
  object cnn_DOA_SRC: TOracleSession
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
    Left = 32
    Top = 304
  end
  object cmm_DOA_Insert: TOracleQuery
    Session = cnn_DOA_DST
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 480
    Top = 304
  end
  object cnn_ADO_SP: TADOConnection
    LoginPrompt = False
    Provider = 'MSDAORA'
    Left = 32
    Top = 352
  end
  object qDbfList: TADOQuery
    Connection = cnn_DBFTOORA
    EnableBCD = False
    Parameters = <>
    Left = 128
    Top = 192
  end
  object cnn_MgrSr: TADOConnection
    LoginPrompt = False
    Provider = 'MSDAORA.1'
    Left = 32
    Top = 136
  end
  object taLogTask: TADOTable
    Connection = cnn_MgrSr
    TableName = 'log_task'
    Left = 248
    Top = 64
  end
  object qLoadTask: TADOQuery
    Connection = cnn_MgrSr
    Parameters = <
      item
        Name = 'CurID'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      'SELECT * FROM loadtask WHERE id=:CurID')
    Left = 160
    Top = 64
  end
  object cnn_ADO_DST: TADOConnection
    LoginPrompt = False
    Provider = 'MSDAORA'
    Left = 128
    Top = 256
  end
  object cnn_DOA_DST: TOracleSession
    Cursor = crHourGlass
    DesignConnection = False
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'DESIGN'
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
    Left = 128
    Top = 304
  end
  object cmm_ADO_DST_Select: TADOQuery
    Connection = cnn_ADO_DST
    EnableBCD = False
    Parameters = <>
    Left = 360
    Top = 256
  end
  object cmm_DOA_DST_Select: TOracleQuery
    Session = cnn_DOA_DST
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 360
    Top = 304
  end
  object NMSMTP1: TNMSMTP
    Port = 25
    ReportLevel = 0
    EncodeType = uuMime
    ClearParams = False
    SubType = mtPlain
    Charset = 'windows-1251'
    Left = 344
    Top = 80
  end
  object dpl_DOA_Insert: TOracleDirectPathLoader
    Session = cnn_DOA_DST
    BufferSize = 65536
    LogMode = lmDefault
    Parallel = False
    Left = 480
    Top = 360
  end
  object cmm_DAI_Insert: TOracleQuery
    Session = cnn_DOA_DST
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 384
    Top = 360
  end
  object cmm_HLC_SRC_Select: THalcyonDataSet
    About = 'Halcyon Version 6.737 (08 Feb 01)'
    AutoFlush = False
    Exclusive = False
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 232
    Top = 192
  end
end
