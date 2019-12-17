object f_forAZC_tarifadd: Tf_forAZC_tarifadd
  Left = 254
  Top = 372
  Width = 440
  Height = 334
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100
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
  object Label4: TLabel
    Left = 360
    Top = 128
    Width = 33
    Height = 13
    Caption = #1058#1072#1088#1080#1092
  end
  object Button1: TButton
    Left = 256
    Top = 272
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 344
    Top = 272
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 409
    Height = 65
    Caption = #1057#1082#1083#1072#1076' '#1086#1090#1075#1088#1091#1079#1082#1080
    TabOrder = 2
    object RX_sklad_from: TRxLookupEdit
      Left = 16
      Top = 24
      Width = 385
      Height = 21
      LookupField = 'AZS_NUMBER'
      LookupSource = DS_sklad_from
      Color = clMoneyGreen
      TabOrder = 0
      Text = 'RX_sklad_from'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 80
    Width = 409
    Height = 65
    Caption = #1057#1082#1083#1072#1076' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
    TabOrder = 3
    object RX_sklad_to: TRxLookupEdit
      Left = 16
      Top = 24
      Width = 385
      Height = 21
      LookupField = 'AZS_NUMBER'
      LookupSource = DS_sklad_to
      Color = clMoneyGreen
      TabOrder = 0
      Text = 'RX_sklad_from'
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 152
    Width = 409
    Height = 65
    Caption = #1043#1088#1091#1079#1086#1087#1077#1088#1077#1074#1086#1079#1095#1080#1082
    TabOrder = 4
    object RX_agent: TRxLookupEdit
      Left = 16
      Top = 24
      Width = 385
      Height = 21
      LookupField = 'AGNABBR'
      LookupSource = DS_agent
      Color = clMoneyGreen
      TabOrder = 0
      Text = 'RX_sklad_from'
    end
    object GroupBox5: TGroupBox
      Left = 168
      Top = 64
      Width = 185
      Height = 105
      Caption = 'GroupBox5'
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 224
    Width = 137
    Height = 65
    Caption = #1058#1072#1088#1080#1092
    TabOrder = 5
    object rb_vol: TRadioButton
      Left = 8
      Top = 16
      Width = 65
      Height = 17
      Caption = #1054#1073#1098#1077#1084
      TabOrder = 0
    end
    object rb_ves: TRadioButton
      Left = 72
      Top = 16
      Width = 49
      Height = 17
      Caption = #1042#1077#1089
      Color = clInactiveBorder
      ParentColor = False
      TabOrder = 1
    end
    object ed_tarif: TEdit
      Left = 8
      Top = 40
      Width = 121
      Height = 21
      Color = clMoneyGreen
      TabOrder = 2
    end
  end
  object GroupBox6: TGroupBox
    Left = 152
    Top = 224
    Width = 129
    Height = 41
    Caption = #1044#1080#1089#1090#1072#1085#1094#1080#1103
    TabOrder = 6
    object ed_distance: TEdit
      Left = 24
      Top = 16
      Width = 89
      Height = 21
      Color = clMoneyGreen
      TabOrder = 0
      Text = 'ed_distance'
    end
  end
  object GroupBox7: TGroupBox
    Left = 288
    Top = 224
    Width = 129
    Height = 41
    Caption = #1044#1072#1090#1072
    TabOrder = 7
    object dt_date: TDateEdit
      Left = 16
      Top = 16
      Width = 105
      Height = 21
      Color = clMoneyGreen
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object ODS_sklad_from: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM AZSAZSLISTMT@oracle'
      'WHERE'
      'company = 2'
      'order by AZS_NUMBER')
    QBEDefinition.QBEFieldDefs = {
      030000000C00000002000000524E010000000007000000434F4D50414E590100
      0000000300000043524E01000000000A000000415A535F4E554D424552010000
      000008000000415A535F4E414D45010000000009000000415A535F4147454E54
      010000000007000000415A535F50424501000000000B000000415A535F414444
      5245535301000000000A00000053544F52455F54595045010000000008000000
      43555252454E435901000000000A0000004445504152544D454E540100000000
      090000004C4F434B5F5349474E0100000000}
    Session = f_main.ora_Session
    Left = 272
    Top = 8
    object ODS_sklad_fromRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object ODS_sklad_fromAZS_NUMBER: TStringField
      FieldName = 'AZS_NUMBER'
      Required = True
    end
    object ODS_sklad_fromAZS_NAME: TStringField
      FieldName = 'AZS_NAME'
      Required = True
      Size = 80
    end
  end
  object DS_sklad_from: TDataSource
    DataSet = ODS_sklad_from
    Left = 272
    Top = 40
  end
  object ODS_sklad_to: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM AZSAZSLISTMT@oracle'
      'WHERE'
      'company = 2'
      'order by AZS_NUMBER')
    QBEDefinition.QBEFieldDefs = {
      030000000C00000002000000524E010000000007000000434F4D50414E590100
      0000000300000043524E01000000000A000000415A535F4E554D424552010000
      000008000000415A535F4E414D45010000000009000000415A535F4147454E54
      010000000007000000415A535F50424501000000000B000000415A535F414444
      5245535301000000000A00000053544F52455F54595045010000000008000000
      43555252454E435901000000000A0000004445504152544D454E540100000000
      090000004C4F434B5F5349474E0100000000}
    Session = f_main.ora_Session
    Left = 312
    Top = 8
    object FloatField1: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'AZS_NUMBER'
      Required = True
    end
    object StringField2: TStringField
      FieldName = 'AZS_NAME'
      Required = True
      Size = 80
    end
  end
  object DS_sklad_to: TDataSource
    DataSet = ODS_sklad_to
    Left = 312
    Top = 40
  end
  object ODS_agent: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM agnlist@oracle'
      '--WHERE'
      '--crn = 66950008'
      '--OR  crn = 66726461 '
      'order by AGNABBR')
    QBEDefinition.QBEFieldDefs = {
      030000003600000002000000524E01000000000300000043524E010000000007
      00000056455253494F4E01000000000700000041474E41424252010000000007
      00000041474E5459504501000000000700000041474E4E414D45010000000009
      00000041474E49444E554D4201000000000800000045434F4E434F4445010000
      0000070000004F5247434F444501000000000D00000041474E46414D494C594E
      414D4501000000000C00000041474E46495253544E414D4501000000000B0000
      0041474E4C4153544E414D45010000000003000000454D500100000000070000
      00454D50504F535401000000000700000041474E4255524E01000000000F0000
      00414444525F434F554E5452595F524E01000000000B000000414444525F5245
      475F524E010000000010000000414444525F44495354524943545F524E010000
      00000C000000414444525F434954595F524E01000000000B000000414444525F
      53545245455401000000000A000000414444525F484F55534501000000000A00
      0000414444525F424C4F434B010000000009000000414444525F464C41540100
      00000009000000414444525F504F535401000000000500000050484F4E450100
      0000000600000050484F4E453201000000000300000046415801000000000500
      000054454C45580100000000040000004D41494C01000000000C000000504153
      53504F52545F53455201000000000D00000050415353504F52545F4E554D4201
      000000000D00000050415353504F52545F5748454E01000000000C0000005041
      5353504F52545F57484F01000000000E000000414444525F5354524545545F52
      4E01000000000B00000041474E5F434F4D4D454E540100000000080000004449
      53434441544501000000001000000041474E46414D494C594E414D455F544F01
      000000000F00000041474E46495253544E414D455F544F01000000000E000000
      41474E4C4153544E414D455F544F01000000001000000041474E46414D494C59
      4E414D455F465201000000000F00000041474E46495253544E414D455F465201
      000000000E00000041474E4C4153544E414D455F465201000000000B0000004E
      415445434F4E5345435401000000000B00000047454F47524146595F524E0100
      0000000F000000414444525F4D554E49435F4449535401000000000F00000041
      4444525F41444D494E5F4449535401000000000300000053455801000000000B
      00000050454E53494F4E5F4E425201000000000D00000050415353504F52545F
      5459504501000000000C000000454D50504F53545F46524F4D01000000000A00
      0000454D50504F53545F544F01000000000800000050524F50464F524D010000
      00000B000000524541534F4E5F434F444501000000000D000000524553494445
      4E545F5349474E0100000000}
    Session = f_main.ora_Session
    Left = 280
    Top = 96
    object ODS_agentRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object ODS_agentAGNABBR: TStringField
      FieldName = 'AGNABBR'
      Required = True
    end
    object ODS_agentAGNNAME: TStringField
      FieldName = 'AGNNAME'
      Required = True
      Size = 160
    end
  end
  object DS_agent: TDataSource
    DataSet = ODS_agent
    Left = 280
    Top = 136
  end
  object OQ_SQL: TOracleQuery
    Session = f_main.ora_Session
    Left = 152
    Top = 80
  end
end
