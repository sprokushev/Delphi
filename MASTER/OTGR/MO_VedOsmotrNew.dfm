object f_VedOsmotrNew: Tf_VedOsmotrNew
  Left = 532
  Top = 295
  Width = 431
  Height = 232
  Caption = #1053#1086#1074#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 70
    Height = 13
    Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#8470
  end
  object Label2: TLabel
    Left = 208
    Top = 16
    Width = 11
    Height = 13
    Caption = #1086#1090
  end
  object Label3: TLabel
    Left = 16
    Top = 39
    Width = 86
    Height = 13
    Caption = #1042#1088#1077#1084#1103' '#1087#1086#1076#1093#1086#1076#1072' '#1089
  end
  object Label4: TLabel
    Left = 208
    Top = 39
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object Label5: TLabel
    Left = 16
    Top = 64
    Width = 134
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1090#1086#1088' '#1089#1084#1077#1085#1099' ('#1060#1048#1054') 1:'
  end
  object Label6: TLabel
    Left = 16
    Top = 88
    Width = 134
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1090#1086#1088' '#1089#1084#1077#1085#1099' ('#1060#1048#1054') 2:'
  end
  object Label7: TLabel
    Left = 16
    Top = 112
    Width = 134
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1090#1086#1088' '#1089#1084#1077#1085#1099' ('#1060#1048#1054') 3:'
  end
  object Label8: TLabel
    Left = 101
    Top = 136
    Width = 47
    Height = 13
    Caption = #1055#1086#1076#1087#1080#1089#1100':'
  end
  object btSetNum: TSpeedButton
    Left = 179
    Top = 11
    Width = 23
    Height = 22
    Hint = #1055#1086#1076#1086#1073#1088#1072#1090#1100' '#1085#1086#1084#1077#1088
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F33F333F3337F330FF0FFF0FFF
      F03337F37F337F3337F330FF0FFF0FFFF03337F37FFF7FFF37F330F00000000F
      F03337F77777777337F330FFF0FFF0FFF03337F337F337F337F330FFF0FFF0FF
      F03337F337FFF7FFF7F330FF00000000F03337F37777777737F330FFFF0FFF0F
      F03337F3337F337F37F330FFFF0FFF0FF03337F33373337337F330FFFFFFFFFF
      F03337F33333333FF7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = False
    OnClick = btSetNumClick
  end
  object btOk: TBitBtn
    Left = 96
    Top = 168
    Width = 97
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 9
    OnClick = btOkClick
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
  object btCancel: TBitBtn
    Left = 232
    Top = 168
    Width = 97
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 10
    Kind = bkCancel
  end
  object edNum: TEdit
    Left = 112
    Top = 11
    Width = 65
    Height = 21
    TabOrder = 0
    OnChange = edNumChange
  end
  object edDat: TDateTimePicker
    Left = 231
    Top = 10
    Width = 90
    Height = 21
    Date = 37839.812709131950000000
    Time = 37839.812709131950000000
    TabOrder = 1
    OnCloseUp = CheckTime
    OnChange = CheckTime
    OnExit = CheckTime
  end
  object FromTime: TDateTimePicker
    Left = 111
    Top = 33
    Width = 90
    Height = 21
    Date = 37839.812500000000000000
    Time = 37839.812500000000000000
    Kind = dtkTime
    TabOrder = 2
    OnCloseUp = CheckTime
    OnChange = CheckTime
    OnExit = CheckTime
  end
  object ToTime: TDateTimePicker
    Left = 231
    Top = 33
    Width = 90
    Height = 21
    Date = 37839.812500000000000000
    Time = 37839.812500000000000000
    Kind = dtkTime
    TabOrder = 3
    OnCloseUp = CheckTime
    OnChange = CheckTime
    OnExit = CheckTime
  end
  object ToDate: TDateTimePicker
    Left = 327
    Top = 33
    Width = 90
    Height = 21
    Date = 37839.812709131950000000
    Time = 37839.812709131950000000
    TabOrder = 4
    OnCloseUp = CheckTime
    OnChange = CheckTime
    OnExit = CheckTime
  end
  object edFIO1: TComboEdit
    Left = 160
    Top = 60
    Width = 249
    Height = 21
    GlyphKind = gkEllipsis
    ButtonWidth = 16
    NumGlyphs = 1
    TabOrder = 5
    OnButtonClick = edFIO1ButtonClick
  end
  object edFIO2: TComboEdit
    Left = 162
    Top = 84
    Width = 247
    Height = 21
    GlyphKind = gkEllipsis
    ButtonWidth = 16
    NumGlyphs = 1
    TabOrder = 6
    OnButtonClick = edFIO2ButtonClick
  end
  object edFIO3: TComboEdit
    Left = 162
    Top = 108
    Width = 247
    Height = 21
    GlyphKind = gkEllipsis
    ButtonWidth = 16
    NumGlyphs = 1
    TabOrder = 7
    OnButtonClick = edFIO3ButtonClick
  end
  object edSIGN1: TComboEdit
    Left = 162
    Top = 132
    Width = 247
    Height = 21
    GlyphKind = gkEllipsis
    ButtonWidth = 16
    NumGlyphs = 1
    TabOrder = 8
    OnButtonClick = edSIGN1ButtonClick
  end
  object pkgFOR_DOCUMENTS: TOraclePackage
    PackageName = 'FOR_DOCUMENTS'
    Left = 216
    Top = 80
  end
end
