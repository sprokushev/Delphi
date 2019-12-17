object Form1: TForm1
  Left = 323
  Top = 177
  Width = 878
  Height = 471
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 56
    Top = 64
    Width = 793
    Height = 81
    DataSource = dsPS
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 152
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object edPath: TDirectoryEdit
    Left = 240
    Top = 24
    Width = 297
    Height = 21
    NumGlyphs = 1
    TabOrder = 2
    Text = 'edPath'
  end
  object BitBtn2: TBitBtn
    Left = 88
    Top = 152
    Width = 75
    Height = 25
    Caption = #1055#1083#1072#1085' '#1089#1095#1077#1090#1086#1074
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object adoMain: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=pf'
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object adoPS: TADODataSet
    Connection = adoMain
    CursorType = ctStatic
    CommandText = 'select * from '#39'1saccs.dbf'#39
    Parameters = <>
    Left = 88
    Top = 16
  end
  object dsPS: TDataSource
    DataSet = adoPS
    Left = 136
    Top = 16
  end
  object adoQ: TADOQuery
    Connection = adoMain
    Parameters = <>
    Left = 176
    Top = 16
  end
end
