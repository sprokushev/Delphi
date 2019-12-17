object f_smn_ree: Tf_smn_ree
  Left = 212
  Top = 140
  Width = 994
  Height = 615
  Caption = #1056#1077#1077#1089#1090#1088#1099' '#1085#1072' '#1085#1077#1092#1090#1100' '#1086#1090#1075#1088#1091#1078#1077#1085#1085#1091#1102' '#1089' '#1069#1089#1090#1072#1082#1072#1076#1099' '#1057#1052#1053
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 986
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acLoadReeSMN
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = acLoadReeSMN_2
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acReeSMNToDbf
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 562
    Width = 986
    Height = 19
    Panels = <
      item
        Width = 180
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel3: TPanel
    Left = 281
    Top = 26
    Width = 705
    Height = 536
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 2
    object gridRows: TDBGridEh
      Left = 0
      Top = 93
      Width = 705
      Height = 443
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = ds_pod_rows
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
      PopupMenu = TBPopupMenu1
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnGetCellParams = gridRowsGetCellParams
      OnSortMarkingChanged = gridRowsSortMarkingChanged
      Columns = <
        item
          Checkboxes = False
          EditButtons = <>
          FieldName = 'NUM_POS'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.Value = #1048#1090#1086#1075#1086
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.TitleButton = True
          Width = 46
        end
        item
          EditButtons = <>
          FieldName = 'NUM_KVIT'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Title.TitleButton = True
          Width = 81
        end
        item
          EditButtons = <>
          FieldName = 'NUM_CIST'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Title.TitleButton = True
          Width = 99
        end
        item
          EditButtons = <>
          FieldName = 'VZLIV'
          Footers = <>
          Title.TitleButton = True
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = 'VES'
          Footer.FieldName = 'VES'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'VES_CIST'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'CAPACITY'
          Footers = <>
          Title.TitleButton = True
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'KALIBR_ID'
          Footers = <>
          Title.TitleButton = True
          Width = 54
        end
        item
          AlwaysShowEditButton = True
          ButtonStyle = cbsEllipsis
          EditButtons = <>
          FieldName = 'VAGOWNER_NAME'
          Footers = <>
          Width = 222
          OnEditButtonClick = gridRowsColumns8EditButtonClick
        end
        item
          EditButtons = <>
          FieldName = 'PLOMBA1'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Title.TitleButton = True
          Width = 110
        end
        item
          EditButtons = <>
          FieldName = 'PLOMBA2'
          Footers = <>
          Width = 131
        end
        item
          EditButtons = <>
          FieldName = 'AXES'
          Footers = <>
        end>
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 705
      Height = 93
      Align = alTop
      Caption = ' '#1060#1080#1083#1100#1090#1088' '
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 3
        Top = 13
        Width = 194
        Height = 78
        Caption = ' '#1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '
        TabOrder = 0
        object Label1: TLabel
          Left = 9
          Top = 24
          Width = 6
          Height = 13
          Caption = #1089
        end
        object Label2: TLabel
          Left = 9
          Top = 54
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object Time2: TDateTimePicker
          Left = 27
          Top = 49
          Width = 70
          Height = 21
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          Kind = dtkTime
          TabOrder = 0
        end
        object time1: TDateTimePicker
          Left = 27
          Top = 21
          Width = 70
          Height = 21
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          Kind = dtkTime
          TabOrder = 1
        end
        object Date2: TDateTimePicker
          Left = 104
          Top = 49
          Width = 82
          Height = 21
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          TabOrder = 2
        end
        object Date1: TDateTimePicker
          Left = 104
          Top = 21
          Width = 82
          Height = 21
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          TabOrder = 3
        end
      end
      object Panel2: TPanel
        Left = 202
        Top = 17
        Width = 76
        Height = 74
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object sbRefresh: TSpeedButton
          Left = 4
          Top = 4
          Width = 67
          Height = 66
          Action = acRefresh
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF008400000084000000840000008400
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0084000000840000008400000084000000840000008400
            00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00
            FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
            FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
            FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
            FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF008400
            0000FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF008400
            0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008400
            00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008400
            0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Layout = blGlyphTop
          ParentShowHint = False
          ShowHint = False
        end
      end
    end
  end
  object Panel4: TPanel
    Left = 273
    Top = 26
    Width = 8
    Height = 536
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
  end
  object Panel5: TPanel
    Left = 0
    Top = 26
    Width = 273
    Height = 536
    Align = alLeft
    TabOrder = 4
    object gridTitle: TDBGridEh
      Left = 1
      Top = 1
      Width = 271
      Height = 287
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = ds_podacha
      EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
      PopupMenu = TBPopupMenu1
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnGetCellParams = gridTitleGetCellParams
      OnSortMarkingChanged = gridTitleSortMarkingChanged
      Columns = <
        item
          EditButtons = <>
          FieldName = 'POD_NUM'
          Footers = <>
          Width = 132
        end
        item
          EditButtons = <>
          FieldName = 'POD_DATE'
          Footers = <>
          Width = 92
        end>
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 288
      Width = 271
      Height = 247
      Align = alBottom
      Caption = #1055#1072#1089#1087#1086#1088#1090
      TabOrder = 1
      object Label3: TLabel
        Left = 8
        Top = 20
        Width = 17
        Height = 13
        Caption = #8470': '
      end
      object Label9: TLabel
        Left = 126
        Top = 20
        Width = 11
        Height = 13
        Caption = #1086#1090
      end
      object Label10: TLabel
        Left = 8
        Top = 43
        Width = 38
        Height = 13
        Caption = #8470' '#1088#1077#1079'.:'
      end
      object Label11: TLabel
        Left = 88
        Top = 63
        Width = 69
        Height = 13
        Caption = #1060#1072#1082#1090'. '#1087#1083#1086#1090#1085'.:'
      end
      object Label12: TLabel
        Left = 86
        Top = 87
        Width = 70
        Height = 13
        Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072':'
      end
      object Label13: TLabel
        Left = 54
        Top = 111
        Width = 102
        Height = 13
        Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080' 15'#39#1057':'
      end
      object Label14: TLabel
        Left = 53
        Top = 137
        Width = 102
        Height = 13
        Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080' 20'#39#1057':'
      end
      object Label15: TLabel
        Left = 54
        Top = 160
        Width = 101
        Height = 13
        Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1074#1086#1076', %:'
      end
      object Label16: TLabel
        Left = 38
        Top = 181
        Width = 116
        Height = 13
        Caption = #1061#1083#1086#1088#1080#1089#1090#1099#1077' '#1089#1086#1083#1080', '#1084#1075'/'#1083':'
      end
      object Label17: TLabel
        Left = 72
        Top = 203
        Width = 84
        Height = 13
        Caption = #1052#1077#1093'.'#1087#1088#1080#1084#1077#1089#1080', %:'
      end
      object Label18: TLabel
        Left = 113
        Top = 224
        Width = 42
        Height = 13
        Caption = #1057#1077#1088#1072', %:'
      end
      object ed_pasp_num: TDBEdit
        Left = 24
        Top = 16
        Width = 97
        Height = 21
        DataField = 'PASP_NUM'
        DataSource = ds_podacha
        TabOrder = 0
      end
      object ed_pasp_date: TDBEdit
        Left = 143
        Top = 17
        Width = 81
        Height = 21
        DataField = 'PASP_DATE'
        DataSource = ds_podacha
        TabOrder = 1
      end
      object ed_rez_num: TDBEdit
        Left = 56
        Top = 39
        Width = 65
        Height = 21
        DataField = 'REZ_NUM'
        DataSource = ds_podacha
        TabOrder = 2
      end
      object ed_pl: TDBEdit
        Left = 160
        Top = 61
        Width = 65
        Height = 21
        DataField = 'PL'
        DataSource = ds_podacha
        TabOrder = 3
      end
      object ed_temper: TDBEdit
        Left = 160
        Top = 84
        Width = 65
        Height = 21
        DataField = 'TEMPER'
        DataSource = ds_podacha
        TabOrder = 4
      end
      object ed_pl15: TDBEdit
        Left = 160
        Top = 108
        Width = 65
        Height = 21
        DataField = 'PL15'
        DataSource = ds_podacha
        TabOrder = 5
      end
      object ed_pl20: TDBEdit
        Left = 160
        Top = 132
        Width = 65
        Height = 21
        DataField = 'PL20'
        DataSource = ds_podacha
        TabOrder = 6
      end
      object ed_water: TDBEdit
        Left = 160
        Top = 154
        Width = 65
        Height = 21
        DataField = 'WATER'
        DataSource = ds_podacha
        TabOrder = 7
      end
      object ed_salt: TDBEdit
        Left = 160
        Top = 176
        Width = 65
        Height = 21
        DataField = 'SALT'
        DataSource = ds_podacha
        TabOrder = 8
      end
      object ed_dirt: TDBEdit
        Left = 160
        Top = 198
        Width = 65
        Height = 21
        DataField = 'DIRT'
        DataSource = ds_podacha
        TabOrder = 9
      end
      object ed_sulfur: TDBEdit
        Left = 160
        Top = 220
        Width = 65
        Height = 21
        DataField = 'SULFUR'
        DataSource = ds_podacha
        TabOrder = 10
      end
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    Left = 383
    Top = 265
  end
  object q_pod_rows: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      
        'podacha_rows.*,podacha_rows.ROWID, '#39'['#39'||podacha_rows.rowid||'#39']'#39' ' +
        'as row_id'
      'FROM PODACHA_ROWS'
      'WHERE PODACHA_ID=0'
      'ORDER BY NUM_POS')
    QBEDefinition.QBEFieldDefs = {
      0300000012000000080000004E554D5F43495354010000000008000000434150
      41434954590100000000090000004B414C4942525F4944010000000007000000
      4E554D5F504F530100000000080000004E554D5F4B5649540100000000050000
      00565A4C49560100000000030000005645530100000000040000004158455301
      0000000007000000504C4F4D424131010000000007000000504C4F4D42413201
      0000000002000000494401000000000A000000504F44414348415F4944010000
      00000B0000005641474F574E45525F49440100000000080000005645535F4349
      53540100000000060000004E4F4D5F5A440100000000090000005A50555F5459
      5045310100000000090000005A50555F5459504532010000000006000000524F
      575F49440100000000}
    UniqueFields = 'ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'PODACHA_ROWS'
    Session = ora_Session
    BeforeOpen = q_pod_rowsBeforeOpen
    Left = 323
    Top = 177
    object q_pod_rowsNUM_POS: TFloatField
      DisplayLabel = #8470' '#1087#1086#1079'.'
      FieldName = 'NUM_POS'
      Required = True
    end
    object q_pod_rowsNUM_KVIT: TFloatField
      DisplayLabel = #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'NUM_KVIT'
    end
    object q_pod_rowsNUM_CIST: TStringField
      DisplayLabel = #8470' '#1074#1072#1075#1086#1085#1072
      FieldName = 'NUM_CIST'
      Required = True
      Size = 10
    end
    object q_pod_rowsVZLIV: TIntegerField
      DisplayLabel = #1042#1079#1083#1080#1074
      FieldName = 'VZLIV'
    end
    object q_pod_rowsVES: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'VES'
      Required = True
      DisplayFormat = '#0.000'
    end
    object q_pod_rowsCAPACITY: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086'- '#1087#1086#1076#1098#1077#1084'- '#1085#1086#1089#1090#1100
      FieldName = 'CAPACITY'
      Size = 10
    end
    object q_pod_rowsAXES: TIntegerField
      DisplayLabel = #1054#1089#1077#1081
      FieldName = 'AXES'
    end
    object q_pod_rowsPLOMBA1: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1072' 1'
      FieldName = 'PLOMBA1'
      Size = 15
    end
    object q_pod_rowsPLOMBA2: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1072' 2'
      FieldName = 'PLOMBA2'
      Size = 15
    end
    object q_pod_rowsKALIBR_ID: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'KALIBR_ID'
      Size = 5
    end
    object q_pod_rowsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_pod_rowsPODACHA_ID: TFloatField
      FieldName = 'PODACHA_ID'
      Required = True
    end
    object q_pod_rowsVAGOWNER_ID: TFloatField
      FieldName = 'VAGOWNER_ID'
    end
    object q_pod_rowsVES_CIST: TFloatField
      DisplayLabel = #1058#1072#1088#1072
      FieldName = 'VES_CIST'
      DisplayFormat = '0.000'
    end
    object q_pod_rowsVAGOWNER_NAME: TStringField
      DisplayLabel = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' / '#1074#1083#1072#1076#1077#1083#1077#1094' '#1074#1072#1075#1086#1085#1072
      FieldKind = fkLookup
      FieldName = 'VAGOWNER_NAME'
      LookupDataSet = q_VagOwner
      LookupKeyFields = 'ID'
      LookupResultField = 'DISPLAY_NAME'
      KeyFields = 'VAGOWNER_ID'
      Size = 50
      Lookup = True
    end
    object q_pod_rowsNOM_ZD: TStringField
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_pod_rowsZPU_TYPE1: TFloatField
      FieldName = 'ZPU_TYPE1'
      Required = True
    end
    object q_pod_rowsZPU_TYPE2: TFloatField
      FieldName = 'ZPU_TYPE2'
      Required = True
    end
    object q_pod_rowsROW_ID: TStringField
      FieldName = 'ROW_ID'
    end
  end
  object ds_pod_rows: TDataSource
    DataSet = q_pod_rows
    Left = 323
    Top = 213
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 319
    Top = 389
  end
  object q_VagOwner: TOracleDataSet
    SQL.Strings = (
      'select * from kls_vagowner'
      'order by display_name')
    QBEDefinition.QBEFieldDefs = {
      030000000900000002000000494401000000000D0000005641474F574E45525F
      4E414D4501000000000A00000053484F52545F4E414D45010000000009000000
      5052454450525F494401000000000D0000005641474F574E5F4D4F535F494401
      000000000D0000005641474F574E5F5459505F4944010000000009000000534F
      425354565F494401000000000C000000444953504C41595F4E414D4501000000
      00080000004F574E45525F49440100000000}
    Session = ora_Session
    Left = 423
    Top = 177
    object q_VagOwnerID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_VagOwnerDISPLAY_NAME: TStringField
      DisplayLabel = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
      FieldName = 'DISPLAY_NAME'
      Size = 50
    end
    object q_VagOwnerVAGOWNER_NAME: TStringField
      FieldName = 'VAGOWNER_NAME'
      Required = True
      Size = 30
    end
    object q_VagOwnerSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 10
    end
    object q_VagOwnerPREDPR_ID: TIntegerField
      FieldName = 'PREDPR_ID'
      Required = True
    end
    object q_VagOwnerVAGOWN_MOS_ID: TFloatField
      FieldName = 'VAGOWN_MOS_ID'
    end
    object q_VagOwnerVAGOWN_TYP_ID: TFloatField
      FieldName = 'VAGOWN_TYP_ID'
      Required = True
    end
    object q_VagOwnerSOBSTV_ID: TFloatField
      FieldName = 'SOBSTV_ID'
    end
    object q_VagOwnerOWNER_ID: TFloatField
      FieldName = 'OWNER_ID'
    end
  end
  object ds_VagOwner: TDataSource
    DataSet = q_VagOwner
    Left = 423
    Top = 213
  end
  object PrintDBGridEh1: TPrintDBGridEh
    Options = [pghFitGridToPageWidth, pghRowAutoStretch, pghFitingByColWidths, pghOptimalColWidths]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = RUSSIAN_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -8
    PageHeader.Font.Name = 'Times New Roman'
    PageHeader.Font.Style = []
    PrintFontName = 'MS Sans Serif'
    Units = MM
    Left = 323
    Top = 265
  end
  object ActionManager1: TActionManager
    ActionBars.SessionCount = 45
    ActionBars = <
      item
        AutoSize = False
      end
      item
        Items = <
          item
            Caption = '&Common'
          end>
        AutoSize = False
      end>
    Images = f_main.img_Common
    Left = 323
    Top = 333
    StyleName = 'XP Style'
    object acLoadReeSMN: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1088#1077#1077#1089#1090#1088' '#1057#1052#1053' - 1 '#1095#1072#1089#1090#1100
      ImageIndex = 39
      OnExecute = acLoadReeSMNExecute
    end
    object acLoadReeSMN_2: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1088#1077#1077#1089#1090#1088' '#1057#1052#1053' - 2 '#1095#1072#1089#1090#1100
      Enabled = False
      ImageIndex = 39
      OnExecute = acLoadReeSMN_2Execute
    end
    object acRefresh: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      ShortCut = 119
      OnExecute = acRefreshExecute
    end
    object acToXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      ImageIndex = 42
      OnExecute = acToXLSExecute
    end
    object acReeSMNToDbf: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1069#1057#1058#1040#1050#1040#1044#1059
      ImageIndex = 38
      OnExecute = acReeSMNToDbfExecute
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 448
    Top = 280
  end
  object TBPopupMenu1: TTBPopupMenu
    Left = 368
    Top = 328
    object TBItem14: TTBItem
      Action = acToXLS
    end
  end
  object q_podacha: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'podacha.*, podacha.rowid'
      'FROM PODACHA'
      'WHERE POD_DATE>=POD_DATE'
      '  AND POD_DATE<=POD_DATE'
      '  AND VETKA_OTP_ID=10'
      '  AND PROD_ID_NPR='#39'90000'#39
      'ORDER BY POD_DATE DESC,POD_NUM DESC')
    QBEDefinition.QBEFieldDefs = {
      030000001900000003000000564553010000000007000000504F445F4E554D01
      0000000008000000504F445F444154450100000000030000004B4F4C01000000
      000A000000474F544F565F4441544501000000000A0000004E414C49565F4441
      544501000000000A0000004C554B4F4D415F4E554D0100000000070000004D50
      535F4E554D010000000002000000504C01000000000600000054454D50455201
      0000000002000000494401000000000C0000004C4F41445F545950455F494401
      000000000C0000005645544B415F4F54505F49440100000000080000004D4553
      544F5F494401000000000B00000050524F445F49445F4E505201000000000400
      0000504C3135010000000004000000504C323001000000000500000057415445
      5201000000000400000053414C54010000000004000000444952540100000000
      0600000053554C465552010000000003000000444E5001000000000800000050
      4153505F4E554D010000000009000000504153505F4441544501000000000700
      000052455A5F4E554D0100000000}
    UniqueFields = 'ID'
    QueryAllRecords = False
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'PODACHA'
    Session = ora_Session
    BeforeOpen = q_podachaBeforeOpen
    AfterScroll = q_podachaAfterScroll
    Left = 371
    Top = 177
    object q_podachaPOD_NUM: TStringField
      DisplayLabel = #8470' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'POD_NUM'
      Required = True
    end
    object q_podachaPOD_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'POD_DATE'
      Required = True
    end
    object q_podachaKOL: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOL'
      Required = True
      DisplayFormat = '0000'
    end
    object q_podachaVES: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'VES'
      Required = True
      DisplayFormat = '0.000'
    end
    object q_podachaGOTOV_DATE: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1075#1086#1090#1086#1074#1085#1086#1089#1090#1080
      FieldName = 'GOTOV_DATE'
    end
    object q_podachaNALIV_DATE: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072' '#1085#1072#1083#1080#1074#1072
      FieldName = 'NALIV_DATE'
    end
    object q_podachaLUKOMA_NUM: TIntegerField
      DisplayLabel = #8470' '#1051#1059#1050#1054#1052#1040
      FieldName = 'LUKOMA_NUM'
    end
    object q_podachaMPS_NUM: TIntegerField
      DisplayLabel = #8470' '#1052#1055#1057
      FieldName = 'MPS_NUM'
    end
    object q_podachaPL: TFloatField
      DisplayLabel = #1060#1072#1082#1090'. '#1087#1083#1086#1090#1085#1086#1089#1090#1100
      FieldName = 'PL'
    end
    object q_podachaTEMPER: TFloatField
      DisplayLabel = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
      FieldName = 'TEMPER'
    end
    object q_podachaID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_podachaLOAD_TYPE_ID: TIntegerField
      FieldName = 'LOAD_TYPE_ID'
      Required = True
    end
    object q_podachaVETKA_OTP_ID: TFloatField
      FieldName = 'VETKA_OTP_ID'
      Required = True
    end
    object q_podachaMESTO_ID: TIntegerField
      FieldName = 'MESTO_ID'
      Required = True
    end
    object q_podachaPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object q_podachaPL15: TFloatField
      FieldName = 'PL15'
    end
    object q_podachaPL20: TFloatField
      FieldName = 'PL20'
    end
    object q_podachaWATER: TFloatField
      FieldName = 'WATER'
    end
    object q_podachaSALT: TFloatField
      FieldName = 'SALT'
    end
    object q_podachaDIRT: TFloatField
      FieldName = 'DIRT'
    end
    object q_podachaSULFUR: TFloatField
      FieldName = 'SULFUR'
    end
    object q_podachaDNP: TIntegerField
      FieldName = 'DNP'
    end
    object q_podachaPASP_NUM: TStringField
      FieldName = 'PASP_NUM'
    end
    object q_podachaPASP_DATE: TDateTimeField
      FieldName = 'PASP_DATE'
    end
    object q_podachaREZ_NUM: TStringField
      FieldName = 'REZ_NUM'
    end
  end
  object ds_podacha: TDataSource
    DataSet = q_podacha
    Left = 371
    Top = 213
  end
  object q_cmn: TOracleDataSet
    Session = ora_Session
    Left = 585
    Top = 218
  end
end
