object Form1: TForm1
  Left = 192
  Top = 124
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 281
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 0
    Width = 465
    Height = 241
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 8
    Top = 248
    Width = 465
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1091#1102' '#1087#1086#1089#1090#1072#1074#1082#1091
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = ADOSelectDoc
    Left = 104
    Top = 16
  end
  object ADOSelectDoc: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=inform;Persist Security Info=True;U' +
      'ser ID=inform;Initial Catalog=Exp2ISU;Data Source=172.19.251.28'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select id nn, prod_abbr2 product, num_otgr automobile, status,'
      'np_data_o date_otgr'
      'from sh30'
      'where status in (0,1)')
    Left = 176
    Top = 16
  end
  object ADODeleteDoc: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=inform;Persist Security Info=True;U' +
      'ser ID=inform;Initial Catalog=Exp2ISU;Data Source=172.19.251.28'
    Parameters = <
      item
        Name = 'pId'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 10
        Size = 19
        Value = Null
      end>
    SQL.Strings = (
      'update sh30 set status=2, is_upd=0 where id=:pId')
    Left = 264
    Top = 16
  end
end
