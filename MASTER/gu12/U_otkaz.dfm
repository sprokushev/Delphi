object f_otkaz: Tf_otkaz
  Left = 386
  Top = 224
  Width = 555
  Height = 384
  Caption = #1054#1090#1082#1072#1079
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
    Left = 170
    Top = 28
    Width = 75
    Height = 13
    Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 196
    Top = 51
    Width = 50
    Height = 13
    Caption = #1057#1090#1072#1085#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 90
    Top = 91
    Width = 154
    Height = 13
    Caption = #1044#1072#1090#1072' '#1080#1089#1093#1086#1076#1103#1097#1077#1075#1086' '#1087#1080#1089#1100#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 82
    Top = 115
    Width = 163
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1080#1089#1093#1086#1076#1103#1097#1077#1075#1086' '#1087#1080#1089#1100#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 98
    Top = 139
    Width = 147
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1093#1086#1076#1103#1097#1077#1075#1086' '#1087#1080#1089#1100#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 90
    Top = 163
    Width = 156
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1074#1093#1086#1076#1103#1097#1077#1075#1086' '#1087#1080#1089#1100#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 112
    Top = 208
    Width = 124
    Height = 24
    Caption = #1050#1086#1083'.'#1074#1072#1075#1086#1085#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 344
    Top = 208
    Width = 37
    Height = 24
    Caption = #1042#1077#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l_plat: TLabel
    Left = 250
    Top = 28
    Width = 32
    Height = 13
    Caption = 'l_plat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l_stan: TLabel
    Left = 250
    Top = 51
    Width = 35
    Height = 13
    Caption = 'l_stan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l_kol: TLabel
    Left = 248
    Top = 208
    Width = 44
    Height = 24
    Caption = 'l_kol'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l_ves: TLabel
    Left = 392
    Top = 208
    Width = 49
    Height = 24
    Caption = 'l_ves'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object b_saveotkaz: TButton
    Left = 96
    Top = 280
    Width = 97
    Height = 33
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
    OnClick = b_saveotkazClick
  end
  object b_canselotkaz: TButton
    Left = 344
    Top = 280
    Width = 97
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    OnClick = b_canselotkazClick
  end
  object e_nomish: TEdit
    Left = 248
    Top = 112
    Width = 217
    Height = 21
    TabOrder = 2
    Text = 'e_nomish'
  end
  object e_nomvhod: TEdit
    Left = 248
    Top = 160
    Width = 217
    Height = 21
    TabOrder = 3
    Text = 'e_nomvhod'
  end
  object c_dateish: TDBDateTimeEditEh
    Left = 248
    Top = 88
    Width = 121
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 4
    Visible = True
  end
  object c_datevh: TDBDateTimeEditEh
    Left = 248
    Top = 136
    Width = 121
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 5
    Visible = True
  end
  object q_otkaz: TOracleQuery
    SQL.Strings = (
      'begin'
      '  P_GU12_OTKAZ(:IDREIS,:DATEISH,:DATEVHOD,:NOMISH,:NOMVHOD);'
      'end;'
      '')
    Session = f_main.ora_Session
    Variables.Data = {
      0300000005000000070000003A49445245495303000000000000000000000008
      0000003A444154454953480C0000000000000000000000090000003A44415445
      56484F440C0000000000000000000000070000003A4E4F4D4953480500000000
      00000000000000080000003A4E4F4D56484F44050000000000000000000000}
    Cursor = crSQLWait
    Left = 32
    Top = 16
  end
  object q_kol_ves_otkaz: TOracleQuery
    SQL.Strings = (
      'select'
      'sum(kol_vag) as kol'
      ',sum(ves) as ves'
      'from gu12_br'
      'where id_b=:IDREIS'
      'and metka=1  ')
    Session = f_main.ora_Session
    Variables.Data = {0300000001000000070000003A494452454953080000000000000000000000}
    Left = 64
    Top = 16
  end
end
