object f_OneSFNoOtgr: Tf_OneSFNoOtgr
  Left = 91
  Top = 191
  Width = 908
  Height = 377
  Caption = #1057#1095#1077#1090#1072' '#1073#1077#1079' '#1086#1090#1075#1088#1091#1079#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 312
    Top = 224
    Width = 68
    Height = 13
    Caption = 'PROD_NAME'
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 900
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object TBSubmenuItem1: TTBSubmenuItem
        Caption = #1057#1095#1077#1090#1072' '#1085#1072' '#1091#1089#1083#1091#1075#1080' '#1087#1086' '#1087#1077#1088#1077#1074#1086#1079#1082#1077
        DisplayMode = nbdmImageAndText
        Options = [tboDropdownArrow]
        object TBItem1: TTBItem
          Caption = #1046#1044' '#1058#1072#1088#1080#1092
          OnClick = TBItem1Click
        end
      end
      object TBItem2: TTBItem
        Caption = #1047#1072#1087#1080#1089#1072#1090#1100' <F9>'
        DisplayMode = nbdmImageAndText
        ImageIndex = 13
        ShortCut = 120
        OnClick = TBItem2Click
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 26
    Width = 900
    Height = 99
    Align = alTop
    Caption = ' '#1056#1077#1082#1074#1080#1079#1080#1090#1099' '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 15
      Width = 57
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089#1095#1077#1090#1072
    end
    object Label2: TLabel
      Left = 255
      Top = 55
      Width = 55
      Height = 13
      Caption = #8470' '#1091#1089#1083#1086#1074#1080#1103
    end
    object Label3: TLabel
      Left = 146
      Top = 15
      Width = 58
      Height = 13
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    end
    object Label4: TLabel
      Left = 8
      Top = 55
      Width = 61
      Height = 13
      Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
    end
    object lc_Predpr: TRxDBLookupCombo
      Left = 154
      Top = 31
      Width = 242
      Height = 21
      DropDownCount = 8
      DisplayEmpty = '<'#1053#1077' '#1074#1099#1073#1088#1072#1085'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'SHORT_NAME'
      LookupSource = ds_Predpr
      TabOrder = 0
      OnChange = lc_PredprChange
    end
    object lc_Dog: TRxDBLookupCombo
      Left = 18
      Top = 71
      Width = 233
      Height = 21
      DropDownCount = 8
      DataField = 'DOG_ID'
      DisplayEmpty = '<'#1053#1077' '#1074#1099#1073#1088#1072#1085'>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'DOG_NUMBER'
      LookupSource = ds_Dog
      TabOrder = 1
      OnChange = lc_DogChange
    end
    object lc_Usl_Dog: TRxDBLookupCombo
      Left = 266
      Top = 71
      Width = 377
      Height = 21
      DropDownCount = 8
      DataField = 'USL_NUMBER'
      DisplayEmpty = '<'#1053#1077' '#1074#1099#1073#1088#1072#1085'>'
      EmptyValue = '0'
      LookupField = 'USL_NUMBER'
      LookupDisplay = 'NAME_USL'
      LookupSource = ds_usl_dog
      TabOrder = 2
    end
    object e_DateVypSf: TDateTimePicker
      Left = 20
      Top = 31
      Width = 121
      Height = 21
      Date = 38387.465301747690000000
      Time = 38387.465301747690000000
      TabOrder = 3
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 125
    Width = 900
    Height = 225
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = ds_Temp_bill_pos
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        DropDownRows = 8
        DropDownShowTitles = True
        DropDownSizing = True
        EditButtons = <>
        FieldName = 'PROD_NAME'
        Footers = <>
        Width = 373
      end
      item
        EditButtons = <>
        FieldName = 'VES'
        Footers = <>
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'CENA_BN'
        Footers = <>
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'SUMMA_BN'
        Footers = <>
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'SUMMA_NDS20'
        Footers = <>
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'SUMMA'
        Footers = <>
        Width = 110
      end>
  end
  object ora_Session: TOracleSession
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    RollbackOnDisconnect = True
    Left = 692
    Top = 40
  end
  object t_Dog: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id,dog_number || '#39' '#1086#1090' '#39' || TO_CHAR(dog_date,'#39'dd.mm.rr'#39') A' +
        'S dog_number FROM kls_dog'
      'WHERE kls_dog.dog_year>=2005'
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000300000002000000494401000000000A000000444F475F4E554D4245
      52010000000008000000444F475F444154450100000000}
    QueryAllRecords = False
    Session = ora_Session
    BeforeOpen = t_DogBeforeOpen
    Left = 748
    Top = 40
    object t_DogID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object t_DogDOG_NUMBER: TStringField
      FieldName = 'DOG_NUMBER'
      Required = True
      Size = 30
    end
  end
  object ds_Dog: TDataSource
    DataSet = t_Dog
    Left = 748
    Top = 68
  end
  object t_Predpr: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT kls_predpr.id,kls_predpr.short_name '
      'FROM kls_predpr,kls_dog'
      'WHERE kls_predpr.id=kls_dog.predpr_id and kls_dog.DOG_YEAR>=2005'
      'ORDER BY 2')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A00000053484F52545F4E414D
      450100000000}
    QueryAllRecords = False
    Session = ora_Session
    Left = 776
    Top = 40
    object t_PredprID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object t_PredprSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 30
    end
  end
  object ds_Predpr: TDataSource
    DataSet = t_Predpr
    Left = 776
    Top = 68
  end
  object t_usl_dog: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  dog_id,'
      '  usl_number,'
      
        '  TO_CHAR(usl_number,'#39'00'#39') || '#39' - '#39' || usl_name || '#39' '#1086#1090#1089#1088#1086#1095#1082#1072' - ' +
        #39' || TO_CHAR(kol_dn) || '#39' '#1076#1085#39' AS name_usl'
      '  FROM usl_dog '
      'WHERE usl_akt=1 '
      ''
      'ORDER BY 2')
    QBEDefinition.QBEFieldDefs = {
      030000000300000006000000444F475F494401000000000A00000055534C5F4E
      554D4245520100000000080000004E414D455F55534C0100000000}
    QueryAllRecords = False
    Session = ora_Session
    BeforeOpen = t_usl_dogBeforeOpen
    Left = 804
    Top = 40
    object t_usl_dogDOG_ID: TIntegerField
      FieldName = 'DOG_ID'
      Required = True
    end
    object t_usl_dogUSL_NUMBER: TIntegerField
      FieldName = 'USL_NUMBER'
      Required = True
    end
    object t_usl_dogNAME_USL: TStringField
      FieldName = 'NAME_USL'
      Size = 136
    end
  end
  object ds_usl_dog: TDataSource
    DataSet = t_usl_dog
    Left = 804
    Top = 68
  end
  object t_Temp_bill_pos: TOracleDataSet
    SQL.Strings = (
      
        'SELECT v_temp_bill_pos.rowid,v_temp_bill_pos.* FROM v_temp_bill_' +
        'pos')
    QBEDefinition.QBEFieldDefs = {
      030000000C0000000D0000005445524D494E414C5F4E414D4501000000000B00
      00004F53555345525F4E414D450100000000070000004E4F4D5F444F4B010000
      00000B00000042494C4C5F504F535F4944010000000003000000564553010000
      00000700000043454E415F424E01000000000400000043454E41010000000008
      00000053554D4D415F424E01000000000B00000053554D4D415F414B43495A01
      000000000B00000053554D4D415F4E4453323001000000000500000053554D4D
      4101000000000B00000050524F445F49445F4E50520100000000}
    QueryAllRecords = False
    UpdatingTable = 'temp_bill_pos'
    Session = ora_Session
    Left = 832
    Top = 40
    object t_Temp_bill_posTERMINAL_NAME: TStringField
      FieldName = 'TERMINAL_NAME'
      Size = 30
    end
    object t_Temp_bill_posOSUSER_NAME: TStringField
      FieldName = 'OSUSER_NAME'
      Size = 30
    end
    object t_Temp_bill_posNOM_DOK: TIntegerField
      FieldName = 'NOM_DOK'
    end
    object t_Temp_bill_posBILL_POS_ID: TIntegerField
      FieldName = 'BILL_POS_ID'
    end
    object t_Temp_bill_posVES: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'VES'
      OnChange = t_Temp_bill_posVESChange
      DisplayFormat = '#0.000'
    end
    object t_Temp_bill_posCENA_BN: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'CENA_BN'
      OnChange = t_Temp_bill_posVESChange
      DisplayFormat = '#0.00'
    end
    object t_Temp_bill_posCENA: TFloatField
      FieldName = 'CENA'
    end
    object t_Temp_bill_posSUMMA_BN: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA_BN'
      OnChange = t_Temp_bill_posSUMMA_BNChange
      DisplayFormat = '#0.00'
    end
    object t_Temp_bill_posSUMMA_AKCIZ: TFloatField
      FieldName = 'SUMMA_AKCIZ'
    end
    object t_Temp_bill_posSUMMA_NDS20: TFloatField
      DisplayLabel = #1053#1044#1057
      FieldName = 'SUMMA_NDS20'
      ReadOnly = True
      DisplayFormat = '#0.00'
    end
    object t_Temp_bill_posSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
      FieldName = 'SUMMA'
      ReadOnly = True
      DisplayFormat = '#0.00'
    end
    object t_Temp_bill_posPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Size = 5
    end
    object t_Temp_bill_posPROD_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084' '#1091#1089#1083#1091#1075#1080
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'PROD_NAME'
      LookupDataSet = t_Prod
      LookupKeyFields = 'ID_NPR'
      LookupResultField = 'LONG_NAME_NPR'
      KeyFields = 'PROD_ID_NPR'
      Size = 30
      Lookup = True
    end
  end
  object ds_Temp_bill_pos: TDataSource
    DataSet = t_Temp_bill_pos
    Left = 832
    Top = 68
  end
  object t_Prod: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id_npr,NAME_NPR AS long_name_npr FROM kls_prod WHERE id_n' +
        'pr<='#39'10100'#39' -- bill_pos is not null')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E505201000000000D0000004C4F4E475F
      4E414D455F4E50520100000000}
    QueryAllRecords = False
    Session = ora_Session
    Left = 860
    Top = 40
    object t_ProdID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object t_ProdLONG_NAME_NPR: TStringField
      FieldName = 'LONG_NAME_NPR'
      Required = True
      Size = 40
    end
  end
  object ds_Prod: TDataSource
    DataSet = t_Prod
    Left = 860
    Top = 68
  end
  object op_ForBills: TOraclePackage
    Session = ora_Session
    PackageName = 'for_bills'
    Left = 692
    Top = 68
  end
end
