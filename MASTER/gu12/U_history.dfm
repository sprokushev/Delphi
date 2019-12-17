object f_history: Tf_history
  Left = 216
  Top = 202
  Width = 800
  Height = 600
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock2: TTBDock
    Left = 0
    Top = 0
    Width = 792
    Height = 26
    object TBToolbar2: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar2'
      DragHandleStyle = dhNone
      TabOrder = 0
      object TBItem1: TTBItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        DisplayMode = nbdmImageAndText
        ImageIndex = 11
        Images = f_main.img_Common
        OnClick = TBItem1Click
      end
      object TBItem2: TTBItem
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
        DisplayMode = nbdmImageAndText
        ImageIndex = 16
        Images = f_main.img_Common
        OnClick = TBItem2Click
      end
      object TBItem3: TTBItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077
        DisplayMode = nbdmImageAndText
        ImageIndex = 10
        Images = f_main.img_Common
        OnClick = TBItem3Click
      end
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 26
    Width = 792
    Height = 61
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Align = alLeft
      Caption = 'TBToolbar1'
      DockPos = 0
      DragHandleStyle = dhNone
      TabOrder = 0
      object TBControlItem1: TTBControlItem
        Control = GroupBox1
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 780
        Height = 57
        Caption = #1060#1080#1083#1100#1090#1088
        TabOrder = 0
        object Label2: TLabel
          Left = 8
          Top = 24
          Width = 73
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
        end
        object e_histnomz: TEdit
          Left = 88
          Top = 24
          Width = 145
          Height = 21
          TabOrder = 0
          OnKeyPress = e_histnomzKeyPress
        end
      end
    end
  end
  object TabbedNotebook: TTabbedNotebook
    Left = 0
    Top = 87
    Width = 792
    Height = 479
    Align = alClient
    PageIndex = 2
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'MS Sans Serif'
    TabFont.Style = []
    TabOrder = 2
    object TTabPage
      Left = 4
      Top = 24
      Caption = #1047#1072#1103#1074#1082#1080
      object Label1: TLabel
        Left = 0
        Top = 320
        Width = 97
        Height = 13
        Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1079#1072#1103#1074#1082#1080
      end
      object g_zayav: TDBGridEh
        Left = 0
        Top = 0
        Width = 784
        Height = 310
        Align = alTop
        DataSource = ds_hist_a
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
        OnGetCellParams = g_zayavGetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'OSUSER'
            Footers = <>
            Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            Width = 107
          end
          item
            EditButtons = <>
            FieldName = 'EVENT_TYPE'
            Footers = <>
            Title.Caption = #1044#1077#1081#1089#1090#1074#1080#1077
            Width = 115
          end
          item
            EditButtons = <>
            FieldName = 'EVENT_TIME'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
          end
          item
            EditButtons = <>
            FieldName = 'NOM_Z'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
          end
          item
            EditButtons = <>
            FieldName = 'PROD'
            Footers = <>
            Title.Caption = #1055#1088#1086#1076#1091#1082#1090
          end
          item
            EditButtons = <>
            FieldName = 'FROM_DATE'
            Footers = <>
            Title.Caption = #1057
          end
          item
            EditButtons = <>
            FieldName = 'TO_DATE'
            Footers = <>
            Title.Caption = #1055#1086
          end
          item
            EditButtons = <>
            FieldName = 'REG_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          end
          item
            EditButtons = <>
            FieldName = 'WHATWASDONE'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103
          end
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
          end>
      end
      object DBMemo1: TDBMemo
        Left = 0
        Top = 338
        Width = 777
        Height = 110
        DataField = 'WHATWASDONE'
        DataSource = ds_hist_a
        TabOrder = 1
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = #1056#1077#1081#1089#1099
      object Label3: TLabel
        Left = 0
        Top = 320
        Width = 91
        Height = 13
        Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1088#1077#1081#1089#1072
      end
      object g_hist_b: TDBGridEh
        Left = 0
        Top = 0
        Width = 784
        Height = 310
        Align = alTop
        DataSource = ds_hist_b
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
        OnGetCellParams = g_hist_bGetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'OSUSER'
            Footers = <>
            Title.Caption = #1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          end
          item
            EditButtons = <>
            FieldName = 'EVENT_TYPE'
            Footers = <>
            Title.Caption = #1044#1077#1081#1089#1090#1074#1080#1077
            Width = 91
          end
          item
            EditButtons = <>
            FieldName = 'EVENT_TIME'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
          end
          item
            EditButtons = <>
            FieldName = 'NOM_Z'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
          end
          item
            EditButtons = <>
            FieldName = 'PROD'
            Footers = <>
            Title.Caption = #1055#1088#1086#1076#1091#1082#1090
          end
          item
            EditButtons = <>
            FieldName = 'STANNAZN'
            Footers = <>
            Title.Caption = #1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
          end
          item
            EditButtons = <>
            FieldName = 'KOL_VAG'
            Footers = <>
            Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footers = <>
            Title.Caption = #1042#1077#1089
          end
          item
            EditButtons = <>
            FieldName = 'PLAT_NAME'
            Footers = <>
            Title.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
          end
          item
            EditButtons = <>
            FieldName = 'WHATWASDONE'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103
          end
          item
            EditButtons = <>
            FieldName = 'ID_A'
            Footers = <>
            Visible = False
          end>
      end
      object DBMemo2: TDBMemo
        Left = 0
        Top = 338
        Width = 785
        Height = 110
        DataField = 'WHATWASDONE'
        DataSource = ds_hist_b
        TabOrder = 1
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = #1056#1072#1079#1073#1080#1074#1082#1072
      object Label4: TLabel
        Left = 0
        Top = 320
        Width = 58
        Height = 13
        Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 784
        Height = 310
        Align = alTop
        DataSource = ds_hist_br
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
        OnGetCellParams = DBGridEh1GetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'OSUSER'
            Footers = <>
            Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            Width = 98
          end
          item
            EditButtons = <>
            FieldName = 'EVENT_TYPE'
            Footers = <>
            Title.Caption = #1044#1077#1081#1089#1090#1074#1080#1077
            Width = 71
          end
          item
            EditButtons = <>
            FieldName = 'EVENT_TIME'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
          end
          item
            EditButtons = <>
            FieldName = 'NOM_Z'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'DATE_R'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1088#1072#1079#1073#1080#1074#1082#1080
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'STANNAZN'
            Footers = <>
            Title.Caption = #1057#1090#1072#1085#1094#1080#1103
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'KOL_VAG'
            Footers = <>
            Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
            Width = 37
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footers = <>
            Title.Caption = #1042#1077#1089
            Width = 34
          end
          item
            EditButtons = <>
            FieldName = 'PROD'
            Footers = <>
            Title.Caption = #1055#1088#1086#1076#1091#1082#1090
          end
          item
            EditButtons = <>
            FieldName = 'PLAT_NAME'
            Footers = <>
            Title.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
          end
          item
            EditButtons = <>
            FieldName = 'WHATWASDONE'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103
          end>
      end
      object DBMemo3: TDBMemo
        Left = 0
        Top = 338
        Width = 777
        Height = 103
        DataField = 'WHATWASDONE'
        DataSource = ds_hist_br
        TabOrder = 1
      end
    end
  end
  object q_hist_a: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      'L.ID'
      ',L.OSUSER'
      ',L.EVENT_TYPE AS EVENT_KOD'
      ',(CASE'
      '       WHEN L.EVENT_TYPE='#39'I'#39' THEN '#39#1053#1054#1042#1040#1071' '#1047#1040#1071#1042#1050#1040#39
      '       WHEN L.EVENT_TYPE='#39'U'#39' THEN '#39#1048#1047#1052#1045#1053#1045#1053#1048#1045#39
      '       WHEN L.EVENT_TYPE='#39'D'#39' THEN '#39#1059#1044#1040#1051#1045#1053#1048#1045#39
      #9'     ELSE '#39'???'#39
      '  END) AS EVENT_TYPE'
      ',TO_CHAR(L.WHATWASDONE) AS WHATWASDONE'
      ',EVENT_TIME'
      ',A.NOM_Z'
      ',A.FROM_DATE'
      ',A.TO_DATE'
      ',A.REG_DATE'
      ',KP.NAME AS PROD'
      ',L.TABLE_ID'
      ',A.IS_DEL'
      'FROM MASTER_SHADOW.TABLE_ACTIVITY_LOG L'
      ',(SELECT GU12_A.*,0 AS IS_DEL FROM GU12_A'
      '    UNION ALL'
      
        '  SELECT MASTER_SHADOW.GU12_A_DELETED.*,1 AS IS_DEL FROM MASTER_' +
        'SHADOW.GU12_A_DELETED) A'
      ',KLS_PROD_GU12 KP'
      'WHERE L.TABLE_NAME='#39'GU12_A'#39
      'AND L.TABLE_ID=A.ID(+)'
      'AND A.PROD_ID=KP.ID(+)'
      'ORDER BY L.EVENT_TIME DESC,A.NOM_Z,L.OSUSER')
    QBEDefinition.QBEFieldDefs = {
      030000000D0000000200000049440100000000060000004F5355534552010000
      00000A0000004556454E545F5459504501000000000B00000057484154574153
      444F4E4500000000000A0000004556454E545F54494D45010000000005000000
      4E4F4D5F5A01000000000900000046524F4D5F44415445010000000007000000
      544F5F444154450100000000080000005245475F444154450100000000040000
      0050524F440100000000090000004556454E545F4B4F44010000000008000000
      5441424C455F494401000000000600000049535F44454C0100000000}
    Session = f_main.ora_Session
    Filtered = True
    AfterScroll = q_hist_aAfterScroll
    Left = 344
    Top = 48
  end
  object ds_hist_a: TDataSource
    DataSet = q_hist_a
    Left = 376
    Top = 48
  end
  object ActManHist: TActionManager
    Left = 312
    Top = 48
    StyleName = 'XP Style'
    object acSetFiltHistZ: TAction
      Caption = 'acSetFiltHistZ'
      OnExecute = acSetFiltHistZExecute
    end
  end
  object q_hist_b: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'L.ID'
      ',L.OSUSER'
      ',L.EVENT_TYPE AS EVENT_KOD'
      ',L.TABLE_ID'
      ',(CASE'
      '       WHEN L.EVENT_TYPE='#39'I'#39' THEN '#39#1053#1054#1042#1067#1049' '#1056#1045#1049#1057#39
      '       WHEN L.EVENT_TYPE='#39'U'#39' THEN '#39#1048#1047#1052#1045#1053#1045#1053#1048#1045#39
      '       WHEN L.EVENT_TYPE='#39'D'#39' THEN '#39#1059#1044#1040#1051#1045#1053#1048#1045#39
      #9'     ELSE '#39'???'#39
      '  END) AS EVENT_TYPE'
      ',TO_CHAR(L.WHATWASDONE) AS WHATWASDONE'
      ',EVENT_TIME'
      ',B.IS_DEL'
      ',SN.STAN_NAME AS STANNAZN'
      ',B.KOL_VAG'
      ',B.VES'
      ',PL.PLAT_NAME'
      ',A.NOM_Z'
      ',B.ID_A'
      ',B.ID AS ID_B'
      ',KP.NAME AS PROD'
      'FROM MASTER_SHADOW.TABLE_ACTIVITY_LOG L'
      
        ',(SELECT GU12_B.*,0 AS IS_DEL FROM GU12_B UNION ALL SELECT MASTE' +
        'R_SHADOW.GU12_B_DELETED.*,1 AS IS_DEL FROM MASTER_SHADOW.GU12_B_' +
        'DELETED) B'
      
        ',(SELECT GU12_A.*,0 AS IS_DEL FROM GU12_A UNION ALL SELECT MASTE' +
        'R_SHADOW.GU12_A_DELETED.*,1 AS IS_DEL FROM MASTER_SHADOW.GU12_A_' +
        'DELETED) A'
      ',V_GU12_STAN_NAZN SN'
      ',V_GU12_PLAT PL'
      ',KLS_PROD_GU12 KP'
      'WHERE L.TABLE_NAME='#39'GU12_B'#39
      'AND L.TABLE_ID=B.ID(+)'
      'AND B.STAN_ID=SN.ID(+)'
      'AND B.PLAT_ID=PL.PLAT_ID(+)'
      'AND B.ID_A=A.ID(+)'
      'AND A.PROD_ID=KP.ID(+)'
      'ORDER BY L.EVENT_TIME DESC,L.OSUSER')
    QBEDefinition.QBEFieldDefs = {
      03000000100000000200000049440100000000060000004F5355534552010000
      0000090000004556454E545F4B4F440100000000080000005441424C455F4944
      01000000000A0000004556454E545F5459504501000000000B00000057484154
      574153444F4E4501000000000A0000004556454E545F54494D45010000000006
      00000049535F44454C0100000000080000005354414E4E415A4E010000000007
      0000004B4F4C5F56414701000000000300000056455301000000000900000050
      4C41545F4E414D450100000000050000004E4F4D5F5A01000000000400000049
      445F4101000000000400000049445F4201000000000400000050524F44010000
      0000}
    Session = f_main.ora_Session
    Filtered = True
    Left = 424
    Top = 48
  end
  object ds_hist_b: TDataSource
    DataSet = q_hist_b
    Left = 456
    Top = 48
  end
  object q_hist_br: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'L.ID'
      ',L.OSUSER'
      ',L.EVENT_TYPE AS EVENT_KOD'
      ',L.TABLE_ID'
      ',(CASE'
      '       WHEN L.EVENT_TYPE='#39'I'#39' THEN '#39#1053#1054#1042#1040#1071' '#1056#1040#1047#1041#1048#1042#1050#1040#39
      '       WHEN L.EVENT_TYPE='#39'U'#39' THEN '#39#1048#1047#1052#1045#1053#1045#1053#1048#1045#39
      '       WHEN L.EVENT_TYPE='#39'D'#39' THEN '#39#1059#1044#1040#1051#1045#1053#1048#1045#39
      #9'     ELSE '#39'???'#39
      '  END) AS EVENT_TYPE'
      ',TO_CHAR(L.WHATWASDONE) AS WHATWASDONE'
      ',L.EVENT_TIME'
      ',BR.IS_DEL'
      ',SN.STAN_NAME AS STANNAZN'
      ',BR.DATE_R'
      ',BR.KOL_VAG'
      ',BR.VES'
      ',PL.PLAT_NAME'
      ',A.NOM_Z'
      ',B.ID_A'
      ',B.ID AS ID_B'
      ',KP.NAME_NPR AS PROD'
      'FROM MASTER_SHADOW.TABLE_ACTIVITY_LOG L'
      
        ',(SELECT GU12_BR.*,0 AS IS_DEL FROM GU12_BR UNION ALL SELECT MAS' +
        'TER_SHADOW.GU12_BR_DELETED.*,1 AS IS_DEL FROM MASTER_SHADOW.GU12' +
        '_BR_DELETED) BR'
      
        ',(SELECT GU12_B.*,0 AS IS_DEL FROM GU12_B UNION ALL SELECT MASTE' +
        'R_SHADOW.GU12_B_DELETED.*,1 AS IS_DEL FROM MASTER_SHADOW.GU12_B_' +
        'DELETED) B'
      
        ',(SELECT GU12_A.*,0 AS IS_DEL FROM GU12_A UNION ALL SELECT MASTE' +
        'R_SHADOW.GU12_A_DELETED.*,1 AS IS_DEL FROM MASTER_SHADOW.GU12_A_' +
        'DELETED) A'
      ',V_GU12_STAN_NAZN SN'
      ',V_GU12_PLAT PL'
      ',KLS_PROD KP'
      'WHERE L.TABLE_NAME='#39'GU12_BR'#39
      'AND L.TABLE_ID=BR.ID(+)'
      'AND B.STAN_ID=SN.ID(+)'
      'AND B.PLAT_ID=PL.PLAT_ID(+)'
      'AND B.ID_A=A.ID(+)'
      'AND BR.ID_B=B.ID(+)'
      'AND BR.ID_NPR=KP.ID_NPR(+)'
      'ORDER BY L.EVENT_TIME DESC,L.OSUSER')
    QBEDefinition.QBEFieldDefs = {
      03000000110000000200000049440100000000060000004F5355534552010000
      0000090000004556454E545F4B4F440100000000080000005441424C455F4944
      01000000000A0000004556454E545F5459504501000000000B00000057484154
      574153444F4E4501000000000A0000004556454E545F54494D45010000000006
      00000049535F44454C0100000000080000005354414E4E415A4E010000000006
      000000444154455F520100000000070000004B4F4C5F56414701000000000300
      0000564553010000000009000000504C41545F4E414D45010000000005000000
      4E4F4D5F5A01000000000400000049445F4101000000000400000049445F4201
      000000000400000050524F440100000000}
    Session = f_main.ora_Session
    Filtered = True
    Left = 528
    Top = 50
  end
  object ds_hist_br: TDataSource
    DataSet = q_hist_br
    Left = 560
    Top = 50
  end
end
