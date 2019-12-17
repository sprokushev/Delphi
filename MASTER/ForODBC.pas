unit ForODBC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

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
  
type
  TF_ODBC = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ODBC: TF_ODBC;

implementation

{$R *.dfm}

end.
