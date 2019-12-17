object SelectRootDlg: TSelectRootDlg
  Left = 241
  Top = 216
  Width = 319
  Height = 239
  BorderIcons = []
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1086#1088#1085#1077#1074#1086#1081' '#1101#1083#1077#1084#1077#1085#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBLookupList1: TRxDBLookupList
    Left = 0
    Top = 0
    Width = 225
    Height = 212
    Align = alLeft
    Ctl3D = True
    LookupField = 'name'
    LookupSource = DataSource1
    ParentCtl3D = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 232
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 112
    Top = 136
  end
  object ADOTable1: TADOTable
    Connection = f_MetaPlanSetup.DB
    CursorType = ctStatic
    Filter = 'master_id = null'
    Filtered = True
    TableName = 'organization'
    Left = 144
    Top = 136
    object ADOTable1name: TStringField
      FieldName = 'name'
      Size = 50
    end
    object ADOTable1organization_id: TIntegerField
      FieldName = 'organization_id'
    end
    object ADOTable1master_id: TIntegerField
      FieldName = 'master_id'
    end
    object ADOTable1hierarchy_id: TIntegerField
      FieldName = 'hierarchy_id'
    end
  end
end
