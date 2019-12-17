object f_LoadReeSMN_2: Tf_LoadReeSMN_2
  Left = 249
  Top = 146
  Width = 696
  Height = 476
  Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1088#1077#1077#1089#1090#1088' '#1085#1072' '#1085#1077#1092#1090#1100' '#1086#1090#1075#1088#1091#1078#1077#1085#1085#1091#1102' '#1089' '#1069#1089#1090#1072#1082#1072#1076#1099' '#1057#1052#1053' - '#1063#1040#1057#1058#1068' 2'
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
      Height = 32
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
      object edDateRee: TDateTimePicker
        Left = 292
        Top = 4
        Width = 97
        Height = 21
        Date = 38093.677253217590000000
        Time = 38093.677253217590000000
        TabOrder = 1
      end
      object edNumRee: TEdit
        Left = 114
        Top = 4
        Width = 151
        Height = 21
        TabOrder = 0
      end
    end
    object Grid: TStringGrid
      Left = 1
      Top = 33
      Width = 686
      Height = 351
      Align = alClient
      ColCount = 10
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
        Left = 9
        Top = 12
        Width = 96
        Height = 13
        Alignment = taRightJustify
        Caption = #1042#1089#1077#1075#1086' '#1090#1072#1088#1072', '#1082#1075': '
      end
      object Label18: TLabel
        Left = 236
        Top = 12
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = #1074#1072#1075#1086#1085#1086#1074':'
      end
      object edVes: TCurrencyEdit
        Left = 112
        Top = 8
        Width = 113
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = ',0'
        TabOrder = 0
      end
      object edKol: TCurrencyEdit
        Left = 296
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
  object q_VagOwner: TOracleDataSet
    SQL.Strings = (
      'select * from kls_vagowner'
      'order by display_name')
    Session = Master
    Left = 423
    Top = 177
    object q_VagOwnerID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_VagOwnerDISPLAY_NAME: TStringField
      DisplayLabel = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
      FieldName = 'DISPLAY_NAME'
      Size = 50
    end
    object q_VagOwnerVAGOWNER_NAME: TStringField
      FieldName = 'VAGOWNER_NAME'
      Required = True
      Size = 30
    end
    object q_VagOwnerSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 10
    end
    object q_VagOwnerPREDPR_ID: TIntegerField
      FieldName = 'PREDPR_ID'
      Required = True
    end
    object q_VagOwnerVAGOWN_MOS_ID: TFloatField
      FieldName = 'VAGOWN_MOS_ID'
    end
    object q_VagOwnerVAGOWN_TYP_ID: TFloatField
      FieldName = 'VAGOWN_TYP_ID'
      Required = True
    end
    object q_VagOwnerSOBSTV_ID: TFloatField
      FieldName = 'SOBSTV_ID'
    end
    object q_VagOwnerOWNER_ID: TFloatField
      FieldName = 'OWNER_ID'
    end
    object q_VagOwnerSMN_NAME: TStringField
      FieldName = 'SMN_NAME'
      Size = 30
    end
  end
end
