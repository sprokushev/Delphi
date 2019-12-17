object f_NewSFAsker: Tf_NewSFAsker
  Left = 436
  Top = 184
  BorderStyle = bsDialog
  Caption = #1044#1072#1090#1072' '#1089#1095#1077#1090#1072
  ClientHeight = 238
  ClientWidth = 155
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 198
    Width = 155
    Height = 7
    Align = alTop
    Shape = bsBottomLine
  end
  object MonthCalendar1: TMonthCalendar
    Left = 0
    Top = 45
    Width = 155
    Height = 153
    Align = alTop
    AutoSize = True
    Date = 37837.613007916670000000
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 3
    Top = 210
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 80
    Top = 210
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object gr_NomSF: TGroupBox
    Left = 0
    Top = 0
    Width = 155
    Height = 45
    Align = alTop
    Caption = ' '#1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072' '
    TabOrder = 0
    object e_nomSF: TEdit
      Left = 7
      Top = 16
      Width = 145
      Height = 21
      TabOrder = 0
    end
  end
  object OracleDataSet1: TOracleDataSet
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
    Left = 120
    Top = 80
  end
end
