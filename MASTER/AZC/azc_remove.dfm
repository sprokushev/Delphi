inherited f_forAZCRemove: Tf_forAZCRemove
  Left = 324
  Top = 218
  AutoScroll = False
  Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1077#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077
  ClientHeight = 381
  ClientWidth = 463
  DefaultMonitor = dmDesktop
  FormStyle = fsMDIForm
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 8
    Width = 417
    Height = 369
    Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1077#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 152
      Width = 401
      Height = 65
      Caption = #1054#1089#1090#1072#1090#1082#1080
      TabOrder = 0
      object Label1: TLabel
        Left = 32
        Top = 40
        Width = 19
        Height = 13
        Caption = #1042#1077#1089
      end
      object Label2: TLabel
        Left = 24
        Top = 16
        Width = 35
        Height = 13
        Caption = #1054#1073#1098#1077#1084
      end
      object Edit1: TEdit
        Left = 72
        Top = 36
        Width = 73
        Height = 21
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 0
        Text = 'Edit1'
      end
      object Edit2: TEdit
        Left = 72
        Top = 12
        Width = 73
        Height = 21
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 1
        Text = 'Edit2'
      end
      object Edit3: TEdit
        Left = 312
        Top = 12
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 2
        Text = 'Edit3'
      end
      object Edit4: TEdit
        Left = 312
        Top = 36
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 3
        Text = 'Edit4'
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 80
      Width = 401
      Height = 73
      Caption = #1055#1088#1086#1076#1091#1082#1090
      TabOrder = 1
      object Label8: TLabel
        Left = 8
        Top = 32
        Width = 80
        Height = 13
        Caption = #1052#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080
      end
      object rx_rpod: TRxLookupEdit
        Left = 66
        Top = 8
        Width = 209
        Height = 21
        LookupDisplay = 'NAME_NPR'
        LookupDisplayIndex = 1
        LookupField = 'NAME_NPR'
        LookupSource = Ds_oil
        TabOrder = 0
        Text = 'rx_rpod'
        OnCloseUp = rx_rpodCloseUp
      end
      object rx_place: TRxLookupEdit
        Left = 66
        Top = 48
        Width = 209
        Height = 21
        LookupDisplay = 'NAME'
        LookupDisplayIndex = 1
        LookupField = 'NAME'
        LookupSource = DS_place
        TabOrder = 1
        Text = 'rx_rpod'
        OnCloseUp = rx_rpodCloseUp
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 16
      Width = 401
      Height = 57
      Caption = #1054#1073#1098#1077#1082#1090#1099
      TabOrder = 2
      object Label3: TLabel
        Left = 64
        Top = 15
        Width = 52
        Height = 13
        Caption = #1055#1086#1089#1090#1072#1097#1080#1082
      end
      object Label4: TLabel
        Left = 280
        Top = 16
        Width = 59
        Height = 13
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      end
      object Rx_azc_from: TRxLookupEdit
        Left = 8
        Top = 28
        Width = 161
        Height = 21
        LookupDisplay = 'NAME_ORG'
        LookupDisplayIndex = 1
        LookupField = 'NAME_ORG'
        LookupSource = DS_oil_from
        PopupOnlyLocate = False
        TabOrder = 0
        Text = 'Rx_azc_from'
        OnCloseUp = rx_rpodCloseUp
      end
      object rx_azc_to: TRxLookupEdit
        Left = 224
        Top = 28
        Width = 169
        Height = 21
        LookupDisplay = 'NAME_ORG'
        LookupDisplayIndex = 1
        LookupField = 'NAME_ORG'
        LookupSource = DS_oil_to
        PopupOnlyLocate = False
        TabOrder = 1
        Text = 'rx_azc_to'
        OnCloseUp = rx_rpodCloseUp
      end
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 216
      Width = 401
      Height = 65
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
      TabOrder = 3
      object Label5: TLabel
        Left = 45
        Top = 43
        Width = 19
        Height = 13
        Caption = #1042#1077#1089
      end
      object Label6: TLabel
        Left = 28
        Top = 19
        Width = 35
        Height = 13
        Caption = #1054#1073#1098#1077#1084
      end
      object Edit9: TEdit
        Left = 72
        Top = 16
        Width = 65
        Height = 21
        TabOrder = 0
        Text = 'Edit9'
      end
      object Edit10: TEdit
        Left = 72
        Top = 40
        Width = 65
        Height = 21
        TabOrder = 1
        Text = 'Edit10'
      end
      object Edit11: TEdit
        Left = 312
        Top = 16
        Width = 73
        Height = 21
        TabOrder = 2
        Text = 'Edit11'
      end
      object Edit12: TEdit
        Left = 312
        Top = 40
        Width = 73
        Height = 21
        TabOrder = 3
        Text = 'Edit12'
      end
      object Edit5: TEdit
        Left = 144
        Top = 16
        Width = 49
        Height = 21
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 4
        Text = 'Edit5'
        Visible = False
      end
      object Edit6: TEdit
        Left = 144
        Top = 39
        Width = 49
        Height = 21
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 5
        Text = 'Edit5'
        Visible = False
      end
      object Edit7: TEdit
        Left = 257
        Top = 15
        Width = 49
        Height = 21
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 6
        Text = 'Edit5'
        Visible = False
      end
      object Edit8: TEdit
        Left = 256
        Top = 40
        Width = 49
        Height = 21
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 7
        Text = 'Edit5'
        Visible = False
      end
    end
    object bt_remove: TButton
      Left = 16
      Top = 340
      Width = 75
      Height = 25
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
      TabOrder = 4
      OnClick = bt_removeClick
    end
    object bt_cancel: TButton
      Left = 336
      Top = 340
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 5
    end
    object GroupBox6: TGroupBox
      Left = 8
      Top = 286
      Width = 401
      Height = 51
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      TabOrder = 6
      object Label7: TLabel
        Left = 208
        Top = 16
        Width = 77
        Height = 13
        Caption = #1044#1072#1090#1072' '#1086#1087#1077#1088#1072#1094#1080#1080
      end
      object dt_date: TDateEdit
        Left = 296
        Top = 12
        Width = 97
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object chb_ves_vol: TCheckBox
        Left = 16
        Top = 16
        Width = 145
        Height = 17
        Caption = #1057#1080#1090#1091#1072#1094#1080#1103': '#1074#1077#1089'->'#1086#1073#1098#1077#1084
        TabOrder = 1
        OnClick = chb_ves_volClick
      end
      object chb_parus: TCheckBox
        Left = 104
        Top = 32
        Width = 193
        Height = 17
        Caption = #1057#1080#1090#1091#1072#1094#1080#1103': '#1040#1047#1057'->'#1080#1084#1087#1086#1088#1090' '#1080#1079' '#1055#1072#1088#1091#1089#1072
        TabOrder = 2
      end
    end
  end
  object bt_test: TButton
    Left = 192
    Top = 346
    Width = 89
    Height = 25
    BiDiMode = bdLeftToRight
    Caption = #1058#1077#1089#1090
    ParentBiDiMode = False
    TabOrder = 1
    OnClick = bt_testClick
  end
  object ODS_oil_from: TOracleDataSet
    SQL.Strings = (
      'select * from v_azc_org where id_parent_org=31')
    QBEDefinition.QBEFieldDefs = {
      03000000040000000600000049445F4F52470100000000080000004E414D455F
      4F524701000000000D00000049445F504152454E545F4F524701000000000B00
      000049445F4F52475F545950450100000000}
    Session = f_main.ora_Session
    Left = 8
    Top = 24
    object ODS_oil_fromID_ORG: TFloatField
      FieldName = 'ID_ORG'
      Required = True
    end
    object ODS_oil_fromNAME_ORG: TStringField
      FieldName = 'NAME_ORG'
      Required = True
      Size = 100
    end
    object ODS_oil_fromID_PARENT_ORG: TFloatField
      FieldName = 'ID_PARENT_ORG'
    end
    object ODS_oil_fromID_ORG_TYPE: TFloatField
      FieldName = 'ID_ORG_TYPE'
    end
  end
  object ODS_oil_to: TOracleDataSet
    SQL.Strings = (
      'select * from v_azc_org where id_parent_org=31'
      '')
    QBEDefinition.QBEFieldDefs = {
      03000000040000000600000049445F4F52470100000000080000004E414D455F
      4F524701000000000D00000049445F504152454E545F4F524701000000000B00
      000049445F4F52475F545950450100000000}
    Session = f_main.ora_Session
    Left = 16
    Top = 256
    object ODS_oil_toID_ORG: TFloatField
      FieldName = 'ID_ORG'
      Required = True
    end
    object ODS_oil_toNAME_ORG: TStringField
      FieldName = 'NAME_ORG'
      Required = True
      Size = 100
    end
    object ODS_oil_toID_PARENT_ORG: TFloatField
      FieldName = 'ID_PARENT_ORG'
    end
    object ODS_oil_toID_ORG_TYPE: TFloatField
      FieldName = 'ID_ORG_TYPE'
    end
  end
  object DS_oil_from: TDataSource
    DataSet = ODS_oil_from
    Left = 8
    Top = 64
  end
  object DS_oil_to: TDataSource
    DataSet = ODS_oil_to
    Left = 8
    Top = 224
  end
  object ODS_oil: TOracleDataSet
    SQL.Strings = (
      
        'select kls_prod.rowid, kls_prod.ID_npr, kls_prod.ID_GROUP_NPR, k' +
        'ls_prod.NAME_NPR, kls_prod.AZC_PR_GRP_ID'
      'from kls_prod  where '
      '--kls_prod.ID_GROUP_NPR <>'#39'00000'#39' and '
      'kls_prod.AZC_PR_GRP_ID is not null'
      'order by kls_prod.name_npr'
      '')
    QBEDefinition.QBEFieldDefs = {
      03000000040000000600000049445F4E505201000000000C00000049445F4752
      4F55505F4E50520100000000080000004E414D455F4E505201000000000D0000
      00415A435F50525F4752505F49440100000000}
    Session = f_main.ora_Session
    Left = 8
    Top = 192
    object ODS_oilID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object ODS_oilID_GROUP_NPR: TStringField
      FieldName = 'ID_GROUP_NPR'
      Required = True
      Size = 5
    end
    object ODS_oilNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
    object ODS_oilAZC_PR_GRP_ID: TFloatField
      FieldName = 'AZC_PR_GRP_ID'
    end
  end
  object Ds_oil: TDataSource
    DataSet = ODS_oil
    Left = 8
    Top = 160
  end
  object OQ_oil_from: TOracleQuery
    Session = f_main.ora_Session
    Left = 8
    Top = 96
  end
  object oq_oil_to: TOracleQuery
    Session = f_main.ora_Session
    Left = 8
    Top = 128
  end
  object FormPlacement1: TFormPlacement
    MinMaxInfo.MaxSizeHeight = 403
    MinMaxInfo.MaxSizeWidth = 468
    MinMaxInfo.MaxTrackHeight = 403
    MinMaxInfo.MaxTrackWidth = 468
    MinMaxInfo.MinTrackHeight = 403
    MinMaxInfo.MinTrackWidth = 468
    UseRegistry = True
    Left = 224
    Top = 56
  end
  object ODS_place: TOracleDataSet
    SQL.Strings = (
      'select A.* '
      'from azc_place_send A'
      'order by A.name')
    QBEDefinition.QBEFieldDefs = {
      03000000030000000200000049440100000000040000004E414D450100000000
      0B0000004F52475F535452555F49440100000000}
    Session = f_main.ora_Session
    Left = 8
    Top = 288
    object ODS_placeID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_placeNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
  end
  object DS_place: TDataSource
    DataSet = ODS_place
    Left = 8
    Top = 320
  end
end
