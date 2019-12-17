unit MO_PaspBrowse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, MO_SvedNew, DBGridEh;

type
  Tf_PaspBrowse = class(TForm)
    gd_Pasp: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure gd_PaspDblClick(Sender: TObject);
    procedure gd_PaspKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_PaspBrowse: Tf_PaspBrowse;
  ParentForm:Tf_SvedNew;

implementation

uses DB;
{$R *.dfm}

procedure Tf_PaspBrowse.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ParentForm.edPasp_id.SetFocus;
  Action:=caFree;
end;

procedure Tf_PaspBrowse.FormCreate(Sender: TObject);
var
  WhereStr:string;
begin
  ParentForm:=Tf_SvedNew(Owner);
  with ParentForm do
    begin
      if lcName_NPR.Text<>'<НЕ ВЫБРАН>' then
       begin
         WhereStr:='AND pr.ID_GROUP_NPR='+QuotedStr(q_Product.FieldByName('ID_GROUP_NPR').AsString);
         q_Pasp.SQL.Strings[7]:=WhereStr;
        end;
      q_Pasp.Close;
      q_Pasp.Open;
      q_Pasp.SQL.Strings[7]:='AND 1=1';
    end;
end;

procedure Tf_PaspBrowse.gd_PaspDblClick(Sender: TObject);
begin
  with ParentForm.q_Pasp do
    begin
      ParentForm.edPasp_id.Text:= FieldByName('ID').AsString;
      ParentForm.edPasp_num.Text:=FieldByName('PASP_NUM').AsString;
      ParentForm.edPasp_date.Value:=FieldByName('PASP_DATE').AsDateTime;
      ParentForm.edRez_num.Text:=FieldByName('REZ_NUM').AsString;
      ParentForm.lcName_npr.DisplayValue:=FieldByName('Name_npr').AsString;
    end;

  with ParentForm.q_ValPasp do
    begin
      Close;
      SetVariable(':pID',ParentForm.q_Pasp.FieldByName('ID').AsString);
      Open;
//при выборе pasp_id нельзя напрямую редактировать дату, резервуар, номер паспорта
      ParentForm.edPasp_date.Enabled:=false;
      ParentForm.edRez_num.Enabled:=false;
      ParentForm.edPasp_num.Enabled:=false;
      ParentForm.lcName_NPR.Enabled:=false;
      ParentForm.edPl15.Text:=FieldByName('PL15').AsString;
      ParentForm.edPl20.Text:=FieldByName('PL20').AsString;
    end;
  Close;
end;

procedure Tf_PaspBrowse.gd_PaspKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then gd_PaspDblClick(self);//на Enter выполним то же самое что и на ДаблКлик
end;

end.
