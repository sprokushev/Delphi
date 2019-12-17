object f_EndDateFOX2R3: Tf_EndDateFOX2R3
  Left = 409
  Top = 228
  Width = 369
  Height = 102
  Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1087#1077#1088#1080#1086#1076#1072' '#1074#1099#1075#1088#1091#1079#1082#1080' '#1074' R3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 13
    Width = 29
    Height = 13
    Caption = #1044#1072#1090#1072':'
  end
  object Label2: TLabel
    Left = 184
    Top = 12
    Width = 36
    Height = 13
    Caption = #1042#1088#1077#1084#1103':'
  end
  object DBEdit2: TDBEdit
    Left = 232
    Top = 8
    Width = 113
    Height = 21
    DataField = 'end_time'
    DataSource = ds_End_DT
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 40
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 2
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
    Left = 208
    Top = 40
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object DBEdit1: TDBEdit
    Left = 56
    Top = 8
    Width = 113
    Height = 21
    DataField = 'end_date'
    DataSource = ds_End_DT
    TabOrder = 0
  end
  object ds_End_DT: TDataSource
    DataSet = t_End_DT
    Left = 312
    Top = 32
  end
  object t_End_DT: TADOTable
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DSN=PF;UID=;SourceDB=u:\fox2r3\archiv;SourceType=DBF;Exclusi' +
      've=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"'
    TableName = 'end_dt'
    Left = 152
    Top = 32
  end
end
