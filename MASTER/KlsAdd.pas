unit KlsAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,OracleData, Oracle, StdCtrls, RxCtrls, RxLookup, Mask, ToolEdit,
  CurrEdit, ComCtrls, Db, Buttons, ExtCtrls, DateUtils;

type
  Tf_KlsAdd = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SBKls: TScrollBox;
    q_tmp: TOracleDataSet;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    t_kls_stru:TOracleDataSet;
    t_field_stru:TOracleDataSet;
    t_kls_data:TOracleDataSet;
    ValuesFromCurrent:boolean; // Заполнить значениями из текущей записи
  end;

var
  f_KlsAdd: Tf_KlsAdd;

implementation

uses main;


{$R *.dfm}

procedure Tf_KlsAdd.FormShow(Sender: TObject);
var i:integer;
    FF:TF_KlsAdd;
    YY:integer;
    q:TOracleDataSet;
    ds:TDataSource;
    F_ReadOnly:boolean;
begin
  If t_kls_data.State<>dsInsert then Caption:='Редактирование записи в справочнике "'+t_kls_stru.FieldValues['CAPTION']+'"'
  else Caption:='Добавление записи в справочник "'+t_kls_stru.FieldValues['CAPTION']+'"';
  FF:=Self;

  t_field_stru.First;
  while NOT t_field_stru.EOF do
  Begin
    i:=t_kls_data.FindField(AnsiUpperCase(t_field_stru.FieldByName('FIELD_NAME').AsString)).Index;
    F_ReadOnly:=(t_field_stru.FieldByName('FIELD_READONLY').AsInteger=1);
    if (t_kls_data.State<>dsInsert) AND (AnsiUpperCase(t_field_stru.FieldByName('FIELD_NAME').AsString)=
                   AnsiUpperCase(t_kls_stru.FieldByName('UNIQUE_FIELD').AsString)) then F_ReadOnly:=true;

    if i<>-1 then
    begin
      YY:=(t_field_stru.FieldByName('FIELD_ID').AsInteger-1)*25+10;
      with TLabel.Create(Self) do
      begin
        Parent := FF.SBKls;
        Caption:=t_field_stru.FieldValues['FIELD_CAPTION']+':';
        Left := 1;
        Top := YY;
        AutoSize:=false;
        Alignment:=taRightJustify;
        Width:=200;
      end;

      if t_field_stru.FieldByName('FIELD_KIND').AsInteger=1 then
      Begin
        q:=TOracleDataSet.Create(Self);
        ds:=TDataSource.Create(Self);
        ds.DataSet:=q;
        with q do
        try
          Session:=f_main.ora_Session;
          SQL.Add(t_field_stru.FieldByName('LOOKUP_SOURCE_QUERY').AsString);
          Open;
          with TRxDBLookupCombo.Create(Self) do
          begin
            Parent := FF.SBKls;
            Left := 205;
            Top := YY;
            Width:=400;
            ReadOnly:=F_ReadOnly;
            LookupSource:=ds;
            LookupField:=t_field_stru.FieldByName('LOOKUP_KEY_FIELD').AsString;
            LookupDisplay:=t_field_stru.FieldByName('LOOKUP_DISPLAY_FIELD').AsString;
            DisplayEmpty:='--ПУСТО--';
            try
              if q.FieldByName(t_field_stru.FieldByName('LOOKUP_KEY_FIELD').AsString).DataType=ftString	 then
                KeyValue:=t_kls_data.Fields[i].AsString
              else
                KeyValue:=t_kls_data.Fields[i].AsInteger;
            except
              if q.FieldByName(t_field_stru.FieldByName('LOOKUP_KEY_FIELD').AsString).DataType=ftString	 then
                KeyValue:=''
              else
                KeyValue:=0;
            end;
            if NOT F_ReadOnly then Tag:=i+1;
          end;
        except
          Close;
          q.SQL.Clear;
          q.Free;
          ds.Free;
        end;
      End
      Else
        case t_kls_data.Fields[i].DataType of
          ftString:
            Begin
              with TEdit.Create(Self) do
              begin
                Parent := FF.SBKls;
                Left := 205;
                Top := YY;
                Width:=400;
                ReadOnly:=F_ReadOnly;
                Text:=t_kls_data.Fields[i].AsString;
                if NOT F_ReadOnly then Tag:=i+1;
              end;
            end;
          ftDate,ftDateTime:
            begin
              with TDateTimePicker.Create(Self) do
              begin
                Parent := FF.SBKls;
                Left := 205;
                Width:=100;
                Top := YY;
                Enabled:=NOT F_ReadOnly;
                Date:=t_kls_data.Fields[i].AsDateTime;
                if NOT F_ReadOnly then Tag:=i+1;
              end;
            end;
          ftFloat,ftInteger:
            Begin
              if t_field_stru.FieldByName('FIELD_KIND').AsInteger=2 then //Checkbox-поле
                with TCheckBox.Create(Self) do
                Begin
                  Parent:=FF.SBKls;
                  Left:=205;
                  Top:=YY;
                  Enabled:=NOT F_ReadOnly;
                  Caption:='';
                  Checked:=(t_kls_data.Fields[i].AsFloat<>0);
                  if NOT F_ReadOnly then Tag:=i+1;
                end
              else
                with TRxCalcEdit.Create(Self) do
                begin
                  Parent := FF.SBKls;
                  Left := 205;
                  Width:=100;
                  Top := YY;
                  ReadOnly:=F_ReadOnly;
                  if t_field_stru.FieldByName('MASK').AsString<>'' then
                    DisplayFormat:=t_field_stru.FieldByName('MASK').AsString;
                  Value:=t_kls_data.Fields[i].AsFloat;
                  if NOT F_ReadOnly then Tag:=i+1;
                end;
            end;
        end;
    end;
    t_field_stru.Next;
  end;
end;

procedure Tf_KlsAdd.BitBtn1Click(Sender: TObject);
var i,j:integer;
begin

  for j:=0 to SBKls.ControlCount-1 do
  Begin
    i:=SBKls.Controls[j].Tag;
    if i<>0 then
    Begin
      if (SBKls.Controls[j] is TEdit) then
        with (SBKls.Controls[j] as TEdit) do
        Begin
          t_kls_data.Fields[i-1].AsString:=Text;
        End;
      if (SBKls.Controls[j] is TDateTimePicker) then
        with (SBKls.Controls[j] as TDateTimePicker) do
        Begin
          t_kls_data.Fields[i-1].AsDateTime:=DateOf(Date);
        End;
      if (SBKls.Controls[j] is TRxCalcEdit) then
        with (SBKls.Controls[j] as TRxCalcEdit) do
        Begin
          t_kls_data.Fields[i-1].AsVariant:=Value;
        End;
      if (SBKls.Controls[j] is TCheckBox) then
        with (SBKls.Controls[j] as TCheckBox) do
        if Checked then
          t_kls_data.Fields[i-1].AsInteger:=1
        else
          t_kls_data.Fields[i-1].AsInteger:=0;
      if (SBKls.Controls[j] is TRxDBLookupCombo) then
        with (SBKls.Controls[j] as TRxDBLookupCombo) do
        Begin
          t_kls_data.Fields[i-1].AsVariant:=KeyValue;
        End;
    End;
  end;

  for j:=0 to Self.ComponentCount-1 do
  Begin
    if (Self.Components[j] is TOracleDataSet) then
    with (Self.Components[j] as TOracleDataSet) do
    Begin
      Close;
      SQL.Clear;
    end;
  end;
end;

procedure Tf_KlsAdd.BitBtn2Click(Sender: TObject);
begin
  t_kls_data.Cancel;
end;

end.
