object f_KlsAdd: Tf_KlsAdd
  Left = 281
  Top = 122
  Width = 640
  Height = 480
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 411
    Width = 632
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      632
      35)
    object BitBtn1: TBitBtn
      Left = 464
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 552
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
  end
  object SBKls: TScrollBox
    Left = 0
    Top = 0
    Width = 632
    Height = 411
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 1
  end
  object q_tmp: TOracleDataSet
    Left = 368
    Top = 316
  end
end
