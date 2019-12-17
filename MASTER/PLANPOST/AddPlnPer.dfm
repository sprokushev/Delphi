object F_AddPlanPer: TF_AddPlanPer
  Left = 426
  Top = 228
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1087#1083#1072#1085#1086#1074#1086#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 177
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 35
    Width = 21
    Height = 13
    Caption = #1043#1086#1076':'
  end
  object Label2: TLabel
    Left = 134
    Top = 36
    Width = 33
    Height = 13
    Caption = #1052#1077#1089#1103#1094
  end
  object Label6: TLabel
    Left = 8
    Top = 8
    Width = 29
    Height = 13
    Caption = #1055#1083#1072#1085':'
  end
  object e_year: TMaskEdit
    Left = 40
    Top = 32
    Width = 37
    Height = 21
    EditMask = '!0000;1; '
    MaxLength = 4
    TabOrder = 0
    Text = '1'#160'990'
  end
  object e_month: TComboBox
    Left = 176
    Top = 32
    Width = 113
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = #1071#1085#1074#1072#1088#1100
    Items.Strings = (
      #1071#1085#1074#1072#1088#1100
      #1060#1077#1074#1088#1072#1083#1100
      #1052#1072#1088#1090
      #1040#1087#1088#1077#1083#1100
      #1052#1072#1081
      #1048#1102#1085#1100
      #1048#1102#1083#1100
      #1040#1074#1075#1091#1089#1090
      #1057#1077#1085#1090#1103#1073#1088#1100
      #1054#1082#1090#1103#1073#1088#1100
      #1053#1086#1103#1073#1088#1100
      #1044#1077#1082#1072#1073#1088#1100)
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 56
    Width = 289
    Height = 81
    Caption = ' '#1055#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103' '
    TabOrder = 2
    object Label4: TLabel
      Left = 17
      Top = 26
      Width = 38
      Height = 13
      Caption = #1057' '#1076#1072#1090#1099':'
    end
    object Label5: TLabel
      Left = 13
      Top = 51
      Width = 42
      Height = 13
      Caption = #1055#1086' '#1076#1072#1090#1091':'
    end
    object e_BegDate: TDateTimePicker
      Left = 64
      Top = 24
      Width = 186
      Height = 21
      Date = 37286.407412442100000000
      Time = 37286.407412442100000000
      TabOrder = 0
    end
    object e_EndDate: TDateTimePicker
      Left = 64
      Top = 48
      Width = 186
      Height = 21
      Date = 37286.407412442100000000
      Time = 37286.407412442100000000
      TabOrder = 1
    end
  end
  object lc_Plan: TRxDBLookupCombo
    Left = 40
    Top = 4
    Width = 249
    Height = 21
    DropDownCount = 8
    Enabled = False
    LookupField = 'ID'
    LookupDisplay = 'PLAN_NAME'
    LookupSource = ds_Plan
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 144
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 144
    Width = 75
    Height = 25
    TabOrder = 5
    Kind = bkCancel
  end
  object ud_year: TUpDown
    Left = 77
    Top = 32
    Width = 15
    Height = 21
    Associate = e_year
    Min = 1990
    Max = 3000
    Position = 1990
    TabOrder = 6
  end
  object q_Plan: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_PLAN')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      0300000002000000020000004944010000000009000000504C414E5F4E414D45
      0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = f_main.ora_Session
    DesignActivation = False
    Active = False
    Left = 176
    Top = 72
  end
  object ds_Plan: TDataSource
    DataSet = q_Plan
    Left = 208
    Top = 72
  end
  object q_Tmp: TOracleDataSet
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = f_main.ora_Session
    DesignActivation = False
    Active = False
    Left = 72
    Top = 80
  end
  object ora_Package: TOraclePackage
    Session = f_main.ora_Session
    Debug = False
    PackageName = 'FOR_PLANPOST'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 272
    Top = 64
  end
end
