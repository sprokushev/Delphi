object f_move: Tf_move
  Left = 225
  Top = 149
  Width = 956
  Height = 560
  Caption = #1056#1072#1079#1073#1080#1077#1085#1080#1077' '#1087#1086' '#1076#1072#1090#1077' '#1074#1099#1088#1072#1073#1086#1090#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 79
    Width = 948
    Height = 447
    Align = alClient
    Alignment = taLeftJustify
    TabOrder = 0
    object Notebook: TTabbedNotebook
      Left = 1
      Top = 1
      Width = 946
      Height = 445
      Align = alClient
      PageIndex = 1
      TabFont.Charset = DEFAULT_CHARSET
      TabFont.Color = clBtnText
      TabFont.Height = -11
      TabFont.Name = 'MS Sans Serif'
      TabFont.Style = []
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TTabPage
        Left = 4
        Top = 24
        Caption = #1054#1089#1090#1072#1090#1082#1080
        object Grid_ost: TDBGridEh
          Left = 0
          Top = 0
          Width = 938
          Height = 417
          Align = alClient
          DataSource = ds_ost
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FooterRowCount = 1
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'NAME_NPR'
              Footer.Value = #1057#1059#1052#1052#1040
              Footer.ValueType = fvtStaticText
              Footers = <>
            end
            item
              Checkboxes = False
              EditButtons = <>
              FieldName = 'Q_ALL'
              Footer.FieldName = 'Q_ALL'
              Footer.ValueType = fvtSum
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'PERIOD'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'OPER'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'MONTH'
              Footers = <>
            end>
        end
      end
      object TTabPage
        Left = 4
        Top = 24
        Caption = #1054#1090#1075#1088#1091#1079#1082#1072
        object Grid_otgr: TDBGridEh
          Left = 0
          Top = 0
          Width = 938
          Height = 417
          Align = alClient
          DataSource = ds_moveprod
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FooterRowCount = 1
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'PROD_ID_NPR'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'NAME_NPR'
              Footer.FieldName = 'NAME_NPR'
              Footer.Value = #1057#1059#1052#1052#1040
              Footer.ValueType = fvtStaticText
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'SUM_QUAN'
              Footer.FieldName = 'SUM_QUAN'
              Footer.ValueType = fvtSum
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'PERIOD'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'OPER'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'KIND'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'SUBOPER'
              Footers = <>
            end>
        end
      end
      object TTabPage
        Left = 4
        Top = 24
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072
        object Grid_check: TDBGridEh
          Left = 0
          Top = 0
          Width = 938
          Height = 417
          Align = alClient
          DataSource = ds_check
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
          OnGetCellParams = Grid_checkGetCellParams
          Columns = <
            item
              EditButtons = <>
              FieldName = 'NAIM_VALUE'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'SUMMA'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'MONTH'
              Footers = <>
              Width = 80
            end>
        end
      end
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 948
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      TabOrder = 0
      object TBItem_ost: TTBItem
        Caption = #1054#1089#1090#1072#1090#1082#1080
        DisplayMode = nbdmImageAndText
        ImageIndex = 37
        Images = f_main.img_Common
        OnClick = TBItem_ostClick
      end
      object TBItem_ost_xls: TTBItem
        Caption = #1054#1089#1090#1072#1090#1082#1080' '#1074' XLS'
        DisplayMode = nbdmImageAndText
        ImageIndex = 42
        Images = f_main.img_Common
        OnClick = TBItem_ost_xlsClick
      end
      object TBItem_otgr: TTBItem
        Caption = #1054#1090#1075#1088#1091#1079#1082#1072
        DisplayMode = nbdmImageAndText
        ImageIndex = 37
        Images = f_main.img_Common
        OnClick = TBItem_otgrClick
      end
      object TBItem_otgr_xls: TTBItem
        Caption = #1054#1090#1075#1088#1091#1079#1082#1072' '#1074' XLS'
        DisplayMode = nbdmImageAndText
        ImageIndex = 42
        Images = f_main.img_Common
        OnClick = TBItem_otgr_xlsClick
      end
      object TBItem1: TTBItem
        Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' KVIT_DATE_VIR'
        DisplayMode = nbdmImageAndText
        ImageIndex = 8
        Images = f_main.img_Common
        OnClick = TBItem1Click
      end
    end
  end
  object TBDock2: TTBDock
    Left = 0
    Top = 26
    Width = 948
    Height = 53
    object TBToolbar2: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar2'
      TabOrder = 0
      object TBControlItem1: TTBControlItem
        Control = GroupBox1
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 519
        Height = 49
        Caption = #1055#1077#1088#1080#1086#1076
        TabOrder = 0
        object c_dbeg: TDBDateTimeEditEh
          Left = 8
          Top = 16
          Width = 97
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          ReadOnly = True
          TabOrder = 0
          Visible = True
        end
        object c_dend: TDBDateTimeEditEh
          Left = 111
          Top = 16
          Width = 97
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          ReadOnly = True
          TabOrder = 1
          Visible = True
        end
        object k_priormonth: TButton
          Left = 215
          Top = 13
          Width = 145
          Height = 26
          Caption = '<<< '#1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = k_priormonthClick
        end
        object k_nextmonth: TButton
          Left = 367
          Top = 13
          Width = 145
          Height = 26
          Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1084#1077#1089#1103#1094' >>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = k_nextmonthClick
        end
      end
    end
  end
  object q_moveprod: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      #9'  M.PROD_ID_NPR'
      #9'  ,P.NAME_NPR'
      #9'  ,Sum(M.QUAN) AS Sum_QUAN'
      #9'  ,M.PERIOD'
      #9'  ,M.OPER'
      #9'  ,M.KIND'
      #9'  ,M.SUBOPER'
      'FROM MOVEPROD M,KLS_PROD P'
      'WHERE M.PROD_ID_NPR = P.ID_NPR  AND M.MONTH = :D1'
      'GROUP BY'
      ' '#9'  M.PROD_ID_NPR'
      #9'  ,P.NAME_NPR'
      #9'  ,M.PERIOD'
      #9'  ,M.OPER'
      #9'  ,M.KIND'
      #9'  ,M.SUBOPER'
      'HAVING M.OPER<>1'
      'ORDER BY P.NAME_NPR'
      '')
    Variables.Data = {0300000001000000030000003A44310C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000070000000B00000050524F445F49445F4E5052010000000008000000
      4E414D455F4E505201000000000800000053554D5F5155414E01000000000600
      0000504552494F440100000000040000004F5045520100000000040000004B49
      4E440100000000070000005355424F5045520100000000}
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 512
    Top = 184
  end
  object ds_moveprod: TDataSource
    DataSet = q_moveprod
    Left = 544
    Top = 184
  end
  object q_ost: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  P.NAME_NPR'
      '  ,O.Q_ALL'
      '  ,O.PERIOD'
      '  ,O.OPER'
      '  ,O.MONTH'
      'FROM'
      '  MOVEPROD_OST O,KLS_PROD P'
      'WHERE'
      '  O.PROD_ID_NPR = P.ID_NPR'
      '  AND O.MONTH=:D1'
      'ORDER BY P.NAME_NPR')
    Variables.Data = {0300000001000000030000003A44310C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0300000005000000080000004E414D455F4E5052010000000005000000515F41
      4C4C010000000006000000504552494F440100000000040000004F5045520100
      000000050000004D4F4E54480100000000}
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 512
    Top = 144
  end
  object ds_ost: TDataSource
    DataSet = q_ost
    Left = 544
    Top = 144
  end
  object ActionManager1: TActionManager
    Left = 480
    Top = 184
    StyleName = 'XP Style'
    object acRefreshQuery: TAction
      Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1088#1086#1089#1086#1074
      OnExecute = acRefreshQueryExecute
    end
    object acOst: TAction
      Caption = #1056#1072#1089#1095#1077#1090' '#1086#1089#1090#1072#1090#1082#1086#1074
      OnExecute = acOstExecute
    end
    object acOstXls: TAction
      Caption = #1054#1089#1090#1072#1090#1082#1080' '#1074' XLS'
      OnExecute = acOstXlsExecute
    end
    object acOtgr: TAction
      Caption = #1056#1072#1089#1095#1077#1090' '#1086#1090#1075#1088#1091#1079#1082#1080
      OnExecute = acOtgrExecute
    end
    object acOtgrXls: TAction
      Caption = #1054#1090#1075#1088#1091#1079#1082#1072' '#1074' XLS'
      OnExecute = acOtgrXlsExecute
    end
    object acKDV: TAction
      Caption = #1047#1072#1087#1086#1083#1085#1077#1085#1080#1077' KVIT_DATE_VYR'
      OnExecute = acKDVExecute
    end
  end
  object q_ost_calc: TOracleQuery
    SQL.Strings = (
      'begin'
      '  renew_moveprod_ost(:D1,:D2);'
      'end;')
    Session = f_main.ora_Session
    Variables.Data = {
      0300000002000000030000003A44310C0000000000000000000000030000003A
      44320C0000000000000000000000}
    Cursor = crSQLWait
    Left = 552
    Top = 304
  end
  object q_otgr_fill: TOracleQuery
    SQL.Strings = (
      'begin'
      '  renew_moveprod(:D1,:D2);'
      '  renew_moveprod_recalc(:D1);'
      'end;')
    Session = f_main.ora_Session
    Variables.Data = {
      0300000002000000030000003A44310C0000000000000000000000030000003A
      44320C0000000000000000000000}
    Cursor = crSQLWait
    Left = 456
    Top = 304
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'c:\tmp'
    Left = 480
    Top = 144
  end
  object q_kvit_date_vir: TOracleQuery
    SQL.Strings = (
      'begin'
      '  For_kvit.FillDateVir(:D1,:D2);'
      'end;')
    Session = f_main.ora_Session
    Variables.Data = {
      0300000002000000030000003A44310C0000000000000000000000030000003A
      44320C0000000000000000000000}
    Cursor = crSQLWait
    Left = 488
    Top = 304
  end
  object q_checksum: TOracleQuery
    SQL.Strings = (
      'begin'
      '  sfdbf.p_checkmove(:D1,:D2);'
      'end;')
    Session = f_main.ora_Session
    Variables.Data = {
      0300000002000000030000003A44310C0000000000000000000000030000003A
      44320C0000000000000000000000}
    Cursor = crSQLWait
    Left = 520
    Top = 304
  end
  object q_check: TOracleDataSet
    SQL.Strings = (
      'select * from sfdbf.check_vyr_sums'
      'where month=:D1'
      'order by id')
    Variables.Data = {0300000001000000030000003A44310C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      03000000030000000A0000004E41494D5F56414C554501000000000500000053
      554D4D410100000000050000004D4F4E54480100000000}
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 512
    Top = 224
  end
  object ds_check: TDataSource
    DataSet = q_check
    Left = 544
    Top = 224
  end
  object PropStorageEh1: TPropStorageEh
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 552
    Top = 337
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Left = 520
    Top = 337
  end
  object XPManifest1: TXPManifest
    Left = 605
    Top = 152
  end
end
