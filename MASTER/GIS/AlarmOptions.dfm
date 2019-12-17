object AlarmOptionsDlg: TAlarmOptionsDlg
  Left = 341
  Top = 133
  Width = 409
  Height = 343
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1077#1076#1091#1087#1088#1077#1078#1076#1077#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CheckListBox1: TCheckListBox
    Left = 0
    Top = 41
    Width = 401
    Height = 169
    Align = alTop
    ItemHeight = 13
    TabOrder = 0
    OnClick = CheckListBox1Click
  end
  object Button1: TButton
    Left = 40
    Top = 288
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 288
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 41
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 399
      Height = 39
      Align = alClient
      Alignment = taCenter
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1086#1073#1099#1090#1080#1103', '#1082#1086#1090#1086#1088#1099#1077' '#1085#1091#1078#1076#1072#1102#1090#1089#1103' '#13#10#1074' '#1074#1072#1096#1077#1084' '#1074#1085#1080#1084#1072#1085#1080#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 210
    Width = 401
    Height = 71
    Align = alTop
    TabOrder = 4
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 399
      Height = 69
      Align = alClient
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
      WordWrap = True
    end
  end
  object Button3: TButton
    Left = 286
    Top = 288
    Width = 115
    Height = 25
    Caption = #1047#1072#1076#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077'...'
    TabOrder = 5
    OnClick = Button3Click
  end
end
