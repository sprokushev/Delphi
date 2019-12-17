object Form1: TForm1
  Left = 400
  Top = 178
  Width = 292
  Height = 94
  Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Animate1: TAnimate
    Left = 0
    Top = 0
    Width = 272
    Height = 60
    CommonAVI = aviCopyFiles
    StopFrame = 34
    Visible = False
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 128
    Top = 24
  end
end
