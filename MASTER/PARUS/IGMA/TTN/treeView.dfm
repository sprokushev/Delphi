object f_treeForm: Tf_treeForm
  Left = 351
  Top = 263
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'f_treeForm'
  ClientHeight = 190
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 309
    Height = 161
    Align = alTop
    Indent = 19
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 120
    Top = 165
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
end
