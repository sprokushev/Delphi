object f_Counter: Tf_Counter
  Left = 473
  Top = 136
  Width = 179
  Height = 130
  BorderIcons = [biMinimize]
  BorderStyle = bsSizeToolWin
  Caption = #1057#1095#1077#1090#1095#1080#1082
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
  object DBText1: TDBText
    Left = 0
    Top = 0
    Width = 171
    Height = 52
    Align = alTop
    DataField = 'CAPTION'
    DataSource = DataSource1
    PopupMenu = PopupMenu1
    WordWrap = True
  end
  object DBText2: TDBText
    Left = 0
    Top = 52
    Width = 171
    Height = 51
    Align = alClient
    Alignment = taCenter
    DataField = 'VALUE'
    DataSource = DataSource1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    WordWrap = True
  end
  object OracleSession1: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Left = 38
    Top = 69
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      
        '  '#39#1054#1090#1075#1088#1091#1078#1077#1085#1086' '#1074#1072#1075#1086#1085#1086#1074' '#1079#1072' '#39' || TO_CHAR(SYSDATE,'#39'dd.mm.yyyy'#39') AS ca' +
        'ption,'
      '  count(*) AS value'
      '  FROM kvit,month,kls_vid_otgr'
      '  WHERE date_oforml>=trunc(sysdate) AND'
      '    month.nom_zd=kvit.nom_zd AND'
      '    month.load_abbr=kls_vid_otgr.load_abbr AND'
      '    kls_vid_otgr.load_type_id=1'
      
        'GROUP BY '#39#1054#1090#1075#1088#1091#1078#1077#1085#1086' '#1074#1072#1075#1086#1085#1086#1074' '#1079#1072' '#39' || TO_CHAR(SYSDATE,'#39'dd.mm.yyyy'#39 +
        ')')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000500000056414C554501000000000700000043415054494F
      4E0100000000}
    Session = OracleSession1
    Left = 70
    Top = 69
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 102
    Top = 69
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 6
    Top = 69
  end
  object PopupMenu1: TPopupMenu
    Left = 8
    Top = 40
    object N5: TMenuItem
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086'...'
      Default = True
      OnClick = N5Click
    end
    object N4: TMenuItem
      Caption = #1043#1088#1072#1092#1080#1082'...'
      OnClick = N4Click
    end
    object N1: TMenuItem
      Caption = #1042#1088#1077#1084#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103'...'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = N3Click
    end
  end
end
