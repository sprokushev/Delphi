object f_main: Tf_main
  Left = 733
  Top = 334
  Width = 343
  Height = 102
  Caption = 'main'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TimerStart: TTimer
    Enabled = False
    OnTimer = TimerStartTimer
    Left = 16
    Top = 8
  end
  object EurekaLog1: TEurekaLog
    OnExceptionActionNotify = EurekaLog1ExceptionActionNotify
    Left = 80
    Top = 8
  end
  object AppEvents1: TAppEvents
    ShowMainForm = False
    Left = 144
    Top = 8
  end
  object ora_Session: TOracleSession
    Left = 200
    Top = 8
  end
end
