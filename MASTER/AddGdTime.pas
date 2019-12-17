unit AddGdTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, OracleData, DBCtrls, Buttons, Mask, ComCtrls,
  ADODB;

type
  Tf_AddGdTime = class(TForm)
    cb_Mesto: TDBLookupComboBox;
    Label1: TLabel;
    q_Mesto: TOracleDataSet;
    ds_Mesto: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ed_NumOtgr: TEdit;
    ed_DateOtgr: TDateTimePicker;
    ed_NP_DATA_O: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ed_NP_TIMEP: TEdit;
    ado_Session: TADOConnection;
    q_Reestr: TADOQuery;
    ds_Reestr: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    KvitId:integer;
    ReestrId:integer;
  end;

var
  f_AddGdTime: Tf_AddGdTime;
  OperKind: string;

implementation

uses main;

{$R *.dfm}

procedure Tf_AddGdTime.FormCreate(Sender: TObject);
begin
  q_Mesto.Session:=f_main.ora_Session;
  q_mesto.Open;
end;

procedure Tf_AddGdTime.FormActivate(Sender: TObject);
begin
  ado_Session.Open;
  ed_NumOtgr.SetFocus;
  KvitId:=0;
  ReestrId:=0;
end;

procedure Tf_AddGdTime.BitBtn1Click(Sender: TObject);
begin
  ModalResult:=mrNone;
  with q_Reestr do
  try
    Close;
    SQL[2]:='WHERE mesto='+VarToStr(cb_Mesto.KeyValue);
    SQL[3]:='AND num_cist='+ed_NumOtgr.Text;
    SQL[4]:='AND date_otgr={'+FormatDateTime('mm/dd/yyyy',ed_DateOtgr.Date)+'}';
    Open;
    if Eof Then
      Application.MessageBox('Внимание!','Отгрузка не найдена!',MB_OK)
    Else
    Begin
      if q_Reestr.RecordCount>1 then
        Application.MessageBox('Внимание!','Найдено больше 1 отгрузки с данными реквизитами!',MB_OK)
      else
      Begin
        ModalResult:=mrOk;
        ReestrId:=FieldByName('ID').AsInteger;
        KvitId:=FieldByName('KVIT_ID').AsInteger;
      End;
    End;
  except
    Application.MessageBox('Внимание!','Ошибка доступа к оперативным данным!',MB_OK);
    Close;
  end;
end;

end.
