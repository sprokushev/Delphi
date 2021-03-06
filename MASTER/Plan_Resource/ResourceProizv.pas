unit ResourceProizv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, ADODB, Grids, DBGridEh, ExtCtrls, ActnList,
	XPStyleActnCtrls, ActnMan, StdCtrls, Buttons,MdiForm, OracleData, Oracle,
  GridsEh;

type
	TfrmResourceProizv = class(Tf_MDIForm)
    Panel1: TPanel;
    deDate: TDateTimePicker;
    Panel2: TPanel;
    dsProizv: TDataSource;
    DBGridEh1: TDBGridEh;
    ActionManager1: TActionManager;
    acApply: TAction;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    oraSes: TOracleSession;
    oraPP: TOracleDataSet;
    oraPPdata: TDateTimeField;
    oraPPMax_plan: TFloatField;
    oraPPSum_ostat: TFloatField;
    oraPPSum_hran: TFloatField;
    oraPPSum_ostat_tek1: TFloatField;
    oraPPSum_hran_tek: TFloatField;
    oraPPSum_plan_day: TFloatField;
    oraPPSum_plan_nar: TFloatField;
    oraPPSum_graf_nar: TFloatField;
    oraPPSum_fakt_nar: TFloatField;
    oraPPSum_otgr_nar: TFloatField;
    oraPPSum_reform: TFloatField;
    oraPPSum_vsegoza: TFloatField;
    oraPPPlanUtMSK: TFloatField;
    oraPPPrin: TFloatField;
    oraPPPok: TFloatField;
    oraPPDavUtMSK: TFloatField;
    oraPPSum_OstatTov: TFloatField;
    oraPPSum_ostat_tek: TFloatField;
    oraPPSum_OperPlan: TFloatField;
    oraPPOtklGraf: TFloatField;
    oraPPNAME_NPR: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure oraPPCalcFields(DataSet: TDataSet);
  private
		{ Private declarations }
  public
		{ Public declarations }
	ProizvTemp:string;

	end;

const
	ODBC_ADD_DSN = 1;        // ��������� �������� ������
	ODBC_CONFIG_DSN = 2;     // ������������� (�����������) �������� ������
	ODBC_REMOVE_DSN = 3;     // ������� �������� ������
	ODBC_ADD_SYS_DSN = 4;    // ��������� ��������� DSN
	ODBC_CONFIG_SYS_DSN = 5; // ������������� ��������� DSN
	ODBC_REMOVE_SYS_DSN = 6; // ������� ��������� DSN
type
  TSQLConfigDataSource = function( hwndParent: HWND; 
                                   fRequest: WORD; 
                                   lpszDriver: LPCSTR; 
																	 lpszAttributes: LPCSTR ) : BOOL; stdcall;

var
	frmResourceProizv: TfrmResourceProizv;

implementation
uses  ForDB;
{$R *.dfm}

procedure TfrmResourceProizv.FormCreate(Sender: TObject);
var 
  pFn: TSQLConfigDataSource; 
  hLib: LongWord; 
  strDriver: string; 
	strAttr: string;
	strFile: string;
	fResult: BOOL;
	srInfo : TSearchRec;
begin
{	strFile := 'u:\luk\plan\dbforplan.mdb';   // �������� ���� ������ (Axes = Access)
	hLib := LoadLibrary( 'ODBCCP32' );    // ��������� ���������� (���� �� ���������)
	if( hLib <> NULL ) then
  begin 
    @pFn := GetProcAddress( hLib, 'SQLConfigDataSource' ); 
    if( @pFn <> nil ) then 
		begin
//		if( FindFirst( strFile, 0, srInfo ) <> 0 ) then
//			begin
			// �������� �������� DSN
			strDriver := 'Microsoft Access Driver (*.mdb)';
			strAttr := Format( 'DSN=PLAN_ACC'+#0+
												 'DBQ=%s'+#0+
												 'Exclusive=0'+#0+
												 'ReadOnly=1'+#0+
												 'Description=Plan'+#0+#0,
												 [strFile] );
			fResult := pFn( 0, ODBC_ADD_SYS_DSN, @strDriver[1], @strAttr[1] );
        if( fResult = false ) then ShowMessage( '������ �������� MDB (����� ���� ������) !' ); 
//      end;
//			FindClose( srInfo );
			end;
		FreeLibrary( hLib );
	end
	else
		ShowMessage( '���������� ��������� ODBCCP32.DLL' );
ProizvTemp:=ProizvText;  }
f_db.LogonMasterSession(oraSes);
deDate.Date:=date-1;
end;

procedure TfrmResourceProizv.acApplyExecute(Sender: TObject);
begin
if oraPP.Active then oraPP.Close;
{ProizvTemp:=ProizvText+' and (Dayly_Fact.data<=datevalue('''+FormatDateTime('dd.mm.yyyy', deDate.Date)+''') '+
		 'AND Format(Dayly_fact.data,''yyyymm'')=Format(datevalue('''+FormatDateTime('dd.mm.yyyy', deDate.Date)+'''),''yyyymm''))'+
		 'GROUP BY PROD.NAIM_PR, Dayly_fact.data '+
		 'HAVING Dayly_fact.data=datevalue('''+FormatDateTime('dd.mm.yyyy', deDate.Date)+''') '+
		 'ORDER BY PROD.NAIM_PR';
adoProizv.CommandText:=ProizvTemp;
adoProizv.Open;  }
oraPP.SetVariable(':DB',FormatDateTime('dd.mm.yyyy', deDate.Date));
oraPP.Open;
end;

procedure TfrmResourceProizv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
oraSes.Connected:=false;
action:=caFree;
end;

procedure TfrmResourceProizv.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  If odd(oraPP.RecNo) Then
    background := clMoneyGreen;

end;

procedure TfrmResourceProizv.oraPPCalcFields(DataSet: TDataSet);
begin
  inherited;
oraPPOtklGraf.Value:=oraPPSum_fakt_nar.Value-oraPPSum_graf_nar.Value;
end;

end.
