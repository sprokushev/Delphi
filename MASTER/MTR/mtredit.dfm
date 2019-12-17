object F_mtredit: TF_mtredit
  Left = 267
  Top = 110
  Width = 506
  Height = 278
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1090#1077#1083#1077#1092#1086#1085#1085#1086#1075#1086' '#1090#1088#1072#1092#1080#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 48
    Width = 83
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1092#1072#1081#1083':'
  end
  object Label2: TLabel
    Left = 16
    Top = 16
    Width = 417
    Height = 20
    Caption = '1. '#1055#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1092#1072#1081#1083#1099' '#1082' '#1079#1072#1075#1088#1091#1079#1082#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 90
    Height = 13
    Caption = #1060#1072#1081#1083' '#1082' '#1079#1072#1075#1088#1091#1079#1082#1077':'
  end
  object Label4: TLabel
    Left = 16
    Top = 176
    Width = 172
    Height = 20
    Caption = '2. '#1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object file_src: TFilenameEdit
    Left = 130
    Top = 48
    Width = 349
    Height = 21
    Filter = 
      #1060#1072#1081#1083#1099' '#1087#1077#1088#1077#1075#1086#1074#1086#1088#1086#1074'  (*.rar,*.xls)|*.xls;*.rar|'#1042#1089#1077' '#1092#1072#1081#1083#1099'  (*.*)|*.' +
      '*'
    InitialDir = 'c:\mtr\'#1047#1072#1075#1088#1091#1079#1082#1072
    NumGlyphs = 1
    TabOrder = 0
    OnChange = file_srcChange
  end
  object rg_type: TRadioGroup
    Left = 16
    Top = 104
    Width = 473
    Height = 57
    Caption = #1058#1080#1087' '#1092#1072#1081#1083#1072
    Columns = 3
    Ctl3D = True
    Items.Strings = (
      #1050#1086#1084#1080' '#1057#1047#1058
      #1050#1086#1084#1080' '#1056#1058#1050
      #1040#1088#1093#1072#1085#1075#1077#1083#1100#1089#1082
      #1057#1072#1083#1077#1093#1072#1088#1076' '#1057#1047#1058
      #1057#1072#1083#1077#1093#1072#1088#1076' '#1056#1058#1050)
    ParentCtl3D = False
    TabOrder = 1
    OnClick = rg_typeClick
  end
  object file_dst: TEdit
    Left = 128
    Top = 80
    Width = 345
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = 'c:\mtr\'#1047#1072#1075#1088#1091#1079#1082#1072'\toload\'
  end
  object btLoad: TButton
    Left = 152
    Top = 208
    Width = 193
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 3
  end
end
