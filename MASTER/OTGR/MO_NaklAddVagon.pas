unit MO_NaklAddVagon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ToolWin, ActnMan, ActnCtrls, XPStyleActnCtrls, DB,
  Grids, DBGridEh, OracleData, MO_NaklNew, MO_NaklVozNew, MO_UvedVozNew, StdCtrls, ComCtrls, DateUtils, MO_UvedNew;

type
  Tf_NaklAddVagon = class(TForm)
    acNaklAddVagon: TActionManager;
    ActionToolBar1: TActionToolBar;
    acNaklAdd1: TAction;
    fcSelectAll: TAction;
    acDeselectAll: TAction;
    acExit: TAction;
    ListView1: TListView;
    q_vag_nakl: TOracleDataSet;
    q_vag_uved: TOracleDataSet;
    q_vag_voz: TOracleDataSet;
    q_vag_UvedVoz: TOracleDataSet;
    procedure selAllVagons(sel:boolean);
    procedure fcSelectAllExecute(Sender: TObject);
    procedure acDeselectAllExecute(Sender: TObject);
    procedure acNaklAdd1Execute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    q_vagons:TOracleDataSet;
  public
    { Public declarations }
    ParentFormName:char;
    ParentFormN:Tf_NaklNew;
    ParentFormU:Tf_UvedNew;
    ParentFormV:Tf_NaklVozNew;
    ParentFormZ:Tf_UvedVozNew;
    MESTO_ID,LOAD_TYPE_ID:INTEGER;
    NOM_ZD,PROD_ID_NPR:string;
    DOC_ID,FORMNAKL_ID,VAGOWNER_ID:double;
  end;

var
  f_NaklAddVagon: Tf_NaklAddVagon;

implementation

{$R *.dfm}
uses main,MO_Sved,ForSess, ForDB;

procedure Tf_NaklAddVagon.FormActivate(Sender: TObject);
var
  ListItem: TListItem;
begin
  Case ParentFormName of
    'N':Begin
          ParentFormN:=Tf_NaklNew(owner);
          q_vagons:=q_vag_nakl;
        end;
    'V':Begin
          ParentFormV:=Tf_NaklVozNew(owner);
          q_vagons:=q_vag_voz;
        end;
    'U':Begin
          ParentFormU:=Tf_UvedNew(owner);
          q_vagons:=q_vag_uved;
        end;
    'Z':Begin
          ParentFormZ:=Tf_UvedVozNew(owner);
          q_vagons:=q_vag_UvedVoz;
        end;

  end;
  q_vagons.Close;
  if ParentFormName='N' then
  Begin
    q_vagons.SetVariable(':FORMNAKL_ID',FORMNAKL_ID);
    q_vagons.SetVariable(':NOM_ZD',NOM_ZD);
    q_vagons.SetVariable(':PROD_ID_NPR',PROD_ID_NPR);
    q_vagons.SetVariable(':VAGOWNER_ID',VAGOWNER_ID);
  end;
  if ParentFormName='V' then
  Begin
    q_vagons.SetVariable(':PROD_ID_NPR',PROD_ID_NPR);
  end;
  if ParentFormName='Z' then
  Begin
    q_vagons.SetVariable(':PROD_ID_NPR',PROD_ID_NPR);
  end;

  //mesto_id заполняется в любом случае
  q_vagons.SetVariable(':MESTO_ID',MESTO_ID);
  q_vagons.SetVariable(':LOAD_TYPE_ID',LOAD_TYPE_ID);
  q_vagons.SetVariable(':DOC_ID',DOC_ID);

  f_db.ReQuery(q_vagons,false);

  //заполним ListView1
  with ListView1 do
  begin
    while not q_vagons.Eof do
    begin
      ListItem := Items.Add;
      ListItem.Caption := q_vagons.FieldByName('Num_cist').Value;
      ListItem.SubItems.Add(q_vagons.FieldByName('VAGOWNER_NAME').AsString);
      ListItem.SubItems.Add(q_vagons.FieldByName('Ves').AsString);
      ListItem.SubItems.Add(q_vagons.FieldByName('VAG_STATUS').AsString);
      if ParentFormName='N' then
      begin
        ListItem.SubItems.Add(ParentFormN.edNum.Text);
        ListItem.SubItems.Add(q_vagons.FieldByName('DATE_OFORML').AsString);
      end
      else
        if ParentFormName='V' then
        begin
          ListItem.SubItems.Add(ParentFormV.edNum.Text);
          ListItem.SubItems.Add(q_vagons.FieldByName('SVED_DATE').AsString);
        end
        else
          if ParentFormName='Z' then
          begin
            ListItem.SubItems.Add(q_vagons.FieldByName('NAKL_NUM').AsString);
            ListItem.SubItems.Add(q_vagons.FieldByName('SVED_DATE').AsString);
          end
          else
          begin
            ListItem.SubItems.Add(q_vagons.FieldByName('NAKL_NUM').AsString);
            ListItem.SubItems.Add(q_vagons.FieldByName('DATE_OFORML').AsString);
          end;
      ListItem.SubItems.Add(q_vagons.FieldByName('SVED_NUM').AsString);
      ListItem.SubItems.Add(q_vagons.FieldByName('Prod_name').AsString);
      ListItem.SubItems.Add(q_vagons.FieldByName('PASP_NUM').AsString);
      ListItem.SubItems.Add(q_vagons.FieldByName('NOM_ZD').AsString);
      ListItem.SubItems.Add(q_vagons.FieldByName('STAN_NAME').AsString);
      ListItem.SubItems.Add(q_vagons.FieldByName('POLUCH_NAME').AsString);
      ListItem.SubItems.Add(q_vagons.FieldByName('POD_NUM').AsString);
      ListItem.SubItems.Add(q_vagons.FieldByName('Vetka_otp_name').AsString);
      q_vagons.Next;
    end;
  end;

end;

procedure Tf_NaklAddVagon.SelAllVagons(sel:boolean);
var
  ListItem: TListItem;
begin
  ListView1.ItemIndex:=0;
  ListItem := ListView1.Selected;
  while ListItem <> nil do
  begin
    ListItem.Checked:=sel;
    ListItem := ListView1.GetNextItem(ListItem, sdAll, [isNone]);
  end;
end;

procedure Tf_NaklAddVagon.fcSelectAllExecute(Sender: TObject);
begin
 SelAllVagons(true);
end;

procedure Tf_NaklAddVagon.acDeselectAllExecute(Sender: TObject);
begin
 SelAllVagons(false);
end;

procedure Tf_NaklAddVagon.acNaklAdd1Execute(Sender: TObject);
var
  ListItem: TListItem;

begin
  if q_vagons.IsEmpty then exit;
  ListView1.ItemIndex:=0;
  ListItem := ListView1.Selected;
  while ListItem <> nil do
  begin
    if ListItem.Checked then
    try
      q_vagons.Locate('NUM_CIST',ListItem.Caption,[loCaseInsensitive]);
      case ParentFormName of
        'N': ParentFormN.pkgFor_nakl.CallProcedure('add_temp_nakl',[q_vagons.FieldByName('REESTR_ID').Value]);
        'V': ParentFormV.pkgFor_nakl_voz.CallProcedure('add_temp_nakl',[q_vagons.FieldByName('REESTR_ID').Value]);
        'U':ParentFormU.pkgFor_uved.CallProcedure('add_temp_uved',[q_vagons.FieldByName('REESTR_ID').Value]);
        'Z':ParentFormZ.pkgFor_uved_voz.CallProcedure('add_temp_uved',[q_vagons.FieldByName('REESTR_ID').Value]);
      end;
    except
      on E: Exception do
      Begin
        // Отобразим ошибку
        f_main.ApplSession.WriteToLog(amFull,'NaklAddVagon',sesError,E.Message,0,'');
        exit;
      end;
    end;
    ListItem := ListView1.GetNextItem(ListItem, sdAll, [isNone]);
  end;
  ModalResult:=mrOk;
end;


procedure Tf_NaklAddVagon.acExitExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_NaklAddVagon.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 q_vagons.Close;
end;


end.
