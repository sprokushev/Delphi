unit ScanTh;

interface

uses
  Classes, SysUtils, Data, DB, Windows;

type
  TScanThread = class(TThread)
  private
    { Private declarations }
  protected
    pStLineText : String;
    procedure Execute; override;
    function ExecProcess : Boolean;
    procedure UpdateStLine;
  end;

implementation

uses Main, VCLUtils, Dialogs, FMXUtils;

var
  pFileName, pKodEvent, pPathFlag, pFlagName, pDescript,
  pKodPacket, pParams, pDirectory : String;
  pLastDT: string;
  pNewDT:string;
  pFileDT:integer;

procedure TScanThread.Execute;
var
  pExecResult : Boolean;
  pFileFlagHandle : Integer;
begin
  try
   { Проверка файлов }
   with dmData.taListFiles do begin
    Active := True;
    First;
    while not EOF do begin
      if FieldByName('RUN').AsBoolean = True then
      begin
        pFileName := Trim(FieldByName('FILENAME').AsString);
        pLastDT := DateToStr(FieldByName('LASTDATE').AsDateTime) +
                   FieldByName('LASTTIME').AsString;

        pStLineText := 'Анализ изменения файла - '+pFileName+'...';
        Synchronize(UpdateStLine);

        pPathFlag := Trim(FieldByName('FLAGPATH').AsString);
        pFlagName := pPathFlag + '\' + Trim(FieldByName('FLAGNAME').AsString);

        Delay(100); // Удалить в окончательной версии (и объявление в USES VCLUtils)

        pFileDT:=FileAge(pFileName);
        if pFileDT<>-1 then
        (* Если проверяемый файл обнаружен - проверка даты и времени последнего изменения *)
        begin
          pNewDT:=DateToStr(FileDateToDateTime(pFileDT)) +
                  TimeToStr(FileDateToDateTime(pFileDT));
          IF pNewDT<>pLastDT Then // файл изменился, выставляем флаг
          Begin
            pFileFlagHandle := FileCreate(pFlagName);
            FileClose(pFileFlagHandle);
            try
              Edit;
              FieldByName('LASTDATE').AsDateTime:=FileDateToDateTime(pFileDT);
              FieldByName('LASTTIME').AsString:=TimeToStr(FileDateToDateTime(pFileDT));
              Post;
            except
              Cancel;
            end;
          End;
        end; {if}

      end; {if}
      Next;
    end; {while}
    pStLineText := '';
    Synchronize(UpdateStLine);
    Active := False;
   end; {with}

   { Анализ наличия флагов }
   with dmData.taPackets do begin
    Active := True;
    First;
    while not EOF do begin
      if FieldByName('RUN').AsBoolean = True then
      begin
        pDescript := Trim(FieldByName('DESCRIPT').AsString);
        pKodPacket := Trim(FieldByName('KOD_PACKET').AsString);

        pStLineText := 'Анализ наличия пакета - '+pDescript+'...';
        Synchronize(UpdateStLine);

        pPathFlag := Trim(FieldByName('FLAGPATH').AsString);
        pFlagName := pPathFlag + '\' + Trim(FieldByName('FLAGNAME').AsString);

        Delay(100); // Удалить в окончательной версии (и объявление в USES VCLUtils)

        pExecResult:=false;
        if FileExists(pFlagName) then
        (* Если флаг обнаружен - запуск процедуры обработки данных *)
        begin
          pStLineText := 'Обработка пакета - '+pDescript+'...';
          Synchronize(UpdateStLine);
          pExecResult := ExecProcess;
        end; {if}

        if FieldByName('FLAGERASE').AsBoolean and pExecResult then
          SysUtils.DeleteFile(pFlagName);
      end; {if}
      Next;
    end; {while}
    pStLineText := '';
    Synchronize(UpdateStLine);
    Active := False;
   end; {with}
  except
  (*  MessageDlg('TScanThread.Execute не выполнен.'
               +DateToStr(Date)+' '+TimeToStr(Time),mtError,[mbOk],0);
  *)
    fmMain.pScanThread.Terminate;
  end;{try}
end;

function TScanThread.ExecProcess;
var pTipEvent : Word;
    RetExec : Integer;
    pBookMark : TBookmark;
  procedure AddEvent;
  begin
    with dmData.taEvents do
    begin
      Insert;
      Str(Now*1e13:12:0,pKodEvent);
      FieldByName('KOD_EVENT').AsString := pKodEvent;
      FieldByName('KOD_SESS').AsString := fmMain.gKodSession;
      FieldByName('KOD_PACKET').AsString := pKodPacket;
      FieldByName('DATE').AsDateTime := Date;
      FieldByName('TIME_RUN').AsString := TimeToStr(Time);
      FlushBuffers;
      pBookMark := GetBookmark;
    end;
  end;
  procedure UpdateEvent;
  begin
    with dmData.taEvents do
    begin
      GotoBookmark(pBookMark);
      Edit;
      FieldByName('ERROR').AsBoolean := True;
      FieldByName('RESULT').AsString := 'Программа не была запущена.'
        + pFileName + '.' + DateToStr(Date) + ' ' + TimeToStr(Time)
        + '.Код ошибки ShellExecute = ' + IntToStr(RetExec);
      FlushBuffers;
    end;
  end;
begin
  try
   (*  Регистрируем запуск диспетчера FoxPro модулей *)
    with dmData do begin
      try
        taEvents.Active := True;
        AddEvent;
      except
        RestoreEvents;
        taEvents.Active := True;
        AddEvent;
      end; {with}
      taEvents.Active := False;
    end;
    pTipEvent := dmData.taPackets.FieldByName('TIPEVENT').AsInteger;
    case pTipEvent of
      1: // FoxPro DOS модуль
      begin
        pFileName := fmMain.gFoxPro;      //   FoxPro
        pParams := fmMain.gDoPrgApp + ' ' //  DoPrgApp.app
           + fmMain.gKodSession + ' '   //  Код сессии менеджера
           + pKodEvent + ' '            //  Код созданной записи в EVENTS
           + pKodPacket;                //  Код пакета
        pDirectory := '';
      end;
      2: // EXE, COM, BAT
      begin
        pFileName := Trim(dmData.taPackets.FieldByName('MODULE').AsString);
        pParams := Trim(dmData.taPackets.FieldByName('PARAMS').AsString);
        pDirectory := ExtractFileDir(Trim(dmData.taPackets.FieldByName('MODULE').AsString));
      end;
      3: // VisualFoxPro модуль
      begin
        pFileName := fmMain.gVFP;      //   DoPrgVFP.exe
        pParams := fmMain.gKodSession + ' '   //  Код сессии менеджера
           + pKodEvent + ' '            //  Код созданной записи в EVENTS
           + pKodPacket;                //  Код пакета
        pDirectory := '';
      end;

    end; {case}

    (* Запуск внешней программы *)
    RetExec := ExecuteFile(pFileName, pParams, pDirectory, SW_SHOWMINIMIZED);
    if RetExec <= 32 then begin
      with dmData do begin
        try
          taEvents.Active := True;
          UpdateEvent;
        except
          RestoreEvents;
          taEvents.Active := True;
          AddEvent;
          UpdateEvent;
        end; {with}
        taEvents.Active := False;
      end;
      Result := False;
    end
    else Result := True;

  except
  //  MessageDlg('Программа не была запущена.'+pFileName+'.'
  //             +DateToStr(Date)+' '+TimeToStr(Time),mtError,[mbOk],0);
    Result := False;
    //fmMain.pScanThread.Terminate;
  end;{try}
end;

procedure TScanThread.UpdateStLine;
begin
  fmMain.slMain.Panels[1].Text := pStLineText;
end;

end.
