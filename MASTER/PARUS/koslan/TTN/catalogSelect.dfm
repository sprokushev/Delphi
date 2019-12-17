object f_filter: Tf_filter
  Left = 369
  Top = 235
  Width = 325
  Height = 147
  AutoSize = True
  Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 317
    Height = 16
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1072#1090#1072#1083#1086#1075':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 0
    Top = 40
    Width = 117
    Height = 16
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1072#1090#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 6
    Top = 65
    Width = 9
    Height = 13
    Caption = #1089':'
  end
  object Label4: TLabel
    Left = 168
    Top = 65
    Width = 15
    Height = 13
    Caption = #1087#1086':'
  end
  object ComboBox1: TComboBox
    Left = 0
    Top = 16
    Width = 317
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnDropDown = ComboBox1DropDown
  end
  object BitBtn1: TBitBtn
    Left = 88
    Top = 95
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 95
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object DateTimePicker1: TDateTimePicker
    Left = 17
    Top = 61
    Width = 129
    Height = 21
    Date = 37916.441698784720000000
    Time = 37916.441698784720000000
    TabOrder = 3
    OnChange = DateTimePicker1Change
  end
  object DateTimePicker2: TDateTimePicker
    Left = 185
    Top = 61
    Width = 129
    Height = 21
    Date = 37916.441698784720000000
    Time = 37916.441698784720000000
    TabOrder = 4
    OnChange = DateTimePicker2Change
  end
  object CheckBox1: TCheckBox
    Left = 144
    Top = 40
    Width = 169
    Height = 17
    Caption = #1042#1082#1083#1102#1095#1072#1103' '#1087#1086#1076#1082#1072#1090#1072#1083#1086#1075#1080
    TabOrder = 5
  end
end
