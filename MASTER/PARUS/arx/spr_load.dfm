object frm1cSpr: Tfrm1cSpr
  Left = 683
  Top = 360
  Width = 331
  Height = 209
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poNone
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 110
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1080' 1'#1089
  end
  object edPath: TDirectoryEdit
    Left = 8
    Top = 32
    Width = 297
    Height = 21
    NumGlyphs = 1
    TabOrder = 0
    Text = 'R:\1CLUKARH\lukarh'
  end
  object BitBtn3: TBitBtn
    Left = 8
    Top = 64
    Width = 97
    Height = 25
    Action = acRS
    Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1077' '#1089#1095#1077#1090#1072
    TabOrder = 1
  end
  object BitBtn4: TBitBtn
    Left = 110
    Top = 64
    Width = 81
    Height = 25
    Action = acContr
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
    TabOrder = 2
  end
  object BitBtn5: TBitBtn
    Left = 194
    Top = 64
    Width = 97
    Height = 25
    Action = acNomen
    Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 96
    Width = 75
    Height = 25
    Action = acPBE
    Caption = #1055#1041#1045
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 128
    Width = 113
    Height = 25
    Action = acStore
    Caption = #1052#1077#1089#1090#1072' '#1061#1088#1072#1085#1077#1085#1080#1103
    TabOrder = 5
  end
  object oraSPR: TOracleQuery
    Session = oraSesMain
    Left = 200
    Top = 72
  end
  object oraSesMain: TOracleSession
    LogonUsername = 'pvz'
    LogonDatabase = 'P5'
    Left = 200
    Top = 120
  end
  object adoMain: TADOConnection
    LoginPrompt = False
    Left = 248
    Top = 72
  end
  object adoDS: TADODataSet
    Connection = adoMain
    Parameters = <>
    Left = 248
    Top = 120
  end
  object ActionManager1: TActionManager
    Left = 224
    Top = 8
    StyleName = 'XP Style'
    object acRS: TAction
      Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1077' '#1089#1095#1077#1090#1072
      OnExecute = acRSExecute
    end
    object acContr: TAction
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
      OnExecute = acContrExecute
    end
    object acNomen: TAction
      Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
      OnExecute = acNomenExecute
    end
    object acPBE: TAction
      Caption = #1055#1041#1045
      OnExecute = acPBEExecute
    end
    object acStore: TAction
      Caption = #1052#1077#1089#1090#1072' '#1061#1088#1072#1085#1077#1085#1080#1103
      OnExecute = acStoreExecute
    end
  end
end
