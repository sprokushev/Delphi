object frmDlgWindow: TfrmDlgWindow
  Left = 470
  Top = 266
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1042#1074#1077#1076#1080#1090#1077
  ClientHeight = 241
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 34
    Top = 200
    Width = 75
    Height = 25
    Caption = #1054#1082
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 137
    Top = 200
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 2
    Width = 232
    Height = 183
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 15
      Width = 114
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
    end
    object Label2: TLabel
      Left = 12
      Top = 55
      Width = 26
      Height = 13
      Caption = #1062#1077#1085#1072
    end
    object Label3: TLabel
      Left = 12
      Top = 92
      Width = 25
      Height = 13
      Caption = #1058#1086#1085#1085
    end
    object Label4: TLabel
      Left = 140
      Top = 92
      Width = 18
      Height = 13
      Caption = #1042'/'#1094
    end
    object Label5: TLabel
      Left = 20
      Top = 132
      Width = 104
      Height = 13
      Caption = #1074' '#1090'.'#1095'.'#1089#1088#1086#1095'.'#1087#1077#1088'-'#1082#1080', '#1090#1085'.'
    end
    object Label6: TLabel
      Left = 140
      Top = 132
      Width = 18
      Height = 13
      Caption = #1042'/'#1094
    end
    object edDB: TDateEdit
      Left = 12
      Top = 31
      Width = 117
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object edPrice: TRxCalcEdit
      Left = 12
      Top = 71
      Width = 117
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00'
      NumGlyphs = 2
      TabOrder = 1
    end
    object edVes: TRxCalcEdit
      Left = 12
      Top = 108
      Width = 117
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.000'
      NumGlyphs = 2
      TabOrder = 2
      OnChange = edVesChange
    end
    object edKol: TRxCalcEdit
      Left = 140
      Top = 108
      Width = 77
      Height = 21
      AutoSize = False
      DisplayFormat = ',0'
      NumGlyphs = 2
      TabOrder = 3
    end
    object edSpeedVes: TRxCalcEdit
      Left = 12
      Top = 148
      Width = 117
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.000'
      NumGlyphs = 2
      TabOrder = 4
      OnChange = edSpeedVesChange
    end
    object edSpeedKol: TRxCalcEdit
      Left = 140
      Top = 148
      Width = 77
      Height = 21
      AutoSize = False
      DisplayFormat = ',0'
      NumGlyphs = 2
      TabOrder = 5
    end
  end
end
