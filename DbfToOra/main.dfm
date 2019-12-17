object FormMain: TFormMain
  Left = 561
  Top = 607
  Width = 461
  Height = 87
  Caption = '"'#1047#1072#1082#1072#1095#1082#1072' '#1074' ORACLE" v2.7 @ 2001-2003 '#1042#1072#1085#1077#1077#1074' '#1045'.'#1042'.,'#1055#1088#1086#1082#1091#1096#1077#1074' '#1057'.'#1042'.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 56
    Height = 13
    Caption = 'Label1        '
  end
  object lbTableName: TLabel
    Left = 8
    Top = 0
    Width = 63
    Height = 13
    Caption = 'lbTableName'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 32
    Width = 441
    Height = 16
    TabOrder = 0
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
    Left = 232
    Top = 304
  end
  object cnn_DOA_SRC: TOracleSession
    Left = 32
    Top = 304
  end
  object cmm_DOA_Insert: TOracleQuery
    Session = cnn_DOA_DST
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
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'DESIGN'
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
    Left = 360
    Top = 304
  end
  object dpl_DOA_Insert: TOracleDirectPathLoader
    Session = cnn_DOA_DST
    Left = 480
    Top = 360
  end
  object cmm_DAI_Insert: TOracleQuery
    Session = cnn_DOA_DST
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
  object IdSMTP: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 112
    Top = 136
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CharSet = 'windows-1251'
    CCList = <>
    ContentType = 'text/plain'
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 184
    Top = 136
  end
end
