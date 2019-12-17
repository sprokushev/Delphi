unit remainsF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, DB, OracleData;

type
  TRemainsDlg = class(TForm)
    WebBrowser1: TWebBrowser;
    src: TOracleDataSet;
  private
    { Private declarations }
  public
    procedure Generate(azs_id: integer);
  end;

var
  RemainsDlg: TRemainsDlg;

implementation

{$R *.dfm}

{ TRemainsDlg }

procedure TRemainsDlg.Generate(azs_id: integer);
var
f:  textFile;
sm, url:  string;
begin
  url := GetCurrentDir + '\report.html';
  AssignFile(f, url);
  Rewrite(f);
  src.close;
  src.SetVariable(0, azs_id);
  src.Open;

  if src.RecordCount = 0 then begin
    writeln(f, '<h1><center> Данные отсутствуют </center></h1>');
  end
  else begin
    sm := src.FieldValues['sm_number'];
    writeln(f, '<table border=1>');
    //шапка
    writeln(f, '<tr> <td>Номенклатор </td> <td> № резервуара </td> <td>Остаток, л</td>');

    while not src.Eof do begin
      writeln(f, '<tr>');
      writeln(f, '<td> ' + src.FieldValues['nomen_code'] + '</td>');
      writeln(f, '<td> ' + IntToStr(src.FieldValues['numb']) + '</td>');
      writeln(f, '<td> ' + FloatToStr(src.FieldValues['fact_volume']) + '</td>');
      writeln(f, '</tr>');

      src.Next;
      if src.FieldValues['sm_number'] <> sm then
        break;
    end;
    writeln(f, '</table>');
  end;

  CloseFile(f);
  WebBrowser1.Navigate(url);
end;

end.
