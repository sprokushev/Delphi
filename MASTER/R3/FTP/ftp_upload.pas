unit ftp_upload;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdFTP;

type
  TForm1 = class(TForm)
    AFtp: TIdFTP;
    ListBox1: TListBox;
    Button1: TButton;
    ListBox2: TListBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
const
  sDir = 'U:\ISU\IN\*.err';
var
  AFiles,DFiles:TStringList;
  i:integer;
  iIndex : integer;
  SearchRec : TSearchRec;
  sFilename: string;
begin
  //������� ListBox
  ListBox1.Items.Clear;
  ListBox2.Items.Clear;
  //�������� ������ ������ ��� �������� �� ftp
  iIndex:=-1;
  iIndex:=FindFirst(sDir, faAnyFile, SearchRec);
  //���� ������ ���� �� ������ �� �����
  if iIndex<>0 then exit;
  //���� ���� ������ �� �������� ����� ��������� � �������� ������ ������ ���������� ��������
  DFiles:=TStringList.Create;
  while iindex = 0 do begin
    sFileName := ExtractFileDir(sdir)+'\'+searchrec.name;
    DFiles.Add(sFileName);
    iindex := findnext(searchrec);
  end;
  for i:= 0 to DFiles.Count-1 do
        ListBox2.Items.Add(DFiles.Strings[i]);
  //������� � FTP-�������
  try
    AFtp.Connect(True);
    AFtp.ChangeDir('in');
    //�������� ������ �� ������
    for i:= 0 to DFiles.Count-1 do
      AFtp.Put(DFiles.Strings[i],ExtractFileName(DFiles.Strings[i]));
    //�������� ������ ������ ������
    AFiles := TStringList.Create;
    AFtp.List(AFiles, '*.err', True);
    //AFtp.DirectoryListing.Items[0];
    for i:=0 to AFiles.Count-1 do
        ListBox1.Items.Add(AFIles.Strings[i]);
  finally
    AFtp.Quit;
    AFiles.Free;
    DFiles.Free;
  end;
end;

end.
