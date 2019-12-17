unit Calls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, Grids, DBGridEh, OracleData, Oracle, MdiForm,
  ActnList, XPStyleActnCtrls, ActnMan, TB2Dock, TB2Toolbar, TB2Item;

type
  Tf_Calls = class(Tf_MDIForm)
    t_Emails: TOracleDataSet;
    ds_Emails: TDataSource;
    t_EmailsEMAIL: TStringField;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    t_Calls: TOracleDataSet;
    ds_Calls: TDataSource;
    t_CallsCALLTIME: TDateTimeField;
    t_CallsCALLLENGTH: TFloatField;
    t_CallsTONUMBER: TStringField;
    t_CallsSUMMA: TFloatField;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    ActionManager1: TActionManager;
    acSendOne: TAction;
    TBItem1: TTBItem;
    acSendAll: TAction;
    TBItem2: TTBItem;
    procedure t_CallsBeforeOpen(DataSet: TDataSet);
    procedure t_EmailsAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acSendOneExecute(Sender: TObject);
    procedure acSendAllExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_Calls: Tf_Calls;

implementation
uses DBGridEhImpExp, ForDB, main;
{$R *.dfm}

procedure Tf_Calls.t_CallsBeforeOpen(DataSet: TDataSet);
begin
  t_Calls.SQL[9]:='kls_phones.email='''+t_Emails.FieldByName('email').AsString+'''';
end;

procedure Tf_Calls.t_EmailsAfterScroll(DataSet: TDataSet);
begin
  f_db.ReQuery(t_Calls,False);
  acSendOne.Caption:='Отправить на '+t_Emails.fieldbyname('email').AsString;
end;

procedure Tf_Calls.FormCreate(Sender: TObject);
begin
  t_calls.Session:=f_main.ora_Session;
  t_emails.Session:=f_main.ora_session;
  t_Calls.Open;
  t_Emails.Open;
end;

procedure Tf_Calls.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  t_Calls.Close;
  t_Emails.Close;
  Action:=caFree;
end;

procedure Tf_Calls.acSendOneExecute(Sender: TObject);
begin
  if t_Calls.RecordCount>0 then
    begin
      if DirectoryExists(f_main.EMailPath+t_Emails.FieldByName('email').AsString) then
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh2,f_main.EMailPath+t_Emails.FieldByName('email').AsString+'\calls.xls',True)
      else
        ShowMessage('Нет директории для отправки!');
    end
  else
    ShowMessage('А звонков то нет! :)');
end;

procedure Tf_Calls.acSendAllExecute(Sender: TObject);
begin
  t_Emails.First;
  while not t_Emails.Eof do
    begin
      if t_Calls.RecordCount>0 then
        begin
          if DirectoryExists(f_main.EMailPath+t_Emails.FieldByName('email').AsString) then
            SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh2,f_main.EMailPath+t_Emails.FieldByName('email').AsString+'\calls.xls',True)
          else
            ShowMessage('Нет директории для отправки! на '+t_Emails.FieldByName('email').AsString);
        end;
      t_Emails.Next;
    end;
end;

end.
