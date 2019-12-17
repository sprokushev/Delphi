object SvedVagonInfoFrame: TSvedVagonInfoFrame
  Left = 0
  Top = 0
  Width = 266
  Height = 203
  Ctl3D = True
  ParentCtl3D = False
  TabOrder = 0
  object Label1: TLabel
    Left = 38
    Top = 8
    Width = 72
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1074#1072#1075#1086#1085#1072
  end
  object Label2: TLabel
    Left = 53
    Top = 29
    Width = 57
    Height = 13
    Caption = #1042#1080#1076' '#1074#1072#1075#1086#1085#1072
  end
  object Label3: TLabel
    Left = 10
    Top = 54
    Width = 100
    Height = 13
    Caption = #1055#1088#1080#1079#1085#1072#1082' '#1076#1086#1088#1086#1075' '#1057#1053#1043
  end
  object Label4: TLabel
    Left = 24
    Top = 75
    Width = 86
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1089#1077#1081
  end
  object Label5: TLabel
    Left = 13
    Top = 95
    Width = 97
    Height = 13
    Caption = #1043#1088#1091#1079#1086#1087#1086#1076#1098#1077#1084#1085#1086#1089#1090#1100
  end
  object Label9: TLabel
    Left = 53
    Top = 116
    Width = 57
    Height = 13
    Caption = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072
  end
  object Label6: TLabel
    Left = 53
    Top = 137
    Width = 57
    Height = 13
    Caption = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072
  end
  object Label7: TLabel
    Left = 53
    Top = 159
    Width = 57
    Height = 13
    Caption = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
  end
  object Label8: TLabel
    Left = 6
    Top = 182
    Width = 104
    Height = 13
    Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1074#1072#1075#1086#1085#1072
  end
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 117
    Top = 178
    Width = 145
    Height = 21
    DropDownCount = 8
    TabOrder = 0
  end
  object lcKalibr: TRxDBLookupCombo
    Left = 117
    Top = 155
    Width = 145
    Height = 21
    DropDownCount = 8
    TabOrder = 1
  end
  object edVes_cist: TEdit
    Left = 117
    Top = 134
    Width = 54
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    Text = '0'
  end
  object Edit1: TEdit
    Left = 117
    Top = 113
    Width = 54
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object UpDown3: TUpDown
    Left = 171
    Top = 134
    Width = 16
    Height = 20
    Associate = edVes_cist
    Increment = 10
    TabOrder = 4
  end
  object UpDown4: TUpDown
    Left = 171
    Top = 113
    Width = 16
    Height = 20
    Associate = Edit1
    Increment = 10
    TabOrder = 5
  end
  object UpDown2: TUpDown
    Left = 171
    Top = 92
    Width = 16
    Height = 20
    Associate = edCapacity
    Increment = 10
    TabOrder = 6
  end
  object edCapacity: TEdit
    Left = 117
    Top = 92
    Width = 54
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object edAxes: TEdit
    Left = 117
    Top = 71
    Width = 27
    Height = 21
    TabOrder = 8
    Text = '0'
  end
  object UpDown1: TUpDown
    Left = 143
    Top = 71
    Width = 16
    Height = 20
    Associate = edAxes
    TabOrder = 9
  end
  object edCIS: TEdit
    Left = 117
    Top = 50
    Width = 27
    Height = 21
    TabOrder = 10
  end
  object lcVagontype: TRxDBLookupCombo
    Left = 117
    Top = 25
    Width = 145
    Height = 23
    DropDownCount = 8
    TabOrder = 11
  end
  object edNum_vagon: TEdit
    Left = 117
    Top = 4
    Width = 100
    Height = 21
    TabOrder = 12
  end
end
