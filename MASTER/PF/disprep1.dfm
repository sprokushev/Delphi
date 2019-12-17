object f_disprep1: Tf_disprep1
  Left = 478
  Top = 424
  Width = 324
  Height = 176
  Caption = #1044#1080#1089#1087#1077#1090#1095#1077#1088#1089#1082#1072#1103': '#1054#1090#1095#1077#1090' '#1086#1073' '#1086#1090#1075#1088#1091#1079#1082#1077' '#1085'/'#1087#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 9
    Width = 33
    Height = 13
    Caption = #1052#1077#1089#1103#1094
  end
  object Label2: TLabel
    Left = 182
    Top = 8
    Width = 17
    Height = 13
    Caption = #1075#1086#1076
  end
  object cb_Month: TComboBox
    Left = 62
    Top = 5
    Width = 111
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      #1071#1085#1074#1072#1088#1100
      #1060#1077#1074#1088#1072#1083#1100
      #1052#1072#1088#1090
      #1040#1087#1088#1077#1083#1100
      #1084#1072#1081
      #1048#1102#1085#1100
      #1048#1102#1083#1100
      #1040#1074#1075#1091#1089#1090
      #1057#1077#1085#1090#1103#1073#1088#1100
      #1054#1082#1090#1103#1073#1088#1100
      #1053#1086#1103#1073#1088#1100
      #1044#1077#1082#1072#1073#1088#1100)
  end
  object e_year: TRxSpinEdit
    Left = 211
    Top = 5
    Width = 64
    Height = 21
    Value = 2000.000000000000000000
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 31
    Width = 310
    Height = 77
    Caption = ' '#1079#1072' '#1089#1091#1090#1082#1080' '
    TabOrder = 2
    object Label3: TLabel
      Left = 54
      Top = 18
      Width = 6
      Height = 13
      Caption = #1089
    end
    object Label4: TLabel
      Left = 53
      Top = 48
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object time1: TDateTimePicker
      Left = 71
      Top = 15
      Width = 68
      Height = 21
      Date = 36717.750000000000000000
      Time = 36717.750000000000000000
      Kind = dtkTime
      TabOrder = 0
    end
    object time2: TDateTimePicker
      Left = 71
      Top = 45
      Width = 68
      Height = 21
      Date = 36717.250000000000000000
      Time = 36717.250000000000000000
      Kind = dtkTime
      TabOrder = 1
    end
    object date1: TDateTimePicker
      Left = 158
      Top = 15
      Width = 95
      Height = 21
      Date = 36717.541841782390000000
      Time = 36717.541841782390000000
      MinDate = 36708.000000000000000000
      TabOrder = 2
    end
    object date2: TDateTimePicker
      Left = 157
      Top = 45
      Width = 95
      Height = 21
      Date = 36717.541841782390000000
      Time = 36717.541841782390000000
      MinDate = 36708.000000000000000000
      TabOrder = 3
    end
  end
  object BitBtn2: TBitBtn
    Left = 84
    Top = 116
    Width = 149
    Height = 25
    Caption = #1054#1090#1095#1077#1090
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
      00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
      00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
      F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
      FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
      0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
      0033333337FFFFFF773333333000000003333333377777777333}
    NumGlyphs = 2
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 8
    Top = 44
  end
  object q_cmn: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 92
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=PF;Mode=ReadWrite;Extended Properties="DSN=PF;UID=;PWD=;So' +
      'urceDB=u:\luk\dbases;SourceType=DBF;Exclusive=No;BackgroundFetch' +
      '=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"'
    LoginPrompt = False
    Mode = cmReadWrite
    Left = 216
    Top = 40
  end
end
