object F_AskPeriod: TF_AskPeriod
  Left = 383
  Top = 248
  Width = 374
  Height = 118
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1077#1088#1080#1086#1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 38
    Height = 13
    Caption = #1057' '#1076#1072#1090#1099':'
  end
  object Label2: TLabel
    Left = 184
    Top = 8
    Width = 40
    Height = 13
    Caption = #1087#1086' '#1076#1072#1090#1091':'
  end
  object e_FromDate: TDateEdit
    Left = 56
    Top = 5
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object e_ToDate: TDateEdit
    Left = 232
    Top = 5
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object bt_Ok: TBitBtn
    Left = 72
    Top = 48
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = bt_OkClick
    Kind = bkOK
  end
  object bt_Cancel: TBitBtn
    Left = 192
    Top = 48
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 3
    OnClick = bt_CancelClick
    Kind = bkCancel
  end
end
