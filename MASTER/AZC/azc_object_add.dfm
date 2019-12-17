object f_forAZC_object_add: Tf_forAZC_object_add
  Left = 318
  Top = 186
  Cursor = crDrag
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1086#1073#1098#1077#1082#1090#1072
  ClientHeight = 299
  ClientWidth = 574
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
    Left = 0
    Top = 0
    Width = 574
    Height = 299
    Align = alClient
    TabOrder = 2
    object lb_org: TLabel
      Left = 14
      Top = 33
      Width = 96
      Height = 13
      Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077':'
    end
    object lb_adr: TLabel
      Left = 76
      Top = 81
      Width = 34
      Height = 13
      Caption = #1040#1076#1088#1077#1089':'
    end
    object lb_note: TLabel
      Left = 28
      Top = 105
      Width = 83
      Height = 13
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086':'
    end
    object lb_type: TLabel
      Left = 42
      Top = 152
      Width = 69
      Height = 13
      Caption = #1058#1080#1087' '#1054#1073#1098#1077#1082#1090#1072':'
    end
    object lb_kind: TLabel
      Left = 44
      Top = 129
      Width = 67
      Height = 13
      Caption = #1042#1080#1076' '#1086#1073#1098#1077#1082#1090#1072':'
    end
    object Label2: TLabel
      Left = 89
      Top = 176
      Width = 22
      Height = 13
      Caption = #1062#1077#1093':'
    end
    object Label3: TLabel
      Left = 242
      Top = 176
      Width = 27
      Height = 13
      Caption = #1048#1053#1053':'
    end
    object Label1: TLabel
      Left = 19
      Top = 9
      Width = 92
      Height = 13
      Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077':'
    end
    object Label4: TLabel
      Left = 36
      Top = 57
      Width = 74
      Height = 13
      Caption = #1040#1073#1073#1088#1077#1074#1080#1072#1090#1091#1088#1072':'
    end
    object Button2: TButton
      Left = 404
      Top = 254
      Width = 75
      Height = 25
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 116
      Top = 258
      Width = 75
      Height = 25
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object ed_workshop: TDBEditEh
      Left = 115
      Top = 173
      Width = 118
      Height = 21
      DataField = 'WORKSHOP'
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object ed_INN: TDBEditEh
      Left = 275
      Top = 173
      Width = 118
      Height = 21
      DataField = 'INN'
      EditButtons = <>
      TabOrder = 3
      Visible = True
    end
    object ed_abbr: TDBEditEh
      Left = 115
      Top = 53
      Width = 430
      Height = 21
      DataField = 'ABBR'
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
    object ed_adress: TDBEditEh
      Left = 115
      Top = 77
      Width = 430
      Height = 21
      DataField = 'ADRESS'
      EditButtons = <>
      TabOrder = 5
      Visible = True
    end
    object ed_note: TDBEditEh
      Left = 115
      Top = 101
      Width = 430
      Height = 21
      DataField = 'NOTE'
      EditButtons = <>
      TabOrder = 6
      Visible = True
    end
    object LU_azc_obj_kind: TRxLookupEdit
      Left = 115
      Top = 125
      Width = 430
      Height = 21
      LookupDisplay = 'NAME'
      LookupField = 'ID'
      LookupSource = DS_azc_obj_kind_a
      TabOrder = 7
      OnCloseUp = LU_azc_obj_kindCloseUp
      OnChange = LU_azc_obj_kindChange
    end
    object LU_azc_obj_type: TRxLookupEdit
      Left = 115
      Top = 149
      Width = 430
      Height = 21
      LookupDisplay = 'NAME'
      LookupField = 'ID'
      LookupSource = DS_azc_obj_type_a
      TabOrder = 8
      OnCloseUp = LU_azc_obj_typeCloseUp
      OnChange = LU_azc_obj_typeChange
    end
    object ed_name: TDBEditEh
      Left = 115
      Top = 29
      Width = 430
      Height = 21
      DataField = 'NAME'
      EditButtons = <>
      TabOrder = 9
      Visible = True
    end
    object ed_fullname: TDBEditEh
      Left = 115
      Top = 5
      Width = 430
      Height = 21
      DataField = 'FULL_NAME'
      EditButtons = <>
      TabOrder = 10
      Visible = True
    end
  end
  object ChB_relation: TCheckBox
    Left = 20
    Top = 200
    Width = 185
    Height = 17
    Caption = #1057#1074#1103#1079#1100' '#1089' '#1076#1088#1091#1075#1080#1084' '#1086#1073#1098#1077#1082#1090#1086#1084
    TabOrder = 0
    OnClick = ChB_relationClick
  end
  object LU_azc_obj_obj: TRxLookupEdit
    Left = 115
    Top = 218
    Width = 430
    Height = 21
    LookupField = 'NAME'
    PopupOnlyLocate = False
    Enabled = False
    TabOrder = 1
    OnCloseUp = LU_azc_obj_objCloseUp
    OnChange = LU_azc_obj_objChange
  end
  object ODS_azc_kind_a: TOracleDataSet
    SQL.Strings = (
      'SELECT kls_org_kind.rowid, kls_org_kind.*  FROM KLS_ORG_KIND'
      'order by NAME'
      '')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Left = 232
    Top = 104
  end
  object ODS_azc_type_a: TOracleDataSet
    SQL.Strings = (
      'SELECT KLS_ORG_TYPE.rowid, KLS_ORG_TYPE.*  FROM KLS_ORG_TYPE'
      'ORDER BY NAME')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Left = 456
    Top = 136
  end
  object DS_azc_obj_kind_a: TDataSource
    DataSet = ODS_azc_kind_a
    Left = 304
    Top = 104
  end
  object DS_azc_obj_type_a: TDataSource
    DataSet = ODS_azc_type_a
    Left = 392
    Top = 104
  end
  object OQ_azc_add_obj: TOracleQuery
    Left = 464
    Top = 192
  end
  object ODS_azc_relations: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM dual where dummy<>'#39'X'#39)
    QBEDefinition.QBEFieldDefs = {03000000010000000500000044554D4D590100000000}
    Left = 208
    Top = 198
  end
  object DS_azc_relations: TDataSource
    DataSet = ODS_azc_relations
    Left = 280
    Top = 198
  end
end
