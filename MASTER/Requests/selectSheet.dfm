object f_selectSheet: Tf_selectSheet
  Left = 245
  Top = 313
  Width = 345
  Height = 131
  AutoSize = True
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1083#1080#1089#1090
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
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 189
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1083#1080#1089#1090' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1076#1072#1085#1085#1099#1093':'
  end
  object lbInfo: TLabel
    Left = 44
    Top = 43
    Width = 139
    Height = 17
    Alignment = taRightJustify
    Caption = #1052#1077#1089#1103#1094' ('#1087#1077#1088#1074#1086#1077' '#1095#1080#1089#1083#1086'): '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbList: TComboBox
    Left = 0
    Top = 16
    Width = 337
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbListChange
  end
  object btSelect: TBitBtn
    Left = 128
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btSelectClick
    Kind = bkOK
  end
  object edDatePlan: TDateTimePicker
    Left = 184
    Top = 40
    Width = 97
    Height = 21
    Date = 38085.482339548610000000
    Time = 38085.482339548610000000
    TabOrder = 2
  end
end
