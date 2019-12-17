object F_AddPlanIzm: TF_AddPlanIzm
  Left = 426
  Top = 228
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1086#1075#1086' '#1087#1083#1072#1085#1072
  ClientHeight = 156
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 56
    Top = 88
    Width = 96
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1080#1079#1084#1077#1085#1077#1085#1080#1103':'
  end
  object lb_PlanName: TLabel
    Left = 16
    Top = 8
    Width = 281
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lb_Mon: TLabel
    Left = 8
    Top = 32
    Width = 297
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 56
    Width = 38
    Height = 13
    Caption = #1057' '#1076#1072#1090#1099':'
  end
  object lb_BegDate: TLabel
    Left = 64
    Top = 56
    Width = 81
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 160
    Top = 56
    Width = 42
    Height = 13
    Caption = #1055#1086' '#1076#1072#1090#1091':'
  end
  object lb_EndDate: TLabel
    Left = 208
    Top = 56
    Width = 81
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object e_NumIzm: TMaskEdit
    Left = 160
    Top = 85
    Width = 29
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 0
    Text = '   '
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 120
    Width = 75
    Height = 25
    Caption = 'OK'
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
    Left = 168
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object ora_Package: TOraclePackage
    Session = f_main.ora_Session
    Debug = False
    PackageName = 'FOR_PLANPOST'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 256
    Top = 80
  end
end
