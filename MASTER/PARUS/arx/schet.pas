unit schet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,math,
  Dialogs, Grids, DBGridEh, DB, ADODB, StdCtrls, Mask, ToolEdit, Buttons,strutils,
  RxMemDS;

type
  TForm1 = class(TForm)
    adoMain: TADOConnection;
    adoPS: TADODataSet;
    dsPS: TDataSource;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    edPath: TDirectoryEdit;
    BitBtn2: TBitBtn;
    adoQ: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

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

function H2C(spr:string):string;
  const C36 : array[1..36] of Char = ('1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i',
                                      'j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0');
var
i,j:integer;
s:string;
num:extended;
begin
num:=0;
s:=trim(spr);
 for i:=1 to length(s)  do
      for j:=1 to 36 do
       if lowercase(s[i])=c36[j] then
         num:=num+power(36,length(s)-i)*j;
H2C:=trim(floattostr(num));
end;

function FindSPR(spr:string;buf:pchar;iBR:Integer):string;
var
s,stemp:string;
i,j:integer;
iLength:integer;
pos:integer;
begin
      s:='{"'+h2c(spr)+'",';
      iLength:=length(s);
      pos:=0;
      i:=0;
      while i<iBR-1-iLength do
      if buf[i]='{' then
      begin
        stemp:='';
        for j:=1 to iLength do stemp:=stemp+Buf[i+j-1];
        if stemp=s then
        begin
         pos:=i;
         i:=iBR-1-iLength;
        end else i:=i+1;
      end else i:=i+1;
      stemp:='';
      for i:=pos to pos+200 do stemp:=stemp+buf[i];
      s:='';
      for i:=npos(',',stemp,7)+1 to npos(',',stemp,8)-1 do s:=s+stemp[i];
      stemp:='';
      for i:=npos('"',s,1)+1 to npos('"',s,2)-1 do sTemp:=sTemp+s[i];
  FindSpr:=sTemp;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  Src,Dst:String[255];
begin
Src:='\\ukhdata3\1clukarh\lukarh\1saccs.dbf'+#0;
Dst:=edPath.Text+'\1saccs.dbf'+#0;
CopyFile(@Src[1],@Dst[1],False);
Src:='\\ukhdata3\1clukarh\lukarh\1cv7.dd'+#0;
Dst:=edPath.Text+'\1cv7.dd'+#0;
CopyFile(@Src[1],@Dst[1],False);
Src:='\\ukhdata3\1clukarh\lukarh\1cv7.md'+#0;
Dst:=edPath.Text+'\1cv7.md'+#0;
CopyFile(@Src[1],@Dst[1],False);

if adoMain.Connected then adoMain.Connected:=false;
adoMain.ConnectionString:='Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB='+edPath.Text+';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
adoMain.Connected:=true;
adoPS.Open;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
st1,st2,st3:string;
uid:string;
iFileHandle: Integer;
Buffer: PChar;
iBytesRead,iLength: Integer;
begin
iFileHandle := FileOpen(edPath.Text+'\1cv7.md', fmOpenRead);
iLength := FileSeek(iFileHandle,0,2);
FileSeek(iFileHandle,0,0);
Buffer := PChar(AllocMem(iLength + 1));
iBytesRead := FileRead(iFileHandle, Buffer^, iLength);
FileClose(iFileHandle);

adoPS.First;
while not adoPS.Eof do
begin
     uid:= adoPS.fieldByName('id').AsString;
     if trim(adoPS.fieldByName('sc0').AsString)<>'0' then
      st1:=FindSpr(adoPS.fieldByName('sc0').AsString,buffer,iBytesRead)
     else
      st1:=' ';
     if trim(adoPS.fieldByName('sc1').AsString)<>'0' then
      st2:=FindSpr(adoPS.fieldByName('sc1').AsString,buffer,iBytesRead)
     else
      st2:=' ';
     if trim(adoPS.fieldByName('sc2').AsString)<>'0' then
      st3:=FindSpr(adoPS.fieldByName('sc2').AsString,buffer,iBytesRead)
     else
      st3:=' ';
     adoQ.SQL.Clear;
     adoQ.SQL.Add('update "1saccs.dbf" set');
     adoQ.SQL.Add('sc0="'+st1+'",');
     adoQ.SQL.Add('sc1="'+st2+'",');
     adoQ.SQL.Add('sc2="'+st3+'"');
     adoQ.SQL.Add('where id="'+uid+'"');
     adoQ.ExecSQL;
     adoPS.Next;
end;
   FreeMem(Buffer);
   adoPS.Close;
   adoPS.Open;
end;

end.
