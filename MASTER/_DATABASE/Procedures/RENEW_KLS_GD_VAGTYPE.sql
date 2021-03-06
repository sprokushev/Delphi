--
-- RENEW_KLS_GD_VAGTYPE  (Procedure) 
--
CREATE OR REPLACE PROCEDURE MASTER.Renew_Kls_Gd_Vagtype (DATE_BEG DATE:=TRUNC(SYSDATE,'MONTH') ,DATE_END DATE:=SYSDATE, param1 VARCHAR2:='', param2 VARCHAR2:='', param3 VARCHAR2:='') IS
BEGIN

  --- ���������� �/� ����� ������� (��� ��-12)
  UPDATE KLS_GD_VAGTYPE
    SET (ABBR, NAME, COLOR_GDPL, COLOR_NAME, PLAN_NAME)
	  = (SELECT DECODE(kod,-1,'',TO_CHAR(kod,'00')), naim, COLOR_GDPL, COLOR_NAME, PLAN_NAME
  	     FROM load_buffer.rodvgu12 WHERE kod=KLS_GD_VAGTYPE.ID)
     WHERE EXISTS (SELECT NULL FROM load_buffer.gruzgu12 WHERE kod=KLS_GD_VAGTYPE.ID);

  INSERT INTO KLS_GD_VAGTYPE (ID,ABBR, NAME, COLOR_GDPL, COLOR_NAME, PLAN_NAME)
	(SELECT kod,DECODE(kod,-1,'',TO_CHAR(kod,'00')), naim, COLOR_GDPL, COLOR_NAME, PLAN_NAME
	   FROM load_buffer.rodvgu12 A
      WHERE NOT EXISTS (SELECT NULL FROM KLS_GD_VAGTYPE C WHERE C.ID=A.kod));

  COMMIT;
END Renew_Kls_Gd_Vagtype;

/

