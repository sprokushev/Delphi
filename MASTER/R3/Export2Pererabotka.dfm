object f_Export2Pererabotka: Tf_Export2Pererabotka
  Left = 393
  Top = 324
  Width = 887
  Height = 640
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1058#1058#1053' '#1074' '#1048#1057#1059' '#1055#1077#1088#1077#1088#1072#1073#1086#1090#1082#1072
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
    Top = 153
    Width = 871
    Height = 430
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = dsSource
    EvenRowColor = clInfoBk
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    IndicatorOptions = [gioShowRowIndicatorEh]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    RowDetailPanel.Color = clBtnFace
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = DBGridEh1GetCellParams
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 871
    Height = 54
    ActionManager = amR3
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = clWhite
    Spacing = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 54
    Width = 871
    Height = 99
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 6
      Top = 2
      Width = 163
      Height = 88
      Caption = #1044#1072#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 26
        Width = 6
        Height = 13
        Caption = #1089
      end
      object Label2: TLabel
        Left = 5
        Top = 52
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object edBegin: TDBDateTimeEditEh
        Left = 33
        Top = 22
        Width = 120
        Height = 21
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 0
        Visible = True
      end
      object edEnd: TDBDateTimeEditEh
        Left = 33
        Top = 48
        Width = 120
        Height = 21
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 1
        Visible = True
      end
    end
    object rgNapr_post: TRadioGroup
      Left = 176
      Top = 2
      Width = 129
      Height = 88
      Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ItemIndex = 0
      Items.Strings = (
        #1042#1089#1077' '#1086#1090#1075#1088#1091#1079#1082#1080
        #1055#1086' '#1056#1086#1089#1089#1080#1080
        #1069#1082#1089#1087#1086#1088#1090)
      TabOrder = 1
    end
    object GroupBox2: TGroupBox
      Left = 312
      Top = 2
      Width = 545
      Height = 89
      Caption = #1059#1089#1083#1086#1074#1080#1103
      TabOrder = 2
      object Label3: TLabel
        Left = 5
        Top = 18
        Width = 70
        Height = 13
        Caption = #1058#1080#1087' '#1074#1099#1075#1088#1091#1079#1082#1080
      end
      object Label5: TLabel
        Left = 5
        Top = 42
        Width = 67
        Height = 13
        Caption = #8470' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
      end
      object Label4: TLabel
        Left = 5
        Top = 66
        Width = 78
        Height = 13
        Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072' R3'
      end
      object Label6: TLabel
        Left = 308
        Top = 66
        Width = 37
        Height = 13
        Caption = #1044#1088#1091#1075#1086#1077
      end
      object Label7: TLabel
        Left = 261
        Top = 42
        Width = 82
        Height = 13
        Caption = #1044#1072#1090#1072' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
      end
      object edNumDog: TEdit
        Left = 122
        Top = 62
        Width = 120
        Height = 21
        MaxLength = 13
        TabOrder = 5
      end
      object edNum_kvit: TEdit
        Left = 122
        Top = 38
        Width = 120
        Height = 21
        TabOrder = 3
      end
      object cbUpload: TComboBox
        Left = 122
        Top = 14
        Width = 414
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = '1.'#1042#1099#1075#1088#1091#1079#1082#1072' '#1058#1058#1053
        OnChange = cbUploadChange
        Items.Strings = (
          '1.'#1054#1090#1075#1088#1091#1079#1082#1072' ('#1085#1086#1074#1072#1103')'
          '2.'#1042#1099#1075#1088#1091#1079#1082#1072' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1086#1082
          '3.'#1042#1099#1075#1088#1091#1079#1082#1072' '#1054#1041#1056
          '4.'#1054#1090#1075#1088#1091#1079#1082#1072'('#1074#1099#1075#1088#1091#1078#1077#1085#1085#1072#1103' '#1074' SAP)'
          '5.'#1047#1072#1075#1088#1091#1079#1082#1072' '#1075#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1077#1081' '#1074' SAP'
          '6.'#1042#1099#1075#1088#1091#1079#1082#1072' '#1057#1060' '#1056#1046#1044
          '7. '#1047#1072#1103#1074#1082#1080' '#1057#1053#1055' '#1076#1083#1103' '#1048#1057#1059' '#1055#1086#1089#1090#1072#1074#1082#1080)
      end
      object btnDog: TButton
        Left = 96
        Top = 62
        Width = 21
        Height = 21
        Caption = '='
        TabOrder = 0
        OnClick = btnDogClick
      end
      object btnKvit: TButton
        Left = 96
        Top = 38
        Width = 21
        Height = 21
        Caption = '='
        TabOrder = 1
        OnClick = btnKvitClick
      end
      object edOtherCondition: TEdit
        Left = 356
        Top = 62
        Width = 179
        Height = 21
        TabOrder = 6
      end
      object edDate_kvit: TDBDateTimeEditEh
        Left = 356
        Top = 38
        Width = 120
        Height = 21
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 4
        Visible = True
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 583
    Width = 871
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 300
      end>
  end
  object MemoSQL: TMemo
    Left = 152
    Top = 168
    Width = 577
    Height = 385
    TabOrder = 4
    Visible = False
  end
  object qTTN: TOracleDataSet
    SQL.Strings = (
      '/* '#1042#1099#1075#1088#1091#1079#1082#1072' '#1058#1058#1053' */'
      'SELECT'
      '  rownum as row_num,'
      '  kv.*'
      'FROM'
      '('
      'SELECT /*+ RULE */'
      '  '#39'2300_'#39'||to_char(ttn_id) as ttn_id, -- '#1050#1086#1076' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      '  to_char(CASE'
      
        '      WHEN main_dog.id IS NULL OR main_dog.id=kls_dog.id THEN us' +
        'l_dog.ISU_KOD_DOG'
      #9'  ELSE main_u_dog.ISU_KOD_DOG'
      
        #9'END) as ISU_KOD_DOG,  -- '#1050#1086#1076' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1048#1057#1059' '#1055#1077#1088#1077#1088#1072#1073#1086#1090#1082#1072'. '#1055#1088#1080' '#1072#1075#1077#1085 +
        #1090#1089#1082#1086#1081' '#1089#1093#1077#1084#1077' '#1082#1086#1076' '#1072#1075#1077#1085#1090#1089#1082#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1072
      '  to_char(CASE'
      
        '      WHEN main_dog.id IS NULL OR main_dog.id=kls_dog.id THEN NU' +
        'LL'
      #9'  ELSE usl_dog.ISU_KOD_DOG'
      
        #9'END) as ISU_KOD_DOG_2,  -- '#1055#1088#1080' '#1072#1075#1077#1085#1090#1089#1082#1086#1081' '#1089#1093#1077#1084#1077' '#1089#1090#1072#1074#1080#1090#1089#1103' '#1085#1086#1084#1077#1088' '#1076 +
        #1086#1075#1086#1074#1086#1088#1072' '#1084#1077#1078#1076#1091' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1086#1084' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072' '#1080' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1077#1084
      #9'kls_load_type.ISU_KOD as VID_TR, -- '#1074#1080#1076' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088#1086#1074#1082#1080
      
        #9'lpad(to_char(kvit.NUM_KVIT),6,'#39'0'#39') as NUM_KVIT, --'#1053#1086#1084#1077#1088' '#1090#1086#1074#1072#1088#1085#1086 +
        '-'#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      
        #9'TO_CHAR(kvit.DATE_KVIT,'#39'YYYYMMDD'#39') as DATE_OTGR, -- '#1044#1072#1090#1072' '#1086#1090#1075#1088#1091#1079 +
        #1082#1080
      #9'(CASE'
      #9#9' WHEN KLS_LOAD_TYPE.ISU_KOD=2 THEN'
      #9#9' '#9'  CASE '
      #9#9#9'  '#9'   WHEN KLS_PROD.ID_GROUP_NPR='#39'13000'#39' THEN '#39'0105'#39
      #9#9#9#9'   ELSE '#39'0314'#39
      #9#9#9'  END'
      #9#9' WHEN KLS_LOAD_TYPE.ISU_KOD=1 THEN'
      #9#9' '#9'  CASE '
      #9#9#9'  '#9'   WHEN KLS_PROD.ID_GROUP_NPR='#39'13000'#39' THEN '#39'0105'#39
      #9#9#9#9'   WHEN KLS_PROD.ID_GROUP_NPR='#39'24000'#39' THEN '#39'0200'#39
      #9#9#9#9'   ELSE '#39'1010'#39
      #9#9#9'  END'#9'   '#9'  '#9'    '
      #9'END) AS SKLAD_NEW, -- '#1052#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080' ('#1089#1082#1083#1072#1076')'
      
        #9'TO_CHAR(poluch.KSSS_PREDPR_ID) as poluch_ksss, -- '#1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077 +
        #1083#1100
      
        #9'TO_CHAR(grotp.KSSS_PREDPR_ID) as grotp_ksss, -- '#1043#1088#1091#1079#1086#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083 +
        #1100
      
        #9'TO_CHAR(potreb.KSSS_PREDPR_ID) as potreb_ksss, -- '#1043#1088#1091#1079#1086#1087#1086#1090#1088#1077#1073#1080#1090 +
        #1077#1083#1100
      
        #9'(CASE WHEN kls_load_type.id in (1,6) THEN LPAD(TO_CHAR(stan.STA' +
        'N_KOD),6,'#39'0'#39') ELSE '#39#39' END) as STAN_KOD, --'#1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      
        #9'(CASE WHEN kls_load_type.id in (1,6) THEN LPAD(TO_CHAR(stan_otp' +
        '.STAN_KOD),6,'#39'0'#39') ELSE '#39#39' END) as STAN_OTP_KOD, --'#1057#1090#1072#1085#1094#1080#1103' '#1086#1090#1087#1088#1072#1074 +
        #1083#1077#1085#1080#1103
      #9'kvit.NUM_CIST, --'#1053#1086#1084#1077#1088' '#1074#1072#1075#1086#1085#1072
      #9'TO_NUMBER(CASE'
      
        #9'            WHEN MONTH.LOAD_ABBR IN ('#39#1057#1040#1052#39','#39#1056#1045#1047#39','#39#1058#1056#1059#39') THEN NU' +
        'LL'
      '                WHEN KLS_VAGOWNER.VAGOWN_TYP_ID=0 THEN 1'
      '                WHEN KLS_VAGOWNER.OWNER_ID IN (2,33) THEN 2'
      '                ELSE 3'
      '              END) AS vagowner_type, --'#1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100' '#1074#1072#1075#1086#1085#1072
      #9#39#39' as TANKER, -- '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1091#1076#1085#1072#9'--kls_tex_pd.PLATTARIF_ID,'
      #9'(CASE'
      #9'   WHEN kls_tex_pd.PLATTARIF_ID=8 THEN'#9'kvit.TARIF'
      #9'   ELSE 0'
      #9' END) as TARIF, -- '#1055#1088#1086#1074#1086#1079#1085#1072#1103' '#1087#1083#1072#1090#1072
      #9'(CASE'
      #9'   WHEN kvit.TARIF19>0 THEN kvit.TARIF19-kvit.TARIF'
      #9'   ELSE 0'
      
        #9' END) as DOPTARIF, -- '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1072#1088#1080#1092' ('#1088#1072#1079#1085#1080#1094#1072' '#1084#1077#1078#1076#1091' '#1089#1093#1077#1084#1072 +
        #1084#1080')'
      #9'(CASE'
      #9'   WHEN kls_tex_pd.PLATTARIF_ID=8 THEN kvit.TARIF_GUARD'
      #9'   ELSE 0'
      #9' END) as TARIF_GUARD, --'#1054#1093#1088#1072#1085#1072
      #9'kvit.id as kvit_id, --'#1050#1086#1076' '#1089#1090#1088#1086#1082#1080' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      #9'kls_prod.KSSS_PROD_ID as prod_ksss, --'#1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
      #9'kvit.VES_BRUTTO as VES, --'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      #9#39#1058' '#39' as ED_IZM, --'#1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      #9'kvit.KOL_ED as KOL_ED_FAS, -- '#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1077#1076'-'#1094
      #9#39#1064#1058#39' as ED_IZM_FAS, --'#1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      #9'1 as ACTION, --'#1050#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103
      #9'(CASE'
      #9'   WHEN kls_tex_pd.PLATTARIF_ID=8 THEN ROUND(kvit.TARIF*0.18,2)'
      #9'   ELSE 0'
      #9' END) as TARIF_NDS_RASCH, --'#1053#1044#1057' '#1087#1088#1086#1074#1086#1079#1085#1086#1081' '#1087#1083#1072#1090#1099
      #9'(CASE'
      
        #9'   WHEN kls_tex_pd.PLATTARIF_ID=8 THEN ROUND(kvit.TARIF_GUARD*0' +
        '.18,2) '
      #9'   ELSE 0'
      #9' END) as TARIF_GUARD_NDS_RASCH, -- '#1053#1044#1057' '#1086#1093#1088#1072#1085#1099
      
        #9'TO_CHAR(kvit.DATE_KVIT,'#39'YYYYMMDD'#39') as DATE_KVIT, --'#1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085 +
        #1090#1072
      #9'kls_vagontype.ISU_KOD as VAGON_TYPE, --'#1058#1080#1087' '#1074#1072#1075#1086#1085#1072
      #9#39#39' as REESTR, --'#1053#1086#1084#1077#1088' '#1088#1077#1077#1089#1090#1088#1072
      #9'(CASE'
      
        #9'   WHEN kls_dog_main.IS_AGENT=1 and  kvit.DATE_KVIT<to_date('#39'01' +
        '.01.2007'#39','#39'dd.mm.yyyy'#39') THEN '#39'9999'#39
      
        '     WHEN kls_dog.IS_AGENT=1 and kvit.DATE_KVIT>=to_date('#39'01.01.' +
        '2007'#39','#39'dd.mm.yyyy'#39') THEN '#39'9990'#39
      #9'   WHEN month.nazn_otg_id=8 THEN '#39'0065'#39
      #9'   ELSE '#39'0061'#39
      #9' END) as VID_PER, -- '#1042#1080#1076' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
      #9' kvit.NUM_DOVER, -- '#1053#1086#1084#1077#1088' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
      
        #9' TO_CHAR(kvit.DATE_DOVER,'#39'YYYYMMDD'#39') as DATE_DOVER, -- '#1044#1072#1090#1072' '#1076#1086#1074 +
        #1077#1088#1077#1085#1085#1086#1089#1090#1080
      #9' kvit.FIO_DRIVER, --'#1060#1072#1084#1080#1083#1080#1103' '#1074#1086#1076#1080#1090#1077#1083#1103
      #9' NULL as FIELD_36,'
      #9' NULL as FIELD_37,'
      
        #9' (CASE WHEN kvit.DATE_KVIT<to_date('#39'01.01.2007'#39','#39'dd.mm.yyyy'#39') T' +
        'HEN CASE WHEN month.IS_EXP+0=1 THEN '#39'01'#39' ELSE '#39'02'#39' END'
      
        #9' '#9'   WHEN kvit.DATE_KVIT>=to_date('#39'01.01.2007'#39','#39'dd.mm.yyyy'#39') TH' +
        'EN CASE WHEN month.IS_EXP+0=1 THEN '#39'08'#39' ELSE '#39'02'#39' END'
      #9'  END)as KOD_NAPR,'
      #9' NULL as FIELD_39,'
      #9' NULL as FIELD_40,'
      #9' NULL as FIELD_41,'
      #9' NULL as FIELD_42,'
      #9' NULL as FIELD_43,'
      #9' NULL as FIELD_44,'
      #9' NULL as FIELD_45,'
      #9' NULL as FIELD_46,'
      #9' NULL as FIELD_47,'
      #9' NULL as FIELD_48,'
      #9' NULL as FIELD_49,'
      #9' NULL as FIELD_50,'
      #9' NULL as FIELD_51,'
      #9' NULL as FIELD_52,'
      #9' NULL as FIELD_53,'
      #9' NULL as FIELD_54,'
      #9' '#39#1050#39' as IS_POTREB_KSSS, -- '#1055#1088#1080#1079#1085#1072#1082' '#1082#1086#1076#1080#1088#1086#1074#1082#1080' '#1075#1088#1091#1079#1086#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1103
      #9' null as FIELD_56,'
      
        #9' TO_CHAR(kvit.DATE_KVIT,'#39'MMDD'#39')||'#39'/'#39'||SUBSTR(kvit.NOM_ZD,6,5) a' +
        's RAZNAR,'
      #9' 1 as RAZNAR_P,'
      #9' kvit.GTD,'
      #9' NULL as FIELD_60,'
      
        #9' to_char(kls_pasp.PASP_DATE,'#39'ddmmyy'#39')||'#39'_'#39'||trim(kls_pasp.PASP_' +
        'NUM)||'#39'_'#39'||trim(kls_prod.KSSS_PROD_ID) as CQ_NUM,--N '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072 +
        ' '#1082#1072#1095#1077#1089#1090#1074#1072','
      #9' KVIT.VES_BRUTTO*1000,'
      #9' (CASE'
      #9'   WHEN month.IS_EXP+0=1 THEN vagowner.KSSS_PREDPR_ID'
      #9'   ELSE null'
      #9' END)as KSSS_VAGOWNER,'
      
        #9' exped.KSSS_PREDPR_ID as KSSS_EXPED,NVL(to_char(kls_shabexp.ins' +
        'num),'#39'-'#39') as INS_NUM,NVL(to_char(kls_shabexp.insdat,'#39'yyyymmdd'#39'),' +
        #39'-'#39') as INS_DAT, '#39'-'#39' as telegram'
      
        'FROM kvit,month,kls_dog_main,usl_dog,kls_dog,usl_dog main_u_dog,' +
        'kls_dog main_dog,'
      '   kls_vid_otgr,kls_load_type,kls_stan stan,kls_stan stan_otp,'
      
        #9' kls_predpr poluch, kls_predpr grotp, kls_predpr potreb,kls_pre' +
        'dpr vagowner,kls_predpr exped,'
      #9' kls_vagowner,kls_vagowner_types,kls_prod,'
      
        #9' kls_vagontype,kls_pasp,kls_shabexp,r3_vbak,r3_kvit2sap,kls_tex' +
        '_pd'
      
        'WHERE kvit.date_kvit BETWEEN TO_DATE(:beg_date,'#39'dd.mm.yyyy'#39') AND' +
        ' TO_DATE(:end_date,'#39'dd.mm.yyyy'#39')'
      '  AND kvit.FLG_OPERDATA=0 -- '#1088#1072#1089#1082#1088#1077#1076#1080#1090#1086#1074#1072#1085#1085#1099#1077
      '  AND kvit.nom_zd=month.nom_zd'
      '  AND kvit.PASP_ID=kls_pasp.ID(+)'
      '  AND kvit.DATE_KVIT=r3_vbak.VBAK_VDATU(+)'
      '  AND kvit.nom_zd=r3_vbak.NOM_ZD(+)'
      '  AND kvit.ID=r3_kvit2sap.KVIT_ID(+)'
      '  AND month.dog_id=usl_dog.dog_id'
      '  AND month.usl_number=usl_dog.usl_number'
      
        '  AND month.dog_id=kls_dog.id AND kvit.shabexp_id=kls_shabexp.id' +
        '(+)'
      
        '  AND DECODE(month.is_exp,1,4,kls_dog.IS_AGENT)=kls_dog_main.IS_' +
        'AGENT -- '#1055#1088#1080' '#1086#1090#1075#1088#1091#1079#1082#1077' '#1085#1072' '#1101#1082#1089#1087#1086#1088#1090' '#1080#1097#1077#1084' '#1076#1086#1075#1086#1074#1086#1088' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1051#1059#1050#1054#1049#1051#1091
      
        '  AND kvit.DATE_KVIT BETWEEN kls_dog_main.FROM_DATE AND kls_dog_' +
        'main.TO_DATE'
      '  AND kls_dog_main.u_dog_id=main_u_dog.id(+)'
      '  AND main_u_dog.dog_id=main_dog.id(+)'
      '  AND month.LOAD_ABBR=kls_vid_otgr.load_abbr'
      '  AND kls_vid_otgr.LOAD_TYPE_ID=kls_load_type.id'
      '  AND month.stan_id=stan.id(+)'
      '  AND month.stanotp_id=stan_otp.id(+)'
      '  AND month.poluch_id=poluch.id(+)'
      '  AND month.potreb_id=potreb.id(+)'
      '  AND month.grotp_id=grotp.id(+)'
      '  AND kvit.vagowner_id=kls_vagowner.id(+)'
      '  AND kls_vagowner.VAGOWN_TYP_ID=kls_vagowner_types.id(+)'
      '  AND kls_vagowner.PREDPR_ID=vagowner.id(+)'
      '  AND kvit.EXPED_ID=exped.ID(+)'
      '  AND kvit.PROD_ID_NPR=kls_prod.ID_NPR(+)'
      '  AND kvit.VAGONTYPE_ID=kls_vagontype.id(+)'
      '  AND month.tex_pd_id=kls_tex_pd.id'
      '  AND month.grotp_id=kls_tex_pd.grotp_id'
      '  AND NOT KVIT.IS_LOADED IN (8,9)'
      'ORDER BY isu_kod_dog,kvit.date_kvit,kvit.num_kvit,kvit.id'
      ') kv'
      
        'where isu_kod_dog like '#39'A%'#39'--'#1091#1073#1080#1088#1072#1077#1084' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1085#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1085#1091#1078 +
        #1076#1099
      '--AND 1=1'
      '--AND 1=1'
      '--AND 1=1'
      '--AND 1=1'
      '--AND 1=1')
    Variables.Data = {
      0300000002000000090000003A4245475F444154450500000000000000000000
      00090000003A454E445F44415445050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000003700000007000000524F575F4E554D0100000000000600000054544E
      5F49440100000000000B0000004953555F4B4F445F444F470100000000000D00
      00004953555F4B4F445F444F475F32010000000000060000005649445F545201
      0000000000080000004E554D5F4B56495401000000000009000000444154455F
      4F54475201000000000005000000534B4C41440100000000000B000000504F4C
      5543485F4B5353530100000000000A00000047524F54505F4B53535301000000
      00000B000000504F545245425F4B535353010000000000080000005354414E5F
      4B4F440100000000000C0000005354414E5F4F54505F4B4F4401000000000008
      0000004E554D5F434953540100000000000D0000005641474F574E45525F5459
      50450100000000000600000054414E4B45520100000000000500000054415249
      4601000000000008000000444F5054415249460100000000000B000000544152
      49465F4755415244010000000000070000004B5649545F494401000000000009
      00000050524F445F4B5353530100000000000300000056455301000000000006
      00000045445F495A4D0100000000000A0000004B4F4C5F45445F464153010000
      0000000A00000045445F495A4D5F46415301000000000006000000414354494F
      4E0100000000000900000054415249465F4E44530100000000000F0000005441
      5249465F47554152445F4E445301000000000009000000444154455F4B564954
      0100000000000A0000005641474F4E5F54595045010000000000060000005245
      45535452010000000000070000005649445F504552010000000000090000004E
      554D5F444F5645520100000000000A000000444154455F444F56455201000000
      00000A00000046494F5F445249564552010000000000080000004649454C445F
      3336010000000000080000004649454C445F3337010000000000080000004649
      454C445F3338010000000000080000004649454C445F33390100000000000800
      00004649454C445F3430010000000000080000004649454C445F343101000000
      0000080000004649454C445F3432010000000000080000004649454C445F3433
      010000000000080000004649454C445F3434010000000000080000004649454C
      445F3435010000000000080000004649454C445F343601000000000008000000
      4649454C445F3437010000000000080000004649454C445F3438010000000000
      080000004649454C445F3439010000000000080000004649454C445F35300100
      00000000080000004649454C445F3531010000000000080000004649454C445F
      3532010000000000080000004649454C445F3533010000000000080000004649
      454C445F35340100000000000E00000049535F504F545245425F4B5353530100
      00000000}
    Session = f_main.ora_Session
    Left = 832
    Top = 168
  end
  object dsSource: TDataSource
    DataSet = qTTN
    Left = 768
    Top = 168
  end
  object SaveDialog: TSaveDialog
    Filter = 
      'Text files (*.txt)|*.TXT|Comma separated values (*.csv)|*.CSV|HT' +
      'ML file (*.htm)|*.HTM|Rich Text Format (*.rtf)|*.RTF|Microsoft E' +
      'xcel Workbook (*.xls)|*.XLS'
    FilterIndex = 2
    Left = 165
    Top = 290
  end
  object pkgFOR_R3: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_R3'
    Left = 90
    Top = 290
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    Connected = True
    Left = 89
    Top = 348
  end
  object OpenDlg: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' Excel|*.xls'
    InitialDir = 'C:\'
    Left = 238
    Top = 290
  end
  object adoDogovor: TADOTable
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=ISU_PERERABOTKA_CSV'
    CursorType = ctStatic
    TableName = 'dog_load.csv'
    Left = 360
    Top = 290
    object adoDogovorF1: TStringField
      FieldName = 'F1'
      Size = 255
    end
    object adoDogovorF2: TStringField
      FieldName = 'F2'
      Size = 255
    end
  end
  object qUpdateDogovor: TOracleQuery
    SQL.Strings = (
      'update kls_dog'
      'set isu_kod_dog=:ISU_KOD'
      'where trim(dog_number)=trim(:KOD_DOG)')
    Session = ora_Session
    Variables.Data = {
      0300000002000000080000003A4953555F4B4F44050000000000000000000000
      080000003A4B4F445F444F47050000000000000000000000}
    Left = 768
    Top = 288
  end
  object qSetBusyStatus: TOracleQuery
    SQL.Strings = (
      'update kvit'
      'set is_loaded=8'
      'where kvit.id in ('
      'SELECT /*+ RULE */'
      ' '#9' kvit.id --'#1053#1086#1084#1077#1088' '#1090#1086#1074#1072#1088#1085#1086'-'#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      
        'FROM kvit,month,kls_dog_main,usl_dog,kls_dog,usl_dog main_u_dog,' +
        'kls_dog main_dog,'
      '     kls_vid_otgr,kls_load_type,kls_stan stan,kls_stan stan_otp,'
      #9' kls_predpr poluch, kls_predpr grotp, kls_predpr potreb,'
      #9' kls_vagowner,kls_vagowner_types,kls_prod,'
      #9' kls_vagontype'
      
        'WHERE kvit.date_kvit BETWEEN TO_DATE(:beg_date,'#39'dd.mm.yyyy'#39') AND' +
        ' TO_DATE(:end_date,'#39'dd.mm.yyyy'#39')'
      '  AND kvit.FLG_OPERDATA=0 -- '#1088#1072#1089#1082#1088#1077#1076#1080#1090#1086#1074#1072#1085#1085#1099#1077
      '  AND kvit.nom_zd=month.nom_zd'
      '  AND month.dog_id=usl_dog.dog_id'
      '  AND month.usl_number=usl_dog.usl_number'
      '  AND month.dog_id=kls_dog.id'
      
        '  AND DECODE(month.is_exp,1,4,kls_dog.IS_AGENT)=kls_dog_main.IS_' +
        'AGENT -- '#1055#1088#1080' '#1086#1090#1075#1088#1091#1079#1082#1077' '#1085#1072' '#1101#1082#1089#1087#1086#1088#1090' '#1080#1097#1077#1084' '#1076#1086#1075#1086#1074#1086#1088' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1051#1059#1050#1054#1049#1051#1091
      
        '  AND kvit.DATE_KVIT BETWEEN kls_dog_main.FROM_DATE AND kls_dog_' +
        'main.TO_DATE'
      '  AND kls_dog_main.u_dog_id=main_u_dog.id(+)'
      '  AND main_u_dog.dog_id=main_dog.id(+)'
      '  AND month.LOAD_ABBR=kls_vid_otgr.load_abbr'
      '  AND kls_vid_otgr.LOAD_TYPE_ID=kls_load_type.id'
      '  AND month.stan_id=stan.id(+)'
      '  AND month.stanotp_id=stan_otp.id(+)'
      '  AND month.poluch_id=poluch.id(+)'
      '  AND month.potreb_id=potreb.id(+)'
      '  AND month.grotp_id=grotp.id(+)'
      '  AND kvit.vagowner_id=kls_vagowner.id(+)'
      '  AND kls_vagowner.VAGOWN_TYP_ID=kls_vagowner_types.id(+)'
      '  AND kvit.PROD_ID_NPR=kls_prod.ID_NPR(+)'
      '  AND kvit.VAGONTYPE_ID=kls_vagontype.id(+)'
      '  AND NOT KVIT.IS_LOADED IN (8,9)'
      '--  AND month.is_exp+0=1'
      ')'
      'and 1=1')
    Session = ora_Session
    Variables.Data = {
      0300000002000000090000003A4245475F444154450500000000000000000000
      00090000003A454E445F44415445050000000000000000000000}
    Left = 768
    Top = 224
  end
  object qPlan: TOracleDataSet
    SQL.Strings = (
      '-- '#1054#1089#1085#1086#1074#1085#1086#1081' '#1087#1083#1072#1085
      'select'
      '   rownum,'
      '   pl.*'
      'from'
      '('
      'select'
      '  (case'
      
        '  '#9'   when dogovor.maindog_id=3223 then '#39'A200613503000'#39'--'#1048#1089#1087#1088#1072#1074#1080 +
        #1090#1100' '#1087#1086#1076' '#1076#1086#1075#1086#1074#1086#1088' '#1082#1086#1084#1080#1089#1089#1080#1080
      #9'   else dogovor.isu_kod_dog'
      '   end) as isu_kod_dog,'
      
        '--  dogovor.isu_kod_dog,   -- '#1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072'  ('#1043#1076#1077' '#1082#1086#1076#1072' '#1076#1086#1075#1086#1074#1086#1088#1086 +
        #1074' '#1074' '#1082#1086#1076#1080#1088#1086#1074#1082#1077' '#1048#1057#1059' '#1055#1077#1088#1077#1088#1072#1073#1086#1090#1082#1072')'
      
        '  0 as DOC_KOD,                    -- '#1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' (0 - '#1055#1077#1088#1077#1076#1072#1102 +
        #1090#1089#1103' '#1076#1072#1085#1085#1099#1077' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1086#1082')'
      '  '#39#39' as OBR_NUM,                 -- '#1053#1086#1084#1077#1088' '#1054#1041#1056' '#1080#1083#1080' '#1091#1082#1072#1079#1072#1085#1080#1103
      '  '#39#39' as OBR_DATE,                 -- '#1044#1072#1090#1072' '#1054#1041#1056' '#1080#1083#1080' '#1091#1082#1072#1079#1072#1085#1080#1103
      
        '  TO_CHAR(plan_per.date_plan,'#39'YYYYMMDD'#39') as date_plan,   -- '#1044#1072#1090#1072 +
        ' '#1086#1090#1075#1088#1091#1079#1082#1080' (?)'
      '  oil_prod.ksss_prod_id,  -- '#1052#1072#1090#1077#1088#1080#1072#1083
      '  SUM(plan_post.plan_ves) as ves,     -- '#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      '  '#39'TO'#39' as ED_IZM,                    -- '#1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      '  1 as ACTION,                      -- '#1050#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103
      '  (case'
      '     when plan_pos.kod_sgr=21 then 8'
      '     else 2'
      '   end)  kod_napr,       -- '#1050#1086#1076' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
      '  '#39'2300'#39' as sbyt_org                     -- '#1089#1073#1099#1090#1086#1074#1072#1103' '#1086#1088#1075#1072#1085#1080#1103
      'from'
      '  plan_post plan_post'
      '  join'
      '  kls_prod oil_prod on plan_post.prod_id_npr=oil_prod.id_npr'
      '  join'
      '  kls_dog dogovor on plan_post.dog_id=dogovor.id'
      '  join'
      '  kls_planstru plan_pos on plan_post.planstru_id=plan_pos.id'
      '  join'
      '  plan_periods plan_per on plan_post.plan_per_id=plan_per.id'
      'where plan_post.plan_id=2 -- '#1084#1086#1089#1082#1086#1074#1089#1082#1080#1081' '#1087#1083#1072#1085
      
        '  and plan_per.date_plan between to_date(:beg_date,'#39'dd.mm.yyyy'#39')' +
        ' and to_date(:end_date,'#39'dd.mm.yyyy'#39')'
      '  and dogovor.isu_kod_dog like '#39'A%'#39
      'GROUP BY'
      '    (case'
      
        '  '#9'   when dogovor.maindog_id=3223 then '#39'A200613503000'#39'--'#1048#1089#1087#1088#1072#1074#1080 +
        #1090#1100' '#1087#1086#1076' '#1076#1086#1075#1086#1074#1086#1088' '#1082#1086#1084#1080#1089#1089#1080#1080
      #9'   else dogovor.isu_kod_dog'
      '   end),'
      
        '   --dogovor.isu_kod_dog,   -- '#1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072'  ('#1043#1076#1077' '#1082#1086#1076#1072' '#1076#1086#1075#1086#1074#1086#1088 +
        #1086#1074' '#1074' '#1082#1086#1076#1080#1088#1086#1074#1082#1077' '#1048#1057#1059' '#1055#1077#1088#1077#1088#1072#1073#1086#1090#1082#1072')'
      '  TO_CHAR(plan_per.date_plan,'#39'YYYYMMDD'#39'),   -- '#1044#1072#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080' (?)'
      '  oil_prod.ksss_prod_id,  -- '#1052#1072#1090#1077#1088#1080#1072#1083
      '  (case'
      '     when plan_pos.kod_sgr=21 then 8'
      '     else 2'
      '   end)'
      'HAVING SUM(plan_post.plan_ves)<>0'
      
        'ORDER BY "ISU_KOD_DOG","DOC_KOD","DATE_PLAN","OBR_DATE" NULLS FI' +
        'RST'
      ') pl where isu_kod_dog like '#39'A%'#39
      '--AND 1=1'
      '--AND 1=1')
    Variables.Data = {
      0300000002000000090000003A4245475F444154450500000000000000000000
      00090000003A454E445F44415445050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000003700000007000000524F575F4E554D0100000000000600000054544E
      5F49440100000000000B0000004953555F4B4F445F444F470100000000000D00
      00004953555F4B4F445F444F475F32010000000000060000005649445F545201
      0000000000080000004E554D5F4B56495401000000000009000000444154455F
      4F54475201000000000005000000534B4C41440100000000000B000000504F4C
      5543485F4B5353530100000000000A00000047524F54505F4B53535301000000
      00000B000000504F545245425F4B535353010000000000080000005354414E5F
      4B4F440100000000000C0000005354414E5F4F54505F4B4F4401000000000008
      0000004E554D5F434953540100000000000D0000005641474F574E45525F5459
      50450100000000000600000054414E4B45520100000000000500000054415249
      4601000000000008000000444F5054415249460100000000000B000000544152
      49465F4755415244010000000000070000004B5649545F494401000000000009
      00000050524F445F4B5353530100000000000300000056455301000000000006
      00000045445F495A4D0100000000000A0000004B4F4C5F45445F464153010000
      0000000A00000045445F495A4D5F46415301000000000006000000414354494F
      4E0100000000000900000054415249465F4E44530100000000000F0000005441
      5249465F47554152445F4E445301000000000009000000444154455F4B564954
      0100000000000A0000005641474F4E5F54595045010000000000060000005245
      45535452010000000000070000005649445F504552010000000000090000004E
      554D5F444F5645520100000000000A000000444154455F444F56455201000000
      00000A00000046494F5F445249564552010000000000080000004649454C445F
      3336010000000000080000004649454C445F3337010000000000080000004649
      454C445F3338010000000000080000004649454C445F33390100000000000800
      00004649454C445F3430010000000000080000004649454C445F343101000000
      0000080000004649454C445F3432010000000000080000004649454C445F3433
      010000000000080000004649454C445F3434010000000000080000004649454C
      445F3435010000000000080000004649454C445F343601000000000008000000
      4649454C445F3437010000000000080000004649454C445F3438010000000000
      080000004649454C445F3439010000000000080000004649454C445F35300100
      00000000080000004649454C445F3531010000000000080000004649454C445F
      3532010000000000080000004649454C445F3533010000000000080000004649
      454C445F35340100000000000E00000049535F504F545245425F4B5353530100
      00000000}
    Session = f_main.ora_Session
    Left = 832
    Top = 224
  end
  object qOBR: TOracleDataSet
    SQL.Strings = (
      '-- '#1054#1041#1056
      'select'
      '   pl.*'
      'from'
      '('
      'select'
      '  (case'
      '  '#9'   when dogovor.maindog_id=2515 then '#39'A200601370000'#39
      #9'   else dogovor.isu_kod_dog'
      '   end) as isu_kod_dog,'
      
        '  --dogovor.isu_kod_dog,   -- '#1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072'  ('#1043#1076#1077' '#1082#1086#1076#1072' '#1076#1086#1075#1086#1074#1086#1088#1086 +
        #1074' '#1074' '#1082#1086#1076#1080#1088#1086#1074#1082#1077' '#1048#1057#1059' '#1055#1077#1088#1077#1088#1072#1073#1086#1090#1082#1072')'
      '  1 as DOC_KOD,                    -- '#1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' (1 - '#1054#1041#1056')'
      '  --'#39#39' as OBR_NUM,                 -- '#1053#1086#1084#1077#1088' '#1054#1041#1056' '#1080#1083#1080' '#1091#1082#1072#1079#1072#1085#1080#1103
      
        '  TO_CHAR(plan_per.num_plan) as OBR_NUM,                 -- '#1053#1086#1084#1077 +
        #1088' '#1054#1041#1056' '#1080#1083#1080' '#1091#1082#1072#1079#1072#1085#1080#1103
      
        '  TO_CHAR(plan_per.begin_date,'#39'YYYYMMDD'#39') as OBR_DATE,          ' +
        '-- '#1044#1072#1090#1072' '#1054#1041#1056' '#1080#1083#1080' '#1091#1082#1072#1079#1072#1085#1080#1103
      
        '  TO_CHAR(plan_per.date_plan,'#39'YYYYMMDD'#39') as date_plan,   -- '#1044#1072#1090#1072 +
        ' '#1086#1090#1075#1088#1091#1079#1082#1080' (?)'
      '  oil_prod.ksss_prod_id,  -- '#1052#1072#1090#1077#1088#1080#1072#1083
      '  SUM(plan_post.plan_ves) as ves,     -- '#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      '  '#39'TO'#39' as ED_IZM,                    -- '#1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      '  3 as ACTION,                      -- '#1050#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103
      '  (case'
      '     when plan_pos.kod_sgr=21 then 1'
      '     else 2'
      '   end)  kod_napr,       -- '#1050#1086#1076' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
      '  '#39'2300'#39' as sbyt_org                     -- '#1089#1073#1099#1090#1086#1074#1072#1103' '#1086#1088#1075#1072#1085#1080#1103
      'from'
      '  plan_post plan_post'
      '  join'
      '  kls_prod oil_prod on plan_post.prod_id_npr=oil_prod.id_npr'
      '  join'
      '  kls_dog dogovor on plan_post.dog_id=dogovor.id'
      '  join'
      '  kls_planstru plan_pos on plan_post.planstru_id=plan_pos.id'
      '  join'
      '  plan_periods plan_per on plan_post.plan_per_id=plan_per.id'
      'where plan_post.plan_id=3 -- '#1054#1041#1056
      
        '  and plan_per.begin_date between to_date(:Beg_date,'#39'dd.mm.yyyy'#39 +
        ') and to_date(:End_date,'#39'dd.mm.yyyy'#39')'
      '  and dogovor.isu_kod_dog like '#39'A%'#39
      'GROUP BY'
      '    (case'
      '  '#9'   when dogovor.maindog_id=2515 then '#39'A200601370000'#39
      #9'   else dogovor.isu_kod_dog'
      '   end),'
      
        '--  dogovor.isu_kod_dog,   -- '#1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072'  ('#1043#1076#1077' '#1082#1086#1076#1072' '#1076#1086#1075#1086#1074#1086#1088#1086 +
        #1074' '#1074' '#1082#1086#1076#1080#1088#1086#1074#1082#1077' '#1048#1057#1059' '#1055#1077#1088#1077#1088#1072#1073#1086#1090#1082#1072')'
      
        '  TO_CHAR(plan_per.begin_date,'#39'YYYYMMDD'#39'),          -- '#1044#1072#1090#1072' '#1054#1041#1056' ' +
        #1080#1083#1080' '#1091#1082#1072#1079#1072#1085#1080#1103
      '  TO_CHAR(plan_per.date_plan,'#39'YYYYMMDD'#39'),   -- '#1044#1072#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080' (?)'
      '  oil_prod.ksss_prod_id,  -- '#1052#1072#1090#1077#1088#1080#1072#1083
      '  (case'
      '     when plan_pos.kod_sgr=21 then 1'
      '     else 2'
      '   end),'
      '   plan_per.num_plan'
      'HAVING SUM(plan_post.plan_ves)<>0'
      
        'ORDER BY "ISU_KOD_DOG","DOC_KOD","NUM_PLAN","DATE_PLAN","OBR_DAT' +
        'E" NULLS FIRST'
      ') pl where isu_kod_dog like '#39'A%'#39
      '--AND 1=1'
      '--AND 1=1')
    Variables.Data = {
      0300000002000000090000003A4245475F444154450500000000000000000000
      00090000003A454E445F44415445050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000003700000007000000524F575F4E554D0100000000000600000054544E
      5F49440100000000000B0000004953555F4B4F445F444F470100000000000D00
      00004953555F4B4F445F444F475F32010000000000060000005649445F545201
      0000000000080000004E554D5F4B56495401000000000009000000444154455F
      4F54475201000000000005000000534B4C41440100000000000B000000504F4C
      5543485F4B5353530100000000000A00000047524F54505F4B53535301000000
      00000B000000504F545245425F4B535353010000000000080000005354414E5F
      4B4F440100000000000C0000005354414E5F4F54505F4B4F4401000000000008
      0000004E554D5F434953540100000000000D0000005641474F574E45525F5459
      50450100000000000600000054414E4B45520100000000000500000054415249
      4601000000000008000000444F5054415249460100000000000B000000544152
      49465F4755415244010000000000070000004B5649545F494401000000000009
      00000050524F445F4B5353530100000000000300000056455301000000000006
      00000045445F495A4D0100000000000A0000004B4F4C5F45445F464153010000
      0000000A00000045445F495A4D5F46415301000000000006000000414354494F
      4E0100000000000900000054415249465F4E44530100000000000F0000005441
      5249465F47554152445F4E445301000000000009000000444154455F4B564954
      0100000000000A0000005641474F4E5F54595045010000000000060000005245
      45535452010000000000070000005649445F504552010000000000090000004E
      554D5F444F5645520100000000000A000000444154455F444F56455201000000
      00000A00000046494F5F445249564552010000000000080000004649454C445F
      3336010000000000080000004649454C445F3337010000000000080000004649
      454C445F3338010000000000080000004649454C445F33390100000000000800
      00004649454C445F3430010000000000080000004649454C445F343101000000
      0000080000004649454C445F3432010000000000080000004649454C445F3433
      010000000000080000004649454C445F3434010000000000080000004649454C
      445F3435010000000000080000004649454C445F343601000000000008000000
      4649454C445F3437010000000000080000004649454C445F3438010000000000
      080000004649454C445F3439010000000000080000004649454C445F35300100
      00000000080000004649454C445F3531010000000000080000004649454C445F
      3532010000000000080000004649454C445F3533010000000000080000004649
      454C445F35340100000000000E00000049535F504F545245425F4B5353530100
      00000000}
    Session = f_main.ora_Session
    Left = 832
    Top = 288
  end
  object amR3: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = acRefresh
            ImageIndex = 11
          end
          item
            Action = acExportTo
            ImageIndex = 42
          end
          item
            Visible = False
            Action = acImportRaznar
            Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1044#1054#1043#1054#1042#1054#1056#1040' '#1080#1079' &R3'
            ImageIndex = 31
          end
          item
            Action = acImportXLS
            ImageIndex = 31
          end
          item
            Action = acShowSQL
            Caption = '&ShowSQL'
          end
          item
            Action = acDel_SAP
            Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1074#1080#1090#1072#1085#1094#1080#1102' S&AP'
            ImageIndex = 16
          end
          item
            Visible = False
            Action = acOpenSAP
            Caption = #1058#1088#1072#1085#1079#1072#1082#1094#1080#1103' &ZTTN'
            ImageIndex = 54
          end
          item
            Caption = '-'
          end
          item
            Action = acClose
            ImageIndex = 5
          end
          item
            Visible = False
            Action = Action1
            Caption = 'A&ction1'
          end
          item
            Visible = False
            Action = Action2
            Caption = 'Ac&tion2'
          end>
        ActionBar = ActionToolBar1
      end>
    Images = f_main.img_Common
    Left = 301
    Top = 290
    StyleName = 'XP Style'
    object acExportTo: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1092#1072#1081#1083
      ImageIndex = 42
      OnExecute = acExportToExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acRefreshExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 5
      OnExecute = acCloseExecute
    end
    object acImportRaznar: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1044#1054#1043#1054#1042#1054#1056#1040' '#1080#1079' R3'
      ImageIndex = 31
      Visible = False
      OnExecute = acImportRaznarExecute
    end
    object acImportRC: TAction
      Caption = #1055#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
      ImageIndex = 39
      OnExecute = acImportRCExecute
    end
    object acDel_SAP: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1074#1080#1090#1072#1085#1094#1080#1102' SAP'
      ImageIndex = 16
      OnExecute = acDel_SAPExecute
    end
    object acOpenSAP: TAction
      Caption = #1058#1088#1072#1085#1079#1072#1082#1094#1080#1103' ZTTN'
      ImageIndex = 54
      Visible = False
      OnExecute = acOpenSAPExecute
    end
    object acShowSQL: TAction
      Caption = 'ShowSQL'
      OnExecute = acShowSQLExecute
    end
    object acImportXLS: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103
      ImageIndex = 31
      OnExecute = acImportXLSExecute
    end
    object Action1: TAction
      Caption = 'Action1'
      Visible = False
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      Visible = False
      OnExecute = Action2Execute
    end
  end
  object qLoadStatus: TOracleQuery
    SQL.Strings = (
      'update kvit'
      'set is_loaded=0'
      
        'where lpad(to_char(kvit.NUM_KVIT),6,'#39'0'#39')=:KVIT and  date_kvit=to' +
        '_date(:DATE_KV,'#39'dd.mm.yyyy'#39') '
      'and is_loaded=9')
    Session = ora_Session
    Variables.Data = {
      0300000002000000050000003A4B564954030000000000000000000000080000
      003A444154455F4B56050000000000000000000000}
    Left = 768
    Top = 344
  end
  object qControl: TOracleDataSet
    SQL.Strings = (
      '/* '#1042#1099#1075#1088#1091#1079#1082#1072' '#1058#1058#1053' */'
      'SELECT'
      '  rownum as row_num,'
      '  kv.*'
      'FROM'
      '('
      'SELECT /*+ RULE */'
      '  '#39'2300_'#39'||to_char(ttn_id) as ttn_id, -- '#1050#1086#1076' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      '  to_char(CASE'
      
        '      WHEN main_dog.id IS NULL OR main_dog.id=kls_dog.id THEN us' +
        'l_dog.ISU_KOD_DOG'
      #9'  ELSE main_u_dog.ISU_KOD_DOG'
      
        #9'END) as ISU_KOD_DOG,  -- '#1050#1086#1076' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1048#1057#1059' '#1055#1077#1088#1077#1088#1072#1073#1086#1090#1082#1072'. '#1055#1088#1080' '#1072#1075#1077#1085 +
        #1090#1089#1082#1086#1081' '#1089#1093#1077#1084#1077' '#1082#1086#1076' '#1072#1075#1077#1085#1090#1089#1082#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1072
      '  to_char(CASE'
      
        '      WHEN main_dog.id IS NULL OR main_dog.id=kls_dog.id THEN NU' +
        'LL'
      #9'  ELSE usl_dog.ISU_KOD_DOG'
      
        #9'END) as ISU_KOD_DOG_2,  -- '#1055#1088#1080' '#1072#1075#1077#1085#1090#1089#1082#1086#1081' '#1089#1093#1077#1084#1077' '#1089#1090#1072#1074#1080#1090#1089#1103' '#1085#1086#1084#1077#1088' '#1076 +
        #1086#1075#1086#1074#1086#1088#1072' '#1084#1077#1078#1076#1091' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082#1086#1084' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072' '#1080' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1077#1084
      #9'kls_load_type.ISU_KOD as VID_TR, -- '#1074#1080#1076' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1080#1088#1086#1074#1082#1080
      
        #9'lpad(to_char(kvit.NUM_KVIT),6,'#39'0'#39') as NUM_KVIT, --'#1053#1086#1084#1077#1088' '#1090#1086#1074#1072#1088#1085#1086 +
        '-'#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      
        #9'TO_CHAR(kvit.DATE_KVIT,'#39'YYYYMMDD'#39') as DATE_OTGR, -- '#1044#1072#1090#1072' '#1086#1090#1075#1088#1091#1079 +
        #1082#1080
      #9'(CASE'
      #9#9' WHEN KLS_LOAD_TYPE.ISU_KOD=2 THEN'
      #9#9' '#9'  CASE '
      #9#9#9'  '#9'   WHEN KLS_PROD.ID_GROUP_NPR='#39'13000'#39' THEN '#39'0105'#39
      #9#9#9#9'   ELSE '#39'0314'#39
      #9#9#9'  END'
      #9#9' WHEN KLS_LOAD_TYPE.ISU_KOD=1 THEN'
      #9#9' '#9'  CASE '
      #9#9#9'  '#9'   WHEN KLS_PROD.ID_GROUP_NPR='#39'13000'#39' THEN '#39'0105'#39
      #9#9#9#9'   WHEN KLS_PROD.ID_GROUP_NPR='#39'24000'#39' THEN '#39'0200'#39
      #9#9#9#9'   ELSE '#39'1010'#39
      #9#9#9'  END'#9'   '#9'  '#9'    '
      #9'END) AS SKLAD_NEW, -- '#1052#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080' ('#1089#1082#1083#1072#1076')'
      
        #9'TO_CHAR(poluch.KSSS_PREDPR_ID) as poluch_ksss, -- '#1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077 +
        #1083#1100
      
        #9'TO_CHAR(grotp.KSSS_PREDPR_ID) as grotp_ksss, -- '#1043#1088#1091#1079#1086#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083 +
        #1100
      
        #9'TO_CHAR(potreb.KSSS_PREDPR_ID) as potreb_ksss, -- '#1043#1088#1091#1079#1086#1087#1086#1090#1088#1077#1073#1080#1090 +
        #1077#1083#1100
      
        #9'(CASE WHEN kls_load_type.id in (1,6) THEN LPAD(TO_CHAR(stan.STA' +
        'N_KOD),6,'#39'0'#39') ELSE '#39#39' END) as STAN_KOD, --'#1057#1090#1072#1085#1094#1080#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      
        #9'(CASE WHEN kls_load_type.id in (1,6) THEN LPAD(TO_CHAR(stan_otp' +
        '.STAN_KOD),6,'#39'0'#39') ELSE '#39#39' END) as STAN_OTP_KOD, --'#1057#1090#1072#1085#1094#1080#1103' '#1086#1090#1087#1088#1072#1074 +
        #1083#1077#1085#1080#1103
      #9'kvit.NUM_CIST, --'#1053#1086#1084#1077#1088' '#1074#1072#1075#1086#1085#1072
      #9'TO_NUMBER(CASE'
      
        #9'            WHEN MONTH.LOAD_ABBR IN ('#39#1057#1040#1052#39','#39#1056#1045#1047#39','#39#1058#1056#1059#39') THEN NU' +
        'LL'
      '                WHEN KLS_VAGOWNER.VAGOWN_TYP_ID=0 THEN 1'
      '                WHEN KLS_VAGOWNER.OWNER_ID IN (2,33) THEN 2'
      '                ELSE 3'
      '              END) AS vagowner_type, --'#1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100' '#1074#1072#1075#1086#1085#1072
      #9#39#39' as TANKER, -- '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1091#1076#1085#1072#9'--kls_tex_pd.PLATTARIF_ID,'
      #9'(CASE'
      #9'   WHEN kls_tex_pd.PLATTARIF_ID=8 THEN'#9'kvit.TARIF'
      #9'   ELSE 0'
      #9' END) as TARIF, -- '#1055#1088#1086#1074#1086#1079#1085#1072#1103' '#1087#1083#1072#1090#1072
      #9'(CASE'
      #9'   WHEN kvit.TARIF19>0 THEN kvit.TARIF19-kvit.TARIF'
      #9'   ELSE 0'
      
        #9' END) as DOPTARIF, -- '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1072#1088#1080#1092' ('#1088#1072#1079#1085#1080#1094#1072' '#1084#1077#1078#1076#1091' '#1089#1093#1077#1084#1072 +
        #1084#1080')'
      #9'(CASE'
      #9'   WHEN kls_tex_pd.PLATTARIF_ID=8 THEN kvit.TARIF_GUARD'
      #9'   ELSE 0'
      #9' END) as TARIF_GUARD, --'#1054#1093#1088#1072#1085#1072
      #9'kvit.id as kvit_id, --'#1050#1086#1076' '#1089#1090#1088#1086#1082#1080' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      #9'kls_prod.KSSS_PROD_ID as prod_ksss, --'#1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
      #9'kvit.VES_BRUTTO as VES, --'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      #9#39#1058' '#39' as ED_IZM, --'#1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      #9'kvit.KOL_ED as KOL_ED_FAS, -- '#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1077#1076'-'#1094
      #9#39#1064#1058#39' as ED_IZM_FAS, --'#1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      #9'1 as ACTION, --'#1050#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103
      #9'(CASE'
      #9'   WHEN kls_tex_pd.PLATTARIF_ID=8 THEN ROUND(kvit.TARIF*0.18,2)'
      #9'   ELSE 0'
      #9' END) as TARIF_NDS_RASCH, --'#1053#1044#1057' '#1087#1088#1086#1074#1086#1079#1085#1086#1081' '#1087#1083#1072#1090#1099
      #9'(CASE'
      
        #9'   WHEN kls_tex_pd.PLATTARIF_ID=8 THEN ROUND(kvit.TARIF_GUARD*0' +
        '.18,2) '
      #9'   ELSE 0'
      #9' END) as TARIF_GUARD_NDS_RASCH, -- '#1053#1044#1057' '#1086#1093#1088#1072#1085#1099
      
        #9'TO_CHAR(kvit.DATE_KVIT,'#39'YYYYMMDD'#39') as DATE_KVIT, --'#1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085 +
        #1090#1072
      #9'kls_vagontype.ISU_KOD as VAGON_TYPE, --'#1058#1080#1087' '#1074#1072#1075#1086#1085#1072
      #9#39#39' as REESTR, --'#1053#1086#1084#1077#1088' '#1088#1077#1077#1089#1090#1088#1072
      #9'(CASE'
      
        #9'   WHEN kls_dog_main.IS_AGENT=1 and  kvit.DATE_KVIT<to_date('#39'01' +
        '.01.2007'#39','#39'dd.mm.yyyy'#39') THEN '#39'9999'#39
      
        '     WHEN kls_dog.IS_AGENT=1 and kvit.DATE_KVIT>=to_date('#39'01.01.' +
        '2007'#39','#39'dd.mm.yyyy'#39') THEN '#39'9990'#39
      #9'   WHEN month.nazn_otg_id=8 THEN '#39'0065'#39
      #9'   ELSE '#39'0061'#39
      #9' END) as VID_PER, -- '#1042#1080#1076' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
      #9' kvit.NUM_DOVER, -- '#1053#1086#1084#1077#1088' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
      
        #9' TO_CHAR(kvit.DATE_DOVER,'#39'YYYYMMDD'#39') as DATE_DOVER, -- '#1044#1072#1090#1072' '#1076#1086#1074 +
        #1077#1088#1077#1085#1085#1086#1089#1090#1080
      #9' kvit.FIO_DRIVER, --'#1060#1072#1084#1080#1083#1080#1103' '#1074#1086#1076#1080#1090#1077#1083#1103
      #9' NULL as FIELD_36,'
      #9' NULL as FIELD_37,'
      
        #9' (CASE WHEN kvit.DATE_KVIT<to_date('#39'01.01.2007'#39','#39'dd.mm.yyyy'#39') T' +
        'HEN CASE WHEN month.IS_EXP+0=1 THEN '#39'01'#39' ELSE '#39'02'#39' END'
      
        #9' '#9'   WHEN kvit.DATE_KVIT>=to_date('#39'01.01.2007'#39','#39'dd.mm.yyyy'#39') TH' +
        'EN CASE WHEN month.IS_EXP+0=1 THEN '#39'08'#39' ELSE '#39'02'#39' END'
      #9'  END)as KOD_NAPR,'
      #9' NULL as FIELD_39,'
      #9' NULL as FIELD_40,'
      #9' NULL as FIELD_41,'
      #9' NULL as FIELD_42,'
      #9' NULL as FIELD_43,'
      #9' NULL as FIELD_44,'
      #9' NULL as FIELD_45,'
      #9' NULL as FIELD_46,'
      #9' NULL as FIELD_47,'
      #9' NULL as FIELD_48,'
      #9' NULL as FIELD_49,'
      #9' NULL as FIELD_50,'
      #9' NULL as FIELD_51,'
      #9' NULL as FIELD_52,'
      #9' NULL as FIELD_53,'
      #9' NULL as FIELD_54,'
      #9' '#39#1050#39' as IS_POTREB_KSSS, -- '#1055#1088#1080#1079#1085#1072#1082' '#1082#1086#1076#1080#1088#1086#1074#1082#1080' '#1075#1088#1091#1079#1086#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1103
      #9' null as FIELD_56,'
      
        #9' TO_CHAR(kvit.DATE_KVIT,'#39'MMDD'#39')||'#39'/'#39'||SUBSTR(kvit.NOM_ZD,6,5) a' +
        's RAZNAR,'
      #9' 1 as RAZNAR_P,'
      #9' kvit.GTD,'
      #9' NULL as FIELD_60,'
      
        #9' to_char(kls_pasp.PASP_DATE,'#39'ddmmyy'#39')||'#39'_'#39'||trim(kls_pasp.PASP_' +
        'NUM)||'#39'_'#39'||trim(kls_prod.KSSS_PROD_ID) as CQ_NUM,--N '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072 +
        ' '#1082#1072#1095#1077#1089#1090#1074#1072','
      #9' KVIT.VES_BRUTTO*1000,'
      #9' (CASE'
      #9'   WHEN month.IS_EXP+0=1 THEN vagowner.KSSS_PREDPR_ID'
      #9'   ELSE null'
      #9' END)as KSSS_VAGOWNER,'
      
        #9' exped.KSSS_PREDPR_ID as KSSS_EXPED,NVL(to_char(kls_shabexp.ins' +
        'num),'#39'-'#39') as INS_NUM,NVL(to_char(kls_shabexp.insdat,'#39'yyyymmdd'#39'),' +
        #39'-'#39') as INS_DAT, '#39'-'#39' as telegram'
      
        'FROM kvit,month,kls_dog_main,usl_dog,kls_dog,usl_dog main_u_dog,' +
        'kls_dog main_dog,'
      '   kls_vid_otgr,kls_load_type,kls_stan stan,kls_stan stan_otp,'
      
        #9' kls_predpr poluch, kls_predpr grotp, kls_predpr potreb,kls_pre' +
        'dpr vagowner,kls_predpr exped,'
      #9' kls_vagowner,kls_vagowner_types,kls_prod,'
      
        #9' kls_vagontype,kls_pasp,kls_shabexp,r3_vbak,r3_kvit2sap,kls_tex' +
        '_pd'
      
        'WHERE kvit.date_kvit BETWEEN TO_DATE(:beg_date,'#39'dd.mm.yyyy'#39') AND' +
        ' TO_DATE(:end_date,'#39'dd.mm.yyyy'#39')'
      '  AND kvit.FLG_OPERDATA=0 -- '#1088#1072#1089#1082#1088#1077#1076#1080#1090#1086#1074#1072#1085#1085#1099#1077
      '  AND kvit.nom_zd=month.nom_zd'
      '  AND kvit.PASP_ID=kls_pasp.ID(+)'
      '  AND kvit.DATE_KVIT=r3_vbak.VBAK_VDATU(+)'
      '  AND kvit.nom_zd=r3_vbak.NOM_ZD(+)'
      '  AND kvit.ID=r3_kvit2sap.KVIT_ID(+)'
      '  AND month.dog_id=usl_dog.dog_id'
      '  AND month.usl_number=usl_dog.usl_number'
      
        '  AND month.dog_id=kls_dog.id AND kvit.shabexp_id=kls_shabexp.id' +
        '(+)'
      
        '  AND DECODE(month.is_exp,1,4,kls_dog.IS_AGENT)=kls_dog_main.IS_' +
        'AGENT -- '#1055#1088#1080' '#1086#1090#1075#1088#1091#1079#1082#1077' '#1085#1072' '#1101#1082#1089#1087#1086#1088#1090' '#1080#1097#1077#1084' '#1076#1086#1075#1086#1074#1086#1088' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1051#1059#1050#1054#1049#1051#1091
      
        '  AND kvit.DATE_KVIT BETWEEN kls_dog_main.FROM_DATE AND kls_dog_' +
        'main.TO_DATE'
      '  AND kls_dog_main.u_dog_id=main_u_dog.id(+)'
      '  AND main_u_dog.dog_id=main_dog.id(+)'
      '  AND month.LOAD_ABBR=kls_vid_otgr.load_abbr'
      '  AND kls_vid_otgr.LOAD_TYPE_ID=kls_load_type.id'
      '  AND month.stan_id=stan.id(+)'
      '  AND month.stanotp_id=stan_otp.id(+)'
      '  AND month.poluch_id=poluch.id(+)'
      '  AND month.potreb_id=potreb.id(+)'
      '  AND month.grotp_id=grotp.id(+)'
      '  AND kvit.vagowner_id=kls_vagowner.id(+)'
      '  AND kls_vagowner.VAGOWN_TYP_ID=kls_vagowner_types.id(+)'
      '  AND kls_vagowner.PREDPR_ID=vagowner.id(+)'
      '  AND kvit.EXPED_ID=exped.ID(+)'
      '  AND kvit.PROD_ID_NPR=kls_prod.ID_NPR(+)'
      '  AND kvit.VAGONTYPE_ID=kls_vagontype.id(+)'
      '  AND month.tex_pd_id=kls_tex_pd.id'
      '  AND month.grotp_id=kls_tex_pd.grotp_id'
      '  AND KVIT.IS_LOADED=9'
      'ORDER BY isu_kod_dog,kvit.date_kvit,kvit.num_kvit,kvit.id'
      ') kv'
      
        'where isu_kod_dog like '#39'A%'#39'--'#1091#1073#1080#1088#1072#1077#1084' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1085#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1085#1091#1078 +
        #1076#1099
      '--AND 1=1'
      '--AND 1=1'
      '--AND 1=1'
      '--AND 1=1'
      '--AND 1=1')
    Variables.Data = {
      0300000002000000090000003A4245475F444154450500000000000000000000
      00090000003A454E445F44415445050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000003700000007000000524F575F4E554D0100000000000600000054544E
      5F49440100000000000B0000004953555F4B4F445F444F470100000000000D00
      00004953555F4B4F445F444F475F32010000000000060000005649445F545201
      0000000000080000004E554D5F4B56495401000000000009000000444154455F
      4F54475201000000000005000000534B4C41440100000000000B000000504F4C
      5543485F4B5353530100000000000A00000047524F54505F4B53535301000000
      00000B000000504F545245425F4B535353010000000000080000005354414E5F
      4B4F440100000000000C0000005354414E5F4F54505F4B4F4401000000000008
      0000004E554D5F434953540100000000000D0000005641474F574E45525F5459
      50450100000000000600000054414E4B45520100000000000500000054415249
      4601000000000008000000444F5054415249460100000000000B000000544152
      49465F4755415244010000000000070000004B5649545F494401000000000009
      00000050524F445F4B5353530100000000000300000056455301000000000006
      00000045445F495A4D0100000000000A0000004B4F4C5F45445F464153010000
      0000000A00000045445F495A4D5F46415301000000000006000000414354494F
      4E0100000000000900000054415249465F4E44530100000000000F0000005441
      5249465F47554152445F4E445301000000000009000000444154455F4B564954
      0100000000000A0000005641474F4E5F54595045010000000000060000005245
      45535452010000000000070000005649445F504552010000000000090000004E
      554D5F444F5645520100000000000A000000444154455F444F56455201000000
      00000A00000046494F5F445249564552010000000000080000004649454C445F
      3336010000000000080000004649454C445F3337010000000000080000004649
      454C445F3338010000000000080000004649454C445F33390100000000000800
      00004649454C445F3430010000000000080000004649454C445F343101000000
      0000080000004649454C445F3432010000000000080000004649454C445F3433
      010000000000080000004649454C445F3434010000000000080000004649454C
      445F3435010000000000080000004649454C445F343601000000000008000000
      4649454C445F3437010000000000080000004649454C445F3438010000000000
      080000004649454C445F3439010000000000080000004649454C445F35300100
      00000000080000004649454C445F3531010000000000080000004649454C445F
      3532010000000000080000004649454C445F3533010000000000080000004649
      454C445F35340100000000000E00000049535F504F545245425F4B5353530100
      00000000}
    Session = f_main.ora_Session
    Left = 832
    Top = 344
  end
  object qContragent: TOracleDataSet
    SQL.Strings = (
      'select contr.* from'
      
        '(select '#39'2300_'#39'||to_char(p.id),p.KSSS_PREDPR_ID,'#39'DBGR'#39' as gch,'#39'R' +
        'U'#39' as co,trim(r.KOD_MOSCOW) as reg,'
      
        '(p.POSTINDEX_P),p.CITY_P,p.ADDRESS_P,(p.POSTINDEX_J),p.CITY_J,p.' +
        'ADDRESS_J,p.INN,p.SHORT_NAME,p.SF_NAME,'
      
        'p.PHONE,p.EMAIL,p.FAX,'#39#39' as tape,'#39#39' as pasp,'#39#39' as cp,p.okonh,p.o' +
        'kpo,'#39#39' as okopf,'#39#39' as okfs,'#39#39' as okogu,'
      
        #39#39' as okato,p.KPP,p.OKVED,'#39#39' as ogrn,0 as pizm,p.FULL_ADDRESS_P,' +
        'p.FULL_ADDRESS_J,'#39#39' as rs,'#39#39' as nb,'#39#39' as ks,'
      #39#39' as bik'
      'from kls_predpr p,kls_region r'
      'where '
      'p.REGION_p_ID=r.ID'
      'and p.id not in(3537,2052,8)'
      ') contr'
      'where'
      '--1=1')
    Session = f_main.ora_Session
    Left = 832
    Top = 400
  end
  object qIs_loaded: TOracleQuery
    SQL.Strings = (
      'update kvit'
      'set is_loaded=9'
      
        'where lpad(to_char(kvit.NUM_KVIT),6,'#39'0'#39')=:KVIT and  num_cist=:CI' +
        'ST and is_loaded<>9 '
      '      and date_kvit=TO_DATE(:DATA,'#39'dd.mm.yyyy'#39') ')
    Session = ora_Session
    Variables.Data = {
      0300000003000000050000003A4B564954030000000000000000000000050000
      003A43495354050000000000000000000000050000003A444154410500000000
      00000000000000}
    Left = 768
    Top = 400
  end
  object qKvit_sf: TOracleQuery
    SQL.Strings = (
      'update kvit'
      'set bill_id=:SF'
      
        'where lpad(to_char(kvit.NUM_KVIT),6,'#39'0'#39') as=:KVIT and  date_kvit' +
        '=TO_DATE(:DT,'#39'dd.mm.yyyy'#39')')
    Session = ora_Session
    Variables.Data = {
      0300000003000000030000003A5346050000000000000000000000050000003A
      4B564954040000000000000000000000030000003A4454050000000000000000
      000000}
    Left = 768
    Top = 464
  end
  object qProvoz: TOracleQuery
    SQL.Strings = (
      'update kvit'
      'set tarif_nds=:NDS'
      'where lpad(to_char(kvit.NUM_KVIT),6,'#39'0'#39')=:KVIT'
      '  and date_kvit=TO_DATE(:DT,'#39'dd.mm.yyyy'#39')'
      '  and num_cist=:CIST'
      '  and tarif_nds=0')
    Session = ora_Session
    Variables.Data = {
      0300000004000000040000003A4E445304000000000000000000000005000000
      3A4B564954040000000000000000000000030000003A44540500000000000000
      00000000050000003A43495354050000000000000000000000}
    Left = 832
    Top = 464
  end
  object qSf_RGD: TOracleDataSet
    SQL.Strings = (
      'select sf.* from'
      
        '(SELECT /*+ ORDERED */                        /* '#1054#1093#1088#1072#1085#1072' - '#1045#1089#1090#1100' '#1088 +
        #1077#1077#1089#1090#1088' '#1086#1090' '#1056#1046#1044' */'
      '       '#39'2300_'#39'||to_char(ttn_id) as TTN_ID, '
      #9'   gd_schet.nom_sch, '
      #9'   TO_CHAR(gd_schet.date_sch,'#39'yyyymmdd'#39') as DATA_SCH, '
      #9'   '#39'ZOHR'#39' as SIGN,'
      #9'   NULL as DATE_RASKRED'
      '  FROM MASTER.kvit k,'
      '       MASTER.reestr_rail reestr,'
      
        '       (SELECT DISTINCT nom_sch, date_sch, nom_perech, dat_perec' +
        'h, r21, kst'
      '                   FROM MASTER.reestr_rail_rgd_sf'
      '                  WHERE r21 = 95 AND kst = 285706) gd_schet'
      ' WHERE reestr.data_per = gd_schet.dat_perech'
      '   AND k.num_kvit = reestr.num_kvit'
      '   AND reestr.num_per = gd_schet.nom_perech'
      '   AND k.perech_guard_num = reestr.num_per'
      '   AND k.perech_guard_date = reestr.data_per'
      '   AND k.tarif_guard <> 0'
      '   AND reestr.GUARD <> 0'
      
        '   AND k.date_kvit between to_date(:BEG_DATE,'#39'dd.mm.yyyy'#39') and t' +
        'o_date(:END_DATE,'#39'dd.mm.yyyy'#39')'
      'UNION'
      
        'SELECT /*+ ORDERED */                         /* '#1058#1072#1088#1080#1092' - '#1045#1089#1090#1100' '#1088#1077 +
        #1077#1089#1090#1088' '#1086#1090' '#1056#1046#1044' */'
      '       '#39'2300_'#39'||to_char(ttn_id) as TTN_ID, '
      #9'   gd_schet.nom_sch, '
      #9'   TO_CHAR(gd_schet.date_sch,'#39'yyyymmdd'#39') as DATA_SCH, '
      #9'   '#39'ZPRV'#39' as SIGN,'
      #9'   NULL as DATE_RASKRED'
      '  FROM MASTER.kvit k,'
      '       MASTER.reestr_rail reestr,'
      
        '       (SELECT DISTINCT nom_sch, date_sch, nom_perech, dat_perec' +
        'h, r21, kst'
      '                   FROM MASTER.reestr_rail_rgd_sf'
      '                  WHERE r21 = 95 AND kst = 285706) gd_schet'
      ' WHERE reestr.data_per = gd_schet.dat_perech'
      '   AND k.num_kvit = reestr.num_kvit'
      '   AND reestr.num_per = gd_schet.nom_perech'
      '   AND k.perech_texpd_num = reestr.num_per'
      '   AND k.perech_texpd_date = reestr.data_per'
      '   AND k.tarif <> 0'
      '   AND reestr.tarif <> 0'
      '   AND gd_schet.r21 = 95'
      '   AND gd_schet.kst = 285706'
      
        '   and k.date_kvit between to_date(:BEG_DATE,'#39'dd.mm.yyyy'#39') and t' +
        'o_date(:END_DATE,'#39'dd.mm.yyyy'#39')UNION    '
      
        'SELECT /*+ ORDERED */                        /* '#1054#1093#1088#1072#1085#1072' - '#1045#1089#1090#1100' '#1088#1077 +
        #1077#1089#1090#1088' '#1086#1090' '#1056#1046#1044' */'
      '       '#39'2300_'#39'||to_char(ttn_id) as TTN_ID, '
      #9'   NULL as nom_sch, '
      #9'   NULL as DATA_SCH, '
      #9'   '#39'ZRAS'#39' as SIGN,'
      #9'   TO_CHAR(gd_schet.dat_perech,'#39'yyyymmdd'#39') as DATE_RASKRED'
      '  FROM MASTER.kvit k,'
      '       MASTER.reestr_rail reestr,'
      
        '       (SELECT DISTINCT nom_sch, date_sch, nom_perech, dat_perec' +
        'h, r21, kst'
      '                   FROM MASTER.reestr_rail_rgd_sf'
      '                  WHERE r21 = 95 AND kst = 285706) gd_schet'
      ' WHERE reestr.data_per = gd_schet.dat_perech'
      '   AND k.num_kvit = reestr.num_kvit'
      '   AND reestr.num_per = gd_schet.nom_perech'
      '   AND k.perech_guard_num = reestr.num_per'
      '   AND k.perech_guard_date = reestr.data_per'
      '   AND k.tarif_guard <> 0'
      '   AND reestr.GUARD <> 0'
      
        '   AND k.date_kvit between to_date(:BEG_DATE,'#39'dd.mm.yyyy'#39') and t' +
        'o_date(:END_DATE,'#39'dd.mm.yyyy'#39')'
      'UNION'
      
        'SELECT /*+ ORDERED */                         /* '#1058#1072#1088#1080#1092' - '#1045#1089#1090#1100' '#1088#1077 +
        #1077#1089#1090#1088' '#1086#1090' '#1056#1046#1044' */'
      '       '#39'2300_'#39'||to_char(ttn_id) as TTN_ID, '
      #9'   NULL as nom_sch, '
      #9'   NULL as DATA_SCH, '
      #9'   '#39'ZRAS'#39' as SIGN,'
      #9'   TO_CHAR(gd_schet.dat_perech,'#39'yyyymmdd'#39') as DATE_RASKRED'
      '  FROM MASTER.kvit k,'
      '       MASTER.reestr_rail reestr,'
      
        '       (SELECT DISTINCT nom_sch, date_sch, nom_perech, dat_perec' +
        'h, r21, kst'
      '                   FROM MASTER.reestr_rail_rgd_sf'
      '                  WHERE r21 = 95 AND kst = 285706) gd_schet'
      ' WHERE reestr.data_per = gd_schet.dat_perech'
      '   AND k.num_kvit = reestr.num_kvit'
      '   AND reestr.num_per = gd_schet.nom_perech'
      '   AND k.perech_texpd_num = reestr.num_per'
      '   AND k.perech_texpd_date = reestr.data_per'
      '   AND k.tarif <> 0'
      '   AND reestr.tarif <> 0'
      '   AND gd_schet.r21 = 95'
      '   AND gd_schet.kst = 285706'
      
        '   and k.date_kvit between to_date(:BEG_DATE,'#39'dd.mm.yyyy'#39') and t' +
        'o_date(:END_DATE,'#39'dd.mm.yyyy'#39')'
      '   ) sf'
      'order by ttn_id,sign')
    Variables.Data = {
      0300000002000000090000003A4245475F444154450500000000000000000000
      00090000003A454E445F44415445050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000003700000007000000524F575F4E554D0100000000000600000054544E
      5F49440100000000000B0000004953555F4B4F445F444F470100000000000D00
      00004953555F4B4F445F444F475F32010000000000060000005649445F545201
      0000000000080000004E554D5F4B56495401000000000009000000444154455F
      4F54475201000000000005000000534B4C41440100000000000B000000504F4C
      5543485F4B5353530100000000000A00000047524F54505F4B53535301000000
      00000B000000504F545245425F4B535353010000000000080000005354414E5F
      4B4F440100000000000C0000005354414E5F4F54505F4B4F4401000000000008
      0000004E554D5F434953540100000000000D0000005641474F574E45525F5459
      50450100000000000600000054414E4B45520100000000000500000054415249
      4601000000000008000000444F5054415249460100000000000B000000544152
      49465F4755415244010000000000070000004B5649545F494401000000000009
      00000050524F445F4B5353530100000000000300000056455301000000000006
      00000045445F495A4D0100000000000A0000004B4F4C5F45445F464153010000
      0000000A00000045445F495A4D5F46415301000000000006000000414354494F
      4E0100000000000900000054415249465F4E44530100000000000F0000005441
      5249465F47554152445F4E445301000000000009000000444154455F4B564954
      0100000000000A0000005641474F4E5F54595045010000000000060000005245
      45535452010000000000070000005649445F504552010000000000090000004E
      554D5F444F5645520100000000000A000000444154455F444F56455201000000
      00000A00000046494F5F445249564552010000000000080000004649454C445F
      3336010000000000080000004649454C445F3337010000000000080000004649
      454C445F3338010000000000080000004649454C445F33390100000000000800
      00004649454C445F3430010000000000080000004649454C445F343101000000
      0000080000004649454C445F3432010000000000080000004649454C445F3433
      010000000000080000004649454C445F3434010000000000080000004649454C
      445F3435010000000000080000004649454C445F343601000000000008000000
      4649454C445F3437010000000000080000004649454C445F3438010000000000
      080000004649454C445F3439010000000000080000004649454C445F35300100
      00000000080000004649454C445F3531010000000000080000004649454C445F
      3532010000000000080000004649454C445F3533010000000000080000004649
      454C445F35340100000000000E00000049535F504F545245425F4B5353530100
      00000000}
    Session = f_main.ora_Session
    Left = 770
    Top = 517
  end
  object qNPO_zayav: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ROWNUM AS a1, luk_dog.isu_kod_dog AS a2, zakaz_hist.ID AS' +
        ' a3,'
      '       TO_CHAR (zakaz_hist.input_date, '#39'yyyymmdd'#39') AS a4,'
      '       zakaz_hist.id AS a5,'
      
        '       TO_CHAR (LAST_DAY (zakaz.date_plan), '#39'yyyymmdd'#39') AS a6, p' +
        'ayerluk.ksss_predpr_id AS a7,'
      
        '       payerpr.ksss_predpr_id AS a8, consignpr.ksss_predpr_id AS' +
        ' a9,'
      '       userpr.ksss_predpr_id AS a10,'
      
        '       '#39#39' AS a11, '#39#39' AS a12, '#39#39' AS a13, kls_prod.ksss_prod_id AS' +
        ' a14,'
      
        '       zakaz_hist.load_ves * 1000 AS a15, 0 AS a16, 0 AS a17, '#39#1058 +
        #39' AS a18,'
      '       CASE kls_load_type.ID'
      '          WHEN 1'
      '             THEN 3'
      '          WHEN 6'
      '             THEN 3'
      '          WHEN 2'
      '             THEN 1'
      '          WHEN 3'
      '             THEN 5'
      '          WHEN 4'
      '             THEN 6'
      '          ELSE 0'
      '       END AS a19,'
      '       CASE NVL (kls_stan.ksss_stan_id, 0)'
      '          WHEN 0'
      '             THEN NULL'
      '          ELSE '#39'2520'#39
      
        '       END AS a20, kls_stan.ksss_stan_id AS a21, kls_vetka.vetka' +
        '_name AS a22,'
      
        '       '#39#39' AS a23, '#39#39' AS a24, 0 AS a25, payerluk.ksss_predpr_id A' +
        'S a26, 0 AS a27, '#39#1058#39' AS a28,'
      
        '       REPLACE(zakaz.prim,'#39';'#39','#39','#39') AS a29, REPLACE(zakaz.gr4,'#39';'#39 +
        ','#39','#39') AS a30, zakaz_hist.client_number||'#39'\'#39'||zakaz_hist.input_nu' +
        'mber AS a31,'
      
        '       TO_CHAR (zakaz_hist.input_date, '#39'ddmmyyyy'#39') AS a32, subst' +
        'r(kls_vetka.vetka_name,1,40) AS a33'
      '  FROM zakaz'
      '       LEFT JOIN kls_dog luk_dog ON luk_dog.ID = zakaz.lukdog_id'
      
        '       LEFT JOIN kls_predpr payerluk ON payerluk.ID = luk_dog.pr' +
        'edpr_id'
      '       JOIN zakaz_hist ON zakaz_hist.zakaz_id = zakaz.ID'
      '       JOIN kls_predpr payerpr ON payerpr.ID = zakaz.plat_id'
      
        '       LEFT JOIN kls_predpr consignpr ON consignpr.ID = zakaz.po' +
        'luch_id'
      
        '       LEFT JOIN kls_predpr userpr ON userpr.ID = zakaz.potreb_i' +
        'd'
      '       --LEFT JOIN kls_dog ON kls_dog.ID = zakaz.dog_id'
      '       JOIN kls_prod ON kls_prod.id_npr = zakaz.prod_id_npr'
      
        '       JOIN kls_vid_otgr ON kls_vid_otgr.load_abbr = zakaz.load_' +
        'abbr'
      
        '       JOIN kls_load_type ON kls_load_type.ID = kls_vid_otgr.loa' +
        'd_type_id'
      '       LEFT JOIN kls_stan ON kls_stan.ID = zakaz.stan_id'
      '       LEFT JOIN kls_vetka ON kls_vetka.ID = zakaz.vetka_id'
      ' WHERE zakaz.is_agent = 2 and zakaz.is_accept=1'
      '   AND zakaz_hist.status_zakaz_id = 20'
      '   AND date_plan = TO_DATE(:date_plan,'#39'dd.mm.yyyy'#39')'
      '   AND input_date >= TO_DATE(:input_date,'#39'dd.mm.yyyy'#39')'
      '   AND luk_dog.isu_kod_dog IS NOT NULL'
      '--AND 1=1'
      '--AND 1=1')
    Variables.Data = {
      03000000020000000A0000003A444154455F504C414E05000000000000000000
      00000B0000003A494E5055545F44415445050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000003700000007000000524F575F4E554D0100000000000600000054544E
      5F49440100000000000B0000004953555F4B4F445F444F470100000000000D00
      00004953555F4B4F445F444F475F32010000000000060000005649445F545201
      0000000000080000004E554D5F4B56495401000000000009000000444154455F
      4F54475201000000000005000000534B4C41440100000000000B000000504F4C
      5543485F4B5353530100000000000A00000047524F54505F4B53535301000000
      00000B000000504F545245425F4B535353010000000000080000005354414E5F
      4B4F440100000000000C0000005354414E5F4F54505F4B4F4401000000000008
      0000004E554D5F434953540100000000000D0000005641474F574E45525F5459
      50450100000000000600000054414E4B45520100000000000500000054415249
      4601000000000008000000444F5054415249460100000000000B000000544152
      49465F4755415244010000000000070000004B5649545F494401000000000009
      00000050524F445F4B5353530100000000000300000056455301000000000006
      00000045445F495A4D0100000000000A0000004B4F4C5F45445F464153010000
      0000000A00000045445F495A4D5F46415301000000000006000000414354494F
      4E0100000000000900000054415249465F4E44530100000000000F0000005441
      5249465F47554152445F4E445301000000000009000000444154455F4B564954
      0100000000000A0000005641474F4E5F54595045010000000000060000005245
      45535452010000000000070000005649445F504552010000000000090000004E
      554D5F444F5645520100000000000A000000444154455F444F56455201000000
      00000A00000046494F5F445249564552010000000000080000004649454C445F
      3336010000000000080000004649454C445F3337010000000000080000004649
      454C445F3338010000000000080000004649454C445F33390100000000000800
      00004649454C445F3430010000000000080000004649454C445F343101000000
      0000080000004649454C445F3432010000000000080000004649454C445F3433
      010000000000080000004649454C445F3434010000000000080000004649454C
      445F3435010000000000080000004649454C445F343601000000000008000000
      4649454C445F3437010000000000080000004649454C445F3438010000000000
      080000004649454C445F3439010000000000080000004649454C445F35300100
      00000000080000004649454C445F3531010000000000080000004649454C445F
      3532010000000000080000004649454C445F3533010000000000080000004649
      454C445F35340100000000000E00000049535F504F545245425F4B5353530100
      00000000}
    Session = f_main.ora_Session
    Left = 832
    Top = 520
  end
end
