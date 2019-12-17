
Unit
    loader;

Interface

Uses
    Windows,        Messages,        SysUtils,    Variants,        Classes,    Graphics,
    Controls,       Forms,           StrUtils,    Placemnt,        IdMessage,  IdBaseComponent,
    IdComponent,    IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,     TB2Item,
    Menus,          ImgList,         PrnDbgeh,    DB,              ActnList,   XPStyleActnCtrls,
    ActnMan,        ComCtrls,        StdCtrls,    Grids,           DBGridEh,   ToolEdit,
    Mask,           RxLookup,        Buttons,     ExtCtrls,        Dialogs,    DateUtils,
    DBGridEhImpExp, Clipbrd,         Commctrl,    Oracle,          OracleData, ShellAPI,
    DataDriverEh,   MemTableEh,      TB2ExtItems, MemTableDataEh,  EhLibDOA,   IdExplicitTLSClientServerBase,
    IdSMTPBase, GridsEh, ADODB;

Type
    Tcb2parus = Class( TForm )
        q1 : TOracleQuery;

        oraDScb : TOracleSession;
        ActionManager1 : TActionManager;
        acOpenFile : TAction;
        acLoadORA : TAction;
        oraCB : TOracleDataSet;
        Panel1 : TPanel;
        dsCB : TDataSource;
        acParus : TAction;
        oraLog : TOracleLogon;
        oraACC : TOracleDataSet;
        dsACC : TDataSource;
        acFilter : TAction;
        oraCBCOMPANY : TFloatField;
        oraCBBANK_DOCNUMB : TStringField;
        oraCBBANK_DOCDATE : TDateTimeField;
        oraCBNAME_FROM : TStringField;
        oraCBNAME_TO : TStringField;
        oraCBACC_FROM : TStringField;
        oraCBACC_TO : TStringField;
        oraCBPAY_DATA : TDateTimeField;
        oraCBPAY_INFO : TStringField;
        oraCBPAY_SUM : TFloatField;
        oraCBTAX_SUM : TFloatField;
        oraCBPERCENT_TAX_SUM : TFloatField;
        oraCBCURRENCY : TFloatField;
        oraCBCBS_STATE : TFloatField;
        oraCBACC_KEY : TStringField;
        oraVyp : TOracleDataSet;
        dsVyp : TDataSource;
        oraVypBO_DT : TDateTimeField;
        oraVypBO_INN_R : TStringField;
        oraVypBO_INN_S : TStringField;
        oraVypBO_KS_R : TStringField;
        oraVypBO_KS_S : TStringField;
        oraVypBO_ACC_R : TStringField;
        oraVypBO_ACC_S : TStringField;
        oraVypBO_BIK_R : TStringField;
        oraVypBO_BIK_S : TStringField;
        oraVypBO_SUMM : TFloatField;
        oraVypBO_SENDER : TStringField;
        oraVypBO_RECEIVER : TStringField;
        oraVypBO_NUM : TStringField;
        oraVypBO_NAZN : TStringField;
        oraVypBO_VID : TIntegerField;
        oraVypBO_RN_PARUS : TFloatField;
        oraVypID : TFloatField;
        oraVypACCKEY : TStringField;
        oraCBVID : TIntegerField;
        oraCBRID : TStringField;
        prCB : TPrintDBGridEh;
        acPrint : TAction;
        sbBank : TStatusBar;
        oraCb_inn : TOracleDataSet;
        FloatField1 : TFloatField;
        StringField1 : TStringField;
        DateTimeField1 : TDateTimeField;
        StringField2 : TStringField;
        StringField3 : TStringField;
        DateTimeField2 : TDateTimeField;
        StringField6 : TStringField;
        FloatField6 : TFloatField;
        FloatField7 : TFloatField;
        FloatField8 : TFloatField;
        FloatField9 : TFloatField;
        FloatField10 : TFloatField;
        StringField8 : TStringField;
        dsCb_INN : TDataSource;
        oraCb_innACC_KEY : TStringField;
        ImageList1 : TImageList;
        TBPopupMenu1 : TTBPopupMenu;
        TBItem1 : TTBItem;
        TBItem2 : TTBItem;
        oraCatalog : TOracleDataSet;
        Splitter4 : TSplitter;
        ImageList2 : TImageList;
        oraNextNumb : TOracleQuery;
        oraInsert : TOracleQuery;
        GroupBox1 : TGroupBox;
        Label1 : TLabel;
        lcACC : TRxDBLookupCombo;
        Label2 : TLabel;
        edDate : TDateEdit;
        btnFilter : TBitBtn;
        oraCb_innAGENT_FROM : TStringField;
        oraCb_innAGENT_TO : TStringField;
        oraCb_innACC_FROM : TStringField;
        oraCb_innACC_TO : TStringField;
        oraCBAGENT_FROM : TStringField;
        oraCBAGENT_TO : TStringField;
        oraCBAGENT_FROM_ACC : TFloatField;
        oraCBAGENT_TO_ACC : TFloatField;
        acCopy : TAction;
        acXLS : TAction;
        TBItem3 : TTBItem;
        TBItem4 : TTBItem;
        oraVypDEBET : TFloatField;
        oraVypKREDIT : TFloatField;
        oraVypID_CODE : TFloatField;
        acSendNSI : TAction;
        TBItem6 : TTBItem;
        TBSeparatorItem2 : TTBSeparatorItem;
        acVypRTF : TAction;
        ImageList3 : TImageList;
        TBItem9 : TTBItem;
        qSearch : TOracleQuery;
        oraProps : TOracleQuery;
        oraCBLUK_RN : TStringField;
        oraCb_innLUK_RN : TStringField;
        acDelete : TAction;
        TBItem5 : TTBItem;
        oraVypBO_RESERV : TStringField;
        oraInsOprs : TOracleQuery;
        Image1 : TImage;
        mteCatalog : TMemTableEh;
        dsdCatalog : TDataSetDriverEh;
        dsCat : TDataSource;
        mteCatalogRN : TFloatField;
        mteCatalogCRN : TFloatField;
        mteCatalogNAME : TStringField;
        ImageList4 : TImageList;
        cbFilter : TComboBox;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    Panel3: TPanel;
    Splitter6: TSplitter;
    Splitter5: TSplitter;
    Panel5: TPanel;
    Label8: TLabel;
    BitBtn3: TBitBtn;
    btnTop: TButton;
    cbColor: TCheckBox;
    GroupBox2: TGroupBox;
    fd: TFilenameEdit;
    btnOpen: TBitBtn;
    btnLoad: TBitBtn;
    cb2: TCheckBox;
    cb1: TCheckBox;
    cbEmailRecip: TComboBox;
    cbDecode: TCheckBox;
    DBGridEh4: TDBGridEh;
    memo: TListView;
    PageControl1: TPageControl;
    tsImport2Parus: TTabSheet;
    tsExportFromParus: TTabSheet;
    Panel2: TPanel;
    PagesCB: TPageControl;
    tsCBFile: TTabSheet;
    re: TMemo;
    tsVyp: TTabSheet;
    Panel6: TPanel;
    Label4: TLabel;
    bv_sin: TLabel;
    Label9: TLabel;
    bv_in: TLabel;
    Label11: TLabel;
    bv_out: TLabel;
    Label15: TLabel;
    bv_sout: TLabel;
    DBGridEh2: TDBGridEh;
    tsLoad: TTabSheet;
    Splitter7: TSplitter;
    DBGridEh1: TDBGridEh;
    DBGridEh3: TDBGridEh;
    Panel4: TPanel;
    btnToParus: TBitBtn;
    Panel7: TPanel;
    egrCatPay: TDBGridEh;
    Splitter1: TSplitter;
    Memo1: TMemo;
    Panel8: TPanel;
    p2b: TMemo;
    egrPay: TDBGridEh;
    Splitter2: TSplitter;
    oraCatPay: TOracleDataSet;
    mteCatPay: TMemTableEh;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField4: TStringField;
    dseCatPay: TDataSetDriverEh;
    dsCatPay: TDataSource;
    oraPay: TOracleDataSet;
    dsPay: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    oraPayNAME_FROM: TStringField;
    oraPayACC_FROM: TStringField;
    oraPayNAME_TO: TStringField;
    oraPayINN_TO: TStringField;
    oraPayACC_TO: TStringField;
    oraPayBIK_TO: TStringField;
    acExport2CB: TAction;
    acRefreshExport: TAction;
    oraPayUpd: TOracleQuery;
    oraPayFU: TOracleDataSet;
    oraPayDPAY_DATE: TDateTimeField;
    oraPaySPAY_INFO: TStringField;
    oraPayNPAY_SUM: TFloatField;
    oraPayNCRN: TFloatField;
    oraPayNRN: TFloatField;
    oraPayNN: TOracleQuery;
    cbGenNumb: TCheckBox;
    oraPaySDOCNUMB: TStringField;
    adoCBDB: TADODataSet;
    adoCBDBDOC_DATE: TDateTimeField;
    adoCBDBC_INN: TWideStringField;
    adoCBDBA_INN: TWideStringField;
    adoCBDBC_BANK_KS: TWideStringField;
    adoCBDBA_BANK_KS: TWideStringField;
    adoCBDBC_ACC: TWideStringField;
    adoCBDBA_ACC: TWideStringField;
    adoCBDBC_BANK_BIC: TWideStringField;
    adoCBDBA_BANK_BIC: TWideStringField;
    adoCBDBSUMMA: TBCDField;
    adoCBDBA_NAME: TWideStringField;
    adoCBDBC_NAME: TWideStringField;
    adoCBDBA_BANK_NAME: TWideStringField;
    adoCBDBC_BANK_NAME: TWideStringField;
    adoCBDBDOC_NUM: TFloatField;
    adoCBDBPRIORITY: TIntegerField;
    adoCBDBNOTE: TMemoField;
    oraCb_innVID: TFloatField;
    BitBtn4: TBitBtn;
    acPKB: TAction;
    oraVypBO_BANK_S: TStringField;
    oraVypBO_BANK_R: TStringField;
    oraVypBO_OCHER: TStringField;
    oraVypBO_DT1: TDateTimeField;
    procedure acPKBExecute(Sender: TObject);
    procedure acExport2CBExecute(Sender: TObject);
    procedure egrCatPayColumns0GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    procedure acRefreshExportExecute(Sender: TObject);
    procedure mteCatPayAfterScroll(DataSet: TDataSet);
        Procedure acOpenFileExecute( Sender : TObject );
        Procedure acParusExecute( Sender : TObject );
        Procedure FormCreate( Sender : TObject );
        Procedure FormClose( Sender : TObject; Var Action : TCloseAction );
        Procedure acFilterExecute( Sender : TObject );
        Procedure acPrintExecute( Sender : TObject );
        Procedure lcACCChange( Sender : TObject );
        Procedure DBGridEh22GetCellParams( Sender : TObject; Column : TColumnEh; AFont : TFont; Var Background : TColor;
                                           State : TGridDrawState );
        Procedure DBGridEh11GetCellParams( Sender : TObject; Column : TColumnEh; AFont : TFont; Var Background : TColor;
                                           State : TGridDrawState );
        Procedure DBGridEh33GetCellParams( Sender : TObject; Column : TColumnEh; AFont : TFont; Var Background : TColor;
                                           State : TGridDrawState );
        Procedure LoadParus( z : integer );
        Procedure oraInsertArrayError( Sender : TOracleQuery; Index, ErrorCode : Integer; Const ErrorMessage : String;
                                       Var Continue : Boolean );
        Procedure acCopyExecute( Sender : TObject );
        Procedure acXLSExecute( Sender : TObject );
        Procedure acSendNSIExecute( Sender : TObject );
        Procedure acVypRTFExecute( Sender : TObject );
        Procedure btnTopClick( Sender : TObject );
        Procedure WriteEvent( Tag : String; Idx : integer );
        Procedure LoadEXP( );
        Procedure acLoadORAExecute( Sender : TObject );
        Procedure LoadTXT( );
        Procedure LoadR( );
        Procedure Loadmdb( );
        Procedure memo1GetItemParams( Sender : TObject; Item : TListItem; AFont : TFont; Var Background : TColor;
                                      Var State : TCustomDrawState );
        Procedure acDeleteExecute( Sender : TObject );
        Procedure FormDestroy( Sender : TObject );
        procedure DBGridEh2Columns0GetCellParams( Sender : TObject; EditMode : Boolean; Params : TColCellParamsEh );
        procedure DBGridEh4Columns0GetCellParams( Sender : TObject; EditMode : Boolean; Params : TColCellParamsEh );

        protected
            Procedure WMDropFiles( Var Msg : TMessage ); message wm_DropFiles;

        private
        { Private declarations }
        public
    { Public declarations }
    End;

Var
    cb2parus : Tcb2parus;
    pbStatus : TProgressBar;

//  M       : TWMScroll;
Implementation

{$R *.dfm}

Function GetPanelRect : TRect;
Begin
    SendMessage( cb2parus.sbBank.Handle, SB_GETRECT, 0, integer( @result ) );
End;

Function NPos( Const C : String; S : String; N : Integer ) : Integer;
Var
    I, P, K : Integer;

Begin
    Result := 0;
    K := 0;

    For I := 1 To N Do
        Begin
            P := Pos( C, S );
            Inc( K, P );

            If ( I = N ) And ( P > 0 ) Then
                Begin
                    Result := K;
                    Exit;
                End;

            If P > 0 Then
                Delete( S, 1, P )
            Else
                Exit;
        End;
End;

Function GetVal( st : String; begPos : integer; endPos : integer ) : String;
Var
    stemp : String;
    i : integer;

Begin
    stemp := '';

    If endpos = 99 Then
        For i := npos( '|', st, begPos ) + 1 To length( st )Do sTemp := sTemp + st[ i ]
    Else
        For i := npos( '|', st, begPos ) + 1 To npos( '|', st, endPos ) - 1 Do sTemp := sTemp + st[ i ];

    GetVal := stemp;
End;

Procedure Tcb2parus.WMDropFiles( Var Msg : TMessage );
Var
    Filename : Array [ 0..256 ] Of Char;

Begin { �������� ���������� ������(������ ������)
  nCount := DragQueryFile( msg.WParam, $FFFFFFFF,      acFileName, cnMaxFileNameLen);}
    { �������� ��� ������� ����� }
    DragQueryFile( THandle( Msg.WParam ), 0, { ��� ����� ����� } Filename, SizeOf( Filename ) );
    { ��������� ��� }
    fd.FileName := LowerCase( StrPas( FileName ) );
    DragFinish( THandle( Msg.WParam ) ); { ������ ��������� � ���������� �������� }
End;

Procedure Tcb2parus.WriteEvent( Tag : String; Idx : integer );
Begin
    memo.Items.BeginUpdate;

    With memo.Items.Add Do
        Begin
            Caption := Tag;
            ImageIndex := Idx;
        End;

    memo.Items.EndUpdate;
End;

Procedure Tcb2parus.acOpenFileExecute( Sender : TObject );
Var
    i : Integer;
    s1, s2 : AnsiString;
    t : TStrings;
    sACC, sDAT, s3 : String[ 255 ];

Begin
    If trim( fd.FileName ) = '' Then
        fd.DoClick;                   //���� �� ������� ��� ����� ��������� ������

    If trim( fd.FileName ) <> '' Then //���� �� ������� ��� ����� ������ �� ������
        If FileExists( fd.FileName )Then
            Begin
                WriteEvent( DateTimeToStr( Now ) + ': ������� ���� ' + fd.FileName + '.', 18 );
                t := TStringList.Create;
                t.LoadFromFile( fd.FileName );
                pbStatus.Min := 0;
                pbStatus.Max := t.Count - 1;
                pbStatus.Visible := true;
                i := 0;

                While i <= t.Count - 1 Do
                    Begin
                        s1 := t[ i ];
                        s2 := t[ i ];

                        if cbDecode.Checked then
                            oemtocharbuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );

                        If ( trim( s2 ) <> '#UPDATE' ) And ( trim( s2 ) <> '#ANSWERS' ) Then
                            Begin
                                t[ i ] := s2;
                                i := i + 1;
                            End
                        Else
                            t.Delete( i );

                        pbStatus.Position := i;
                    End;
            End;

    re.lines := t;
    t.Destroy;
    WriteEvent( DateTimeToStr( Now ) + ': ��������� ' + trim( inttostr( i ) ) + ' �����.', 26 );

    If MessageDlg( '������� ����?', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
        Begin // ������� ������
            WriteEvent( DateTimeToStr( Now ) + ': ���� ' + fd.FileName + ' ������!', 2 );
            DeleteFile( fd.FileName );
        end;

    pbStatus.Visible := false;
    sACC := '';
    sDAT := '';
    if pos('.mdb',fd.FileName) = 0 then
    If trim( re.Lines[ 0 ] ) = '1CClientBankExchange' Then
        Begin
            // ����
            sACC := StrUtils.rightstr( trim( re.lines[ 6 ] ), 20 );
            oraACC.SearchRecord( 'bv_acc', trim( sACC ), [ srFromBeginning ] );
            lcAcc.Value := oraACC.FieldByName( 'rn' ).AsString;
            // ����
            sDAT := StrUtils.rightstr( trim( re.lines[ 5 ] ), 10 );
            edDate.Date := StrToDate( trim( sDAT ) );
        End
    else

        //If (LowerCase(RightStr(fd.FileName, 3)) <> 'txt') Then
        Begin
            s3 := trim( re.lines[ 1 ] );

            // ����
            For i := nPos( '#', s3, 1 ) + 1 To npos( '#', s3, 2 ) - 1 Do sACC := sACC + s3[ i ];

            oraACC.SearchRecord( 'bv_acc', trim( sACC ), [ srFromBeginning ] );
            lcAcc.Value := oraACC.FieldByName( 'rn' ).AsString;

            // ����
            //For i := nPos( '#', s3, 2 ) + 1 To npos( '#', s3, 3 ) - 1 Do sDAT := sDAT + s3[ i ];

            //edDate.Date := StrToDate( trim( sDAT ) );
        End;

    PagesCB.ActivePage := tsCBFile;
    btnLoad.Enabled := True;
End;

Procedure Tcb2parus.LoadTXT( );
Var
    i: integer;
    summ, stemp, s2 : ansistring;
    sACC, sDAT : String[ 255 ];
    empty : boolean;

Label l1;

Begin
    i := 0;

    l1 : sACC := '';

    sDAT := '';
    q1.clear;
    // ����
    s2 := trim( re.lines[ i + 1 ] );
    sacc := StrUtils.RightStr( s2, 20 );
    oraACC.SearchRecord( 'bv_acc', trim( sACC ), [ srFromBeginning ] );
    lcAcc.Value := oraACC.FieldByName( 'rn' ).AsString;
    // ����
    s2 := trim( re.lines[ i ] );
    stemp := RightStr( s2, 10 );
    sDAT := leftstr( stemp, 2 ) + '.' + copy( stemp, 4, 2 ) + '.' + RightStr( stemp, 4 );
    edDate.Date := StrToDate( trim( sDAT ) );

    pbStatus.Visible := true;
    pbStatus.Min := 0;
    pbStatus.Max := round( re.Lines.Count - 1 );
    i := i + 2;

    While( StrUtils.LeftStr( re.lines[ i ], 4 ) <> '����' ) And ( i <= re.Lines.Count ) Do
        Begin
            s2 := trim( re.lines[ i ] );

            If s2 <> '' Then
                Begin //�� ������ ������
                    summ := GetVal( s2, 2, 3 );

                    qSearch.ClearVariables;
                    qSearch.SetVariable( ':acc', sacc );
                    qSearch.SetVariable( ':ddate', FormatDateTime( 'dd.mm.yyyy', StrToDate( sDAT ) ) );
                    qSearch.SetVariable( ':summ', strtofloat( GetVal( s2, 6, 7 ) ) );
                    qSearch.SetVariable( ':num', trim(GetVal( s2, 1, 2 )) );
                    qSearch.SetVariable( ':nazn', trim(GetVal( s2, 7, 8 )) );

                    If summ = '�' Then
                        Begin
                            qSearch.SetVariable( ':acc_r', sacc );
                            qSearch.SetVariable( ':acc_s', GetVal( s2, 5, 6 ) );
                        End
                    Else
                        Begin
                            qSearch.SetVariable( ':acc_s', sacc );
                            qSearch.SetVariable( ':acc_r', GetVal( s2, 5, 6 ) );
                        End;
                    qSearch.Execute;

                    If qSearch.eof Then
                        empty := true
                    Else
                        empty := false;

                    qSearch.Close;

                    If empty Then
                        Begin //��� ����� ������
                            q1.SQL.add( 'insert into pvz_bnoprs (' );
                            q1.SQL.add( 'BO_DT, BO_INN_R, BO_INN_S,' );
                            q1.SQL.add( 'BO_KS_R, BO_KS_S, BO_ACC_R, BO_ACC_S,' );
                            q1.SQL.add( 'BO_BIK_R, BO_BIK_S, BO_SUMM, BO_SENDER, BO_RECEIVER,' );
                            q1.SQL.add( 'BO_BANK_S, BO_BANK_R, BO_NUM, BO_DT1, BO_DT2,' );
                            q1.SQL.add( 'BO_OCHER, BO_RESERV, BO_NAZN, BO_VID, BO_RN_PARUS,' );
                            q1.SQL.add( 'ID, ID_DGV, BO_NUMSTR, ACCKEY, ID_CODE)' );
                            q1.SQL.add( 'values (' );
                            q1.SQL.add(
                                'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy',
                                                               StrToDate( sdat ) ) + ''',''dd.mm.yyyy''),' ); //BO_DT

                            If summ = '�' Then
                                q1.SQL.add( '''1101033100'',' )
                            Else
                                q1.SQL.add( '''' + GetVal( s2, 9, 10 ) + ''',' ); //BO_INN_R

                            If summ = '�' Then
                                q1.SQL.add( '''' + GetVal( s2, 9, 10 ) + ''',' )
                            Else
                                q1.SQL.add( '''1101033100'',' ); //BO_INN_S

                            If summ = '�' Then
                                q1.SQL.add( 'null,' )
                            Else
                                q1.SQL.add( '''' + GetVal( s2, 3, 4 ) + ''',' ); //BO_KS_R

                            If summ = '�' Then
                                q1.SQL.add( '''' + GetVal( s2, 3, 4 ) + ''',' )
                            Else
                                q1.SQL.add( 'null,' ); //BO_KS_s

                            If summ = '�' Then
                                q1.SQL.add( '''' + sacc + ''',' )
                            Else
                                q1.SQL.add( '''' + GetVal( s2, 5, 6 ) + ''',' ); //BO_ACC_R

                            If summ = '�' Then
                                q1.SQL.add( '''' + GetVal( s2, 5, 6 ) + ''',' )
                            Else
                                q1.SQL.add( '''' + sacc + ''',' ); //BO_ACC_S

                            If summ = '�' Then
                                q1.SQL.add( '''' + oraACC.Fieldbyname( 'bv_bik' ).asString + ''',' )
                            Else
                                q1.SQL.add( '''' + GetVal( s2, 4, 5 ) + ''',' ); //BO_BIK_R

                            If summ = '�' Then
                                q1.SQL.add( '''' + GetVal( s2, 4, 5 ) + ''',' )
                            Else
                                q1.SQL.add( '''' + oraACC.Fieldbyname( 'bv_bik' ).asString + ''',' );    //BO_BIK_S

                            q1.SQL.add( 'to_number(''' + GetVal( s2, 6, 7 ) + ''',''999999999.99''),' ); //BO_SUMM

                            If summ = '�' Then
                                q1.SQL.add( '''' + GetVal( s2, 10, 99 ) + ''',' )
                            Else
                                q1.SQL.add( '''' + oraACC.Fieldbyname( 'city' ).asString + ''',' ); //BO_SENDER

                            If summ = '�' Then
                                q1.SQL.add( '''' + oraACC.Fieldbyname( 'city' ).asString + ''',' )
                            Else
                                q1.SQL.add( '''' + GetVal( s2, 10, 99 ) + ''',' );                            //BO_RECEIVER

                            q1.SQL.add( 'null,' );                                                            //BO_BANK_S
                            q1.SQL.add( 'null,' );                                                            //BO_BANK_R
                            q1.SQL.add( '''' + GetVal( s2, 1, 2 ) + ''',' );                                  //BO_NUM
                            q1.SQL.add(
                                'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy',
                                                               StrToDate( sdat ) ) + ''',''dd.mm.yyyy''),' ); //BO_DT1
                            q1.SQL.add(
                                'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy',
                                                               StrToDate( sdat ) ) + ''',''dd.mm.yyyy''),' ); //BO_DT2
                            q1.SQL.add( '''' + GetVal( s2, 0, 1 ) + ''',' );                                  //BO_OCHER

                            If length( GetVal( s2, 8, 9 ) ) < 13 Then
                                stemp := copy( GetVal( s2, 8, 9 ), 4, length( GetVal( s2, 8, 9 ) ) )
                            Else
                                stemp := copy( GetVal( s2, 8, 9 ), 4, 10 );

                            q1.SQL.add( '''' + stemp + ''',' );              //BO_RESERV
                            q1.SQL.add( '''' + trim(GetVal( s2, 7, 8 )) + ''',' ); //BO_NAZN

                            If summ = '�' Then
                                q1.SQL.add( '1,' )
                            Else
                                q1.SQL.add( '-1,' );                                          //BO_VID

                            q1.SQL.add( '0,' );                                               //BO_RN_PARUS
                            q1.SQL.add( '''' + oraACC.Fieldbyname( 'id' ).asString + ''',' ); //ID
                            q1.SQL.add( 'null,' );                                            //ID_DGV
                            q1.SQL.add( 'null,' );                                            //BO_NUMSTR
                            q1.SQL.add( '''' + sacc + ''',' );                                //ACCKEY
                            q1.SQL.add( 'null)' );                                            //ID_CODE
                            q1.Execute;
                            WriteEvent(
                                DateTimeToStr( Now ) + ': ��������� ������ � ������� ' + inttostr(
                                    i + 1 ) + ' ������ ' + inttostr( i ) + '.',
                                3 );
                            q1.SQL.Clear;
                            q1.Session.Commit;
                        End; //��� ����� ������
                End;         // �� ������ ������

            i := i + 1;
            pbStatus.Position := i;
        End;

    If i < re.Lines.Count Then
        Goto l1;

    pbStatus.Visible := false;
    q1.Session.Commit;
    acFilterExecute( self );
End;

Procedure Tcb2parus.LoadEXP( );
Var
    i, j, k, z : integer;
    s, summ, stemp : ansistring;
    sACC, sSIN, sDAT, s2, sOLD : String[ 255 ];
    nSIN, nSOUT, nRA, nPR : double;
    empty : boolean;

Begin
    // ��������� ��������� exp
    sACC := '';
    sSIN := '';
    sDAT := '';
    nSOUT := 0;
    nRA := 0;
    nPR := 0;
    q1.clear;
    s2 := trim( re.lines[ 1 ] );

    // ����
    For k := nPos( '#', s2, 1 ) + 1 To npos( '#', s2, 2 ) - 1 Do sACC := sACC + s2[ k ];

    // ����
    For k := nPos( '#', s2, 2 ) + 1 To npos( '#', s2, 3 ) - 1 Do sDAT := sDAT + s2[ k ];

    // �������� ������
    For z := npos( '#', s2, 3 ) + 1 To npos( '#', s2, 4 ) - 1 Do
        If s2[ z ] <> '''' Then
            sSIN := sSIN + s2[ z ];

    nSIN := strtofloat( trim( sSIN ) );
    nSOUT := nSIN;
    q1.Clear;

    If trim( lcACC.DisplayValue ) = trim( sACC )Then // �������� � ��� �� ������ ��������
        //  if StrToFloat(sOLD)=nSIN then //�������� ��������� ������
        If StrToDate( trim( sDAT ) ) = edDate.Date Then
            Begin
                // �������� ��� ������� �� �� ����
                Begin
                    q1.SQL.Clear;
                    i := 0;
                    pbStatus.Visible := true;
                    pbStatus.Min := 0;
                    pbStatus.Max := round( re.Lines.Count / ( 25 ) );

                    While( i * 21 + 4 ) + ( i * 3 ) < re.Lines.Count Do
                        Begin
                            qSearch.ClearVariables;
                            qSearch.SetVariable( ':acc', trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) ] ) );
                            qSearch.SetVariable( ':ddate',
                                                 FormatDateTime( 'dd.mm.yyyy',
                                                                 StrToDate(
                                                                     trim( re.Lines[ ( i * 21 + 4 ) + (
                                                                                         i * 3 ) + 1 ] ) ) ) ); //BO_DT
                            qSearch.SetVariable( ':acc_r', trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 12 ] ) );
                            qSearch.SetVariable( ':acc_s', trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 6 ] ) );
                            s2 := trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 18 ] );
                            summ := '';

                            For z := 1 To length( s2 )Do
                                If s2[ z ] <> '''' Then
                                    summ := summ + s2[ z ];

                            qSearch.SetVariable( ':summ', strtofloat( trim( summ ) ) );
                            qSearch.SetVariable( ':num', trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 5 ] ) );

                            {      qSearch.sql[2]:='WHERE trim(ACCKEY)='''+trim(re.Lines[(i*21+4)+(i*3)])+'''';
                                  qSearch.sql[3]:='AND (BO_DT)=TO_DATE('''+FormatDateTime('dd.mm.yyyy',StrToDate(trim(re.Lines[(i*21+4)+(i*3)+1])))+''',''dd.mm.yyyy'')';//BO_DT
                                  qSearch.sql[4]:='AND trim(BO_ACC_R)='''+trim(re.Lines[(i*21+4)+(i*3)+12])+'''';
                                  qSearch.sql[5]:='AND trim(BO_ACC_S)='''+trim(re.Lines[(i*21+4)+(i*3)+6])+'''';
                                  s2:=trim(re.Lines[(i*21+4)+(i*3)+18]);
                                  summ:='';
                                  for z:=1 to length(s2) do if s2[z]<>'''' then summ:=summ+s2[z];
                                  qSearch.sql[6]:='AND (BO_SUMM)=to_number('''+trim(summ)+''',''999999999.99'')';
                                  qSearch.sql[7]:='AND trim(BO_NUM)='''+trim(re.Lines[(i*21+4)+(i*3)+5])+''''; }
                            qSearch.Execute;

                            If qSearch.eof Then
                                empty := true
                            Else
                                empty := false;

                            qSearch.Close;

                            If empty Then
                                Begin //��� ����� ������
                                    q1.SQL.add( 'insert into pvz_bnoprs (' );
                                    q1.SQL.add( 'BO_DT, BO_INN_R, BO_INN_S,' );
                                    q1.SQL.add( 'BO_KS_R, BO_KS_S, BO_ACC_R, BO_ACC_S,' );
                                    q1.SQL.add( 'BO_BIK_R, BO_BIK_S, BO_SUMM, BO_SENDER, BO_RECEIVER,' );
                                    q1.SQL.add( 'BO_BANK_S, BO_BANK_R, BO_NUM, BO_DT1, BO_DT2,' );
                                    q1.SQL.add( 'BO_OCHER, BO_RESERV, BO_NAZN, BO_VID, BO_RN_PARUS,' );
                                    q1.SQL.add( 'ID, ID_DGV, BO_NUMSTR, ACCKEY, ID_CODE)' );
                                    q1.SQL.add( 'values (' );
                                    q1.SQL.add(
                                        'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy',
                                                                       StrToDate(
                                                                           trim( re.Lines[ ( i * 21 + 4 ) + (
                                                                                               i * 3 ) + 1 ] ) ) )
                                            + ''',''dd.mm.yyyy''),' );                                   //BO_DT

                                    If length( trim( re.Lines[ ( i * 21 + 4 ) + (
                                                                   i * 3 ) + 14 ] ) ) > 12 Then          //��� ������ 12 ��������
                                        q1.SQL.add( '''' + LeftStr( trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 14 ] ),
                                                                    12 ) + ''',' )                       //BO_INN_R
                                    Else
                                        q1.SQL.add(
                                            '''' + trim(
                                                re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 14 ] ) + ''',' ); //BO_INN_R

                                    If length( trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 8 ] ) ) > 12 Then
                                        Begin                                                            //��� ������ 12 ��������
                                            WriteEvent(
                                                '������ ' + trim(
                                                    inttostr( ( i * 21 + 4 ) + (
                                                                  i * 3 ) + 8 ) ) + ': �������� ��� ' + trim(
                                                    re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 8 ] ) + '.',
                                                16 );
                                            q1.SQL.add(
                                                '''' + LeftStr( trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 8 ] ),
                                                                12 ) + ''',' )
                                        End                                                                   //BO_INN_S
                                    Else
                                        q1.SQL.add(
                                            '''' + trim(
                                                re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 8 ] ) + ''',' );       //BO_INN_S

                                    q1.SQL.add(
                                        '''' + trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 16 ] ) + ''',' ); //BO_KS_R
                                    q1.SQL.add(
                                        '''' + trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 10 ] ) + ''',' ); //BO_KS_s
                                    q1.SQL.add(
                                        '''' + trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 12 ] ) + ''',' ); //BO_ACC_R
                                    q1.SQL.add(
                                        '''' + trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 6 ] ) + ''',' );  //BO_ACC_S
                                    q1.SQL.add(
                                        '''' + trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 15 ] ) + ''',' ); //BO_BIK_R
                                    q1.SQL.add(
                                        '''' + trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 9 ] ) + ''',' );  //BO_BIK_S
                                    s2 := trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 18 ] );
                                    summ := '';

                                    For z := 1 To length( s2 )Do
                                        If s2[ z ] <> '''' Then
                                            summ := summ + s2[ z ];

                                    q1.SQL.add( 'to_number(''' + trim( summ ) + ''',''999999999.99''),' ); //BO_SUMM
                                    s2 := trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 7 ] );
                                    stemp := '';

                                    For z := 1 To length( s2 )Do
                                        If s2[ z ] = '''' Then
                                            stemp := stemp + '"'
                                        Else
                                            stemp := stemp + s2[ z ];           //������� " �� ��������

                                    q1.SQL.add( '''' + trim( stemp ) + ''',' ); //BO_SENDER
                                    s2 := trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 13 ] );
                                    stemp := '';

                                    For z := 1 To length( s2 )Do
                                        If s2[ z ] = '''' Then
                                            stemp := stemp + '"'
                                        Else
                                            stemp := stemp + s2[ z ];           //������� " �� ��������

                                    q1.SQL.add( '''' + trim( stemp ) + ''',' ); //BO_RECEIVER
                                    s2 := trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 11 ] );
                                    stemp := '';

                                    For z := 1 To length( s2 )Do
                                        If s2[ z ] = '''' Then
                                            stemp := stemp + '"'
                                        Else
                                            stemp := stemp + s2[ z ];

                                    q1.SQL.add( '''' + trim( stemp ) + ''',' ); //BO_BANK_S
                                    s2 := trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 17 ] );
                                    stemp := '';

                                    For z := 1 To length( s2 )Do
                                        If s2[ z ] = '''' Then
                                            stemp := stemp + '"'
                                        Else
                                            stemp := stemp + s2[ z ];

                                    q1.SQL.add( '''' + trim( stemp ) + ''',' );                               //BO_BANK_R
                                    q1.SQL.add(
                                        '''' + trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 5 ] ) + ''',' );  //BO_NUM
                                    q1.SQL.add(
                                        'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy',
                                                                       StrToDate(
                                                                           trim( re.Lines[ ( i * 21 + 4 ) + (
                                                                                               i * 3 ) + 1 ] ) ) )
                                            + ''',''dd.mm.yyyy''),' );                                        //BO_DT1
                                    q1.SQL.add(
                                        'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy',
                                                                       StrToDate(
                                                                           trim( re.Lines[ ( i * 21 + 4 ) + (
                                                                                               i * 3 ) + 1 ] ) ) )
                                            + ''',''dd.mm.yyyy''),' );                                        //BO_DT2
                                    q1.SQL.add(
                                        '''' + trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 20 ] ) + ''',' ); //BO_OCHER
                                    q1.SQL.add( 'null,' );                                                    //BO_RESERV
                                    s2 := trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 21 ] );
                                    stemp := '';

                                    For z := 1 To length( s2 )Do
                                        If s2[ z ] = '''' Then
                                            stemp := stemp + '"'
                                        Else
                                            stemp := stemp + s2[ z ];

                                    q1.SQL.add( '''' + trim( stemp ) + ''',' );                          //BO_NAZN

                                    If trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) + 12 ] ) = trim( sACC )Then
                                        q1.SQL.add( '1,' )                                               //BO_VID
                                    Else
                                        q1.SQL.add( '-1,' );                                             //BO_VID

                                    q1.SQL.add( '0,' );                                                  //BO_RN_PARUS
                                    q1.SQL.add( '''' + oraACC.Fieldbyname( 'id' ).asString + ''',' );    //ID
                                    q1.SQL.add( 'null,' );                                               //ID_DGV
                                    q1.SQL.add( 'null,' );                                               //BO_NUMSTR
                                    q1.SQL.add(
                                        '''' + trim( re.Lines[ ( i * 21 + 4 ) + ( i * 3 ) ] ) + ''',' ); //ACCKEY
                                    q1.SQL.add( 'null)' );                                               //ID_CODE
                                    q1.Execute;
                                    q1.SQL.Clear;
                                    q1.Session.Commit;
                                    WriteEvent(
                                        DateTimeToStr( Now ) + ': ��������� ������ � ������� ' + inttostr( i + 1 )
                                            + ' ������ c '
                                            + inttostr( ( i * 21 + 4 ) + ( i * 3 ) ) + ' �� ' + inttostr( ( i * 21 + 4 )
                                                                                                              + ( i
                                                                                                                      * 3 )
                                                                                                              + 21 )
                                            + '.',
                                        3 );
                                End; //��� ����� ������

                            i := i + 1;
                            pbStatus.Position := i;
                        End;

                    pbStatus.Visible := false;
                    q1.Session.Commit;
                End
            End
        Else
            Application.MessageBox( '� ������� �� �� ����.', '��������!!!', mb_OK )
    //  else
    //  Application.MessageBox('�� ��������� ������ �� ���������� ������ � �����������.', '��������!!!', mb_OK)
    Else
        Begin
            Application.MessageBox( '�� ��������� ��������� ������� ���� � �����������.', '��������!!!', mb_OK );
            WriteEvent( DateTimeToStr( Now ) + ': �� ��������� ������ ����!', 10 );
        End;

    acFilterExecute( self );
End;

Procedure Tcb2parus.LoadR( );
Var
    i, z, c1, c2 : integer;
    stemp : ansistring;
    sACC, sSIN, sDAT, s2, s3 : String[ 255 ];
    empty : boolean;

Begin
    // ��������� ��������� r
    sACC := '';
    sSIN := '';
    sDAT := '';
    // ����
    sACC := strutils.RightStr( trim( re.lines[ 6 ] ), 20 );
    // ����
    sDAT := strutils.RightStr( trim( re.lines[ 5 ] ), 10 );
    // �������� ������

    If trim( lcACC.DisplayValue ) = trim( sACC )Then // �������� � ��� �� ������ ��������
        //  if StrToFloat(sOLD)=nSIN then //�������� ��������� ������
        If StrToDate( trim( sDAT ) ) = edDate.Date Then
            Begin
                // �������� ��� ������� �� �� ����
                Begin
                    q1.SQL.Clear;
                    i := 0;
                    pbStatus.Visible := true;
                    pbStatus.Min := 0;
                    pbStatus.Max := round( ( re.Lines.Count - 15 ) / 37 );

                    While( i * 37 + 15 ) <= re.Lines.Count - 3 Do
                        Begin
                            qSearch.ClearVariables;
                            qSearch.SetVariable( ':acc', strutils.RightStr( trim( re.lines[ 6 ] ), 20 ) );
                            qSearch.SetVariable( ':ddate',
                                                 FormatDateTime( 'dd.mm.yyyy',
                                                                 StrToDate( strutils.RightStr( trim( re.lines[ 5 ] ),
                                                                                               10 ) ) ) ); //BO_DT
                            qSearch.SetVariable( ':acc_r',
                                                 strutils.RightStr( trim( re.Lines[ ( i * 37 + 15 ) + 19 ] ), 20 ) );

                            If trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 19 ] ), 20, 20 ) ) = trim( sACC )Then
                                qSearch.SetVariable( ':acc_s',
                                                     trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 9 ] ), 20, 20 ) ) )
                            else
                                qSearch.SetVariable( ':acc_s',
                                                     trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 10 ] ), 20, 20 ) ) );

                            qSearch.SetVariable( ':summ',
                                                 strtofloat(
                                                     trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 4 ] ), 7, 20 ) ) ) );
                            qSearch.SetVariable( ':num',
                                                 trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 2 ] ), 7, 20 ) ) );
                            s2 := trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 36 ] ), 19, 255 ) );
                                    stemp := '';
                                    s3 := s2[ 1 ];

                                    For z := 1 To length( s2 )Do
                                        begin
                                            If s2[ z ] = '''' Then
                                                stemp := stemp + '"'
                                            Else
                                                if ( s2[ z ] = ' ' ) and ( s2[ z ] = s3 ) then
                                                else
                                                    stemp := stemp + s2[ z ];
                                            s3 := s2[ z ];
                                        end;

                            qSearch.SetVariable( ':nazn',trim( stemp ) );
                            qSearch.Execute;

                            If qSearch.eof Then
                                empty := true
                            Else
                                empty := false;

                            qSearch.Close;

                            If empty Then
                                Begin //��� ����� ������
                                    q1.SQL.add( 'insert into pvz_bnoprs (' );
                                    q1.SQL.add( 'BO_DT, BO_INN_R, BO_INN_S,' );
                                    q1.SQL.add( 'BO_KS_R, BO_KS_S, BO_ACC_R, BO_ACC_S,' );
                                    q1.SQL.add( 'BO_BIK_R, BO_BIK_S, BO_SUMM, BO_SENDER, BO_RECEIVER,' );
                                    q1.SQL.add( 'BO_BANK_S, BO_BANK_R, BO_NUM, BO_DT1, BO_DT2,' );
                                    q1.SQL.add(
                                        'BO_OCHER, BO_RESERV, BO_NAZN, BO_VID, BO_RN_PARUS,' ); //bo_reserv ����� ������������ ���
                                    q1.SQL.add( 'ID, ID_DGV, BO_NUMSTR, ACCKEY, ID_CODE)' );
                                    q1.SQL.add( 'values (' );
                                    q1.SQL.add(
                                        'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy',
                                                                       StrToDate(
                                                                           strutils.RightStr( trim( re.lines[ 5 ] ),
                                                                                              10 ) ) )
                                            + ''',''dd.mm.yyyy''),' ); //BO_DT
                                    {                  If length(trim(copy(trim(re.Lines[(i * 37+15) + 16]),15,14))) > 12 Then //��� ������ 12 ��������
                                                        q1.SQL.add('''' + LeftStr(trim(copy(trim(re.Lines[(i * 37+15) + 16]),15,14)), 12) + ''',') //BO_INN_R
                                                      Else}
                                    q1.SQL.add( '''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 16 ] ), 15,
                                                                   12 ) ) + ''',' ); //BO_INN_R
                                    {									If length(trim(re.Lines[(i * 37+15) + 8])) > 12 Then Begin //��� ������ 12 ��������
                                                                                WriteEvent('������ ' + trim(inttostr((i * 37+15) + 8)) + ': �������� ��� ' + trim(re.Lines[(i * 37+15) + 8]) + '.', 16);
                                                                                q1.SQL.add('''' + LeftStr(trim(re.Lines[(i * 37+15) + 8]), 12) + ''',')
                                                        End //BO_INN_S
                                                      Else}
                                    If trim(
                                        copy( trim( re.Lines[ ( i * 37 + 15 ) + 19 ] ), 20, 20 ) ) = trim( sACC )Then
                                        q1.SQL.add( '''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 6 ] ), 15,
                                                                       12 ) ) + ''',' )                  //BO_INN_S
                                    else
                                        q1.SQL.add( '''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 7 ] ), 15,
                                                                       12 ) ) + ''',' );                 //BO_INN_S

                                    q1.SQL.add( '''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 23 ] ), 19,
                                                                   20 ) ) + ''',' );                     //BO_KS_R

                                    If trim(
                                        copy( trim( re.Lines[ ( i * 37 + 15 ) + 19 ] ), 20, 20 ) ) = trim( sACC )Then
                                        q1.SQL.add( '''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 13 ] ), 19,
                                                                       20 ) ) + ''',' )                  //BO_KS_s
                                    else
                                        q1.SQL.add( '''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 14 ] ), 19,
                                                                       20 ) ) + ''',' );                 //BO_KS_s

                                    q1.SQL.add( '''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 19 ] ), 20,
                                                                   20 ) ) + ''',' );                     //BO_ACC_R

                                    If trim(
                                        copy( trim( re.Lines[ ( i * 37 + 15 ) + 19 ] ), 20, 20 ) ) = trim( sACC )Then
                                        q1.SQL.add( '''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 9 ] ), 20,
                                                                       20 ) ) + ''',' )                  //BO_ACC_S
                                    else
                                        q1.SQL.add( '''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 10 ] ), 20,
                                                                       20 ) ) + ''',' );                 //BO_ACC_S

                                    q1.SQL.add( '''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 22 ] ), 15,
                                                                   10 ) ) + ''',' );                     //BO_BIK_R

                                    If trim(
                                        copy( trim( re.Lines[ ( i * 37 + 15 ) + 19 ] ), 20, 20 ) ) = trim( sACC )Then
                                        q1.SQL.add( '''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 12 ] ), 15,
                                                                       10 ) ) + ''',' )                  //BO_BIK_S
                                    else
                                        q1.SQL.add( '''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 13 ] ), 15,
                                                                       10 ) ) + ''',' );                 //BO_BIK_S

                                    q1.SQL.add(
                                        'to_number(''' + trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 4 ] ), 7,
                                                                     20 ) ) + ''',''999999999.99''),' ); //BO_SUMM

                                    If trim(
                                        copy( trim( re.Lines[ ( i * 37 + 15 ) + 19 ] ), 20, 20 ) ) = trim( sACC )Then
                                        s2 := trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 8 ] ), 13, 50 ) )
                                    else
                                        s2 := trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 9 ] ), 13, 50 ) );

                                    stemp := '';

                                    For z := 1 To length( s2 )Do
                                        If s2[ z ] = '''' Then
                                            stemp := stemp + '"'
                                        Else
                                            stemp := stemp + s2[ z ];           //������� " �� ��������

                                    q1.SQL.add( '''' + trim( stemp ) + ''',' ); //BO_SENDER
                                    s2 := trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 18 ] ), 13, 50 ) );
                                    stemp := '';

                                    For z := 1 To length( s2 )Do
                                        If s2[ z ] = '''' Then
                                            stemp := stemp + '"'
                                        Else
                                            stemp := stemp + s2[ z ];           //������� " �� ��������

                                    q1.SQL.add( '''' + trim( stemp ) + ''',' ); //BO_RECEIVER

                                    If trim(
                                        copy( trim( re.Lines[ ( i * 37 + 15 ) + 19 ] ), 20, 20 ) ) = trim( sACC )Then
                                        s2 := trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 10 ] ), 17, 50 ) )
                                    else
                                        s2 := trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 11 ] ), 17, 50 ) );

                                    stemp := '';

                                    For z := 1 To length( s2 )Do
                                        If s2[ z ] = '''' Then
                                            stemp := stemp + '"'
                                        Else
                                            stemp := stemp + s2[ z ];

                                    q1.SQL.add( '''' + trim( stemp ) + ''',' ); //BO_BANK_S
                                    s2 := trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 20 ] ), 17, 50 ) );
                                    stemp := '';

                                    For z := 1 To length( s2 )Do
                                        If s2[ z ] = '''' Then
                                            stemp := stemp + '"'
                                        Else
                                            stemp := stemp + s2[ z ];

                                    q1.SQL.add( '''' + trim( stemp ) + ''',' );                                 //BO_BANK_R
                                    q1.SQL.add(
                                        '''' + trim(
                                            copy( trim( re.Lines[ ( i * 37 + 15 ) + 2 ] ), 7, 20 ) ) + ''',' ); //BO_NUM
                                    q1.SQL.add(
                                        'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy',
                                                                       StrToDate(
                                                                           strutils.RightStr( trim( re.lines[ 5 ] ),
                                                                                              10 ) ) )
                                            + ''',''dd.mm.yyyy''),' );                                          //BO_DT1
                                    q1.SQL.add(
                                        'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy',
                                                                       StrToDate(
                                                                           strutils.RightStr( trim( re.lines[ 5 ] ),
                                                                                              10 ) ) )
                                            + ''',''dd.mm.yyyy''),' );                                          //BO_DT2
                                    q1.SQL.add( '''0'',' );                                                     //BO_OCHER
                                    s2 := trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 36 ] ), 19, 255 ) );    //BO_RESERV

                                    if npos( '$', s2, 2 ) > 0 then
                                        begin
                                            c1 := npos( '$', s2, 2 );
                                            c2 := npos( '@', s2, 1 );
                                            c2 := c2 - c1;
                                            stemp := trim( copy( s2, c1 + 1, c2 - 1 ) );
                                        end
                                    else
                                        stemp := '';

                                    q1.SQL.add( '''' + trim( stemp ) + ''',' ); //BO_RESERV
                                    s2 := trim( copy( trim( re.Lines[ ( i * 37 + 15 ) + 36 ] ), 19, 255 ) );
                                    stemp := '';
                                    s3 := s2[ 1 ];

                                    For z := 1 To length( s2 )Do
                                        begin
                                            If s2[ z ] = '''' Then
                                                stemp := stemp + '"'
                                            Else
                                                if ( s2[ z ] = ' ' ) and ( s2[ z ] = s3 ) then
                                                else
                                                    stemp := stemp + s2[ z ];

                                            s3 := s2[ z ];
                                        end;

                                    q1.SQL.add( '''' + trim( stemp ) + ''',' );                          //BO_NAZN

                                    If trim(
                                        copy( trim( re.Lines[ ( i * 37 + 15 ) + 19 ] ), 20, 20 ) ) = trim( sACC )Then
                                        q1.SQL.add( '1,' )                                               //BO_VID
                                    Else
                                        q1.SQL.add( '-1,' );                                             //BO_VID

                                    q1.SQL.add( '0,' );                                                  //BO_RN_PARUS
                                    q1.SQL.add( '''' + oraACC.Fieldbyname( 'id' ).asString + ''',' );    //ID
                                    q1.SQL.add( 'null,' );                                               //ID_DGV
                                    q1.SQL.add( 'null,' );                                               //BO_NUMSTR
                                    q1.SQL.add(
                                        '''' + strutils.RightStr( trim( re.lines[ 6 ] ), 20 ) + ''',' ); //ACCKEY
                                    q1.SQL.add( 'null)' );                                               //ID_CODE
                                    //q1.SQL.SaveToFile('d:\b.txt');
                                    q1.Execute;
                                    q1.SQL.Clear;
                                    q1.Session.Commit;
                                    WriteEvent(
                                        DateTimeToStr( Now ) + ': ��������� ������ � ������� ' + inttostr(
                                            i + 1 ) + ' ������ c ' + inttostr( ( i * 37 + 15 ) ) + ' �� ' + inttostr( (
                                                                                                                          i
                                                                                                                              * 37
                                                                                                                              + 15 )
                                                                                                                          + 18 )
                                            + '.',
                                        3 );
                                End; //��� ����� ������

                            i := i + 1;
                            pbStatus.Position := i;
                        End;

                    pbStatus.Visible := false;
                    q1.Session.Commit;
                End
            End
        Else
            Application.MessageBox( '� ������� �� �� ����.', '��������!!!', mb_OK )
    //  else
    //  Application.MessageBox('�� ��������� ������ �� ���������� ������ � �����������.', '��������!!!', mb_OK)
    Else
        Begin
            Application.MessageBox( '�� ��������� ��������� ������� ���� � �����������.', '��������!!!', mb_OK );
            WriteEvent( DateTimeToStr( Now ) + ': �� ��������� ������ ����!', 10 );
        End;

    acFilterExecute( self );
End;

Procedure Tcb2parus.acParusExecute( Sender : TObject );
Begin
    If cb1.Checked Then
        loadParus( 1 );

    If cb2.Checked Then
        loadParus( 2 );
End;

Procedure Tcb2parus.LoadParus( z : integer );
Var
    rn : integer;
    docnumb : String[ 255 ];
    rn_crn, LUK_RN : String;
    ss : ^TOracleDataSet;

Begin
    If z = 1 Then
        ss := @oraCB
    Else
        ss := @oraCB_INN;

    rn_crn := mteCatalog.fieldbyname( 'rn' ).AsString;
    q1.clear;
    ss^.First;
    WriteEvent( DateTimeToStr( Now ) + ': �������� ������ � �����.', 45 );
    pbStatus.Visible := true;
    pbStatus.Min := 0;
    pbStatus.Max := ss^.RecordCount;

    While Not ss^.Eof Do
        Begin
            With oraInsert Do
                Begin
                    luk_rn := '';
                    ClearVariables;
                    SetVariable( 'ncompany', 2 );
                    SetVariable( 'nCRN', StrToInt( rn_crn ) );
                    SetVariable( 'sBANK_TYPEDOC', oraACC.Fieldbyname( 'sbank_doctype' ).asString );
                    SetVariable( 'sBANK_PREFDOC', trim( ss^.Fieldbyname( 'bank_docnumb' ).asString ) + '.' );
                    //�������� ����� ��������� �� ������
                    oraNextNumb.SetVariable( 'company', 2 );
                    oraNextNumb.SetVariable( 'pref', trim( ss^.Fieldbyname( 'bank_docnumb' ).asString ) + '.' );
                    oraNextNumb.SetVariable( 'doctype', oraACC.Fieldbyname( 'sbank_doctype' ).asString );
                    oraNextNumb.Execute;
                    docNumb := oraNextNumb.GetVariable( 'snumb' );
                    SetVariable( 'sBANK_NUMBDOC', docnumb );

                    If ss^.Fieldbyname( 'vid' ).asInteger = -1 Then
                        SetVariable( 'sTYPE_OPER', oraACC.Fieldbyname( 'stype_oper_out' ).asString )
                    Else
                        SetVariable( 'sTYPE_OPER', oraACC.Fieldbyname( 'stype_oper_in' ).asString );

                    SetVariable( 'dBANK_DATEDOC',
                                 FormatDateTime( 'dd.mm.yyyy', ss^.Fieldbyname( 'bank_docdate' ).AsDateTime ) );
                    SetVariable( 'sAGENT_FROM', ss^.Fieldbyname( 'agent_from' ).asString );
                    SetVariable( 'sAGENTF_ACC', ss^.Fieldbyname( 'acc_from' ).asString );
                    SetVariable( 'sAGENT_TO', ss^.Fieldbyname( 'agent_to' ).asString );
                    SetVariable( 'sAGENTT_ACC', ss^.Fieldbyname( 'acc_to' ).asString );
                    SetVariable( 'sBUNIT_MNEMO', oraACC.Fieldbyname( 'sbalunit' ).asString );
                    SetVariable( 'dPAY_DATA',
                                 FormatDateTime( 'dd.mm.yyyy', ss^.Fieldbyname( 'pay_data' ).AsDateTime ) );
                    SetVariable( 'spay_info', ss^.Fieldbyname( 'pay_info' ).asString );
                    SetVariable( 'nPAY_SUM', ss^.Fieldbyname( 'pay_sum' ).asFloat );
                    SetVariable( 'nTAX_SUM', ss^.Fieldbyname( 'tax_sum' ).asFloat );
                    SetVariable( 'nPERCENT_TAX_SUM', ss^.Fieldbyname( 'percent_tax_sum' ).asFloat );
                    SetVariable( 'sCURRENCY', oraACC.Fieldbyname( 'scurrency' ).asString );
                    SetVariable( 'sJUR_PERS', oraACC.Fieldbyname( 'sjurpers' ).asString );
                    LUK_rn := trim( ss^.Fieldbyname( 'luk_rn' ).asString );
                End;

            Try
                Begin
                    oraInsert.Execute;
                    rn := oraInsert.GetVariable( 'nrn' );
                    WriteEvent( DateTimeToStr( Now ) + ': ��������� ������ � ����� �' + inttostr( rn ) + '.', 3 );
                    q1.SQL.Clear;
                    q1.SQL.add( 'update pvz_bnoprs set' );
                    q1.SQL.add( 'bo_rn_parus=:nrn' );
                    q1.SQL.add( 'where rowid=chartorowid(:crid)' );
                    q1.DeclareVariable( ':nrn', otString );
                    q1.DeclareVariable( ':crid', otString );
                    q1.SetVariable( ':nrn', inttostr( rn ) );
                    q1.SetVariable( ':crid', ss^.Fieldbyname( 'rid' ).asString );
                    q1.Execute;
                    q1.SQL.Clear;
                    q1.DeleteVariables;

                    If luk_rn <> '' Then
                        Begin
                            oraProps.ClearVariables;
                            oraProps.SetVariable( ':NCOMPANY', 2 );
                            oraProps.SetVariable( ':NRN', rn );
                            oraProps.SetVariable( ':SUNITCODE', 'BankDocuments' );
                            oraProps.SetVariable( ':SCODE', '���� ��������' );
                            oraProps.SetVariable( ':NFORMAT', 0 );
                            oraProps.SetVariable( ':SSTR_VALUE', LUK_rn );
                            WriteEvent( DateTimeToStr( Now ) + ': �������� ��� �������: ' + trim( luk_rn ), 27 );

                            Try
                                oraProps.Execute;
                            Except On E : EOracleError Do
                                ShowMessage( E.Message );
                            End;
                        End;

                    oraProps.Session.Commit
                End
            Except On E : EOracleError Do
                ShowMessage( E.Message );
            End;

            pbstatus.Position := ss^.RecNo;
            ss^.Next;
        End;

    pbStatus.Visible := false;
    acFilterExecute( self );
    oradscb.Commit;
End;

Procedure Tcb2parus.FormCreate( Sender : TObject );
Begin
    //������ �����������
    pbStatus := TProgressBar.Create( sbBank );
    pbStatus.Visible := false;
    pbStatus.Parent := sbBank;
    pbStatus.BoundsRect := GetPanelRect;
    pbStatus.Smooth := true;
    oraDScb.Connected := false;
    oralog.Execute;

    If oraDScb.Connected Then
        Begin
            oraCatalog.Open;
            mteCatalog.Open;
            oraCatPay.Open;
            mteCatPay.Open;
            //�������� ���� ������������
            WriteEvent(
                DateTimeToStr(
                    Now ) + ': ���� � ������� (' + oraDScb.LogonUsername + '@' + oraDScb.LogonDatabase + ').',
                44 );
            oraacc.SetVariable( ':mol', lowercase( trim( oradscb.LogonUsername ) ) );
            oraacc.Open;
            WriteEvent( DateTimeToStr( Now ) + ': ���������� ���� ������������.', 15 );
            edDate.Date := date( ) - 1;
            cb2Parus.Caption := cb2Parus.Caption + ' (' + oraDScb.LogonUsername + '@' + oraDScb.LogonDatabase + ')';
            { ������� Windows, ��� �� ��� ����� ������� ����� }
            DragAcceptFiles( Handle, True );
        End
    Else
        Begin
            Application.Terminate; // �� ����� � �������
        End;
End;

Procedure Tcb2parus.FormClose( Sender : TObject; Var Action : TCloseAction );
Var
    i : integer;

Begin
    WriteEvent(
        DateTimeToStr( Now ) + ': ����� �� ������� (' + oraDScb.LogonUsername + '@' + oraDScb.LogonDatabase + ').', 7 );
    pbStatus.Visible := True;
    pbStatus.Min := 0;
    pbStatus.Max := 5;
    IdMessage.Body.Clear;

    If memo.Items.Count > 2 Then
        For i := 0 To memo.Items.Count - 1 Do IdMessage.Body.Add( memo.Items.Item[ i ].Caption );

    With IdMessage Do
        Begin
            ContentType := 'text/plain';
            From.Text := oradscb.LogonUsername + '@' + oradscb.LogonDatabase;
            Sender.Text := oradscb.LogonUsername + '@' + oradscb.LogonDatabase;
            Recipients.EMailAddresses := trim( oraACC.fieldByName( 'email_name' ).AsString );
            Subject := 'LUK-SNP Client-Bank ' + oradscb.LogonUsername + '@' + oradscb.LogonDatabase;
        End;

    pbStatus.Position := 1;
    WriteEvent( DateTimeToStr( Now ) + ': �������� ���������.', 1 );

    If ( lcACC.DisplayValue <> '' ) Then
        With IdSMTP Do
            Begin
                host := trim( oraACC.fieldByName( 'smtp_host' ).AsString );

                Try
                    Connect;
                    pbStatus.Position := 2;
                    Send( IdMessage );
                    pbStatus.Position := 3;
                    Disconnect;
                    pbStatus.Position := 4;
                Except On E : Exception Do
                    If connected Then
                        Try
                            disconnect;
                        Except
                        End;
                End;
            End;

    oraCatalog.Close;
    oracb.Close;
    oracb_inn.Close;
    oravyp.Close;
    oraacc.Close;
    oradscb.Commit;
    pbStatus.Position := 5;
    oradscb.Connected := false;
End;

Procedure Tcb2parus.acFilterExecute( Sender : TObject );
Var
    i : integer;

Begin
    btnFilter.Cursor := crSQLWait;
    WriteEvent(
        DateTimeToStr( Now ) + ': ������ ���� ' + oraACC.Fieldbyname(
            'bv_acc' ).asString + ' �� ' + FormatDateTime( 'dd.mm.yyyy', edDate.Date ) + '.',
        11 );
    pbStatus.Visible := True;
    pbStatus.Min := 0;
    pbStatus.Max := 3;

    If cb1.Checked Then
        Begin
            If oraCB.Active Then
                oraCB.Close;

            oraCB.ClearVariables;
            oraCB.SetVariable( ':ddate', FormatDateTime( 'dd.mm.yyyy', edDate.Date ) );
            oraCB.SetVariable( ':acc', oraACC.Fieldbyname( 'bv_acc' ).asString );
            oraCB.Open;
        End
    Else
        If oraCB.Active Then
            oraCB.Close;

    pbStatus.Position := 1;

    If cb2.Checked Then
        Begin
            If oraCB_inn.Active Then
                oraCB_inn.Close;

            oraCB_inn.ClearVariables;
            oraCB_inn.SetVariable( ':ddate', FormatDateTime( 'dd.mm.yyyy', edDate.Date ) );
            oraCB_inn.SetVariable( ':acc', oraACC.Fieldbyname( 'bv_acc' ).asString );
            oraCB_inn.Open;
        End
    Else
        If oraCB_inn.Active Then
            oraCB_inn.Close;

    pbStatus.Position := 2;

    If oraVyp.Active Then
        oraVyp.Close;

    oraVyp.clearvariables;
    oraVyp.SetVariable( ':ddate', FormatDateTime( 'dd.mm.yyyy', edDate.Date ) );
    oraVyp.SetVariable( ':acc', trim( oraACC.Fieldbyname( 'bv_acc' ).asString ) );

    If cbFilter.ItemIndex = 0 Then
        Begin
            oraVyp.SQL[ 9 ] := '';

            If oraVyp.VariableCount = 3 Then
                oraVyp.DeleteVariable( ':nrn' );
        End;

    If cbFilter.ItemIndex = 2 Then
        Begin
            oraVyp.SQL[ 9 ] := 'and (bo_rn_parus=:nrn)';

            If oraVyp.VariableCount = 2 Then
                oraVyp.DeclareVariable( ':nrn', otString );

            oraVyp.SetVariable( ':nrn', 0 );
        End;

    If cbFilter.ItemIndex = 1 Then
        Begin
            oraVyp.SQL[ 9 ] := 'and (bo_rn_parus>:nrn)';

            If oraVyp.VariableCount = 2 Then
                oraVyp.DeclareVariable( ':nrn', otString );

            oraVyp.SetVariable( ':nrn', 0 );
        End;

    oraVyp.Open;

    btnFilter.Cursor := crDefault;
    DBGridEh2.UseMultiTitle := false;

    For i := 1 To DBGridEh2.Columns.Count - 1 Do DBGridEh2.Columns[ i ].Title.Caption
        := '������� �� ����� ' + lcACC.DisplayValue + ' �� ' + edDate.text + DBGridEh2.Columns[ i ].Field.DisplayLabel;

    DBGridEh2.UseMultiTitle := true;
    q1.SQL.Clear;
    q1.SQL.Add( 'select /*+ ORDERED*/ bv_sin,bv_in,bv_out,bv_sout from pvz_bnvyp where' );
    q1.SQL.add( 'bv_date=:ddate' );
    q1.SQL.Add( 'and bv_acc=:acc' );
    q1.DeclareVariable( ':ddate', otDate );
    q1.DeclareVariable( ':acc', otString );
    q1.SetVariable( ':ddate', FormatDateTime( 'dd.mm.yyyy', edDate.Date ) );
    q1.SetVariable( ':acc', oraACC.Fieldbyname( 'bv_acc' ).asString );
    q1.Execute;

    If q1.RowCount = 1 Then
        Begin
            bv_sin.Caption := q1.FieldAsString( 0 );
            bv_in.Caption := q1.FieldAsString( 1 );
            bv_out.Caption := q1.FieldAsString( 2 );
            bv_sout.Caption := q1.FieldAsString( 3 );
        End
    Else
        Begin
            q1.SQL.Clear;
            q1.DeleteVariables;
            q1.SQL.Add( 'select /*+ ORDERED*/ bv_sout from pvz_bnvyp where' );
            q1.SQL.add( 'bv_date=(select max(bv_date) from pvz_bnvyp where bv_acc=:acc)' );
            q1.SQL.Add( 'and bv_acc=:acc' );
            q1.DeclareVariable( ':acc', otString );
            q1.SetVariable( ':acc', oraACC.Fieldbyname( 'bv_acc' ).asString );
            q1.Execute;

            If q1.RowCount = 1 Then
                Begin
                    bv_sin.Caption := q1.FieldAsString( 0 );
                    bv_sout.Caption := q1.FieldAsString( 0 );
                End
            Else
                Begin
                    bv_sin.Caption := '0';
                    bv_sout.Caption := '0';
                End;

            bv_in.Caption := '0';
            bv_out.Caption := '0';
        End;

    q1.SQL.Clear;
    q1.DeleteVariables;
    pbStatus.Position := 3;
    pbStatus.Visible := False;
End;

Procedure Tcb2parus.acPrintExecute( Sender : TObject );
Begin
    WriteEvent( DateTimeToStr( Now ) + ': �������� ��������� �������', 18 );
    prCB.PageHeader.CenterText.Clear;
    prCB.PageHeader.CenterText.Add( '�� �����: ' + lcACC.DisplayValue + ' �� ' + edDate.text );
    prCB.PageHeader.CenterText.Add( '�������� ������: ' + bv_sin.Caption );
    prCB.PageHeader.CenterText.Add( '���������� ������: ' + bv_in.Caption + ' ��������� ������: ' + bv_out.Caption );
    prCB.PageHeader.CenterText.Add( '��������� ������: ' + bv_sout.Caption );
    prCB.Preview;
End;

Procedure Tcb2parus.lcACCChange( Sender : TObject );
Begin
    If oraACC.FieldByName( 'on_line' ).AsInteger = 1 Then
        btnToParus.Enabled := true
    Else
        btnToParus.Enabled := false;

    If oraACC.FieldByName( 'Catalog' ).AsString <> '' Then
        begin
            mteCatalog.TreeList.FullExpand;
            mteCatalog.Locate( 'NAME', trim( oraACC.FieldByName( 'Catalog' ).AsString ), [ loPartialKey,
                                                                                           loCaseInsensitive ] );
            DBGridEh4.Refresh;
        end;
End;

Procedure Tcb2parus.DBGridEh22GetCellParams( Sender : TObject;        Column : TColumnEh; AFont : TFont;
                                             Var Background : TColor; State : TGridDrawState );
Begin
    If cbColor.Checked Then
        If oravyp.FieldByName( 'bo_rn_parus' ).AsInteger = 0 Then
            background := clAqua;
End;

Procedure Tcb2parus.DBGridEh11GetCellParams( Sender : TObject;        Column : TColumnEh; AFont : TFont;
                                             Var Background : TColor; State : TGridDrawState );
Begin
    If odd( oraCB.RecNo )Then
        background := clMoneyGreen;
End;

Procedure Tcb2parus.DBGridEh33GetCellParams( Sender : TObject;        Column : TColumnEh; AFont : TFont;
                                             Var Background : TColor; State : TGridDrawState );
Begin
    If odd( oraCB_inn.RecNo )Then
        background := clMoneyGreen;
End;

Procedure Tcb2parus.oraInsertArrayError( Sender : TOracleQuery; Index, ErrorCode : Integer; Const ErrorMessage : String;
                                         Var Continue : Boolean );
Begin
    ShowMessage( ErrorMessage );
End;

Procedure Tcb2parus.acCopyExecute( Sender : TObject );
Begin
    DBGridEh_DoCopyAction( DBGridEh2, False );
End;

Procedure Tcb2parus.acXLSExecute( Sender : TObject );
Begin
    WriteEvent( DateTimeToStr( Now ) + ' : ����������� ���� c:\temp\Vypiska.xls.', 43 );
    SaveDBGridEhToExportFile( TDBGridEhExportAsXLS, DBGridEh2, 'c:\temp\Vypiska.xls', False );
    ShowMessage( '����������� ���� c:\temp\Vypiska.xls' );
End;

Procedure Tcb2parus.acSendNSIExecute( Sender : TObject );
Var
    t : TStringstream;
    s : String;
    tmp : tStrings;

Begin
    WriteEvent( DateTimeToStr( Now ) + ': �������� ��������� - ' + trim( cbEmailRecip.Text ) + '.', 1 );
    t := TStringStream.Create( s );
    tmp := TStringList.Create;
    WriteDBGridEhToExportStream( TDBGridEhExportAsHTML, DBGridEh2, t, False );
    tmp.Add( t.DataString );

    With IdMessage Do
        Begin
            ContentType := 'text/html';
            From.Text := oradscb.LogonUsername + '@' + oradscb.LogonDatabase;
            Sender.Text := oradscb.LogonUsername + '@' + oradscb.LogonDatabase;
            Recipients.EMailAddresses := trim( cbEmailRecip.Text );
            Subject := 'LUK-SNP Client-Bank ' + oradscb.LogonUsername + '@' + oradscb.LogonDatabase;
            Body := tmp;
        End;

    With IdSMTP Do
        Begin
            host := trim( oraACC.fieldByName( 'smtp_host' ).AsString );

            Try
                Connect;
                Send( IdMessage );
                Disconnect;
            Except On E : Exception Do
                If connected Then
                    Try
                        disconnect;
                    Except
                    End;
            End;
        End;

    t.Destroy;
    tmp.Destroy;
End;

Procedure Tcb2parus.acVypRTFExecute( Sender : TObject );
Begin
    WriteEvent( DateTimeToStr( Now ) + ': ����������� ���� c:\temp\Vypiska.rtf.', 42 );
    SaveDBGridEhToExportFile( TDBGridEhExportAsRTF, DBGridEh2, 'c:\temp\Vypiska.rtf', true );
    ShowMessage( '����������� ���� c:\temp\Vypiska.rtf' );
End;

Procedure Tcb2parus.btnTopClick( Sender : TObject );
Begin
    If label8.Enabled Then
        Begin
            label8.Enabled := false;
            Panel1.Height := 1;
            btnTop.Caption := '+';
        End
    Else
        Begin
            label8.Enabled := True;
            Panel1.Height := 77;
            btnTop.Caption := '-';
        End;
End;

Procedure Tcb2parus.acLoadORAExecute( Sender : TObject );
Begin
   if pos('.mdb',fd.FileName) > 0 then
      Loadmdb()
   else
    if trim( re.Lines[ 0 ] ) = '1CClientBankExchange' then
        loadR( )
    else
        LoadTXT( );


    {  If (LowerCase(RightStr(fd.FileName, 3)) <> 'txt') And (LowerCase(RightStr(trim(fd.FileName), 1)) <> 'r') Then
        loadEXP()
      Else
      If LowerCase(RightStr(trim(fd.FileName), 1)) = 'r' Then
        loadR()
      Else
      If (LowerCase(RightStr(fd.FileName, 3)) = 'txt') Then
        LoadTXT();}
    PagesCB.ActivePage := tsVyp;
End;

Procedure Tcb2parus.memo1GetItemParams( Sender : TObject; Item : TListItem; AFont : TFont; Var Background : TColor;
                                        Var State : TCustomDrawState );
Begin
    If odd( item.Index )Then
        background := clMoneyGreen;
End;

Procedure Tcb2parus.acDeleteExecute( Sender : TObject );
Begin
    If MessageDlg( '�� ������� �����, �� ��� ���� ������ ��� ������������. ������� ��?', mtConfirmation, [ mbYes,
                                                                                                           mbNo ], 0 ) =
        mrYes Then
        Begin // ������� ������
            //������� �� BANKDOCS
            q1.Clear;
            q1.DeleteVariables;
            q1.SQL.add( 'delete from bankdocs where' );
            q1.SQL.add( 'rn in (select bo_rn_parus from pvz_bnoprs where' );
            q1.SQL.add( 'bo_dt1=:ddate' );
            q1.SQL.add( 'and id=:id_' );
            q1.SQL.add( 'and acckey=:acc)' );
            q1.DeclareVariable( ':ddate', otDate );
            q1.DeclareVariable( ':id_', otString );
            q1.DeclareVariable( ':acc', otString );
            q1.SetVariable( ':ddate', FormatDateTime( 'dd.mm.yyyy', edDate.Date ) );
            q1.SetVariable( ':id_', oraACC.Fieldbyname( 'id' ).asString );
            q1.SetVariable( ':acc', oraACC.Fieldbyname( 'bv_acc' ).asString );
            q1.Execute;
            q1.Clear;
            q1.DeleteVariables;
            // ������� �� PVZ_BNOPRS
            q1.SQL.add( 'delete from pvz_bnoprs where' );
            q1.SQL.add( 'bo_dt1=:ddate' );
            q1.SQL.add( 'and id=:id_' );
            q1.SQL.add( 'and acckey=:acc' );
            q1.DeclareVariable( ':ddate', otDate );
            q1.DeclareVariable( ':id_', otString );
            q1.DeclareVariable( ':acc', otString );
            q1.SetVariable( ':ddate', FormatDateTime( 'dd.mm.yyyy', edDate.Date ) );
            q1.SetVariable( ':id_', oraACC.Fieldbyname( 'id' ).asString );
            q1.SetVariable( ':acc', oraACC.Fieldbyname( 'bv_acc' ).asString );
            q1.Execute;
            q1.Clear;
            q1.DeleteVariables;
            // ������� �� PVZ_BNVYP
            q1.SQL.add( 'delete from pvz_bnvyp where' );
            q1.SQL.add( 'bv_date=:ddate' );
            q1.SQL.add( 'and id=:id_' );
            q1.SQL.add( 'and bv_acc=:acc' );
            q1.DeclareVariable( ':ddate', otDate );
            q1.DeclareVariable( ':id_', otString );
            q1.DeclareVariable( ':acc', otString );
            q1.SetVariable( ':ddate', FormatDateTime( 'dd.mm.yyyy', edDate.Date ) );
            q1.SetVariable( ':id_', oraACC.Fieldbyname( 'id' ).asString );
            q1.SetVariable( ':acc', oraACC.Fieldbyname( 'bv_acc' ).asString );
            q1.Execute;
            q1.Clear;
            q1.DeleteVariables;
            q1.Session.Commit;
            WriteEvent(
                DateTimeToStr( Now ) + ': ������� ������ ��� ����� ' + oraACC.Fieldbyname(
                    'bv_acc' ).asString + ' �� ' + FormatDateTime( 'dd.mm.yyyy', edDate.Date ) + '.',
                16 );
        End;

    acFilterExecute( self );
End;

Procedure Tcb2parus.FormDestroy( Sender : TObject );
Begin
    DragAcceptFiles( Handle, False );
End;

procedure Tcb2parus.DBGridEh2Columns0GetCellParams( Sender : TObject; EditMode : Boolean; Params : TColCellParamsEh );
begin
    If cbColor.Checked Then
        If oravyp.FieldByName( 'bo_rn_parus' ).AsInteger = 0 Then
            params.ImageIndex := 16
        else
            params.ImageIndex := 3;
end;

procedure Tcb2parus.DBGridEh4Columns0GetCellParams( Sender : TObject; EditMode : Boolean; Params : TColCellParamsEh );
begin
    if mteCatalog.TreeNodeExpanded then
        params.ImageIndex := 1
    else
        if mteCatalog.TreeNodeHasChildren then
            params.ImageIndex := 2
        else
            params.ImageIndex := 3;
end;
procedure Tcb2parus.mteCatPayAfterScroll(DataSet: TDataSet);
begin
if orapay.Active then orapay.Close;
orapay.SetVariable(':rn', mtecatpay.Fieldbyname( 'rn' ).asString);
orapay.Open;
end;

procedure Tcb2parus.acRefreshExportExecute(Sender: TObject);
begin
if orapay.Active then orapay.Close;
orapay.SetVariable(':rn', mtecatpay.Fieldbyname( 'rn' ).asString);
orapay.Open;
end;

procedure Tcb2parus.egrCatPayColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
    if mteCatPay.TreeNodeExpanded then
        params.ImageIndex := 1
    else
        if mteCatPay.TreeNodeHasChildren then
            params.ImageIndex := 2
        else
            params.ImageIndex := 3;
end;

procedure Tcb2parus.acExport2CBExecute(Sender: TObject);
var
 docNumb, docPref :string;
 i,z: integer;
 s1, s2 : AnsiString;
 stemp : ansistring;
begin
i:=1;
oraPay.First;
While Not oraPay.Eof Do
  Begin
if cbGenNumb.Checked then
begin
//�������� ����� ��������� �� ������
docpref:=FormatDateTime( 'ddmmyyyy', edDate.Date );
oraPayNN.ClearVariables;
oraPayNN.SetVariable( ':company', 2 );
oraPayNN.SetVariable( ':pref', docpref );
oraPayNN.SetVariable( ':doctype', '�/�' );
oraPayNN.Execute;
docNumb := oraPayNN.GetVariable( ':snumb' );
if orapayFU.active then orapayFU.close;
orapayFU.setvariable(':rn', oraPay.Fieldbyname( 'NRN' ).asString);
orapayFU.Open;
//������ ����� �� ��������� ����
oraPayUPD.ClearVariables;
oraPayUPD.SetVariable(':nRN',oraPayFU.Fieldbyname('nRN' ).asString);
oraPayUPD.SetVariable(':nCOMPANY',oraPayFU.Fieldbyname('nCOMPANY' ).asString);
oraPayUPD.SetVariable(':nDIR_TYPE',oraPayFU.Fieldbyname('nDIR_TYPE' ).asString);
oraPayUPD.SetVariable(':sDIR_CONT',oraPayFU.Fieldbyname('sDIR_CONT' ).asString);
oraPayUPD.SetVariable(':sDIR_ANSW',oraPayFU.Fieldbyname('sDIR_ANSW' ).asString);
oraPayUPD.SetVariable(':sDOCTYPE','�/�');
oraPayUPD.SetVariable(':sDOCPREF',DOCPREF);
oraPayUPD.SetVariable(':sDOCNUMB',DOCNUMB);
oraPayUPD.SetVariable(':dDOCDATE',oraPayFU.Fieldbyname('dDOCDATE' ).asString);
oraPayUPD.SetVariable(':sVDOCTYPE',oraPayFU.Fieldbyname('sVDOCTYPE' ).asString);
oraPayUPD.SetVariable(':sVDOCNUMB',oraPayFU.Fieldbyname('sVDOCNUMB' ).asString);
oraPayUPD.SetVariable(':dVDOCDATE',oraPayFU.Fieldbyname('dVDOCDATE' ).asString);
oraPayUPD.SetVariable(':sAGFROM',oraPayFU.Fieldbyname('sAGFROM' ).asString);
oraPayUPD.SetVariable(':sAGFRACC',oraPayFU.Fieldbyname('sAGFRACC' ).asString);
oraPayUPD.SetVariable(':sPAYER_ACC',oraPayFU.Fieldbyname('sPAYER_ACC' ).asString);
oraPayUPD.SetVariable(':sAGTO',oraPayFU.Fieldbyname('sAGTO' ).asString);
oraPayUPD.SetVariable(':sAGTOACC',oraPayFU.Fieldbyname('sAGTOACC' ).asString);
oraPayUPD.SetVariable(':sPAY_SEQ',oraPayFU.Fieldbyname('sPAY_SEQ' ).asString);
oraPayUPD.SetVariable(':dPAY_DATE',oraPayFU.Fieldbyname('dPAY_DATE' ).asString);
oraPayUPD.SetVariable(':sPAY_INFO',oraPayFU.Fieldbyname('sPAY_INFO' ).asString);
oraPayUPD.SetVariable(':sPAY_NOTE',oraPayFU.Fieldbyname('sPAY_NOTE' ).asString);
oraPayUPD.SetVariable(':sBALUNIT',oraPayFU.Fieldbyname('sBALUNIT' ).asString);
oraPayUPD.SetVariable(':sTYPE_OPER',oraPayFU.Fieldbyname('sTYPE_OPER' ).asString);
oraPayUPD.SetVariable(':sCURRENCY',oraPayFU.Fieldbyname('sCURRENCY' ).asString);
oraPayUPD.SetVariable(':nPAY_SUM',oraPayFU.Fieldbyname('nPAY_SUM' ).asString);
oraPayUPD.SetVariable(':nTAX_SUM',oraPayFU.Fieldbyname('nTAX_SUM' ).asString);
oraPayUPD.SetVariable(':nPERCENT',oraPayFU.Fieldbyname('nPERCENT' ).asString);
oraPayUPD.SetVariable(':nCREATE_FACT',oraPayFU.Fieldbyname('nCREATE_FACT' ).asString);
oraPayUPD.Execute;
orapayFU.close;
end else docNumb := oraPay.Fieldbyname( 'sdocnumb' ).asString;
//������ ����� �� ������� ���
case length(trim(docnumb)) of
1:docnumb:='00'+trim(docnumb);
2:docnumb:='0'+trim(docnumb);
else
docnumb:=trim(docnumb)
end;
// �������� ������ � ����
p2b.Lines.Add('#'+trim(IntToStr(i))+'|PayDocRuAE');
p2b.Lines.Add(FormatDateTime( 'dd.mm.yyyy', edDate.Date ));
p2b.Lines.Add(docnumb);
p2b.Lines.Add('810');
p2b.Lines.Add(oraPay.Fieldbyname('acc_from' ).asString);
s1:=oraPay.Fieldbyname('name_from' ).asString;
s2:=oraPay.Fieldbyname('name_from' ).asString;
chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
p2b.Lines.Add(s2);
p2b.Lines.Add(oraPay.Fieldbyname('bik_to' ).asString);
p2b.Lines.Add(oraPay.Fieldbyname('acc_to' ).asString);
s1:=oraPay.Fieldbyname('name_to' ).asString;
s2:=oraPay.Fieldbyname('name_to' ).asString;
stemp := '';
For z := 1 To length( s1 )Do
   If s1[ z ] = '�' Then
    stemp := stemp + 'N'
   Else
    stemp := stemp + s1[ z ] ;
chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
p2b.Lines.Add(s2);
p2b.Lines.Add(oraPay.Fieldbyname('inn_to' ).asString);
p2b.Lines.Add(oraPay.Fieldbyname('npay_sum' ).asString);
s1:=oraPay.Fieldbyname('spay_info' ).asString;
s2:=oraPay.Fieldbyname('spay_info' ).asString;
stemp := '';
For z := 1 To length( s1 )Do
   If s1[ z ] = '�' Then
    stemp := stemp + 'N'
   Else
    stemp := stemp + s1[ z ] ;
chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
p2b.Lines.Add(s2);
p2b.Lines.Add('');
p2b.Lines.Add('6');
p2b.Lines.Add(FormatDateTime( 'dd.mm.yyyy', edDate.Date ));
p2b.Lines.Add('01');
s1:='����������';
s2:='����������';
chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
p2b.Lines.Add(s2);
p2b.Lines.Add(';end');
i:=i+1;
oraPay.Next;
end;
p2b.Lines.SaveToFile('c:\tmp\import.txt');
end;

Procedure Tcb2parus.Loadmdb( );
Var
    i : integer;
    sACC, sDAT : String[ 255 ];
    empty : boolean;
Begin
    sDAT := edDate.Text;
    adoCBDB.CommandText:= 'SELECT [#RECAPP].[#DOC_DATE], [#RECAPP].[#C_INN], [#RECAPP].[#A_INN], [#RECAPP].[#C_BANK_KS], ';
    adoCBDB.CommandText:= adoCBDB.CommandText + '[#RECAPP].[#A_BANK_KS], left([#RECAPP].[#C_ACC],20) as [#c_acc], ';
    adoCBDB.CommandText:= adoCBDB.CommandText + 'left([#RECAPP].[#A_ACC],20) as [#a_acc], [#RECAPP].[#C_BANK_BIC], ';
    adoCBDB.CommandText:= adoCBDB.CommandText + '[#RECAPP].[#A_BANK_BIC], [#RECAPP].[#SUMMA], [#RECAPP].[#A_NAME], ';
    adoCBDB.CommandText:= adoCBDB.CommandText + '[#RECAPP].[#C_NAME], [#RECAPP].[#A_BANK_NAME], [#RECAPP].[#C_BANK_NAME], ';
    adoCBDB.CommandText:= adoCBDB.CommandText + '[#RECAPP].[#DOC_NUM], [#RECAPP].[#PRIORITY], [#RECAPP].[#NOTE], ';
    adoCBDB.CommandText:= adoCBDB.CommandText + '[#RECAPP].[#DOC_VID], [#RECAPP].[#VID_OP], [#RECAPP].[#DATE_PROV] FROM [#RECAPP] ';
    adoCBDB.CommandText:= adoCBDB.CommandText + 'WHERE  ((([#RECAPP].[#DATE_PROV])>= :doc_date And ';
    adoCBDB.CommandText:= adoCBDB.CommandText + '([#RECAPP].[#DATE_PROV])<DateAdd("d",1, :doc_date1)))';
    adoCBDB.Parameters.Clear;
    adoCBDB.Parameters.CreateParameter(':doc_date', ftString, pdInput, 0, null);
    adoCBDB.Parameters.CreateParameter(':doc_date1', ftString, pdInput, 0, null);
    adoCBDB.Parameters.ParamByName(':doc_date').Value := FormatDateTime( 'dd.mm.yyyy',StrToDate( sDAT ));
    adoCBDB.Parameters.ParamByName(':doc_date1').Value := FormatDateTime( 'dd.mm.yyyy',StrToDate( sDAT ));
    adoCBDB.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + fd.FileName +';Persist Security Info=False';
    adoCBDB.Open;
    adoCBDB.First;
    i := 0;
    i := i ;
    pbStatus.Visible := true;
    pbStatus.Min := 0;
    pbStatus.Max := round( adoCBDB.RecordCount);
    sacc :=lcACC.Text;
    //oraACC.SearchRecord( 'bv_acc', trim( sACC ), [ srFromBeginning ] );
    //lcAcc.Value := oraACC.FieldByName( 'rn' ).AsString;

    q1.Clear;
    While not (adoCBDB.Eof) Do
        Begin
          //sacc := adoCBDB.FieldByName('#A_ACC').AsString;
          //sDAT := adoCBDB.FieldByName('#DOC_DATE').AsString;
          //edDate.Date := StrToDate( trim( sDAT ) );
          qSearch.ClearVariables;
          qSearch.SetVariable( ':acc', sacc );
          qSearch.SetVariable( ':ddate', FormatDateTime( 'dd.mm.yyyy', StrToDate( sDAT ) ) );
          qSearch.SetVariable( ':summ', strtofloat(adoCBDB.FieldByName('#SUMMA').AsString) );
          qSearch.SetVariable( ':num', trim(adoCBDB.FieldByName('#DOC_NUM').AsString));
          qSearch.SetVariable( ':acc_r', adoCBDB.FieldByName('#C_ACC').AsString );
          qSearch.SetVariable( ':acc_s', adoCBDB.FieldByName('#A_ACC').AsString);
          qSearch.SetVariable( ':nazn', trim(adoCBDB.FieldByName('#NOTE').AsString));
          qSearch.Execute;

          If qSearch.eof Then
               empty := true
          Else
             empty := false;

          qSearch.Close;

          If empty Then
          if (trim(adoCBDB.FieldByName('#A_ACC').AsString) = trim(sACC)) or (trim(adoCBDB.FieldByName('#C_ACC').AsString)=trim(sACC)) then
            Begin //��� ����� ������
             q1.SQL.add( 'insert into pvz_bnoprs (' );
             q1.SQL.add( 'BO_DT, BO_INN_R, BO_INN_S,' );
             q1.SQL.add( 'BO_KS_R, BO_KS_S, BO_ACC_R, BO_ACC_S,' );
             q1.SQL.add( 'BO_BIK_R, BO_BIK_S, BO_SUMM, BO_SENDER, BO_RECEIVER,' );
             q1.SQL.add( 'BO_BANK_S, BO_BANK_R, BO_NUM, BO_DT1, BO_DT2,' );
             q1.SQL.add( 'BO_OCHER, BO_RESERV, BO_NAZN, BO_VID, BO_RN_PARUS,' );
             q1.SQL.add( 'ID, ID_DGV, BO_NUMSTR, ACCKEY, ID_CODE)' );
             q1.SQL.add( 'values (' );
             q1.SQL.add( 'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy',adoCBDB.FieldByName('#DOC_DATE').AsDateTime) + ''',''dd.mm.yyyy''),'); //BO_DT
             q1.SQL.add( ''''+adoCBDB.FieldByName('#C_INN').AsString +''',' ); //BO_INN_R
             q1.SQL.add( ''''+adoCBDB.FieldByName('#A_INN').AsString +''',' ); //BO_INN_S
             q1.SQL.add( ''''+adoCBDB.FieldByName('#C_BANK_KS').AsString +''',' ); //BO_KS_R
             q1.SQL.add( ''''+adoCBDB.FieldByName('#A_BANK_KS').AsString +''',' ); //BO_KS_s
             q1.SQL.add( ''''+adoCBDB.FieldByName('#C_ACC').AsString + ''',' ); //BO_ACC_R
             q1.SQL.add( ''''+adoCBDB.FieldByName('#A_ACC').AsString + ''',' ); //BO_ACC_S
             q1.SQL.add( ''''+adoCBDB.FieldByName('#C_BANK_BIC').AsString + ''',' ); //BO_BIK_R
             q1.SQL.add( ''''+adoCBDB.FieldByName('#A_BANK_BIC').AsString + ''',' );    //BO_BIK_S
             q1.SQL.add( 'to_number(''' + adoCBDB.FieldByName('#SUMMA').AsString + ''',''999999999.99''),' ); //BO_SUMM
             q1.SQL.add( ''''+StringReplace(adoCBDB.FieldByName('#A_NAME').AsString,'''', '', [rfReplaceAll, rfIgnoreCase]) + ''',' ); //BO_SENDER
             q1.SQL.add( ''''+StringReplace(adoCBDB.FieldByName('#C_NAME').AsString,'''', '', [rfReplaceAll, rfIgnoreCase]) + ''',' ); //BO_RECEIVER
             q1.SQL.add( ''''+StringReplace(adoCBDB.FieldByName('#A_BANK_NAME').AsString,'''', '', [rfReplaceAll, rfIgnoreCase]) + ''',' ); //BO_BANK_S                                                           //BO_BANK_S
             q1.SQL.add( ''''+StringReplace(adoCBDB.FieldByName('#C_BANK_NAME').AsString,'''', '', [rfReplaceAll, rfIgnoreCase]) + ''',' ); //BO_BANK_R                                                           //BO_BANK_R
             q1.SQL.add( ''''+adoCBDB.FieldByName('#DOC_NUM').AsString+ ''',' );    //BO_NUM
             q1.SQL.add( 'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy', StrToDate(sdat) ) + ''',''dd.mm.yyyy''),' ); //BO_DT1
             q1.SQL.add( 'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy', StrToDate(sdat) ) + ''',''dd.mm.yyyy''),' ); //BO_DT2
             q1.SQL.add( '''' + adoCBDB.FieldByName('#PRIORITY').AsString + ''',' );  //BO_OCHER
             q1.SQL.add( 'null,' );              //BO_RESERV
             q1.SQL.add( '''' + StringReplace(adoCBDB.FieldByName('#NOTE').AsString,'''', '"', [rfReplaceAll, rfIgnoreCase]) + ''',' ); //BO_NAZN
             If trim(sACC) = trim(adoCBDB.FieldByName('#C_ACC').AsString)  Then
                  q1.SQL.add( '1,' )
             Else
                  q1.SQL.add( '-1,' );  //BO_VID
             q1.SQL.add( '0,' );      //BO_RN_PARUS
             q1.SQL.add( '''' + oraACC.Fieldbyname( 'id' ).asString + ''',' ); //ID
             q1.SQL.add( 'null,' );  //ID_DGV
             q1.SQL.add( 'null,' );  //BO_NUMSTR
             q1.SQL.add( '''' + sacc + ''',' );    //ACCKEY
             q1.SQL.add( 'null)' );    //ID_CODE
             q1.SQL.SaveToFile('c:\11111111111.sql');
             q1.Execute;
             WriteEvent( DateTimeToStr( Now ) + ': ��������� ������ � ������� ' + inttostr(
                         i + 1 ) + ' ������ ' + inttostr( i ) + '.', 3 );
             q1.SQL.Clear;
           End; //��� ����� ������

            i := i + 1;
            if i< pbStatus.Max then
            pbStatus.Position := i;
            adoCBDB.Next;
        End;
    adoCBDB.Close;
    pbStatus.Visible := false;
    q1.Session.Commit;

    adoCBDB.CommandText := 'SELECT [#RECAPP_KAS].[#DOC_DATE], CLNG([#RECAPP_KAS].[#KSPL1]) AS [#PRIORITY], [#REC].[#A_NAME] AS [#A_BANK_NAME], [#REC].[#A_NAME] AS [#A_NAME], [#REC].[#A_BIC] AS [#C_BANK_BIC], ';
    adoCBDB.CommandText := adoCBDB.CommandText + '[#REC].[#A_BIC] AS [#A_BANK_BIC], CDbl([#RECAPP_KAS].[#DOC_NUM]) AS [#DOC_NUM], [#RECAPP_KAS].[#INN] AS [#C_INN], "7707083893" AS [#A_INN],  [#REC].[#A_COR_ACC] AS [#C_BANK_KS], ';
    adoCBDB.CommandText := adoCBDB.CommandText + '[#REC].[#A_COR_ACC] AS [#A_BANK_KS], [#RECAPP_KAS].[#ACC_KAS] AS [#A_ACC], [#RECAPP_KAS].[#ACC] AS [#C_ACC], [#RECAPP_KAS].[#ACC_NAME] AS [#C_NAME], ';
    adoCBDB.CommandText := adoCBDB.CommandText + '[#RECAPP_KAS].[#BANK] AS [#C_BANK_NAME], [#RECAPP_KAS].[#SUM] AS [#SUMMA], [#RECAPP_KAS].[#NOTE] FROM (DOCUM AS DOCUM_1 INNER JOIN ';
    adoCBDB.CommandText := adoCBDB.CommandText + '[#REC] ON DOCUM_1.ID = [#REC].REF) INNER JOIN (DOCUM INNER JOIN [#RECAPP_KAS] ON DOCUM.ID = [#RECAPP_KAS].REF) ON DOCUM_1.CID = DOCUM.CREF ';
    adoCBDB.CommandText := adoCBDB.CommandText + 'WHERE (([#RECAPP_KAS].[#DATE_PROV])>= :doc_date And ([#RECAPP_KAS].[#DATE_PROV])<DateAdd("d",1, :doc_date1))';
    adoCBDB.Parameters.Clear;
    adoCBDB.Parameters.CreateParameter(':doc_date', ftString, pdInput, 0, null);
    adoCBDB.Parameters.CreateParameter(':doc_date1', ftString, pdInput, 0, null);
    adoCBDB.Parameters.ParamByName(':doc_date').Value := FormatDateTime( 'dd.mm.yyyy',StrToDate( sDAT ));
    adoCBDB.Parameters.ParamByName(':doc_date1').Value := FormatDateTime( 'dd.mm.yyyy',StrToDate( sDAT ));
    adoCBDB.Open;
    adoCBDB.First;
    i := 0;
    i := i ;
    pbStatus.Visible := true;
    pbStatus.Min := 0;
    pbStatus.Max := round( adoCBDB.RecordCount);
    sacc :=lcACC.Text;
    //oraACC.SearchRecord( 'bv_acc', trim( sACC ), [ srFromBeginning ] );
    //lcAcc.Value := oraACC.FieldByName( 'rn' ).AsString;

    q1.Clear;
    While not (adoCBDB.Eof) Do
        Begin
          //sacc := adoCBDB.FieldByName('#A_ACC').AsString;
          //sDAT := adoCBDB.FieldByName('#DOC_DATE').AsString;
          //edDate.Date := StrToDate( trim( sDAT ) );
          qSearch.ClearVariables;
          qSearch.SetVariable( ':acc', sacc );
          qSearch.SetVariable( ':ddate', FormatDateTime( 'dd.mm.yyyy', StrToDate( sDAT ) ) );
          qSearch.SetVariable( ':summ', strtofloat(adoCBDB.FieldByName('#SUMMA').AsString) );
          qSearch.SetVariable( ':num', adoCBDB.FieldByName('#DOC_NUM').AsString);
          qSearch.SetVariable( ':acc_r', adoCBDB.FieldByName('#C_ACC').AsString );
          qSearch.SetVariable( ':acc_s', adoCBDB.FieldByName('#A_ACC').AsString);
          qSearch.Execute;

          If qSearch.eof Then
               empty := true
          Else
             empty := false;

          qSearch.Close;

          If empty Then
          if (trim(adoCBDB.FieldByName('#A_ACC').AsString) = trim(sACC)) or (trim(adoCBDB.FieldByName('#C_ACC').AsString)=trim(sACC)) then
            Begin //��� ����� ������
             q1.SQL.add( 'insert into pvz_bnoprs (' );
             q1.SQL.add( 'BO_DT, BO_INN_R, BO_INN_S,' );
             q1.SQL.add( 'BO_KS_R, BO_KS_S, BO_ACC_R, BO_ACC_S,' );
             q1.SQL.add( 'BO_BIK_R, BO_BIK_S, BO_SUMM, BO_SENDER, BO_RECEIVER,' );
             q1.SQL.add( 'BO_BANK_S, BO_BANK_R, BO_NUM, BO_DT1, BO_DT2,' );
             q1.SQL.add( 'BO_OCHER, BO_RESERV, BO_NAZN, BO_VID, BO_RN_PARUS,' );
             q1.SQL.add( 'ID, ID_DGV, BO_NUMSTR, ACCKEY, ID_CODE)' );
             q1.SQL.add( 'values (' );
             q1.SQL.add( 'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy', StrToDate(sdat)) + ''',''dd.mm.yyyy''),'); //BO_DT
             q1.SQL.add( ''''+adoCBDB.FieldByName('#C_INN').AsString +''',' ); //BO_INN_R
             q1.SQL.add( ''''+adoCBDB.FieldByName('#A_INN').AsString +''',' ); //BO_INN_S
             q1.SQL.add( ''''+adoCBDB.FieldByName('#C_BANK_KS').AsString +''',' ); //BO_KS_R
             q1.SQL.add( ''''+adoCBDB.FieldByName('#A_BANK_KS').AsString +''',' ); //BO_KS_s
             q1.SQL.add( ''''+adoCBDB.FieldByName('#C_ACC').AsString + ''',' ); //BO_ACC_R
             q1.SQL.add( ''''+adoCBDB.FieldByName('#A_ACC').AsString + ''',' ); //BO_ACC_S
             q1.SQL.add( ''''+adoCBDB.FieldByName('#C_BANK_BIC').AsString + ''',' ); //BO_BIK_R
             q1.SQL.add( ''''+adoCBDB.FieldByName('#A_BANK_BIC').AsString + ''',' );    //BO_BIK_S
             q1.SQL.add( 'to_number(''' + adoCBDB.FieldByName('#SUMMA').AsString + ''',''999999999.99''),' ); //BO_SUMM
             q1.SQL.add( ''''+StringReplace(adoCBDB.FieldByName('#A_NAME').AsString,'''', '', [rfReplaceAll, rfIgnoreCase]) + ''',' ); //BO_SENDER
             q1.SQL.add( ''''+StringReplace(adoCBDB.FieldByName('#C_NAME').AsString,'''', '', [rfReplaceAll, rfIgnoreCase]) + ''',' ); //BO_RECEIVER
             q1.SQL.add( ''''+StringReplace(adoCBDB.FieldByName('#A_BANK_NAME').AsString,'''', '', [rfReplaceAll, rfIgnoreCase]) + ''',' ); //BO_BANK_S                                                           //BO_BANK_S
             q1.SQL.add( ''''+StringReplace(adoCBDB.FieldByName('#C_BANK_NAME').AsString,'''', '', [rfReplaceAll, rfIgnoreCase]) + ''',' ); //BO_BANK_R                                                           //BO_BANK_R
             q1.SQL.add( ''''+adoCBDB.FieldByName('#DOC_NUM').AsString+ ''',' );    //BO_NUM
             q1.SQL.add( 'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy',StrToDate( sdat ) ) + ''',''dd.mm.yyyy''),' ); //BO_DT1
             q1.SQL.add( 'TO_DATE(''' + FormatDateTime( 'dd.mm.yyyy',StrToDate( sdat ) ) + ''',''dd.mm.yyyy''),' ); //BO_DT2
             q1.SQL.add( '''' + adoCBDB.FieldByName('#PRIORITY').AsString + ''',' );  //BO_OCHER
             q1.SQL.add( 'null,' );              //BO_RESERV
             q1.SQL.add( '''' + StringReplace(adoCBDB.FieldByName('#NOTE').AsString,'''', '"', [rfReplaceAll, rfIgnoreCase]) + ''',' ); //BO_NAZN
             If trim(sACC) = trim(adoCBDB.FieldByName('#C_ACC').AsString)  Then
                  q1.SQL.add( '1,' )
             Else
                  q1.SQL.add( '-1,' );  //BO_VID
             q1.SQL.add( '0,' );      //BO_RN_PARUS
             q1.SQL.add( '''' + oraACC.Fieldbyname( 'id' ).asString + ''',' ); //ID
             q1.SQL.add( 'null,' );  //ID_DGV
             q1.SQL.add( 'null,' );  //BO_NUMSTR
             q1.SQL.add( '''' + sacc + ''',' );    //ACCKEY
             q1.SQL.add( 'null)' );    //ID_CODE
             //q1.SQL.SaveToFile('c:\11111111111.sql');
             q1.Execute;
             WriteEvent( DateTimeToStr( Now ) + ': ��������� ������ � ������� ' + inttostr(
                         i + 1 ) + ' ������ ' + inttostr( i ) + '.', 3 );
             q1.SQL.Clear;
           End; //��� ����� ������

            i := i + 1;
            if i< pbStatus.Max then
            pbStatus.Position := i;
            adoCBDB.Next;
        End;
    adoCBDB.Close;
    pbStatus.Visible := false;
    q1.Session.Commit;
    acFilterExecute( self );
End;

procedure Tcb2parus.acPKBExecute(Sender: TObject);
var
tt : string;
s1,s2 : ANSIString;
begin
//������ ���� TX1
re.Clear;
oraVyp.First;
While not (oraVyp.Eof) Do
Begin
tt:='';
if oraVyp.FieldByName('debet').AsInteger>0 then
begin
    tt:=trim(oraVyp.FieldByName('debet').AsString)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_inn_s').AsString),12)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_inn_r').AsString),12)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_bik_s').AsString),9)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_ks_s').AsString),20)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_acc_s').AsString),20)+'|';
    s1:=RightStr(trim(oraVyp.FieldByName('bo_sender').AsString),160);
    s2:=s1;
    chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
    tt:=tt+s2+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_bik_r').AsString),9)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_ks_r').AsString),20)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_acc_r').AsString),20)+'|';
    s1:=RightStr(trim(oraVyp.FieldByName('bo_receiver').AsString),160);
    s2:=s1;
    chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
    tt:=tt+s2+'|';
    s1:=RightStr(trim(oraVyp.FieldByName('bo_nazn').AsString),160);
    s2:=s1;
    chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
    tt:=tt+s2+'|';
    s1:=RightStr(trim(oraVyp.FieldByName('bo_bank_s').AsString),160);
    s2:=s1;
    chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
    tt:=tt+s2+'|';
    s1:=RightStr(trim(oraVyp.FieldByName('bo_bank_r').AsString),160);
    s2:=s1;
    chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
    tt:=tt+s2+'|';
    tt:=tt+trim(FormatDateTime('dd.mm.yyyy',oraVyp.FieldByName('bo_dt1').asdatetime))+'|';
    tt:=tt+trim(FormatDateTime('dd.mm.yyyy',oraVyp.FieldByName('bo_dt1').asdatetime))+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_num').AsString),10)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_ocher').AsString),2)+'||';
    re.Lines.Add(tt);
end;
oraVyp.Next;
end;
tt:='c:\tmp\70E8'+FormatDateTime('ddmm',StrToDate(edDate.Text))+'.tx1';
re.Lines.SaveToFile(tt);
//������ ���� TX2
re.Clear;
oraVyp.First;
While not (oraVyp.Eof) Do
Begin
tt:='';
if oraVyp.FieldByName('kredit').AsInteger>0 then
begin
    tt:=trim(oraVyp.FieldByName('kredit').AsString)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_inn_s').AsString),12)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_inn_r').AsString),12)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_bik_s').AsString),9)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_ks_s').AsString),20)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_acc_s').AsString),20)+'|';
    s1:=RightStr(trim(oraVyp.FieldByName('bo_sender').AsString),160);
    s2:=s1;
    chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
    tt:=tt+s2+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_bik_r').AsString),9)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_ks_r').AsString),20)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_acc_r').AsString),20)+'|';
    s1:=RightStr(trim(oraVyp.FieldByName('bo_receiver').AsString),160);
    s2:=s1;
    chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
    tt:=tt+s2+'|';
    s1:=RightStr(trim(oraVyp.FieldByName('bo_nazn').AsString),160);
    s2:=s1;
    chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
    tt:=tt+s2+'|';
    s1:=RightStr(trim(oraVyp.FieldByName('bo_bank_s').AsString),160);
    s2:=s1;
    chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
    tt:=tt+s2+'|';
    s1:=RightStr(trim(oraVyp.FieldByName('bo_bank_r').AsString),160);
    s2:=s1;
    chartooembuff( @s1[ 1 ], @s2[ 1 ], length( s1 ) );
    tt:=tt+s2+'|';
    tt:=tt+trim(FormatDateTime('dd.mm.yyyy',oraVyp.FieldByName('bo_dt1').asdatetime))+'|';
    tt:=tt+trim(FormatDateTime('dd.mm.yyyy',oraVyp.FieldByName('bo_dt1').asdatetime))+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_num').AsString),10)+'|';
    tt:=tt+RightStr(trim(oraVyp.FieldByName('bo_ocher').AsString),2)+'|1110300213|';
    re.Lines.Add(tt);
end;
oraVyp.Next;
end;
tt:='c:\tmp\70E8'+FormatDateTime('ddmm',StrToDate(edDate.Text))+'.tx2';
re.Lines.SaveToFile(tt);
//������ ���� TXT
re.Clear;
tt:='';
    tt:=RightStr(trim(oraACC.FieldByName('BV_BIK').AsString),9)+'|';
    tt:=tt+RightStr(trim(oraACC.FieldByName('bv_acc').AsString),20)+'|';
    tt:=tt+trim(FormatDateTime('dd.mm.yyyy',StrToDate(edDate.Text)))+'|';
    tt:=tt+trim(bv_sin.Caption)+'|';
    tt:=tt+trim(bv_out.Caption)+'|';
    tt:=tt+trim(bv_in.Caption)+'|';
    tt:=tt+trim(bv_sout.Caption);
    re.Lines.Add(tt);
tt:='c:\tmp\70E8'+FormatDateTime('ddmm',StrToDate(edDate.Text))+'.txt';
re.Lines.SaveToFile(tt);
//    re.lines := t;
//    WriteEvent( DateTimeToStr( Now ) + ': ��������� ' + trim( inttostr( i ) ) + ' �����.', 26 );

end;

End.