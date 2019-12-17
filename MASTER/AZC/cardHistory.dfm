object f_cardHistory: Tf_cardHistory
  Left = 206
  Top = 108
  Width = 758
  Height = 560
  Caption = #1054#1090#1095#1077#1090#1099' '#1087#1086' '#1082#1072#1088#1090#1072#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 526
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 748
      Height = 56
      Align = alTop
      Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 22
        Width = 71
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099':'
      end
      object Label2: TLabel
        Left = 283
        Top = 22
        Width = 10
        Height = 13
        Caption = 'C:'
      end
      object Label3: TLabel
        Left = 388
        Top = 22
        Width = 17
        Height = 13
        Caption = #1055#1086':'
      end
      object card: TEdit
        Left = 82
        Top = 19
        Width = 191
        Height = 21
        TabOrder = 0
      end
      object DateTimePicker1: TDateTimePicker
        Left = 296
        Top = 19
        Width = 81
        Height = 21
        Date = 38596.433252326390000000
        Time = 38596.433252326390000000
        TabOrder = 1
      end
      object DateTimePicker2: TDateTimePicker
        Left = 408
        Top = 19
        Width = 81
        Height = 21
        Date = 38596.433666284720000000
        Time = 38596.433666284720000000
        TabOrder = 2
      end
      object Button1: TButton
        Left = 499
        Top = 17
        Width = 75
        Height = 25
        Caption = #1047#1072#1087#1091#1089#1082
        TabOrder = 3
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 576
        Top = 17
        Width = 75
        Height = 25
        Caption = #1069#1082#1089#1087#1086#1088#1090
        TabOrder = 4
        OnClick = Button2Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 57
      Width = 748
      Height = 468
      Align = alClient
      Caption = #1044#1072#1085#1085#1099#1077
      TabOrder = 1
      object DBGridEh1: TDBGridEh
        Left = 2
        Top = 15
        Width = 744
        Height = 451
        Align = alClient
        DataSource = DataSource1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'SAZS_NUMBER'
            Footers = <>
            Title.Caption = #1040#1047#1057
          end
          item
            EditButtons = <>
            FieldName = 'DDATE'
            Footers = <>
            Title.Caption = #1042#1088#1077#1084#1103' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080
          end
          item
            EditButtons = <>
            FieldName = 'SNOMEN'
            Footers = <>
            Title.Caption = #1053'/'#1055
          end
          item
            EditButtons = <>
            FieldName = 'NVOLUME'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1084
          end
          item
            EditButtons = <>
            FieldName = 'NPRICE'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072
          end
          item
            EditButtons = <>
            FieldName = 'NSUMM'
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072
          end>
      end
    end
  end
  object OracleSession1: TOracleSession
    LogonUsername = 'export'
    LogonPassword = 'export'
    LogonDatabase = 'P5'
    Connected = True
    Left = 448
    Top = 80
  end
  object OracleLogon1: TOracleLogon
    Session = OracleSession1
    Options = [ldAuto, ldDatabase, ldDatabaseList, ldLogonHistory]
    HistoryIniFile = 'hist'
    HistoryWithPassword = True
    Left = 488
    Top = 80
  end
  object data: TOracleDataSet
    SQL.Strings = (
      'select a.*, b.sazs_number '
      'from v_azsrepout a, v_azssreportmain b'
      'where scard like :card'
      'and ddate >= :st'
      'and ddate <= :en'
      'and b.nrn = a.nprn')
    Variables.Data = {
      0300000003000000050000003A43415244050000000000000000000000030000
      003A53540C0000000000000000000000030000003A454E0C0000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      030000002C000000080000004E434F4D50414E590100000000030000004E524E
      0100000000040000004E50524E0100000000040000004E43524E010000000005
      00000044444154450100000000050000005354494D450100000000060000004E
      4E4F4D454E010000000006000000534E4F4D454E0100000000080000004E434E
      54524E444D0100000000080000004E4D5444524E444D0100000000080000004E
      434E54524E44530100000000080000004E4D5444524E44530100000000070000
      004E4D5F4D454153010000000007000000534D5F4D4541530100000000100000
      004E4D5F4D4541535F43415445474F52590100000000070000004E415F4D4541
      5301000000000700000053415F4D4541530100000000080000004E4641434541
      434301000000000800000053464143454143430100000000060000004E414745
      4E54010000000006000000534147454E540100000000050000004E4341524401
      000000000500000053434152440100000000050000004E43454C4C0100000000
      050000005343454C4C0100000000080000004E54524B5F47554E010000000008
      0000005354524B5F47554E0100000000050000004E4D45434801000000000500
      0000534D4543480100000000080000004E4F5554545950450100000000080000
      00534F5554545950450100000000080000004E50415954595045010000000008
      00000053504159545950450100000000090000004E5348495054595045010000
      0000090000005353484950545950450100000000060000004E4D554E49540100
      00000006000000534D554E495401000000000C0000004E54454D504552415455
      52450100000000030000004E504C0100000000070000004E564F4C554D450100
      000000060000004E4D415353410100000000060000004E505249434501000000
      00050000004E53554D4D01000000000B00000053415A535F4E554D4245520100
      000000}
    Session = OracleSession1
    Active = True
    Left = 521
    Top = 81
  end
  object DataSource1: TDataSource
    DataSet = data
    Left = 553
    Top = 81
  end
end
