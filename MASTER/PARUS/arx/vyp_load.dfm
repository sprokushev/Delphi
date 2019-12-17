object frm1cLoad: Tfrm1cLoad
  Left = 1350
  Top = 374
  Width = 916
  Height = 512
  Caption = #1047#1072#1082#1072#1095#1082#1080
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
  object fd: TFilenameEdit
    Left = 288
    Top = 40
    Width = 201
    Height = 21
    Filter = 'txt|*.txt'
    NumGlyphs = 1
    TabOrder = 0
  end
  object re: TRichEdit
    Left = 40
    Top = 104
    Width = 793
    Height = 121
    Lines.Strings = (
      're')
    ReadOnly = True
    TabOrder = 1
    WordWrap = False
  end
  object BitBtn1: TBitBtn
    Left = 544
    Top = 16
    Width = 75
    Height = 25
    Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 40
    Top = 240
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1080#1089#1082#1072
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object oraSesMain: TOracleSession
    Cursor = crHourGlass
    DesignConnection = False
    LogonUsername = 'pvz'
    LogonPassword = '123456'
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
    Left = 16
    Top = 8
  end
  object oraQ: TOracleQuery
    SQL.Strings = (
      'INSERT INTO RUI_VYPISKA ('#10
      
        '   DATE_VYP, NUM_VYP, ACC_VYP, OP_VYP, SUM_VYP, REM_VYP, SC1, SC' +
        '2, SC3) '#10
      'VALUES (:DATE_VYP, :NUM_VYP, '
      '   :ACC_VYP, :OP_VYP, :SUM_VYP, '
      '   :REM_VYP, :SC1, :SC2, :SC3)')
    Session = oraSesMain
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000009000000090000003A444154455F5659500C00000000000000000000
      00080000003A4E554D5F565950050000000000000000000000080000003A4143
      435F565950050000000000000000000000070000003A4F505F56595003000000
      0000000000000000080000003A53554D5F565950040000000000000000000000
      080000003A52454D5F565950050000000000000000000000040000003A534331
      050000000000000000000000040000003A534332050000000000000000000000
      040000003A534333050000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 64
    Top = 8
  end
end
