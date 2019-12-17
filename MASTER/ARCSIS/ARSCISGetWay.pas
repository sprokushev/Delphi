unit ARSCISGetWay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RxLookup, Mask, ToolEdit, CurrEdit, DB, ADODB;

type
  Tf_ARSCISGetWay = class(TForm)
    edFrom1: TRxCalcEdit;
    cbWay1: TRxDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    edTo1: TRxCalcEdit;
    edFrom2: TRxCalcEdit;
    cbWay2: TRxDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    edTo2: TRxCalcEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ds_Way1: TDataSource;
    q_Way1: TADOQuery;
    q_Way2: TADOQuery;
    ds_Way2: TDataSource;
    Label5: TLabel;
    q_Way1WayOfLoadingID: TAutoIncField;
    q_Way1WayOfLoadingName: TStringField;
    q_Way2WayOfLoadingID: TAutoIncField;
    q_Way2WayOfLoadingName: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure cbWay1Change(Sender: TObject);
    procedure cbWay2Change(Sender: TObject);
    procedure edFrom1Change(Sender: TObject);
    procedure edTo1Change(Sender: TObject);
    procedure edFrom2Change(Sender: TObject);
    procedure edTo2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_ARSCISGetWay: Tf_ARSCISGetWay;
  Way1,Way2:string;
  Way1Name,Way2Name:string;
  From1,From2,To1,To2:integer;
implementation

uses ARCSISDataFormUnit;

{$R *.dfm}

procedure Tf_ARSCISGetWay.FormActivate(Sender: TObject);
begin
  cbWay1.Value:=Way1;
  if (Way1='4') or (Way1='5') then
  begin
    edFrom1.Value:=From1;
    edTo1.Value:=1;
  end
  else
  begin
    edFrom1.Value:=From1;
    edTo1.Value:=From1 div 2 + 1;
    edTo2.Value:=1;
  end;
end;

procedure Tf_ARSCISGetWay.cbWay1Change(Sender: TObject);
begin
  if cbWay1.Value='2' then cbWay2.Value:='3';
  if cbWay1.Value='3' then cbWay2.Value:='2';
  if cbWay1.Value='4' then cbWay2.Value:='5';
  if cbWay1.Value='5' then cbWay2.Value:='4';
  if (cbWay1.Value='4') or (cbWay1.Value='5') then
  begin
    edTo1.SetFocus;
    edTo1.Value:=1;
  end
end;

procedure Tf_ARSCISGetWay.cbWay2Change(Sender: TObject);
begin
  if cbWay2.Value='2' then cbWay1.Value:='3';
  if cbWay2.Value='3' then cbWay1.Value:='2';
  if cbWay2.Value='4' then cbWay1.Value:='5';
  if cbWay2.Value='5' then cbWay1.Value:='4';
end;

procedure Tf_ARSCISGetWay.edFrom1Change(Sender: TObject);
begin
  if edTo1.Value>edFrom1.Value then edTo1.Value:=edFrom1.Value;
end;

procedure Tf_ARSCISGetWay.edTo1Change(Sender: TObject);
begin
  if edTo1.Value>edFrom1.Value then edTo1.Value:=edFrom1.Value;
  if TEdit(Sender).Name='edTo1' then edFrom2.Value:=edTo1.Value-1;
end;

procedure Tf_ARSCISGetWay.edFrom2Change(Sender: TObject);
begin
  if TEdit(Sender).Name='edFrom2' then edTo1.Value:=edFrom2.Value+1
  else if edFrom2.Value>=edTo1.Value then edFrom2.Value:=edTo1.Value-1;
  if edTo2.Value>edFrom2.Value then edTo2.Value:=edFrom2.Value;
  if (edTo2.Value=0) and (edFrom2.Value>0) then edTo2.Value:=1;
end;

procedure Tf_ARSCISGetWay.edTo2Change(Sender: TObject);
begin
  if edTo2.Value>edFrom2.Value then edTo2.Value:=edFrom2.Value;
  if (edTo2.Value=0) and (edFrom2.Value>0) then edTo2.Value:=1;
end;

procedure Tf_ARSCISGetWay.BitBtn1Click(Sender: TObject);
begin
  Way1:=cbWay1.Value;
  Way2:=cbWay2.Value;
  From1:=round(edFrom1.Value);
  To1:=round(edTo1.Value);
  From2:=round(edFrom2.Value);
  To2:=round(edTo2.Value);
  Way1Name:=q_Way1WayOfLoadingName.AsString;
  Way2Name:=q_Way2WayOfLoadingName.AsString;
end;

end.
