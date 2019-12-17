inherited f_ScriptGen: Tf_ScriptGen
  Left = 232
  Top = 136
  Width = 686
  Height = 424
  Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1096#1072#1073#1083#1086#1085#1086#1074' '#1089#1082#1088#1080#1087#1090#1086#1074' '#1076#1083#1103' '#1090#1072#1073#1083#1080#1094' '#1074' '#1089#1093#1077#1084#1077' MASTER'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 29
    Width = 678
    Height = 124
    Align = alTop
    DataSource = ds_Columns
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SEQ_NUM'
        Title.Caption = #8470#8470
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COL_NAME'
        Title.Caption = #1055#1086#1083#1077
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATATYPE'
        Title.Caption = #1058#1080#1087
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAXIMUM_LENGTH'
        Title.Caption = #1056#1072#1079#1084#1077#1088
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DECIMAL_PLACES'
        Title.Caption = #1056#1072#1079#1084#1077#1088'2'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NULL_INDICATOR'
        Title.Caption = 'NULL'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROMPT'
        Title.Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 678
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 7
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = #1058#1072#1073#1083#1080#1094#1072':'
    end
    object lcb_table: TDBLookupComboBox
      Left = 56
      Top = 4
      Width = 209
      Height = 21
      KeyField = 'TAB_NAME'
      ListField = 'TAB_NAME'
      ListSource = ds_tables
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 153
    Width = 678
    Height = 88
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 177
      Top = 0
      Width = 183
      Height = 88
      Align = alClient
      DataSource = ds_ForeignKeys
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COL_NAME'
          Title.Caption = 'FOREIGN KEYS'
          Width = 142
          Visible = True
        end>
    end
    object DBGrid3: TDBGrid
      Left = 360
      Top = 0
      Width = 318
      Height = 88
      Align = alRight
      DataSource = ds_Sequences
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COL_NAME'
          Title.Caption = #1055#1086#1083#1077
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEQ_NAME'
          Title.Caption = 'SEQUENCE'
          Width = 151
          Visible = True
        end>
    end
    object DBGrid4: TDBGrid
      Left = 0
      Top = 0
      Width = 177
      Height = 88
      Align = alLeft
      DataSource = ds_PrimaryKeys
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COL_NAME'
          Title.Caption = 'PRIMARY KEY'
          Width = 138
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 241
    Width = 678
    Height = 156
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Label3: TLabel
      Left = 2
      Top = 5
      Width = 162
      Height = 13
      Alignment = taRightJustify
      Caption = #1058#1088#1080#1075#1075#1077#1088' "BEFORE I/U/D ROW":'
    end
    object Label4: TLabel
      Left = 10
      Top = 29
      Width = 154
      Height = 13
      Alignment = taRightJustify
      Caption = #1058#1088#1080#1075#1075#1077#1088' "AFTER I/U/D ROW":'
    end
    object Label2: TLabel
      Left = 363
      Top = 4
      Width = 115
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1072#1090#1072#1083#1086#1075' '#1076#1083#1103' '#1089#1082#1088#1080#1087#1090#1086#1074':'
    end
    object Label6: TLabel
      Left = 72
      Top = 100
      Width = 89
      Height = 13
      Caption = #1057#1093#1077#1084#1072' '#1076#1083#1103' LOG'#39#1072':'
    end
    object ed_trg_bef: TEdit
      Left = 169
      Top = 2
      Width = 184
      Height = 21
      TabOrder = 0
    end
    object ed_trg_aft: TEdit
      Left = 169
      Top = 26
      Width = 184
      Height = 21
      TabOrder = 1
    end
    object ed_shadow: TEdit
      Left = 169
      Top = 50
      Width = 184
      Height = 21
      TabOrder = 2
    end
    object cb_Shadow: TCheckBox
      Left = 45
      Top = 51
      Width = 121
      Height = 17
      Caption = '"'#1058#1077#1085#1077#1074#1072#1103'" '#1090#1072#1073#1083#1080#1094#1072':'
      TabOrder = 3
      OnClick = cb_ShadowClick
    end
    object ed_dirs: TDirectoryEdit
      Left = 488
      Top = 2
      Width = 185
      Height = 21
      DialogOptions = [sdAllowCreate, sdPerformCreate, sdPrompt]
      InitialDir = 'C:\TMP\'
      NumGlyphs = 1
      TabOrder = 4
      Text = 'C:\TMP\'
    end
    object bt_generate: TButton
      Left = 8
      Top = 131
      Width = 137
      Height = 25
      Action = ac_SG_Generate
      TabOrder = 5
    end
    object bt_shadow: TButton
      Left = 152
      Top = 131
      Width = 169
      Height = 25
      Action = ac_SG_CreateShadow
      Enabled = False
      TabOrder = 6
    end
    object cb_Logging: TCheckBox
      Left = 360
      Top = 46
      Width = 313
      Height = 17
      Caption = #1055#1080#1089#1072#1090#1100' '#1074' LOG (TABLE_ACTIVITY_LOG)'
      TabOrder = 7
    end
    object cb_CheckPK: TCheckBox
      Left = 360
      Top = 76
      Width = 313
      Height = 17
      Caption = #1053#1077' '#1076#1072#1074#1072#1090#1100' '#1084#1077#1085#1103#1090#1100' PRIMARY KEY'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object ed_Sequence: TEdit
      Left = 169
      Top = 74
      Width = 184
      Height = 21
      TabOrder = 9
    end
    object cb_Sequence: TCheckBox
      Left = 5
      Top = 75
      Width = 164
      Height = 17
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' SEQUENCE:'
      Checked = True
      State = cbChecked
      TabOrder = 10
      OnClick = cb_SequenceClick
    end
    object bt_Sequences: TButton
      Left = 328
      Top = 131
      Width = 137
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100' SEQUENCES'
      TabOrder = 11
      OnClick = bt_SequencesClick
    end
    object cb_CheckFK: TCheckBox
      Left = 360
      Top = 91
      Width = 313
      Height = 17
      Caption = #1053#1077' '#1076#1072#1074#1072#1090#1100' '#1084#1077#1085#1103#1090#1100' FOREIGN KEYS'
      TabOrder = 12
    end
    object ed_scheme: TEdit
      Left = 168
      Top = 97
      Width = 185
      Height = 21
      TabOrder = 13
      Text = 'MASTER_SHADOW'
    end
    object cb_ShadowInLogScheme: TCheckBox
      Left = 360
      Top = 61
      Width = 313
      Height = 17
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1090#1077#1085#1077#1074#1091#1102' '#1090#1072#1073#1083#1080#1094#1091' '#1074' '#1089#1093#1077#1084#1077' LOG'#39#1072
      Checked = True
      State = cbChecked
      TabOrder = 14
    end
    object cb_2WayUsing: TCheckBox
      Left = 360
      Top = 23
      Width = 312
      Height = 25
      Caption = 
        #1044#1072#1085#1085#1099#1077' '#1086#1076#1085#1086#1074#1088#1077#1084#1077#1085#1085#1086' '#1079#1072#1082#1072#1095#1080#1074#1072#1102#1090#1089#1103' '#1080' '#1080#1079#1084#1077#1085#1103#1102#1090#1089#1103' '#1074' MASTER - '#1085#1077#1086#1073#1093#1086#1076 +
        #1080#1084#1086' '#1085#1072#1083#1080#1095#1080#1077' '#1087#1086#1083#1103' APPL_TAG'
      TabOrder = 15
      WordWrap = True
      OnClick = cb_2WayUsingClick
    end
    object cb_CheckAKInShadow: TCheckBox
      Left = 360
      Top = 105
      Width = 313
      Height = 23
      Caption = #1050#1086#1085#1090#1088#1086#1083#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1083#1080#1095#1080#1077' '#1072#1085#1072#1083#1086#1075#1080#1095#1085#1099#1093' '#1079#1072#1087#1080#1089#1077#1081' ('#1072#1083#1100#1090#1077#1088#1085#1072#1090#1080#1074#1085#1099#1081' '#1082#1083#1102#1095')'
      TabOrder = 16
      WordWrap = True
    end
  end
  object q_Tables: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM master.v_designer_tables')
    QBEDefinition.QBEFieldDefs = {0300000001000000080000005441425F4E414D450100000000}
    Session = f_main.ora_Session
    AfterScroll = q_TablesAfterScroll
    Left = 552
    Top = 64
  end
  object q_Columns: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM master.v_designer_columns'
      'WHERE tab_name='#39'KLS_PLAN'#39)
    QBEDefinition.QBEFieldDefs = {
      0300000008000000080000005441425F4E414D45010000000007000000534551
      5F4E554D010000000008000000434F4C5F4E414D450100000000080000004441
      54415459504501000000000E0000004D4158494D554D5F4C454E475448010000
      00000E000000444543494D414C5F504C4143455301000000000E0000004E554C
      4C5F494E44494341544F5201000000000600000050524F4D50540100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_ColumnsBeforeOpen
    Left = 424
    Top = 56
  end
  object ds_tables: TDataSource
    DataSet = q_Tables
    Left = 536
    Top = 120
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 352
    Top = 136
    StyleName = 'XP Style'
    object ac_SG_Generate: TAction
      Caption = #1043#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1089#1082#1088#1080#1087#1090#1099
      OnExecute = ac_SG_GenerateExecute
    end
    object ac_SG_CreateShadow: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' "'#1090#1077#1085#1077#1074#1091#1102'" '#1090#1072#1073#1083#1080#1094#1091
      OnExecute = ac_SG_CreateShadowExecute
    end
  end
  object q_PrimaryKeys: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM master.v_designer_primary_keys'
      'WHERE tab_name='#39'KLS_PLAN'#39)
    QBEDefinition.QBEFieldDefs = {
      0300000004000000080000005441425F4E414D45010000000007000000504B5F
      4E414D45010000000008000000434F4C5F4E414D45010000000008000000504F
      534954494F4E0100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_PrimaryKeysBeforeOpen
    Left = 280
    Top = 56
  end
  object q_Sequences: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM master.v_designer_sequences'
      'WHERE tab_name='#39'KLS_PLAN'#39
      '')
    QBEDefinition.QBEFieldDefs = {
      0300000004000000080000005441425F4E414D45010000000007000000504B5F
      4E414D45010000000008000000434F4C5F4E414D450100000000080000005345
      515F4E414D450100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_SequencesBeforeOpen
    AfterScroll = q_SequencesAfterScroll
    Left = 112
    Top = 64
  end
  object ds_Columns: TDataSource
    DataSet = q_Columns
    Left = 480
    Top = 56
  end
  object ds_PrimaryKeys: TDataSource
    DataSet = q_PrimaryKeys
    Left = 352
    Top = 56
  end
  object ds_Sequences: TDataSource
    DataSet = q_Sequences
    Left = 184
    Top = 64
  end
  object q_cmn: TOracleQuery
    Session = f_main.ora_Session
    Left = 128
    Top = 177
  end
  object q_ForeignKeys: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM master.v_designer_foreign_keys'
      'WHERE tab_name='#39'KLS_PLAN'#39)
    QBEDefinition.QBEFieldDefs = {
      0300000004000000080000005441425F4E414D45010000000007000000504B5F
      4E414D45010000000008000000434F4C5F4E414D450100000000080000005345
      515F4E414D450100000000}
    Session = f_main.ora_Session
    BeforeOpen = q_ForeignKeysBeforeOpen
    Left = 280
    Top = 104
  end
  object ds_ForeignKeys: TDataSource
    DataSet = q_ForeignKeys
    Left = 360
    Top = 104
  end
end
