object f_LoadReeSMN_1: Tf_LoadReeSMN_1
  Left = 204
  Top = 113
  Width = 696
  Height = 476
  Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1088#1077#1077#1089#1090#1088' '#1085#1072' '#1085#1077#1092#1090#1100' '#1086#1090#1075#1088#1091#1078#1077#1085#1085#1091#1102' '#1089' '#1069#1089#1090#1072#1082#1072#1076#1099' '#1057#1052#1053' - '#1063#1040#1057#1058#1068' 1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 23
    Width = 688
    Height = 426
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 686
      Height = 114
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 96
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1088#1077#1077#1089#1090#1088#1072':'
      end
      object Label2: TLabel
        Left = 272
        Top = 8
        Width = 14
        Height = 13
        Caption = #1086#1090
      end
      object Label3: TLabel
        Left = 8
        Top = 53
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080
      end
      object Label4: TLabel
        Left = 8
        Top = 74
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080
      end
      object Label5: TLabel
        Left = 8
        Top = 96
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080
      end
      object Label6: TLabel
        Left = 116
        Top = 52
        Width = 17
        Height = 16
        Caption = '20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 116
        Top = 72
        Width = 17
        Height = 16
        Caption = '15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 152
        Top = 53
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = #39'C:'
      end
      object Label9: TLabel
        Left = 152
        Top = 74
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = #39'C:'
      end
      object Label10: TLabel
        Left = 152
        Top = 96
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = #39'C:'
      end
      object Label11: TLabel
        Left = 248
        Top = 53
        Width = 114
        Height = 13
        Alignment = taRightJustify
        Caption = #1054#1073#1074#1086#1076#1085#1077#1085#1085#1086#1089#1090#1100', %:'
      end
      object Label12: TLabel
        Left = 224
        Top = 74
        Width = 138
        Height = 13
        Alignment = taRightJustify
        Caption = #1061#1083#1086#1088#1080#1089#1090#1099#1077' '#1089#1086#1083#1080', '#1084#1075'/'#1083':'
      end
      object Label13: TLabel
        Left = 262
        Top = 95
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = #1052#1077#1093'.'#1087#1088#1080#1084#1077#1089#1080', %:'
      end
      object Label14: TLabel
        Left = 467
        Top = 53
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = #1057#1077#1088#1072', %:'
      end
      object Label15: TLabel
        Left = 421
        Top = 74
        Width = 97
        Height = 13
        Alignment = taRightJustify
        Caption = #1044#1053#1055', '#1084#1084'.'#1088#1090'.'#1089#1090'.:'
      end
      object Label16: TLabel
        Left = 8
        Top = 32
        Width = 103
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072':'
      end
      object Label19: TLabel
        Left = 272
        Top = 32
        Width = 14
        Height = 13
        Caption = #1086#1090
      end
      object Label20: TLabel
        Left = 392
        Top = 32
        Width = 117
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072':'
      end
      object edNumPasp: TEdit
        Left = 114
        Top = 28
        Width = 151
        Height = 21
        TabOrder = 2
      end
      object edDateRee: TDateTimePicker
        Left = 292
        Top = 4
        Width = 97
        Height = 21
        Date = 38093.677253217590000000
        Time = 38093.677253217590000000
        TabOrder = 1
      end
      object edTemper: TCurrencyEdit
        Left = 100
        Top = 92
        Width = 49
        Height = 21
        AutoSize = False
        DecimalPlaces = 1
        DisplayFormat = ',##0.0;-,##0.0'
        TabOrder = 7
      end
      object edPl20: TCurrencyEdit
        Left = 172
        Top = 50
        Width = 50
        Height = 21
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = ',0.0000'
        MaxValue = 1.000000000000000000
        TabOrder = 5
      end
      object edPl15: TCurrencyEdit
        Left = 172
        Top = 71
        Width = 50
        Height = 21
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = ',0.0000'
        MaxValue = 1.000000000000000000
        TabOrder = 6
      end
      object edPl: TCurrencyEdit
        Left = 172
        Top = 92
        Width = 50
        Height = 21
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = ',0.0000'
        MaxValue = 1.000000000000000000
        TabOrder = 8
      end
      object edWater: TCurrencyEdit
        Left = 364
        Top = 50
        Width = 50
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00'
        MaxValue = 100.000000000000000000
        TabOrder = 9
      end
      object edSalt: TCurrencyEdit
        Left = 364
        Top = 71
        Width = 50
        Height = 21
        AutoSize = False
        DecimalPlaces = 1
        DisplayFormat = ',#0.0'
        TabOrder = 10
      end
      object edDirt: TCurrencyEdit
        Left = 364
        Top = 92
        Width = 50
        Height = 21
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000'
        MaxValue = 100.000000000000000000
        TabOrder = 11
      end
      object edSulfur: TCurrencyEdit
        Left = 524
        Top = 50
        Width = 50
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00'
        MaxValue = 100.000000000000000000
        TabOrder = 12
      end
      object edDNP: TCurrencyEdit
        Left = 524
        Top = 71
        Width = 50
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = ',000'
        TabOrder = 13
      end
      object edNumRee: TEdit
        Left = 114
        Top = 4
        Width = 151
        Height = 21
        TabOrder = 0
      end
      object edDatePasp: TDateTimePicker
        Left = 292
        Top = 28
        Width = 97
        Height = 21
        Date = 38093.677253217590000000
        Time = 38093.677253217590000000
        TabOrder = 3
      end
      object edNumRez: TEdit
        Left = 514
        Top = 28
        Width = 151
        Height = 21
        TabOrder = 4
      end
    end
    object Grid: TStringGrid
      Left = 1
      Top = 115
      Width = 686
      Height = 269
      Align = alClient
      ColCount = 14
      DefaultRowHeight = 16
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
      TabOrder = 1
      OnDrawCell = GridDrawCell
    end
    object Panel3: TPanel
      Left = 1
      Top = 384
      Width = 686
      Height = 41
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Label17: TLabel
        Left = 8
        Top = 12
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = #1042#1089#1077#1075#1086', '#1082#1075': '
      end
      object Label18: TLabel
        Left = 204
        Top = 12
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = #1074#1072#1075#1086#1085#1086#1074':'
      end
      object edVes: TCurrencyEdit
        Left = 80
        Top = 8
        Width = 113
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = ',0'
        TabOrder = 0
      end
      object edKol: TCurrencyEdit
        Left = 264
        Top = 8
        Width = 113
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = ',0'
        TabOrder = 1
      end
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 688
    Height = 23
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      TabOrder = 0
      object btOpen: TTBItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' Excel'
        OnClick = btOpenClick
      end
      object btLoad: TTBItem
        Caption = #1047#1072#1082#1072#1095#1072#1090#1100' '#1074' Master'
        OnClick = btLoadClick
      end
    end
  end
  object OpenDlg: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' Excel|*.xls'
    InitialDir = 'C:\'
    Left = 224
    Top = 223
  end
  object Master: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Left = 544
    Top = 135
  end
  object findPod: TOracleDataSet
    SQL.Strings = (
      'select * from podacha'
      'where pod_num=:pod_num'
      'and pod_date=TRUNC(:pod_date)'
      'and prod_id_npr=:prod_id_npr'
      'and vetka_otp_id=:vetka_otp_id'
      ''
      '')
    Variables.Data = {
      0300000004000000080000003A504F445F4E554D050000000B000000323136CB
      F3EA202D20C00000000000090000003A504F445F444154450C00000007000000
      78680504010101000000000C0000003A50524F445F49445F4E50520500000006
      000000393030303000000000000D0000003A5645544B415F4F54505F49440300
      0000040000000A00000000000000}
    Session = Master
    Left = 496
    Top = 231
  end
  object q_cmn: TOracleQuery
    Session = Master
    Left = 296
    Top = 223
  end
end
