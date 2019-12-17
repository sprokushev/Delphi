object frmLinks: TfrmLinks
  Left = 398
  Top = 349
  Width = 484
  Height = 325
  Caption = #1057#1074#1103#1079#1080' '#1074' '#1055#1072#1088#1091#1089#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 77
    Height = 13
    Caption = #1047#1072' '#1087#1077#1088#1080#1086#1076' c:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 185
    Top = 16
    Width = 19
    Height = 13
    Caption = #1087#1086':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object deDateBegin: TDateEdit
    Left = 104
    Top = 8
    Width = 73
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object deDateEnd: TDateEdit
    Left = 209
    Top = 8
    Width = 73
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 40
    Width = 300
    Height = 105
    Caption = #1047#1072#1103#1074#1082#1080' '#1089' '#1088#1072#1089#1093#1086#1076#1085#1099#1084#1080' '#1085#1072#1082#1083#1072#1076#1085#1099#1084#1080
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 16
      Top = 32
      Width = 150
      Height = 25
      Action = acCord2ttn17
      Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1077#1081
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 64
      Width = 150
      Height = 25
      Action = acDepord2ttn17d
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 160
    Width = 300
    Height = 105
    Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1089' '#1087#1088#1080#1093#1086#1076#1085#1099#1084#1080
    TabOrder = 3
    object BitBtn3: TBitBtn
      Left = 16
      Top = 24
      Width = 150
      Height = 25
      Action = acTtn172pr17
      Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1077#1081
      TabOrder = 0
    end
    object BitBtn4: TBitBtn
      Left = 16
      Top = 56
      Width = 150
      Height = 25
      Action = acTtn17d2pr17
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
      TabOrder = 1
    end
  end
  object ActionManager1: TActionManager
    Left = 296
    StyleName = 'XP Style'
    object acDepord2ttn17d: TAction
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
      OnExecute = acDepord2ttn17dExecute
    end
    object acCord2ttn17: TAction
      Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1077#1081
      OnExecute = acCord2ttn17Execute
    end
    object acTtn17d2pr17: TAction
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
      OnExecute = acTtn17d2pr17Execute
    end
    object acTtn172pr17: TAction
      Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1077#1081
      OnExecute = acTtn172pr17Execute
    end
  end
  object OracleQuery1: TOracleQuery
    Session = frmMain.oraParusMain
    Left = 392
    Top = 16
  end
  object oraMainSelect: TOracleDataSet
    SQL.Strings = (
      
        'select pf.MONTH_ID,pf.RN as rn_in,pf.TASK as task_in,pf2.rn as r' +
        'n_out,pf2.TASK as task_out,pf2.id'
      'from parus_fin pf,parus_fin pf2'
      'where pf.MONTH_ID=pf2.MONTH_ID')
    Session = oraMain
    Left = 328
    Top = 56
  end
  object oraMain: TOracleSession
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Connected = True
    Left = 360
    Top = 56
  end
  object oraMainInsert: TOracleQuery
    Session = oraMain
    Left = 328
    Top = 88
  end
end
