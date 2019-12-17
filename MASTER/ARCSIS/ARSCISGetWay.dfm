object f_ARSCISGetWay: Tf_ARSCISGetWay
  Left = 487
  Top = 188
  Width = 341
  Height = 175
  Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1100' '#1089#1086#1089#1090#1072#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 182
    Top = 37
    Width = 6
    Height = 13
    Caption = 'c'
  end
  object Label2: TLabel
    Left = 250
    Top = 37
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object Label3: TLabel
    Left = 182
    Top = 61
    Width = 6
    Height = 13
    Caption = 'c'
  end
  object Label4: TLabel
    Left = 250
    Top = 61
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object Label5: TLabel
    Left = 16
    Top = 8
    Width = 182
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1089' '#1082#1086#1085#1094#1072' '#1089#1086#1089#1090#1072#1074#1072':'
  end
  object edFrom1: TRxCalcEdit
    Left = 196
    Top = 33
    Width = 49
    Height = 21
    AutoSize = False
    DisplayFormat = ',0'
    FormatOnEditing = True
    MaxValue = 50.000000000000000000
    MinValue = 1.000000000000000000
    NumGlyphs = 2
    TabOrder = 2
    Value = 34.000000000000000000
    OnChange = edFrom1Change
  end
  object cbWay1: TRxDBLookupCombo
    Left = 16
    Top = 33
    Width = 163
    Height = 21
    DropDownCount = 8
    EscapeClear = False
    DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1091#1090#1100'>'
    EmptyValue = '0'
    LookupField = 'WayOfLoadingID'
    LookupDisplay = 'WayOfLoadingName'
    LookupSource = ds_Way1
    TabOrder = 0
    TabStop = False
    OnChange = cbWay1Change
  end
  object edTo1: TRxCalcEdit
    Left = 272
    Top = 33
    Width = 49
    Height = 21
    AutoSize = False
    DisplayFormat = ',0'
    FormatOnEditing = True
    MaxValue = 50.000000000000000000
    MinValue = 1.000000000000000000
    NumGlyphs = 2
    TabOrder = 3
    Value = 18.000000000000000000
    OnChange = edTo1Change
  end
  object edFrom2: TRxCalcEdit
    Left = 196
    Top = 57
    Width = 49
    Height = 21
    AutoSize = False
    DisplayFormat = ',0'
    FormatOnEditing = True
    MaxValue = 50.000000000000000000
    NumGlyphs = 2
    TabOrder = 4
    Value = 17.000000000000000000
    OnChange = edFrom2Change
  end
  object cbWay2: TRxDBLookupCombo
    Left = 16
    Top = 57
    Width = 163
    Height = 21
    DropDownCount = 8
    EscapeClear = False
    DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1091#1090#1100'>'
    EmptyValue = '0'
    LookupField = 'WayOfLoadingID'
    LookupDisplay = 'WayOfLoadingName'
    LookupSource = ds_Way2
    TabOrder = 1
    TabStop = False
    OnChange = cbWay2Change
  end
  object edTo2: TRxCalcEdit
    Left = 272
    Top = 57
    Width = 49
    Height = 21
    AutoSize = False
    DisplayFormat = ',0'
    FormatOnEditing = True
    MaxValue = 50.000000000000000000
    NumGlyphs = 2
    TabOrder = 5
    OnChange = edTo2Change
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 96
    Width = 75
    Height = 25
    TabOrder = 6
    TabStop = False
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 96
    Width = 75
    Height = 25
    TabOrder = 7
    TabStop = False
    Kind = bkCancel
  end
  object ds_Way1: TDataSource
    DataSet = q_Way1
    Left = 24
    Top = 88
  end
  object q_Way1: TADOQuery
    Connection = ARCSISDATAFORM.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select b.*'
      'from WaysOfLoading b'
      'where b.WayOfLoadingID>0'
      'order by b.WayOfLoadingID')
    Left = 68
    Top = 88
    object q_Way1WayOfLoadingID: TAutoIncField
      FieldName = 'WayOfLoadingID'
      ReadOnly = True
    end
    object q_Way1WayOfLoadingName: TStringField
      FieldName = 'WayOfLoadingName'
      Size = 50
    end
  end
  object q_Way2: TADOQuery
    Connection = ARCSISDATAFORM.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select b.*'
      'from WaysOfLoading b'
      'where b.WayOfLoadingID>0'
      'order by b.WayOfLoadingID')
    Left = 188
    Top = 88
    object q_Way2WayOfLoadingID: TAutoIncField
      FieldName = 'WayOfLoadingID'
      ReadOnly = True
    end
    object q_Way2WayOfLoadingName: TStringField
      FieldName = 'WayOfLoadingName'
      Size = 50
    end
  end
  object ds_Way2: TDataSource
    DataSet = q_Way2
    Left = 152
    Top = 88
  end
end
