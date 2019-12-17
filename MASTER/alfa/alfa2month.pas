unit alfa2month;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, Mask, Buttons, DB, ADODB, XPStyleActnCtrls, StrUtils,MdiForm,
  ActnList, ActnMan, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, ExtCtrls, Grids,
  DBGridEh;

type
  TfrmAlfaLoadRequest = class(Tf_MDIForm)
    adoAlfaMonthIns: TADOQuery;
    adoAlfaMonthUpd: TADOQuery;
    ActionManager1: TActionManager;
    acLoadAlfaRequest: TAction;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    adoAM: TADODataSet;
    dsAM: TDataSource;
    Panel1: TPanel;
    btnLoad: TBitBtn;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    procedure acLoadAlfaRequestExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlfaLoadRequest: TfrmAlfaLoadRequest;

implementation

{$R *.dfm}
procedure ScanDir(StartDir: string; Mask:string; List:TStrings);
var
SearchRec : TSearchRec;
begin
if Mask = '' then Mask := '*.*';
if StartDir[Length(StartDir)] <> '\' then StartDir := StartDir + '\';
if FindFirst(StartDir+Mask, faAnyFile, SearchRec) = 0 then
begin
  repeat
  Application.ProcessMessages;
   if (SearchRec.Attr and faDirectory) <> faDirectory then
       List.Add(StartDir + SearchRec.Name)
   else if (SearchRec.Name <> '..') and (SearchRec.Name <> '.') then
       begin
         List.Add(StartDir + SearchRec.Name + '\');
         ScanDir(StartDir + SearchRec.Name+ '\',Mask,List);
       end;
  until FindNext(SearchRec) <> 0;
 FindClose(SearchRec);
end;
end;

procedure CopyFileFast(const SrcFile, DstFile: string);
const
  bufSize = 16384; {Use a 16K buffer. You can use whatever size suits you, though.}
var
  sStream,
  dStream : TFileStream;
  pBuf    : Pointer;
  cnt     : Integer;
  totCnt,
  X, 
  strmSize    : LongInt;
begin
  totCnt := 0;
  {Open up the Source File to read it  or fmShareDenyWrite}
  sStream := TFileStream.Create(SrcFile, fmOpenRead or fmShareDenyWrite);

  {Get the size of the entire stream to use for the progress gauge. Note
   we have to call FileSeek first because it will place the pointer
   at the end of the file when we get the file first return value.}
  strmSize := sStream.size;

  try
    { Create the destination file. If it already exists,
      overwrite it. }
    dStream := TFileStream.Create(DstFile, fmCreate or fmShareExclusive);
    try
      GetMem(pBuf, bufSize);
      try
        {Read and write first bufSize bytes from source into the buffer
         If the file size is smaller than the default buffer size, then
         all the user will see is a quick flash of the progress form.}
        cnt := sStream.Read(pBuf^, bufSize);
        cnt := dStream.Write(pBuf^, cnt);

        totCnt := totCnt + cnt;
        {Loop the process of reading and writing}
        while (cnt > 0) do begin
          {Let things in the background proceed while loop is processing}
          Application.ProcessMessages;

          {Read bufSize bytes from source into the buffer}
          cnt := sStream.Read(pBuf^, bufSize);

          {Now write those bytes into destination}
          cnt := dStream.Write(pBuf^, cnt);

          {Increment totCnt for progress and do arithmetic to update the
           gauge}
          totcnt := totcnt + cnt;
         end;
      finally
        FreeMem(pBuf, bufSize);
      end;
    finally
      dStream.Free;
    end;
  finally
    sStream.Free;
  end;
end;

procedure TfrmAlfaLoadRequest.acLoadAlfaRequestExecute(Sender: TObject);
var
i, j                                  : integer;
Src, Dst, work_file                   : String[255];
Path2File                             : string;
FileList,MailBody                     : TStrings;
adoSource,adoInAlphaMonth             : TADODataSet;
CurrStatus                            : integer;
adoRe                                 : TADOQuery;
ac                                    : TADOConnection;
iFileHandle                           : Integer;
s                                     : char;

procedure InsAlphaMon;
begin
        with adoAlfaMonthIns.Parameters do
        begin
         ParamByName('M_Y1').Value:=adoSource.FieldByName('M_Y').AsDateTime;
         ParamByName('CON_ID1').Value:=adoSource.FieldByName('CON_ID').AsInteger;
         ParamByName('XCONFIRM1').Value:=adoSource.FieldByName('XCONFIRM').AsInteger;
         ParamByName('QUANTITY1').Value:=adoSource.FieldByName('QUANTITY').AsFloat;
         ParamByName('MON_D1').Value:=adoSource.FieldByName('MON_D').AsInteger;
         ParamByName('MON_DELIV1').Value:=adoSource.FieldByName('MON_DELIV').AsInteger;
         ParamByName('ZP1').Value:=adoSource.FieldByName('ZP').AsString;
         ParamByName('ZP_DATE1').Value:=adoSource.FieldByName('ZP_DATE').AsDateTime;
         ParamByName('TELEGA1').Value:=adoSource.FieldByName('TELEGA').AsString;
         ParamByName('T_DATE1').Value:=adoSource.FieldByName('T_DATE').AsDateTime;
         ParamByName('HEAD_Q1').Value:=adoSource.FieldByName('HEAD_Q').AsInteger;
         ParamByName('FAKT1').Value:=adoSource.FieldByName('FAKT').AsFloat;
         ParamByName('RES_ID1').Value:=adoSource.FieldByName('RES_ID').AsInteger;
         ParamByName('JL_1').Value:=adoSource.FieldByName('JL').AsString;
         ParamByName('REPL_RES1').Value:=adoSource.FieldByName('REPL_RES').AsInteger;
         ParamByName('JL1_1').Value:=adoSource.FieldByName('JL1').AsString;
         ParamByName('DIR_ID1').Value:=adoSource.FieldByName('DIR_ID').AsInteger;
         ParamByName('NA1').Value:=adoSource.FieldByName('NA').AsString;
         ParamByName('KIND_ID1').Value:=adoSource.FieldByName('KIND_ID').AsInteger;
         ParamByName('ACTION1').Value:=adoSource.FieldByName('ACTION').asstring;
         ParamByName('ROUT_NAME1').Value:=adoSource.FieldByName('ROUT_NAME').AsString;
         ParamByName('CONTRACT1').Value:=adoSource.FieldByName('CONTRACT').AsString;
         ParamByName('DATA1').Value:=adoSource.FieldByName('DATA').AsDateTime;
         ParamByName('BUYER_ID1').Value:=adoSource.FieldByName('BUYER_ID').AsInteger;
         ParamByName('BUYER1').Value:=adoSource.FieldByName('BUYER').AsString;
         ParamByName('EXPEDITOR1').Value:=adoSource.FieldByName('EXPEDITOR').AsInteger;
         ParamByName('EXPED_NAME1').Value:=adoSource.FieldByName('EXPED_NAME').AsString;
         ParamByName('OTPRAV1').Value:=adoSource.FieldByName('OTPRAV').AsInteger;
         ParamByName('OTPR_name1').Value:=adoSource.FieldByName('OTPR_name').AsString;
         ParamByName('POLU1').Value:=adoSource.FieldByName('POLU').AsInteger;
         ParamByName('POLU_NAME1').Value:=adoSource.FieldByName('POLU_NAME').AsString;
         ParamByName('INCO1').Value:=adoSource.FieldByName('INCO').AsInteger;
         ParamByName('TERMS_RUS1').Value:=adoSource.FieldByName('TERMS_RUS').AsString;
         ParamByName('STAN1').Value:=adoSource.FieldByName('STAN').AsInteger;
         ParamByName('POINT_NAME1').Value:=adoSource.FieldByName('POINT_NAME').AsString;
         ParamByName('UUN1').Value:=adoSource.FieldByName('UUN').AsString;
         ParamByName('ORD_STATUS1').Value:=adoSource.FieldByName('ord_Status').AsInteger;
        end;
        adoAlfaMonthIns.ExecSQL;
end;
procedure UpdAlphaMon;
begin
         with adoAlfaMonthUpd.Parameters do
        begin
          ParamByName('M_Y1').Value:=adoSource.FieldByName('M_Y').AsDateTime;
          ParamByName('CON_ID1').Value:=adoSource.FieldByName('CON_ID').AsInteger;
          ParamByName('XCONFIRM1').Value:=adoSource.FieldByName('XCONFIRM').AsInteger;
          ParamByName('QUANTITY1').Value:=adoSource.FieldByName('QUANTITY').AsFloat;
          ParamByName('MON_D1').Value:=adoSource.FieldByName('MON_D').AsInteger;
          ParamByName('MON_DELIV1').Value:=adoSource.FieldByName('MON_DELIV').AsInteger;
          ParamByName('ZP1').Value:=adoSource.FieldByName('ZP').AsString;
          ParamByName('ZP_DATE1').Value:=adoSource.FieldByName('ZP_DATE').AsDateTime;
          ParamByName('TELEGA1').Value:=adoSource.FieldByName('TELEGA').AsString;
          ParamByName('T_DATE1').Value:=adoSource.FieldByName('T_DATE').AsDateTime;
          ParamByName('HEAD_Q1').Value:=adoSource.FieldByName('HEAD_Q').AsInteger;
          ParamByName('FAKT1').Value:=adoSource.FieldByName('FAKT').AsFloat;
          ParamByName('RES_ID1').Value:=adoSource.FieldByName('RES_ID').AsInteger;
          ParamByName('JL_1').Value:=adoSource.FieldByName('JL').AsString;
          ParamByName('REPL_RES1').Value:=adoSource.FieldByName('REPL_RES').AsInteger;
          ParamByName('JL1_1').Value:=adoSource.FieldByName('JL1').AsString;
          ParamByName('DIR_ID1').Value:=adoSource.FieldByName('DIR_ID').AsInteger;
          ParamByName('NA1').Value:=adoSource.FieldByName('NA').AsString;
          ParamByName('KIND_ID1').Value:=adoSource.FieldByName('KIND_ID').AsInteger;
          ParamByName('ACTION1').Value:=adoSource.FieldByName('ACTION').asstring;
          ParamByName('ROUT_NAME1').Value:=adoSource.FieldByName('ROUT_NAME').AsString;
          ParamByName('CONTRACT1').Value:=adoSource.FieldByName('CONTRACT').AsString;
          ParamByName('DATA1').Value:=adoSource.FieldByName('DATA').AsDateTime;
          ParamByName('BUYER_ID1').Value:=adoSource.FieldByName('BUYER_ID').AsInteger;
          ParamByName('BUYER1').Value:=adoSource.FieldByName('BUYER').AsString;
          ParamByName('EXPEDITOR1').Value:=adoSource.FieldByName('EXPEDITOR').AsInteger;
          ParamByName('EXPED_NAME1').Value:=adoSource.FieldByName('EXPED_NAME').AsString;
          ParamByName('OTPRAV1').Value:=adoSource.FieldByName('OTPRAV').AsInteger;
          ParamByName('OTPR_name1').Value:=adoSource.FieldByName('OTPR_name').AsString;
          ParamByName('POLU1').Value:=adoSource.FieldByName('POLU').AsInteger;
          ParamByName('POLU_NAME1').Value:=adoSource.FieldByName('POLU_NAME').AsString;
          ParamByName('INCO1').Value:=adoSource.FieldByName('INCO').AsInteger;
          ParamByName('TERMS_RUS1').Value:=adoSource.FieldByName('TERMS_RUS').AsString;
          ParamByName('STAN1').Value:=adoSource.FieldByName('STAN').AsInteger;
          ParamByName('POINT_NAME1').Value:=adoSource.FieldByName('POINT_NAME').AsString;
          ParamByName('UUN1').Value:=adoSource.FieldByName('UUN').AsString;
          ParamByName('ORD_STATUS1').Value:=adoSource.FieldByName('ord_Status').AsInteger;
        end;
        adoAlfaMonthUpd.ExecSQL;
end;
begin
btnLoad.Enabled:=false;
FileList:=TStringList.Create;
MailBody:=TStringList.Create;
Path2File:='U:\IMPEX\EXPORT\ALFA\IN';
MailBody.Add('Сканирована директория: '+Path2File);
ScanDir(Path2File,'*.dbf',FileList);
if FileList.Count>0 then //Проверка есть ли файлы
begin
 for i:=0 to FileList.Count-1 do
 begin
   //Чтобы можно было удалить файл
   Src := FileList.Strings[i] + #0;
   dst :='\\kmint40\outmail\alphamail@lukoil.com\'+ExtractFileName(FileList.Strings[i])+ #0;
   CopyFileFast(Src, Dst);
   work_file :='\\kmint40\outmail\alphamail@lukoil.com\'+ExtractFileName(FileList.Strings[i]);
   //процедура смены кодовой страницы
   s := chr(101); //кодовая страница 866 для foxpro
   iFileHandle := FileOpen(work_file, fmOpenWrite);
   FileSeek(iFileHandle, 29, 0);
   FileWrite(iFileHandle, s, 1);
   fileClose(iFileHandle);
   ac:=TADOConnection.Create(self);
   ac.ConnectionString:= 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf';
   ac.ConnectOptions:=coAsyncConnect;
   ac.LoginPrompt:=false;
   ac.Connected:=true;
   adoRe:=TADOQuery.Create(self);
   adoRe.Connection:=ac;
   adoRe.ParamCheck:=false;
   adoRe.ExecuteOptions:= [eoExecuteNoRecords];
   adoInAlphaMonth:=TADODataSet.Create(self);
   adoInAlphaMonth.ConnectionString:= 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf';
   adoInAlphaMonth.ParamCheck:=false;
   adoSource:=TADODataSet.Create(self);
   adoSource.Connection:=ac;
   adoSource.ParamCheck:=false;
   adoSource.ExecuteOptions:= [eoAsyncFetchNonBlocking];
//   adoSource.CommandText:='Select * from '+FileList.Strings[i];
   adoSource.CommandText:='Select * from '+work_file;
   adoSource.Prepared:=true;
   adoSource.Open;
   adoSource.First;
   MailBody.Add('Начало обработки файла '+FileList.Strings[i]+' содержащего '+inttostr(adoSource.RecordCount)+' записей...');
   if adoSource.RecordCount>0 then
    for j:=0 to adoSource.RecordCount-1 do
    begin
    adoRe.sql.Clear;
    adoInAlphaMonth.CommandText:='select ord_status from alfamon where con_id='+adoSource.FieldByName('CON_ID').AsString;
    adoInAlphaMonth.Open;
    if adoInAlphaMonth.RecordCount>0 then
      CurrStatus:= adoInAlphaMonth.FieldByName('ord_Status').AsInteger
    else
      CurrStatus:=0;
    adoInAlphaMonth.Close;
    case adoSource.FieldByName('ord_Status').AsInteger of
    2: if CurrStatus=0 then   // Такой записи нет
       begin //Добавление
        // Добавляем в alfamon
        InsAlphaMon;
        MailBody.Add('Добавлена заявка № '+adoSource.FieldByName('TELEGA').AsString+' ...');
        adoRe.sql.Add('update '+work_file+' set ord_status=4 where con_id='+adoSource.FieldByName('CON_ID').AsString);
       end else
        adoRe.sql.Add('update '+work_file+' set ord_status=7 where con_id='+adoSource.FieldByName('CON_ID').AsString);
    5: if (CurrStatus<>6) then
       begin // Изменение
        if CurrStatus=0 then //Запись не найдена (возможно не было вставки записи)
        InsAlphaMon else         // Добавляем в alfamon
        UpdAlphaMon;             // Изменяем в alfamon
        MailBody.Add('Обновлена заявка № '+adoSource.FieldByName('TELEGA').AsString+' ...');
        adoRe.sql.Add('update '+work_file+' set ord_status=4 where con_id='+adoSource.FieldByName('CON_ID').AsString);
       end else
        adoRe.sql.Add('update '+work_file+' set ord_status=7 where con_id='+adoSource.FieldByName('CON_ID').AsString);
    6: if (CurrStatus<>0) then
       begin  //Удаление
        // Изменяем в alfamon
        UpdAlphaMon;
        MailBody.Add('Удалена заявка № '+adoSource.FieldByName('TELEGA').AsString+' ...');
        adoRe.sql.Add('update '+work_file+' set ord_status=8 where con_id='+adoSource.FieldByName('CON_ID').AsString);
       end else
        adoRe.sql.Add('update '+work_file+' set ord_status=7 where con_id='+adoSource.FieldByName('CON_ID').AsString);
    else
        adoRe.sql.Add('update '+work_file+' set ord_status=7 where con_id='+adoSource.FieldByName('CON_ID').AsString);
   end;
//формируем ответный файл
   adoRe.ExecSQL;
   adoRe.Close;
   adoSource.Next;
 end;
   FreeAndNil(adoInAlphaMonth);
   FreeAndNil(adoRe);
   adoSource.Close;
   FreeAndNil(adoSource);
   FreeAndNil(ac);
//   Src := FileList.Strings[i] + #0;
//   dst :='\\kmint40\outmail\alphamail@lukoil.com\'+ExtractFileName(FileList.Strings[i])+ #0;
//   CopyFileFast(Src, Dst);
   MailBody.Add('Файл '+FileList.Strings[i]+' отправлен на alphamail@lukoil.com');
   dst:=ChangeFileExt(FileList.Strings[i],'.BAK');
   CopyFileFast(Src, Dst);
   deletefile(FileList.Strings[i]);
 end;
end;
  IdMessage.Body.Clear;
    For i := 0 To mailbody.Count - 1 Do
      IdMessage.Body.Add(mailbody.Strings[i]);
    With IdMessage Do
    Begin
      ContentType := 'text/plain';
      From.Text := 'LUK-SNP Alpha-Loader';
      Sender.Text := 'LUK-SNP Alpha-Loader';
      Recipients.EMailAddresses := 'JRomanov@komiTU.LUKoil.com;NPopov@komiTU.LUKoil.com';
      Subject := 'LUK-SNP Alpha-Loader';
    End;
    With IdSMTP Do
//    Begin
        Try
          Connect;
          Send(IdMessage);
          Disconnect;
        Except On E: Exception Do
            If connected Then
              Try
                disconnect;
              Except
              End;
        End;
mailbody.Destroy;
filelist.Destroy;
//close;
btnLoad.Enabled:=true;
end;

procedure TfrmAlfaLoadRequest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if adoAM.Active then
  adoam.Close;
  action:=caFree;
end;

procedure TfrmAlfaLoadRequest.BitBtn1Click(Sender: TObject);
begin
  inherited;
if adoAM.Active then
  adoam.Close;
adoAM.Open;
end;

end.
