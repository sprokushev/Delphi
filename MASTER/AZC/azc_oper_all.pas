unit azc_oper_all;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, ComCtrls,
  DBCtrls, ToolEdit, RXDBCtrl, RxDBComb, DBLookupEh, RxLookup, MdiForm, CurrEdit,
  Buttons, Grids, DBGridEh, DBGrids, RXStrUtils, DateUtils;
type
  Tf_forAZC_oper_all = class(TForm)
    OQ_operation: TOracleQuery;
    ODS_operation: TOracleDataSet;
    DS_operation: TDataSource;
    ODS_prod: TOracleDataSet;
    DS_prod: TDataSource;
    ODS_obj: TOracleDataSet;
    DS_obj: TDataSource;
    ODS_place: TOracleDataSet;
    DS_place: TDataSource;
    ODS_predp: TOracleDataSet;
    Ds_predpr: TDataSource;
    ODS_price: TOracleDataSet;
    DS_price: TDataSource;
    DS_type_operation: TDataSource;
    ODS_type_operation: TOracleDataSet;
    Panel1: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText13: TStaticText;
    StaticText12: TStaticText;
    DS_category: TDataSource;
    ODS_category: TOracleDataSet;
    Lookup_obj: TRxLookupEdit;
    lookup_prod: TRxLookupEdit;
    Edit1: TEdit;
    DateEd: TDateEdit;
    LUPED_PLACE: TRxLookupEdit;
    LUPED_SOBSTV: TRxLookupEdit;
    CalcEd_vol: TRxCalcEdit;
    CalcEd_ves: TRxCalcEdit;
    CalcEd_de: TRxCalcEdit;
    calced_price1: TRxCalcEdit;
    CalcEd_price: TRxCalcEdit;
    ED_note: TEdit;
    Button1: TButton;
    Button2: TButton;
    Lookup_sub: TRxLookupEdit;
    StaticText_sub: TStaticText;
    ODS_sub: TOracleDataSet;
    DS_sub: TDataSource;
    ODS_subID_ORG: TFloatField;
    ODS_subNAME_ORG: TStringField;
    ODS_subID_PARENT_ORG: TFloatField;
    ODS_subID_ORG_TYPE: TFloatField;
    lookup_cat: TRxLookupEdit;
    text_cat: TStaticText;
    ODS_categoryID: TIntegerField;
    ODS_categoryCAT_CEN_NAME: TStringField;
    ODS_categoryGROUPDOG_ID: TIntegerField;
    ODS_categoryPREDPR_ID: TIntegerField;
    ODS_categoryCAT_CEN_GROUP_ID: TIntegerField;
    ODS_categoryFOX_ID: TIntegerField;
    ODS_categoryDOG_ID: TIntegerField;
    ODS_categoryFOR_AZC: TStringField;
    chbox_correct: TCheckBox;
    lookup_prod_group: TRxLookupEdit;
    ODS_prod_group: TOracleDataSet;
    DS_prod_group: TDataSource;
    ODS_prod_groupID: TFloatField;
    ODS_prod_groupNAME: TStringField;
    StaticText10: TStaticText;
    Panel2: TPanel;
    lookup_type_op: TRxLookupEdit;
    StaticText11: TStaticText;
    chb_correct: TCheckBox;
    rb_vol: TRadioButton;
    rb_ves: TRadioButton;
    ODS_objID_ORG: TFloatField;
    ODS_objNAME_ORG: TStringField;
    ODS_objID_PARENT_ORG: TFloatField;
    ODS_objID_ORG_TYPE: TFloatField;
    ODS_objIS_ROOT: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject; dataset_u:TOracleDataSet; grid_u:TDBGridEh); reintroduce;
    procedure Button1Click(Sender: TObject);
    procedure raschet_pl(edit_i : integer);
    procedure Button2Click(Sender: TObject);
    procedure CalcEd_volChange(Sender: TObject);
    procedure CalcEd_vesChange(Sender: TObject);
    procedure CalcEd_deChange(Sender: TObject);
    procedure Lookup_objCloseUp(Sender: TObject);
    procedure lookup_priceChange(Sender: TObject);
    procedure LUPED_SOBSTVCloseUp(Sender: TObject);
    procedure lookup_prodCloseUp(Sender: TObject);
    procedure calced_price1Exit(Sender: TObject);
    procedure Lookup_objKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lookup_prodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateEdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LUPED_PLACEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LUPED_SOBSTVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lookup_type_opCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lookup_type_opKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateEdExit(Sender: TObject);
    procedure Calced_skidkaChange(Sender: TObject);
    procedure Lookup_subCloseUp(Sender: TObject);
    procedure lookup_catCloseUp(Sender: TObject);
    procedure lookup_prod_groupCloseUp(Sender: TObject);
    procedure chb_correctClick(Sender: TObject);
    procedure rb_volClick(Sender: TObject);
  private
    procedure realiz_likard(i: integer);
    procedure operation_edit(i: integer);
    procedure operation_insert(i: integer);
    procedure operation_correct(i: integer; var j:boolean);
    procedure Operation_commit(i: integer);
    procedure lookup_ostatok(j: string;i:string);
    procedure pred_oper(var fill_rec:boolean);
    procedure ostatoks;
    procedure GUARD_(S: STRING);
    procedure for_price;

    { Private declarations }

  public
    { Public declarations }
    ParentObj :TForm;
  end;

var
  f_forAZC_oper_all: Tf_forAZC_oper_all;
  operation,var_prod, date_oper: string; //название операции
  v_raschet_pl:real;
  uchet_ostatok: boolean;
  ODS_univ: TOracleDataset;
  fill_rec:boolean;
  dataset_u_:TOracleDataSet;
  grid_u_:TDBGridEh;
  flag_ves_vol:boolean;
  edit_flag:boolean;

implementation

uses azc, main;

{$R *.dfm}

procedure Tf_forAZC_oper_all.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
grid_u_:=nil;
grid_u_.Free;
azc.RunModest:='';
ODS_place.close;
ODS_prod.close;
ODS_obj.close;
ODS_predp.close;
ODS_category.close;
ODS_type_operation.Close;
ODS_operation.Close;
ODs_sub.Close;
ODs_price.Close;
end;


procedure Tf_forAZC_oper_all.FormCreate(Sender: TObject; dataset_u:TOracleDataSet;grid_u:TDBGridEh);
var
var_org:string;
begin
  inherited;
{ TODO -obeatlov -cАЗС : ОПЕРАЦИИ АЗС = FORM CREATE }


dataset_u_:= dataset_u;
grid_u_:=grid_u;

ParentObj:= TForm(owner);
  ODS_operation.Session:=F_main.ora_session;
    ODS_prod.Session:=F_main.ora_session;
        ODS_obj.Session:=F_main.ora_session;
          ODS_place.Session:=F_main.ora_session;
            ODS_predp.session:=F_main.ora_session;
                OQ_OPERATION.Session:=F_main.ora_session;
                   ODS_price.SESSION:=F_MAIN.ORA_SESSION;
                        ODS_type_operation.Session:=F_MAIN.ORA_SESSION;
                          ODS_sub.Session := F_MAIN.ORA_SESSION;
fill_rec:= false;

ODS_operation.Open;
    ODS_place.Open;
        ODS_prod.Open;
              ODS_predp.Open;
                 ODS_price.Open;
                    ODS_sub.Open;

        ODS_operation.Last;
        DateEd.Text:= ODS_operation.fieldbyname('DATE_OPER').asstring;
        GUARD_(AZC_OPER_ALL.operation);

with Tf_forAZCRealiz (ParentObj) do begin
IF (AZC_OPER_ALL.operation  <> 'ЛИКАРД') AND (AZC_OPER_ALL.operation  <> 'ГРУЗ В ПУТИ')
        then ODS_univ:=ODS_azc_realiz;


if  AZC_OPER_ALL.operation  ='ЛИКАРД' then  ODS_univ:= ODS_likard;
if  AZC_OPER_ALL.operation  ='ГРУЗ В ПУТИ' then   ODS_univ:=ODS_good;
end;
        IF ODS_univ.Eof then
        var_org:='31'
        else
        var_org:=ODS_Univ.fieldbyname ('ORG_STRU_2_ID').AsString;
        ODS_Obj.SetVariable(':var_org',var_org );
        ODS_obj.Open;

        // вызов продедуры заполнения формы при edit/insert
        IF  azc.RunModest ='EDIT' then operation_edit(1);
        IF azc.RunModest ='INSERT' then operation_insert(1);
end;



{ TODO -obeatlov -cАЗС : ОПЕРАЦИЯ INSERT  (РАСХОД  -1)  ПРИХОД - 4)) }
procedure Tf_forAZC_oper_all.Button1Click(Sender: TObject);
var k:boolean;
begin
  inherited;
/// ВЫЗОВ ПРОЦЕДРУЫ ПРОВЕРКИ
operation_correct(1, k);
IF k=true then  Operation_commit(1);
END;

//TODO -cАЗС -obeatlov: ОПЕРАЦИЯ расчета 0-плотности, 1-объема, 2-веса
//*********РАСЧЕТ*********
//1-изменяем  объем ; 2-изменяем  плотность; 3- изменяем  вес
//берем за const вес
procedure Tf_forAZC_oper_all.raschet_pl(edit_i:integer);
var
vol,ves,price, sum,de:string;
begin

vol:=Calced_vol.Text;
price:=Calced_price1.Text;
sum:=Calced_price.Text;
ves:=Calced_ves.Text;
de:=Calced_de.Text;

IF vol= ''  then
vol:='0';

if ves='' then
ves:='0';

IF de='' then
de:='0';

IF sum='' then
sum:='0';

IF price ='' then
price:='0';


if vol<>'0' then
calced_de.Text:= floattostr(strtofloat(ves)/strtofloat(vol))
else
calced_de.Text:='0';
IF edit_i<>99 then 
calced_price.Text:= floattostr(strtofloat(price)*strtofloat(vol))
else
calced_price.Text:= floattostr(strtofloat(price)*strtofloat(ves));

end;

//*****************************

procedure Tf_forAZC_oper_all.Button2Click(Sender: TObject);
begin
fill_rec:= false;

self.Close;
end;

//**************РАСЧЕТ ПЛОТНОСТИ, ВЕСА, ОБЪЕМА************

procedure Tf_forAZC_oper_all.CalcEd_volChange(Sender: TObject);
var
vol_,ostatok_:real;
begin
IF rb_vol.Checked then
raschet_pl(1)
else
raschet_pl(99);

If  calced_vol.text='' then
vol_:=0
else
vol_:=strtofloat (calced_vol.text);
ostatok_:=ODS_PROD.fieldbyname('OSTATOK').AsFloat;
If   flag_ves_vol = false then
if operation ='ОСТАТОК' then  Edit1.Text:=floattostr (ostatok_ + vol_)
else Edit1.Text:=floattostr (ostatok_ + vol_);
end;

procedure Tf_forAZC_oper_all.CalcEd_vesChange(Sender: TObject);
begin
raschet_pl(3);
end;

procedure Tf_forAZC_oper_all.CalcEd_deChange(Sender: TObject);
begin
raschet_pl(2);
end;
//*******************************






procedure Tf_forAZC_oper_all.realiz_likard (i:integer);
begin
  ods_price.Close;
if  AZC_oper_all.operation='РАСХОД'  then
  ODS_price.SetVariable(':VAR_CAT','Цена реализации на АЗС')
else
  ODS_price.SetVariable(':VAR_CAT','Цена реализации на АЗС (ЛИКАРД)');
  ODS_price.SetVariable(':VAR_PREDPR',ODS_predp.fieldbyname ('ID').asstring);
  ODS_price.Open;
end;




// { TODO -obeatlov -cАЗС : Контроль продутов (остатков) по конкретному  объекту }
procedure Tf_forAZC_oper_all.Lookup_objCloseUp(Sender: TObject);
var
locate_book:string;
begin
locate_book:=ODS_prod.FieldByName('ID_NPR').AsString;
ODS_prod.Close;
Lookup_prod.Clear;
ODS_prod.SetVariable(':var1', ODS_obj.fieldbyname('ID_ORG').asstring);
ODS_prod.SetVariable(':var4','TO_DATE('''+dateed.Text +''',''dd.mm.yyyy'')');
EDIT1.Text:='';
ODS_prod.Open;
ODS_prod.Locate('ID_NPR', locate_book, []);
lookup_prod.LookupValue:= ODS_prod.fieldbyname('NAME_NPR').asstring;
edit1.Text:= ODS_prod.fieldbyname('OSTATOK').asstring;
for_price ();

if ODS_prod.Eof then lookup_prod.Text:= '';
end;




procedure Tf_forAZC_oper_all.lookup_priceChange(Sender: TObject);
begin
end;

{ TODO -cАЗС -obeatlov : Контроль проставки цен соответствующих продуктов}
//************BEGIN**** ПРОСТАВКА ЦЕН СООТВЕТСТУЮЩИМ ПРОДУКТАМ
procedure Tf_forAZC_oper_all.LUPED_SOBSTVCloseUp(Sender: TObject);
begin
ostatoks();
if  trim(lookup_prod.text)<>'' then
        with ODS_price do begin
        close;
        SetVariable(':VAR_PREDPR', ODS_predp.fieldbyname('ID').AsString);
        Open;
if locate('ID_NPR',ODS_prod.fieldbyname('ID_NPR').AsString, []) then
        begin
        UpdateCursorPos;
        calced_price1.Text:= ODS_price.fieldbyname('CENA_OTP_NPO').asstring;
        end
        else
        calced_price1.Text:= '00.00';
end;


if (self.Showing) and (operation='РАСХОД') or  (operation='ЛИКАРД') then
        begin
        ODS_prod.Close;
        ODS_prod.SetVariable(':var3',ODS_predp.fieldbyname('ID').AsString);
        ODS_prod.open;
        lookup_prod.Clear;
        end;
end;





procedure Tf_forAZC_oper_all.lookup_prodCloseUp(Sender: TObject);
begin
ostatoks();
edit1.Text:= ODS_prod.fieldbyname ('OSTATOK').AsString;

IF ODS_prod.FieldByName('AZC_PR_GRP_ID').AsInteger<>4 then
calced_de.enabled:=true
else  begin
calced_de.enabled:=false;
calced_de.text:='1';
end;

IF (operation='РАСХОД') then
//(runmodest<>'EDIT') then
begin
if  (trim(LUPED_SOBSTV.text)<>'') then
with ODS_price do begin
close;
 SetVariable(':VAR_PROD', ODS_prod.fieldbyname('ID_NPR').AsString);
 Open;
    if locate('ID_NPR',ODS_prod.fieldbyname('ID_NPR').AsString, [])
     then begin
      UpdateCursorPos;
      calced_price1.Text:=ODS_price.fieldbyname('CENA_OTP_NPO').asstring;
end;
end ;
end;

end;


//************END**** ПРОСТАВКА ЦЕН СООТВЕТСТУЮЩИМ ПРОДУКТАМ
 { TODO -obeatlov -cАЗС : Операция - EDIT }
procedure Tf_forAZC_oper_all.operation_edit(i:integer);
begin
edit_flag:=true;
lookup_ostatok(operation,azc.runmodest);                            // позиционируем для редактирования собственника и объект
pred_oper(fill_rec);

// fill_rec - определяет выбрана запись для редактиования или нет
if fill_rec=true then
        begin
        lookup_ostatok(operation,azc.runmodest);
        If (AZC_oper_all.operation<>'ГРУЗ В ПУТИ') AND (AZC_oper_all.operation<>'ЛИКАРД') then
        begin
        ODS_type_operation.SQL[1]:='';
        ODS_type_operation.open;
        ODS_type_operation.Locate('ID', ODS_univ.fieldbyname('TYPE_OPER_ID').AsString,[]);
        lookup_type_op.LookupValue:=ODS_type_operation.fieldbyname ('name').asstring;
        lookup_type_op.enabled:= true;
        dateed.Text:=ODS_univ.fieldbyname('DATE_OPER').AsString;
        IF ODS_type_operation.FieldByName('PRICE_FLAG').AsString ='N' then
                begin
                calced_price1.Enabled:= false;
                calced_price.enabled:= false;
        end
           else
                begin
                calced_price1.Enabled:= true;
                calced_price.enabled:= true;
                calced_price1.Text:= ODS_univ.fieldbyname ('PRICE').asstring;
                calced_price.Text:= ODS_univ.fieldbyname('SUMMA').AsString;
                end;

                IF ODS_univ.FieldByName('DISCOUNT').AsInteger>0 then
                 begin
                 end;
end;

         // место отгрузки
IF (azc_oper_all.operation='ПРИХОД') OR (azc_oper_all.operation='ГРУЗ В ПУТИ') THEN
    begin
    LUPED_PLACE.Enabled:= true;
    ODS_place.Locate('ID', ODS_univ.fieldbyname ('PLACE_SEND_ID').asstring, []);
    LUPED_PLACE.Text:= ODS_univ.fieldbyname('NAME_2').asstring;
end;
// цена
IF (azc_oper_all.operation='ЛИКАРД') then
       begin
       calced_price1.Text:= ODS_univ.fieldbyname ('PRICE').asstring;
       calced_price.Text:= ODS_univ.fieldbyname('SUMMA').AsString;
       end;
       end
  else
         ShowMessage ('НЕТ ЗАПИСИ ДЛЯ РЕДАКТИРОВАНИЯ!');


end;





{ TODO -obeatlov -cАЗС : ОПРЕАЦИЯ LOOKUP_OSTATOK }
procedure  Tf_forAZC_oper_all.lookup_ostatok (j:string;i:string);
var
a:string;
begin
a:= 'sasa';
with ODS_prod do
begin
Close;
SQL.Clear;
DeclareVariable(':var1', 1); // объект
DeclareVariable(':var4', 1); // дата
DeclareVariable(':var3', 1); // собственник

SetVariable(':var1', ODS_obj.fieldbyname('ID_ORG').asstring);
SetVariable(':var3',1);
edit1.Enabled:= true;
end;
if ((j='РАСХОД') or (j='ЛИКАРД')) and (i<>'EDIT') then
with ODS_prod do
 begin
SetVariable(':var4','TO_DATE('''+FormatDateTime('dd.mm.yyyy',date)+''',''dd.mm.yyyy'') ');

SQL.Add('SELECT DISTINCT ID_NPR, NAME_NPR, OSTATOK ,AZC_PR_GRP_ID FROM (');
IF flag_ves_vol = true then
begin
SQL.Add('SELECT A.*,NVL (FOR_AZC.GET_AZC_OST_VES (:var1,');
rb_ves.Checked:=true;
end
else
SQL.Add('SELECT A.*,NVL (FOR_AZC.GET_AZC_OST_VOL (:var1,');
sql.add('A.ID_NPR,:var3, :var4),0)  as OSTATOK  FROM KLS_PROD A  WHERE AZC_PR_GRP_ID is not null)');
SQL.Add ('WHERE ');
SQL.Add ('AZC_PR_GRP_ID='+ ODS_univ.fieldbyname('AZC_PR_GRP_ID').asstring);
SQL.Add ('ORDER BY NAME_NPR');
        CalcEd_price.Enabled:= true;
        CalcEd_price1.Enabled:= true;
end
else with ODS_prod do
      begin
        // - для просчета ситуации когда база данных пуста
        IF flag_ves_vol= true then
        begin
        SQL.Add(' SELECT  A.*,NVL (FOR_AZC.GET_AZC_OST_VES(:var1,A.ID_NPR, :var3,  :var4),0) as OSTATOK FROM KLS_PROD A, azc_prod_group');
        rb_ves.Checked:=true;
        end
        else
       SQL.Add(' SELECT  A.*,NVL (FOR_AZC.GET_AZC_OST_VOL(:var1,A.ID_NPR, :var3,  :var4),0) as OSTATOK FROM KLS_PROD A, azc_prod_group');
       sql.add(' WHERE ');
       sql.add(' A.AZC_PR_GRP_ID = azc_prod_group.ID');
       sql.add(' ');
       sql.add(' order by name_npr');
       SetVariable(':var4','TO_DATE('''+dateed.Text +''',''dd-mm-yy'')');
       end;
        ODS_prod.open;
        end;


 { TODO -obeatlov -cАЗС : Операция - INSERT }
procedure Tf_forAZC_oper_all.operation_insert(i:integer);
begin

///вызов операциии
     lookup_ostatok (operation, azc.runmodest);
     pred_oper(fill_rec);


 IF (operation='РАСХОД')  then
 with ODS_type_operation do  // установка по умолчанию операции
        begin
        Close;
        SQL[1]:= 'WHERE (KIND_OPER=2 or KIND_OPER = 5)';
        Open;
//        locate('NAME','РЕАЛИЗАЦИЯ', [] );
        locate ('ID',1, []);
        lookup_type_op.Enabled:= true;
        lookup_type_op.Text:=fieldbyname('NAME').AsString;
     //   for_price();
       end
  else
  IF azc_oper_all.operation='ПРИХОД'  then // установка по умолчанию операции
    with ODS_type_operation do  begin
    Close;
    SQL[1]:= 'WHERE (KIND_OPER=1 or KIND_OPER = 4 or KIND_OPER = 6)';
    Open;
    locate ('ID',4, []);
    //locate ('NAME','ПРИХОД',[]);
    lookup_type_op.Enabled:= true;
   lookup_type_op.Text:=fieldbyname('NAME').AsString
   end
    else

   IF azc_oper_all.operation='ОСТАТОК'  then // установка по умолчанию операции
    with ODS_type_operation do  begin
    Close;
    SQL[1]:= 'WHERE (KIND_OPER=3 or KIND_OPER = 0)';
    Open;
        lookup_type_op.Enabled:= true;
//    locate ('NAME','ОСТАТОК',[]);
     locate ('ID',3, []);
    lookup_type_op.Text:='ОСТАТОК';
   end;
   ODS_predp.Locate('ID',1, []);
//   LUPED_SOBSTV.text:='ЛУКОЙЛ НК ОАО'; //
//   ODS_predp.UpdateCursorPos; //*

    // проверяем - необходимость указания места отгрузки
 if (operation='ГРУЗ В ПУТИ') OR (operation='ПРИХОД') then
 begin
      LUPED_PLACE.Enabled:= true;
      LUPED_PLACE.Text := 'Автоналив';
      ODS_place.Locate('NAME', 'Автоналив', []);
 end;

end;




 { TODO -obeatlov -cАЗС : Операция - проверки заполнения формы }
procedure Tf_forAZC_oper_all.operation_correct(i:integer; var j:boolean);
begin

IF  chb_correct.checked=false then
begin      //  для всех операций
if ((trim(lookup_obj.text)='') or (lookup_prod.text='') or (Luped_sobstv.text='') or (calced_vol.Text=''))
        then begin
        ShowMessage('Заполнены не все поля!!!!');
        j:= false;
end
    else j:= true
end
else
      j:= true;
        // цены не цчитываются в ГРУЗ В ПУТИ
        // по умолчанию указаны те группы продуктов
if (operation <> 'ГРУЗ В ПУТИ') AND (operation <> 'ЛИКАРД') then
if (ODS_type_operation.FieldByName('PRICE_FLAG').AsString='Y') OR (operation='ЛИКАРД')  THEN BEGIN
IF calced_price.Text='' then
        begin
        j:= false;
        ShowMessage('Не укзаны цены');
    end;

IF (calced_price1.Text='') and (chb_correct.Checked = false)  then
        begin
        j:= false;
        ShowMessage('Не укзаны цены');
    end;
END;

        IF (operation='ПРИХОД') Or (operation='ГРУЗ В ПУТИ') then
        if (luped_place.Text = '')  then  begin
        j:= false;
        showmessage ('Заполните место отправки')
end;

IF (operation = 'ОСТАТОК') and (azc.RunModest<>'EDIT') then
begin
  OQ_operation.SQL.Clear;
  OQ_operation.SQL.Add('SELECT * FROM AZC_OPERATION ');
  OQ_operation.SQL.Add('WHERE PROD_ID_NPR =''' + ODS_PROD.FIELDBYNAME('ID_NPR').AsString+'''');
  OQ_operation.SQL.Add('AND SOBSTV_ID =' + ODS_PREDP.FIELDBYNAME('id').AsString );
  OQ_operation.SQL.Add('AND ORG_STRU_ID ='+ ODS_OBJ.FIELDBYNAME('ID_ORG').AsString );
  OQ_operation.SQL.Add('AND DATE_OPER>=TO_DATE('''+ datetostr(StartOfTheMonth(dateed.Date))+''',''DD-MM-YY'')');
  OQ_operation.SQL.Add('AND DATE_OPER<=TO_DATE('''+ datetostr( EndOfTheMonth(dateed.date))+''',''DD-MM-YY'')');
  OQ_operation.Execute;
if OQ_operation.RowCount>0 THEN
  BEGIN
 // ShowMEssage ('ОСТАТОК ПО ЭТОМУ ОБЪЕКТУ И ПРОДУКТУ ЗА ЭТОТ МЕСЯЦ УЖЕ ВВЕДЕН!');
 // j:=false;
  END;
 OQ_operation.SQL.Clear;
end;




IF chBox_correct.Checked = true then
begin

IF (calcEd_vol.Text='') or (strtofloat(calcEd_vol.Text)=0) then
begin
Application.MessageBox('Не указана плонтность!', 'Внимание!!!');
j:= false;
end;

IF ((calcEd_de.Text='') or (strtofloat(calcEd_de.Text)<0.0001) or (strtofloat(calcEd_de.Text)>1))// and (ODS_prod.FieldByName('AZC_PR_GRP_ID').AsINteger<>4 )
then
begin
Application.MessageBox('Неверно указана плотность', 'Внимание!!!');
j:=false;
end;
end
else

begin
calced_de.ZeroEmpty:=false;
calced_ves.ZeroEmpty:=false;
if strtofloat(calced_de.Text)>1  then
calced_de.Text:='0';
end;
end;


procedure Tf_forAZC_oper_all.calced_price1Exit(Sender: TObject);
  begin
  IF rb_vol.Checked = true then
  begin
  IF (calced_vol.Text<>'') and (calced_vol.Text<>'0')  and  (calced_price1.Text<>'')  then
  calced_price.Text:= floattostr (strtofloat(calced_price1.text)*strtofloat(calced_vol.text))
  end
  else
  begin
  IF (calced_vol.Text<>'') and (calced_ves.Text<>'0')  and  (calced_price1.Text<>'')  then
  calced_price.Text:= floattostr (strtofloat(calced_price1.text)*strtofloat(calced_ves.text))
  end;


end;

procedure Tf_forAZC_oper_all.Lookup_objKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
IF key = vk_SPACE then lookup_obj.DoClick;
end;

procedure Tf_forAZC_oper_all.lookup_prodKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
IF key = vk_SPACE then lookup_prod.DoClick;
end;

procedure Tf_forAZC_oper_all.DateEdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF key = VK_Space  then
showmessage('Осторожнее');

end;

procedure Tf_forAZC_oper_all.LUPED_PLACEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//IF key = vk_RETURN then Luped_sobstv.SetFocus ;
end;

procedure Tf_forAZC_oper_all.LUPED_SOBSTVKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
IF key = vk_SPACE then luped_sobstv.DoClick;
end;

procedure Tf_forAZC_oper_all.lookup_type_opCloseUp(Sender: TObject);
begin
    IF  ODS_type_operation.FieldByName('PRICE_FLAG').AsBoolean=true   then
    begin
    calced_price1.Enabled:=true;
    calced_price.Enabled:=true
    end
    else
        begin
    calced_price1.Enabled:=false;
    calced_price.Enabled:=false;
    calced_price1.Text:='';
    calced_price.Text:=''
    end;



end;





// общая процедура проставки данных для edit и insert
procedure Tf_forAZC_oper_all.pred_oper(var fill_rec:boolean);
begin
IF not ODS_univ.Eof then begin
        ODS_predp.locate('ID', ODS_univ.Fieldbyname ('SOBSTV_ID').asstring,[]);
        ODS_obj.Locate('ID_ORG', ODS_univ.FieldByName('ORG_STRU_ID').asstring,[]);
        lookup_obj.Text:= ODS_obj.FieldByName('NAME_ORG').asstring;
        ODS_sub.Locate('ID_ORG', ODS_Univ.fieldbyname ('ORG_STRU_2_ID').AsString,[] );
        lookup_sub.LookupValue:=ODS_sub.fieldbyname('NAME_ORG').AsString;
        ODS_prod.Locate('ID_NPR', ODS_univ.fieldbyname ('PROD_ID_NPR').AsString,[]);
        lookup_prod.LookupValue:= ODS_univ.FieldByName('name_npr').asstring;
        luped_sobstv.LookupValue:= ODS_univ.FieldByName('SHORT_NAME').asstring;
        ODS_prod_group.Locate('ID', ODS_prod.fieldbyname ('AZC_PR_GRP_ID').AsString,[]);
        lookup_prod_group.LookupValue:=ODS_prod_group.fieldbyname('NAME').AsString;

        ed_note.Text:=ODS_univ.FieldByName('NOTE').asstring;

  if azc.runmodest='EDIT' then begin
        Calced_vol.Text:= ODS_univ.fieldbyname('VOLUME').AsString;
        calced_ves.Text:= ODS_univ.fieldbyname ('VES').AsString;
   end;

fill_rec:= true;
end;

if operation='ЛИКАРД' then begin
                lookup_type_op.Enabled:= false;
                lookup_type_op.text:='ЛИКАРД';
end;

if operation='ГРУЗ В ПУТИ' then begin
                lookup_type_op.Enabled:= false;
                lookup_type_op.Text:='ГРУЗ В ПУТИ';
end;

if (operation='ЛИКАРД') or (operation='РАСХОД') then begin
        lookup_cat.Enabled:=true;
        lookup_cat.visible:=true;
        text_cat.Visible:=true;
        IF  (ODS_univ.Eof) or  (ODS_category.Locate('ID', ODS_UNIV.fieldbyname ('DISCOUNT').asstring,[])=false )
        then ODS_category.Locate('ID', 801,[]);
        lookup_cat.LookupValue:= ODS_category.fieldbyname('FOR_AZC').AsString;
end;


end;

procedure Tf_forAZC_oper_all.FormShow(Sender: TObject);
begin
IF azc.runmodest = 'INSERT' THEN Calced_vol.SetFocus
else lookup_obj.SetFocus;
end;



procedure Tf_forAZC_oper_all.ostatoks();
var
a:string;
begin
IF fill_rec=true then
//with ODS_prod  do try
//Close;
//SetVariable(':var1', ODS_obj.fieldbyname('ID_ORG').asstring);
//SetVariable(':var3', ODS_predp.fieldbyname('ID').asstring);
//SetVariable(':var4','TO_DATE('''+dateed.Text +''',''dd-mm-yy'')');
//a:= sql[0];
//Open;
//FindFirst;
//Edit1.Text:= ODS_prod.fieldbyname ('OSTATOK').asstring
//except
//end;
end;


// проставка цены
procedure TF_forAZC_oper_all.for_price();
begin
with ODS_price do begin
close;
 SetVariable(':VAR_PROD', ODS_prod.fieldbyname('ID_NPR').AsString);
 SetVariable(':VAR_PREDPR', ODS_predp.fieldbyname('ID').AsString);
 SetVariable(':VAR_CAT', ODS_category.fieldbyname('ID').AsString);

 Open;
        if locate('ID_NPR',ODS_prod.fieldbyname('ID_NPR').AsString, [])
        then begin
        UpdateCursorPos;
        calced_price1.Text:=ODS_price.fieldbyname('CENA_OTP_NPO').asstring;
end;
end;


end;

//*******************CORRECT***********************************

{TODO -obeatlov -cАЗС : Операция - выполнение скрипта operation }
procedure TF_forAZC_oper_all.Operation_commit(i:integer);
var
price, summa:string;
back: TBookmark;
begin


OQ_operation.SQL.Clear;
with Tf_forAZCRealiz (ParentObj) Do
//***************РАСХОД НАЛИЧНЫЕ******************

if (operation ='РАСХОД') and (RUNMODEST<>'EDIT')  then
  WITH OQ_OPERATION DO BEGIN
      SQL.Add('INSERT INTO AZC_OPERATION');
         SQL.Add('(DATE_OPER, DENCITY, VOLUME, VES,TYPE_OPER_ID, ');
        SQL.Add('PLACE_SEND_ID, PROD_ID_NPR, SOBSTV_ID, ORG_STRU_ID,SUMMA, PRICE, DISCOUNT )');
      SQL.Add(' VALUES (TO_DATE('''+(dateed.text)+''',''DD-MM-YY''), '+trim(CalcEd_de.DisplayText)+', ');
    SQL.Add(' '+trim(CalcEd_vol.DisplayText)+', '+trim(CalcEd_ves.DisplayText)+', '+ ODS_type_operation.fieldbyname('ID').AsString+', '+ ODS_PLACE.FIELDBYNAME('ID').ASSTRING+',');
  SQL.Add(''''+ ODS_PROD.FIELDBYNAME('ID_NPR').ASSTRING+''' ,'+ODS_PREDP.FIELDBYNAME('ID').ASSTRING+' ,'+ODS_OBJ.FIELDBYNAME('ID_ORG').ASSTRING+' ,');
SQL.Add(trim(calced_price.DisplayText)+', '+trim(calced_price1.DisplayText)+', '+ ODS_category.fieldbyname('ID').AsString+')');
end
 else
if (operation = 'ПРИХОД') and (RUNMODEST<>'EDIT') then
   WITH OQ_OPERATION DO BEGIN
      SQL.Add('INSERT INTO AZC_OPERATION');
         SQL.Add('(DATE_OPER, DENCITY, VOLUME, VES, NOTE,TYPE_OPER_ID, ');
        SQL.Add('PLACE_SEND_ID, PROD_ID_NPR, SOBSTV_ID, ORG_STRU_ID)');
      SQL.Add(' VALUES (TO_DATE('''+(dateed.text)+''',''DD-MM-YY''), '+ CalcEd_de.displayText+', ');
    SQL.Add(CalcEd_vol.displayText+', '+CalcEd_ves.displayText+', '''+ED_NOTE.text+''', '+ ODS_type_operation.fieldbyname('ID').AsString+', '+ ODS_PLACE.FIELDBYNAME('ID').ASSTRING);
  SQL.Add(' ,'+ ODS_PROD.FIELDBYNAME('ID_NPR').ASSTRING+' ,'''+ODS_PREDP.FIELDBYNAME('ID').ASSTRING+''' ,'+ODS_OBJ.FIELDBYNAME('ID_ORG').ASSTRING+')');
end
  else
if (operation = 'ОСТАТОК') and (RUNMODEST<>'EDIT') then
   WITH OQ_OPERATION DO BEGIN
   SQL.Add('INSERT INTO AZC_OPERATION');
         SQL.Add('(DATE_OPER, DENCITY, VOLUME, VES, NOTE,TYPE_OPER_ID, ');
        SQL.Add('PLACE_SEND_ID, PROD_ID_NPR, SOBSTV_ID, ORG_STRU_ID)');
      SQL.Add(' VALUES (TO_DATE('''+(dateed.text)+''',''DD-MM-YY''), '+ CalcEd_de.displayText+',');
    SQL.Add(CalcEd_vol.displayText+','+ CalcEd_ves.displayText+','''+ED_NOTE.text+''','+ODS_type_operation.fieldbyname('ID').AsString+', '+ ODS_PLACE.FIELDBYNAME('ID').ASSTRING);
  SQL.Add(' ,'+ ODS_PROD.FIELDBYNAME('ID_NPR').ASSTRING+' ,'''+ODS_PREDP.FIELDBYNAME('ID').ASSTRING+''' ,'+ODS_OBJ.FIELDBYNAME('ID_ORG').ASSTRING+')');
end
  else
// TODO -cАЗС: ОПЕРАЦИЯ INSERT ЛИКАРД
if (operation = 'ЛИКАРД') and (RUNMODEST<>'EDIT') then
  WITH OQ_OPERATION DO BEGIN
   SQL.Add('INSERT INTO AZC_REALIZ_LIKARD');
      SQL.Add('(DATE_OPER, DENCITY, VOLUME, VES, NOTE, ');
        SQL.Add('PROD_ID_NPR, SOBSTV_ID, ORG_STRU_ID, SUMMA, PRICE, DISCOUNT)');
      SQL.Add(' VALUES (TO_DATE('''+(dateed.text)+''',''DD-MM-YY''), REPLACE('+ CalcEd_de.text+','''',1), ');
    SQL.Add(CalcEd_vol.displayText+','+  CalcEd_ves.displayText+','''+ED_NOTE.text+''', ');
  SQL.Add(ODS_PROD.FIELDBYNAME('ID_NPR').ASSTRING+' ,'''+ODS_PREDP.FIELDBYNAME('ID').ASSTRING+''' ,'+ODS_OBJ.FIELDBYNAME('ID_ORG').ASSTRING+' ,'+ CalcEd_price.text+', '+calced_price1.Text +', '+ODS_category.fieldbyname('ID').AsString+')');
end
  else
  //**** INSERT  ГРУЗ В ПУТИ
if (operation = 'ГРУЗ В ПУТИ') and (RUNMODEST<>'EDIT') then
  WITH OQ_OPERATION DO BEGIN
   SQL.Add('INSERT INTO AZC_GOOD_IN_WAY');
      SQL.Add('(DATE_OPER, DENCITY, VOLUME, VES, NOTE, ORG_STRU_ID,');
        SQL.Add('PROD_ID_NPR, PREDPR_ID, PLACE_SEND_ID)');
      SQL.Add(' VALUES (TO_DATE('''+(dateed.text)+''',''DD-MM-YY''), '+ CalcEd_de.displayText+',');
    SQL.Add(CalcEd_vol.displayText+','+CalcEd_ves.displayText+','''+ED_NOTE.text+''', '+ODS_OBJ.fieldbyname ('ID_ORG').AsString+', ');
  SQL.Add(ODS_PROD.FIELDBYNAME('ID_NPR').ASSTRING+' ,'''+ODS_PREDP.FIELDBYNAME('ID').ASSTRING+''' ,'+ODS_place.fieldbyname('ID').asstring+')');
end
  else


         //**************************РЕДАКТИРОВНИЕ ************************\\

// ************** обновление ГРУЗ В ПУТИ
if (RUNMODEST='EDIT') AND (operation = 'ГРУЗ В ПУТИ') then
  WITH OQ_OPERATION DO BEGIN
SQL.Add('UPDATE AZC_GOOD_IN_WAY SET ');
  SQL.Add('DATE_OPER=TO_DATE('''+dateed.text+''',''DD-MM-YY''), DENCITY ='+ CalcEd_de.displayText+',');
      SQL.Add('VOLUME='+CalcEd_vol.displayText+', VES='+CalcEd_ves.displayText+',  NOTE='''+ED_note.Text+''' ,');
        SQL.Add('PLACE_SEND_ID ='+ODS_PLACE.FIELDBYNAME('ID').ASSTRING+', ');
      SQL.Add('PROD_ID_NPR='''+ODS_PROD.FIELDBYNAME('ID_NPR').ASSTRING+ ''', PREDPR_ID='+ODS_PREDP.FIELDBYNAME('ID').ASSTRING+', ');
    SQL.Add('ORG_STRU_ID='+ODS_OBJ.FIELDBYNAME('ID_ORG').ASSTRING+',');
  SQL.Add('DATE_INTO=SYSDATE');
SQL.Add('WHERE ID='+ODS_good.fieldbyname('ID').asstring);
end
  else
// ************** обновление реализации
// TODO -cАЗС: ОПЕРАЦИЯ ОБНОВЛЕНИЕ РЕАЛИЗАЦИИ
//
if (RUNMODEST='EDIT') AND (operation = 'РАСХОД') then
  WITH OQ_OPERATION DO BEGIN
SQL.Add('UPDATE AZC_OPERATION SET ');
  SQL.Add('DATE_OPER=TO_DATE('''+dateed.text+''',''DD-MM-YY''), DENCITY ='+ CalcEd_de.displayText+',');
      SQL.Add('VOLUME='+CalcEd_vol.displayText+', VES='+CalcEd_ves.displayText+',  NOTE='''+ED_note.Text+''' ,');
        SQL.Add('PLACE_SEND_ID ='+ODS_PLACE.FIELDBYNAME('ID').ASSTRING+' ,');
      SQL.Add('TYPE_OPER_ID='+ ODS_type_operation.fieldbyname('ID').AsString+', PROD_ID_NPR='''+ODS_PROD.FIELDBYNAME('ID_NPR').ASSTRING+ ''',SOBSTV_ID='+ODS_PREDP.FIELDBYNAME('ID').ASSTRING+' ,');
    SQL.Add('ORG_STRU_ID='+ODS_OBJ.FIELDBYNAME('ID_ORG').ASSTRING+' ,SUMMA='+CalcEd_price.Displaytext+' ,PRICE='+calced_price1.DisplayText+',DISCOUNT ='+ODS_category.fieldbyname('ID').AsString+',');
    SQL.Add('DATE_INTO=SYSDATE');
  SQL.Add(' WHERE ID='+ODS_azc_realiz.fieldbyname('ID').AsString);
end
  else
// ***************обновление ЛИКАРД
// TODO -cАЗС: ОПЕРАЦИЯ ОБНОВЛЕНЕИЕ ЛИКАРД
if (RUNMODEST='EDIT') AND (operation = 'ЛИКАРД')  then
  WITH OQ_OPERATION DO BEGIN
SQL.Add('UPDATE AZC_REALIZ_LIKARD SET  ');
  SQL.Add('DATE_OPER=TO_DATE('''+dateed.text+''',''DD-MM-YY''), DENCITY ='+ CalcEd_de.displayText+',');
      SQL.Add('VOLUME='+CalcEd_vol.displayText+', VES='+CalcEd_ves.displayText+',  NOTE='''+ED_note.Text+''' ,');
        SQL.Add('PROD_ID_NPR='''+ODS_PROD.FIELDBYNAME('ID_NPR').ASSTRING+ ''', SOBSTV_ID='+ODS_PREDP.FIELDBYNAME('ID').ASSTRING+' ,');
    SQL.Add('ORG_STRU_ID='+ODS_OBJ.FIELDBYNAME('ID_ORG').ASSTRING+' , SUMMA='+CalcEd_price.text+' ,PRICE='+calced_price1.Text+', DISCOUNT='+ ODS_category.fieldbyname('ID').AsString+',');
  SQL.Add('DATE_INTO=SYSDATE');
  SQL.Add('WHERE ID='+ODS_likard.fieldbyname('ID').asstring);
end;
with Tf_forAZCRealiz (ParentObj) do
if (RUNMODEST='EDIT') AND (operation ='ПРИХОД') then
  WITH OQ_OPERATION DO BEGIN
SQL.Add('UPDATE AZC_OPERATION SET ');
  SQL.Add('DATE_OPER=TO_DATE('''+dateed.text+''',''DD-MM-YY''), DENCITY = '+ CalcEd_de.displayText+', ');
      SQL.Add('VOLUME='+CalcEd_vol.displayText+', VES='+CalcEd_ves.displayText+',  NOTE='''+ED_note.Text+''' ,');
        SQL.Add('TYPE_OPER_ID ='+ODS_type_operation.fieldbyname('ID').AsString+', PLACE_SEND_ID ='+ODS_PLACE.FIELDBYNAME('ID').ASSTRING+' ,');
      SQL.Add('PROD_ID_NPR='''+ODS_PROD.FIELDBYNAME('ID_NPR').ASSTRING+ ''',SOBSTV_ID='+ODS_PREDP.FIELDBYNAME('ID').ASSTRING+' ,');
    SQL.Add('ORG_STRU_ID='+ODS_OBJ.FIELDBYNAME('ID_ORG').ASSTRING+',');
  SQL.Add('DATE_INTO=SYSDATE');
  SQL.Add(' WHERE ID='+ODS_azc_realiz.fieldbyname('ID').asstring);
end
 else
if (RUNMODEST='EDIT') AND (operation ='ОСТАТОК') then
  WITH OQ_OPERATION DO BEGIN
SQL.Add('UPDATE AZC_OPERATION SET ');
  SQL.Add('DATE_OPER=TO_DATE('''+dateed.text+''',''DD-MM-YY''), DENCITY ='+ CalcEd_de.displayText+',');
      SQL.Add('VOLUME='+CalcEd_vol.displayText+', VES='+CalcEd_ves.displayText+',  NOTE='''+ED_note.Text+''' ,');
        SQL.Add('TYPE_OPER_ID ='+ODS_type_operation.fieldbyname('ID').AsString+', PLACE_SEND_ID ='+ODS_PLACE.FIELDBYNAME('ID').ASSTRING+' ,');
      SQL.Add('PROD_ID_NPR='''+ODS_PROD.FIELDBYNAME('ID_NPR').ASSTRING+ ''',SOBSTV_ID='+ODS_PREDP.FIELDBYNAME('ID').ASSTRING+' ,');
    SQL.Add('ORG_STRU_ID='+ODS_OBJ.FIELDBYNAME('ID_ORG').ASSTRING+',');
    SQL.Add('DATE_INTO=SYSDATE');
  SQL.Add(' WHERE ID='+ODS_azc_realiz.fieldbyname('ID').asstring);

end;
OQ_OPERATION.EXECUTE;
OQ_OPERATION.Session.Commit;
dataset_u_.Refresh;
grid_u_.Refresh;
back:=ODS_univ.GetBookmark;
with Tf_forAZCRealiz(parentobj) do begin
ODS_univ.close;
ODS_univ.open;
ODS_univ.Refresh;
ODS_univ.GotoBookmark(back);
ODS_univ.FreeBookmark(back);
end;
azc.RUNMODEST:='';
self.Close;
end;


procedure Tf_forAZC_oper_all.lookup_type_opKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
IF key = vk_space  then  lookup_type_op.DoClick;
end;

procedure Tf_forAZC_oper_all.DateEdExit(Sender: TObject);
begin
 ostatoks();
end;

PROCEDURE TF_FORAZC_OPER_ALL.GUARD_(S:STRING);
BEGIN
       if (S='ОСТАТОК') or (s='ПРИХОД') AND (DATASET_U_.Eof) then BEGIN
        OQ_OPERATION.SQL.Clear;
        OQ_OPERATION.SQL.Add('SELECT COUNT(a.id) AS M FROM AZC_OPERATION A WHERE a.TYPE_OPER_ID=3');
        OQ_OPERATION.Execute;
        //IF oq_OPERATION.FieldAsInteger('M')=0 THEN BEGIN
        //OQ_OPERATION.SQL.Clear;
        //OQ_OPERATION.SQL.Add('INSERT INTO AZC_OPERATION VALUES (1,TO_DATE (''01.01.1000'', ''DD-MM-YY''), 0,0,0,''TEST'',3,1,''13011'', 2,1,0,0)');
        //OQ_OPERATION.Execute;
        //OQ_OPERATION.Session.Commit;
        //OQ_OPERATION.SQL.Clear;
       //end;
       END;
END;

procedure Tf_forAZC_oper_all.Calced_skidkaChange(Sender: TObject);
var a:string;
begin
end;

procedure Tf_forAZC_oper_all.Lookup_subCloseUp(Sender: TObject);
begin
 ODS_obj.Close;
 ODS_Obj.SetVariable(':var_org',  ODS_sub.FieldByName('ID_org').AsString);
 ODS_obj.Open;
 lookup_obj.LookupValue := ODS_obj.fieldbyname('NAME_ORG').asstring;

end;

procedure Tf_forAZC_oper_all.lookup_catCloseUp(Sender: TObject);
begin
ODS_PRICE.Close;
ODS_PRICE.SetVariable(':VAR_CAT', ODS_category.fieldbyname('ID').asstring);
ODS_PRICE.Open;
Calced_price1.Text:= ODS_price.FieldByName('CENA_OTP_NPO').AsString;

end;

procedure Tf_forAZC_oper_all.lookup_prod_groupCloseUp(Sender: TObject);
begin
ODS_prod.Close;
IF  (operation='РАСХОД') AND (azc.RunModest <>'EDIT')  then
ODS_prod.SQL.Strings[4]:=' AZC_PR_GRP_ID ='+ODS_prod_group.fieldbyname ('ID').AsString+' AND OSTATOK<>0'
else
ODS_prod.SQL.Strings[4]:=' AND AZC_PR_GRP_ID ='+ODS_prod_group.fieldbyname ('ID').AsString;
ODS_prod.Open;
lookup_prod_group.Text:=ODS_prod_group.fieldbyname('NAME').AsString ;

lookup_prod.OnCloseUp(self);
IF ODS_prod.RecordCount>0 then begin
lookup_prod.Text:=ODS_prod.fieldbyname('NAME_NPR').AsString;
end
else
lookup_prod.Text:='';

end;

procedure Tf_forAZC_oper_all.chb_correctClick(Sender: TObject);
begin
IF flag_ves_vol = false then
IF chb_correct.Checked = true then
begin
calced_price.ReadOnly:=false;
ShowMessage('Режим "Проверка" включен');
end
else
begin
calced_price.ReadOnly:=true;
ShowMessage('Режим "Проверка" отключен')  ;
end
end;

procedure Tf_forAZC_oper_all.rb_volClick(Sender: TObject);
var
key_id:string;
begin
IF flag_ves_vol=false then begin
//rb_ves.Checked:=true;
key_id:= ODS_prod.FieldByName('ID_NPR').AsString;
ODS_prod.Close;
begin
IF operation = 'РАСХОД' then
begin
/// SQL.Add(' SELECT  A.*,NVL (FOR_AZC.GET_AZC_OST_VOL(:var1,A.ID_NPR, :var3,  :var4),0) as OSTATOK FROM KLS_PROD A, azc_prod_group');
IF edit_flag = false  then
begin
IF rb_vol.Checked=true then
ODS_prod.SQL.Strings[1]:= 'SELECT A.*,NVL (FOR_AZC.GET_AZC_OST_VOL (:var1,'
else
ODS_prod.SQL.Strings[1]:= 'SELECT A.*,NVL (FOR_AZC.GET_AZC_OST_VES (:var1,'
end
else
begin
IF rb_vol.Checked=true then
ODS_prod.SQL.Strings[0]:= 'SELECT  A.*,NVL (FOR_AZC.GET_AZC_OST_VOL(:var1,A.ID_NPR, :var3,  :var4),0) as OSTATOK FROM KLS_PROD A, azc_prod_group'
else
ODS_prod.SQL.Strings[0]:= 'SELECT  A.*,NVL (FOR_AZC.GET_AZC_OST_VES(:var1,A.ID_NPR, :var3,  :var4),0) as OSTATOK FROM KLS_PROD A, azc_prod_group'
end;
end
else
begin
///
IF edit_flag = true  then
begin
IF rb_vol.Checked=true then
ODS_prod.SQL.Strings[1]:= 'SELECT A.*,NVL (FOR_AZC.GET_AZC_OST_VOL (:var1,'
else
ODS_prod.SQL.Strings[1]:= 'SELECT A.*,NVL (FOR_AZC.GET_AZC_OST_VES (:var1,'
end
else
begin
IF rb_vol.Checked=true then
ODS_prod.SQL.Strings[0]:= 'SELECT  A.*,NVL (FOR_AZC.GET_AZC_OST_VOL(:var1,A.ID_NPR, :var3,  :var4),0) as OSTATOK FROM KLS_PROD A, azc_prod_group'
else
ODS_prod.SQL.Strings[0]:= 'SELECT  A.*,NVL (FOR_AZC.GET_AZC_OST_VES(:var1,A.ID_NPR, :var3,  :var4),0) as OSTATOK FROM KLS_PROD A, azc_prod_group'
end;
end;
end;
ODS_prod.open;
edit1.Text:=ODS_prod.fieldbyname('OSTATOK').AsString;
end
else
chb_correct.Checked:=true;
flag_ves_vol:=false;
CalCed_Price.readonly:=false;


end;

end.
