unit ForODBC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

const
	ODBC_ADD_DSN = 1;        // Добавляем источник данных
	ODBC_CONFIG_DSN = 2;     // Конфигурируем (редактируем) источник данных
	ODBC_REMOVE_DSN = 3;     // Удаляем источник данных
	ODBC_ADD_SYS_DSN = 4;    // Добавляем системный DSN
	ODBC_CONFIG_SYS_DSN = 5; // Конфигурируем системный DSN
	ODBC_REMOVE_SYS_DSN = 6; // удаляем системный DSN

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
