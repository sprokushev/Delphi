object f_CatCenGroup: Tf_CatCenGroup
  Left = 279
  Top = 143
  Width = 696
  Height = 480
  Caption = #1043#1088#1091#1087#1087#1099' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1094#1077#1085
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
    Top = 23
    Width = 688
    Height = 423
    Align = alClient
    DataSource = ds_CatCenGroup
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
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 688
    Height = 23
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DockPos = 40
      DockRow = 1
      FullSize = True
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acCatCenGroupToDBF
      end
    end
  end
  object q_CatCenGroup: TOracleDataSet
    SQL.Strings = (
      'SELECT  rowid, KLS_CAT_CEN_GROUP.*'
      'FROM KLS_CAT_CEN_GROUP'
      ''
      ''
      ''
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000120000004341545F43454E5F47
      524F55505F4E414D450100000000}
    UniqueFields = 'ID'
    UpdatingTable = 'KLS_CAT_CEN_GROUP'
    Session = f_main.ora_Session
    Left = 536
    Top = 80
    object q_CatCenGroupID: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID'
      Required = True
    end
    object q_CatCenGroupCAT_CEN_GROUP_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'CAT_CEN_GROUP_NAME'
      Required = True
      Size = 30
    end
  end
  object ds_CatCenGroup: TDataSource
    DataSet = q_CatCenGroup
    Left = 564
    Top = 80
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 508
    Top = 108
    StyleName = 'XP Style'
    object acCatCenGroupToDBF: TAction
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' DBF'
      OnExecute = acCatCenGroupToDBFExecute
    end
  end
end
