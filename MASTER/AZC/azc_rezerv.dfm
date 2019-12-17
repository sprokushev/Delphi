object f_forAZC_Obj_rez: Tf_forAZC_Obj_rez
  Left = 407
  Top = 69
  Width = 254
  Height = 352
  Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 6
    Top = 1
    Width = 235
    Height = 320
    TabOrder = 0
    object Label1: TLabel
      Left = 64
      Top = 5
      Width = 96
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072
    end
    object Label2: TLabel
      Left = 32
      Top = 50
      Width = 35
      Height = 13
      Caption = #1054#1073#1098#1077#1084
    end
    object Label3: TLabel
      Left = 136
      Top = 52
      Width = 89
      Height = 13
      Caption = #1052#1077#1088#1090#1074#1099#1081' '#1086#1089#1090#1072#1090#1086#1082
    end
    object Label4: TLabel
      Left = 48
      Top = 94
      Width = 121
      Height = 13
      Alignment = taCenter
      Caption = #1052#1072#1082#1089#1080#1072#1084#1072#1083#1100#1085#1099#1081' '#1086#1073#1098#1077#1084
    end
    object Label5: TLabel
      Left = 75
      Top = 235
      Width = 61
      Height = 13
      Caption = #1057#1086#1073#1089#1074#1077#1085#1085#1080#1082
    end
    object Label6: TLabel
      Left = 75
      Top = 186
      Width = 68
      Height = 13
      Caption = #1058#1080#1087' '#1087#1088#1086#1076#1091#1082#1090#1072
    end
    object Label7: TLabel
      Left = 88
      Top = 140
      Width = 42
      Height = 13
      Alignment = taCenter
      Caption = #1055#1088#1086#1076#1091#1082#1090
    end
  end
  object e_max_vol: TRxCalcEdit
    Left = 11
    Top = 114
    Width = 225
    Height = 21
    AutoSize = False
    DisplayFormat = '0.##'
    NumGlyphs = 2
    TabOrder = 2
    OnChange = e_max_volChange
  end
  object e_dead: TRxCalcEdit
    Left = 144
    Top = 68
    Width = 89
    Height = 21
    AutoSize = False
    DisplayFormat = '0.##'
    NumGlyphs = 2
    TabOrder = 1
    ZeroEmpty = False
    OnChange = e_max_volChange
  end
  object LookUpProd: TRxLookupEdit
    Left = 11
    Top = 158
    Width = 225
    Height = 21
    LookupDisplay = 'NAME_NPR'
    LookupField = 'NAME_NPR'
    LookupSource = DS_PROD
    PopupOnlyLocate = False
    TabOrder = 3
  end
  object LookUp_type: TRxLookupEdit
    Left = 11
    Top = 207
    Width = 225
    Height = 21
    LookupDisplay = 'NAME'
    LookupField = 'NAME'
    LookupSource = DS_type
    PopupOnlyLocate = False
    TabOrder = 4
  end
  object LookUp_Sobst: TRxLookupEdit
    Left = 11
    Top = 258
    Width = 225
    Height = 21
    LookupDisplay = 'NAME'
    LookupField = 'NAME'
    LookupSource = DS_sobstv
    PopupOnlyLocate = False
    TabOrder = 5
  end
  object Button1: TButton
    Left = 11
    Top = 288
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 288
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 7
    OnClick = Button2Click
  end
  object e_vol: TRxCalcEdit
    Left = 11
    Top = 67
    Width = 89
    Height = 21
    AutoSize = False
    DisplayFormat = '0.##'
    NumGlyphs = 2
    TabOrder = 8
  end
  object e_num_rez: TEdit
    Left = 11
    Top = 24
    Width = 225
    Height = 21
    TabOrder = 9
  end
  object ODS_sobstv: TOracleDataSet
    SQL.Strings = (
      'select org_structure.rowid, org_structure.* from org_structure'
      'order by name')
    Left = 38
    Top = 4
  end
  object DS_sobstv: TDataSource
    DataSet = ODS_sobstv
    Left = 22
    Top = 204
  end
  object OQ_rezerv: TOracleQuery
    Left = 150
    Top = 20
  end
  object ODS_type: TOracleDataSet
    SQL.Strings = (
      'select kls_ar_tov.rowid,kls_ar_tov.* from kls_ar_tov')
    Left = 190
    Top = 276
  end
  object DS_type: TDataSource
    DataSet = ODS_type
    Left = 24
    Top = 248
  end
  object DS_PROD: TDataSource
    DataSet = ODS_PROD
    Left = 118
    Top = 300
  end
  object ODS_PROD: TOracleDataSet
    SQL.Strings = (
      'select KLS_PROD.ROWID, KLS_PROD.* from KLS_PROD, azc_prod_group'
      'where azc_prod_group.ID = kls_prod.AZC_PR_GRP_ID')
    Left = 24
    Top = 64
  end
end
