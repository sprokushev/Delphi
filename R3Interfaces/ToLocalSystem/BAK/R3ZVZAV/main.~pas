unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Oracle, StdCtrls,CSVToDB;

type
  TMainForm = class(TForm,IInformation)
    Memo: TMemo;
    OracleQuery1: TOracleQuery;
    ora_Session: TOracleSession;
    Timer: TTimer;
    ProcessButton: TButton;
    OpenDialog: TOpenDialog;
    FieldsEdit: TEdit;
    procedure TimerTimer(Sender: TObject);
    procedure ProcessButtonClick(Sender: TObject);
  private
    { Private declarations }
  function ZVZAV(filename: string):integer;
  procedure Information(Info:string);
  public
    { Public declarations }
  constructor Create(AOwner: TComponent); override;
  end;

var
  MainForm: TMainForm;

implementation
{$R *.dfm}

uses CSVToDBOra,SystemConstants;

{ TMainForm }

constructor TMainForm.Create(AOwner: TComponent);
var path:string;
begin
inherited;
try
 try
 ora_Session.Connected:=TRUE;
 except
 Memo.Lines.Add('Возникло исключение при подключении');
 raise;
 end;
 DecimalSeparator:='.';
 Memo.Lines.Add('Установлено соединение с Oracle');
 path:=paramstr(1);
 if path='' then ProcessButton.visible:=True
     else
     begin
     if path<>'' then ZVZAV(path);
     Memo.Lines.Add('Приложение будет закрыто через 3 секунды');
     Timer.Enabled:=TRUE;
     end;
except
end;
end;

procedure TMainForm.Information(Info: string);
begin
Memo.Lines.Add(Info);
end;


function TMainForm.ZVZAV(filename: string): integer;
var CSVToDBMapper:TCSVToDBMapper;
    ORASQLEXPRESSION:TORASQLEXPRESSION;
begin
try
Memo.Lines.Add('Обработка файла '+filename);
ORASQLEXPRESSION:=TORASQLEXPRESSION.create(OracleQuery1,self);
   try
   CSVToDBMapper:=TCSVToDBMapper.create('XX101_ZVZAV_DATA',TFieldsMapDefault.create(
                    [
                    ConvertMap(3,TConversionDateClass.Create('DDMMYYYY','dd.mm.yyyy')),
                    ConvertMap(4,TConversionDateClass.Create('DDMMYYYY','dd.mm.yyyy')),
                    ConvertMap(36,TConversionDateClass.Create('YYYYMMDD','dd.mm.yyyy'))
                    ]
                    ,FieldsEdit.Text));
      try
      CSVToDBMapper.MapFile(filename,ORASQLEXPRESSION,'filename=$filename$;ParseDateTime=$date$');


      Memo.Lines.Add('Предобработка выполнена');
      Memo.Lines.Add('Занесение в БД');
      ORASQLEXPRESSION.Execute;
      Memo.Lines.Add('Занесение в БД выполнено');
      OracleQuery1.Clear;

{      Memo.Lines.Add('Запуск пост обработки');
      OracleQuery1.SQL.Add('BEGIN');
      OracleQuery1.SQL.Add('Xx101_ZKERP_EXEC_PENDINGACTION;');
      OracleQuery1.SQL.Add('END;');
      OracleQuery1.Execute;        }
      
      Memo.Lines.Add('Пост обработка выполнена');
      ora_Session.Commit;
      Memo.Lines.Add('Транзакция завершена');
      finally
      CSVToDBMapper.Free;
      end;
   finally
   ORASQLEXPRESSION.free;
   end;
result:=CONST_OK;
except
Memo.Lines.Add('В процессе работы возникла ошибка');
result:=CONST_EXCEPTION;
end;
end;

procedure TMainForm.TimerTimer(Sender: TObject);
begin
close;
end;

procedure TMainForm.ProcessButtonClick(Sender: TObject);
begin
if OpenDialog.Execute then ZVZAV(OpenDialog.FileName);
end;

end.
