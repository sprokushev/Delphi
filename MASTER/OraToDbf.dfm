object f_OraToDbf: Tf_OraToDbf
  Left = 358
  Top = 317
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1076#1072#1095#1072' '#1076#1072#1085#1085#1099#1093' '#1074' DBF'
  ClientHeight = 34
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar
    Left = 4
    Top = 10
    Width = 420
    Height = 16
    TabOrder = 0
  end
  object Button1: TButton
    Left = 432
    Top = 3
    Width = 89
    Height = 29
    Caption = #1055#1077#1088#1077#1076#1072#1090#1100'!'
    TabOrder = 1
    OnClick = Button1Click
  end
  object cnn_DbfToOra: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Mode=R' +
      'eadWrite;Extended Properties="DSN=pf;UID=;PWD=;SourceDB=u:\luk\d' +
      'bases;SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Ma' +
      'chine;Null=Yes;Deleted=Yes;"'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 63
    Top = 4
  end
  object t_DbfToOra: TOracleDataSet
    Left = 35
    Top = 4
  end
  object q_DbfToOraList: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM kls_oratodbf')
    Left = 91
    Top = 3
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 119
    Top = 3
  end
end
