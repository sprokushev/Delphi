object f_LoadPlanRequest: Tf_LoadPlanRequest
  Left = 204
  Top = 113
  Width = 696
  Height = 476
  Caption = #1047#1072#1082#1072#1095#1082#1072' '#1079#1072#1103#1074#1086#1082' '#1080#1079' '#1040#1088#1093#1072#1085#1075#1077#1083#1100#1089#1082#1072
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
  object Panel1: TPanel
    Left = 0
    Top = 23
    Width = 688
    Height = 426
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 686
      Height = 31
      Align = alTop
      BevelOuter = bvLowered
      Caption = #1047#1072#1103#1074#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Grid: TStringGrid
      Left = 1
      Top = 32
      Width = 686
      Height = 393
      Align = alClient
      ColCount = 10
      DefaultRowHeight = 16
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
      TabOrder = 1
      OnDrawCell = GridDrawCell
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 688
    Height = 23
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      TabOrder = 0
      object TBItem1: TTBItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' Excel'
        OnClick = TBItem1Click
      end
      object TBItem3: TTBItem
        Caption = #1055#1088#1086#1090#1077#1089#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077
        Enabled = False
        OnClick = TBItem3Click
      end
      object TBItem2: TTBItem
        Caption = #1047#1072#1082#1072#1095#1072#1090#1100' '#1074' Master'
        OnClick = TBItem2Click
      end
    end
  end
  object OpenDlg: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' Excel|*.xls'
    InitialDir = 'C:\'
    Left = 224
    Top = 223
  end
  object Master: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Left = 544
    Top = 135
  end
  object data: TOracleQuery
    Session = Master
    Left = 360
    Top = 223
  end
  object findQ: TOracleQuery
    SQL.Strings = (
      'select * from month_all'
      'where'
      #9'input_number = :numb'
      'and'#9'input_date = :dat'
      'and '#9'poluch_name = :agent'
      'and '#9'parus_agent_name = :agent2'
      'and'#9'parus_nomen_name = :nomen'
      'and '#9'parus_rn = 1'
      'and'#9'date_plan = :date_plan')
    Session = Master
    Variables.Data = {
      0300000006000000050000003A4E554D42050000000000000000000000040000
      003A4441540C0000000000000000000000060000003A4147454E540500000000
      00000000000000070000003A4147454E54320500000000000000000000000600
      00003A4E4F4D454E0500000000000000000000000A0000003A444154455F504C
      414E0C0000000000000000000000}
    Left = 432
    Top = 223
  end
end
