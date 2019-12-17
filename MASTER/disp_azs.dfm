object f_dispazs: Tf_dispazs
  Left = 203
  Top = 106
  Width = 781
  Height = 495
  Caption = 'f_dispazs'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 773
    Height = 23
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      TabOrder = 0
      object TBItem1: TTBItem
        AutoCheck = True
        Caption = #1057#1082#1088#1099#1090#1100' '#1079#1072#1103#1074#1082#1080
        OnClick = TBItem1Click
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 23
    Width = 773
    Height = 445
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = #1055#1088#1086#1075#1085#1086#1079
      object PrognozGrid: TDBGridEh
        Left = 0
        Top = 0
        Width = 765
        Height = 419
        Align = alClient
        Ctl3D = False
        DataSource = DataSource1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FrozenCols = 2
        OptionsEh = [dghHighlightFocus, dghClearSelection]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnDrawColumnCell = PrognozGridDrawColumnCell
        OnGetCellParams = PrognozGridGetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'T'
            Footers = <>
            Width = 0
          end
          item
            EditButtons = <>
            FieldName = 'FirstColumn'
            Footers = <>
            Title.Caption = #1040#1047#1057'/'#1055#1088#1086#1076#1091#1082#1090
            Width = 100
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'zay1'
            Footers = <>
            Title.Caption = #1047#1072#1103#1074#1082#1080'|1'
            Width = 80
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #1047#1072#1103#1074#1082#1080'|2'
            Width = 80
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #1047#1072#1103#1074#1082#1080'|3'
            Width = 80
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #1047#1072#1103#1074#1082#1080'|4'
            Width = 80
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #1047#1072#1103#1074#1082#1080'|5'
            Width = 80
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #1047#1072#1103#1074#1082#1080'|6'
            Width = 80
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #1047#1072#1103#1074#1082#1080'|7'
            Width = 80
          end
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = #1047#1072#1103#1074#1082#1080'|8'
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'avg_out_v'
            Footers = <>
            Title.Caption = #1057#1088#1077#1076#1085#1077#1089#1091#1090'. '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1103
          end
          item
            EditButtons = <>
            FieldName = 'd1_ost'
            Footers = <>
            Title.Caption = '1|'#1053#1072#1083#1080#1095#1080#1077' '#1087#1088#1086#1076#1091#1082#1090#1072
          end
          item
            EditButtons = <>
            FieldName = 'd1_free'
            Footers = <>
            Title.Caption = '1|'#1057#1074#1086#1073#1086#1076#1085#1099#1077' '#1077#1084#1082#1086#1089#1090#1080
          end
          item
            EditButtons = <>
            FieldName = 'd1_days'
            Footers = <>
            Title.Caption = '1|'#1054#1089#1090#1072#1083#1086#1089#1100' '#1074' '#1076#1085#1103#1093
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end
          item
            EditButtons = <>
            Footers = <>
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1089#1090#1072#1090#1082#1080
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = #1047#1072#1103#1074#1082#1080
      ImageIndex = 2
    end
  end
  object par: TOracleSession
    LogonUsername = 'export'
    LogonPassword = 'export'
    LogonDatabase = 'P5'
    Connected = True
    Left = 116
    Top = 11
  end
  object ParLogon: TOracleLogon
    Session = par
    Options = [ldAuto, ldDatabase, ldLogonHistory]
    HistoryIniFile = 'hist'
    HistoryWithPassword = True
    Left = 84
    Top = 11
  end
  object mainDataQ: TOracleDataSet
    SQL.Strings = (
      'select rownum, b.* from'
      '(select a.* from  '
      '('
      
        'select distinct '#39'1'#39' as t, a.sdep_ready, a.azs_number, '#39#39' as nome' +
        'n, 0 as b_volume, 0 as b_mass, SYSDATE as last_rep_date'
      'from v_ost a'
      'union all'
      
        'select '#39'2'#39' as t, a.sdep_ready, a.azs_number, a.nomen_code, a.b_v' +
        'olume, a.b_mass, a.last_rep_date'
      'from v_ost a'
      'union all'
      
        'select '#39'3'#39' as t, a.sdep_ready, a.azs_number, '#39#39', sum(a.b_volume)' +
        ', sum(a.b_mass), SYSDATE'
      'from v_ost a'
      'group by a.sdep_ready, a.azs_number'
      'union all'
      
        'select distinct '#39'4'#39' as t, a.sdep_ready, a.azs_number, '#39#39', 0, 0, ' +
        'SYSDATE'
      'from v_ost a'
      ') a'
      'where sdep_ready = :sdep'
      'order by azs_number, t'
      ') b')
    Variables.Data = {0300000001000000050000003A53444550050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000080000000A000000415A535F4E554D42455201000000000A00000053
      4445505F52454144590100000000050000004E4F4D454E010000000001000000
      54010000000006000000524F574E554D010000000008000000425F564F4C554D
      45010000000006000000425F4D41535301000000000D0000004C4153545F5245
      505F444154450100000000}
    Session = par
    AfterOpen = mainDataQAfterOpen
    OnCalcFields = mainDataQCalcFields
    Left = 124
    Top = 147
    object mainDataQT: TStringField
      FieldName = 'T'
      Size = 1
    end
    object mainDataQSDEP_READY: TStringField
      FieldName = 'SDEP_READY'
    end
    object mainDataQAZS_NUMBER: TStringField
      FieldName = 'AZS_NUMBER'
    end
    object mainDataQFirstColumn: TStringField
      FieldKind = fkCalculated
      FieldName = 'FirstColumn'
      Size = 50
      Calculated = True
    end
    object mainDataQNOMEN: TStringField
      FieldName = 'NOMEN'
    end
    object mainDataQzay1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'zay1'
      Calculated = True
    end
    object mainDataQROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object mainDataQnewOst: TFloatField
      FieldKind = fkCalculated
      FieldName = 'newOst'
      Calculated = True
    end
    object mainDataQB_VOLUME: TFloatField
      FieldName = 'B_VOLUME'
    end
    object mainDataQB_MASS: TFloatField
      FieldName = 'B_MASS'
    end
    object mainDataQavg_out_v: TFloatField
      FieldKind = fkCalculated
      FieldName = 'avg_out_v'
      Calculated = True
    end
    object mainDataQLAST_REP_DATE: TDateTimeField
      FieldName = 'LAST_REP_DATE'
    end
    object mainDataQd1_ost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'd1_ost'
      Calculated = True
    end
    object mainDataQd1_free: TFloatField
      FieldKind = fkCalculated
      FieldName = 'd1_free'
      Calculated = True
    end
    object mainDataQd1_days: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'd1_days'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = mainDataQ
    Left = 172
    Top = 107
  end
  object azsOutQ: TOracleDataSet
    SQL.Strings = (
      
        'select e.sdep_ready, e.SNUMB , d.nomen_code, sum(a.volume) sum_v' +
        ', sum(a.MASSA) sum_mas '
      
        'from azsrepout a, azssreportmain b, dicnomns d, vaneev.v_dicstor' +
        'e_psv e'
      'where '
      '--b.DATE_SMENA >= :st'
      '--and b.date_smena <= :en'
      'a.rep_DATE >= :st'
      'and a.rep_date <= :en'
      'and e.nrn = b.azs_number'
      'and e.sdep_ready = :dep'
      'and d.rn = a.nomen'
      'and b.rn = a.prn'
      'group by e.sdep_ready, e.snumb, d.nomen_code '
      'order by 1, 2, 3')
    Variables.Data = {
      0300000003000000030000003A53540C0000000000000000000000030000003A
      454E0C0000000000000000000000040000003A44455005000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      03000000050000000A000000534445505F524541445901000000000A0000004E
      4F4D454E5F434F444501000000000500000053554D5F56010000000007000000
      53554D5F4D4153010000000005000000534E554D420100000000}
    Session = par
    Left = 156
    Top = 147
    object azsOutQSDEP_READY: TStringField
      FieldName = 'SDEP_READY'
    end
    object azsOutQSNUMB: TStringField
      FieldName = 'SNUMB'
      Required = True
    end
    object azsOutQNOMEN_CODE: TStringField
      FieldName = 'NOMEN_CODE'
      Required = True
    end
    object azsOutQSUM_V: TFloatField
      FieldName = 'SUM_V'
    end
    object azsOutQSUM_MAS: TFloatField
      FieldName = 'SUM_MAS'
    end
  end
  object OracleDataSet1: TOracleDataSet
    Session = par
    Left = 188
    Top = 147
  end
end
