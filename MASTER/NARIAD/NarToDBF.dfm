object F_NarToDbf: TF_NarToDbf
  Left = 334
  Top = 217
  Width = 323
  Height = 143
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
    Width = 297
    Height = 13
    Alignment = taCenter
    Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1085#1072' '#1084#1077#1089#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1085#1072#1088#1103#1076#1099' '#1080' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080' ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 34
    Height = 13
    Alignment = taCenter
    Caption = #1089' '#1076#1072#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Label3: TLabel
    Left = 160
    Top = 48
    Width = 37
    Height = 13
    Alignment = taCenter
    Caption = #1087#1086' '#1076#1072#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object edBegDate: TDateEdit
    Left = 56
    Top = 45
    Width = 89
    Height = 21
    DefaultToday = True
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 0
    Text = '02.05.2001'
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 80
    Width = 75
    Height = 25
    Caption = '&'#1044#1072
    Default = True
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 184
    Top = 80
    Width = 75
    Height = 25
    Caption = '&'#1053#1077#1090
    TabOrder = 2
    Kind = bkNo
  end
  object edEndDate: TDateEdit
    Left = 208
    Top = 45
    Width = 89
    Height = 21
    DefaultToday = True
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 3
    Text = '02.05.2001'
  end
end
