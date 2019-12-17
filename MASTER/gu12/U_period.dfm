object f_period: Tf_period
  Left = 379
  Top = 198
  Width = 447
  Height = 219
  Caption = #1055#1077#1088#1080#1086#1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 95
    Top = 34
    Width = 11
    Height = 16
    Caption = #1057
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 218
    Top = 34
    Width = 19
    Height = 16
    Caption = #1087#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 115
    Top = 57
    Width = 33
    Height = 13
    Caption = '17:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 243
    Top = 57
    Width = 33
    Height = 13
    Caption = '17:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object l_plat_otch: TLabel
    Left = 13
    Top = 86
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
  object c_dbeg: TDBDateTimeEditEh
    Left = 112
    Top = 32
    Width = 89
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 0
    Visible = True
    OnChange = c_dbegChange
  end
  object c_dend: TDBDateTimeEditEh
    Left = 240
    Top = 32
    Width = 89
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 1
    Visible = True
    OnChange = c_dendChange
  end
  object Button1: TButton
    Left = 184
    Top = 128
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object c_plat_otch: TRxDBLookupCombo
    Left = 89
    Top = 86
    Width = 307
    Height = 21
    DropDownCount = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LookupField = 'PLAT_ID'
    LookupDisplay = 'PLAT_NAME'
    LookupSource = d_plat_otch
    ParentFont = False
    TabOrder = 3
  end
  object q_ispoln: TOracleQuery
    SQL.Strings = (
      'begin'
      '  p_gu12_ispoln;'
      'end;')
    Session = f_main.ora_Session
    Cursor = crSQLWait
    ThreadSynchronized = False
    Left = 16
    Top = 128
  end
  object q_plat_otch: TOracleDataSet
    SQL.Strings = (
      'select plat_id,plat_name from v_gu12_plat')
    QBEDefinition.QBEFieldDefs = {
      030000000200000007000000504C41545F4944010000000009000000504C4154
      5F4E414D450100000000}
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 48
    Top = 128
  end
  object d_plat_otch: TDataSource
    DataSet = q_plat_otch
    Left = 80
    Top = 128
  end
  object q_spis_zayav_plat: TOracleDataSet
    SQL.Strings = (
      'select * from v_gu12_rep_spisok_zayav ')
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 120
    Top = 128
  end
end
