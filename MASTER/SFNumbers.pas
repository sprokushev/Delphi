unit SFNumbers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Main, Grids, DBGridEh, ExtCtrls, DBCtrls, Oracle, DB, OracleData,
  ActnList, XPStyleActnCtrls, ActnMan, TB2Item, TB2Dock, TB2Toolbar;

type
  Tf_SFNumbers = class(TForm)
    t_Numbers: TOracleDataSet;
    ds_numbers: TDataSource;
    ora_Session: TOracleSession;
    DBGridEh1: TDBGridEh;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    ActionManager1: TActionManager;
    acNewSFNumbers: TAction;
    t_NumbersFROM_DATE: TDateTimeField;
    t_NumbersTO_DATE: TDateTimeField;
    t_NumbersSTART_NUM: TFloatField;
    t_NumbersCURR_NUM: TFloatField;
    t_NumbersRANGE: TFloatField;
    t_NumbersREMAINS: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure t_NumbersCalcFields(DataSet: TDataSet);
    procedure acNewSFNumbersExecute(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_SFNumbers: Tf_SFNumbers;

implementation

uses ForDB;

{$R *.dfm}

procedure Tf_SFNumbers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  t_Numbers.Close;
  ora_Session.LogOff;
  Action:=caFree;
end;

procedure Tf_SFNumbers.FormCreate(Sender: TObject);
begin
  f_db.LogonMasterSession(ora_Session);
  t_Numbers.Open;
end;

procedure Tf_SFNumbers.t_NumbersCalcFields(DataSet: TDataSet);
begin
  t_NumbersRemains.Value:=t_NumbersSTART_NUM.AsInteger+
    t_NumbersRANGE.AsInteger-t_NumbersCURR_NUM.AsInteger;
end;

procedure Tf_SFNumbers.acNewSFNumbersExecute(Sender: TObject);
begin
  t_Numbers.Append;
  t_NumbersRANGE.AsInteger:=1; // Затыка
  t_Numbers.Post;
  t_Numbers.RefreshRecord;
end;

procedure Tf_SFNumbers.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if t_Numbers.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

end.
