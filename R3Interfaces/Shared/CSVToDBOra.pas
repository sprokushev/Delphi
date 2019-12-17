unit CSVToDBOra;
interface
uses Classes,CSVToDB,Oracle,OracleData;
type

TORASQLEXPRESSION=class(TSQLEXPRESSION)
protected
OraQuery:TOracleQuery;
public
constructor create(OraQuery:TOracleQuery;const Information:IInformation=nil);
procedure Execute;override;
end;


implementation
uses SysUtils,variants;

{ TORASQLEXPRESSION }

constructor TORASQLEXPRESSION.create(OraQuery:TOracleQuery;const Information:IInformation=nil);
begin
inherited create(Information);
self.OraQuery:=OraQuery;
end;

procedure TORASQLEXPRESSION.Execute;
var i,j,k:integer;
    ParamList:TList;
    OraTableInfo:TOracleTableInfo;
    Collection:TCollection;
    OraMetaQuery:TOracleQuery;
    ColumnType:integer;
    ParamValue:Variant;
begin
try
for i:=0 to Count-1 do
  begin
  OraQuery.DeleteVariables;
  OraQuery.SQL.Clear;
  OraQuery.SQL.Add(Item[i].SQLExpression);
  ParamList:=Item[i].Parameters;
  OraMetaQuery:=TOracleQuery.Create(nil);
  OraMetaQuery.Session:=OraQuery.Session;
       Collection:=TCollection.Create(TOracleTableInfo);
          try
              OraTableInfo:=TOracleTableInfo.Create(Collection);
              OraTableInfo.Query:=OraMetaQuery;
              OraTableInfo.TableExpression:=Item[i].TableName;
              OraTableInfo.GetColumns;
              for j:=0 to ParamList.Count-1 do
                    begin
                        for k:=0 to OraTableInfo.OracleColumnInfoList.Count-1 do
                            begin
                            if CompareText(TOracleColumnInfo(OraTableInfo.OracleColumnInfoList.Items[k]).ColumnName,PSQLExpressionParamItem(ParamList.Items[j]).MappedFieldName)=0 then
                               begin
                               ColumnType:=TOracleColumnInfo(OraTableInfo.OracleColumnInfoList.Items[k]).ColumnType;
                               if PSQLExpressionParamItem(ParamList.Items[j]).Value='' then ParamValue:=Null
                                        else ParamValue:=PSQLExpressionParamItem(ParamList.Items[j]).Value;
                                  try
                                  OraQuery.DeclareAndSet(PSQLExpressionParamItem(ParamList.Items[j]).ParamName,ColumnType,ParamValue);
                                  except
                                  //Пока ничего не делаем.
                                  raise;
                                  end;
                                end;
                            end;
                  end;
            try
            OraQuery.Execute;
             try
             if assigned(Information) then Information.Information('Обработана позиция '+inttostr(i),false);
             except
             end;
            except
            if assigned(Information) then Information.Information('Позиция  '+inttostr(i) + ' не обработана '+sLineBreak+Exception(ExceptObject).Message,true);
            end;
           finally
           Collection.free;
           end;
  end;
except
//Пока ничего не делаем.
raise;
end;
end;

end.
