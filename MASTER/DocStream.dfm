object f_DocStream: Tf_DocStream
  Left = 254
  Top = 103
  Width = 765
  Height = 515
  Caption = #1055#1086#1090#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 757
    Height = 214
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object grid_list: TDBGridEh
      Left = 0
      Top = 0
      Width = 377
      Height = 214
      Align = alLeft
      AllowedOperations = []
      DataSource = ds_list
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = acDSGoStageExecute
      OnGetCellParams = grid_listGetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DOC_NAME'
          Footers = <>
        end>
    end
    object lb_Info: TListBox
      Left = 377
      Top = 0
      Width = 380
      Height = 214
      Align = alClient
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object grid_nextValue: TDBGridEh
    Left = 0
    Top = 287
    Width = 757
    Height = 201
    Align = alClient
    DataSource = ds_nextValue
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
    PopupMenu = TBPopupMenu1
    ReadOnly = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = acDSGoDocExecute
  end
  object RxSplitter1: TRxSplitter
    Left = 0
    Top = 240
    Width = 757
    Height = 3
    ControlFirst = Panel1
    ControlSecond = grid_nextValue
    Align = alTop
    BevelOuter = bvLowered
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 243
    Width = 757
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DockPos = 0
      Images = f_main.img_Common
      TabOrder = 0
      object tb_GoBack: TTBItem
        Action = acDSGoBack
        DisplayMode = nbdmImageAndText
      end
      object tb_GoDoc: TTBItem
        Action = acDSGoDoc
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 269
    Width = 757
    Height = 18
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object lb_DocCaption: TLabel
      Left = 7
      Top = 2
      Width = 84
      Height = 13
      Caption = 'lb_DocCaption'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object TBDock2: TTBDock
    Left = 0
    Top = 0
    Width = 757
    Height = 26
    object TBToolbar2: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DockPos = 0
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem3: TTBItem
        Action = acDSGoStage
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    Left = 447
    Top = 33
  end
  object q_list: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      
        '  SUBSTR('#39'+-------------------------------------------------'#39',1,' +
        '(NUM1-1000)*3) || '#39' '#39' || CHAR1 AS  DOC_NAME,'
      '  NUM1 AS DOC_ORD,'
      '  CHAR2 as DOC_STAGE,'
      '  CHAR3 as DOC_COND,'
      '  CHAR4 as DOC_ROWID'
      'FROM V_TEMPTABLE'
      'WHERE APP_NAME='#39'MASTER'#39
      'AND UNIT_NAME='#39'STREAM'#39
      'AND TABLE_NAME='#39'LIST_STAGES'#39
      'ORDER BY NUM1'
      '')
    QBEDefinition.QBEFieldDefs = {
      030000000700000008000000444F435F4E414D45010000000007000000444F43
      5F4F5244010000000009000000444F435F535441474501000000000800000044
      4F435F434F4E44010000000009000000444F435F524F57494401000000000400
      000054455354010000000006000000524F575F49440100000000}
    Session = ora_Session
    BeforeScroll = q_listBeforeScroll
    Left = 336
    Top = 34
    object q_listDOC_NAME: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      FieldName = 'DOC_NAME'
      Size = 250
    end
    object q_listDOC_ORD: TFloatField
      FieldName = 'DOC_ORD'
    end
    object q_listDOC_STAGE: TStringField
      FieldName = 'DOC_STAGE'
      Size = 250
    end
    object q_listDOC_COND: TStringField
      FieldName = 'DOC_COND'
      Size = 250
    end
    object q_listDOC_ROWID: TStringField
      FieldName = 'DOC_ROWID'
      Size = 250
    end
  end
  object ds_list: TDataSource
    DataSet = q_list
    Left = 384
    Top = 34
  end
  object q_tmp: TOracleDataSet
    Session = ora_Session
    Left = 336
    Top = 82
  end
  object q_currInfo: TOracleDataSet
    Session = ora_Session
    Left = 384
    Top = 82
  end
  object q_nextValue: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KVIT WHERE NOM_ZD='#39'0701-27830'#39)
    QBEDefinition.QBEFieldDefs = {
      030000004300000002000000494401000000000C000000464C475F4F50455244
      4154410100000000080000004D4553544F5F49440100000000060000004E4F4D
      5F5A4401000000000B00000050524F445F49445F4E5052010000000009000000
      5445585F50445F49440100000000080000004E554D5F43495354010000000009
      000000444154455F4F54475201000000000300000056455301000000000A0000
      005645535F42525554544F0100000000060000005645535F4544010000000006
      0000004B4F4C5F45440100000000050000005441524946010000000007000000
      5441524946313901000000000A00000054415249465F4F524947010000000008
      0000004E554D5F4B564954010000000009000000444154455F4B564954010000
      00000C0000004E554D5F4D494C495441525901000000000C000000464C475F44
      4F505F4349535401000000000E000000464C475F5641475F4B4C49454E540100
      0000000B0000005641474F574E45525F494401000000000C0000005641474F4E
      545950455F49440100000000090000004B414C4942525F494401000000000800
      00005645535F43495354010000000008000000444154455F564F5A0100000000
      080000004B5649545F564F5A01000000000700000053554D5F564F5A01000000
      0008000000444154455F4F5456010000000007000000504C4F4D424131010000
      000007000000504C4F4D424132010000000009000000524F53494E53504C3101
      0000000009000000524F53494E53504C32010000000005000000565A4C495601
      000000000600000054454D50455201000000000700000046414B545F504C0100
      0000000B000000464F524D4E414B4C5F494401000000000A0000005348414245
      58505F494401000000000300000047544401000000000800000045585045445F
      494401000000000C0000005645544B415F4F54505F494401000000000B000000
      4E554D5F4558505F4D415201000000000700000042494C4C5F49440100000000
      07000000535645445F494401000000000B000000444154455F4F464F524D4C01
      0000000008000000535645445F4E554D010000000007000000504153505F4944
      0100000000070000004E554D5F4E41520100000000090000004E554D5F444F56
      455201000000000800000050455245525F494401000000000900000044415445
      5F454449540100000000080000004A4B434F4D4D495401000000000800000047
      524F54505F49440100000000110000005045524543485F54455850445F444154
      450100000000100000005045524543485F54455850445F4E554D010000000008
      00000053554D5F50524F4401000000000900000053554D5F414B43495A010000
      00000C00000053554D5F50524F445F4E44530100000000090000005441524946
      5F4E445301000000000A00000053554D5F564F5A4E313101000000000E000000
      53554D5F564F5A4E31315F4E445301000000000A00000053554D5F564F5A4E31
      3201000000000E00000053554D5F564F5A4E31325F4E44530100000000090000
      0053554D5F535452414801000000000400000043454E41010000000008000000
      43454E415F4F5450010000000009000000444154455F43454E41010000000009
      00000043454E415F564F5A4E0100000000}
    Session = ora_Session
    Left = 576
    Top = 34
  end
  object ds_nextValue: TDataSource
    DataSet = q_nextValue
    Left = 608
    Top = 34
  end
  object q_currValue: TOracleDataSet
    Session = ora_Session
    Left = 448
    Top = 82
  end
  object q_nextInfo: TOracleDataSet
    Session = ora_Session
    Left = 496
    Top = 34
  end
  object q_masterInfo: TOracleDataSet
    Session = ora_Session
    Left = 504
    Top = 82
  end
  object q_masterValue: TOracleDataSet
    Session = ora_Session
    Left = 560
    Top = 82
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'TBDock2.Top'
      'TBDock2.Left'
      'Panel1.Top'
      'Panel1.Left'
      'RxSplitter1.Top'
      'RxSplitter1.Left'
      'TBDock1.Top'
      'TBDock1.Left'
      'Panel2.Top'
      'Panel2.Left'
      'grid_nextValue.Top'
      'grid_nextValue.Left')
    StoredValues = <>
    Left = 655
    Top = 37
  end
  object ds_nextInfo: TDataSource
    DataSet = q_nextInfo
    Left = 528
    Top = 34
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 688
    Top = 42
    StyleName = 'XP Style'
    object acDSGoStage: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1101#1090#1072#1087
      ImageIndex = 1
      OnExecute = acDSGoStageExecute
    end
    object acDSGoDoc: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 38
      OnExecute = acDSGoDocExecute
    end
    object acDSGoBack: TAction
      Caption = #1050' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1084#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      ImageIndex = 18
      OnExecute = acDSGoBackExecute
    end
    object acDSToXLS: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      ImageIndex = 42
      OnExecute = acDSToXLSExecute
    end
  end
  object q_currStru: TOracleDataSet
    Session = ora_Session
    Left = 632
    Top = 90
  end
  object q_nextStru: TOracleDataSet
    Session = ora_Session
    Left = 688
    Top = 90
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 688
    Top = 352
  end
  object TBPopupMenu1: TTBPopupMenu
    Left = 552
    Top = 264
    object TBItem9: TTBItem
      Action = acDSToXLS
    end
  end
end
