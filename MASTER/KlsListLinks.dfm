object f_KlsListLinks: Tf_KlsListLinks
  Left = 372
  Top = 159
  BorderStyle = bsSingle
  Caption = #1040#1089#1089#1086#1094#1080#1072#1094#1080#1080' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074
  ClientHeight = 408
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 408
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 0
    object ll_kls: TDBLookupListBox
      Left = 0
      Top = 0
      Width = 433
      Height = 407
      Align = alClient
      KeyField = 'ID'
      ListField = 'CAPTION'
      ListSource = ds_rep
      TabOrder = 0
      OnDblClick = ll_klsDblClick
    end
  end
  object ds_rep: TDataSource
    DataSet = q_kls
    Left = 144
    Top = 40
  end
  object q_kls: TOracleDataSet
    SQL.Strings = (
      'SELECT A.*'
      'FROM master_links_structure A'
      'ORDER BY sortby')
    QBEDefinition.QBEFieldDefs = {
      030000000A00000002000000494401000000000700000043415054494F4E0100
      0000000A0000005441424C455F4C494E4B01000000000D0000005441424C455F
      4C494E4B5F504B01000000000F0000005441424C455F4C494E4B5F5459504501
      00000000110000005441424C455F4C494E4B5F4F4E455F504B01000000000900
      00005441424C455F4F4E450100000000120000005441424C455F4F4E455F504F
      534954494F4E0100000000110000005441424C455F4C494E4B5F54574F5F504B
      0100000000090000005441424C455F54574F0100000000}
    Session = f_main.ora_Session
    Left = 88
    Top = 40
    object q_klsID: TStringField
      FieldName = 'ID'
      Required = True
      Size = 50
    end
    object q_klsCAPTION: TStringField
      FieldName = 'CAPTION'
      Required = True
      Size = 100
    end
    object q_klsTABLE_LINK: TStringField
      FieldName = 'TABLE_LINK'
      Required = True
      Size = 50
    end
    object q_klsTABLE_LINK_PK: TStringField
      FieldName = 'TABLE_LINK_PK'
      Required = True
      Size = 15
    end
    object q_klsTABLE_LINK_TYPE: TStringField
      FieldName = 'TABLE_LINK_TYPE'
      Required = True
      Size = 3
    end
    object q_klsTABLE_LINK_ONE_PK: TStringField
      FieldName = 'TABLE_LINK_ONE_PK'
      Required = True
      Size = 15
    end
    object q_klsTABLE_ONE: TStringField
      FieldName = 'TABLE_ONE'
      Required = True
      Size = 50
    end
    object q_klsTABLE_LINK_TWO_PK: TStringField
      FieldName = 'TABLE_LINK_TWO_PK'
      Required = True
      Size = 15
    end
    object q_klsTABLE_TWO: TStringField
      FieldName = 'TABLE_TWO'
      Required = True
      Size = 50
    end
  end
end
