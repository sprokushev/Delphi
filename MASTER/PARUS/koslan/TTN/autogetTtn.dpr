program autogetTtn;

uses
  Forms,
  data in 'data.pas' {DM: TDataModule},
  ParReader in 'ParReader.pas',
  classes,
  dialogs,
  sysutils,
  loger in 'loger.pas',
  catalogSelect in 'catalogSelect.pas' {f_filter},
  SourceTree in 'SourceTree.pas',
  treeView in 'treeView.pas' {f_treeForm},
  progressForm in 'progressForm.pas' {f_progress};

{$R *.res}
procedure MySetCurrentDir(dir: string);
//переходим в указанную директорию, а если такой нет - то создаем ее и переходим
var
d:  string;
i:  integer;
begin
  d := '';
  for i:=1 to length(dir) do begin
    if dir[i] = '\' then begin //название директории закончилось
      if DirectoryExists(d) then
        SetCurrentDir(d) //ChDir(d)//если директория существует, то переходим ее
      else begin
        MkDir(d); //создаем и переходим в нее
        SetCurrentDir(d);//ChDir(d);
      end;
      d := '';
      continue;
    end;
    d := d + dir[i];
  end;
end;


var
startdate, endDate, days: string; //за сколько дней брать накладные
azss: TStrings;
rn, i:  integer;
par, workDir, azsDir:  string;
sr: TSearchRec;
number: string;
tmp:  array[0..15] of char;
f:  file of byte;
res:  integer;
begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
//  Application.CreateForm(Tf_progress, f_progress);

  //  Application.CreateForm(Tf_treeForm, f_treeForm);
  Application.Run;

  if DM.OracleLogon1.Execute = false then
    exit;
      
  workDir :=GetCurrentDir;
  azss := TStringList.Create;


//читам параметры

  if ParamStr(1) = 'dbf' then begin
    Application.CreateForm(Tf_filter, f_filter);
    if f_filter.ShowModal = 2 then
      exit;
    DM.createDEPTTable(workDir);
    DM.createDEPTSTable(workDir);
    f_progress := Tf_progress.Create(Application);
    f_progress.Show;
    f_progress.Update;
    DM.SaveTTNToDBF(workDir, f_filter.catalogList,
      f_filter.startDate, f_filter.endDate);

    f_progress.Hide;
    ShowMessage('Закончили');
    exit;
  end;

  initLogFile('process.log');

  SalGetProfileString('Default', 'numberDays', days, workDir + '\' + 'autogenttn.ini');

  azss := GetMultiEndingOfHG('azs.', 'autogenttn.ini');

  for i:=0 to azss.Count - 1 do begin
  //проверяем, если такая азс
    rn := DM.GetAzsRN(azss[i]);
    if rn = -1 then begin
      DM.AddError('АЗС ' + azss[i] + ' не найдена.');
      continue;
    end;

  //определяем даты 
    startDate := DateToStr((Date - StrToInt(days)));
    endDate := DateToStr(Date);

  //создаем список ТТН 
    DM.CreatelistTTN(startDate, endDate, rn);
    SalGetProfileString('azs.' + azss[i], 'path', azsDir, workDir + '\' + 'autogenttn.ini');    
    SetCurrentDir(azsDir);


//если в параметрах указан dbf, то создаем таблицы
      //проходим по ТТН-кам и сохраняем их в файлы
      while not DM.Docs.Eof do begin
        DM.SaveAzsToFile(azsDir);
        DM.SaveAzsBackToFile(azsDir);
        DM.Docs.Next;
      end;
  end;

      //обрабатываем возвращенные ТТН
      SalGetProfileString('Default', 'pathBack', par, WorkDir + '\' + 'autogenttn.ini');
      SetCurrentDir(par);
      if FindFirst('*.*', faAnyFile, sr) = 0 then begin
        repeat
          begin
            if (sr.Name = '.') or (sr.Name = '..') then
            continue;
            AssignFile(f, sr.Name);
            reset(f);
            BlockRead(f, tmp[0], 15);
            number := tmp;
            DM.SetTTNExportVal(number, 2);
            //удаляем файл
            DeleteFile(sr.Name);
            Sleep(0);
          end;
        until FindNext(sr) <> 0;
      end;
  


  SalGetProfileString('Default', 'mail', par, workDir + '\' + 'autogenttn.ini');
  DM.Sendmail(par);
  ShowMessage('Закончили');
end.
