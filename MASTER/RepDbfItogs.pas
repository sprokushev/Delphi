unit RepDbfItogs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DB, DBGridEh, ADODB,
  ActnList, XPStyleActnCtrls, ActnMan, Menus, DBGridEhImpExp, GridsEh;

type
  Tf_Rep_Dbf_Itogs = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    grid: TDBGridEh;
    ds_data: TDataSource;
    PopupMenu1: TPopupMenu;
    ActionManager1: TActionManager;
    acExport2Excel: TAction;
    Excel1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure acExport2ExcelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ListTitles:TStringList;
    ListItogs:TStringList;
    q_data:TADOQuery;
    FileDBF:string;
  end;

var
  f_Rep_Dbf_Itogs: Tf_Rep_Dbf_Itogs;

implementation

uses main;

{$R *.dfm}

procedure Tf_Rep_Dbf_Itogs.FormActivate(Sender: TObject);
var i,j,k:integer;
    s:string;
    ColName,TitleCnt,TitleSum,FieldValue:string;
begin
  for I := 0 to ListItogs.Count - 1 do
    if Pos ('#', ListItogs[I]) > 1 then
    begin
      // Выщемляем название поля, по которому промежуточный итог
      s:=Trim(ListItogs.ValueFromIndex[I]);
      j:=Pos ('(', s);
      if j>0 then
      Begin
        FieldValue:=System.Copy(s,1,j-1);
        s:=Trim(System.Copy(s,j+1,999));
        if s<>'' then
          if s[length(s)]=')' then s:=Trim(System.Copy(s,1,length(s)-1));

        if s='' then
        Begin
          TitleCnt:='шт.';
          TitleSum:='';
        End
        Else
        Begin
          j:=Pos (',', s);
          TitleCnt:=Trim(System.Copy(s,1,j-1));
          TitleSum:=Trim(System.Copy(s,j+1,999));
        End;
      End
      Else
      Begin
        TitleCnt:='шт.';
        TitleSum:='';
        FieldValue:=s;
      end;

      // Заполняем заголовки в StringGrid
      if TitleSum='' then
      Begin
        j:=ListTitles.IndexOfName(AnsiUpperCase(FieldValue));
        if j<>-1 then
          TitleSum:=ListTitles.ValueFromIndex[j]
        else
          TitleSum:=FieldValue;
      end;

      q_data.Close;
      q_data.SQL.Clear;
      q_data.SQL.Add('SELECT '+ListItogs.Names[I]+', COUNT(*) as CNT123, SUM('+FieldValue+') as SUM123 FROM '''+FileDBF+''' GROUP BY '+ListItogs.Names[I]+' ORDER BY '+ListItogs.Names[I]);
      q_data.Open;

      ds_data.DataSet:=q_data;

      for k:=1 to q_data.FieldCount do
      with grid.Columns.Add do
      begin
        ColName:=AnsiUpperCase(q_data.fields[k-1].FieldName);
        FieldName:=ColName;
        ReadOnly:=True;
        Title.TitleButton:=True;
        if ColName='CNT123' then
        Begin
          Title.Caption:=TitleCnt;
          Footer.ValueType:=fvtSum;
          Width:=50;
        end
        else
          if ColName='SUM123' then
          Begin
            Title.Caption:=TitleSum;
            Footer.ValueType:=fvtSum;
            Width:=100;
          end
          else
            if ColName='GRP123' then
            Begin
              j:=ListTitles.IndexOfName(AnsiUpperCase(ListItogs.Names[I]));
              if j<>-1 then
                Title.Caption:=Trim(ListTitles.ValueFromIndex[j])+' ('+ListItogs.Names[I]+')'
              else
                Title.Caption:=ListItogs.Names[I];
              Width:=400;
            end
          else
            Begin
              j:=ListTitles.IndexOfName(ColName);
              if j<>-1 then
                Title.Caption:=Trim(ListTitles.ValueFromIndex[j])+' ('+ColName+')'
              else
                Title.Caption:=ColName;
              Width:=150;
            end;
      End;
    end;
end;

procedure Tf_Rep_Dbf_Itogs.acExport2ExcelExecute(Sender: TObject);
begin
  SaveDBGridEhToExportFile(TDBGridEhExportAsXLS, Grid, f_main.TempLocalPath+'Itogi.xls', False);
  ShowMessage('Сформирован файл '+f_main.TempLocalPath+'Itogi.xls');
end;

end.
