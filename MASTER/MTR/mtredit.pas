unit mtredit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit,StrUtils;

type
  TF_mtredit = class(TForm)
    Label1: TLabel;
    file_src: TFilenameEdit;
    rg_type: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    file_dst: TEdit;
    Label4: TLabel;
    btLoad: TButton;
    procedure file_srcChange(Sender: TObject);
    procedure rg_typeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_mtredit: TF_mtredit;

implementation

uses main, ForSess, ForFiles;

{$R *.dfm}

procedure TF_mtredit.file_srcChange(Sender: TObject);
var s,s_path,s_name,s_ext:string;
begin
  // ������ �����
  s:=AnsiUpperCase(file_src.Text);
  s_path:=F_FileUtils.FillFilePath(ExtractFilePath(s),false);
  s_name:=ExtractFileName(s);
  s_ext:=ExtractFileExt(s);

  if (s_name='17.RAR') or (s_name='17.TXT') then
  Begin
    // ���� ���
    rg_type.ItemIndex:=0;
  end;

  if copy(s_name,1,20)='10105090941943198578' then
  Begin
    // ���� ���
    rg_type.ItemIndex:=1;
  end;

  if copy(s_name,1,28)='��� ������-�����������������' then
  Begin
    // �����������
    rg_type.ItemIndex:=2;
  end;

  if (s_name='321') or (copy(s_name,1,4)='321.') then
  Begin
    // �������� ���
    rg_type.ItemIndex:=3;
  end;

  if (s_name='DETAL.ZIP') or (s_name='DETAL.XLS') then
  Begin
    // �������� ���
    rg_type.ItemIndex:=4;
  end;
end;



procedure TF_mtredit.rg_typeClick(Sender: TObject);
var s,s_path,s_name,s_ext:string;
    d_path,d_name,d_ext:string;
begin
  // ������ �����
  s:=AnsiUpperCase(file_src.Text);
  s_path:=F_FileUtils.FillFilePath(ExtractFilePath(s),false);
  s_name:=ExtractFileName(s);
  s_ext:=ExtractFileExt(s);

  d_path:='c:\mtr\��������\toload\';

  if (rg_type.ItemIndex=0) and (s_name='17.RAR') then
  Begin
    // ���� ���
    s:=' e -y '+s_path+s_name+' '+d_path;
    if F_FileUtils.ExecAndWait('RAR.EXE',s,SW_SHOWMINIMIZED,true) then
    if FileExists(d_path+'17.TXT') then
    begin
      file_dst.Text:=d_path+'17.TXT';
    end;
  end;

  if (rg_type.ItemIndex=0) and (s_name='17.TXT') then
  Begin
    // ���� ���
    if F_FileUtils.SafeCopyFile(s_path+s_name,d_path+s_name) then
    if FileExists(d_path+'17.TXT') then
    begin
      file_dst.Text:=d_path+'17.TXT';
    end;
  end;

  if (rg_type.ItemIndex=1) and (copy(s_name,1,20)='10105090941943198578') then
  Begin
    // ���� ���

    if FileExists(d_path+'16628.CSV') then
    begin
      file_dst.Text:=d_path+'16628.CSV';
    end;
  end;

  if (rg_type.ItemIndex=2) and (copy(s_name,1,28)='��� ������-�����������������') and (leftstr(s_name,10)='22031.XLS"') then
  Begin
    // �����������

    if FileExists(d_path+'ARH22031.CSV') then
    begin
      file_dst.Text:=d_path+'ARH22031.CSV';
    end;
  end;

  if (rg_type.ItemIndex=2) and (copy(s_name,1,28)='��� ������-�����������������') and (leftstr(s_name,10)='22120.XLS"') then
  Begin
    // �����������

    if FileExists(d_path+'ARH22120.CSV') then
    begin
      file_dst.Text:=d_path+'ARH22120.CSV';
    end;
  end;

  if (rg_type.ItemIndex=3) and ((s_name='321') or (copy(s_name,1,4)='321.')) then
  Begin
    // �������� ���

    if FileExists(d_path+'321SZT.TXT') then
    begin
      file_dst.Text:=d_path+'321SZT.TXT';
    end;
  end;

  if (rg_type.ItemIndex=4) and (s_name='DETAL.ZIP') then
  Begin
    // �������� ���


    if FileExists(d_path+'321RTK.CSV') then
    begin
      file_dst.Text:=d_path+'321RTK.CSV';
    end;
  end;

  if (rg_type.ItemIndex=4) and (s_name='DETAL.XLS') then
  Begin
    // �������� ���


    if FileExists(d_path+'321RTK.CSV') then
    begin
      file_dst.Text:=d_path+'321RTK.CSV';
    end;
  end;
end;

end.
