unit Funcs;

interface
  Function SUM_PR(sm:extended;len_s:integer;VAR Res1,Res2,Res3:string):string;
  Function VES_PR(sm:extended;len_s:integer;VAR Res1,Res2,Res3:string):string;
  function PADL(s:string;len:integer):string;

implementation
uses sysutils;
{* ========================================================================}
{* ����� ��������                                                          }
{* ========================================================================}
FUNCTION PROPIS_S(cc: string;atr:integer):string;
VAR s,d,o,Err:integer;
    res,sto,des,ons,ending:string;
Begin
  VAL(Copy(cc,1,1),S,Err);
  VAL(Copy(cc,2,1),D,Err);
  VAL(Copy(cc,3,1),O,Err);
  case atr of
    1: ending:='������';
    2: ending:='�����';
    3: ending:='���������';
    4: ending:='����������';
  end;
  CASE s OF
    0: sto := '';
    1: sto := '���';
    2: sto := '������';
    3: sto := '������';
    4: sto := '���������';
    5: sto := '�������';
    6: sto := '��������';
    7: sto := '�������';
    8: sto := '���������';
    9: sto := '���������';
  END;
  CASE d Of
    0: des := '';
    1: IF o = 0 Then des := '������'
       ELSE des := '�������';
    2: des := '��������';
    3: des := '��������';
    4: des := '�����';
    5: des := '���������';
    6: des := '����������';
    7: des := '���������';
    8: des := '�����������';
    9: des := '���������';
  END;
  CASE o OF
    0: ons := '';
    1: Begin
         IF (atr = 2) AND (d <> 1) Then ons := '����'
         ELSE ons := '����';
         if d<>1 then
         case atr of
           1: ending:='�����';
           2: ending:='������';
           3: ending:='�������';
           4: ending:='��������';
         end;
       end;
    2: begin
         IF (atr = 2) OR (d = 1) Then ons := '���'
         ELSE ons := '���';
         If d<>1 Then
         case atr of
           1: ending:='�����';
           2: ending:='������';
           3: ending:='��������';
           4: ending:='���������';
         end;
       end;
    3: begin
         ons := '���';
         If d<>1 Then
         case atr of
           1: ending:='�����';
           2: ending:='������';
           3: ending:='��������';
           4: ending:='���������';
         end;
       end;
    4: Begin
         ons := '�����';
         IF (d <> 1) Then
           Begin
             ons := ons + '�';
             case atr of
               1: ending:='�����';
               2: ending:='������';
               3: ending:='��������';
               4: ending:='���������';
             end;
           End;
       End;
    5: Begin
         ons := '���';
         IF (d <> 1) Then ons := ons+'�';
       END;
    6: Begin
         ons := '����';
         IF (d <> 1) Then ons := ons+'�';
       END;
    7: Begin
         ons := '���';
         IF (d <> 1) Then ons := ons+'�';
       END;
    8: Begin
         ons := '�����';
         IF (d <> 1) Then ons := ons+'�';
       END;
    9: Begin
         ons := '�����';
         IF (d <> 1) Then ons := ons+'�';
       END;
  END;
  IF d = 1 Then
    res := Trim(sto + ' ' + ons + des)
  ELSE
    res := Trim(sto + ' ' + des + ' ' + ons);
  IF res='' Then
    IF atr=1 then Propis_s:=ending
    Else Propis_s:=''
  ELSE Propis_s:=res+' '+ending;
End;

FUNCTION PROPIS_V(cc: string;atr:integer):string;
VAR s,d,o,Err:integer;
    res,sto,des,ons,ending:string;
Begin
  VAL(Copy(cc,1,1),S,Err);
  VAL(Copy(cc,2,1),D,Err);
  VAL(Copy(cc,3,1),O,Err);
  case atr of
    1: ending:='( '+IntToStr(StrToInt(cc))+' ) ����';
    2: ending:='�����';
    3: ending:='���������';
    4: ending:='����������';
  end;
  CASE s OF
    0: sto := '';
    1: sto := '���';
    2: sto := '������';
    3: sto := '������';
    4: sto := '���������';
    5: sto := '�������';
    6: sto := '��������';
    7: sto := '�������';
    8: sto := '���������';
    9: sto := '���������';
  END;
  CASE d Of
    0: des := '';
    1: IF o = 0 Then des := '������'
       ELSE des := '�������';
    2: des := '��������';
    3: des := '��������';
    4: des := '�����';
    5: des := '���������';
    6: des := '����������';
    7: des := '���������';
    8: des := '�����������';
    9: des := '���������';
  END;
  CASE o OF
    0: ons := '';
    1: Begin
         IF ((atr = 1)OR(atr = 2)) AND (d <> 1) Then ons := '����'
         ELSE ons := '����';
         if d<>1 then
         case atr of
           1: ending:='( '+IntToStr(StrToInt(cc))+' ) �����';
           2: ending:='������';
           3: ending:='�������';
           4: ending:='��������';
         end;
       end;
    2: begin
         IF (atr = 1) OR (atr = 2) OR (d = 1) Then ons := '���'
         ELSE ons := '���';
         If d<>1 Then
         case atr of
           1: ending:='( '+IntToStr(StrToInt(cc))+' ) �����';
           2: ending:='������';
           3: ending:='��������';
           4: ending:='���������';
         end;
       end;
    3: begin
         ons := '���';
         If d<>1 Then
         case atr of
           1: ending:='( '+IntToStr(StrToInt(cc))+' ) �����';
           2: ending:='������';
           3: ending:='��������';
           4: ending:='���������';
         end;
       end;
    4: Begin
         ons := '�����';
         IF (d <> 1) Then
           Begin
             ons := ons + '�';
             case atr of
               1: ending:='( '+IntToStr(StrToInt(cc))+' ) �����';
               2: ending:='������';
               3: ending:='��������';
               4: ending:='���������';
             end;
           End;
       End;
    5: Begin
         ons := '���';
         IF (d <> 1) Then ons := ons+'�';
       END;
    6: Begin
         ons := '����';
         IF (d <> 1) Then ons := ons+'�';
       END;
    7: Begin
         ons := '���';
         IF (d <> 1) Then ons := ons+'�';
       END;
    8: Begin
         ons := '�����';
         IF (d <> 1) Then ons := ons+'�';
       END;
    9: Begin
         ons := '�����';
         IF (d <> 1) Then ons := ons+'�';
       END;
  END;

  IF d = 1 Then
    res := TRIM(sto + ' ' + ons + des)
  ELSE
    res := TRIM(sto + ' ' + des + ' ' + ons);

  IF res='' Then
    IF atr=1 then Propis_v:=ending
    Else Propis_v:=''
  ELSE Propis_v:=res+' '+ending;
End;

function CutStr(all_st:string;VAR cut_st:string;n1,len_s:word):word;
var l,i:word;
begin
  cut_st:=Copy(all_st,n1,len_s+1);
  l:=length(cut_st);
  if (l=(len_s+1)) then
    Begin
      for i:=l downto 1 do if cut_st[i]=' ' then break else cut_st[i]:=' ';
      CutStr:=n1+i;
    End
  Else CutStr:=n1+len_s;
end;

Function SUM_PR(sm:extended;len_s:integer;VAR Res1,Res2,Res3:string):string;
VAR cc,kops,rbl,ths,mln,bln:string;
    X,Err:integer;
Begin
  Res1:='';
  Res2:='';
  Res3:='';
  IF sm=0 Then
    Begin
      SUM_PR:='0 ���. 0 ���.';
      Exit;
    End;
  sm := ABS(sm);
  STR((10000000000000.00 + sm):17:2,cc);
  kops := Copy(cc,16,2) + ' ���';
  bln := propis_s(Copy(cc,3,3),4);
  if bln<>'' then bln:=bln+' ';
  mln := propis_s(Copy(cc,6,3),3);
  if mln<>'' then mln:=mln+' ';
  ths := propis_s(Copy(cc,9,3),2);
  if ths<>'' then ths:=ths+' ';
  rbl := propis_s(Copy(cc,12,3),1);
  VAL(Copy(cc,3,12),X,Err);
  Res1 := '���� ��� ' + kops;
  SUM_PR:= Res1;
  IF X <> 0 Then
  Begin
    cc:= bln+mln+ths+rbl+' '+kops;
    SUM_PR:= cc;
    CutStr(cc,Res3,CutStr(cc,Res2,CutStr(cc,Res1,1,len_s),len_s),len_s);
  End;
End;

Function VES_PR(sm:extended;len_s:integer;VAR Res1,Res2,Res3:string):string;
VAR cc,kops,rbl,ths,mln,bln:string;
    X,Err:integer;
Begin
  Res1:='';
  Res2:='';
  Res3:='';
  IF sm=0 Then
    Begin
      VES_PR:='0 ��.';
      Exit;
    End;
  sm := ABS(sm);
  STR((1000000000000.000 + sm):17:3,cc);
  kops := Copy(cc,15,3) + ' ��.';
  bln := propis_v(Copy(cc,2,3),4);
  if bln<>'' then bln:=bln+' ';
  mln := propis_v(Copy(cc,5,3),3);
  if mln<>'' then mln:=mln+' ';
  ths := propis_v(Copy(cc,8,3),2);
  if ths<>'' then ths:=ths+' ';
  rbl := propis_v(Copy(cc,11,3),1);
  VAL(Copy(cc,2,12),X,Err);
  Res1 := kops;
  Result:= Res1;
  IF X <> 0 Then
  Begin
    cc:= bln+mln+ths+rbl+' '+kops;
    Result:= cc;
    CutStr(cc,Res3,CutStr(cc,Res2,CutStr(cc,Res1,1,len_s),len_s),len_s);
  End;
  If Length(Result)>0 then Result:=AnsiUpperCase(Result[1])+Copy(Result,2,Length(Result)-1);
End;

function PADL(s:string;len:integer):string;
var i:integer;
Begin
  s:=Trim(s);
  i:=length(s);
  for i:=len downto i+1 do s:='0'+s;
  PADL:=s;
End;

end.
