object ARCSISDATAFORM: TARCSISDATAFORM
  Left = 156
  Top = 170
  Width = 730
  Height = 619
  Caption = 'ARCSIS '#1076#1072#1085#1085#1099#1077
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 722
    Height = 585
    ActivePage = TabProto
    Align = alClient
    TabOrder = 0
    object TabTare: TTabSheet
      Caption = #1055#1086#1088#1086#1078#1085#1080#1077' '#1089#1086#1089#1090#1072#1074#1099' - '#1085#1072' '#1079#1072#1074#1086#1076
      object Splitter1: TSplitter
        Left = 0
        Top = 197
        Width = 714
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object gridTareTrains: TDBGridEh
        Left = 0
        Top = 33
        Width = 714
        Height = 164
        Align = alTop
        DataSource = ds_TareTrains
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
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
            FieldName = 'TrainNumber'
            Footers = <>
            Width = 95
          end
          item
            EditButtons = <>
            FieldName = 'TrainDate'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'VagonsCount'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'WayOfLoadingName'
            Footers = <>
            Width = 177
          end
          item
            EditButtons = <>
            FieldName = 'UserComment'
            Footers = <>
            Width = 206
          end>
      end
      object gridTareVagons: TDBGridEh
        Left = 0
        Top = 235
        Width = 714
        Height = 253
        Align = alClient
        DataSource = ds_TareVagons
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'VagonNumber'
            Footers = <>
            Width = 39
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'MPSID'
            Footer.FieldName = 'MPSID'
            Footer.ValueType = fvtCount
            Footers = <>
            Width = 84
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'VagonTypeName'
            Footers = <>
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'WeightGross'
            Footer.FieldName = 'WeightGross'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'WeightTare'
            Footer.FieldName = 'WeightTare'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'WeightNet'
            Footer.FieldName = 'WeightNet'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'Tonnage'
            Footers = <>
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'Speed'
            Footers = <>
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'POD_NUM'
            Footers = <>
            Width = 84
          end>
      end
      object Memo1: TMemo
        Left = 0
        Top = 488
        Width = 714
        Height = 69
        Align = alBottom
        Color = clBtnFace
        Lines.Strings = (
          #1047#1076#1077#1089#1100' '#1086#1090#1086#1073#1088#1072#1078#1072#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1089#1086#1089#1090#1072#1074#1099' '#1089#1086#1093#1088#1072#1085#1077#1085#1085#1099#1077' "'#1050#1040#1050' '#1058#1040#1056#1040'".'
          '')
        ReadOnly = True
        TabOrder = 2
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 714
        Height = 33
        Align = alTop
        TabOrder = 3
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 44
          Height = 13
          Caption = #1057#1086#1089#1090#1072#1074#1099
        end
        object cb_TareNew: TCheckBox
          Left = 59
          Top = 7
          Width = 137
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1085#1086#1074#1099#1077
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = btTareRefreshClick
        end
        object btTareRefresh: TButton
          Left = 164
          Top = 4
          Width = 169
          Height = 25
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 1
          OnClick = btTareRefreshClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 200
        Width = 714
        Height = 35
        Align = alTop
        TabOrder = 4
        object Label2: TLabel
          Left = 8
          Top = 12
          Width = 38
          Height = 13
          Caption = #1042#1072#1075#1086#1085#1099
        end
        object btTareProto: TButton
          Left = 62
          Top = 5
          Width = 187
          Height = 25
          Caption = #1074' '#1058#1086#1074#1072#1088#1085#1099#1081' '#1086#1087#1077#1088#1072#1090#1086#1088
          TabOrder = 0
          OnClick = btTareProtoClick
        end
        object btTarePrint: TButton
          Left = 260
          Top = 5
          Width = 129
          Height = 25
          Caption = #1055#1077#1095#1072#1090#1100
          TabOrder = 1
          OnClick = btTarePrintClick
        end
        object btTareToXLS: TButton
          Left = 396
          Top = 5
          Width = 169
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' Excel'
          TabOrder = 2
          OnClick = btTareToXLSClick
        end
      end
    end
    object TabReady: TTabSheet
      Caption = #1043#1088#1091#1078#1077#1085#1085#1099#1077' '#1089#1086#1089#1090#1072#1074#1099' - '#1089' '#1079#1072#1074#1086#1076#1072
      ImageIndex = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 170
        Width = 714
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object gridReadyTrains: TDBGridEh
        Left = 0
        Top = 33
        Width = 714
        Height = 137
        Align = alTop
        DataSource = ds_ReadyTrains
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
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
            FieldName = 'TrainNumber'
            Footers = <>
            Width = 95
          end
          item
            EditButtons = <>
            FieldName = 'TrainDate'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'VagonsCount'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'WayOfLoadingName'
            Footers = <>
            Width = 177
          end
          item
            EditButtons = <>
            FieldName = 'UserComment'
            Footers = <>
            Width = 206
          end>
      end
      object gridReadyVagons: TDBGridEh
        Left = 0
        Top = 208
        Width = 714
        Height = 280
        Align = alClient
        DataSource = ds_ReadyVagons
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'VagonNumber'
            Footers = <>
            Width = 39
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'MPSID'
            Footer.FieldName = 'MPSID'
            Footer.ValueType = fvtCount
            Footers = <>
            Width = 84
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'VagonTypeName'
            Footers = <>
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'WeightGross'
            Footer.FieldName = 'WeightGross'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'WeightTare'
            Footer.FieldName = 'WeightTare'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'WeightNet'
            Footer.FieldName = 'WeightNet'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'Tonnage'
            Footers = <>
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'Speed'
            Footers = <>
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'POD_NUM'
            Footers = <>
            Width = 76
          end>
      end
      object Memo2: TMemo
        Left = 0
        Top = 488
        Width = 714
        Height = 69
        Align = alBottom
        Color = clBtnFace
        Lines.Strings = (
          
            #1047#1076#1077#1089#1100' '#1086#1090#1086#1073#1088#1072#1078#1072#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077' '#1089#1086#1089#1090#1072#1074#1099' '#1089' '#1074#1072#1075#1086#1085#1072#1084#1080', '#1082#1086#1090#1086#1088 +
            #1099#1077' '#1073#1099#1083#1080' '
          #1086#1073#1088#1072#1073#1086#1090#1072#1085#1099' '#1080' '#1089#1086#1093#1088#1072#1085#1077#1085#1099'('#1087#1077#1088#1077#1076#1072#1085#1099' '#1074' '#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077').'
          
            #1045#1089#1083#1080' '#1079#1076#1077#1089#1100' '#1087#1091#1089#1090#1086', '#1090#1086' '#1101#1090#1086' '#1085#1077' '#1079#1085#1072#1095#1080#1090', '#1095#1090#1086' '#1089#1086#1089#1090#1072#1074#1086#1074' '#1085#1077#1090' , '#1072' '#1101#1090#1086' '#1079#1085#1072 +
            #1095#1080#1090', '#1095#1090#1086' '
          #1086#1085#1080' '#1085#1077' '#1073#1099#1083#1080'  '#1089#1086#1093#1088#1072#1085#1077#1085#1099'('#1087#1077#1088#1077#1076#1072#1085#1099' '#1074' '#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077')'
          ''
          '')
        ReadOnly = True
        TabOrder = 2
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 714
        Height = 33
        Align = alTop
        TabOrder = 3
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 44
          Height = 13
          Caption = #1057#1086#1089#1090#1072#1074#1099
        end
        object cb_ReadyNew: TCheckBox
          Left = 59
          Top = 7
          Width = 137
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1085#1086#1074#1099#1077
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = btReadyRefreshClick
        end
        object btReadyRefresh: TButton
          Left = 164
          Top = 4
          Width = 169
          Height = 25
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 1
          OnClick = btReadyRefreshClick
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 173
        Width = 714
        Height = 35
        Align = alTop
        TabOrder = 4
        object Label5: TLabel
          Left = 8
          Top = 9
          Width = 38
          Height = 13
          Caption = #1042#1072#1075#1086#1085#1099
        end
        object btReadyProto: TButton
          Left = 54
          Top = 5
          Width = 219
          Height = 25
          Caption = #1074' '#1058#1086#1074#1072#1088#1085#1099#1081' '#1086#1087#1077#1088#1072#1090#1086#1088
          TabOrder = 0
          OnClick = btReadyProtoClick
        end
        object btReadyPrint: TButton
          Left = 282
          Top = 5
          Width = 129
          Height = 25
          Caption = #1055#1077#1095#1072#1090#1100
          TabOrder = 1
          OnClick = btReadyPrintClick
        end
        object btReadyToXLS: TButton
          Left = 422
          Top = 5
          Width = 169
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' Excel'
          TabOrder = 2
          OnClick = btReadyToXLSClick
        end
      end
    end
    object TabProto: TTabSheet
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083#1072' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103
      ImageIndex = 2
      object Splitter3: TSplitter
        Left = 0
        Top = 170
        Width = 714
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object gridProtoTrains: TDBGridEh
        Left = 0
        Top = 33
        Width = 714
        Height = 137
        Align = alTop
        DataSource = ds_ProtoTrains
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
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
            FieldName = 'ProtoID'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'TareTrainDate'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'TareTrainNumber'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'TrainNumber'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'TO_ISU'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'WayOfLoadingName'
            Footers = <>
            Width = 233
          end>
      end
      object gridProtoVagons: TDBGridEh
        Left = 0
        Top = 208
        Width = 714
        Height = 280
        Align = alClient
        DataSource = ds_ProtoVagons
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'ordnung'
            Footers = <>
            Width = 51
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'VagonTypeName'
            Footers = <>
            Width = 55
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'MPSID'
            Footer.FieldName = 'MPSID'
            Footer.ValueType = fvtCount
            Footers = <>
            Width = 88
          end
          item
            EditButtons = <>
            FieldName = 'WeightNet'
            Footer.FieldName = 'WeightNet'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'WeightGross'
            Footer.FieldName = 'WeightGross'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'WeightTare'
            Footer.FieldName = 'WeightTare'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 88
          end
          item
            EditButtons = <>
            FieldName = 'Tonnage'
            Footers = <>
            Width = 92
          end
          item
            EditButtons = <>
            FieldName = 'POD_NUM'
            Footers = <>
            Width = 83
          end>
      end
      object Memo3: TMemo
        Left = 0
        Top = 488
        Width = 714
        Height = 69
        Align = alBottom
        Color = clBtnFace
        Lines.Strings = (
          #1047#1076#1077#1089#1100' '#1086#1090#1086#1073#1088#1072#1078#1072#1102#1090#1089#1103' '#1087#1088#1086#1090#1086#1082#1086#1083#1072' '#1074#1079#1074#1077#1096#1080#1074#1072#1085#1080#1103
          ''
          '')
        ReadOnly = True
        TabOrder = 2
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 714
        Height = 33
        Align = alTop
        TabOrder = 3
        object Label4: TLabel
          Left = 8
          Top = 8
          Width = 44
          Height = 13
          Caption = #1057#1086#1089#1090#1072#1074#1099
        end
        object btProtoRefresh: TButton
          Left = 196
          Top = 4
          Width = 169
          Height = 25
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btProtoRefreshClick
        end
        object cb_ProtoNew: TCheckBox
          Left = 60
          Top = 7
          Width = 137
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1087#1086#1088#1086#1078#1085#1080#1077
          TabOrder = 1
          OnClick = btProtoRefreshClick
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 173
        Width = 714
        Height = 35
        Align = alTop
        TabOrder = 4
        object Label6: TLabel
          Left = 8
          Top = 11
          Width = 38
          Height = 13
          Caption = #1042#1072#1075#1086#1085#1099
        end
        object btProtoToXLS: TButton
          Left = 364
          Top = 4
          Width = 169
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' Excel'
          TabOrder = 0
          OnClick = btProtoToXLSClick
        end
        object btProtoTovOp: TButton
          Left = 86
          Top = 4
          Width = 136
          Height = 25
          Caption = #1074' '#1058#1086#1074#1072#1088#1085#1099#1081' '#1086#1087#1077#1088#1072#1090#1086#1088
          TabOrder = 1
          OnClick = btProtoTovOpClick
        end
        object btProtoPrint: TButton
          Left = 229
          Top = 4
          Width = 129
          Height = 25
          Caption = #1055#1077#1095#1072#1090#1100
          TabOrder = 2
          OnClick = btProtoPrintClick
        end
      end
    end
  end
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=utyjajyl;Persist Security Info=True' +
      ';User ID=arscisarm;Initial Catalog=RRDB1;Data Source=172.19.44.1' +
      '72'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 104
  end
  object ds_TareTrains: TDataSource
    DataSet = q_TareTrains
    Left = 216
    Top = 56
  end
  object ds_TareVagons: TDataSource
    DataSet = q_TareVagons
    Left = 272
    Top = 248
  end
  object ehprTareVagons: TPrintDBGridEh
    DBGridEh = gridTareVagons
    Options = [pghFitGridToPageWidth, pghRowAutoStretch]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 3.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 168
    Top = 256
  end
  object q_TareTrains: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = q_TareTrainsBeforeOpen
    AfterScroll = q_TareTrainsAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select a.*,b.WayOfLoadingName from TareTrains a, WaysOfLoading b'
      'where a.WayOfLoadingID=b.WayOfLoadingID'
      
        'and (a.TrainDate>=dateadd(day,-1,getdate()) or exists (select nu' +
        'll from TareVagons aa left join'
      
        '  (select bb.TareTrainID,aa.MPSID,aa.ID as ProtoVagonID from Pro' +
        'toVagons aa, ProtoTrains bb where aa.ProtoID=bb.ProtoID'
      '  ) pv on aa.TrainID=pv.TareTrainID and aa.MPSID=pv.MPSID'
      
        'where aa.TrainID=a.TrainID and aa.mpsid not like '#39'%$%'#39' and pv.Pr' +
        'otoVagonID is null))'
      'order by a.TrainDate desc')
    Left = 332
    Top = 104
    object q_TareTrainsTrainID: TAutoIncField
      FieldName = 'TrainID'
      ReadOnly = True
    end
    object q_TareTrainsSourceTrainID: TIntegerField
      FieldName = 'SourceTrainID'
    end
    object q_TareTrainsTrainDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'TrainDate'
    end
    object q_TareTrainsTrainNumber: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1086#1089#1090#1072#1074#1072
      FieldName = 'TrainNumber'
      Size = 15
    end
    object q_TareTrainsUserComment: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'UserComment'
      Size = 50
    end
    object q_TareTrainsUserID: TBlobField
      FieldName = 'UserID'
    end
    object q_TareTrainsDirection: TBooleanField
      FieldName = 'Direction'
    end
    object q_TareTrainsWayOfLoadingID: TIntegerField
      FieldName = 'WayOfLoadingID'
    end
    object q_TareTrainsVagonsCount: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'VagonsCount'
    end
    object q_TareTrainsWayOfLoadingName: TStringField
      DisplayLabel = #1055#1091#1090#1100' '#1087#1086#1075#1088#1091#1079#1082#1080
      FieldName = 'WayOfLoadingName'
      Size = 50
    end
    object q_TareTrainsWeighingProtocolNum: TStringField
      FieldName = 'WeighingProtocolNum'
      Size = 50
    end
  end
  object q_TareVagons: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = q_TareVagonsBeforeOpen
    Parameters = <>
    SQL.Strings = (
      
        'select distinct a.*,b.VagonTypeName, pv.ProtoVagonID, pv.ProtoID' +
        ', pv.POD_NUM'
      'from TareVagons a '
      'left join ('
      
        'select bb.TareTrainID,aa.MPSID,aa.ID as ProtoVagonID,bb.ProtoID,' +
        'aa.POD_NUM'
      'from ProtoVagons aa, ProtoTrains bb'
      'where aa.ProtoID=bb.ProtoID'
      ') pv on a.TrainID=pv.TareTrainID and a.MPSID=pv.MPSID'
      'left join VagonTypes b on a.VagonTypeID=b.VagonTypeID'
      'where a.TrainID=8'
      '-- and a.mpsid not like '#39'%$%'#39
      'and pv.ProtoVagonID is null'
      'order by a.ID desc')
    Left = 444
    Top = 320
    object q_TareVagonsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object q_TareVagonsSourceVagonID: TIntegerField
      FieldName = 'SourceVagonID'
    end
    object q_TareVagonsTrainID: TIntegerField
      FieldName = 'TrainID'
    end
    object q_TareVagonsVagonTypeID: TIntegerField
      FieldName = 'VagonTypeID'
    end
    object q_TareVagonsMarkingID: TIntegerField
      FieldName = 'MarkingID'
    end
    object q_TareVagonsConsignorID: TIntegerField
      FieldName = 'ConsignorID'
    end
    object q_TareVagonsConsigneeID: TIntegerField
      FieldName = 'ConsigneeID'
    end
    object q_TareVagonsMPSID: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1074#1072#1075#1086#1085#1072
      FieldName = 'MPSID'
      Size = 10
    end
    object q_TareVagonsVagonNumber: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'VagonNumber'
    end
    object q_TareVagonsWeightGross: TIntegerField
      DisplayLabel = #1042#1077#1089' '#1073#1088#1091#1090#1090#1086', '#1082#1075
      FieldName = 'WeightGross'
      DisplayFormat = '### ###'
    end
    object q_TareVagonsWeightTare: TIntegerField
      DisplayLabel = #1058#1072#1088#1072', '#1082#1075
      FieldName = 'WeightTare'
      DisplayFormat = '### ###'
    end
    object q_TareVagonsWeightNet: TIntegerField
      DisplayLabel = #1042#1077#1089' '#1085#1077#1090#1090#1086', '#1082#1075
      FieldName = 'WeightNet'
      DisplayFormat = '### ###'
    end
    object q_TareVagonsWeightBillWeight: TIntegerField
      FieldName = 'WeightBillWeight'
    end
    object q_TareVagonsTonnage: TIntegerField
      DisplayLabel = #1043#1088#1091#1079'-'#1090#1100', '#1082#1075
      FieldName = 'Tonnage'
      DisplayFormat = '### ###'
    end
    object q_TareVagonsWeightBillNumber: TStringField
      FieldName = 'WeightBillNumber'
      Size = 15
    end
    object q_TareVagonsWeightBillDate: TDateTimeField
      FieldName = 'WeightBillDate'
    end
    object q_TareVagonsSpeed: TFloatField
      DisplayLabel = #1057#1082#1086#1088#1086#1089#1090#1100', '#1082#1084'/'#1095
      FieldName = 'Speed'
      DisplayFormat = '#.##'
    end
    object q_TareVagonsAxles: TWordField
      DisplayLabel = #1054#1089#1077#1081
      FieldName = 'Axles'
    end
    object q_TareVagonsUserComment: TStringField
      DisplayLabel = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'UserComment'
      Size = 50
    end
    object q_TareVagonsStatus: TWordField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'Status'
    end
    object q_TareVagonsVagonTypeName: TStringField
      DisplayLabel = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VagonTypeName'
      Size = 50
    end
    object q_TareVagonsProtoVagonID: TAutoIncField
      FieldName = 'ProtoVagonID'
      ReadOnly = True
    end
    object q_TareVagonsProtoID: TAutoIncField
      FieldName = 'ProtoID'
      ReadOnly = True
    end
    object q_TareVagonsPOD_NUM: TIntegerField
      DisplayLabel = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086#1076#1072#1095#1080
      FieldName = 'POD_NUM'
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 336
    Top = 336
  end
  object q_ReadyTrains: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = q_ReadyTrainsBeforeOpen
    AfterScroll = q_ReadyTrainsAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select a.*,b.WayOfLoadingName from Trains a, WaysOfLoading b'
      'where a.WayOfLoadingID=b.WayOfLoadingID'
      
        'and a.TrainDate>=dateadd(day,-1,getdate()) and exists (select nu' +
        'll from Vagons aa left join'
      
        '  (select bb.TrainID,aa.MPSID,aa.ID as ProtoVagonID from ProtoVa' +
        'gons aa, ProtoTrains bb where aa.ProtoID=bb.ProtoID'
      '  ) pv on aa.TrainID=pv.TrainID and aa.MPSID=pv.MPSID'
      
        'where aa.TrainID=a.TrainID and aa.mpsid not like '#39'%$%'#39' and aa.We' +
        'ightGross>25000 and pv.ProtoVagonID is null)'
      'order by a.TrainDate desc')
    Left = 420
    Top = 104
    object q_ReadyTrainsTrainID: TAutoIncField
      FieldName = 'TrainID'
      ReadOnly = True
    end
    object q_ReadyTrainsSourceTrainID: TIntegerField
      FieldName = 'SourceTrainID'
    end
    object q_ReadyTrainsUserID: TBlobField
      FieldName = 'UserID'
    end
    object q_ReadyTrainsTrainDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'TrainDate'
    end
    object q_ReadyTrainsTrainNumber: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1086#1089#1090#1072#1074#1072
      FieldName = 'TrainNumber'
      Size = 15
    end
    object q_ReadyTrainsDirection: TBooleanField
      FieldName = 'Direction'
    end
    object q_ReadyTrainsWayOfLoadingID: TIntegerField
      FieldName = 'WayOfLoadingID'
    end
    object q_ReadyTrainsVagonsCount: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'VagonsCount'
    end
    object q_ReadyTrainsUserComment: TStringField
      DisplayLabel = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'UserComment'
      Size = 50
    end
    object q_ReadyTrainsWayOfLoadingName: TStringField
      DisplayLabel = #1055#1091#1090#1100' '#1087#1086#1075#1088#1091#1079#1082#1080
      FieldName = 'WayOfLoadingName'
      Size = 50
    end
    object q_ReadyTrainsWeighingProtocolNum: TStringField
      FieldName = 'WeighingProtocolNum'
      Size = 50
    end
  end
  object q_ReadyVagons: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = q_ReadyVagonsBeforeOpen
    Parameters = <>
    SQL.Strings = (
      
        'select distinct a.*,b.VagonTypeName, pv.ProtoVagonID, pv.ProtoID' +
        ', pv.POD_NUM'
      'from Vagons a'
      'left join ('
      
        'select bb.TrainID,aa.MPSID,aa.ID as ProtoVagonID,bb.ProtoID,aa.P' +
        'OD_NUM'
      'from ProtoVagons aa, ProtoTrains bb'
      'where aa.ProtoID=bb.ProtoID'
      ') pv on a.TrainID=pv.TrainID and a.MPSID=pv.MPSID'
      'left join VagonTypes b on a.VagonTypeID=b.VagonTypeID'
      'where a.TrainID=5'
      '-- and a.mpsid not like '#39'%$%'#39' and a.WeightGross>25000'
      'and pv.ProtoVagonID is null '
      'order by a.ID')
    Left = 532
    Top = 320
    object q_ReadyVagonsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object q_ReadyVagonsSourceVagonID: TIntegerField
      FieldName = 'SourceVagonID'
    end
    object q_ReadyVagonsTrainID: TIntegerField
      FieldName = 'TrainID'
    end
    object q_ReadyVagonsVagonTypeID: TIntegerField
      FieldName = 'VagonTypeID'
    end
    object q_ReadyVagonsMarkingID: TIntegerField
      FieldName = 'MarkingID'
    end
    object q_ReadyVagonsConsignorID: TIntegerField
      FieldName = 'ConsignorID'
    end
    object q_ReadyVagonsConsigneeID: TIntegerField
      FieldName = 'ConsigneeID'
    end
    object q_ReadyVagonsMPSID: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1074#1072#1075#1086#1085#1072
      FieldName = 'MPSID'
      Size = 10
    end
    object q_ReadyVagonsVagonNumber: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'VagonNumber'
    end
    object q_ReadyVagonsVagonDate: TDateTimeField
      FieldName = 'VagonDate'
    end
    object q_ReadyVagonsVagonDirection: TBooleanField
      FieldName = 'VagonDirection'
    end
    object q_ReadyVagonsIsCover: TBooleanField
      FieldName = 'IsCover'
    end
    object q_ReadyVagonsWeightGross: TIntegerField
      DisplayLabel = #1042#1077#1089' '#1073#1088#1091#1090#1090#1086', '#1082#1075
      FieldName = 'WeightGross'
      DisplayFormat = '### ###'
    end
    object q_ReadyVagonsWeightTare: TIntegerField
      DisplayLabel = #1058#1072#1088#1072', '#1082#1075
      FieldName = 'WeightTare'
      DisplayFormat = '### ###'
    end
    object q_ReadyVagonsWeightNet: TIntegerField
      DisplayLabel = #1042#1077#1089' '#1085#1077#1090#1090#1086', '#1082#1075
      FieldName = 'WeightNet'
      DisplayFormat = '### ###'
    end
    object q_ReadyVagonsWeightBillWeight: TIntegerField
      FieldName = 'WeightBillWeight'
    end
    object q_ReadyVagonsTonnage: TIntegerField
      DisplayLabel = #1043#1088#1091#1079'-'#1090#1100', '#1082#1075
      FieldName = 'Tonnage'
      DisplayFormat = '### ###'
    end
    object q_ReadyVagonsWeightBillNumber: TStringField
      FieldName = 'WeightBillNumber'
      Size = 15
    end
    object q_ReadyVagonsWeightBillDate: TDateTimeField
      FieldName = 'WeightBillDate'
    end
    object q_ReadyVagonsSpeed: TFloatField
      DisplayLabel = #1057#1082#1086#1088#1086#1089#1090#1100', '#1082#1084'/'#1095
      FieldName = 'Speed'
      DisplayFormat = '#.##'
    end
    object q_ReadyVagonsAxles: TWordField
      FieldName = 'Axles'
    end
    object q_ReadyVagonsUserComment: TStringField
      FieldName = 'UserComment'
      Size = 50
    end
    object q_ReadyVagonsStatus: TWordField
      FieldName = 'Status'
    end
    object q_ReadyVagonsVagonTypeName: TStringField
      DisplayLabel = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VagonTypeName'
      Size = 50
    end
    object q_ReadyVagonsProtoVagonID: TAutoIncField
      FieldName = 'ProtoVagonID'
      ReadOnly = True
    end
    object q_ReadyVagonsProtoID: TAutoIncField
      FieldName = 'ProtoID'
      ReadOnly = True
    end
    object q_ReadyVagonsPOD_NUM: TIntegerField
      DisplayLabel = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086#1076#1072#1095#1080
      FieldName = 'POD_NUM'
    end
  end
  object ds_ReadyTrains: TDataSource
    DataSet = q_ReadyTrains
    Left = 304
    Top = 48
  end
  object ds_ReadyVagons: TDataSource
    DataSet = q_ReadyVagons
    Left = 336
    Top = 248
  end
  object ehprReadyVagons: TPrintDBGridEh
    DBGridEh = gridReadyVagons
    Options = [pghFitGridToPageWidth, pghRowAutoStretch]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 3.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 168
    Top = 312
  end
  object q_ProtoTrains: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = q_ProtoTrainsBeforeOpen
    AfterScroll = q_ProtoTrainsAfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'select a.*,tt.TrainNumber as TareTrainNumber, rt.TrainNumber as ' +
        'TrainNumber,b.WayOfLoadingName,isnull(tt.TrainDate,rt.TrainDate)' +
        ' as TareTrainDate'
      
        'from ProtoTrains a left join TareTrains tt on a.TareTrainID=tt.T' +
        'rainID'
      'left join Trains rt on a.TrainID = rt.TrainID'
      'left join WaysOfLoading b on a.WayOfLoadingID=b.WayOfLoadingID'
      'where a.TO_ISU=0'
      'order by a.ProtoID desc')
    Left = 524
    Top = 104
    object q_ProtoTrainsProtoID: TAutoIncField
      DisplayLabel = #8470' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
      FieldName = 'ProtoID'
      ReadOnly = True
    end
    object q_ProtoTrainsTareTrainID: TIntegerField
      FieldName = 'TareTrainID'
    end
    object q_ProtoTrainsTrainID: TIntegerField
      FieldName = 'TrainID'
    end
    object q_ProtoTrainsTO_ISU: TBooleanField
      DisplayLabel = #1074' '#1048#1057#1059' ?'
      FieldName = 'TO_ISU'
    end
    object q_ProtoTrainsWayOfLoadingID: TIntegerField
      FieldName = 'WayOfLoadingID'
    end
    object q_ProtoTrainsTareTrainNumber: TStringField
      DisplayLabel = #1055#1086#1088#1086#1078#1085#1080#1081' '#1089#1086#1089#1090#1072#1074
      FieldName = 'TareTrainNumber'
      Size = 15
    end
    object q_ProtoTrainsTrainNumber: TStringField
      DisplayLabel = #1043#1088#1091#1078#1077#1085#1085#1099#1081' '#1089#1086#1089#1090#1072#1074
      FieldName = 'TrainNumber'
      Size = 15
    end
    object q_ProtoTrainsWayOfLoadingName: TStringField
      DisplayLabel = #1055#1091#1090#1100' '#1087#1086#1075#1088#1091#1079#1082#1080
      FieldName = 'WayOfLoadingName'
      Size = 50
    end
    object q_ProtoTrainsTareTrainDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080
      FieldName = 'TareTrainDate'
    end
  end
  object ds_ProtoTrains: TDataSource
    DataSet = q_ProtoTrains
    Left = 392
    Top = 40
  end
  object q_ProtoVagons: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = q_ProtoVagonsBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'select a.* from ProtoVagons a'
      'where a.ProtoID=1'
      'order by a.ID ')
    Left = 636
    Top = 320
    object q_ProtoVagonsID: TAutoIncField
      DisplayWidth = 7
      FieldName = 'ID'
      ReadOnly = True
    end
    object q_ProtoVagonsProtoID: TIntegerField
      DisplayLabel = #8470' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
      DisplayWidth = 11
      FieldName = 'ProtoID'
    end
    object q_ProtoVagonsVagonTypeName: TStringField
      DisplayLabel = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
      DisplayWidth = 3
      FieldName = 'VagonTypeName'
      Size = 3
    end
    object q_ProtoVagonsMPSID: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1074#1072#1075#1086#1085#1072
      DisplayWidth = 50
      FieldName = 'MPSID'
      Size = 50
    end
    object q_ProtoVagonsWeightNet: TIntegerField
      DisplayLabel = #1042#1077#1089' '#1085#1077#1090#1090#1086', '#1082#1075
      DisplayWidth = 10
      FieldName = 'WeightNet'
      DisplayFormat = '### ###'
    end
    object q_ProtoVagonsWeightGross: TIntegerField
      DisplayLabel = #1042#1077#1089' '#1073#1088#1091#1090#1090#1086', '#1082#1075
      DisplayWidth = 10
      FieldName = 'WeightGross'
      DisplayFormat = '### ###'
    end
    object q_ProtoVagonsWeightTare: TIntegerField
      DisplayLabel = #1058#1072#1088#1072', '#1082#1075
      DisplayWidth = 10
      FieldName = 'WeightTare'
      DisplayFormat = '### ###'
    end
    object q_ProtoVagonsTonnage: TIntegerField
      DisplayLabel = #1043#1088#1091#1079'-'#1090#1100', '#1082#1075
      DisplayWidth = 10
      FieldName = 'Tonnage'
      DisplayFormat = '### ###'
    end
    object q_ProtoVagonsordnung: TIntegerField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'ordnung'
    end
    object q_ProtoVagonsPOD_NUM: TIntegerField
      DisplayLabel = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086#1076#1072#1095#1080
      FieldName = 'POD_NUM'
    end
  end
  object ds_ProtoVagons: TDataSource
    DataSet = q_ProtoVagons
    Left = 464
    Top = 248
  end
  object ehprProtoVagons: TPrintDBGridEh
    DBGridEh = gridProtoVagons
    Options = [pghFitGridToPageWidth, pghRowAutoStretch]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 3.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 168
    Top = 376
  end
  object DBFConnection: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=PF'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 40
    Top = 152
  end
end
