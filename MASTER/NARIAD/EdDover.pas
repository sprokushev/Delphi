unit EdDover;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, OracleNavigator, Grids, DBGridEh, DBCtrls, Mask,
  ToolEdit, StdCtrls, ExtCtrls, Buttons, RXDBCtrl, RxLookup, Oracle,
  ComCtrls, DateUtil;

type
  TF_EdDover = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ed_Pokup: TDBLookupComboBox;
    Label6: TLabel;
    grid_DovLines: TDBGridEh;
    nav_DovLines: TOracleNavigator;
    q_DovLines: TOracleDataSet;
    ds_DovLines: TDataSource;
    q_DovLinesID: TFloatField;
    q_DovLinesVES: TFloatField;
    q_DovLinesPROD_ID_NPR: TStringField;
    q_DovLinesDOVER_ID: TFloatField;
    ed_NumDover: TDBEdit;
    ed_DateDover: TDBDateEdit;
    ed_DateEnd: TDBDateEdit;
    q_Prod: TOracleDataSet;
    q_DovLinesName_npr: TStringField;
    bt_ok: TBitBtn;
    bt_cancel: TBitBtn;
    ed_FIO: TRxLookupEdit;
    ed_Dolj: TRxLookupEdit;
    ds_FIO: TDataSource;
    ds_Dolj: TDataSource;
    q_FIO: TOracleDataSet;
    q_Dolj: TOracleDataSet;
    StatusBar1: TStatusBar;
    SpeedButton1: TSpeedButton;
    q_EdTmp: TOracleDataSet;
    procedure bt_okClick(Sender: TObject);
    procedure bt_cancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ed_FIOChange(Sender: TObject);
    procedure ed_FIOCloseUp(Sender: TObject);
    procedure ed_DoljCloseUp(Sender: TObject);
    procedure ed_DoljChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    ParentDover:TForm;
  end;

var
  F_EdDover: TF_EdDover;

implementation

uses FindDov, Dover;

{$R *.dfm}

procedure TF_EdDover.bt_okClick(Sender: TObject);
var s:string;
begin

  with TF_Dover(ParentDover).q_Dovers do
  Begin
    If FieldByName('NUM_DOVER').IsNull then FieldByName('NUM_DOVER').AsString:='';

    If Trim(FieldByName('NUM_DOVER').AsString)='' then
    Begin
      Application.MessageBox('Введите номер доверенности','Внимание!',MB_OK);
      ed_NumDover.SetFocus;
      ModalResult:=mrNone;
      Abort;
      exit;
    End;

    If FieldByName('DATE_DOVER').IsNull then
    Begin
      Application.MessageBox('Введите дату доверенности','Внимание!',MB_OK);
      ed_DateDover.SetFocus;
      ModalResult:=mrNone;
      Abort;
      exit;
    End;

    If FieldByName('DATE_END').IsNull then
    Begin
      Application.MessageBox('Введите дату окончания доверенности','Внимание!',MB_OK);
      ed_DateEnd.SetFocus;
      ModalResult:=mrNone;
      Abort;
      exit;
    End;

    If FieldByName('PREDPR_ID').IsNull then
    Begin
      Application.MessageBox('Выберите покупателя, выдавшего доверенность','Внимание!',MB_OK);
      ed_Pokup.SetFocus;
      ModalResult:=mrNone;
      Abort;
      exit;
    End;

    If FieldByName('FIO_DOVER').IsNull then
    Begin
      FieldByName('FIO_DOVER').AsString:='';
    End;

    If FieldByName('DOLJ_DOVER').IsNull then
    Begin
      FieldByName('DOLJ_DOVER').AsString:='';
    End;

  End;

  // Проверка уникальности доверенности
  with TF_Dover(ParentDover).q_Dovers do
  Begin
    q_EdTmp.Close;
    q_EdTmp.SQL.Clear;
    s:='SELECT id FROM KLS_DOVER WHERE NUM_DOVER='''+FieldByName('NUM_DOVER').AsString+''''+
        ' AND DATE_DOVER=TO_DATE('''+IntToStr(ExtractDay(FieldByName('DATE_DOVER').AsDateTime))+'.'+
        IntToStr(ExtractMonth(FieldByName('DATE_DOVER').AsDateTime))+'.'+
        IntToStr(ExtractYear(FieldByName('DATE_DOVER').AsDateTime))+''',''dd.mm.yyyy'') AND '+
        ' PREDPR_ID='+FieldByName('PREDPR_ID').AsString+' AND ID<>'+FieldByName('ID').AsString;
    q_EdTmp.SQL.Add(s);
    q_EdTmp.Open;
    If NOT q_EdTmp.Eof Then
    Begin
      Application.MessageBox('Доверенность уже введена','Внимание',MB_OK);
      ModalResult:=mrNone;
      Abort;
      exit;
    end;
    q_EdTmp.Close;
  end;

  with TF_Dover(ParentDover) do
  try
    q_DovLines.First;
    while not q_DovLines.EOF do
    Begin
      IF q_DovLinesVES.AsString='' Then
      try
        q_DovLines.Edit;
        q_DovLinesVES.AsFloat:=0;
        q_DovLines.Post;
      except
      end;
      q_DovLines.Next;
    end;
    ora_Session.ApplyUpdates([q_Dovers], False);
    ora_Session.CommitUpdates([q_Dovers]);
    If q_Dovers.State<>dsBrowse then q_Dovers.Post;
  except
    on E: Exception do
    Begin
      Application.MessageBox(PChar('Изменить доверенность не удалось: '+#13#10+E.Message),'Внимание',MB_OK);
      ora_Session.CancelUpdates([q_Dovers]);
      q_Dovers.Cancel;
    end;
  end;
end;

procedure TF_EdDover.bt_cancelClick(Sender: TObject);
begin
  with TF_Dover(ParentDover) do
  try
    q_Dovers.Cancel;
    ora_Session.CancelUpdates([q_Dovers]);
  except
    ora_Session.CancelUpdates([q_Dovers]);
  end;
end;

procedure TF_EdDover.FormCreate(Sender: TObject);
begin
  ParentDover:=TForm(Owner);
  with TF_Dover(ParentDover) do
  Begin
    ed_NumDover.DataSource:=ds_Dovers;
    ed_DateDover.DataSource:=ds_Dovers;
    ed_DateEnd.DataSource:=ds_Dovers;
    q_FIO.Session:=ora_Session;
    q_FIO.Open;
    q_Dolj.Session:=ora_Session;
    q_Dolj.Open;
    ed_FIO.Text:=q_Dovers.FieldByName('FIO_DOVER').AsString;
    ed_Dolj.Text:=q_Dovers.FieldByName('DOLJ_DOVER').AsString;
    ed_Pokup.DataSource:=ds_Dovers;
    ed_Pokup.ListSource:=ds_ListPokup;
    q_Prod.Session:=ora_Session;
    q_Prod.Open;
    q_EdTmp.Session:=ora_Session;
    q_DovLines.Session:=ora_Session;
    q_DovLines.Master:=q_Dovers;
    q_DovLines.Open;
  end;
end;

procedure TF_EdDover.ed_FIOChange(Sender: TObject);
begin
  with TF_Dover(ParentDover) do
  Begin
    q_Dovers.FieldByName('FIO_DOVER').AsString:=ed_FIO.Text;
  End;
end;

procedure TF_EdDover.ed_FIOCloseUp(Sender: TObject);
begin
  with TF_Dover(ParentDover) do
  Begin
    q_Dovers.FieldByName('FIO_DOVER').AsString:=q_FIO.FieldByName('FIO_DOVER').AsString;
    ed_Dolj.Text:=q_FIO.FieldByName('DOLJ_DOVER').AsString;
  end;
end;

procedure TF_EdDover.ed_DoljCloseUp(Sender: TObject);
begin
  with TF_Dover(ParentDover) do
  Begin
    q_Dovers.FieldByName('DOLJ_DOVER').AsString:=q_Dolj.FieldByName('DOLJ_DOVER').AsString;
  end;
end;

procedure TF_EdDover.ed_DoljChange(Sender: TObject);
begin
  with TF_Dover(ParentDover) do
  Begin
    q_Dovers.FieldByName('DOLJ_DOVER').AsString:=ed_Dolj.Text;
  End;
end;

procedure TF_EdDover.SpeedButton1Click(Sender: TObject);
begin
  with TF_FindDov.Create(Self) do
  Begin
    ShowModal;
    If ModalResult=mrYes then
    with q_EdTmp do
    try
      // поиск покупателю
      Close;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT id FROM V_LIST_PLATEL WHERE INSTR(UPPER(LTRIM(RTRIM(short_name))),'''+AnsiUpperCase(Trim(SeekStr))+''')<>0 OR INSTR(UPPER(LTRIM(RTRIM(predpr_name))),'''+AnsiUpperCase(Trim(SeekStr))+''')<>0');
      Open;
      If NOT Eof Then
      Begin
        TF_Dover(ParentDover).q_Dovers.FieldByName('PREDPR_ID').AsInteger:=FieldByName('id').AsInteger;
      end
      else Application.MessageBox('Искомое значение не найдено','Внимание',MB_OK);
      Close;
    except
      Application.MessageBox('Искомое значение не найдено','Внимание',MB_OK);
    end;
    Free;
  end;

end;

procedure TF_EdDover.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_DovLines.Close;
  q_DovLines.SQL.Clear;
  q_Prod.Close;
  q_Prod.SQL.Clear;
  q_FIO.Close;
  q_FIO.SQL.Clear;
  q_Dolj.Close;
  q_Dolj.SQL.Clear;
  q_EdTmp.Close;
  q_EdTmp.SQL.Clear;
end;

end.
