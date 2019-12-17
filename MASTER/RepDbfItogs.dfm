object f_Rep_Dbf_Itogs: Tf_Rep_Dbf_Itogs
  Left = 193
  Top = 249
  Width = 643
  Height = 355
  Caption = #1055#1088#1086#1084#1077#1078#1091#1090#1086#1095#1085#1099#1077' '#1080#1090#1086#1075#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 280
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 280
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
  end
  object grid: TDBGridEh
    Left = 0
    Top = 0
    Width = 635
    Height = 280
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = ds_data
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
    PopupMenu = PopupMenu1
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
  end
  object ds_data: TDataSource
    Left = 248
    Top = 72
  end
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 104
    object Excel1: TMenuItem
      Action = acExport2Excel
    end
  end
  object ActionManager1: TActionManager
    Left = 304
    Top = 144
    StyleName = 'XP Style'
    object acExport2Excel: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      OnExecute = acExport2ExcelExecute
    end
  end
end
