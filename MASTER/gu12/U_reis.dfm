object f_reis: Tf_reis
  Left = 187
  Top = 123
  Width = 800
  Height = 600
  Caption = #1043#1059'-12   '#1056#1077#1081#1089#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000055555555555555555500000000000
    0000000000000000000000000000000088800778888887878800778800000000
    00000000000000000000000000000000099999990FFFFF099999990000000000
    0911111107777701111111000000000000000000000000000000000000000000
    0D5D5D5D5555555555555500000000000D000000000000000000050000000050
    00DDD5D5D5555555555550005000000000DD0000000000000005500000000000
    00D08086660F086660F050000000000000D08068660F068660F0500000000000
    00D08F0000FFF0000FF0500000000000000D08FFFFFFFFFFFF05000000000000
    000D08888888888888050000000000000000D000000000000050000000000000
    0000DDDDDDDDDDDDDD5000000000000000000000000000000000000000000000
    0000000000000000000000000000FFFFFFFFFF1FFF8FFF8FFFC7FFCFFFE7FF8D
    FFC7FF1BFF8DFE37FF1BFC7FFE3FF83FFC1FF83FFC1FF83FFC1FF800001FF800
    001FE0000007E0000007E0000007F000001FF000001FF000001FF000001FC000
    00078000000380000003F800003FF800003FD800003FEC00007FFC000077FE00
    00EFEE0000FFF70001FFFFFFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000007788778877000000000000000000000099907709990000001
    1100001110000000000000000000070D7887F7887070000DD77FFF77F0000000
    DFFFFFFF00000000DDDDDDD000000000000000000000F3F30000F9790000F1B1
    0000E3420000E3C50000C00300008001000080010000C0030000C00300008001
    00000000000000000000E0030000A0050000D00B0000}
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Grid_reis: TDBGridEh
    Left = 0
    Top = 97
    Width = 792
    Height = 160
    Align = alTop
    DataSource = ds_reis
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = Grid_reisGetCellParams
    OnKeyPress = Grid_reisKeyPress
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PDATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080
      end
      item
        EditButtons = <>
        FieldName = 'STANNAZN'
        Footers = <>
        Title.Caption = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      end
      item
        EditButtons = <>
        FieldName = 'STATES_NAME'
        Footers = <>
        Title.Caption = #1057#1090#1088#1072#1085#1072' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'KOL_VAG'
        Footers = <>
        Title.Caption = #1050#1086#1083'-'#1074#1086' '#1074#1072#1075#1086#1085#1086#1074
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'VES'
        Footers = <>
        Title.Caption = #1042#1077#1089
      end
      item
        EditButtons = <>
        FieldName = 'PRINVAG_NAME'
        Footers = <>
        MaxWidth = 30
        MinWidth = 30
        Title.Caption = #1055#1088#1080#1085'. '#1074#1072#1075#1086#1085#1072
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'PLAT_NAME'
        Footers = <>
        Title.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      end
      item
        EditButtons = <>
        FieldName = 'SOBSTVVAG_NAME'
        Footers = <>
        Title.Caption = #1057#1086#1073#1089#1090#1074'. '#1074#1072#1075#1086#1085#1072
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'PREDPR_NAME'
        Footers = <>
        Title.Caption = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
        Width = 301
      end
      item
        EditButtons = <>
        FieldName = 'STANPER'
        Footers = <>
        Title.Caption = #1057#1090#1072#1085#1094#1080#1103' '#1087#1077#1088#1077#1074#1072#1083#1082#1080
      end
      item
        EditButtons = <>
        FieldName = 'VIDOTPR_NAME'
        Footers = <>
        Title.Caption = #1042#1080#1076' '#1086#1090#1087#1088#1072#1074#1082#1080
        Width = 185
      end
      item
        EditButtons = <>
        FieldName = 'DATE_LETTER'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1080#1089#1093'. '#1087#1080#1089#1100#1084#1072
        Width = 96
      end
      item
        EditButtons = <>
        FieldName = 'NOM_LETTER'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1080#1089#1093'. '#1087#1080#1089#1100#1084#1072
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'DATE_VHOD'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1074#1093'. '#1087#1080#1089#1100#1084#1072' '
        Width = 96
      end
      item
        EditButtons = <>
        FieldName = 'NOM_VHOD'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1074#1093'. '#1087#1080#1089#1100#1084#1072
        Width = 103
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 29
    Align = alTop
    TabOrder = 0
    object TBToolbar3: TTBToolbar
      Left = 4
      Top = 3
      Width = 468
      Height = 22
      Caption = 'TBToolbar1'
      DockPos = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object TBItem_addreis: TTBItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 0
        Images = f_main.img_Common
        OnClick = TBItem_addreisClick
      end
      object TBItem_writereis: TTBItem
        Caption = #1047#1072#1087#1080#1089#1072#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 13
        Images = f_main.img_Common
        OnClick = TBItem_writereisClick
      end
      object TBItem_delreis: TTBItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 5
        Images = f_main.img_Common
        OnClick = TBItem_delreisClick
      end
      object TBItem5: TTBItem
        Caption = #1047#1072#1103#1074#1082#1080'    '
        DisplayMode = nbdmImageAndText
        ImageIndex = 7
        Images = f_main.img_Common
        OnClick = TBItem5Click
      end
      object TBItem_otkaz: TTBItem
        Caption = #1054#1090#1082#1072#1079
        DisplayMode = nbdmImageAndText
        ImageIndex = 14
        Images = f_main.img_Common
        OnClick = TBItem_otkazClick
      end
      object TBItem_backotkaz: TTBItem
        Caption = #1042#1077#1088#1085#1091#1090#1100' '#1086#1090#1082#1072#1079
        DisplayMode = nbdmImageAndText
        ImageIndex = 15
        Images = f_main.img_Common
        OnClick = TBItem_backotkazClick
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 29
    Width = 792
    Height = 68
    Align = alTop
    Caption = #1047#1072#1103#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label6: TLabel
      Left = 543
      Top = 32
      Width = 59
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1077#1075'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 576
      Top = 16
      Width = 28
      Height = 13
      Caption = #1043#1088#1091#1079
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object L_nomz: TLabel
      Left = 24
      Top = 16
      Width = 86
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 536
      Top = 48
      Width = 66
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089#1086#1075#1083'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 48
      Width = 78
      Height = 13
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 263
      Top = 32
      Width = 85
      Height = 13
      Caption = #1057#1090#1072#1085#1094#1080#1103' '#1086#1090#1087#1088'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object E_regdate: TLabel
      Left = 608
      Top = 32
      Width = 59
      Height = 13
      Caption = 'E_regdate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object E_sogldate: TLabel
      Left = 608
      Top = 48
      Width = 64
      Height = 13
      Caption = 'E_sogldate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object E_gruz: TLabel
      Left = 608
      Top = 16
      Width = 40
      Height = 13
      Caption = 'E_gruz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object E_nomz: TLabel
      Left = 120
      Top = 16
      Width = 55
      Height = 16
      Caption = 'E_nomz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object E_otprav: TLabel
      Left = 120
      Top = 48
      Width = 52
      Height = 13
      Caption = 'E_otprav'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object E_stanotpr: TLabel
      Left = 352
      Top = 32
      Width = 62
      Height = 13
      Caption = 'E_stanotpr'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 240
      Top = 16
      Width = 106
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076' '#1079#1072#1103#1074#1082#1080'  '#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object E_bdate: TLabel
      Left = 352
      Top = 16
      Width = 48
      Height = 13
      Caption = 'E_bdate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 424
      Top = 16
      Width = 15
      Height = 13
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object E_edate: TLabel
      Left = 448
      Top = 16
      Width = 48
      Height = 13
      Caption = 'E_edate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 23
      Top = 32
      Width = 87
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1088#1077#1081#1089#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object kol_reis: TLabel
      Left = 120
      Top = 32
      Width = 45
      Height = 13
      Caption = 'kol_reis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 257
    Width = 370
    Height = 316
    Align = alLeft
    Caption = #1056#1077#1081#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label8: TLabel
      Left = 40
      Top = 16
      Width = 45
      Height = 13
      Caption = #1050#1086#1083'. '#1074#1072#1075'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 224
      Top = 16
      Width = 19
      Height = 13
      Caption = #1042#1077#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 21
      Top = 40
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 27
      Top = 64
      Width = 58
      Height = 13
      Caption = #1044#1072#1090#1072' '#1080#1089#1093' '#1087'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 192
      Top = 40
      Width = 54
      Height = 13
      Caption = #1053#1086#1084'.'#1080#1089#1093'.'#1087'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 33
      Top = 88
      Width = 52
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1093' '#1087'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 200
      Top = 64
      Width = 48
      Height = 13
      Caption = #1053#1086#1084'.'#1074#1093'.'#1087'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 13
      Top = 112
      Width = 72
      Height = 13
      Caption = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 19
      Top = 136
      Width = 66
      Height = 13
      Caption = #1057#1090#1088#1072#1085#1072' '#1085#1072#1079#1085'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 13
      Top = 256
      Width = 72
      Height = 13
      Caption = #1057#1090#1072#1085'.'#1087#1077#1088#1077#1074#1072#1083'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 229
      Top = 88
      Width = 49
      Height = 13
      Caption = #1055#1088#1080#1085'.'#1074#1072#1075'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 11
      Top = 160
      Width = 74
      Height = 13
      Caption = #1057#1086#1073#1089#1090#1074'.'#1074#1072#1075#1086#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 16
      Top = 184
      Width = 69
      Height = 13
      Caption = #1042#1080#1076' '#1086#1090#1087#1088#1072#1074#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 35
      Top = 208
      Width = 50
      Height = 13
      Caption = #1043#1088#1091#1079#1086#1087#1086#1083'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 21
      Top = 232
      Width = 64
      Height = 13
      Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object e_kolvag: TEdit
      Left = 88
      Top = 16
      Width = 98
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object ch_iscor: TCheckBox
      Left = 273
      Top = 184
      Width = 79
      Height = 17
      Caption = #1050#1086#1088#1088'.'#1088#1077#1081#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object e_ves: TEdit
      Left = 248
      Top = 16
      Width = 98
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object c_pdate: TDBDateTimeEditEh
      Left = 88
      Top = 40
      Width = 99
      Height = 21
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 2
      Visible = True
    end
    object c_date_ish: TDBDateTimeEditEh
      Left = 88
      Top = 64
      Width = 99
      Height = 21
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 4
      Visible = True
    end
    object c_date_vh: TDBDateTimeEditEh
      Left = 88
      Top = 88
      Width = 99
      Height = 21
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 6
      Visible = True
    end
    object e_nom_letter: TEdit
      Left = 248
      Top = 40
      Width = 99
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object e_nom_vh: TEdit
      Left = 248
      Top = 64
      Width = 99
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object c_stannazn: TRxDBLookupCombo
      Left = 88
      Top = 112
      Width = 180
      Height = 21
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'STAN_NAME'
      LookupSource = ds_stannazn
      ParentFont = False
      TabOrder = 8
      OnKeyDown = c_stannaznKeyDown
    end
    object c_stanper: TRxDBLookupCombo
      Left = 88
      Top = 256
      Width = 163
      Height = 21
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'STAN_NAME'
      LookupSource = ds_stanper
      ParentFont = False
      TabOrder = 14
      OnKeyDown = c_stanperKeyDown
    end
    object c_prinvag: TRxDBLookupCombo
      Left = 277
      Top = 88
      Width = 71
      Height = 21
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = ds_prinvag
      ParentFont = False
      TabOrder = 7
      OnKeyDown = c_prinvagKeyDown
    end
    object c_sobstvvag: TRxDBLookupCombo
      Left = 88
      Top = 160
      Width = 180
      Height = 21
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = ds_sobstvvag
      ParentFont = False
      TabOrder = 10
      OnKeyDown = c_sobstvvagKeyDown
    end
    object c_vidotpr: TRxDBLookupCombo
      Left = 88
      Top = 184
      Width = 179
      Height = 21
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'NAME'
      LookupSource = ds_vidotpr
      ParentFont = False
      TabOrder = 11
      OnKeyDown = c_vidotprKeyDown
    end
    object c_gruzpol: TRxDBLookupCombo
      Left = 88
      Top = 208
      Width = 263
      Height = 21
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'SHORT_NAME'
      LookupSource = ds_gruzpol
      ParentFont = False
      TabOrder = 12
      OnKeyDown = c_gruzpolKeyDown
    end
    object c_plat: TRxDBLookupCombo
      Left = 88
      Top = 232
      Width = 264
      Height = 21
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'PLAT_ID'
      LookupDisplay = 'PLAT_NAME'
      LookupSource = ds_plat
      ParentFont = False
      TabOrder = 13
      OnKeyDown = c_platKeyDown
    end
    object c_states: TRxDBLookupCombo
      Left = 88
      Top = 136
      Width = 180
      Height = 21
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'STATE_NAME'
      LookupSource = ds_states
      ParentFont = False
      TabOrder = 9
      OnKeyDown = c_statesKeyDown
    end
  end
  object GroupBox3: TGroupBox
    Left = 370
    Top = 257
    Width = 422
    Height = 316
    Align = alRight
    Caption = #1056#1072#1079#1073#1080#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object attention: TLabel
      Left = 10
      Top = 275
      Width = 16
      Height = 13
      Caption = 'att'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grid_razb: TDBGridEh
      Left = 8
      Top = 49
      Width = 401
      Height = 216
      AllowedOperations = []
      DataSource = ds_razb
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clBlack
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      ParentFont = False
      SumList.Active = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = grid_razbDblClick
      OnGetCellParams = grid_razbGetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DATE_R'
          Footer.Value = #1057#1059#1052#1052#1040
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Width = 62
        end
        item
          EditButtons = <>
          FieldName = 'KOL_VAG'
          Footer.FieldName = 'KOL_VAG'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'.'#1074#1072#1075'.'
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'VES'
          Footer.FieldName = 'VES'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1042#1077#1089
          Width = 48
        end
        item
          EditButtons = <>
          FieldName = 'NAME_NPR'
          Footers = <>
          Title.Caption = #1055#1088#1086#1076#1091#1082#1090
          Width = 114
        end
        item
          EditButtons = <>
          FieldName = 'ZAKAZ_HIST_ID_TXT'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1047#1072#1082#1072#1079' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1103
          Width = 105
        end>
    end
    object Panel1: TPanel
      Left = 9
      Top = 22
      Width = 400
      Height = 26
      TabOrder = 0
      object TBToolbar1: TTBToolbar
        Left = 3
        Top = 2
        Width = 387
        Height = 22
        Caption = 'TBToolbar1'
        Images = f_main.img_Common
        TabOrder = 0
        object TBItem_addrazb: TTBItem
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          DisplayMode = nbdmImageAndText
          ImageIndex = 0
          OnClick = TBItem_addrazbClick
        end
        object TBItem_modrazb: TTBItem
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          DisplayMode = nbdmImageAndText
          ImageIndex = 8
          Images = f_main.img_Common
          OnClick = TBItem_modrazbClick
        end
        object TBItem_delrazb: TTBItem
          Caption = #1059#1076#1072#1083#1080#1090#1100
          DisplayMode = nbdmImageAndText
          ImageIndex = 5
          OnClick = TBItem_delrazbClick
        end
        object TBItem_mark: TTBItem
          Caption = #1054#1090#1084'. '#1074#1089#1077
          DisplayMode = nbdmImageAndText
          ImageIndex = 38
          Images = f_main.img_Common
          OnClick = TBItem_markClick
        end
        object TBItem_unmark: TTBItem
          Caption = #1057#1085#1103#1090#1100' '#1086#1090#1084'.'
          DisplayMode = nbdmImageAndText
          ImageIndex = 31
          Images = f_main.img_Common
          OnClick = TBItem_unmarkClick
        end
      end
    end
  end
  object q_reis: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'R.ROWID,'
      'R.ID,'
      'R.ID_A,'
      'R.PDATE,'
      'R.SOBSTVVAG_ID,'
      'SV.NAME AS SOBSTVVAG_NAME,'
      'R.STAN_ID,'
      'SN.STAN_NAME AS STANNAZN,'
      'R.STATES_ID,'
      '(CASE'
      #9'   WHEN R.STATES_ID=0 THEN '#39' '#39
      #9'   ELSE ST.STATE_NAME'
      'END) AS STATES_NAME,'
      'R.STAN_PER_ID,'
      'SP.STAN_NAME AS STANPER,'
      'R.GRUZPOL_ID,'
      'GP.PREDPR_NAME,'
      'R.VIDOTPR_ID,'
      'VO.NAME AS VIDOTPR_NAME,'
      'R.KOL_VAG,'
      'R.VES,'
      'R.MRK,'
      'R.PLAT_ID,'
      'R.FOX_KOD,'
      'R.ISCOR,'
      'R.DATE_LETTER,'
      'R.NOM_LETTER,'
      'R.DATE_VHOD,'
      'R.NOM_VHOD,'
      'PL.PLAT_NAME,'
      'R.PRINVAG_ID,'
      'R.OLD_ID,'
      'PV.ABBR AS PRINVAG_NAME'
      'FROM'
      'GU12_B R,'
      'KLS_GD_SOBSTVVAG SV,'
      'V_GU12_STAN_NAZN SN,'
      'V_GU12_GRUZ_POL GP,'
      'V_GU12_STAN_PER SP,'
      'KLS_GD_VID_OTPR VO,'
      'V_GU12_PLAT PL,'
      'KLS_GD_PRINVAG PV,'
      'KLS_STATES ST'
      'WHERE'
      'R.ID_A=:IDZAYAV'
      'AND (CASE'
      
        '        WHEN FOR_TEMP.GET_AS_NUM('#39'USER_UNP'#39','#39'MASTER'#39','#39'GU12'#39')=1 T' +
        'HEN 2641'
      '        ELSE R.PLAT_ID'
      '     END)=2641'
      'AND R.SOBSTVVAG_ID=SV.ID(+)'
      'AND R.STAN_ID=SN.ID(+)'
      'AND R.GRUZPOL_ID=GP.ID(+)'
      'AND VIDOTPR_ID=VO.ID(+)'
      'AND R.STAN_PER_ID=SP.ID(+)'
      'AND R.PLAT_ID=PL.PLAT_ID(+)'
      'AND R.PRINVAG_ID=PV.ID(+)'
      'AND R.STATES_ID=ST.ID(+)'
      'ORDER BY ID'
      '')
    Variables.Data = {
      0300000001000000080000003A49445A41594156030000000000000000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_GU12_B'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000001D00000005000000504441544501000000000C000000534F42535456
      5641475F49440100000000070000005354414E5F494401000000000A00000047
      52555A504F4C5F49440100000000070000004B4F4C5F56414701000000000300
      000056455301000000000A0000005649444F5450525F49440100000000030000
      004D524B01000000000400000049445F41010000000002000000494401000000
      000B0000005354414E5F5045525F4944010000000007000000504C41545F4944
      010000000007000000464F585F4B4F440100000000050000004953434F520100
      0000000B000000444154455F4C455454455201000000000A0000004E4F4D5F4C
      4554544552010000000009000000444154455F56484F44010000000008000000
      4E4F4D5F56484F4401000000000A0000005052494E5641475F49440100000000
      060000004F4C445F494401000000000E000000534F425354565641475F4E414D
      450100000000080000005354414E4E415A4E01000000000B0000005354415445
      535F4E414D450100000000070000005354414E50455201000000000B00000050
      52454450525F4E414D4501000000000C0000005649444F5450525F4E414D4501
      0000000009000000504C41545F4E414D4501000000000C0000005052494E5641
      475F4E414D450100000000030000005749440100000000}
    Cursor = crSQLWait
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'GU12_B'
    Session = f_main.ora_Session
    BeforeDelete = q_reisBeforeDelete
    AfterScroll = q_reisAfterScroll
    Left = 48
    Top = 144
  end
  object ds_reis: TDataSource
    DataSet = q_reis
    Left = 48
    Top = 176
  end
  object ActManReis: TActionManager
    Left = 8
    Top = 144
    StyleName = 'XP Style'
    object CopyReis: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1088#1077#1081#1089#1072
      OnExecute = CopyReisExecute
    end
    object refresh_screen: TAction
      Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1101#1082#1088#1072#1085#1072
      OnExecute = refresh_screenExecute
    end
    object Refresh_iscor: TAction
      Caption = #1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1086#1083#1103' iscor '#1079#1072#1103#1074#1082#1080
      OnExecute = Refresh_iscorExecute
    end
  end
  object q_sobstvvag: TOracleDataSet
    SQL.Strings = (
      'select * from kls_gd_sobstvvag')
    QBEDefinition.QBEFieldDefs = {
      03000000040000000200000049440100000000040000004E414D450100000000
      0B0000005641474F574E45525F49440100000000090000004C4F41445F414242
      520100000000}
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 560
    Top = 152
  end
  object ds_sobstvvag: TDataSource
    DataSet = q_sobstvvag
    Left = 560
    Top = 184
  end
  object q_stannazn: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'ID'
      ',STAN_KOD'
      ',STAN_NAME'
      'FROM V_GU12_STAN_NAZN'
      'ORDER BY STAN_NAME'
      ' ')
    QBEDefinition.QBEFieldDefs = {
      03000000060000000200000049440100000000090000005354414E5F4E414D45
      0100000000080000005354414E5F4B4F44010000000009000000535441544553
      5F494401000000000B0000005354415445535F4E414D4501000000000A000000
      5354415445535F4B4F440100000000}
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 592
    Top = 152
  end
  object ds_stannazn: TDataSource
    DataSet = q_stannazn
    Left = 592
    Top = 184
  end
  object q_stanper: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM V_GU12_STAN_PER')
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000090000005354414E5F4E414D45
      01000000000B0000005354414E5045525F4B4F440100000000}
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 624
    Top = 152
  end
  object ds_stanper: TDataSource
    DataSet = q_stanper
    Left = 624
    Top = 184
  end
  object q_gruzpol: TOracleDataSet
    SQL.Strings = (
      'select id,short_name from v_gu12_gruz_pol')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A00000053484F52545F4E414D
      450100000000}
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 656
    Top = 152
  end
  object ds_gruzpol: TDataSource
    DataSet = q_gruzpol
    Left = 656
    Top = 184
  end
  object q_vidotpr: TOracleDataSet
    SQL.Strings = (
      'select * from KLS_GD_VID_OTPR order by name')
    QBEDefinition.QBEFieldDefs = {
      0300000003000000020000004944010000000003000000544147010000000004
      0000004E414D450100000000}
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 688
    Top = 152
  end
  object ds_vidotpr: TDataSource
    DataSet = q_vidotpr
    Left = 688
    Top = 184
  end
  object q_plat: TOracleDataSet
    SQL.Strings = (
      'select plat_id,plat_name from v_gu12_plat')
    QBEDefinition.QBEFieldDefs = {
      030000000200000007000000504C41545F4944010000000009000000504C4154
      5F4E414D450100000000}
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 720
    Top = 152
  end
  object ds_plat: TDataSource
    DataSet = q_plat
    Left = 720
    Top = 184
  end
  object q_razb_view: TOracleDataSet
    SQL.Strings = (
      'SELECT GU12_BR.ROWID,'
      '       GU12_BR.*,'
      '       KLS_PROD.NAME_NPR,'
      '       (CASE WHEN GU12_BR.ZAKAZ_HIST_ID IS NULL'
      '        THEN '#39#39
      '        ELSE ZAKAZ_HIST.CLIENT_NUMBER || '#39' / '#39' ||'
      '             ZAKAZ_HIST.INPUT_NUMBER || '#39'  '#39'  ||'
      '             TO_CHAR(ZAKAZ_HIST.INPUT_DATE,'#39'DD.MM.YYYY'#39')'
      '       END) AS ZAKAZ_HIST_ID_TXT'
      'FROM GU12_BR, KLS_PROD, ZAKAZ_HIST'
      'WHERE ID_B = :IDREIS AND'
      '      GU12_BR.ZAKAZ_HIST_ID = ZAKAZ_HIST.ID(+) AND'
      '      GU12_BR.ID_NPR = KLS_PROD.ID_NPR(+)'
      'ORDER BY DATE_R')
    Variables.Data = {
      0300000001000000070000003A49445245495303000000040000000100000000
      000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_GU12_B'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000A00000002000000494401000000000400000049445F420100000000
      06000000444154455F520100000000070000004B4F4C5F564147010000000003
      00000056455301000000000600000049445F4E50520100000000050000004D45
      544B4101000000000D0000005A414B415A5F484953545F494401000000000800
      00004E414D455F4E50520100000000110000005A414B415A5F484953545F4944
      5F5458540100000000}
    Cursor = crSQLWait
    RefreshOptions = [roAfterUpdate]
    UpdatingTable = 'gu12_br'
    Session = f_main.ora_Session
    AfterOpen = q_razb_viewAfterOpen
    Left = 432
    Top = 352
  end
  object ds_razb: TDataSource
    DataSet = q_razb_view
    Left = 432
    Top = 384
  end
  object ds_prinvag: TDataSource
    DataSet = q_prinvag
    Left = 752
    Top = 184
  end
  object q_prinvag: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,ABBR AS NAME FROM KLS_GD_PRINVAG')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 752
    Top = 152
  end
  object q_backotk: TOracleQuery
    SQL.Strings = (
      'begin'
      '  P_GU12_BACKOTKAZ(:IDREIS,:OLDID);'
      'end;'
      '')
    Session = f_main.ora_Session
    Variables.Data = {
      0300000002000000070000003A49445245495303000000000000000000000006
      0000003A4F4C444944030000000000000000000000}
    Cursor = crSQLWait
    Left = 136
    Top = 144
  end
  object q_insb: TOracleQuery
    SQL.Strings = (
      'INSERT INTO GU12_B ('
      '  PDATE'
      '  ,SOBSTVVAG_ID'
      '  ,STAN_ID'
      '  ,STAN_PER_ID'
      '  ,GRUZPOL_ID'
      '  ,KOL_VAG'
      '  ,VES'
      '  ,VIDOTPR_ID'
      '  ,MRK'
      '  ,ID_A'
      '  ,ID'
      '  ,PLAT_ID'
      '  ,FOX_KOD'
      '  ,ISCOR'
      '  ,DATE_LETTER'
      '  ,NOM_LETTER'
      '  ,DATE_VHOD'
      '  ,NOM_VHOD'
      '  ,PRINVAG_ID'
      '  ,OLD_ID)'
      ' VALUES'
      '( NULL'
      '  ,NULL'
      '  ,NULL'
      '  ,NULL'
      '  ,NULL'
      '  ,0'
      '  ,0'
      '  ,NULL'
      '  ,NULL'
      '  ,:IDZAYAV'
      '  ,NULL'
      '  ,NULL'
      '  ,NULL'
      '  ,NULL'
      '  ,NULL'
      '  ,NULL'
      '  ,NULL'
      '  ,NULL'
      '  ,NULL'
      '  ,NULL)')
    Session = f_main.ora_Session
    Variables.Data = {
      0300000001000000080000003A49445A41594156030000000000000000000000}
    Cursor = crSQLWait
    Left = 232
    Top = 144
  end
  object q_sumrazb: TOracleDataSet
    SQL.Strings = (
      
        'select sum(kol_vag) as kol,sum(ves) as ves from gu12_br where id' +
        '_b=:IDREIS'
      '')
    Variables.Data = {0300000001000000070000003A494452454953030000000000000000000000}
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 496
    Top = 154
  end
  object q_del_reis: TOracleQuery
    SQL.Strings = (
      'DELETE FROM GU12_B WHERE ID=:IDREIS ')
    Session = f_main.ora_Session
    Variables.Data = {0300000001000000070000003A494452454953030000000000000000000000}
    Cursor = crSQLWait
    Left = 168
    Top = 144
  end
  object q_delrazb: TOracleQuery
    SQL.Strings = (
      'delete from gu12_br where id_b=:IDREIS')
    Session = f_main.ora_Session
    Variables.Data = {0300000001000000070000003A494452454953030000000000000000000000}
    Cursor = crSQLWait
    Left = 200
    Top = 144
  end
  object q_states: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'ID'
      ',(CASE'
      #9'   WHEN ID=0 THEN '#39' '#39
      #9'   ELSE STATE_NAME'
      'END) AS STATE_NAME'
      'FROM'
      'KLS_STATES'
      'ORDER BY STATE_NAME')
    Session = f_main.ora_Session
    Left = 464
    Top = 152
  end
  object ds_states: TDataSource
    DataSet = q_states
    Left = 464
    Top = 184
  end
  object q_maxiscorreis: TOracleDataSet
    SQL.Strings = (
      'select'
      'max(iscor) as iscor'
      'from'
      'gu12_b'
      'where'
      'id_a=:IDZAYAV')
    Variables.Data = {
      0300000001000000080000003A49445A41594156030000000000000000000000}
    Session = f_main.ora_Session
    Left = 432
    Top = 152
  end
  object q_mark: TOracleQuery
    SQL.Strings = (
      'begin'
      'update gu12_br set metka=1 where id_b=:IDREIS;'
      'commit;'
      'end;')
    Session = f_main.ora_Session
    Variables.Data = {0300000001000000070000003A494452454953080000000000000000000000}
    Left = 624
    Top = 466
  end
  object q_unmark: TOracleQuery
    SQL.Strings = (
      'begin'
      'update gu12_br set metka=0 where id_b=:IDREIS;'
      'commit;'
      'end;'
      '')
    Session = f_main.ora_Session
    Variables.Data = {0300000001000000070000003A494452454953080000000000000000000000}
    Left = 664
    Top = 466
  end
end
