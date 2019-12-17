object f_OperReeFilter: Tf_OperReeFilter
  Left = 412
  Top = 293
  Width = 462
  Height = 267
  Caption = #1054#1090#1086#1073#1088#1072#1090#1100'...'
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
    Left = 11
    Top = 8
    Width = 130
    Height = 13
    Caption = #1058#1077#1082#1091#1097#1080#1077' '#1091#1089#1083#1086#1074#1080#1103' '#1086#1090#1073#1086#1088#1072':'
  end
  object bt_AddFilter: TButton
    Left = 8
    Top = 208
    Width = 169
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1091#1089#1083#1086#1074#1080#1103' '#1086#1090#1073#1086#1088#1072
    TabOrder = 0
    OnClick = bt_AddFilterClick
  end
  object bt_ClearFilter: TButton
    Left = 184
    Top = 208
    Width = 145
    Height = 25
    Caption = #1059#1073#1088#1072#1090#1100' '#1091#1089#1083#1086#1074#1080#1103' '#1086#1090#1073#1086#1088#1072
    TabOrder = 1
    OnClick = bt_ClearFilterClick
  end
  object bt_Exit: TButton
    Left = 336
    Top = 208
    Width = 105
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    ModalResult = 2
    TabOrder = 2
  end
  object m_FilterText: TMemo
    Left = 8
    Top = 24
    Width = 433
    Height = 73
    Lines.Strings = (
      '')
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 104
    Width = 441
    Height = 97
    Caption = ' '#1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '
    TabOrder = 4
    object Label7: TLabel
      Left = 8
      Top = 20
      Width = 54
      Height = 13
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088':'
    end
    object Label8: TLabel
      Left = 10
      Top = 44
      Width = 51
      Height = 13
      Caption = #1047#1085#1072#1095#1077#1085#1080#1077':'
    end
    object cb_FilterKey: TComboBox
      Left = 72
      Top = 20
      Width = 361
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        #8470' '#1094#1080#1089#1090#1077#1088#1085#1099
        #8470' '#1089#1074#1077#1076#1077#1085#1080#1103
        #8470' '#1085#1072#1088#1103#1076#1072
        #8470' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
        #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
        #8470' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072
        #8470' '#1046#1044' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
        #8470' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
        #8470' '#1043#1058#1044
        #8470' '#1089#1095#1077#1090#1072'-'#1092#1072#1082#1090#1091#1088#1099
        #1050#1086#1076' '#1058#1045#1061' '#1055#1044
        #1055#1083#1086#1084#1073#1072
        #1055#1083#1086#1084#1073#1072' '#1056#1086#1089#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072#1090#1072
        #8470' '#1076#1086#1075#1086#1074#1086#1088#1072)
    end
    object ed_FilterValue: TEdit
      Left = 72
      Top = 44
      Width = 361
      Height = 21
      TabOrder = 1
    end
    object cb_FullValue: TCheckBox
      Left = 72
      Top = 72
      Width = 361
      Height = 17
      Caption = #1048#1089#1082#1072#1090#1100' '#1089#1090#1088#1086#1082#1091' '#1094#1077#1083#1080#1082#1086#1084
      TabOrder = 2
    end
  end
end
