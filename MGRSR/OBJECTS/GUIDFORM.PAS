unit GuidForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ANYFORM, DBCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Db,
  DBTables, Mask;

type
  TfmGuid = class(TfmAnyForm)
    paRight: TPanel;
    buClose: TButton;
    dnvGuid: TDBNavigator;
    pcGuid: TPageControl;
    tsTable: TTabSheet;
    tsRecord: TTabSheet;
    DBGrid1: TDBGrid;
    dsGuid: TDataSource;
    taGuid: TTable;
    taLock: TTable;
    DataSource1: TDataSource;
    procedure buCloseClick(Sender: TObject);
    procedure dnvGuidClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure taGuidBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGuid: TfmGuid;
  gUniKey:Integer;
implementation

{$R *.DFM}

procedure TfmGuid.buCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmGuid.dnvGuidClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  case Button of
    nbEdit:
      begin
        pcGuid.Pages[1].Caption:='Редактирование записи';
        pcGuid.ActivePage:=tsRecord;
      end;
    nbInsert:
      begin
        pcGuid.Pages[1].Caption:='Создание записи';
        pcGuid.ActivePage:=tsRecord;
        taGuid.Insert;
      end;
    nbCancel, nbPost:
      begin
        pcGuid.Pages[1].Caption:='Запись';
        pcGuid.ActivePage:=tsTable;
      end;

  end;{case}
end;


procedure TfmGuid.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if (taGuid.State=dsInsert) or (taGuid.State=dsEdit) then
    if MessageDlg('Сохранить запись ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      taGuid.Post
    else taGuid.Cancel;
  pcGuid.Pages[1].Caption:='Запись';
end;

procedure TfmGuid.taGuidBeforePost(DataSet: TDataSet);
begin
  inherited;
(*  if (taGuid.State=dsInsert) then begin
    with taLock do begin
      Active:=True;

      if taGuid.TableName='STAN.DBF' then Filter:='GUID=''STAN'''
      else if taGuid.TableName='GDOR.DBF' then Filter:='GUID=''GDOR'''
      else if taGuid.TableName='REGION.DBF'then Filter:='GUID=''REGION'''
      else if taGuid.TableName='STATES.DBF' then Filter:='GUID=''STATES''';
      if FindFirst then begin
        gUniKey:=FieldByName('Value').AsInteger;
        Edit;
        FieldByName('Value').AsInteger:=gUniKey+1;
        Post;
        taGuid.FieldByName('Kod').AsInteger:=gUniKey;

      end else begin
        MessageDlg('Код не был сгенерирован ! Обратитесь к разработчику.',mtError,[mbOk],0);
        gUniKey:=0;
        taGuid.Cancel;
      end;{if}
      Active:=False;
    end;{with}
  end;{if}
*)
end;


end.
