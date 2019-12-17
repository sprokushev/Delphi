object f_AzsQuery: Tf_AzsQuery
  Left = 305
  Top = 226
  AlphaBlend = True
  AlphaBlendValue = 150
  BorderStyle = bsNone
  Caption = 'f_AzsQuery'
  ClientHeight = 53
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 160
    Top = 3
    Width = 65
    Height = 13
    Caption = #1054#1087#1088#1086#1089' '#1040#1047#1057'...'
  end
  object ProgressBar1: TProgressBar
    Left = 86
    Top = 20
    Width = 243
    Height = 29
    Smooth = True
    TabOrder = 0
  end
  object Animate1: TAnimate
    Left = 0
    Top = 0
    Width = 80
    Height = 50
    CommonAVI = aviFindFolder
    StopFrame = 29
  end
end
