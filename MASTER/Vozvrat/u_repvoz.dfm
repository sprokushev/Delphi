object f_repvoz: Tf_repvoz
  Left = 354
  Top = 146
  Width = 637
  Height = 545
  Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1086#1079#1074#1088#1072#1090#1091' '#1074#1072#1075#1086#1085#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 629
    Height = 54
    object TBToolbar2: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar2'
      DragHandleStyle = dhNone
      TabOrder = 0
      object TBControlItem2: TTBControlItem
        Control = GroupBox1
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 343
        Height = 50
        Caption = #1055#1077#1088#1080#1086#1076
        TabOrder = 0
        object But_refresh: TSpeedButton
          Left = 217
          Top = 10
          Width = 121
          Height = 35
          Caption = '     '#1054#1073#1085#1086#1074#1080#1090#1100
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
          OnClick = acRequeryExecute
        end
        object c_dbeg: TDBDateTimeEditEh
          Left = 8
          Top = 16
          Width = 97
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 0
          Visible = True
          OnChange = c_dbegChange
          OnClick = c_dbegChange
          OnExit = c_dbegChange
        end
        object c_dend: TDBDateTimeEditEh
          Left = 111
          Top = 16
          Width = 97
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 1
          Visible = True
          OnChange = c_dendChange
        end
      end
    end
  end
  object TBDock2: TTBDock
    Left = 0
    Top = 108
    Width = 629
    Height = 304
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      AutoResize = False
      Caption = 'TBToolbar1'
      DragHandleStyle = dhNone
      Options = [tboToolbarStyle]
      TabOrder = 0
      object TBControlItem1: TTBControlItem
        Control = GridSource
      end
      object TBControlItem3: TTBControlItem
        Control = Panel1
      end
      object TBControlItem4: TTBControlItem
        Control = GridSelect
      end
      object GridSource: TDBGridEh
        Left = 0
        Top = 0
        Width = 120
        Height = 300
        DataSource = ds_numakt
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
        OnDblClick = GridSourceDblClick
        OnKeyPress = GridSourceKeyPress
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NUM_AKT'
            Footers = <>
            Title.Caption = #1057#1087#1080#1089#1086#1082' '#1072#1082#1090#1086#1074
            Width = 84
          end>
      end
      object Panel1: TPanel
        Left = 120
        Top = 0
        Width = 97
        Height = 300
        TabOrder = 1
        object SpeedButton1: TSpeedButton
          Left = 31
          Top = 24
          Width = 37
          Height = 33
          Action = acSelone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76020000424D7602000000000000760000002800000020000000200000000100
            0400000000000002000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            F0777777777777777777777777777777F4007777777777777777777777777777
            F8440077777777777777777777777777F8884400777777777777777777777777
            F8888844007777777777777777777777F888888888F777777777777777777777
            F8888888FF7777777777777777777777F88888FF777777777777777777777777
            F888FF77777777777777777777777777F8FF7777777777777777777777777777
            FF77777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777}
          Layout = blGlyphBottom
          ParentFont = False
        end
        object SpeedButton2: TSpeedButton
          Left = 31
          Top = 64
          Width = 37
          Height = 33
          Action = acSelall
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76020000424D7602000000000000760000002800000020000000200000000100
            0400000000000002000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            77777777777777777777777777777777777777777777777777777777777F0777
            777F07777777777777777777777F4007777F40077777777777777777777F8440
            077F84400777777777777777777F8884400F88844007777777777777777F8888
            844008888440077777777777777F888888888F8888888F7777777777777F8888
            888FF888888FF77777777777777F88888FFF88888FF7777777777777777F888F
            F77F888FF777777777777777777F8FF7777F8FF77777777777777777777FF777
            777FF77777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777}
          Layout = blGlyphBottom
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 31
          Top = 128
          Width = 37
          Height = 33
          Action = acUnselone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76020000424D7602000000000000760000002800000020000000200000000100
            0400000000000002000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777770077777777777777777777777777770040777777777777777777777777
            7700448077777777777777777777777700448880777777777777777777777700
            44888880777777777777777777777F88888888807777777777777777777777FF
            88888880777777777777777777777777FF888880777777777777777777777777
            77FF88807777777777777777777777777777FF80777777777777777777777777
            777777FF77777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777}
          Layout = blGlyphBottom
          ParentFont = False
        end
        object SpeedButton4: TSpeedButton
          Left = 31
          Top = 168
          Width = 37
          Height = 33
          Action = acUnselall
          BiDiMode = bdLeftToRight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76020000424D7602000000000000760000002800000020000000200000000100
            0400000000000002000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7770077777700777777777777777777770040777700407777777777777777770
            0448077004480777777777777777700448880004488807777777777777700448
            88800448888807777777777777F8888888F888888888077777777777777FF888
            888FF888888807777777777777777FF888880FF888880777777777777777777F
            F888077FF888077777777777777777777FF807777FF807777777777777777777
            777FF777777FF777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777}
          Layout = blGlyphBottom
          ParentFont = False
          ParentShowHint = False
          ParentBiDiMode = False
          ShowHint = False
        end
        object SpeedButton5: TSpeedButton
          Left = 8
          Top = 232
          Width = 81
          Height = 33
          Caption = #1055#1077#1095#1072#1090#1100
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
            0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C60000000000C6C6C60000000000FF00FF00FF00FF00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000C6C6C60000000000FF00FF0000000000C6C6
            C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FF
            FF00C6C6C600C6C6C600000000000000000000000000FF00FF0000000000C6C6
            C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084848400848484008484
            8400C6C6C600C6C6C60000000000C6C6C60000000000FF00FF00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000C6C6C600C6C6C6000000000000000000C6C6
            C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C60000000000C6C6C60000000000C6C6C60000000000FF00FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000C6C6C60000000000C6C6C6000000000000000000FF00FF00FF00
            FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0000000000C6C6C60000000000C6C6C60000000000FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00000000000000000000000000000000000000
            0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000FFFFFF000000000000000000000000000000
            000000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
            000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = SpeedButton5Click
        end
      end
      object GridSelect: TDBGridEh
        Left = 217
        Top = 0
        Width = 126
        Height = 300
        DataSource = ds_selakt
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = GridSelectDblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NUM_AKT'
            Footers = <>
            Title.Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1072#1082#1090#1099
            Width = 92
          end>
      end
    end
  end
  object TBDock3: TTBDock
    Left = 0
    Top = 54
    Width = 629
    Height = 54
    object TBToolbar3: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar3'
      DragHandleStyle = dhNone
      TabOrder = 0
      object TBControlItem6: TTBControlItem
        Control = GroupBox2
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 343
        Height = 50
        Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1086#1084#1077#1088#1091' '#1072#1082#1090#1072
        TabOrder = 0
        object e_find: TEdit
          Left = 8
          Top = 18
          Width = 199
          Height = 21
          TabOrder = 0
          OnKeyPress = e_findKeyPress
        end
        object But_find: TBitBtn
          Left = 218
          Top = 10
          Width = 120
          Height = 35
          Caption = '      '#1053#1072#1081#1090#1080
          TabOrder = 1
          OnClick = But_findClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888880000888888000088080088888808008808008888880
            8008800000088000000880870000000870088087000000087008808700000008
            7008800000000000000888088008808800888880000880000888888070088070
            0888888000088000088888888888888888888888888888888888}
        end
      end
    end
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Left = 8
    Top = 200
  end
  object PropStorageEh1: TPropStorageEh
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 40
    Top = 200
  end
  object ds_numakt: TDataSource
    DataSet = q_numakt
    Left = 40
    Top = 232
  end
  object ActionManager1: TActionManager
    Left = 72
    Top = 200
    StyleName = 'XP Style'
    object acRequery: TAction
      Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1088#1086#1089#1086#1074
      OnExecute = acRequeryExecute
    end
    object acFind: TAction
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1086#1084#1077#1088#1091' '#1072#1082#1090#1072
      OnExecute = acFindExecute
    end
    object acSelone: TAction
      OnExecute = acSeloneExecute
    end
    object acUnselone: TAction
      OnExecute = acUnseloneExecute
    end
    object acSelall: TAction
      OnExecute = acSelallExecute
    end
    object acUnselall: TAction
      ImageIndex = 0
      OnExecute = acUnselallExecute
    end
    object acPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
    end
  end
  object q_selakt: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      ' ROWID'
      ',NUM_AKT'
      ',USER_NAME'
      ',PRIZNAK'
      'FROM VOZVRAT_TEMP'
      'WHERE USER_NAME=:USERN AND PRIZNAK=1'
      'ORDER BY NUM_AKT')
    Variables.Data = {0300000001000000060000003A555345524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0300000003000000070000004E554D5F414B5401000000000900000055534552
      5F4E414D450100000000070000005052495A4E414B0100000000}
    Cursor = crHourGlass
    UpdatingTable = 'VOZVRAT_TEMP'
    Session = f_main.ora_Session
    Left = 256
    Top = 220
    object q_selaktNUM_AKT: TStringField
      FieldName = 'NUM_AKT'
      Size = 10
    end
    object q_selaktUSER_NAME: TStringField
      FieldName = 'USER_NAME'
      Size = 30
    end
    object q_selaktPRIZNAK: TFloatField
      FieldName = 'PRIZNAK'
    end
  end
  object ds_selakt: TDataSource
    DataSet = q_selakt
    Left = 288
    Top = 220
  end
  object q_numakt: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'TRIM(NUM_AKT) AS NUM_AKT'
      'FROM VOZVRAT'
      'WHERE DATE_VOZ BETWEEN :D1 AND :D2'
      'AND NUM_AKT IS NOT NULL'
      
        'AND TRIM(NUM_AKT) NOT IN (SELECT TRIM(NUM_AKT) AS NUM_AKT FROM V' +
        'OZVRAT_TEMP WHERE USER_NAME=:USERN AND PRIZNAK=1)'
      'GROUP BY TRIM(NUM_AKT)')
    Variables.Data = {
      0300000003000000060000003A555345524E0500000000000000000000000300
      00003A44310C0000000000000000000000030000003A44320C00000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {0300000001000000070000004E554D5F414B540100000000}
    Session = f_main.ora_Session
    Left = 8
    Top = 232
    object q_numaktNUM_AKT: TStringField
      FieldName = 'NUM_AKT'
      Size = 10
    end
  end
  object q_unselall: TOracleQuery
    SQL.Strings = (
      'begin'
      'DELETE FROM VOZVRAT_TEMP WHERE USER_NAME=:USERN AND PRIZNAK=1;'
      'COMMIT;'
      'end;')
    Session = f_main.ora_Session
    Variables.Data = {0300000001000000060000003A555345524E050000000000000000000000}
    Left = 256
    Top = 252
  end
  object q_selall: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      '  DELETE FROM VOZVRAT_TEMP WHERE USER_NAME=:USERN AND PRIZNAK=1;'
      '  INSERT INTO VOZVRAT_TEMP (USER_NAME,NUM_AKT,PRIZNAK)'
      
        '                            SELECT :USERN,TRIM(NUM_AKT),1 AS PRI' +
        'ZNAK'
      '                            FROM VOZVRAT'
      '                            WHERE DATE_VOZ BETWEEN :D1 AND :D2'
      '                            AND NUM_AKT IS NOT NULL'
      '                            GROUP BY TRIM(NUM_AKT);'
      '  COMMIT;                          '
      'END;')
    Session = f_main.ora_Session
    Variables.Data = {
      0300000003000000030000003A44310C0000000000000000000000030000003A
      44320C0000000000000000000000060000003A555345524E0500000000000000
      00000000}
    Left = 8
    Top = 268
  end
end
