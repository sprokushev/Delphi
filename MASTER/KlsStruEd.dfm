object f_KlsStruEd: Tf_KlsStruEd
  Left = 340
  Top = 127
  Width = 606
  Height = 505
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' / '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072#1087#1088#1086#1089#1072' '#1082' '#1041#1044
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 598
    Height = 437
    ActivePage = tabInfo
    Align = alClient
    TabOrder = 0
    object tabInfo: TTabSheet
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1079#1072#1087#1088#1086#1089#1072
      object Label1: TLabel
        Left = 6
        Top = 75
        Width = 155
        Height = 13
        Alignment = taRightJustify
        Caption = #1058#1045#1043' ('#1091#1085#1080#1082#1072#1083#1100#1085#1099#1081' ID '#1079#1072#1087#1088#1086#1089#1072'): '
      end
      object Label2: TLabel
        Left = 86
        Top = 53
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = #1048#1084#1103' '#1090#1072#1073#1083#1080#1094#1099': '
      end
      object Label3: TLabel
        Left = 33
        Top = 8
        Width = 126
        Height = 13
        Alignment = taRightJustify
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1079#1072#1087#1088#1086#1089#1072' '#1082' '#1041#1044':'
      end
      object Label4: TLabel
        Left = 86
        Top = 31
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = #8470' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091':'
      end
      object Label5: TLabel
        Left = 8
        Top = 288
        Width = 78
        Height = 13
        Caption = #1058#1077#1082#1089#1090' '#1079#1072#1087#1088#1086#1089#1072':'
      end
      object Label6: TLabel
        Left = 106
        Top = 101
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1086#1083#1077' "ID":'
      end
      object Label12: TLabel
        Left = 8
        Top = 376
        Width = 105
        Height = 13
        Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1087#1086#1088#1103#1076#1086#1082':'
      end
      object Label13: TLabel
        Left = 41
        Top = 147
        Width = 118
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1086#1083#1077' "'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'":'
      end
      object Label14: TLabel
        Left = 6
        Top = 171
        Width = 153
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1086#1083#1077' "'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'" ('#1072#1083#1100#1090'.):'
      end
      object Label16: TLabel
        Left = 35
        Top = 124
        Width = 124
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sequence '#1076#1083#1103' '#1087#1086#1083#1103' "ID":'
      end
      object Label24: TLabel
        Left = 82
        Top = 194
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1086#1083#1077' "'#1057' '#1076#1072#1090#1099'":'
      end
      object Label25: TLabel
        Left = 78
        Top = 217
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1086#1083#1077' "'#1055#1086' '#1076#1072#1090#1091'":'
      end
      object Label26: TLabel
        Left = 35
        Top = 241
        Width = 124
        Height = 13
        Alignment = taRightJustify
        Caption = #1044#1072#1090#1099' '#1089#1086#1076#1077#1088#1078#1072#1090' '#1074#1088#1077#1084#1103'?:'
      end
      object Label30: TLabel
        Left = 4
        Top = 260
        Width = 187
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1086#1083#1077' "'#1057#1089#1099#1083#1082#1072' '#1085#1072' MASTER-'#1090#1072#1073#1083#1080#1094#1091'":'
      end
      object edID: TEdit
        Left = 164
        Top = 71
        Width = 305
        Height = 21
        TabOrder = 3
        OnChange = edIDChange
      end
      object edCaption: TEdit
        Left = 164
        Top = 4
        Width = 416
        Height = 21
        TabOrder = 0
      end
      object edTABLE_NAME: TRxLookupEdit
        Left = 164
        Top = 49
        Width = 304
        Height = 21
        LookupDisplay = 'TAB_NAME'
        LookupField = 'TAB_NAME'
        LookupSource = ds_ListTables
        TabOrder = 2
        OnCloseUp = edTABLE_NAMEChange
        OnChange = edTABLE_NAMEChange
      end
      object edSortby: TRxCalcEdit
        Left = 164
        Top = 27
        Width = 73
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        NumGlyphs = 2
        TabOrder = 1
      end
      object edUNIQUE_FIELD: TRxLookupEdit
        Left = 164
        Top = 96
        Width = 225
        Height = 21
        LookupDisplay = 'COL_NAME'
        LookupField = 'COL_NAME'
        LookupSource = ds_ListFields
        TabOrder = 4
      end
      object edQUERY: TRichEdit
        Left = 8
        Top = 304
        Width = 569
        Height = 65
        TabOrder = 14
      end
      object edSTART_ORDER: TEdit
        Left = 118
        Top = 372
        Width = 459
        Height = 21
        TabOrder = 15
      end
      object edNAME_FIELD: TRxLookupEdit
        Left = 164
        Top = 144
        Width = 225
        Height = 21
        LookupDisplay = 'COL_NAME'
        LookupField = 'COL_NAME'
        LookupSource = ds_ListFields
        TabOrder = 6
      end
      object edNAME_FIELD_2: TRxLookupEdit
        Left = 164
        Top = 168
        Width = 225
        Height = 21
        LookupDisplay = 'COL_NAME'
        LookupField = 'COL_NAME'
        LookupSource = ds_ListFields
        TabOrder = 7
      end
      object edDATE_FIELD_BEGIN: TRxLookupEdit
        Left = 164
        Top = 192
        Width = 225
        Height = 21
        LookupDisplay = 'COL_NAME'
        LookupField = 'COL_NAME'
        LookupSource = ds_ListFields
        TabOrder = 8
      end
      object edDATE_FIELD_END: TRxLookupEdit
        Left = 164
        Top = 216
        Width = 225
        Height = 21
        LookupDisplay = 'COL_NAME'
        LookupField = 'COL_NAME'
        LookupSource = ds_ListFields
        TabOrder = 9
      end
      object edSEQUENCES: TRxLookupEdit
        Left = 164
        Top = 120
        Width = 225
        Height = 21
        LookupDisplay = 'SEQUENCE_NAME'
        LookupField = 'SEQUENCE_NAME'
        LookupSource = ds_Sequences
        TabOrder = 5
      end
      object cbVIEW_TIME: TCheckBox
        Left = 164
        Top = 240
        Width = 29
        Height = 17
        TabOrder = 10
      end
      object btCheckQuery: TBitBtn
        Left = 440
        Top = 278
        Width = 131
        Height = 25
        Action = acCheckQuery
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
        TabOrder = 13
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C0000000000000000000000000000000000000000000000001F7C
          1F7C000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C
          0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001042
          000000001F7C0000FF7FFF7FFF7FFF7FFF7FFF7F000010421863186310420000
          10421F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0000104218631863FF0310421042
          00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0000186318631863186310421863
          00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001863FF031863186310421863
          00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001042FF03FF03186310421042
          00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7F000010421863186310420000
          1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F7C
          1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C
          1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F7C
          1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000186300001F7C1F7C
          1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001F7C1F7C1F7C
          1F7C1F7C1F7C0000000000000000000000000000000000001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
      end
      object btCreateQuery: TBitBtn
        Left = 280
        Top = 278
        Width = 153
        Height = 25
        Action = acCreateQuery
        Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1088#1086#1089
        TabOrder = 12
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000000000000000
          1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
          1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
          1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
          1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
          1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
          1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
          1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
          1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
          1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
          1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F00001F7C
          1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7F000000001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C000000000000000000000000000000001F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
      end
      object edMASTER_FIELD: TRxLookupEdit
        Left = 196
        Top = 256
        Width = 225
        Height = 21
        LookupDisplay = 'COL_NAME'
        LookupField = 'COL_NAME'
        LookupSource = ds_ListFields
        TabOrder = 11
      end
    end
    object tabVisual: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1092#1086#1088#1084#1099' "'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080'"'
      ImageIndex = 1
      object Label15: TLabel
        Left = 24
        Top = 171
        Width = 103
        Height = 13
        Alignment = taRightJustify
        Caption = #1060#1086#1088#1084#1072' "'#1044#1086#1073#1072#1074#1080#1090#1100'":'
      end
      object Label17: TLabel
        Left = 40
        Top = 9
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = #1060#1080#1083#1100#1090#1088' 1 ('#1055#1086#1083#1077'):'
      end
      object Label18: TLabel
        Left = 16
        Top = 32
        Width = 111
        Height = 13
        Alignment = taRightJustify
        Caption = #1060#1080#1083#1100#1090#1088' 1 ('#1054#1087#1080#1089#1072#1085#1080#1077'):'
      end
      object Label19: TLabel
        Left = 40
        Top = 55
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = #1060#1080#1083#1100#1090#1088' 2 ('#1055#1086#1083#1077'):'
      end
      object Label20: TLabel
        Left = 40
        Top = 101
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = #1060#1080#1083#1100#1090#1088' 3 ('#1055#1086#1083#1077'):'
      end
      object Label21: TLabel
        Left = 16
        Top = 78
        Width = 111
        Height = 13
        Alignment = taRightJustify
        Caption = #1060#1080#1083#1100#1090#1088' 2 ('#1054#1087#1080#1089#1072#1085#1080#1077'):'
      end
      object Label22: TLabel
        Left = 16
        Top = 124
        Width = 111
        Height = 13
        Alignment = taRightJustify
        Caption = #1060#1080#1083#1100#1090#1088' 3 ('#1054#1087#1080#1089#1072#1085#1080#1077'):'
      end
      object Label23: TLabel
        Left = 40
        Top = 243
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1088#1072#1074#1086' '#1085#1072' '#1076#1086#1089#1090#1091#1087':'
      end
      object Label27: TLabel
        Left = 27
        Top = 195
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = '"'#1044#1086#1095#1077#1088#1085#1103#1103'" '#1092#1086#1088#1084#1072':'
      end
      object Label28: TLabel
        Left = 28
        Top = 213
        Width = 99
        Height = 26
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' "'#1076#1086#1095#1077#1088#1085#1077#1081'" '#1092#1086#1088#1084#1099':'
        WordWrap = True
      end
      object Label29: TLabel
        Left = 20
        Top = 267
        Width = 131
        Height = 13
        Alignment = taRightJustify
        Caption = #1047#1072#1084#1086#1088#1086#1078#1077#1085#1085#1099#1093' '#1089#1090#1086#1083#1073#1094#1086#1074':'
      end
      object edFILTER_1: TRxLookupEdit
        Left = 132
        Top = 5
        Width = 225
        Height = 21
        LookupDisplay = 'COL_NAME'
        LookupField = 'COL_NAME'
        LookupSource = ds_ListFields
        TabOrder = 0
      end
      object edFILTER_1_CAPTION: TEdit
        Left = 132
        Top = 28
        Width = 445
        Height = 21
        TabOrder = 1
      end
      object edFILTER_2: TRxLookupEdit
        Left = 132
        Top = 51
        Width = 225
        Height = 21
        LookupDisplay = 'COL_NAME'
        LookupField = 'COL_NAME'
        LookupSource = ds_ListFields
        TabOrder = 2
      end
      object edFILTER_2_CAPTION: TEdit
        Left = 132
        Top = 74
        Width = 445
        Height = 21
        TabOrder = 3
      end
      object edFILTER_3: TRxLookupEdit
        Left = 132
        Top = 97
        Width = 225
        Height = 21
        LookupDisplay = 'COL_NAME'
        LookupField = 'COL_NAME'
        LookupSource = ds_ListFields
        TabOrder = 4
      end
      object edFILTER_3_CAPTION: TEdit
        Left = 132
        Top = 120
        Width = 445
        Height = 21
        TabOrder = 5
      end
      object edADD_FORM: TEdit
        Left = 132
        Top = 168
        Width = 224
        Height = 21
        TabOrder = 6
      end
      object edRIGHTS_ID: TRxDBLookupCombo
        Left = 132
        Top = 240
        Width = 225
        Height = 21
        DropDownCount = 8
        LookupField = 'ID'
        LookupDisplay = 'DESCRIPT'
        LookupSource = ds_ListRights
        TabOrder = 7
      end
      object edCHILD_FORM: TEdit
        Left = 132
        Top = 192
        Width = 224
        Height = 21
        TabOrder = 8
      end
      object edCHILD_NAME: TEdit
        Left = 132
        Top = 216
        Width = 224
        Height = 21
        TabOrder = 9
      end
      object edFROZEN_COLS: TEdit
        Left = 160
        Top = 264
        Width = 196
        Height = 21
        TabOrder = 10
      end
    end
    object tabDBF: TTabSheet
      Caption = #1057#1080#1085#1093#1088#1086#1085#1080#1079#1072#1094#1080#1103' '#1089' DBF'
      ImageIndex = 3
      object Label7: TLabel
        Left = 0
        Top = 0
        Width = 255
        Height = 13
        Caption = #1047#1072#1087#1088#1086#1089' '#1085#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1074' '#1079#1077#1088#1082#1072#1083#1100#1085#1086#1081' DBF-'#1090#1072#1073#1083#1080#1094#1077
      end
      object Label8: TLabel
        Left = 0
        Top = 72
        Width = 255
        Height = 13
        Caption = #1047#1072#1087#1088#1086#1089' '#1085#1072' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1074' '#1079#1077#1088#1082#1072#1083#1100#1085#1091#1102' DBF-'#1090#1072#1073#1083#1080#1094#1091
      end
      object Label9: TLabel
        Left = 0
        Top = 152
        Width = 250
        Height = 13
        Caption = #1047#1072#1087#1088#1086#1089' '#1085#1072' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1080#1079' '#1079#1077#1088#1082#1072#1083#1100#1085#1086#1081' DBF-'#1090#1072#1073#1083#1080#1094#1099
      end
      object Label10: TLabel
        Left = 0
        Top = 232
        Width = 441
        Height = 13
        Caption = 
          #1047#1072#1087#1088#1086#1089' '#1085#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1077' ID '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1093' ID ('#1076#1083#1103' '#1079#1077#1088#1082#1072#1083#1100 +
          #1085#1086#1081' DBF-'#1090#1072#1073#1083#1080#1094#1099')'
      end
      object Label11: TLabel
        Left = 0
        Top = 320
        Width = 443
        Height = 13
        Caption = 
          #1047#1072#1087#1088#1086#1089' '#1085#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' ID '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077' '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1093' ID ('#1076#1083#1103' '#1079#1077#1088#1082#1072#1083#1100 +
          #1085#1086#1081' DBF-'#1090#1072#1073#1083#1080#1094#1099')'
      end
      object edFOX_UPDATE_QUERY: TRichEdit
        Left = 0
        Top = 16
        Width = 577
        Height = 49
        Lines.Strings = (
          '')
        TabOrder = 0
      end
      object edFOX_INSERT_QUERY: TRichEdit
        Left = 0
        Top = 88
        Width = 577
        Height = 57
        Lines.Strings = (
          '')
        TabOrder = 1
      end
      object edFOX_DELETE_QUERY: TRichEdit
        Left = 0
        Top = 168
        Width = 577
        Height = 57
        Lines.Strings = (
          '')
        TabOrder = 2
      end
      object edUNIQID_SELECT_QUERY: TRichEdit
        Left = 0
        Top = 248
        Width = 577
        Height = 65
        Lines.Strings = (
          '')
        TabOrder = 3
      end
      object edUNIQID_UPDATE_QUERY: TRichEdit
        Left = 0
        Top = 336
        Width = 577
        Height = 65
        Lines.Strings = (
          '')
        TabOrder = 4
      end
    end
    object tabFields: TTabSheet
      Caption = #1055#1086#1083#1103' '#1079#1072#1087#1088#1086#1089#1072
      ImageIndex = 2
      OnShow = tabFieldsShow
      object gridFields: TDBGridEh
        Left = 0
        Top = 41
        Width = 590
        Height = 368
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = dsFields
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FrozenCols = 2
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete]
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
        Columns = <
          item
            EditButtons = <>
            FieldName = 'FIELD_ID'
            Footers = <>
            Title.TitleButton = True
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'FIELD_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 132
          end
          item
            EditButtons = <>
            FieldName = 'FIELD_TYPE'
            Footers = <>
            Width = 33
          end
          item
            EditButtons = <>
            FieldName = 'FIELD_CAPTION'
            Footers = <>
            Title.TitleButton = True
            Width = 196
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'FIELD_READONLY'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.TitleButton = True
            Width = 35
          end
          item
            AlwaysShowEditButton = True
            DblClickNextVal = True
            EditButtons = <>
            FieldName = 'FIELD_KIND'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1'
              '2')
            PickList.Strings = (
              '0 - '#1054#1073#1099#1095#1085#1086#1077
              '1 - Lookup'
              '2 - Checkbox')
            Title.TitleButton = True
            Width = 88
          end
          item
            EditButtons = <>
            FieldName = 'DISPLAY_WIDTH'
            Footers = <>
            Title.TitleButton = True
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'MASK'
            Footers = <>
            Title.TitleButton = True
            Width = 63
          end
          item
            EditButtons = <>
            FieldName = 'LOOKUP_SOURCE_QUERY'
            Footers = <>
            Title.TitleButton = True
            Width = 187
          end
          item
            EditButtons = <>
            FieldName = 'LOOKUP_DISPLAY_FIELD'
            Footers = <>
            Title.TitleButton = True
            Width = 134
          end
          item
            EditButtons = <>
            FieldName = 'LOOKUP_KEY_FIELD'
            Footers = <>
            Title.TitleButton = True
            Width = 126
          end
          item
            EditButtons = <>
            FieldName = 'LOOKUP_TABLE'
            Footers = <>
            Title.TitleButton = True
            Width = 154
          end
          item
            EditButtons = <>
            FieldName = 'REL_OPER'
            Footers = <>
            Width = 62
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 590
        Height = 41
        Align = alTop
        TabOrder = 1
        object BitBtn1: TBitBtn
          Left = 8
          Top = 8
          Width = 193
          Height = 25
          Action = acAddFields
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1077#1076#1086#1089#1090#1072#1102#1097#1080#1077' '#1087#1086#1083#1103
          TabOrder = 0
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C0000000000000000000000000000
            0000000000001F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000000000001F7C00000000000000000000FF7FFF7F0000FF7F0000
            0000FF7F0000FF0300000000E07FFF7FE07FFF7FE07F0000FF7FFF7FFF7FFF7F
            FF7FFF7F0000FF030000E07FFF7FE07FFF7F000000000000FF7FFF7FFF7FFF7F
            0000FF7F0000FF030000FF7FE07FFF7FE07FFF7FE07FFF7F0000FF7F00000000
            FF7FFF7F0000FF030000E07FFF7FE07FFF7F00000000000000000000E07F0000
            FF7FFF7F0000FF030000FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F0000FF7F
            FF7FFF7F0000FF030000E07FFF7F0000000000000000000000000000FF7FFF7F
            FF7FFF7F0000000000000000E07FFF7FE07F00000000E07F0000FF7FFF7F0000
            0000FF7F00001F7C1F7C1F7C0000000000000000E07F0000FF7FFF7FFF7FFF7F
            FF7FFF7F00001F7C1F7C1F7C1F7C1F7C0000E07F0000FF7FFF7FFF7FFF7F0000
            0000000000001F7C1F7C1F7C1F7C0000E07F0000FF7FFF7F00000000FF7F0000
            FF7FFF7F00001F7C1F7C1F7C0000E07F00000000FF7FFF7FFF7FFF7FFF7F0000
            FF7F00001F7C1F7C1F7C0000007C00001F7C0000FF7FFF7FFF7FFF7FFF7F0000
            00001F7C1F7C1F7C1F7C1F7C00001F7C1F7C0000000000000000000000000000
            1F7C1F7C1F7C}
        end
        object BitBtn2: TBitBtn
          Left = 208
          Top = 8
          Width = 137
          Height = 25
          Action = acCheckLookup
          Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' LOOKUP'
          TabOrder = 1
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C0000000000000000000000000000000000000000000000001F7C
            1F7C000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C
            0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001042
            000000001F7C0000FF7FFF7FFF7FFF7FFF7FFF7F000010421863186310420000
            10421F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0000104218631863FF0310421042
            00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0000186318631863186310421863
            00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001863FF031863186310421863
            00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001042FF03FF03186310421042
            00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7F000010421863186310420000
            1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F7C
            1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C
            1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F7C
            1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000186300001F7C1F7C
            1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001F7C1F7C1F7C
            1F7C1F7C1F7C0000000000000000000000000000000000001F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
        end
        object BitBtn4: TBitBtn
          Left = 352
          Top = 8
          Width = 113
          Height = 25
          Action = acDelField
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1077
          TabOrder = 2
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            0040FF7F1F7C1F7C1F7C1F7C0040FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C004000400040FF7F1F7C1F7C1F7C1F7C1F7C1F7C0040
            FF7F1F7C1F7C1F7C1F7C004000400040FF7F1F7C1F7C1F7C1F7C1F7C0040FF7F
            1F7C1F7C1F7C1F7C1F7C1F7C004000400040FF7F1F7C1F7C1F7C00400040FF7F
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C004000400040FF7F1F7C00400040FF7F1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00400040004000400040FF7F1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C004000400040FF7F1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00400040004000400040FF7F1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C004000400040FF7F1F7C0040FF7F1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C0040004000400040FF7F1F7C1F7C1F7C00400040FF7F
            1F7C1F7C1F7C1F7C0040004000400040FF7F1F7C1F7C1F7C1F7C1F7C00400040
            FF7F1F7C1F7C1F7C00400040FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0040
            0040FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
        end
        object BitBtn5: TBitBtn
          Left = 472
          Top = 8
          Width = 89
          Height = 25
          Action = acRefreshFields
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 3
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10001000100010001F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C100010001000100010001000100010001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1000100010001F7C1F7C1F7C1F7C100010001000
            1F7C1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C10001000
            1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
            10001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
            10001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
            10001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000
            10001F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C10001F7C10001000
            1F7C1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C1F7C1000100010001000
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000100010001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000100010001000
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 437
    Width = 598
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btOk: TBitBtn
      Left = 104
      Top = 8
      Width = 137
      Height = 25
      Action = acSaveAndExit
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1081#1090#1080
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btCancel: TBitBtn
      Left = 456
      Top = 8
      Width = 89
      Height = 25
      Action = acCancel
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 288
      Top = 8
      Width = 129
      Height = 25
      Action = acApply
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 2
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000000000000000
        00001F7C1F7C1F7C0000E05EE05E00001F7C1F7C0000000000000000E05EE05E
        00001F7C1F7C1F7C0000E05EE05E00001F7C1F7C0000000000000000E05EE05E
        00001F7C1F7C1F7C0000E05EE05E00001F7C1F7C0000000000000000E05EE05E
        00001F7C1F7C1F7C0000E05EE05E0000000000000000000000000000E05EE05E
        00001F7C1F7C1F7C0000E05EE05EE05EE05EE05EE05EE05EE05EE05EE05EE05E
        00001F7C1F7C1F7C0000E05EE05E0000000000000000000000000000E05EE05E
        00001F7C1F7C1F7C0000E05E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E05E
        00001F7C1F7C1F7C0000E05E0000FF7F1F001F001F001F00FF7FFF7F0000E05E
        00001F7C1F7C1F7C0000E05E0000FF7FFF7F1F001F001F00FF7FFF7F0000E05E
        00001F7C1F7C1F7C0000E05E1F7CFF7F1F001F001F001F00FF7FFF7F00000000
        00001F7C1F7C1F7C00001F7C1F7C1F001F001F00FF7F1F00FF7FFF7F00001042
        00001F7C1F7C1F7C1F7C1F7C1F001F001F001F7C1F7C1F7C1F7C000000000000
        00001F7C1F7C1F7C1F7C1F001F001F001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
  end
  object q_ListTables: TOracleDataSet
    SQL.Strings = (
      'SELECT TAB_NAME FROM V_DESIGNER_TABLES'
      'ORDER BY TAB_NAME')
    QBEDefinition.QBEFieldDefs = {0300000001000000080000005441425F4E414D450100000000}
    Session = f_main.ora_Session
    Left = 436
    Top = 128
  end
  object ds_ListTables: TDataSource
    DataSet = q_ListTables
    Left = 492
    Top = 128
  end
  object q_ListFields: TOracleDataSet
    SQL.Strings = (
      'SELECT COL_NAME FROM V_DESIGNER_COLUMNS'
      'WHERE TAB_NAME=:TAB_NAME'
      'ORDER BY SEQ_NUM')
    Variables.Data = {
      0300000001000000090000003A5441425F4E414D450500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {030000000100000008000000434F4C5F4E414D450100000000}
    Master = q_ListTables
    MasterFields = 'TAB_NAME'
    Session = f_main.ora_Session
    Left = 436
    Top = 168
  end
  object ds_ListFields: TDataSource
    DataSet = q_ListFields
    Left = 492
    Top = 168
  end
  object q_ListRights: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_RIGHTS'
      'ORDER BY DESCRIPT')
    QBEDefinition.QBEFieldDefs = {
      0300000002000000020000004944010000000008000000444553435249505401
      00000000}
    Session = f_main.ora_Session
    Left = 436
    Top = 216
  end
  object ds_ListRights: TDataSource
    DataSet = q_ListRights
    Left = 492
    Top = 216
  end
  object tFields: TOracleDataSet
    SQL.Strings = (
      'SELECT A.rowid, A.* '
      'FROM MASTER_KLS_FIELD_STRUCTURE A'
      'WHERE STRUCTURE_ID=:STRUCTURE_ID'
      'ORDER BY FIELD_ID')
    Variables.Data = {
      03000000010000000D0000003A5354525543545552455F494405000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000F0000000C0000005354525543545552455F49440100000000080000
      004649454C445F494401000000000A0000004649454C445F4E414D4501000000
      000D0000004649454C445F43415054494F4E01000000000A0000004649454C44
      5F4B494E440100000000130000004C4F4F4B55505F534F555243455F51554552
      590100000000140000004C4F4F4B55505F444953504C41595F4649454C440100
      000000100000004C4F4F4B55505F4B45595F4649454C4401000000000C000000
      4C4F4F4B55505F5441424C4501000000000E0000004649454C445F524541444F
      4E4C590100000000040000004D41534B01000000000D000000444953504C4159
      5F5749445448010000000002000000494401000000000A0000004649454C445F
      5459504501000000000800000052454C5F4F5045520100000000}
    UniqueFields = 'ID'
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    UpdatingTable = 'MASTER_KLS_FIELD_STRUCTURE'
    Session = f_main.ora_Session
    Left = 156
    Top = 144
    object tFieldsSTRUCTURE_ID: TStringField
      FieldName = 'STRUCTURE_ID'
      Required = True
      Size = 50
    end
    object tFieldsFIELD_ID: TIntegerField
      DisplayLabel = #8470' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091
      FieldName = 'FIELD_ID'
      Required = True
    end
    object tFieldsFIELD_NAME: TStringField
      DisplayLabel = #1048#1084#1103' '#1087#1086#1083#1103
      FieldName = 'FIELD_NAME'
      Required = True
      Size = 50
    end
    object tFieldsFIELD_CAPTION: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'FIELD_CAPTION'
      Required = True
      Size = 50
    end
    object tFieldsFIELD_KIND: TIntegerField
      DisplayLabel = #1042#1080#1076' '#1087#1086#1083#1103
      FieldName = 'FIELD_KIND'
      Required = True
    end
    object tFieldsLOOKUP_SOURCE_QUERY: TStringField
      DisplayLabel = 'LOOKUP - '#1079#1072#1087#1088#1086#1089
      FieldName = 'LOOKUP_SOURCE_QUERY'
      Size = 512
    end
    object tFieldsLOOKUP_DISPLAY_FIELD: TStringField
      DisplayLabel = #1054#1090#1086#1073#1088#1072#1078#1072#1077#1084#1086#1077' '#1087#1086#1083#1077' LOOKUP - '#1079#1072#1087#1088#1086#1089#1072
      FieldName = 'LOOKUP_DISPLAY_FIELD'
      Size = 50
    end
    object tFieldsLOOKUP_KEY_FIELD: TStringField
      DisplayLabel = #1050#1083#1102#1095#1077#1074#1086#1077' '#1087#1086#1083#1077' LOOKUP - '#1079#1072#1087#1088#1086#1089#1072
      FieldName = 'LOOKUP_KEY_FIELD'
      Size = 50
    end
    object tFieldsLOOKUP_TABLE: TStringField
      DisplayLabel = 'LOOKUP - '#1090#1072#1073#1083#1080#1094#1072
      FieldName = 'LOOKUP_TABLE'
      Size = 30
    end
    object tFieldsFIELD_READONLY: TIntegerField
      DisplayLabel = 'Read Only'
      FieldName = 'FIELD_READONLY'
      Required = True
    end
    object tFieldsMASK: TStringField
      DisplayLabel = #1052#1072#1089#1082#1072' '#1074#1074#1086#1076#1072
      FieldName = 'MASK'
      Size = 10
    end
    object tFieldsDISPLAY_WIDTH: TIntegerField
      DisplayLabel = #1064#1080#1088#1080#1085#1072' '#1087#1086#1083#1103' (grid)'
      FieldName = 'DISPLAY_WIDTH'
    end
    object tFieldsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object tFieldsFIELD_TYPE: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1086#1083#1103
      FieldName = 'FIELD_TYPE'
      Size = 1
    end
    object tFieldsREL_OPER: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088' '#1089#1088#1072#1074#1085#1077#1085#1080#1103
      FieldName = 'REL_OPER'
      Size = 4
    end
  end
  object dsFields: TDataSource
    DataSet = tFields
    Left = 204
    Top = 144
  end
  object q_tmp: TOracleDataSet
    Session = f_main.ora_Session
    Left = 148
    Top = 208
  end
  object TBPopupMenu1: TTBPopupMenu
    Left = 344
    Top = 160
    object TBItem2: TTBItem
      Action = acViewMemo
    end
    object TBItem3: TTBItem
      Action = acCheckLookup
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem4: TTBItem
      Action = acAddFields
    end
    object TBItem1: TTBItem
      Action = acDelField
    end
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 220
    Top = 232
    StyleName = 'XP Style'
    object acCreateQuery: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1088#1086#1089
      ImageIndex = 0
      OnExecute = acCreateQueryExecute
    end
    object acCheckQuery: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      ImageIndex = 1
      OnExecute = acCheckQueryExecute
    end
    object acApply: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 13
      OnExecute = acApplyExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 12
      OnExecute = acCancelExecute
    end
    object acAddFields: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1077#1076#1086#1089#1090#1072#1102#1097#1080#1077' '#1087#1086#1083#1103
      ImageIndex = 8
      OnExecute = acAddFieldsExecute
    end
    object acCheckLookup: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' LOOKUP'
      ImageIndex = 1
      OnExecute = acCheckLookupExecute
    end
    object acViewMemo: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      ImageIndex = 7
      OnExecute = acViewMemoExecute
    end
    object acSaveAndExit: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1081#1090#1080
      ImageIndex = 13
      OnExecute = acSaveAndExitExecute
    end
    object acDelField: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1077
      ImageIndex = 5
      OnExecute = acDelFieldExecute
    end
    object acRefreshFields: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acRefreshFieldsExecute
    end
  end
  object q_maxFIELD_ID: TOracleDataSet
    SQL.Strings = (
      'SELECT MAX(FIELD_ID) as MAX_FIELD_ID'
      'FROM MASTER_KLS_FIELD_STRUCTURE A'
      'WHERE STRUCTURE_ID=:STRUCTURE_ID')
    Variables.Data = {
      03000000010000000D0000003A5354525543545552455F494405000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000D0000000C0000005354525543545552455F49440100000000080000
      004649454C445F494401000000000A0000004649454C445F4E414D4501000000
      000D0000004649454C445F43415054494F4E01000000000A0000004649454C44
      5F4B494E440100000000130000004C4F4F4B55505F534F555243455F51554552
      590100000000140000004C4F4F4B55505F444953504C41595F4649454C440100
      000000100000004C4F4F4B55505F4B45595F4649454C4401000000000C000000
      4C4F4F4B55505F5441424C4501000000000E0000004649454C445F524541444F
      4E4C590100000000040000004D41534B01000000000D000000444953504C4159
      5F574944544801000000000200000049440100000000}
    Session = f_main.ora_Session
    Left = 260
    Top = 216
  end
  object q_Comments: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM SYS.USER_COL_COMMENTS '
      'WHERE TABLE_NAME=:TABLE_NAME')
    Variables.Data = {
      03000000010000000B0000003A5441424C455F4E414D45050000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      03000000030000000A0000005441424C455F4E414D4501000000000B00000043
      4F4C554D4E5F4E414D45010000000008000000434F4D4D454E54530100000000}
    Session = f_main.ora_Session
    Left = 256
    Top = 132
    object q_CommentsTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Required = True
      Size = 30
    end
    object q_CommentsCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Required = True
      Size = 30
    end
    object q_CommentsCOMMENTS: TStringField
      FieldName = 'COMMENTS'
      Size = 4000
    end
  end
  object q_cmn: TOracleQuery
    Session = f_main.ora_Session
    Left = 180
    Top = 344
  end
  object q_Sequences: TOracleDataSet
    SQL.Strings = (
      'SELECT SEQUENCE_NAME FROM USER_SEQUENCES'
      'ORDER BY SEQUENCE_NAME')
    QBEDefinition.QBEFieldDefs = {03000000010000000D00000053455155454E43455F4E414D450100000000}
    Session = f_main.ora_Session
    Left = 436
    Top = 312
  end
  object ds_Sequences: TDataSource
    DataSet = q_Sequences
    Left = 492
    Top = 312
  end
end
