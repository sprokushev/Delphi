unit disprep1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, RXSpin, Placemnt, Db, ADODB,variants;

type
  Tf_disprep1 = class(TForm)
    cb_Month: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    e_year: TRxSpinEdit;
    GroupBox1: TGroupBox;
    time1: TDateTimePicker;
    Label3: TLabel;
    time2: TDateTimePicker;
    date1: TDateTimePicker;
    date2: TDateTimePicker;
    Label4: TLabel;
    FormStorage1: TFormStorage;
    q_cmn: TADOQuery;
    ADOConnection1: TADOConnection;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure CalcRep;
  public
    { Public declarations }
  end;

var
  f_disprep1: Tf_disprep1;

implementation

uses dateutil,main, ForFiles;

{$R *.DFM}

procedure Tf_disprep1.FormCreate(Sender: TObject);
begin
  time1.Time:=StrToTime('00:00:00');
  time2.Time:=StrToTime('00:00:00');
  date1.Date:=Date-1;
  date2.Date:=Date;
  cb_Month.ItemIndex:=ExtractMonth(Date1.Date)-1;
  e_year.Value:=ExtractYear(Date1.Date);
end;

procedure Tf_disprep1.CalcRep;
begin
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('CREATE TABLE "'+f_main.TempLocalPath+'f10_tm" (date_plan D,date1 D, time1 C(8), date2 D, time2 C(8), date3 D, date4 D, time4 C(8))');
    q_cmn.ExecSQL;
  except
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'f10_tm"');
    q_cmn.ExecSQL;
  end;
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'f10_tm" (date_plan,date1,time1,date2,time2,date4,time4) VALUES (');
  q_cmn.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',EncodeDate(Round(e_year.Value), cb_Month.ItemIndex+1, 1))+',');
  q_cmn.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',Date1.date)+',');
  q_cmn.SQL.Add(''''+FormatDateTime('hh:mm:ss',Time1.time)+''',');
  q_cmn.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',Date2.date)+',');
  q_cmn.SQL.Add(''''+FormatDateTime('hh:mm:ss',Time2.time)+''',');

  if FormatDateTime('hh:mm:ss',Time2.time)>='18:00:00' then
  Begin
    q_cmn.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',Date2.date)+',');
    q_cmn.SQL.Add('''18:00:00'')');
  End
  else
  Begin
    q_cmn.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',Date2.date-1)+',');
    q_cmn.SQL.Add('''18:00:00'')');
  End;

  q_cmn.ExecSQL;

  F_FileUtils.CheckReport('F11.XLS',f_main.TempLocalPath+'F11.XLS');
  F_FileUtils.ExecAndWait(f_main.TempLocalPath+'F11.xls','',SW_SHOWMINIMIZED,false);
  Close;
end;

procedure Tf_disprep1.BitBtn2Click(Sender: TObject);
begin
  CalcRep;
end;

end.
