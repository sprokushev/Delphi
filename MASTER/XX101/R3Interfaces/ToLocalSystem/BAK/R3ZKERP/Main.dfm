object f_main: Tf_main
  Left = 370
  Top = 389
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1077#1088#1077#1082#1072#1095#1082#1072' R3 ZKERP >>> MASTER SYSTEM'
  ClientHeight = 142
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 395
    Height = 142
    Align = alClient
    TabOrder = 0
  end
  object ProcessButton: TButton
    Left = 224
    Top = 112
    Width = 163
    Height = 25
    Caption = #1059#1082#1072#1079#1072#1090#1100' '#1092#1072#1081#1083' '#1076#1083#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
    TabOrder = 1
    OnClick = ProcessButtonClick
  end
  object ora_Session: TOracleSession
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'BUH'
    Left = 8
    Top = 12
  end
  object OracleQuery1: TOracleQuery
    Session = ora_Session
    Left = 72
    Top = 12
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 8
    Top = 48
  end
  object OpenDialog: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' SH015|SH015*.csv'
    Left = 112
    Top = 8
  end
end
