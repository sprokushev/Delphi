object Form1: TForm1
  Left = 200
  Top = 110
  Width = 748
  Height = 410
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
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 657
    Height = 161
    ItemHeight = 13
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ListBox2: TListBox
    Left = 8
    Top = 176
    Width = 657
    Height = 161
    ItemHeight = 13
    TabOrder = 2
  end
  object AFtp: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    Host = '172.18.14.38'
    Password = 'anonymous'
    Username = 'anonymous'
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 16
    Top = 24
  end
end
