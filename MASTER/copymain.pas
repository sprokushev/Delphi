unit copymain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Animate1: TAnimate;
    Timer1: TTimer;
    function GetUserName:String;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses ShellAPI,IniFiles;
{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
var
  HomeDir,DstPath:String[255];
  SRS,SRD:TSearchRec;
  Src,Dst:String[255];
  s1,s2,s3,s4:String[255];
  I:Integer;
  Ini:TIniFile;
  FileMask:String;
  SearchDir: string;
  NoMAXIMIZE:string;
  NoUser:boolean;
  UserPath:string;
begin
  Timer1.Enabled:=False;
  Animate1.Active:=True;
  Animate1.Visible:=True;
  Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+ChangeFileExt(ExtractFileName(ParamStr(0)),'.ini'));

  s1:=AnsiUpperCase(Ini.ReadString('common','NO_USER','NO'));
  NoUser:=(s1='YES') or (s1='ДА') or (s1='1');
  If not NoUser Then
    UserPath:=GetUserName+'\'
  else
    UserPath:='';

  DstPath:=Ini.ReadString('common','DestinationDir','.');
  If DstPath[Length(DstPath)]<>'\' then
    DstPath:=DstPath+'\';
  NoMAXIMIZE:=AnsiUpperCase(Ini.ReadString('common','NO_MAXIMIZE','NO'));
  HomeDir:=ExtractFilePath(ParamStr(0));
  if not DirectoryExists(DstPath) then
    ForceDirectories(DstPath);
  if not DirectoryExists(DstPath+UserPath) then
    CreateDir(DstPath+UserPath);
  for i:=1 to 20 do
    begin
      FileMask:=Ini.ReadString('common','Mask'+IntToStr(i),'');
      if (FileMask<>'') AND (Length(FileMask)>1) then
        IF FileMask[2]=':' then
        Begin
          SearchDir := ExtractFilePath(FileMask);
          FileMask := ExtractFileName(FileMask);
        End
        else
          SearchDir := HomeDir;
        if FindFirst(SearchDir+FileMask,faAnyFile,SRS)=0 then
          begin
            if (FindFirst(DstPath+UserPath+SRS.Name,faAnyFile,SRD)<>0) or
               (SRS.Time<>SRD.Time) or
               (SRS.Size<>SRD.Size) then
               begin
                 Src:=SearchDir+SRS.Name+#0;
                 Dst:=DstPath+UserPath+SRS.Name+#0;
                 SetFileAttributes(@Dst[1],FILE_ATTRIBUTE_NORMAL);
                 CopyFile(@Src[1],@Dst[1],False);
               end;
            FindClose(SRD);
            while FindNext(SRS)=0 do
              begin
                if (FindFirst(DstPath+UserPath+SRS.Name,faAnyFile,SRD)<>0) or
                   (SRS.Time<>SRD.Time) or
                   (SRS.Size<>SRD.Size) then
                   begin
                     Src:=SearchDir+SRS.Name+#0;
                     Dst:=DstPath+UserPath+SRS.Name+#0;
                     SetFileAttributes(@Dst[1],FILE_ATTRIBUTE_NORMAL);
                     CopyFile(@Src[1],@Dst[1],False);
                   end;
                FindClose(SRD);
              end;
          end;
      FindClose(SRS);
    end;
  FileMask:=Ini.ReadString('common','ExeFile','');
  if FileMask<>'' then
    begin
      s1:='open'#0;
      s2:=DstPath+UserPath+FileMask+#0;
      s3:=#0;
      s4:=DstPath+UserPath+#0;
      if (NoMAXIMIZE='YES') or (NoMAXIMIZE='ДА') or (NoMAXIMIZE='1') then
        ShellExecute(Application.Handle,'open',@s2[1],nil,@s4[1],SW_NORMAL)
      else
        ShellExecute(Application.Handle,'open',@s2[1],nil,@s4[1],SW_MAXIMIZE)
    end
  else
    if not NoUser then
      ShowMessage('Файл не найден! Обратитесь к программисту!');
  Close;
end;

function TForm1.GetUserName:String;
var
  UserName:String[150];
  Len:DWord;
begin
  FillChar(UserName,150,0);
  Len:=100;
  Windows.GetUserNameA(@UserName[1],Len);
  UserName[0]:=Chr(Len-1);
  Result:=UserName;
end;




procedure TForm1.FormShow(Sender: TObject);
begin
  Timer1.Enabled:=True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Width:=Width+Animate1.Width-ClientWidth;
  Height:=Height+Animate1.Height-ClientHeight;
end;

end.
