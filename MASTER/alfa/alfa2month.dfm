object frmAlfaLoadRequest: TfrmAlfaLoadRequest
  Left = 250
  Top = 207
  Width = 898
  Height = 691
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1079#1072#1103#1074#1086#1082' '#1080#1079' '#1040#1083#1100#1092#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 890
    Height = 121
    Align = alTop
    TabOrder = 0
    object btnLoad: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Action = acLoadAlfaRequest
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 56
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 890
    Height = 536
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 888
      Height = 534
      Align = alClient
      AllowedOperations = []
      DataSource = dsAM
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object adoAlfaMonthIns: TADOQuery
    ConnectionString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf'
    Parameters = <
      item
        Name = 'm_y1'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'con_id1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'xconfirm1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'quantity1'
        DataType = ftFloat
        Value = Null
      end
      item
        Name = 'mon_d1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'mon_deliv1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'zp1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'zp_date1'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'telega1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 't_date1'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'head_q1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'fakt1'
        DataType = ftFloat
        Value = Null
      end
      item
        Name = 'res_id1'
        DataType = ftFloat
        Value = Null
      end
      item
        Name = 'jl_1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'repl_res1'
        DataType = ftFloat
        Value = Null
      end
      item
        Name = 'jl1_1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'dir_id1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'na1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'kind_id1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'action1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ROUT_NAME1'
        Size = -1
        Value = Null
      end
      item
        Name = 'contract1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'data1'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'buyer_id1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'buyer1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'expeditor1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'exped_name1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'otprav1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'otpr_name1'
        Size = -1
        Value = Null
      end
      item
        Name = 'polu1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'polu_name1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'inco1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'terms_rus1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'stan1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'point_name1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'uun1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ord_status1'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      
        'insert into alfamon (M_Y, CON_ID, XCONFIRM, QUANTITY, MON_D, MON' +
        '_DELIV, ZP, ZP_DATE, TELEGA, T_DATE, HEAD_Q, FAKT, RES_ID, JL, R' +
        'EPL_RES, JL1, DIR_ID, NA, KIND_ID, ACTION, ROUT_NAME, CONTRACT, ' +
        'DATA, BUYER_ID, BUYER, EXPEDITOR, EXPED_NAME, OTPRAV, otpr_name,' +
        'POLU, POLU_NAME, INCO, TERMS_RUS, STAN, POINT_NAME, UUN, ORD_STA' +
        'TUS)'
      
        'values (:M_Y1,:CON_ID1,:XCONFIRM1,:QUANTITY1,:MON_D1,:MON_DELIV1' +
        ',:ZP1,:ZP_DATE1,:TELEGA1,:T_DATE1,:HEAD_Q1,:FAKT1,:RES_ID1,:JL_1' +
        ',:REPL_RES1,:JL1_1,:DIR_ID1,:NA1,:KIND_ID1,:ACTION1,:ROUT_NAME1,' +
        ':CONTRACT1,:DATA1,:BUYER_ID1,:BUYER1,:EXPEDITOR1,:EXPED_NAME1,:O' +
        'TPRAV1,:otpr_name1,:POLU1,:POLU_NAME1,:INCO1,:TERMS_RUS1,:STAN1,' +
        ':POINT_NAME1,:UUN1,:ORD_STATUS1)')
    Left = 128
    Top = 8
  end
  object adoAlfaMonthUpd: TADOQuery
    ConnectionString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf'
    Parameters = <
      item
        Name = 'm_y1'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'xconfirm1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'quantity1'
        DataType = ftFloat
        Value = Null
      end
      item
        Name = 'mon_d1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'mon_deliv1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'zp1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'zp_date1'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'telega1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 't_date1'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'head_q1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'fakt1'
        DataType = ftFloat
        Value = Null
      end
      item
        Name = 'res_id1'
        DataType = ftFloat
        Value = Null
      end
      item
        Name = 'jl_1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'repl_res1'
        DataType = ftFloat
        Value = Null
      end
      item
        Name = 'jl1_1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'dir_id1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'na1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'kind_id1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'action1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ROUT_NAME1'
        Size = -1
        Value = Null
      end
      item
        Name = 'contract1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'data1'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'buyer_id1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'buyer1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'expeditor1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'exped_name1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'otprav1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'otpr_name1'
        Size = -1
        Value = Null
      end
      item
        Name = 'polu1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'polu_name1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'inco1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'terms_rus1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'stan1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'point_name1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'uun1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ord_status1'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'con_id1'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'update alfamon set'
      'M_Y=:M_Y1,'
      'XCONFIRM=:XCONFIRM1,'
      'QUANTITY=:QUANTITY1,'
      'MON_D=:MON_D1,'
      'MON_DELIV=:MON_DELIV1,'
      'ZP=:ZP1,'
      'ZP_DATE=:ZP_DATE1,'
      'TELEGA=:TELEGA1,'
      'T_DATE=:T_DATE1,'
      'HEAD_Q=:HEAD_Q1,'
      'FAKT=:FAKT1,'
      'RES_ID=:RES_ID1,'
      'JL=:JL_1,'
      'REPL_RES=:REPL_RES1,'
      'JL1=:JL1_1,'
      'DIR_ID=:DIR_ID1,'
      'NA=:NA1,'
      'KIND_ID=:KIND_ID1,'
      'ACTION=:ACTION1,'
      'ROUT_NAME=:ROUT_NAME1,'
      'CONTRACT=:CONTRACT1,'
      'DATA=:DATA1,'
      'BUYER_ID=:BUYER_ID1,'
      'BUYER=:BUYER1,'
      'EXPEDITOR=:EXPEDITOR1,'
      'EXPED_NAME=:EXPED_NAME1,'
      'OTPRAV=:OTPRAV1,'
      'otpr_name=:otpr_name1,'
      'POLU=:POLU1,'
      'POLU_NAME=:POLU_NAME1,'
      'INCO=:INCO1,'
      'TERMS_RUS=:TERMS_RUS1,'
      'STAN=:STAN1,'
      'POINT_NAME=:POINT_NAME1,'
      'UUN=:UUN1,'
      'ORD_STATUS=:ORD_STATUS1'
      'where CON_ID=:CON_ID1')
    Left = 128
    Top = 56
  end
  object ActionManager1: TActionManager
    Left = 216
    Top = 8
    StyleName = 'XP Style'
    object acLoadAlfaRequest: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      OnExecute = acLoadAlfaRequestExecute
    end
  end
  object IdSMTP: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Host = '172.18.14.8'
    Port = 25
    AuthenticationType = atNone
    Left = 294
    Top = 8
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CharSet = 'windows-1251'
    CCList = <>
    ContentType = 'text/plain'
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Subject = #1072#1087#1088
    Left = 294
    Top = 54
  end
  object adoAM: TADODataSet
    Active = True
    ConnectionString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf'
    CursorType = ctStatic
    CommandText = 'select * from alfamon'
    Parameters = <>
    Left = 48
    Top = 176
  end
  object dsAM: TDataSource
    DataSet = adoAM
    Left = 112
    Top = 176
  end
end
