object f_identify: Tf_identify
  Left = 333
  Top = 171
  Width = 351
  Height = 139
  Caption = #1042#1099#1073#1086#1088' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
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
    Left = 24
    Top = 12
    Width = 76
    Height = 13
    Alignment = taRightJustify
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
  end
  object Label2: TLabel
    Left = 59
    Top = 34
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = #1055#1072#1088#1086#1083#1100':'
  end
  object combo_user: TRxDBLookupCombo
    Left = 104
    Top = 7
    Width = 225
    Height = 21
    DropDownCount = 8
    LookupField = 'ID'
    LookupDisplay = 'NAME'
    LookupSource = ds_ApplUsers
    TabOrder = 2
  end
  object ed_passw: TEdit
    Left = 104
    Top = 32
    Width = 225
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object bt_ok: TBitBtn
    Left = 144
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = bt_okClick
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
  object q_ApplUsers: TOracleDataSet
    SQL.Strings = (
      'select * from app_users'
      'WHERE netname=:NETNAME'
      'ORDER BY name ')
    Variables.Data = {
      0300000001000000080000003A4E45544E414D45050000000500000047726179
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000070000000200000049440100000000040000004E414D450100000000
      0500000050415353570100000000070000004E45544E414D4501000000000300
      0000534E50010000000003000000554E5001000000000800000049535F41444D
      494E0100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_ApplUsersBeforeOpen
    Left = 215
    Top = 17
    object q_ApplUsersID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_ApplUsersNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
    object q_ApplUsersPASSW: TStringField
      FieldName = 'PASSW'
      Size = 15
    end
    object q_ApplUsersNETNAME: TStringField
      FieldName = 'NETNAME'
      Size = 30
    end
    object q_ApplUsersSNP: TIntegerField
      FieldName = 'SNP'
      Required = True
    end
    object q_ApplUsersUNP: TIntegerField
      FieldName = 'UNP'
      Required = True
    end
    object q_ApplUsersIS_ADMIN: TIntegerField
      FieldName = 'IS_ADMIN'
      Required = True
    end
  end
  object ds_ApplUsers: TDataSource
    DataSet = q_ApplUsers
    Left = 263
    Top = 13
  end
end
