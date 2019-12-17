unit EdNariad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, OracleNavigator, Grids, DBGridEh, DBCtrls, Mask,
  ToolEdit, StdCtrls, ExtCtrls, Buttons, RXDBCtrl, RxLookup, Oracle,
  ComCtrls, DateUtil, OleServer, Word2000, DBGrids;

type
  TF_EdNariad = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ed_Dover: TDBLookupComboBox;
    Label6: TLabel;
    grid_NarLines: TDBGridEh;
    nav_NarLines: TOracleNavigator;
    q_NarLines: TOracleDataSet;
    ds_NarLines: TDataSource;
    q_NarLinesID: TFloatField;
    q_NarLinesVES: TFloatField;
    ed_NumNariad: TDBEdit;
    ed_DateNariad: TDBDateEdit;
    ed_DateEnd: TDBDateEdit;
    bt_ok: TBitBtn;
    bt_cancel: TBitBtn;
    StatusBar1: TStatusBar;
    sb_FindFirst: TSpeedButton;
    q_EdTmp: TOracleDataSet;
    q_NarLinesNOM_ZD: TStringField;
    q_NarLinesNARIAD_ID: TFloatField;
    lb_DateDover: TDBText;
    lb_NumDover: TDBText;
    lb_DoljDover: TDBText;
    lb_FioDover: TDBText;
    q_Prod: TOracleDataSet;
    q_NarLinesNAME_NPR: TStringField;
    sbPrint: TSpeedButton;
    q_ProdToNar: TOracleDataSet;
    q_ProdInNar: TOracleDataSet;
    q_NarInMonth1: TOracleDataSet;
    q_ListMonth: TOracleDataSet;
    WordApplication: TWordApplication;
    DataSource1: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    sb_FindNext: TSpeedButton;
    lb_Platel: TDBText;
    Label8: TLabel;
    lb_DateEnd: TDBText;
    lb_seek: TLabel;
    procedure bt_okClick(Sender: TObject);
    procedure bt_cancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sb_FindFirstClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPrintClick(Sender: TObject);
    procedure sb_FindNextClick(Sender: TObject);
  private
    { Private declarations }
    Last_ID:integer;
  public
    { Public declarations }
    ParentNariad:TForm;
  end;

var
  F_EdNariad: TF_EdNariad;

implementation

uses FindDov, Nariad, Funcs;

{$R *.dfm}

procedure TF_EdNariad.bt_okClick(Sender: TObject);
var s:string;
begin

  with TF_Nariad(ParentNariad).q_Nariad do
  Begin
    If FieldByName('NUM_NAR').IsNull then FieldByName('NUM_NAR').AsString:='';

    If Trim(FieldByName('NUM_NAR').AsString)='' then
    Begin
      Application.MessageBox('Введите номер наряда','Внимание!',MB_OK);
      ed_NumNariad.SetFocus;
      ModalResult:=mrNone;
      Abort;
      exit;
    End;

    If FieldByName('DATE_NAR').IsNull then
    Begin
      Application.MessageBox('Введите дату наряда','Внимание!',MB_OK);
      ed_DateNariad.SetFocus;
      ModalResult:=mrNone;
      Abort;
      exit;
    End;

    If FieldByName('DATE_END').IsNull then
    Begin
      Application.MessageBox('Введите дату окончания наряда','Внимание!',MB_OK);
      ed_DateEnd.SetFocus;
      ModalResult:=mrNone;
      Abort;
      exit;
    End;

    If FieldByName('DOVER_ID').IsNull then
    Begin
      Application.MessageBox('Выберите доверенность','Внимание!',MB_OK);
      ed_Dover.SetFocus;
      ModalResult:=mrNone;
      Abort;
      exit;
    End;

  End;

  // Проверка уникальности наряда
  with TF_Nariad(ParentNariad).q_Nariad do
  Begin
    q_EdTmp.Close;
    q_EdTmp.SQL.Clear;
    s:='SELECT id FROM KLS_NARIAD WHERE NUM_NAR='''+FieldByName('NUM_NAR').AsString+''''+
        ' AND DATE_NAR=TO_DATE('''+IntToStr(ExtractDay(FieldByName('DATE_NAR').AsDateTime))+'.'+
        IntToStr(ExtractMonth(FieldByName('DATE_NAR').AsDateTime))+'.'+
        IntToStr(ExtractYear(FieldByName('DATE_NAR').AsDateTime))+''',''dd.mm.yyyy'') AND '+
        ' DOVER_ID='+FieldByName('DOVER_ID').AsString+' AND ID<>'+FieldByName('ID').AsString;
    q_EdTmp.SQL.Add(s);
    q_EdTmp.Open;
    If NOT q_EdTmp.Eof Then
    Begin
      Application.MessageBox('Наряд уже введен','Внимание',MB_OK);
      ModalResult:=mrNone;
      Abort;
      exit;
    end;
    q_EdTmp.Close;
  end;

  with TF_Nariad(ParentNariad) do
  try
    q_NarLines.First;
    while not q_NarLines.EOF do
    Begin
      IF q_NarLinesVES.AsString='' Then
      try
        q_NarLines.Edit;
        q_NarLinesVES.AsFloat:=0;
        q_NarLines.Post;
      except
      end;
      q_NarLines.Next;
    end;
    ora_Session.ApplyUpdates([q_Nariad], False);
    ora_Session.CommitUpdates([q_Nariad]);
    If q_Nariad.State<>dsBrowse then q_Nariad.Post;
  except
    on E: Exception do
    Begin
      Application.MessageBox(PChar('Изменить/добавить наряд не удалось: '+#13#10+E.Message),'Внимание',MB_OK);
      ora_Session.CancelUpdates([q_Nariad]);
      q_Nariad.Cancel;
    end;
  end;
end;

procedure TF_EdNariad.bt_cancelClick(Sender: TObject);
begin
  with TF_Nariad(ParentNariad) do
  try
    q_Nariad.Cancel;
    ora_Session.CancelUpdates([q_Nariad]);
  except
    ora_Session.CancelUpdates([q_Nariad]);
  end;
end;

procedure TF_EdNariad.FormCreate(Sender: TObject);
var S:string;
begin
  ParentNariad:=TForm(Owner);
  with TF_Nariad(ParentNariad) do
  Begin
    ed_NumNariad.DataSource:=ds_Nariad;
    ed_DateNariad.DataSource:=ds_Nariad;
    ed_DateEnd.DataSource:=ds_Nariad;
    ed_Dover.DataSource:=ds_Nariad;
    ed_Dover.ListSource:=ds_ListDover;
    lb_DateDover.DataSource:=ds_ListDover;
    lb_DateEnd.DataSource:=ds_ListDover;
    lb_Platel.DataSource:=ds_ListDover;
    lb_NumDover.DataSource:=ds_ListDover;
    lb_DoljDover.DataSource:=ds_ListDover;
    lb_FioDover.DataSource:=ds_ListDover;
    q_Prod.Session:=ora_Session;
    q_Prod.Open;
    q_EdTmp.Session:=ora_Session;
    q_NarLines.Session:=ora_Session;
    q_NarLines.Master:=q_Nariad;
    q_NarLines.Open;
    case q_Nariad.FieldByName('mesto_id').AsInteger of
      0: S:='Наряд для Центр-офис';
      1: S:='Наряд на ЭСТАКАДУ';
      2: S:='Наряд на АВТОНАЛИВ';
      3: S:='Наряд на БИТУМНУЮ';
      else S:='Наряд';
    end;
  end;
  Caption:=S;
end;

procedure TF_EdNariad.sb_FindFirstClick(Sender: TObject);
var SeekFlag:boolean;
    id,id_tmp:integer;
begin
  Last_Id:=0;
  Id:=0;
  id_tmp:=0;
  SeekFlag:=false;
  with TF_FindDov.Create(Self) do
  Begin
    ShowModal;
    If ModalResult=mrYes then
    with q_EdTmp do
    try
      lb_seek.Caption:=SeekStr;
      // поиск по № доверенности
      Close;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT ID FROM KLS_DOVER WHERE UPPER(LTRIM(RTRIM(NUM_DOVER)))='''+AnsiUpperCase(Trim(SeekStr))+''' ORDER BY ID DESC');
      Open;
      If NOT Eof Then
      Begin
        Id:=FieldByName('ID').AsInteger;
        SeekFlag:=true;
      end;

      // поиск по ФИО
      Close;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT ID FROM KLS_DOVER WHERE INSTR(UPPER(LTRIM(RTRIM(FIO_DOVER))),'''+AnsiUpperCase(Trim(SeekStr))+''')<>0 ORDER BY ID DESC');
      Open;
      If NOT Eof Then
      Begin
        Id_tmp:=FieldByName('ID').AsInteger;
        If Id_tmp>Id then Id:=Id_tmp;
        SeekFlag:=true;
      end;

      // поиск по Должность
      Close;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT ID FROM KLS_DOVER WHERE INSTR(UPPER(LTRIM(RTRIM(DOLJ_DOVER))),'''+AnsiUpperCase(Trim(SeekStr))+''')<>0 ORDER BY ID DESC');
      Open;
      If NOT Eof Then
      Begin
        Id_tmp:=FieldByName('ID').AsInteger;
        If Id_tmp>Id then Id:=Id_tmp;
        SeekFlag:=true;
      end;

      // поиск по покупателю
      Close;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT ID FROM V_LIST_DOVER_IN_NARIAD WHERE (INSTR(UPPER(LTRIM(RTRIM(short_NAME))),'''+AnsiUpperCase(Trim(SeekStr))+''')<>0 OR INSTR(UPPER(LTRIM(RTRIM(predpr_name))),'''+AnsiUpperCase(Trim(SeekStr))+''')<>0) ORDER BY ID DESC');
      Open;
      If NOT Eof Then
      Begin
        Id_tmp:=FieldByName('ID').AsInteger;
        If Id_tmp>Id then Id:=Id_tmp;
        SeekFlag:=true;
      end;

      If NOT SeekFlag Then
        Application.MessageBox('Искомое значение не найдено','Внимание',MB_OK)
      else
      Begin
        Last_Id:=Id;
        TF_Nariad(ParentNariad).q_Nariad.FieldByName('DOVER_ID').AsInteger:=Last_Id;
      End;
      Close;
    except
      Application.MessageBox('Искомое значение не найдено','Внимание',MB_OK);
    end;
    Free;
  end;

end;

procedure TF_EdNariad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_NarLines.Close;
  q_NarLines.SQL.Clear;
  q_EdTmp.Close;
  q_EdTmp.SQL.Clear;
end;

procedure TF_EdNariad.sbPrintClick(Sender: TObject);
var TypeDoc,NewVisible,Template,NewTemplate,ItemIndex:OleVariant;
var SaveChanges,OriginalFormat, RouteDocument: OleVariant;
var i, cntMonth:integer;
var s:string;

  function RusDate(dd:TDateTime):string;
  var mm:string;
  begin
    Case ExtractMonth(dd) of
      1: mm:=' января ';
      2: mm:=' февраля ';
      3: mm:=' марта ';
      4: mm:=' апреля ';
      5: mm:=' мая ';
      6: mm:=' июня ';
      7: mm:=' июля ';
      8: mm:=' августа ';
      9: mm:=' сентября ';
     10: mm:=' октября ';
     11: mm:=' ноября ';
     12: mm:=' декабря ';
    end;
    RusDate:=IntToStr(ExtractDay(dd))+mm+IntToStr(ExtractYear(dd))+' г.'
  end;

begin
  bt_okClick(Sender);
  ModalResult:=mrNone;
  with TF_Nariad(ParentNariad) do
  try
    q_ProdInNar.Session:=TF_Nariad(ParentNariad).ora_Session;
    q_ProdToNar.Session:=TF_Nariad(ParentNariad).ora_Session;
    q_ProdToNar.Close;
    q_ProdToNar.Open;
    q_ListMonth.Session:=TF_Nariad(ParentNariad).ora_Session;
    q_ListMonth.Close;
    q_ListMonth.SetVariable('IdNar',q_NarLines.FieldByName('Nariad_id').AsInteger);
    q_ListMonth.Open;
    Template := EmptyParam;
    NewTemplate := True;
    ItemIndex := 1;
    try
      Wordapplication.Connect;
    except
      MessageDlg('Может Word не установлен?', mtError, [mbOk], 0);
      Abort;
    end;
    with WordApplication do
    begin
      Visible := True;
      Caption := 'Наряд № '+
         q_Nariad.FieldByName('num_nar').AsString+' от '+
         DateToStr(q_Nariad.FieldByName('date_nar').AsDateTime);
      {Create new document}
      Template := EmptyParam;
      NewTemplate := False;
      NewVisible := True;
      TypeDoc:=wdNewBlankDocument;
      Documents.AddOld(Template, NewTemplate);
      {Turn Spell checking of because it takes a long time if enabled and slows down Winword}
      Options.CheckSpellingAsYouType := False;
      Options.CheckGrammarAsYouType := False;
      {Insert data}
      with Selection do
      Begin
        TypeParagraph;
        Font.Bold := 1;
        Font.Size := 16;
        TypeText('Коми ТУ ОАО "ЛУКОЙЛ"'+#13);
        Font.Bold := 0;
        Font.Size := 9;

        for i:=1 to 2 do TypeParagraph;

        ParagraphFormat.Alignment := wdAlignParagraphRight;
        try
          TypeText('Действительно по '+RusDate(q_Nariad.FieldByName('date_end').AsDateTime)+#13);
        except
          TypeText('Действительно по '+q_Nariad.FieldByName('date_end').AsString+#13);
        end;

        ParagraphFormat.Alignment := wdAlignParagraphCenter;
        Font.Size := 12;
        TypeText(#13#13);

        Font.Size := 16;
        Font.Bold := 1;
        TypeText('НАРЯД № '+q_Nariad.FieldByName('num_nar').AsString);
        Font.Size := 12;
        Font.Bold := 0;
        TypeText(#13#13);

        TypeText(RusDate(q_Nariad.FieldByName('date_nar').AsDateTime)+#13);
        Font.Size := 12;
        TypeText(#13#13);
        ParagraphFormat.Alignment := wdAlignParagraphLeft;

        Font.Bold := 0;
        TypeText('Отпустите:  ');
        Font.Bold := 1;
        TypeText('     '+Trim(ed_Dover.Text));
        i:=Information[wdVerticalPositionRelativeToPage];
        TypeText(#13#13);
        WordApplication.ActiveDocument.Shapes.AddLine(157.05, i+17, 544.05, i+17, EmptyParam);

        q_ListMonth.First;
        cntMonth:=0;
        while NOT q_ListMonth.EOF do
        begin
          Inc(cntMonth);
          Font.Bold := 0;
          TypeText('Заявка №:  ');
          Font.Bold := 1;
          Font.Size := 12;
          TypeText('       '+Trim(
                q_ListMonth.FieldByName('nom_zd').AsString + ' ( ' +
                Trim(q_ListMonth.FieldByName('ABBR_NPR').AsString) + ' )'));
          Font.Size := 8;
          TypeText(' '+Trim(
                q_ListMonth.FieldByName('prim').AsString));
          Font.Size := 12;
          i:=Information[wdVerticalPositionRelativeToPage];
          TypeText(#13#13);
          WordApplication.ActiveDocument.Shapes.AddLine(157.05, i+17, 544.05, i+17, EmptyParam);
          q_ListMonth.Next;
        end;

        Font.Bold := 0;
        TypeText('Через:  ');
        Font.Bold := 1;
        TypeText('             '+Trim(lb_FioDover.Field.Value));
        i:=Information[wdVerticalPositionRelativeToPage];
        TypeText(#13#13);
        WordApplication.ActiveDocument.Shapes.AddLine(157.05, i+17, 544.05, i+17, EmptyParam);

        Font.Bold := 0;
        TypeText('По доверенности  ');
        Font.Bold := 1;
        TypeText('     № ' + Trim(lb_NumDover.Field.Value) + ' от ' + RusDate(StrToDate(lb_DateDover.Field.Value)));
        i:=Information[wdVerticalPositionRelativeToPage];
        TypeText(#13#13);
        WordApplication.ActiveDocument.Shapes.AddLine(200, i+17, 544.05, i+17, EmptyParam);

        Font.Bold := 0;
        If CntMonth>2 then Font.Size := 10 Else Font.Size := 12;
        q_ProdToNar.First;
        while NOT q_ProdToNar.EOF do
        begin
          q_ProdInNar.Close;
          q_ProdInNar.SetVariable('IdNar',q_NarLines.FieldByName('nariad_id').AsInteger);
          q_ProdInNar.SetVariable('NarOrder',q_ProdToNar.FieldByName('ORDER_NPR').AsInteger);
          q_ProdInNar.Open;

          If (q_ProdToNar.FieldByName('ORDER_NPR').AsInteger<>0) Then
          Begin
            TypeText(q_ProdToNar.FieldByName('ORDER_NPR').AsString+'.  ');
            TypeText(Trim(q_ProdToNar.FieldByName('NAME_NPR').AsString)+' ');
            TypeText('                ');
            If CntMonth>2 Then TypeText('                ');
            If NOT q_ProdInNar.EOF Then
            Begin
              TypeText(Funcs.VES_PR(q_ProdInNar.FieldByName('VES').AsFloat,999,s,s,s));
            End;
            i:=Information[wdVerticalPositionRelativeToPage];
            TypeParagraph;
            TypeParagraph;
            WordApplication.ActiveDocument.Shapes.AddLine(250, i+14, 544.05, i+14, EmptyParam);
          end;

          q_ProdToNar.Next;
        end;

        for i:=1 to 2 do TypeParagraph;
        Font.Size := 14;
        Font.Bold := 1;
        TypeText('Начальник ОРН ___________________________ Кульбицкая И.Н.');
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      WordApplication.Disconnect;
    end;
  end;

  WordApplication.Activate;
  SaveChanges := WdDoNotSaveChanges;
  OriginalFormat := UnAssigned;
  RouteDocument := UnAssigned;
  try
{    WordApplication.Quit(SaveChanges, OriginalFormat, RouteDocument);}
    WordApplication.Disconnect;
  except
    on E: Exception do
    begin
      Showmessage(E.Message);
      WordApplication.Disconnect;
    end;
  end;

  q_ProdInNar.Close;
  q_ProdToNar.Close;
  q_ListMonth.Close;
end;

procedure TF_EdNariad.sb_FindNextClick(Sender: TObject);
var SeekFlag:boolean;
    id,id_tmp:integer;
    SeekStr:string;
begin
  id_tmp:=0;
  id:=0;
  SeekFlag:=false;
  SeekStr:=lb_seek.Caption;
  with q_EdTmp do
  try
    // поиск по № доверенности
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT ID FROM KLS_DOVER WHERE UPPER(LTRIM(RTRIM(NUM_DOVER)))='''+AnsiUpperCase(Trim(SeekStr))+''' AND ID<'+IntToStr(Last_Id)+' ORDER BY ID DESC');
    Open;
    If NOT Eof Then
    Begin
      Id:=FieldByName('ID').AsInteger;
      SeekFlag:=true;
    end;

    // поиск по ФИО
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT ID FROM KLS_DOVER WHERE INSTR(UPPER(LTRIM(RTRIM(FIO_DOVER))),'''+AnsiUpperCase(Trim(SeekStr))+''')<>0 AND ID<'+IntToStr(Last_Id)+' ORDER BY ID DESC');
    Open;
    If NOT Eof Then
    Begin
      Id_tmp:=FieldByName('ID').AsInteger;
      If Id_tmp>Id then Id:=Id_tmp;
      SeekFlag:=true;
    end;

    // поиск по Должность
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT ID FROM KLS_DOVER WHERE INSTR(UPPER(LTRIM(RTRIM(DOLJ_DOVER))),'''+AnsiUpperCase(Trim(SeekStr))+''')<>0 AND ID<'+IntToStr(Last_Id)+' ORDER BY ID DESC');
    Open;
    If NOT Eof Then
    Begin
      Id_tmp:=FieldByName('ID').AsInteger;
      If Id_tmp>Id then Id:=Id_tmp;
      SeekFlag:=true;
    end;

    // поиск по покупателю
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT ID FROM V_LIST_DOVER_IN_NARIAD WHERE (INSTR(UPPER(LTRIM(RTRIM(short_NAME))),'''+AnsiUpperCase(Trim(SeekStr))+''')<>0 OR INSTR(UPPER(LTRIM(RTRIM(predpr_name))),'''+AnsiUpperCase(Trim(SeekStr))+''')<>0) AND ID<'+IntToStr(Last_Id)+' ORDER BY ID DESC');
    Open;
    If NOT Eof Then
    Begin
      Id_tmp:=FieldByName('ID').AsInteger;
      If Id_tmp>Id then Id:=Id_tmp;
      SeekFlag:=true;
    end;

    If NOT SeekFlag Then
      Application.MessageBox('Искомое значение не найдено','Внимание',MB_OK)
    else
    Begin
      Last_Id:=Id;
      TF_Nariad(ParentNariad).q_Nariad.FieldByName('DOVER_ID').AsInteger:=Last_Id;
    End;
    Close;
  except
    Application.MessageBox('Искомое значение не найдено','Внимание',MB_OK);
  end;

end;

end.
