object f_Inf2Pbal: Tf_Inf2Pbal
  Left = 55
  Top = 133
  Width = 948
  Height = 483
  Caption = 
    #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1087#1088#1086#1074#1086#1076#1086#1082' '#1048#1085#1092#1080#1085#1072' '#1087#1086#1079#1080#1094#1080#1103#1084' '#1088#1072#1089#1093#1086#1076#1085#1086#1081' '#1095#1072#1089#1090#1080' '#1055#1083#1072#1090#1077#1078#1085#1086#1075#1086 +
    ' '#1073#1072#1083#1072#1085#1089#1072
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 217
    Width = 940
    Height = 239
    Align = alClient
    DataSource = ds_Inf2PB_accounts
    EditActions = [geaCopyEh]
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    PopupMenu = pm_Grid
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnGetCellParams = DBGridEh1GetCellParams
    OnSortMarkingChanged = DBGridEh1SortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CONT_ID'
        Footers = <>
        Title.Caption = 'N_KLS'
        Width = 46
      end
      item
        AlwaysShowEditButton = True
        EditButtons = <>
        FieldName = 'ContName'
        Footers = <>
        Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
        Width = 173
      end
      item
        EditButtons = <>
        FieldName = 'RAS_ID'
        Footers = <>
        Title.Caption = 'N_KLS'
        Width = 43
      end
      item
        AlwaysShowEditButton = True
        EditButtons = <>
        FieldName = 'RasName'
        Footers = <>
        Title.Caption = #1042#1080#1076' '#1088#1072#1089#1095#1077#1090#1072
      end
      item
        EditButtons = <>
        FieldName = 'DEB'
        Footers = <>
        Title.Caption = #1044#1077#1073
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'KRED'
        Footers = <>
        Title.Caption = #1050#1088#1077#1076
        Width = 37
      end
      item
        AlwaysShowEditButton = True
        Checkboxes = False
        EditButtons = <>
        FieldName = 'PROMIS'
        Footers = <>
        PickList.Strings = (
          '0 - '#1055#1083#1072#1090#1077#1078
          '1 - '#1042#1086#1079#1085#1080#1082#1085#1086#1074#1077#1085#1080#1077' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1089#1090#1074#1072)
        Title.Caption = #1054#1073#1103#1079'-'#1074#1086
        Width = 53
      end
      item
        AlwaysShowEditButton = True
        EditButtons = <>
        FieldName = 'PAY_TYPE'
        Footers = <>
        PickList.Strings = (
          '1  - '#1042#1089#1077' '#1074#1080#1076#1099' '#1087#1083#1072#1090#1077#1078#1072
          '7  - '#1042#1079#1072#1080#1084#1086#1079#1072#1095#1077#1090' '#1089' '#1043#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086#1084
          '8  - '#1042#1079#1072#1080#1084#1086#1079#1072#1095#1077#1090' '#1053#1045' '#1089' '#1043#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086#1084
          '3  - '#1042#1077#1082#1089#1077#1083#1103' '#1051#1059#1050#1054#1049#1051#1072
          '4  - '#1042#1077#1082#1089#1077#1083#1103' '#1053#1045' '#1051#1059#1050#1054#1049#1051#1072
          '10 - '#1053#1072#1083#1080#1095#1085#1099#1077
          '11 - '#1041#1077#1079#1085#1072#1083#1080#1095#1085#1099#1077
          '')
        Title.Caption = #1055#1083'.'#1089#1088'-'#1074#1086
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'ACC_CODE'
        Footers = <>
        Title.Caption = #1055#1086#1079#1080#1094#1080#1103' '#1074' '#1055#1041
        Width = 96
      end
      item
        AlwaysShowEditButton = True
        DropDownWidth = 500
        EditButtons = <>
        FieldName = 'AccName'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1079#1080#1094#1080#1080
        Width = 188
      end
      item
        AlwaysShowEditButton = True
        EditButtons = <>
        FieldName = 'STATUS'
        Footers = <>
        PickList.Strings = (
          '0 - '#1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103
          '1 - '#1053#1077' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103)
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Width = 42
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 139
    Width = 940
    Height = 78
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label3: TLabel
      Left = 470
      Top = 53
      Width = 23
      Height = 13
      Caption = #1084#1077#1089'.'
    end
    object Label4: TLabel
      Left = 561
      Top = 53
      Width = 17
      Height = 13
      Caption = #1075#1086#1076
    end
    object nav_acc: TOracleNavigator
      Left = 4
      Top = 46
      Width = 180
      Height = 25
      DataSource = ds_Inf2PB_accounts
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      ConfirmDelete = False
      TabOrder = 0
    end
    object bt_Analize: TButton
      Left = 184
      Top = 46
      Width = 217
      Height = 25
      Action = ac_Inf2PBAnalize
      TabOrder = 1
    end
    object ed_mon: TMaskEdit
      Left = 416
      Top = 49
      Width = 31
      Height = 21
      EditMask = '99;1; '
      MaxLength = 2
      TabOrder = 2
      Text = '0 '
    end
    object ud_mon: TUpDown
      Left = 447
      Top = 49
      Width = 15
      Height = 21
      Associate = ed_mon
      Max = 12
      TabOrder = 3
    end
    object ed_year: TMaskEdit
      Left = 496
      Top = 49
      Width = 41
      Height = 21
      EditMask = '9999;1; '
      MaxLength = 4
      TabOrder = 4
      Text = '1'#160'999'
    end
    object ud_year: TUpDown
      Left = 537
      Top = 49
      Width = 15
      Height = 21
      Associate = ed_year
      Min = 1999
      Max = 2999
      Position = 1999
      TabOrder = 5
    end
    object bt_DelAll: TButton
      Left = 592
      Top = 48
      Width = 145
      Height = 25
      Action = ac_Inf2PBDelAll
      TabOrder = 6
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 0
      Width = 940
      Height = 41
      Align = alTop
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 7
      object Label10: TLabel
        Left = 735
        Top = 16
        Width = 24
        Height = 13
        Caption = #1044#1077#1073':'
      end
      object Label11: TLabel
        Left = 815
        Top = 16
        Width = 28
        Height = 13
        Caption = #1050#1088#1077#1076':'
      end
      object lcbox_Cont: TDBLookupComboBox
        Left = 104
        Top = 12
        Width = 223
        Height = 21
        Hint = #1057#1087#1080#1089#1086#1082' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
        DropDownRows = 15
        Enabled = False
        KeyField = 'n_kls'
        ListField = 'n_kls;naim_kls'
        ListFieldIndex = 1
        ListSource = ds_kls_cont
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = lcbox_ContCloseUp
        OnCloseUp = lcbox_ContCloseUp
      end
      object cb_Cont: TCheckBox
        Left = 8
        Top = 14
        Width = 87
        Height = 17
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090':'
        TabOrder = 1
        OnClick = cb_ContClick
      end
      object cb_Ras: TCheckBox
        Left = 336
        Top = 14
        Width = 87
        Height = 17
        Caption = #1042#1080#1076' '#1088#1072#1089#1095#1077#1090#1072':'
        TabOrder = 2
        OnClick = cb_RasClick
      end
      object lcbox_Ras: TDBLookupComboBox
        Left = 424
        Top = 12
        Width = 303
        Height = 21
        Hint = #1057#1087#1080#1089#1086#1082' '#1074#1080#1076#1086#1074' '#1088#1072#1089#1095#1077#1090#1086#1074
        DropDownRows = 15
        Enabled = False
        KeyField = 'n_kls'
        ListField = 'n_kls;naim_kls'
        ListFieldIndex = 1
        ListSource = ds_kls_ras
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = lcbox_ContCloseUp
        OnCloseUp = lcbox_RasCloseUp
      end
      object ed_deb: TEdit
        Left = 763
        Top = 11
        Width = 46
        Height = 21
        TabOrder = 4
        OnKeyDown = ed_debKeyDown
      end
      object ed_kred: TEdit
        Left = 849
        Top = 11
        Width = 47
        Height = 21
        TabOrder = 5
        OnKeyDown = ed_kredKeyDown
      end
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 940
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object N1: TTBItem
        Action = ac_Inf2PBDelSch
        DisplayMode = nbdmImageAndText
      end
      object F41_OLD: TTBItem
        Action = ac_Inf2PBNewProv
        DisplayMode = nbdmImageAndText
        Options = [tboDefault]
      end
      object N2_OLD: TTBItem
        Action = ac_Inf2PBDelProv
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = ac_Inf2PBDelAll
        DisplayMode = nbdmImageAndText
      end
      object TBItem1: TTBItem
        Action = ac_Inf2PBAnalize
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = ac_Inf2PBToDBF
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 26
    Width = 940
    Height = 113
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label5: TLabel
      Left = 9
      Top = 12
      Width = 66
      Height = 13
      Caption = #1055#1086#1080#1089#1082' '#1089#1095#1077#1090#1072':'
    end
    object Label1: TLabel
      Left = 339
      Top = 12
      Width = 26
      Height = 13
      Caption = #1057#1095#1077#1090':'
    end
    object seek_sch: TMaskEdit
      Left = 80
      Top = 8
      Width = 49
      Height = 21
      EditMask = '0000;1; '
      MaxLength = 4
      TabOrder = 0
      Text = '    '
      OnKeyDown = seek_schKeyDown
    end
    object nav_sch: TOracleNavigator
      Left = 144
      Top = 8
      Width = 184
      Height = 20
      DataSource = ds_Inf2PB_sch
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbPost, nbCancel, nbRefresh]
      TabOrder = 1
    end
    object ed_sch: TDBEdit
      Left = 370
      Top = 8
      Width = 49
      Height = 21
      DataField = 'SCH'
      DataSource = ds_Inf2PB_sch
      TabOrder = 2
    end
    object ed_sch_name: TDBEdit
      Left = 426
      Top = 8
      Width = 487
      Height = 21
      DataField = 'SCH_NAME'
      DataSource = ds_Inf2PB_sch
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 33
      Width = 940
      Height = 80
      Align = alBottom
      Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1072#1085#1072#1083#1080#1090#1080#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object rg_cont: TDBRadioGroup
        Left = 3
        Top = 12
        Width = 132
        Height = 65
        Caption = ' '#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090' '
        Columns = 3
        DataField = 'CONT_AN'
        DataSource = ds_Inf2PB_sch
        Items.Strings = (
          #1053#1077#1090
          '1'
          '2'
          '3'
          '4'
          '5')
        TabOrder = 0
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5')
      end
      object rg_ras: TDBRadioGroup
        Left = 138
        Top = 12
        Width = 132
        Height = 65
        Caption = ' '#1042#1080#1076' '#1088#1072#1089#1095#1077#1090#1072' '
        Columns = 3
        DataField = 'RAS_AN'
        DataSource = ds_Inf2PB_sch
        Items.Strings = (
          #1053#1077#1090
          '1'
          '2'
          '3'
          '4'
          '5')
        TabOrder = 1
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5')
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 274
        Top = 12
        Width = 132
        Height = 65
        Caption = ' '#1044#1086#1075#1086#1074#1086#1088' '
        Columns = 3
        DataField = 'DOG_AN'
        DataSource = ds_Inf2PB_sch
        Items.Strings = (
          #1053#1077#1090
          '1'
          '2'
          '3'
          '4'
          '5')
        TabOrder = 2
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5')
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 546
        Top = 12
        Width = 132
        Height = 65
        Caption = ' '#1055#1088#1086#1089#1088#1086#1095#1082#1072' '
        Columns = 3
        DataField = 'PAYOFF_AN'
        DataSource = ds_Inf2PB_sch
        Items.Strings = (
          #1053#1077#1090
          '1'
          '2'
          '3'
          '4'
          '5')
        TabOrder = 3
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5')
      end
      object DBRadioGroup3: TDBRadioGroup
        Left = 410
        Top = 12
        Width = 132
        Height = 65
        Caption = ' '#1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072' '#1092#1072#1082#1090#1091#1088#1099' '
        Columns = 3
        DataField = 'NUM_AN'
        DataSource = ds_Inf2PB_sch
        Items.Strings = (
          #1053#1077#1090
          '1'
          '2'
          '3'
          '4'
          '5')
        TabOrder = 4
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5')
      end
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    Left = 732
    Top = 280
  end
  object q_Inf2PB_accounts: TOracleDataSet
    SQL.Strings = (
      'SELECT INF2PB_ACCOUNTS.ROWID, INF2PB_ACCOUNTS.*'
      'FROM INF2PB_ACCOUNTS'
      'WHERE ID>0'
      '  AND INF2PB_SCH_ID=:INF2PB_SCH_ID'
      '  AND 1=1'
      '  AND 1=1'
      '  AND 1=1'
      '  AND 1=1'
      
        'ORDER BY trim(cont_id), trim(ras_id), trim(promis), trim(deb), t' +
        'rim(kred)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    Variables.Data = {
      03000000010000000E0000003A494E463250425F5343485F4944030000000400
      00000300000000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_INF2PB_ACCOUNTS'
    QBEDefinition.QBEFieldDefs = {
      030000000A000000020000004944010000000007000000434F4E545F49440100
      0000000600000050524F4D49530100000000080000005041595F545950450100
      000000080000004143435F434F44450100000000060000005354415455530100
      0000000D000000494E463250425F5343485F4944010000000006000000524153
      5F49440100000000030000004445420100000000040000004B52454401000000
      00}
    UniqueFields = 'ID'
    Master = q_Inf2PB_sch
    MasterFields = 'ID'
    DetailFields = 'INF2PB_SCH_ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'INF2PB_ACCOUNTS'
    CachedUpdates = True
    Session = ora_Session
    BeforeInsert = q_Inf2PB_accountsBeforeInsert
    AfterPost = q_Inf2PB_accountsAfterPost
    BeforeDelete = q_Inf2PB_accountsBeforeDelete
    AfterDelete = q_Inf2PB_accountsAfterDelete
    OnDeleteError = q_Inf2PB_accountsDeleteError
    Left = 368
    Top = 352
    object q_Inf2PB_accountsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_Inf2PB_accountsINF2PB_SCH_ID: TFloatField
      FieldName = 'INF2PB_SCH_ID'
      Required = True
    end
    object q_Inf2PB_accountsCONT_ID: TStringField
      FieldName = 'CONT_ID'
      Required = True
      Size = 10
    end
    object q_Inf2PB_accountsRAS_ID: TStringField
      FieldName = 'RAS_ID'
      Required = True
      Size = 10
    end
    object q_Inf2PB_accountsACC_CODE: TStringField
      FieldName = 'ACC_CODE'
      Size = 21
    end
    object q_Inf2PB_accountsContName: TStringField
      FieldKind = fkLookup
      FieldName = 'ContName'
      LookupDataSet = q_kls_cont
      LookupKeyFields = 'n_kls'
      LookupResultField = 'naim_kls'
      KeyFields = 'CONT_ID'
      Size = 30
      Lookup = True
    end
    object q_Inf2PB_accountsRasName: TStringField
      FieldKind = fkLookup
      FieldName = 'RasName'
      LookupDataSet = q_kls_ras
      LookupKeyFields = 'n_kls'
      LookupResultField = 'naim_kls'
      KeyFields = 'RAS_ID'
      Size = 30
      Lookup = True
    end
    object q_Inf2PB_accountsAccName: TStringField
      FieldKind = fkLookup
      FieldName = 'AccName'
      LookupDataSet = q_Accounts
      LookupKeyFields = 'ACCOUNT_CODE'
      LookupResultField = 'NAME'
      KeyFields = 'ACC_CODE'
      Size = 30
      Lookup = True
    end
    object q_Inf2PB_accountsPROMIS: TStringField
      FieldName = 'PROMIS'
      Required = True
      Size = 1
    end
    object q_Inf2PB_accountsSTATUS: TStringField
      FieldName = 'STATUS'
      Required = True
      Size = 1
    end
    object q_Inf2PB_accountsPAY_TYPE: TStringField
      FieldName = 'PAY_TYPE'
      Required = True
      Size = 3
    end
    object q_Inf2PB_accountsDEB: TStringField
      FieldName = 'DEB'
      Size = 4
    end
    object q_Inf2PB_accountsKRED: TStringField
      FieldName = 'KRED'
      Size = 4
    end
  end
  object ds_Inf2PB_accounts: TDataSource
    DataSet = q_Inf2PB_accounts
    Left = 456
    Top = 356
  end
  object pm_Grid: TPopupMenu
    Images = f_main.img_Common
    Left = 304
    Top = 352
    object N1_OLD: TMenuItem
      Action = ac_Inf2PBDelSch
    end
    object F41_OLD_OLD_OLD: TMenuItem
      Action = ac_Inf2PBNewProv
      Default = True
    end
    object N2_OLD_OLD_OLD: TMenuItem
      Action = ac_Inf2PBDelProv
    end
    object N2: TMenuItem
      Action = ac_Inf2PBAnalize
    end
    object N3: TMenuItem
      Action = ac_Inf2PBDelAll
    end
    object DBF1: TMenuItem
      Action = ac_Inf2PBToDBF
    end
  end
  object FormStorage1: TFormStorage
    Options = [fpPosition]
    UseRegistry = True
    StoredValues = <>
    Left = 208
    Top = 348
  end
  object ActionManager1: TActionManager
    ActionBars.SessionCount = 25
    ActionBars = <
      item
        Items = <
          item
            Action = ac_Inf2PBNewProv
            ImageIndex = 0
            ShortCut = 45
          end
          item
            Action = ac_Inf2PBDelProv
            ImageIndex = 5
          end>
        AutoSize = False
      end>
    Images = f_main.img_Common
    Left = 212
    Top = 284
    StyleName = 'XP Style'
    object ac_Inf2PBDelSch: TAction
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1089#1095#1077#1090#1072
      ImageIndex = 5
      OnExecute = ac_Inf2PBDelSchExecute
    end
    object ac_Inf2PBNewProv: TAction
      Caption = #1053#1086#1074#1072#1103' '#1087#1088#1086#1074#1086#1076#1082#1072
      ImageIndex = 0
      ShortCut = 45
      OnExecute = ac_Inf2PBNewProvExecute
    end
    object ac_Inf2PBDelProv: TAction
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1087#1088#1086#1074#1086#1076#1082#1080
      ImageIndex = 5
      OnExecute = ac_Inf2PBDelProvExecute
    end
    object ac_Inf2PBDelAll: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1087#1088#1086#1074#1086#1076#1082#1080
      ImageIndex = 5
      OnExecute = ac_Inf2PBDelAllExecute
    end
    object ac_Inf2PBAnalize: TAction
      Caption = #1055#1088#1086#1072#1085#1072#1083#1080#1079#1080#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083' '#1087#1088#1086#1074#1086#1076#1086#1082
      ImageIndex = 7
      OnExecute = ac_Inf2PBAnalizeExecute
    end
    object ac_Inf2PBToDBF: TAction
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' DBF'
      ImageIndex = 13
      OnExecute = ac_Inf2PBToDBFExecute
    end
  end
  object q_Inf2PB_sch: TOracleDataSet
    SQL.Strings = (
      'SELECT INF2PB_SCH.RowID,INF2PB_SCH.* FROM INF2PB_SCH'
      'ORDER BY SCH')
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_INF2PB_SCH'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      0300000008000000020000004944010000000003000000534348010000000007
      000000434F4E545F414E0100000000060000005241535F414E01000000000800
      00005343485F4E414D45010000000006000000444F475F414E01000000000600
      00004E554D5F414E0100000000090000005041594F46465F414E0100000000}
    UniqueFields = 'ID'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'INF2PB_sch'
    CachedUpdates = True
    Session = ora_Session
    BeforeClose = q_Inf2PB_schBeforeClose
    AfterPost = q_Inf2PB_schAfterPost
    BeforeDelete = q_Inf2PB_schBeforeDelete
    AfterDelete = q_Inf2PB_schAfterDelete
    BeforeScroll = q_Inf2PB_schBeforeScroll
    AfterScroll = q_Inf2PB_schAfterScroll
    OnDeleteError = q_Inf2PB_schDeleteError
    Left = 560
    Top = 376
    object q_Inf2PB_schID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_Inf2PB_schSCH: TStringField
      FieldName = 'SCH'
      Required = True
      Size = 4
    end
    object q_Inf2PB_schCONT_AN: TIntegerField
      FieldName = 'CONT_AN'
      Required = True
    end
    object q_Inf2PB_schRAS_AN: TIntegerField
      FieldName = 'RAS_AN'
      Required = True
    end
    object q_Inf2PB_schSCH_NAME: TStringField
      FieldName = 'SCH_NAME'
      Size = 50
    end
    object q_Inf2PB_schDOG_AN: TIntegerField
      FieldName = 'DOG_AN'
    end
    object q_Inf2PB_schNUM_AN: TIntegerField
      FieldName = 'NUM_AN'
    end
    object q_Inf2PB_schPAYOFF_AN: TIntegerField
      FieldName = 'PAYOFF_AN'
    end
  end
  object ds_Inf2PB_sch: TDataSource
    DataSet = q_Inf2PB_sch
    Left = 616
    Top = 376
  end
  object cnn_Infin: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=pf;Mode=ReadWrite;Extended Properties="DSN=pf;UID=;PWD=;So' +
      'urceDB=u:\luk\dbases;SourceType=DBF;Exclusive=No;BackgroundFetch' +
      '=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"'
    DefaultDatabase = 'i:\infin\'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 671
    Top = 284
  end
  object q_Kls_ch: TADOQuery
    Connection = cnn_Infin
    Parameters = <>
    SQL.Strings = (
      'SELECT ch_naim,an1,an2,an3,an4,an5'
      'FROM '#39'I:\INFIN\G2001\M11\kls_ch.dbf'#39
      'WHERE chet='#39'6000'#39)
    Left = 296
    Top = 288
    object q_Kls_chan1: TIntegerField
      FieldName = 'an1'
    end
    object q_Kls_chan2: TIntegerField
      FieldName = 'an2'
    end
    object q_Kls_chan3: TIntegerField
      FieldName = 'an3'
    end
    object q_Kls_chan4: TIntegerField
      FieldName = 'an4'
    end
    object q_Kls_chan5: TIntegerField
      FieldName = 'an5'
    end
    object q_Kls_chch_naim: TStringField
      DisplayWidth = 50
      FieldName = 'ch_naim'
      FixedChar = True
      Size = 50
    end
  end
  object q_kls_cont: TADOQuery
    Connection = cnn_Infin
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT n_kls,naim_kls'
      'FROM '#39'I:\INFIN\G2001\DBF\kls_21.dbf'#39
      'ORDER BY naim_kls'
      '')
    Left = 128
    Top = 344
    object q_kls_contn_kls: TStringField
      FieldName = 'n_kls'
      FixedChar = True
      Size = 10
    end
    object q_kls_contnaim_kls: TStringField
      FieldName = 'naim_kls'
      FixedChar = True
      Size = 30
    end
  end
  object q_kls_ras: TADOQuery
    Connection = cnn_Infin
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT n_kls,naim_kls'
      'FROM '#39'C:\TMP\kls_21.dbf'#39
      'ORDER BY naim_kls'
      '')
    Left = 136
    Top = 272
    object q_kls_rasn_kls: TStringField
      FieldName = 'n_kls'
      FixedChar = True
      Size = 10
    end
    object q_kls_rasnaim_kls: TStringField
      FieldName = 'naim_kls'
      FixedChar = True
      Size = 30
    end
  end
  object ds_kls_cont: TDataSource
    DataSet = q_kls_cont
    Left = 72
    Top = 272
  end
  object ds_kls_ras: TDataSource
    DataSet = q_kls_ras
    Left = 72
    Top = 336
  end
  object pbal_Session: TOracleSession
    LogonUsername = 'KTU2001'
    LogonPassword = 'KTU2001'
    LogonDatabase = 'buh'
    Left = 604
    Top = 280
  end
  object q_Accounts: TOracleDataSet
    SQL.Strings = (
      'SELECT A.ACCOUNT_CODE,A.NAME'
      'FROM ACCOUNT A'
      'WHERE A.BAL_SECTION_ID=2'
      'AND NOT EXISTS (SELECT * FROM ACCOUNT B WHERE A.ID=B.PARENT_ID)')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000C0000004143434F554E545F434F44450100000000040000
      004E414D450100000000}
    Session = pbal_Session
    Left = 368
    Top = 288
  end
  object q_seek_sch: TOracleDataSet
    SQL.Strings = (
      'SELECT sch FROM inf2pb_sch'
      '')
    Session = ora_Session
    Left = 528
    Top = 296
  end
  object q_append_acc: TOracleDataSet
    SQL.Strings = (
      'SELECT sch FROM inf2pb_sch'
      '')
    Session = ora_Session
    Left = 448
    Top = 296
  end
  object q_analize: TADOQuery
    Connection = cnn_Infin
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  kls_cont.n_kls AS cont_id,'
      '  kls_ras.n_kls AS ras_id,'
      '  schet.dt_kt,'
      '  schet.korr'
      
        'FROM '#39'I:\INFIN\G2001\M09\s6019.dbf'#39' schet,'#39'I:\INFIN\G2001\DBF\kl' +
        's_21.dbf'#39' kls_cont,'#39'I:\INFIN\G2001\DBF\kls_94.dbf'#39' kls_ras'
      'WHERE 1=1 AND NOT EMPTY(schet.korr)'
      '  AND schet.an1=kls_cont.rec'
      '  AND ALLT(kls_cont.n_kls)='#39'309'#39
      '  AND schet.an2=kls_ras.rec'
      '  AND ALLT(kls_ras.n_kls)='#39'274'#39
      '  AND 1=1'
      '  AND 1=1'
      'GROUP BY 1,2,3,4'
      '')
    Left = 464
    Top = 224
  end
  object DataSource1: TDataSource
    DataSet = q_analize
    Left = 520
    Top = 232
  end
end
