object f_ShabExpNew: Tf_ShabExpNew
  Left = 223
  Top = 184
  BorderStyle = bsSingle
  Caption = #1064#1072#1073#1083#1086#1085' '#1101#1082#1089#1087#1086#1088#1090#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
  ClientHeight = 566
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000EEEEEEE00000E00000EEEEEEEEEEE00000E
    EE000000EEE000000EEEEEEE00000000E0000000EEE0000000EEEEE000000000
    E000000EEEE0000000EEEEE000000000E000000EEEEE000000EEEEE000000000
    E000000EEEEE000000EEEEE000000000E00000EEEEEEE00000EEEEE000000000
    E00000EEEEE0E00000EEEEE000000000E0000EEEEEE0E00000EEEEE000000000
    E0000EEEEE000E0000EEEEE000000000E0000EEEEE000E0000EEEEE000000000
    E000EEEEEE0000E000EEEEE000000000E000EEEEE00000E000EEEEE000000000
    E00EEEEEE00000E000EEEEE000000000E00EEEEE0000000E00EEEEE000000000
    E0EEEEEE0000000E00EEEEE000000000E0EEEEE000000000E0EEEEE000000000
    E0EEEEE000000000E0EEEEE000000000EEEEEEE0000000000EEEEEE00000000E
    EEEEEE00000000000EEEEEEE00000EEEEEEEEE000000000000EEEEEEEE000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFF80FBE003E3F1F80FF7F1FC1FF7E1FC1FF7E0FC1FF7E0
    FC1FF7C07C1FF7C17C1FF7817C1FF783BC1FF783BC1FF703DC1FF707DC1FF607
    DC1FF60FEC1FF40FEC1FF41FF41FF41FF41FF01FF81FE03FF80F803FFC03FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 779
    Height = 536
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1063#1072#1089#1090#1100'1'
      object GroupBox1: TGroupBox
        Left = 1
        Top = 0
        Width = 769
        Height = 65
        Caption = #1044#1086#1089#1090#1091#1087' '#1080' '#1076#1086#1075#1086#1074#1086#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 9
          Top = 18
          Width = 61
          Height = 13
          Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 225
          Top = 18
          Width = 73
          Height = 13
          Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 9
          Top = 43
          Width = 121
          Height = 13
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103' '#1082' '#1076#1086#1075#1086#1074#1086#1088#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lcDog_number: TRxDBLookupCombo
          Left = 73
          Top = 14
          Width = 145
          Height = 21
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LookupField = 'ID'
          LookupDisplay = 'DOG_NUMBER'
          LookupSource = f_ShabExp.ds_dog
          ParentFont = False
          TabOrder = 0
        end
        object lcProd: TRxDBLookupCombo
          Left = 312
          Top = 14
          Width = 281
          Height = 21
          DropDownCount = 8
          DisplayEmpty = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090'>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LookupField = 'ID_NPR'
          LookupDisplay = 'NAME_NPR'
          LookupSource = f_ShabExp.ds_prod
          ParentFont = False
          TabOrder = 1
        end
        object edDog_prim: TEdit
          Left = 144
          Top = 39
          Width = 441
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox2: TGroupBox
        Left = 1
        Top = 68
        Width = 769
        Height = 66
        Caption = #1054#1089#1086#1073#1077#1085#1085#1099#1077' '#1086#1090#1084#1077#1090#1082#1080' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label4: TLabel
          Left = 8
          Top = 20
          Width = 53
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072' 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 384
          Top = 20
          Width = 53
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072' 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 8
          Top = 44
          Width = 53
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072' 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 384
          Top = 44
          Width = 53
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072' 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edOsob1: TEdit
          Left = 72
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 33 '#1089#1080#1084#1074#1086#1083#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 33
          ParentFont = False
          TabOrder = 0
        end
        object edOsob2: TEdit
          Left = 448
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 33 '#1089#1080#1084#1074#1086#1083#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 33
          ParentFont = False
          TabOrder = 1
        end
        object edOsob3: TEdit
          Left = 72
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 33 '#1089#1080#1084#1074#1086#1083#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 33
          ParentFont = False
          TabOrder = 2
        end
        object edOsob4: TEdit
          Left = 448
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 33 '#1089#1080#1084#1074#1086#1083#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 33
          ParentFont = False
          TabOrder = 3
        end
      end
      object GroupBox3: TGroupBox
        Left = 1
        Top = 136
        Width = 769
        Height = 67
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100', '#1087#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label8: TLabel
          Left = 8
          Top = 20
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 8
          Top = 44
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 384
          Top = 20
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 384
          Top = 44
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edPol1: TEdit
          Left = 72
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 30 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 30
          ParentFont = False
          TabOrder = 0
        end
        object edPol3: TEdit
          Left = 72
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 30 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 30
          ParentFont = False
          TabOrder = 1
        end
        object edPol4: TEdit
          Left = 448
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 30 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 30
          ParentFont = False
          TabOrder = 2
        end
        object edPol2: TEdit
          Left = 448
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 30 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 30
          ParentFont = False
          TabOrder = 3
        end
      end
      object GroupBox4: TGroupBox
        Left = 1
        Top = 206
        Width = 769
        Height = 66
        Caption = #1054#1090#1084#1077#1090#1082#1080' '#1085#1077#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1077' '#1076#1083#1103' '#1078#1077#1083#1077#1079#1085#1086#1081' '#1076#1086#1088#1086#1075#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object Label12: TLabel
          Left = 8
          Top = 20
          Width = 53
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072' 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 44
          Width = 53
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072' 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 384
          Top = 20
          Width = 53
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072' 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 384
          Top = 44
          Width = 53
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072' 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edNeob3: TEdit
          Left = 72
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 40 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          TabOrder = 2
        end
        object edNeob1: TEdit
          Left = 72
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 40 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          TabOrder = 0
        end
        object edNeob4: TEdit
          Left = 448
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 40 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          TabOrder = 3
        end
        object edNeob2: TEdit
          Left = 448
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 40 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox5: TGroupBox
        Left = 1
        Top = 275
        Width = 769
        Height = 67
        Caption = #1055#1086#1075#1088#1072#1085#1080#1095#1085#1099#1077' '#1089#1090#1072#1085#1094#1080#1080' '#1087#1077#1088#1077#1093#1086#1076#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object Label16: TLabel
          Left = 8
          Top = 20
          Width = 51
          Height = 13
          Caption = #1057#1090#1072#1085#1094#1080#1103' 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 8
          Top = 44
          Width = 51
          Height = 13
          Caption = #1057#1090#1072#1085#1094#1080#1103' 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 384
          Top = 20
          Width = 51
          Height = 13
          Caption = #1057#1090#1072#1085#1094#1080#1103' 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 384
          Top = 44
          Width = 51
          Height = 13
          Caption = #1057#1090#1072#1085#1094#1080#1103' 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edStan1: TEdit
          Left = 72
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 40 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          TabOrder = 0
        end
        object edStan3: TEdit
          Left = 72
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 40 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          TabOrder = 2
        end
        object edStan2: TEdit
          Left = 448
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 40 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          TabOrder = 1
        end
        object edStan4: TEdit
          Left = 448
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 40 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          TabOrder = 3
        end
      end
      object GroupBox6: TGroupBox
        Left = 1
        Top = 346
        Width = 769
        Height = 68
        Caption = #1044#1086#1088#1086#1075#1072' '#1080' '#1089#1090#1072#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object Label21: TLabel
          Left = 10
          Top = 20
          Width = 42
          Height = 13
          Caption = #1057#1090#1072#1085#1094#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 8
          Top = 44
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 384
          Top = 44
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lcStan: TRxDBLookupCombo
          Left = 141
          Top = 16
          Width = 420
          Height = 21
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LookupField = 'ID'
          LookupDisplay = 'STAN_NAME'
          LookupSource = f_ShabExp.ds_stan
          ParentFont = False
          TabOrder = 1
          OnChange = lcStanChange
        end
        object edStan_kod: TEdit
          Left = 72
          Top = 16
          Width = 63
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edStan_kodChange
        end
        object edDorst1: TEdit
          Left = 72
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 40 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          TabOrder = 2
        end
        object edDorst2: TEdit
          Left = 440
          Top = 40
          Width = 314
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 40 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          TabOrder = 3
        end
      end
      object GroupBox7: TGroupBox
        Left = 1
        Top = 416
        Width = 769
        Height = 90
        Caption = #1053#1072#1080#1084#1077#1085#1074#1072#1085#1080#1077' '#1075#1088#1091#1079#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object Label23: TLabel
          Left = 8
          Top = 20
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 272
          Top = 20
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 520
          Top = 20
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 8
          Top = 44
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 272
          Top = 44
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 5'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 520
          Top = 44
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 6'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 8
          Top = 68
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 7'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 272
          Top = 68
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 520
          Top = 68
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 9'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edNm_gr1: TEdit
          Left = 72
          Top = 16
          Width = 193
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 26 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 26
          ParentFont = False
          TabOrder = 0
        end
        object edNm_gr2: TEdit
          Left = 323
          Top = 16
          Width = 193
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 26 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 26
          ParentFont = False
          TabOrder = 1
        end
        object edNm_gr3: TEdit
          Left = 568
          Top = 16
          Width = 193
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 26 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 26
          ParentFont = False
          TabOrder = 2
        end
        object edNm_gr4: TEdit
          Left = 72
          Top = 40
          Width = 193
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 26 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 26
          ParentFont = False
          TabOrder = 3
        end
        object edNm_gr5: TEdit
          Left = 323
          Top = 40
          Width = 193
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 26 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 26
          ParentFont = False
          TabOrder = 4
        end
        object edNm_gr6: TEdit
          Left = 568
          Top = 40
          Width = 193
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 26 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 26
          ParentFont = False
          TabOrder = 5
        end
        object edNm_gr7: TEdit
          Left = 72
          Top = 64
          Width = 193
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 26 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 26
          ParentFont = False
          TabOrder = 6
        end
        object edNm_gr8: TEdit
          Left = 323
          Top = 64
          Width = 193
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 26 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 26
          ParentFont = False
          TabOrder = 7
        end
        object edNm_gr9: TEdit
          Left = 568
          Top = 64
          Width = 193
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 26 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 26
          ParentFont = False
          TabOrder = 8
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1063#1072#1089#1090#1100' 2'
      ImageIndex = 1
      object GroupBox8: TGroupBox
        Left = 0
        Top = 0
        Width = 769
        Height = 66
        Caption = #1055#1083#1072#1090#1077#1078#1080' '#1087#1088#1080#1085#1103#1090#1099#1077' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1077#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label32: TLabel
          Left = 8
          Top = 20
          Width = 48
          Height = 13
          Caption = #1055#1083#1072#1090#1077#1078' 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 384
          Top = 20
          Width = 48
          Height = 13
          Caption = #1055#1083#1072#1090#1077#1078' 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 384
          Top = 44
          Width = 48
          Height = 13
          Caption = #1055#1083#1072#1090#1077#1078' 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 8
          Top = 44
          Width = 48
          Height = 13
          Caption = #1055#1083#1072#1090#1077#1078' 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edPlt_ot1: TEdit
          Left = 72
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 35 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 35
          ParentFont = False
          TabOrder = 0
        end
        object edPlt_ot2: TEdit
          Left = 448
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 35 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 35
          ParentFont = False
          TabOrder = 1
        end
        object edPlt_ot4: TEdit
          Left = 448
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 35 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 35
          ParentFont = False
          TabOrder = 3
        end
        object edPlt_ot3: TEdit
          Left = 72
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 35 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 35
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox9: TGroupBox
        Left = 1
        Top = 70
        Width = 769
        Height = 66
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099' '#1087#1088#1080#1083#1086#1078#1077#1085#1085#1099#1077' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1077#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label36: TLabel
          Left = 8
          Top = 20
          Width = 60
          Height = 13
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label37: TLabel
          Left = 384
          Top = 20
          Width = 60
          Height = 13
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 384
          Top = 44
          Width = 60
          Height = 13
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 8
          Top = 44
          Width = 60
          Height = 13
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edDocs1: TEdit
          Left = 72
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 35 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 35
          ParentFont = False
          TabOrder = 0
        end
        object edDocs2: TEdit
          Left = 448
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 35 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 35
          ParentFont = False
          TabOrder = 1
        end
        object edDocs4: TEdit
          Left = 448
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 35 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 35
          ParentFont = False
          TabOrder = 3
        end
        object edDocs3: TEdit
          Left = 72
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 35 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 35
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox10: TGroupBox
        Left = 1
        Top = 140
        Width = 769
        Height = 44
        Caption = #1054#1090#1084#1077#1090#1082#1080' '#1090#1072#1084#1086#1078#1085#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label40: TLabel
          Left = 8
          Top = 20
          Width = 53
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072' 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 384
          Top = 20
          Width = 53
          Height = 13
          Caption = #1054#1090#1084#1077#1090#1082#1072' 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edTam1: TEdit
          Left = 72
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 35 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 35
          ParentFont = False
          TabOrder = 0
        end
        object edTam2: TEdit
          Left = 448
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 35 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 35
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox11: TGroupBox
        Left = 0
        Top = 186
        Width = 769
        Height = 69
        Caption = #1055#1086#1079#1080#1094#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object Label42: TLabel
          Left = 8
          Top = 20
          Width = 59
          Height = 13
          Caption = #1055#1086#1079#1080#1094#1080#1103' 33'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 384
          Top = 20
          Width = 59
          Height = 13
          Caption = #1055#1086#1079#1080#1094#1080#1103' 34'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 384
          Top = 44
          Width = 59
          Height = 13
          Caption = #1055#1086#1079#1080#1094#1080#1103' 36'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 8
          Top = 44
          Width = 59
          Height = 13
          Caption = #1055#1086#1079#1080#1094#1080#1103' 35'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edPos33: TEdit
          Left = 72
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 10 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
        end
        object edPos34: TEdit
          Left = 448
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 10 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
        end
        object edPos36: TEdit
          Left = 448
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 10 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 3
        end
        object edPos35: TEdit
          Left = 72
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 10 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox12: TGroupBox
        Left = 0
        Top = 257
        Width = 769
        Height = 91
        Caption = #1064#1090#1072#1084#1087#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object Label46: TLabel
          Left = 8
          Top = 20
          Width = 43
          Height = 13
          Caption = #1064#1090#1072#1084#1087' 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 384
          Top = 20
          Width = 43
          Height = 13
          Caption = #1064#1090#1072#1084#1087' 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label48: TLabel
          Left = 384
          Top = 44
          Width = 43
          Height = 13
          Caption = #1064#1090#1072#1084#1087' 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 8
          Top = 44
          Width = 43
          Height = 13
          Caption = #1064#1090#1072#1084#1087' 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label50: TLabel
          Left = 8
          Top = 68
          Width = 43
          Height = 13
          Caption = #1064#1090#1072#1084#1087' 5'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edShtamp1: TEdit
          Left = 72
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 50 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 0
        end
        object edShtamp2: TEdit
          Left = 448
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 50 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 1
        end
        object edShtamp4: TEdit
          Left = 448
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 50 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 3
        end
        object edShtamp3: TEdit
          Left = 72
          Top = 40
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 50 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 2
        end
        object edShtamp5: TEdit
          Left = 72
          Top = 64
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 50 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 4
        end
      end
      object GroupBox13: TGroupBox
        Left = 0
        Top = 350
        Width = 769
        Height = 43
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1075#1088#1091#1079#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object Label51: TLabel
          Left = 8
          Top = 20
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 384
          Top = 20
          Width = 45
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edGr1_txt_ex: TEdit
          Left = 72
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 60 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 60
          ParentFont = False
          TabOrder = 0
        end
        object edGr2_txt_ex: TEdit
          Left = 448
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 60 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 60
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox14: TGroupBox
        Left = 0
        Top = 395
        Width = 769
        Height = 105
        Caption = #1055#1088#1086#1095#1077#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object Label53: TLabel
          Left = 10
          Top = 18
          Width = 78
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1087#1083#1072#1090#1077#1078#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 10
          Top = 44
          Width = 104
          Height = 13
          Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1090#1072#1088#1080#1092#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 8
          Top = 68
          Width = 123
          Height = 13
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btnFindTex_pd: TSpeedButton
          Left = 608
          Top = 39
          Width = 23
          Height = 22
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDD00000DDDDD00000D0F000DDDDD0F000D0F000DDDDD0F
            000D0000000D0000000D00F000000F00000D00F000D00F00000D00F000D00F00
            000DD0000000000000DDDD0F000D0F000DDDDD00000D00000DDDDDD000DDD000
            DDDDDDD0F0DDD0F0DDDDDDD000DDD000DDDDDDDDDDDDDDDDDDDD}
          OnClick = btnFindTex_pdClick
        end
        object edKod_tex_pd: TEdit
          Left = 120
          Top = 40
          Width = 63
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = edKod_tex_pdChange
        end
        object lcTex_pd: TRxDBLookupCombo
          Left = 189
          Top = 40
          Width = 420
          Height = 21
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LookupField = 'ID'
          LookupDisplay = 'TEX_PD_NAME'
          LookupSource = f_ShabExp.ds_tex_pd
          ParentFont = False
          TabOrder = 2
        end
        object edCnt_ved: TEdit
          Left = 136
          Top = 64
          Width = 33
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edMesto_pay: TEdit
          Left = 121
          Top = 16
          Width = 305
          Height = 21
          Hint = #1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' 30 '#1089#1080#1084#1074#1086#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 30
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 536
    Width = 779
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 6
      Top = 3
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 698
      Top = 3
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
