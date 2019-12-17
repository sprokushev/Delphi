unit vyp_load;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, strutils, StdCtrls, Buttons, ComCtrls, Mask, ToolEdit, Oracle,
  ADODB, DB;

type
  Tfrm1cLoad = class(TForm)
    fd: TFilenameEdit;
    re: TRichEdit;
    BitBtn1: TBitBtn;
    oraSesMain: TOracleSession;
    oraQ: TOracleQuery;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm1cLoad: Tfrm1cLoad;

implementation

{$R *.dfm}
function NPos(const C: string; S: string; N: Integer): Integer;
var
  I, P, K: Integer;
begin
  Result := 0;
  K := 0;
  for I := 1 to N do begin
    P := Pos(C, S);
    Inc(K, P);
    if (I = N) and (P > 0) then begin
      Result := K;
      Exit;
    end;
    if P > 0 then Delete(S, 1, P)
    else Exit;
  end;
end;

function GetVal(st:string):string;
var
stemp:string;
i:integer;
begin
stemp:='';
for i:=npos('|',st,2)+1 to npos('|',st,3)-1 do sTemp:=sTemp+st[i];
GetVal:=trim(stemp);
end;

function GetNum(st:string):string;
var
s1:string;
j:integer;
begin
   s1:='';
   for j:=npos('"',st,3)+1 to npos('"',st,4)-1 do s1:=s1+st[j];
   getnum:=s1;
end;

function S2D(st:string):string;
var
s1,sdat:string;
k:integer;
begin
     s1:='';
     for k:=7 to 8 do s1:=s1+st[k];
     sdat:=s1+'.';
     s1:='';
     for k:=5 to 6 do s1:=s1+st[k];
     sdat:=sdat+s1+'.';
     sdat:=sdat+leftStr(st,4);
     s2d:=sdat;
end;

procedure Tfrm1cLoad.BitBtn1Click(Sender: TObject);
var
i     :Integer;
s1,s2 :AnsiString;
t     :TStrings;
begin
if trim(fd.FileName)='' then fd.DoClick; //Если не выбрано имя файла открываем диалог
if trim(fd.FileName)<>'' then  //Если не выбрано имя файла ничего не делаем
if FileExists(fd.FileName) then
  begin
//    WriteEvent(DateTimeToStr(Now)+': Открыли файл '+fd.FileName+'.',18);
    t:=TStringList.Create;
    t.LoadFromFile(fd.FileName);
    re.lines:=t ;
    t.Destroy;
  end;
//  DeleteFile(fd.FileName);
//  WriteEvent(DateTimeToStr(Now)+': Прочитано '+trim(inttostr(i))+' строк.',26);
//  WriteEvent(DateTimeToStr(Now)+': Файл '+fd.FileName+' удален!',2);
end;

procedure Tfrm1cLoad.BitBtn2Click(Sender: TObject);
var
i,j,k:integer;
s1,s2:string;
sDat:string;
sNum:string;
sAcc,sOp,sSum,sRem:string;
sSc1,sSc2,sSc3:string;
begin
i:=0;
   while (re.lines[i]<>'{КонецДокумента}') and (i< re.Lines.Count-1) do
   begin
     sDat:='';
     sAcc:='';
     sNum:='';
     sDat:=S2D(RightStr(trim(re.Lines[i+3]),8));
     sNum:=GetNum(trim(re.Lines[i+4]));
     sAcc:=GetVal(trim(re.Lines[i+10]));
     j:=i+24;
     while (re.Lines[j]<>'{КонецДокумента}') and (j< re.Lines.Count-1) do
      begin
       sOp:=Getval(trim(re.Lines[j+2]));
       sSum:=GetVal(trim(re.Lines[j+3]));
       if sSum='0' then
        begin
         sSum:=sOp;
         sOp:='1';
        end else sOp:='-1';
       sRem:=getval(s1);
       sSc1:=GetVal(trim(re.Lines[j+6]));
       sSc2:=GetVal(trim(re.Lines[j+7]));
       sSc3:=GetVal(trim(re.Lines[j+8]));
       j:=j+12;
       oraQ.ClearVariables;
       oraQ.SetVariable(':date_vyp',strtoDate(sDat));
       oraQ.SetVariable(':num_vyp',sNum);
       oraQ.SetVariable(':acc_vyp',sAcc);
       oraQ.SetVariable(':op_vyp',strToInt(sOp));
       oraQ.SetVariable(':sum_vyp',strToFloat(sSum));
       oraQ.SetVariable(':rem_vyp',sRem);
       oraQ.SetVariable(':sc1',sSc1);
       oraQ.SetVariable(':sc2',sSc2);
       oraQ.SetVariable(':sc3',sSc3);
       oraQ.execute;
       oraQ.Session.Commit;
       oraQ.Close;
      end;
      i:=j+1;
   end;
end;

procedure Tfrm1cLoad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       oraQ.Session.Connected:=false;
end;

procedure Tfrm1cLoad.FormCreate(Sender: TObject);
begin
       oraQ.Session.Connected:=true;
end;

procedure Tfrm1cLoad.BitBtn3Click(Sender: TObject);
begin
if adoMain.Connected then adoMain.Connected:=false;
adoMain.ConnectionString:='Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB='+edPath.Text+';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
adoMain.Connected:=true;
adoDS.CommandText:='select * from sc1564';
adods.Open;
adoDS.First;
while not adoDS.Eof do
begin
     oraSPR.Clear;
     oraSPR.SQL.Add('INSERT INTO RUI_ARX_RS (RS_ID, RS_ABBR, RS_RS,RS_NAME, RS_KS, RS_BIK) VALUES (');
     oraSPR.SQL.Add(''''+adods.fieldbyname('id').AsString+''',');
     oraSPR.SQL.Add(''''+adods.fieldbyname('descr').AsString+''',');
     oraSPR.SQL.Add(''''+adods.fieldbyname('sp1571').AsString+''',');
     oraSPR.SQL.Add(''''+adods.fieldbyname('sp1572').AsString+''',');
     oraSPR.SQL.Add(''''+adods.fieldbyname('sp1574').AsString+''',');
     oraSPR.SQL.Add(''''+adods.fieldbyname('sp1575').AsString+''')');
     oraSPR.Execute;
     Oraspr.Session.Commit;
     oraSpr.Close;
     adoDS.Next;
end;
adoDS.Close;
adoMain.Connected:=false;
end;

procedure Tfrm1cLoad.BitBtn4Click(Sender: TObject);
var
temp_id:string;
begin
if adoMain.Connected then adoMain.Connected:=false;
adoMain.ConnectionString:='Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB='+edPath.Text+';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
adoMain.Connected:=true;
adoDS.CommandText:='select * from sc488';
adods.Open;
adoDS.First;
while not adoDS.Eof do
begin
     oraSPR.Clear;
     temp_id:=trim(adods.fieldbyname('id').AsString);
     oraSPR.SQL.Add('select * from RUI_ARX_AGN where agn_id='''+temp_id+'''');
     oraSPR.Execute;
     if oraSPR.RowCount<1 then
     begin
     oraSPR.Clear;
     oraSPR.SQL.Add('INSERT INTO RUI_ARX_AGN (AGN_ID, AGN_ABBR, AGN_NAME, AGN_POST, AGN_INN, AGN_KPP) VALUES (');
     oraSPR.SQL.Add(''''+temp_id+''',');
     oraSPR.SQL.Add(''''+adods.fieldbyname('descr').AsString+''',');
     oraSPR.SQL.Add(''''+adods.fieldbyname('sp490').AsString+''',');
     oraSPR.SQL.Add(''''+adods.fieldbyname('sp491').AsString+''',');
     oraSPR.SQL.Add(''''+adods.fieldbyname('sp494').AsString+''',');
     oraSPR.SQL.Add(''''+adods.fieldbyname('sp17755').AsString+''')');
     oraSPR.Execute;
     Oraspr.Session.Commit;
     oraSpr.Close;
     end;
     adoDS.Next;
end;
adoDS.Close;
adoMain.Connected:=false;
end;

procedure Tfrm1cLoad.BitBtn5Click(Sender: TObject);
var
s,s1:string;
i:integer;
begin
if adoMain.Connected then adoMain.Connected:=false;
adoMain.ConnectionString:='Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB='+edPath.Text+';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
adoMain.Connected:=true;
adoDS.CommandText:='select * from sc656';
adods.Open;
adoDS.First;
while not adoDS.Eof do
begin
     s1:='';
     s:=adods.fieldbyname('descr').AsString;
     for i:=1 to length(s) do if s[i]<>'''' then s1:=s1+s[i] else s1:=s1+'"';
     oraSPR.Clear;
     oraSPR.SQL.Add('INSERT INTO RUI_ARX_DICNOMN (NOMN_ID, NOMN_ABBR) VALUES (');
     oraSPR.SQL.Add(''''+adods.fieldbyname('id').AsString+''',');
     oraSPR.SQL.Add(''''+s1+''')');
     oraSPR.Execute;
     Oraspr.Session.Commit;
     oraSpr.Close;
     label1.Caption:=s1;
     adoDS.Next;
end;
adoDS.Close;
adoMain.Connected:=false;
end;

end.
