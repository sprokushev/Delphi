object f_AddGdTime: Tf_AddGdTime
  Left = 406
  Top = 265
  Width = 392
  Height = 189
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100'/'#1080#1079#1084#1077#1085#1080#1090#1100' '#1074#1088#1077#1084#1103' '#1086#1090#1075#1088#1091#1079#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 12
    Width = 83
    Height = 13
    Caption = #1052#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080':'
  end
  object Label2: TLabel
    Left = 130
    Top = 34
    Width = 33
    Height = 13
    Caption = #1042#1072#1075#1086#1085':'
  end
  object Label3: TLabel
    Left = 83
    Top = 56
    Width = 80
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1103':'
  end
  object Label4: TLabel
    Left = 13
    Top = 78
    Width = 150
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080' ('#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103'):'
  end
  object Label5: TLabel
    Left = 6
    Top = 100
    Width = 157
    Height = 13
    Caption = #1042#1088#1077#1084#1103' '#1086#1090#1075#1088#1091#1079#1082#1080' ('#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103'):'
  end
  object cb_Mesto: TDBLookupComboBox
    Left = 168
    Top = 8
    Width = 209
    Height = 21
    KeyField = 'ID'
    ListField = 'MESTO_NAME'
    ListSource = ds_Mesto
    TabOrder = 0
  end
  object ed_NumOtgr: TEdit
    Left = 168
    Top = 30
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'ed_NumOtgr'
  end
  object ed_DateOtgr: TDateTimePicker
    Left = 169
    Top = 53
    Width = 88
    Height = 21
    Date = 37070.390091736100000000
    Time = 37070.390091736100000000
    TabOrder = 2
  end
  object ed_NP_DATA_O: TDateTimePicker
    Left = 169
    Top = 75
    Width = 88
    Height = 21
    Date = 37070.390091736100000000
    Time = 37070.390091736100000000
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 120
    Top = 128
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 4
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
    Left = 216
    Top = 128
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 5
    Kind = bkCancel
  end
  object ed_NP_TIMEP: TEdit
    Left = 168
    Top = 97
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'ed_NP_TIMEP'
  end
  object q_Mesto: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_MESTO')
    QBEDefinition.QBEFieldDefs = {
      030000000300000002000000494401000000000A0000004D4553544F5F4E414D
      4501000000000E0000004D4553544F5F535645444E414D450100000000}
    Session = f_main.ora_Session
    Left = 272
    Top = 56
  end
  object ds_Mesto: TDataSource
    DataSet = q_Mesto
    Left = 304
    Top = 56
  end
  object ado_Session: TADOConnection
    ConnectionString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=PF'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 16
    Top = 8
  end
  object q_Reestr: TADOQuery
    Connection = ado_Session
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT id,kvit_id'
      'FROM '#39'U:\LUK\OTGR\OPERDATA\reestr.dbf'#39
      'WHERE mesto=0'
      'AND num_cist=0'
      'AND date_otgr={03/31/2003}')
    Left = 16
    Top = 120
  end
  object ds_Reestr: TDataSource
    DataSet = q_Reestr
    Left = 64
    Top = 120
  end
end
