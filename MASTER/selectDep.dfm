object f_selectDep: Tf_selectDep
  Left = 374
  Top = 305
  Width = 267
  Height = 151
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1080#1083#1083#1080#1072#1083
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 259
    Height = 124
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 9
      Width = 50
      Height = 13
      Caption = #1060#1080#1083#1083#1080#1072#1083':'
    end
    object BitBtn1: TBitBtn
      Left = 96
      Top = 96
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 60
      Top = 6
      Width = 194
      Height = 21
      DropDownCount = 8
      LookupField = 'SDEP_READY'
      LookupSource = DataSource1
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 28
      Width = 249
      Height = 65
      Caption = #1055#1077#1088#1080#1086#1076
      TabOrder = 2
      object Label2: TLabel
        Left = 13
        Top = 16
        Width = 40
        Height = 13
        Caption = #1053#1072#1095#1072#1083#1086':'
      end
      object Label3: TLabel
        Left = 19
        Top = 39
        Width = 34
        Height = 13
        Caption = #1050#1086#1085#1077#1094':'
      end
      object DateTimePicker1: TDateTimePicker
        Left = 56
        Top = 12
        Width = 186
        Height = 21
        Date = 38469.608818055550000000
        Time = 38469.608818055550000000
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 56
        Top = 35
        Width = 186
        Height = 21
        Date = 38469.608900520830000000
        Time = 38469.608900520830000000
        TabOrder = 1
      end
    end
  end
  object dep: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ALL_ROWS */  DISTINCT A.SDEP_READY, C.FILIAL_ID    '
      
        'FROM V_PARUS_DICSTORE A, PARUS_STORE_ORG_STRU_LINK B, V_ORG_STRU' +
        'CTURE C'
      'WHERE sDEP_READY IS NOT NULL'
      '  AND A.nRN=B.STORE_RN'
      '  AND B.ORG_STRU_ID=C.ID'
      'ORDER BY sDEP_READY')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000A000000534445505F524541445901000000000900000046
      494C49414C5F49440100000000}
    Session = OracleSession1
    Active = True
    Left = 200
    Top = 88
  end
  object OracleSession1: TOracleSession
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Connected = True
    Left = 232
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = dep
    Left = 8
    Top = 88
  end
end
