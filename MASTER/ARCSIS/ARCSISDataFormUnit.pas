unit ARCSISDataFormUnit;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, GridsEh, DBGridEh, StdCtrls,DBGridEhImpExp, RxShell, PrnDbgeh,
  ComCtrls,DateUtils, MdiForm, ExtCtrls, ForSystem;

type
  TARCSISDATAFORM = class(Tf_MDIForm)
    ADOConnection: TADOConnection;
    ds_TareTrains: TDataSource;
    ds_TareVagons: TDataSource;
    ehprTareVagons: TPrintDBGridEh;
    PageControl1: TPageControl;
    TabTare: TTabSheet;
    gridTareTrains: TDBGridEh;
    gridTareVagons: TDBGridEh;
    Memo1: TMemo;
    TabReady: TTabSheet;
    TabProto: TTabSheet;
    q_TareTrains: TADOQuery;
    q_TareTrainsTrainID: TAutoIncField;
    q_TareTrainsSourceTrainID: TIntegerField;
    q_TareTrainsTrainDate: TDateTimeField;
    q_TareTrainsTrainNumber: TStringField;
    q_TareTrainsUserComment: TStringField;
    q_TareTrainsUserID: TBlobField;
    q_TareTrainsDirection: TBooleanField;
    q_TareTrainsWayOfLoadingID: TIntegerField;
    q_TareTrainsVagonsCount: TIntegerField;
    q_TareTrainsWayOfLoadingName: TStringField;
    q_TareVagons: TADOQuery;
    SaveDialog: TSaveDialog;
    q_TareVagonsID: TAutoIncField;
    q_TareVagonsSourceVagonID: TIntegerField;
    q_TareVagonsTrainID: TIntegerField;
    q_TareVagonsVagonTypeID: TIntegerField;
    q_TareVagonsMarkingID: TIntegerField;
    q_TareVagonsConsignorID: TIntegerField;
    q_TareVagonsConsigneeID: TIntegerField;
    q_TareVagonsMPSID: TStringField;
    q_TareVagonsVagonNumber: TIntegerField;
    q_TareVagonsWeightGross: TIntegerField;
    q_TareVagonsWeightTare: TIntegerField;
    q_TareVagonsWeightNet: TIntegerField;
    q_TareVagonsWeightBillWeight: TIntegerField;
    q_TareVagonsTonnage: TIntegerField;
    q_TareVagonsWeightBillNumber: TStringField;
    q_TareVagonsWeightBillDate: TDateTimeField;
    q_TareVagonsSpeed: TFloatField;
    q_TareVagonsAxles: TWordField;
    q_TareVagonsUserComment: TStringField;
    q_TareVagonsStatus: TWordField;
    q_TareVagonsVagonTypeName: TStringField;
    q_ReadyTrains: TADOQuery;
    q_ReadyTrainsTrainID: TAutoIncField;
    q_ReadyTrainsSourceTrainID: TIntegerField;
    q_ReadyTrainsUserID: TBlobField;
    q_ReadyTrainsTrainDate: TDateTimeField;
    q_ReadyTrainsTrainNumber: TStringField;
    q_ReadyTrainsDirection: TBooleanField;
    q_ReadyTrainsWayOfLoadingID: TIntegerField;
    q_ReadyTrainsVagonsCount: TIntegerField;
    q_ReadyTrainsUserComment: TStringField;
    q_ReadyTrainsWayOfLoadingName: TStringField;
    q_ReadyVagons: TADOQuery;
    q_ReadyVagonsID: TAutoIncField;
    q_ReadyVagonsSourceVagonID: TIntegerField;
    q_ReadyVagonsTrainID: TIntegerField;
    q_ReadyVagonsVagonTypeID: TIntegerField;
    q_ReadyVagonsMarkingID: TIntegerField;
    q_ReadyVagonsConsignorID: TIntegerField;
    q_ReadyVagonsConsigneeID: TIntegerField;
    q_ReadyVagonsMPSID: TStringField;
    q_ReadyVagonsVagonNumber: TIntegerField;
    q_ReadyVagonsVagonDate: TDateTimeField;
    q_ReadyVagonsVagonDirection: TBooleanField;
    q_ReadyVagonsIsCover: TBooleanField;
    q_ReadyVagonsWeightGross: TIntegerField;
    q_ReadyVagonsWeightTare: TIntegerField;
    q_ReadyVagonsWeightNet: TIntegerField;
    q_ReadyVagonsWeightBillWeight: TIntegerField;
    q_ReadyVagonsTonnage: TIntegerField;
    q_ReadyVagonsWeightBillNumber: TStringField;
    q_ReadyVagonsWeightBillDate: TDateTimeField;
    q_ReadyVagonsSpeed: TFloatField;
    q_ReadyVagonsAxles: TWordField;
    q_ReadyVagonsUserComment: TStringField;
    q_ReadyVagonsStatus: TWordField;
    q_ReadyVagonsVagonTypeName: TStringField;
    ds_ReadyTrains: TDataSource;
    ds_ReadyVagons: TDataSource;
    gridReadyTrains: TDBGridEh;
    gridReadyVagons: TDBGridEh;
    ehprReadyVagons: TPrintDBGridEh;
    q_ProtoTrains: TADOQuery;
    ds_ProtoTrains: TDataSource;
    gridProtoTrains: TDBGridEh;
    q_ProtoTrainsProtoID: TAutoIncField;
    q_ProtoTrainsTareTrainID: TIntegerField;
    q_ProtoTrainsTrainID: TIntegerField;
    q_ProtoTrainsTO_ISU: TBooleanField;
    q_ProtoTrainsWayOfLoadingID: TIntegerField;
    q_ProtoTrainsTareTrainNumber: TStringField;
    q_ProtoTrainsTrainNumber: TStringField;
    q_ProtoTrainsWayOfLoadingName: TStringField;
    q_ProtoTrainsTareTrainDate: TDateTimeField;
    q_ProtoVagons: TADOQuery;
    ds_ProtoVagons: TDataSource;
    gridProtoVagons: TDBGridEh;
    Memo2: TMemo;
    Memo3: TMemo;
    ehprProtoVagons: TPrintDBGridEh;
    q_ProtoVagonsID: TAutoIncField;
    q_ProtoVagonsProtoID: TIntegerField;
    q_ProtoVagonsVagonTypeName: TStringField;
    q_ProtoVagonsMPSID: TStringField;
    q_ProtoVagonsWeightNet: TIntegerField;
    q_ProtoVagonsWeightGross: TIntegerField;
    q_ProtoVagonsWeightTare: TIntegerField;
    q_ProtoVagonsTonnage: TIntegerField;
    q_TareVagonsProtoVagonID: TAutoIncField;
    q_ProtoVagonsordnung: TIntegerField;
    q_TareVagonsProtoID: TAutoIncField;
    q_ReadyVagonsProtoVagonID: TAutoIncField;
    q_ReadyVagonsProtoID: TAutoIncField;
    DBFConnection: TADOConnection;
    q_ProtoVagonsPOD_NUM: TIntegerField;
    q_TareVagonsPOD_NUM: TIntegerField;
    q_ReadyVagonsPOD_NUM: TIntegerField;
    Panel1: TPanel;
    Label1: TLabel;
    cb_TareNew: TCheckBox;
    btTareRefresh: TButton;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Label2: TLabel;
    btTareProto: TButton;
    btTarePrint: TButton;
    btTareToXLS: TButton;
    Panel3: TPanel;
    Label3: TLabel;
    cb_ReadyNew: TCheckBox;
    btReadyRefresh: TButton;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Label5: TLabel;
    btReadyProto: TButton;
    btReadyPrint: TButton;
    btReadyToXLS: TButton;
    Panel5: TPanel;
    btProtoRefresh: TButton;
    Label4: TLabel;
    cb_ProtoNew: TCheckBox;
    Panel6: TPanel;
    btProtoToXLS: TButton;
    Label6: TLabel;
    btProtoTovOp: TButton;
    btProtoPrint: TButton;
    Splitter3: TSplitter;
    q_TareTrainsWeighingProtocolNum: TStringField;
    q_ReadyTrainsWeighingProtocolNum: TStringField;
    procedure btTareToXLSClick(Sender: TObject);
    procedure btTarePrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btTareRefreshClick(Sender: TObject);
    procedure q_TareTrainsAfterScroll(DataSet: TDataSet);
    procedure q_TareVagonsBeforeOpen(DataSet: TDataSet);
    procedure btReadyRefreshClick(Sender: TObject);
    procedure q_ReadyTrainsAfterScroll(DataSet: TDataSet);
    procedure q_ReadyVagonsBeforeOpen(DataSet: TDataSet);
    procedure btReadyToXLSClick(Sender: TObject);
    procedure btReadyPrintClick(Sender: TObject);
    procedure q_ProtoTrainsAfterScroll(DataSet: TDataSet);
    procedure btProtoRefreshClick(Sender: TObject);
    procedure btProtoToXLSClick(Sender: TObject);
    procedure btProtoPrintClick(Sender: TObject);
    procedure q_ProtoVagonsBeforeOpen(DataSet: TDataSet);
    procedure btTareProtoClick(Sender: TObject);
    procedure q_TareTrainsBeforeOpen(DataSet: TDataSet);
    procedure q_ReadyTrainsBeforeOpen(DataSet: TDataSet);
    procedure btReadyProtoClick(Sender: TObject);
    procedure btProtoTovOpClick(Sender: TObject);
    procedure q_ProtoTrainsBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    // Для обновления
    IsRefresh: boolean; // В данный момент происходит обновление запроса
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses ForDB, ARSCISGetWay;

{ TARCSISDATAFORM }

CONST DEFAULT_CONNECTION_STRING='Provider=SQLOLEDB.1;Password=utyjajyl;Persist Security Info=True;User ID=arscisarm;Initial Catalog=RRDB1;Data Source=172.19.44.172';
CONST DBF_CATALOG='V:\TEST\OTGR\DBF\';
CONST ARH_CATALOG='V:\TEST\OTGR\ARH\';

procedure TARCSISDATAFORM.btTareToXLSClick(Sender: TObject);
begin
  SaveDialog.FileName:=q_TareTrainsTrainNumber.asString;
  if SaveDialog.Execute then
    if not FileExists(SaveDialog.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridTareVagons,SaveDialog.FileName,True);
        FileExecute(SaveDialog.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridTareVagons,SaveDialog.FileName,True);
          FileExecute(SaveDialog.FileName,'','',esMaximized);
        end;
end;

procedure TARCSISDATAFORM.btTarePrintClick(Sender: TObject);
begin
    ehprTareVagons.PageHeader.CenterText.Clear;
    ehprTareVagons.PageHeader.LeftText.Clear;
    ehprTareVagons.PageHeader.RightText.Clear;

    ehprTareVagons.PageHeader.CenterText.Add('Отчет о составе № '+q_TareTrainsTrainNumber.Value);
    ehprTareVagons.PageHeader.LeftText.Add('');
    ehprTareVagons.PageHeader.LeftText.Add('');
    ehprTareVagons.PageHeader.LeftText.Add('Дата/время: '+q_TareTrainsTrainDate.AsString + '   Направление: НА ЗАВОД   Вагонов: ' + q_TareTrainsVagonsCount.AsString + '   Путь: '+q_TareTrainsWayOfLoadingName.AsString );
    ehprTareVagons.PageHeader.LeftText.Add('');
    ehprTareVagons.Preview;
end;

procedure TARCSISDATAFORM.FormCreate(Sender: TObject);
begin
{   try
   except
   Showmessage('Подключение не установлено');
   raise;
   end;}

  // Сессия
  {
  Динамическое формирование Connection String
  }
  ADOConnection.close;
  ADOConnection.ConnectionString:=DEFAULT_CONNECTION_STRING;
  ADOConnection.open;

  try
    DBFConnection.close;
    DBFConnection.open;
  except
  end;

  // Открытие
  IsRefresh:=true;
  f_db.ReQueryADO(q_TareTrains,false);
  f_db.ReQueryADO(q_ReadyTrains,false);
  f_db.ReQueryADO(q_ProtoTrains,false);
  IsRefresh:=false;
  q_TareTrainsAfterScroll(q_TareTrains);
  q_ReadyTrainsAfterScroll(q_ReadyTrains);
  q_ProtoTrainsAfterScroll(q_ProtoTrains);
  PageControl1.ActivePage:=TabTare;
end;

procedure TARCSISDATAFORM.btTareRefreshClick(Sender: TObject);
begin
  // Обновляем запрос
  IsRefresh:=true;
  f_db.ReQueryADO(q_TareTrains,true);
  IsRefresh:=false;
  // Приводим в соответствие подчиненную таблицу
  q_TareTrainsAfterScroll(q_TareTrains);
end;

procedure TARCSISDATAFORM.q_TareTrainsAfterScroll(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  if IsRefresh then exit;
  // обновляем позиции
  f_db.ReQueryADO(q_TareVagons,false);
end;

procedure TARCSISDATAFORM.q_TareVagonsBeforeOpen(DataSet: TDataSet);
begin
  if q_TareTrainsTrainID.asString='' then
    q_TareVagons.SQL[8]:=' where a.TrainID=0'
  else
    q_TareVagons.SQL[8]:=' where a.TrainID='+q_TareTrainsTrainID.asString;
  if cb_TareNew.Checked then
    q_TareVagons.SQL[10]:='and pv.ProtoVagonID is null'
  else
    q_TareVagons.SQL[10]:='and 1=1';
end;

procedure TARCSISDATAFORM.btReadyRefreshClick(Sender: TObject);
begin
  // Обновляем запрос
  IsRefresh:=true;
  f_db.ReQueryADO(q_ReadyTrains,true);
  IsRefresh:=false;
  // Приводим в соответствие подчиненную таблицу
  q_ReadyTrainsAfterScroll(q_ReadyTrains);
end;

procedure TARCSISDATAFORM.q_ReadyTrainsAfterScroll(DataSet: TDataSet);
begin
  if IsRefresh then exit;
  // обновляем позиции
  f_db.ReQueryADO(q_ReadyVagons,false);
end;

procedure TARCSISDATAFORM.q_ReadyVagonsBeforeOpen(DataSet: TDataSet);
begin
  if q_ReadyTrainsTrainID.asString='' then
    q_ReadyVagons.SQL[8]:=' where a.TrainID=0'
  else
    q_ReadyVagons.SQL[8]:=' where a.TrainID='+q_ReadyTrainsTrainID.asString;
  if cb_ReadyNew.Checked then
    q_ReadyVagons.SQL[10]:='and pv.ProtoVagonID is null'
  else
    q_ReadyVagons.SQL[10]:='and 1=1';
end;

procedure TARCSISDATAFORM.btReadyToXLSClick(Sender: TObject);
begin
  SaveDialog.FileName:=q_ReadyTrainsTrainNumber.asString;
  if SaveDialog.Execute then
    if not FileExists(SaveDialog.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridReadyVagons,SaveDialog.FileName,True);
        FileExecute(SaveDialog.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridReadyVagons,SaveDialog.FileName,True);
          FileExecute(SaveDialog.FileName,'','',esMaximized);
        end;
end;

procedure TARCSISDATAFORM.btReadyPrintClick(Sender: TObject);
begin
    ehprReadyVagons.PageHeader.CenterText.Clear;
    ehprReadyVagons.PageHeader.LeftText.Clear;
    ehprReadyVagons.PageHeader.RightText.Clear;

    ehprReadyVagons.PageHeader.CenterText.Add('Отчет о составе № '+q_ReadyTrainsTrainNumber.Value);
    ehprReadyVagons.PageHeader.LeftText.Add('');
    ehprReadyVagons.PageHeader.LeftText.Add('');
    ehprReadyVagons.PageHeader.LeftText.Add('Дата/время: '+q_ReadyTrainsTrainDate.AsString + '   Направление: С ЗАВОДА   Вагонов: ' + q_ReadyTrainsVagonsCount.AsString + '   Путь: '+q_ReadyTrainsWayOfLoadingName.AsString );
    ehprReadyVagons.PageHeader.LeftText.Add('');
    ehprReadyVagons.Preview;
end;

procedure TARCSISDATAFORM.q_ProtoTrainsAfterScroll(DataSet: TDataSet);
begin
  if IsRefresh then exit;
  // обновляем позиции
  f_db.ReQueryADO(q_ProtoVagons,false);

end;

procedure TARCSISDATAFORM.btProtoRefreshClick(Sender: TObject);
begin
  // Обновляем запрос
  IsRefresh:=true;
  f_db.ReQueryADO(q_ProtoTrains,true);
  IsRefresh:=false;
  // Приводим в соответствие подчиненную таблицу
  q_ProtoTrainsAfterScroll(q_ProtoTrains);

end;

procedure TARCSISDATAFORM.btProtoToXLSClick(Sender: TObject);
begin
  SaveDialog.FileName:=q_ProtoTrainsProtoID.asString;
  if SaveDialog.Execute then
    if not FileExists(SaveDialog.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridProtoVagons,SaveDialog.FileName,True);
        FileExecute(SaveDialog.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridProtoVagons,SaveDialog.FileName,True);
          FileExecute(SaveDialog.FileName,'','',esMaximized);
        end;

end;

procedure TARCSISDATAFORM.btProtoPrintClick(Sender: TObject);
begin
    ehprProtoVagons.PageHeader.CenterText.Clear;
    ehprProtoVagons.PageHeader.LeftText.Clear;
    ehprProtoVagons.PageHeader.RightText.Clear;

    ehprProtoVagons.PageHeader.CenterText.Add('Протокол взвешивания № '+q_ProtoTrainsProtoID.AsString);
    ehprProtoVagons.PageHeader.LeftText.Add('');
    ehprProtoVagons.PageHeader.LeftText.Add('');
    ehprProtoVagons.PageHeader.LeftText.Add('Дата/время: '+q_ProtoTrainsTareTrainDate.AsString + '   Путь: '+q_ProtoTrainsWayOfLoadingName.AsString );
    ehprProtoVagons.PageHeader.LeftText.Add('Номер порожнего состава: '+q_ProtoTrainsTareTrainNumber.AsString + '   Номер груженного состава: ' + q_ProtoTrainsTrainNumber.AsString);
    ehprProtoVagons.PageHeader.LeftText.Add('');
    ehprProtoVagons.Preview;
end;

procedure TARCSISDATAFORM.q_ProtoVagonsBeforeOpen(DataSet: TDataSet);
begin
  if q_ProtoTrainsProtoID.asString='' then
    q_ProtoVagons.SQL[1]:=' where a.ProtoID=0'
  else
    q_ProtoVagons.SQL[1]:=' where a.ProtoID='+q_ProtoTrainsProtoID.asString;
end;

procedure TARCSISDATAFORM.btTareProtoClick(Sender: TObject);
var q_cmn:TADOQuery;
    WayName,s,TextSQL:string;
    iii,i:integer;
    RowCnt:integer;
    ProtoID:string;
    ProtoVagonID:string;
    WayOfLoadingID:string;
begin
  if q_TareTrains.eof then exit;

  // Подготовить
  q_cmn:=TADOQuery.Create(Self);
  q_cmn.Connection:=ADOConnection;

  // Перебираем записи
  q_TareVagons.DisableControls;

  // Определяем путь погрузки
  if not q_TareVagons.Eof then
    WayOfLoadingID:=q_TareTrainsWayOfLoadingID.AsString
  else
    WayOfLoadingID:='1';

  //Определяем максимальный № п/п
  q_TareVagons.First;
  RowCnt:=0;
  while not q_TareVagons.Eof do
  Begin
    if Pos('$',q_TareVagonsMPSID.AsString)=0 then
    Begin
      if RowCnt<=q_TareVagonsVagonNumber.AsInteger then RowCnt:=q_TareVagonsVagonNumber.AsInteger;
    end;
    // Следующая запись
    q_TareVagons.Next;
  end;

  //Запрашиваем разделение по фронтам
  with tf_ARSCISGetWay.Create(Self) do
  Begin
    if WayOfLoadingID='1' then
      Way1:='2'
    else
      Way1:=WayOfLoadingID;
    From1:=RowCnt;
    q_Way1.Connection:=ADOConnection;
    q_way1.Open;
    q_Way2.Connection:=ADOConnection;
    q_way2.Open;

    ShowModal;
    if ModalResult=mrOk then
    Begin
      for iii:=1 to 2 do
      Begin
        q_TareVagons.First;
        RowCnt:=0;
        if iii=1 then WayOfLoadingID:=Way1 else WayOfLoadingID:=Way2;
        if iii=1 then WayName:=Way1Name else WayName:=Way2Name;
        try
          while not q_TareVagons.Eof do
          Begin
            if (Pos('$',q_TareVagonsMPSID.AsString)=0) and
               (
                 ((iii=1) and (q_TareVagonsVagonNumber.AsInteger<=From1) and (q_TareVagonsVagonNumber.AsInteger>=To1)) or
                 ((iii=2) and (q_TareVagonsVagonNumber.AsInteger<=From2) and (q_TareVagonsVagonNumber.AsInteger>=To2))
               ) then
            Begin
              // перебираем только выбранные вагоны (без локомотива и прикрытия)
              ProtoID:='';
              ProtoVagonID:='';
              if q_TareVagonsProtoVagonID.AsInteger>0 then
              Begin
                ProtoVagonID:=q_TareVagonsProtoVagonID.AsString;
              end;

              if ProtoVagonId='' then
              Begin
                // на вагон НЕТ ссылки в протоколе взвешивания
                // Определяем, есть ли заголовок протокола
                TextSQL:='SELECT ProtoID FROM ProtoTrains WHERE TareTrainID='+q_TareVagonsTrainID.AsString+' AND WayOfLoadingID='+WayOfLoadingID;
                // Выполняем
                q_cmn.Close;
                q_cmn.SQL.Clear;
                q_cmn.SQL.Add(TextSQL);
          //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
                q_cmn.Open;
                if q_cmn.eof then
                Begin
                  // Заголовка нет - добавляем
                  TextSQL:='INSERT INTO ProtoTrains (TareTrainID,TO_ISU,WayOfLoadingID) VALUES ('+q_TareVagonsTrainID.AsString+',0,'+ WayOfLoadingID+')';
                  // Выполняем
                  q_cmn.Close;
                  q_cmn.SQL.Clear;
                  q_cmn.SQL.Add(TextSQL);
            //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
                  q_cmn.ExecSQL;
                  // Определяем ID заголовка протокола
                  TextSQL:='SELECT ProtoID FROM ProtoTrains WHERE TareTrainID='+q_TareVagonsTrainID.AsString+' AND WayOfLoadingID='+WayOfLoadingID;
                  // Выполняем
                  q_cmn.Close;
                  q_cmn.SQL.Clear;
                  q_cmn.SQL.Add(TextSQL);
            //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
                  q_cmn.Open;
                  if q_cmn.eof then ProtoID:=''
                  else ProtoID:=Trim(q_cmn.FieldByName('ProtoID').AsString);
                end
                else
                begin
                  // Заголовок есть
                  ProtoID:=q_cmn.FieldByName('ProtoID').AsString;
                end;
              end;

              if ProtoVagonId<>'' then
              Begin
                ProtoId:=q_TareVagonsProtoID.AsString;
                // вагон уже в протоколе взвешивания - обновляем вес тары
                TextSQL:='UPDATE ProtoVagons SET WeightTare='+q_TareVagonsWeightGross.AsString+' WHERE ID='+q_TareVagonsProtoVagonID.AsString;
                // Выполняем
                q_cmn.Close;
                q_cmn.SQL.Clear;
                q_cmn.SQL.Add(TextSQL);
          //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
                q_cmn.ExecSQL;
              end
              else
                if ProtoID<>'' then
                Begin
                  // Определяем макимальный  номер по порядку
                  TextSQL:='SELECT MAX(ordnung) as cnt FROM ProtoVagons WHERE ProtoID='+ProtoID;
                  // Выполняем
                  q_cmn.Close;
                  q_cmn.SQL.Clear;
                  q_cmn.SQL.Add(TextSQL);
              //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
                  q_cmn.Open;
                  if q_cmn.eof then RowCnt:=0
                  else RowCnt:=q_cmn.FieldByName('cnt').AsInteger;
                  RowCnt:=Rowcnt+1;

                // Добавляем запись в протокол взвешивания
                  TextSQL:='INSERT INTO ProtoVagons (ordnung,ProtoID,VagonTypeName,MPSID,WeightTare,Tonnage) VALUES ('+
                   IntToStr(RowCnt)+','+ProtoID+','''+Copy(q_TareVagonsVagontypeName.AsString,1,3)+''','''+q_TareVagonsMPSID.AsString+''','+
                   q_TareVagonsWeightGross.AsString+','+
                   q_TareVagonsTonnage.AsString+')';
                  // Выполняем
                  q_cmn.Close;
                  q_cmn.SQL.Clear;
                  q_cmn.SQL.Add(TextSQL);
             //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
                  q_cmn.ExecSQL;
                end;
            end;
            // Следующая запись
            q_TareVagons.Next;
          end;
        except
          on E: Exception do
          Begin
            ShowMessage(E.Message);
          end;
        end;
        btProtoRefreshClick(Sender);
        if ProtoID<>'' then
        if q_ProtoTrains.Locate('ProtoId',ProtoId,[]) then
        if not q_ProtoTrains.eof then
        if (Application.MessageBox(PChar('Передать данные в АРМ "Товарный оператор" по вагонам из состава '+q_TareTrainsTrainNumber.AsString+' ('+WayName+')?'),'Внимание!',MB_YESNO)=IDYES) then
        Begin
          btProtoTovOpClick(sender);
        end;
      End;
    end;
    Free;
  end;
  q_TareVagons.EnableControls;
  q_cmn.SQL.Clear;
  q_cmn.free;
  btTareRefreshClick(sender);
end;

procedure TARCSISDATAFORM.q_TareTrainsBeforeOpen(DataSet: TDataSet);
begin
  if cb_TareNew.Checked then
  Begin
    q_TareTrains.SQL[2]:='and (a.TrainDate>=dateadd(day,-2,getdate()) or exists (select null from TareVagons aa left join';
    q_TareTrains.SQL[3]:='  (select bb.TareTrainID,aa.MPSID,aa.ID as ProtoVagonID from ProtoVagons aa, ProtoTrains bb where aa.ProtoID=bb.ProtoID';
    q_TareTrains.SQL[4]:='  ) pv on aa.TrainID=pv.TareTrainID and aa.MPSID=pv.MPSID';
    q_TareTrains.SQL[5]:='where aa.TrainID=a.TrainID and aa.mpsid not like ''%$%'' and pv.ProtoVagonID is null))';
  end
  else
  Begin
    q_TareTrains.SQL[2]:='and 1=1';
    q_TareTrains.SQL[3]:='and 1=1';
    q_TareTrains.SQL[4]:='and 1=1';
    q_TareTrains.SQL[5]:='and 1=1';
  end;
end;

procedure TARCSISDATAFORM.q_ReadyTrainsBeforeOpen(DataSet: TDataSet);
begin
  if cb_ReadyNew.Checked then
  Begin
    q_ReadyTrains.SQL[2]:='and (a.TrainDate>=dateadd(day,-2,getdate()) or exists (select null from Vagons aa left join';
    q_ReadyTrains.SQL[3]:='  (select bb.TrainID,aa.MPSID,aa.ID as ProtoVagonID from ProtoVagons aa, ProtoTrains bb where aa.ProtoID=bb.ProtoID';
    q_ReadyTrains.SQL[4]:='  ) pv on aa.TrainID=pv.TrainID and aa.MPSID=pv.MPSID';
    q_ReadyTrains.SQL[5]:='where aa.TrainID=a.TrainID and aa.mpsid not like ''%$%'' and aa.WeightGross>25000 and pv.ProtoVagonID is null))';
  end
  else
  Begin
    q_ReadyTrains.SQL[2]:='and 1=1';
    q_ReadyTrains.SQL[3]:='and 1=1';
    q_ReadyTrains.SQL[4]:='and 1=1';
    q_ReadyTrains.SQL[5]:='and 1=1';
  end;

end;

procedure TARCSISDATAFORM.btReadyProtoClick(Sender: TObject);
var q_cmn:TADOQuery;
    s,TextSQL:string;
    i:integer;
    RowCnt:integer;
    ProtoID:string;
    ProtoVagonID:string;
    WayOfLoadingID:string;
    TareTrainId:string;
begin
  if q_ReadyTrains.eof then exit;

  // Подготовить
  q_cmn:=TADOQuery.Create(Self);
  q_cmn.Connection:=ADOConnection;

  // Перебираем записи
  q_ReadyVagons.DisableControls;

  q_ReadyVagons.First;
  RowCnt:=0;
  // Определяем путь погрузки - НАДО ДОБАВИТЬ ВЫБОР
  if not q_ReadyVagons.Eof then
    WayOfLoadingID:=q_ReadyTrainsWayOfLoadingID.AsString
  else
    WayOfLoadingID:='1';

  ProtoID:='';
  TareTrainId:='';

  try
    while not q_ReadyVagons.Eof do
    Begin
      if Pos('$',q_ReadyVagonsMPSID.AsString)=0 then
      Begin
        // перебираем только вагоны
        ProtoVagonID:='';
        if q_ReadyVagonsProtoVagonID.AsInteger>0 then
        Begin
          ProtoVagonID:=Trim(q_ReadyVagonsProtoVagonID.AsString);
        end;

        if (ProtoVagonId='') and (ProtoID='') then
        Begin
          // на вагон НЕТ ссылки в протоколе взвешивания
          // Определяем, есть ли заголовок протокола
          TextSQL:='SELECT ProtoID FROM ProtoTrains WHERE TrainID='+q_ReadyVagonsTrainID.AsString+' AND WayOfLoadingID='+WayOfLoadingID;
          // Выполняем
          q_cmn.Close;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add(TextSQL);
    //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
          q_cmn.Open;
          if q_cmn.eof then
          Begin
            // Этот код надо будет убрать после того в ARSCIS станет заполнятся связка двух составов
            // Ищем по первому вагону протокол взвешивания порожнего состава с пустым полем TrainID и не пустым полем TareTrainID
            TextSQL:='SELECT a.TareTrainID FROM ProtoTrains a, ProtoVagons b, TareTrains t WHERE a.ProtoId=b.ProtoID AND a.TareTrainID=t.TrainID AND a.TrainID is null AND b.MPSID='''+Trim(q_ReadyVagonsMPSID.AsString)+''' AND a.WayOfLoadingID='+WayOfLoadingID+
              ' AND t.SourceTrainID=(select MAX(tt.SourceTrainID) FROM ProtoTrains aa, ProtoVagons bb, TareTrains tt WHERE aa.ProtoId=bb.ProtoID AND aa.TareTrainID=tt.TrainID AND bb.MPSID='''+Trim(q_ReadyVagonsMPSID.AsString)+''' AND aa.TrainID is null and t.SourceTrainID<'+q_ReadyTrainsSourceTrainID.AsString+' AND aa.WayOfLoadingID='+WayOfLoadingID+')';
            // Выполняем
            q_cmn.Close;
            q_cmn.SQL.Clear;
            q_cmn.SQL.Add(TextSQL);
    //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
            q_cmn.Open;
            if q_cmn.eof then
            Begin
              TareTrainId:='';
            end
            else
            begin
              TareTrainId:=Trim(q_cmn.FieldByName('TareTrainID').AsString);
            end;

            // Заголовка нет - добавляем
            //if (TareTrainId='') AND (Application.MessageBox('Создать новый протокол взвешивания?','Внимание!',MB_YESNO)<>IDYES) then
            //Begin
            //  ProtoID:='';
            //  break;
            //end
            //else
            //Begin
              if TareTrainId='' then TareTrainId:='null';
              TextSQL:='INSERT INTO ProtoTrains (TrainID,TareTrainID,TO_ISU,WayOfLoadingID) VALUES ('+q_ReadyVagonsTrainID.AsString+','+TareTrainId+',0,'+ WayOfLoadingID+')';
              // Выполняем
              q_cmn.Close;
              q_cmn.SQL.Clear;
              q_cmn.SQL.Add(TextSQL);
          //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
              q_cmn.ExecSQL;
            //end;

            // Определяем ID заголовка протокола
            TextSQL:='SELECT ProtoID FROM ProtoTrains WHERE TrainID='+q_ReadyVagonsTrainID.AsString+' AND WayOfLoadingID='+WayOfLoadingID;
            // Выполняем
            q_cmn.Close;
            q_cmn.SQL.Clear;
            q_cmn.SQL.Add(TextSQL);
      //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
            q_cmn.Open;
            if q_cmn.eof then ProtoID:=''
            else ProtoID:=Trim(q_cmn.FieldByName('ProtoID').AsString);

          end
          else
          begin
            // Заголовок есть
            ProtoID:=q_cmn.FieldByName('ProtoID').AsString;
          end;
        end;

        if ProtoVagonId<>'' then
        begin
          ProtoId:=q_ReadyVagonsProtoID.AsString;
          // вагон уже в протоколе взвешивания - обновляем
          TextSQL:='UPDATE ProtoVagons SET WeightTare='+q_ReadyVagonsWeightTare.AsString+','+
          ' WeightNet='+q_ReadyVagonsWeightNet.AsString+','+
          ' WeightGross='+q_ReadyVagonsWeightGross.AsString+','+
          ' Tonnage='+q_ReadyVagonsTonnage.AsString+','+
          ' VagonTypeName='''+Trim(q_ReadyVagonsVagonTypeName.AsString)+''''+
          ' WHERE ID='+q_ReadyVagonsProtoVagonID.AsString;
          // Выполняем
          q_cmn.Close;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add(TextSQL);
    //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
          q_cmn.ExecSQL;
        end
        else
          if ProtoID<>'' then
          Begin
            // Определяем максимальный  номер по порядку
            TextSQL:='SELECT MAX(ordnung) as cnt FROM ProtoVagons WHERE ProtoID='+ProtoID;
            // Выполняем
            q_cmn.Close;
            q_cmn.SQL.Clear;
            q_cmn.SQL.Add(TextSQL);
        //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
            q_cmn.Open;
            if q_cmn.eof then RowCnt:=0
            else RowCnt:=q_cmn.FieldByName('cnt').AsInteger;
            RowCnt:=Rowcnt+1;

            // Добавляем запись в протокол взвешивания
            TextSQL:='INSERT INTO ProtoVagons (ordnung,ProtoID,VagonTypeName,MPSID,WeightTare,WeightNet,WeightGross,Tonnage) VALUES ('+
             IntToStr(RowCnt)+','+ProtoID+','''+Copy(q_ReadyVagonsVagontypeName.AsString,1,3)+''','''+q_ReadyVagonsMPSID.AsString+''','+
             q_ReadyVagonsWeightTare.AsString+','+
             q_ReadyVagonsWeightNet.AsString+','+
             q_ReadyVagonsWeightGross.AsString+','+
             q_ReadyVagonsTonnage.AsString+')';
            // Выполняем
            q_cmn.Close;
            q_cmn.SQL.Clear;
            q_cmn.SQL.Add(TextSQL);
       //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
            q_cmn.ExecSQL;
          end;
      end;
      // Следующая запись
      q_ReadyVagons.Next;
    end;
  except
    on E: Exception do
    Begin
      ShowMessage(E.Message);
    end;
  end;
  q_ReadyVagons.EnableControls;
  q_cmn.SQL.Clear;
  q_cmn.free;
  btProtoRefreshClick(Sender);
  if ProtoID<>'' then
  if q_ProtoTrains.Locate('ProtoId',ProtoId,[]) then
  if not q_ProtoTrains.eof then
  if (Application.MessageBox(PChar('Передать данные в АРМ "Товарный оператор" по вагонам из состава '+q_ReadyTrainsTrainNumber.AsString+'?'),'Внимание!',MB_YESNO)=IDYES) then
  Begin
    btProtoTovOpClick(sender);
  end;
  btReadyRefreshClick(sender);

end;

procedure TARCSISDATAFORM.btProtoTovOpClick(Sender: TObject);
var q_cmn:TADOQuery;
    q_cmn2:TADOQuery;
    pNumOtgr,pNumOrder,pDTOS1,pDTOS2,pDate,pTime,gd_track,s,TextSQL,TextSQL1,TextSQL2,TextSQL3,TextSQL4:string;
    i:integer;
    RowCnt:integer;
    podnum:string;
    pTip,pWes,train_id1,train_id2,train_num1,train_num2,newkvitid,kvitid,NewPodId,podid,NewPodNum:string;
    NoUpdate:boolean;
begin
  if q_ProtoTrains.eof then exit;

  // Подготовить
  q_cmn:=TADOQuery.Create(Self);
  q_cmn.Connection:=DBFConnection;
  q_cmn2:=TADOQuery.Create(Self);
  q_cmn2.Connection:=ADOConnection;


  pDTOS1:=FormatDateTime('yyyymmddhh":"nn":"ss',q_ProtoTrainsTareTrainDate.AsDateTime-0.5);
  pDTOS2:=FormatDateTime('yyyymmddhh":"nn":"ss',q_ProtoTrainsTareTrainDate.AsDateTime+0.5);
  // путь погрузки
  if q_ProtoTrainsWayOfLoadingID.AsString='2' then gd_track:='5'
  else if q_ProtoTrainsWayOfLoadingID.AsString='3' then gd_track:='6'
  else if q_ProtoTrainsWayOfLoadingID.AsString='4' then gd_track:='15'
  else if q_ProtoTrainsWayOfLoadingID.AsString='5' then gd_track:='16'
  else gd_track:='0';
  // дата
  if (q_ProtoTrainsTareTrainDate.IsNull) or
    (q_ProtoTrainsTareTrainDate.AsDateTime=0) then
    pDate:='ctod("  /  /  ")'
  else
    pDate:=FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_ProtoTrainsTareTrainDate.AsDateTime);
  // время
  if (q_ProtoTrainsTareTrainDate.IsNull) or
    (q_ProtoTrainsTareTrainDate.AsDateTime=0) then
    pTime:=''
  else
    pTime:=FormatDateTime('hh":"nn',q_ProtoTrainsTareTrainDate.AsDateTime);

  train_id1:=Trim(q_ProtoTrainsTareTrainID.AsString);
  if train_id1='' then train_id1:='0';
  train_num1:=Trim(q_ProtoTrainsTareTrainNumber.AsString);
  if train_num1='' then train_num1:='0';
  train_id2:=Trim(q_ProtoTrainsTrainID.AsString);
  if train_id2='' then train_id2:='0';
  train_num2:=Trim(q_ProtoTrainsTrainNumber.AsString);
  if train_num2='' then train_num2:='0';

  q_ProtoVagons.DisableControls;

  try
    // Перебираем записи
    q_ProtoVagons.First;
    RowCnt:=0;
    NewPodId:='';
    NewPodNum:='';
    while not q_ProtoVagons.Eof do
    Begin
      PodId:='';
      KvitId:='';
      NoUpdate:=false;

      pNumOtgr:=Trim(q_ProtoVagonsMPSID.asString);
      pNumOrder:=Trim(q_ProtoVagonsOrdnung.asString);
      pTip:=Trim(q_ProtoVagonsVagonTypeName.asString);
      if pTip='?' then pTip:='';
      pWes:=F_ForSystem.RealToStr(F_ForSystem.StrToReal(Trim(q_ProtoVagonsTonnage.asString)));

      if pNumOtgr<>'' then
      Begin

        RowCnt:=RowCnt+1;

        // ищем ведомость подачи по номеру вагона и дате
        TextSQL:='SELECT id,pod_id,nakl_id,sved_id FROM '''+DBF_CATALOG+'kvit.dbf'' WHERE tip_otgr=1 AND mesto=1 AND EMPTY(date_remov) AND (ERROR=0 OR ERROR=14) AND ALLT(num_otgr)='''+pNumOtgr+''''+
        ' AND DTOS(np_data_o)+np_timep>='''+pDTOS1+''' AND DTOS(np_data_o)+np_timep<='''+pDTOS2+''''+
        ' UNION ALL '+
        ' SELECT id,pod_id,nakl_id,sved_id FROM '''+ARH_CATALOG+'kvit.dbf'' WHERE tip_otgr=1 AND mesto=1 AND (ERROR=0 OR ERROR=14) AND EMPTY(date_remov) AND ALLT(num_otgr)='''+pNumOtgr+''''+
        ' AND DTOS(np_data_o)+np_timep>='''+pDTOS1+''' AND DTOS(np_data_o)+np_timep<='''+pDTOS2+'''';
        // Выполняем
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add(TextSQL);
        //q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
        q_cmn.Open;
        if not q_cmn.eof then
        Begin
          // нашли вагон
          NoUpdate:=(Trim(q_cmn.FieldByName('NAKL_ID').AsString)<>'') or (Trim(q_cmn.FieldByName('SVED_ID').AsString)<>'');
          kvitId:=Trim(q_cmn.FieldByName('ID').AsString);
          PodId:=Trim(q_cmn.FieldByName('POD_ID').AsString);
          if podid='0' then podid:='';
          // Оперделяем номер ведомости подачи
          TextSQL:='SELECT POD_ID,POD_NUM FROM '''+DBF_CATALOG+'podacha.dbf'' WHERE POD_ID='''+PodId+'''';
          // Выполняем
          q_cmn.Close;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add(TextSQL);
          //q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
          q_cmn.Open;
          if q_cmn.eof then
          Begin
            PodId:='';
            PodNum:='';
          end
          else
          begin
            PodNum:=Trim(q_cmn.FieldByName('POD_NUM').AsString);
          end;
        end;

        if (NoUpdate=false) and (PodId='') and (train_id2='0') then
        begin
          // не нашли
          if NewPodId='' then
          Begin
            // добавляем подачу
            // Выбираем идентификатор
            NewPodId:=Trim(f_db.GetTovOpUniqId(DBFConnection,'PODACHA',DBF_CATALOG));
            if newpodid='0' then newpodid:='';
            // Выбираем номер
            NewPodNum:=Trim(f_db.GetTovOpUniqNum(DBFConnection,'PODACHA',DBF_CATALOG,ARH_CATALOG,q_ProtoTrainsTareTrainDate.AsDateTime));
            if Newpodnum='0' then Newpodnum:='';

            if (newpodid<>'') and (newpodnum<>'') then
            Begin
              // добавляем запись
              TextSQL:='INSERT INTO '''+DBF_CATALOG+'podacha.dbf'' ('+
              'POD_ID,'+
              'POD_NUM,'+
              'TIP_OTGR,'+
              'MESTO,'+
              'DATE_POD,'+
              'TIME_POD,'+
              'KOD_OPER,'+
              'KOL,'+
              'VES,'+
              'GOTOVD,'+
              'GOTOV,'+
              'N_NALD,'+
              'N_NAL,'+
              'OPERATOR,'+
              'GD_TRACK,'+
              'NUM_LUKOMA,'+
              'NUM_MPS,'+
              'NUM_SMN,'+
              'NUM_UVED,'+
              'K_NALD,'+
              'K_NAL,'+
              'VED_TO_GD,'+
              'V2GD_ID,'+
              'PROTO_ID,'+
              'TRAIN_ID1,'+
              'TRAIN_NUM1,'+
              'TRAIN_ID2,'+
              'TRAIN_NUM2'+
              ') VALUES ('+
              ''''+newpodid+''','+
              newpodnum+','+
              '1,'+
              '1,'+
              pDate+','+
              ''''+pTime+''','+
              '0,'+
              '0,'+
              '0,'+
              pDate+','+
              ''''+pTime+''','+
              pDate+','+
              ''''+pTime+''','+
              ''''','+
              gd_track+','+
              '0,'+
              '0,'+
              ''''','+
              '0,'+
              pDate+','+
              ''''','+
              '0,'+
              ''''','+
              '0,'+
              '0,'+
              '0,'+
              '0,'+
              '0'+
              ')';

              // Выполняем
              q_cmn.Close;
              q_cmn.SQL.Clear;
              q_cmn.SQL.Add(TextSQL);
        //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
              q_cmn.ExecSQL;
            end
          end;
          PodId:=NewPodId;
          PodNum:=NewPodNum;

          // Оперделяем номер ведомости подачи
          TextSQL:='SELECT POD_ID,POD_NUM FROM '''+DBF_CATALOG+'podacha.dbf'' WHERE POD_ID='''+PodId+'''';
          // Выполняем
          q_cmn.Close;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add(TextSQL);
          //q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
          q_cmn.Open;
          if q_cmn.eof then
          Begin
            PodId:='';
            PodNum:='';
          end
          else
          begin
            PodNum:=Trim(q_cmn.FieldByName('POD_NUM').AsString);
          end;
        end;

        if (kvitid='') and (train_id2='0') then
        begin
          // добавляем запись - только при выгрузке порожнего состава
          q_cmn.Close;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('INSERT INTO '''+DBF_CATALOG+'kvit.dbf'' (');
          q_cmn.SQL.Add('ID,KOD_PLAT,KOD_POLUCH,KOD_POTREB,KST,KOD_NPR,N_DOG,DATE_DOG,KATEG_CEN,KOL_CIST,DATE_RAZN,DOP_CIST,NUM_OTGR,DATE_OTGR,VES,TARIF,TARIF19,DOP_TARIF,NUM_KVIT,DATE_KVIT,N_PLAT,DATA_BUXG,REESTR,RODV,TIP_OTGR,ERROR,VAG_KLIENT,PRIZN_MPS,');
          q_cmn.SQL.Add('TRANSP,POSRED,TIP,VZLIV,MESTO,TIPV,USL_PPZT,DATE_CEN,CENA,CENA_OTP,KOD_OTGR,VAR_POST,NOM_ZD,GTD,EXPED,PRV,NSER,DATE_VOZ,KVIT_VOZ,SUM_VOZ,P_O,OSC,KOD_OPB,DATE_B,TIME_B,KOD_OPE,DATE_E,TIME_E,KOD_NAPR,OLD_PLAT,ZPU,VOZVRAT,MOSC_OUT,');
          q_cmn.SQL.Add('DATE_REMOV,NFP_OWNER,VES_PRIOBR,POKUP_DAYS,DATE_OTV,DATE_PRIB,KST_O,AUTO_USL,PLN_CHANGE,NUM_PASP,NUM_REZ,DINS,PLAT_TARIF,NALIV,VES_BRUTTO,NP,ID_NP,DATE_NP,ID_NP_C,KOD_GROTP,NUM_PERECH,DAT_PERECH,TARIF_ORIG,NP_DATA_O,NP_TIMEP,');
          q_cmn.SQL.Add('DATE_REE,PATH,WRITE,ARH,FAKT,WES_ED,KOL_ALL,TARA_ALL,FORMA,WES,XPL,PL,TEMPER,PLOMBA1,PLOMBA2,TARIF20,FORMA_2,NCISTDOP,K_TAR,REXP,VOZNAGR,SVED_ID,KODPASP,KOD_SOBS,KOD_TEX_PD,ZPU_TYPE1,ZPU_TYPE2,ROSINSPL1,ROSINSPL2,ID_RASK,');
          q_cmn.SQL.Add('DATE_RASK,TIME_RASK,ID_SEND,DATE_SEND,TIME_SEND,OBOGR,EDIT_END,NAKL_ID,NAKL_NUM,JKCOMMIT,GD_TRACK,KOD_PERER,DEFI_MASS,ID_NARIAD,ID_NAR_LIN,NUM_PROP,FIO_DRIVER,ORG_POLUCH,MESTO_NAZN,POD_ID,POD_NUM,BAG_ID,SHIELDS,KOL_ED,WES1,');
          q_cmn.SQL.Add('BAG_VES,PODDONS,MASTER_ID,NOM_ETRAN,KOL_NET,BAG1_VES,PODD_VES,SHLD_VES,POD_ORD,PODPUT,GOST,CTLV,PL15,VOLUME,VOLUME15,VETL_ID');
          q_cmn.SQL.Add(') VALUES (');
          q_cmn.SQL.Add('0,0,0,0,0,'''','''',ctod("  /  /  "),0,0,ctod("  /  /  "),.F.,'''+pNumOtgr+''',ctod("  /  /  "),0,0,0,0,0,ctod("  /  /  "),0,ctod("  /  /  "),0,6,1,14,.f.,0,');
          q_cmn.SQL.Add(''''',0,'''+pTip+''',0,1,0,0,ctod("  /  /  "),0,0,0,0,'''','''',0,0,'''',ctod("  /  /  "),'''',0,0,4,0,'+pDate+','''+pTime+''',0,'+pDate+','''+pTime+''',0,0,0,0,'''',');
          q_cmn.SQL.Add('ctod("  /  /  "),0,0,0,ctod("  /  /  "),ctod("  /  /  "),0,0,.f.,'''','''',ctod("  /  /  "),0,.f.,0,0,0,ctod("  /  /  "),0,0,'''',ctod("  /  /  "),0,'+pDate+','''+pTime+''',');
          q_cmn.SQL.Add('ctod("  /  /  "),'''',0,.f.,0,0,0,0,0,'+pWes+',0,0,0,'''','''',0,0,20,'''',0,0,'''','''',0,0,0,0,'''','''',0,');
          q_cmn.SQL.Add('ctod("  /  /  "),'''',0,ctod("  /  /  "),'''',0,.f.,'''',0,.f.,'+gd_track+',1,2,0,0,0,'''','''','''','''+podid+''','+podnum+',0,0,0,'''',');
          q_cmn.SQL.Add('0,0,0,'''',0,0,0,0,'+pNumOrder+',0,0,0,0,0,0,0');
          q_cmn.SQL.Add(')');
          //q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
          q_cmn.ExecSQL;
          KvitId:='0';
        end;

        if (PodId<>'') then
        Begin
          // обновляем подачу
          TextSQL:='UPDATE '''+DBF_CATALOG+'podacha.dbf'''+
                ' SET PROTO_ID='+q_ProtoTrainsProtoID.AsString+','+
                ' TRAIN_ID1='+train_id1+','+
                ' TRAIN_ID2='+train_id2+','+
                ' TRAIN_NUM1='+train_num1+','+
                ' TRAIN_NUM2='+train_num2+
                ' WHERE pod_id='''+podid+'''';
          // Выполняем
          q_cmn.Close;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add(TextSQL);
        //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
          q_cmn.ExecSQL;


          if (train_id2<>'0') then
          begin
            // обновляем время окончания налива
            TextSQL:='UPDATE '''+DBF_CATALOG+'podacha.dbf'''+
                  ' SET K_NAL='''+pTime+''''+
                  ' WHERE pod_id='''+podid+'''';
            // Выполняем
            q_cmn.Close;
            q_cmn.SQL.Clear;
            q_cmn.SQL.Add(TextSQL);
          //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
            //q_cmn.ExecSQL;
          end;

          // обновляем номер ведомости подачи в протоколе взвешивания
          if podnum<>'' then
          Begin
            TextSQL:='UPDATE ProtoVagons SET POD_NUM='+PodNum+' WHERE id='+q_ProtoVagonsID.asString;
            // Выполняем
            q_cmn2.Close;
            q_cmn2.SQL.Clear;
            q_cmn2.SQL.Add(TextSQL);
          //    q_cmn2.SQL.SaveToFile('c:\tmp\1.sql');
            q_cmn2.ExecSQL;
          end;
        end;

        if (NoUpdate=false) and (podid<>'') and (kvitId<>'') then
        Begin
          // обновляем вагон
          TextSQL:='UPDATE '''+DBF_CATALOG+'kvit.dbf'''+
                ' SET POD_ID='''+podid+''','+
                ' POD_NUM='+podnum+
                ' WHERE id='+kvitid+' AND num_otgr='''+pNumOtgr+'''';
          // Выполняем
          q_cmn.Close;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add(TextSQL);
        //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
          q_cmn.ExecSQL;

          // тара
          if q_ProtoVagonsWeightTare.AsInteger>5000 then
          Begin
            TextSQL:='UPDATE '''+DBF_CATALOG+'kvit.dbf'''+
                ' SET tara_all='+f_forsystem.RealToStr(q_ProtoVagonsWeightTare.AsInteger/1000)+
                ' WHERE id='+kvitid+' AND num_otgr='''+pNumOtgr+''' AND EMPTY(vzliv) AND EMPTY(date_remov) AND tip_otgr=1 AND mesto=1';
            // Выполняем
            q_cmn.Close;
            q_cmn.SQL.Clear;
            q_cmn.SQL.Add(TextSQL);
          //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
            q_cmn.ExecSQL;
          end;

          if train_id2<>'' then
          begin
            // брутто и нетто
            if q_ProtoVagonsWeightGross.AsInteger>25000 then
            Begin
              TextSQL:='UPDATE '''+DBF_CATALOG+'kvit.dbf'''+
                  ' SET kol_all='+f_forsystem.RealToStr(q_ProtoVagonsWeightGross.AsInteger/1000)+',ves=iif(kol_all-tara_all>0,kol_all-tara_all,0), fakt=iif(kol_all-tara_all>0,kol_all-tara_all,0), osc=iif(kol_all-tara_all>100,8,4) '+
                  ' WHERE id='+kvitid+' AND num_otgr='''+pNumOtgr+''' AND EMPTY(vzliv) AND EMPTY(date_remov) AND tip_otgr=1 AND mesto=1';
              // Выполняем
              q_cmn.Close;
              q_cmn.SQL.Clear;
              q_cmn.SQL.Add(TextSQL);
            //    q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
              q_cmn.ExecSQL;
            end;
          end;
        end;
      end;

      q_ProtoVagons.Next;
    end;
    q_ProtoVagons.First;

    if (train_id2<>'0') then
    begin
      // только для груженых составов
      TextSQL:='UPDATE ProtoTrains SET TO_ISU=1 WHERE ProtoID='+q_ProtoTrainsProtoID.asString;
      // Выполняем
      q_cmn2.Close;
      q_cmn2.SQL.Clear;
      q_cmn2.SQL.Add(TextSQL);
      //    q_cmn2.SQL.SaveToFile('c:\tmp\1.sql');
      q_cmn2.ExecSQL;
    end;


  except
    on E: Exception do
    Begin
      ShowMessage(E.Message);
    end;
  end;
  q_ProtoVagons.EnableControls;
  q_cmn.Close;
  q_cmn.SQL.Clear;
  q_cmn.free;
  q_cmn2.Close;
  q_cmn2.SQL.Clear;
  q_cmn2.free;
  btProtoRefreshClick(Sender);
end;

procedure TARCSISDATAFORM.q_ProtoTrainsBeforeOpen(DataSet: TDataSet);
begin
  if cb_ProtoNew.Checked then
  Begin
    q_ProtoTrains.SQL[4]:='where a.TO_ISU=0';
  end
  else
  Begin
    q_ProtoTrains.SQL[4]:='where 1=1';
  end;

end;

procedure TARCSISDATAFORM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
