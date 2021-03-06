--
-- RENEW_KLS_UPAK_2  (Procedure) 
--
CREATE OR REPLACE PROCEDURE MASTER.Renew_Kls_Upak_2 (DATE_BEG DATE:=TRUNC(SYSDATE,'MONTH') ,DATE_END DATE:=SYSDATE, param1 VARCHAR2:='', param2 VARCHAR2:='', param3 VARCHAR2:='') IS
BEGIN

  UPDATE KLS_UPAK
        SET (NAME, KOD_MOSC)
        = (SELECT A.NAIM_UPAK, A.PROD_UPAK 
			 FROM load_buffer.kod_upak A
			 WHERE TO_NUMBER(A.PROD_UPAK)=KLS_UPAK.ID)
    WHERE EXISTS (SELECT NULL
			 FROM load_buffer.kod_upak A
			 WHERE TO_NUMBER(A.PROD_UPAK)=KLS_UPAK.ID)
	  and id<>0;
  COMMIT;

  INSERT INTO KLS_UPAK (ID,NAME,KOD_MOSC)
	           (SELECT TO_NUMBER(C.PROD_UPAK), C.NAIM_UPAK, C.PROD_UPAK 
			   FROM load_buffer.kod_upak C
      WHERE NOT EXISTS (SELECT D.ID FROM KLS_UPAK D WHERE D.ID=TO_NUMBER(C.prod_upak))
	    and c.prod_upak<>0);
  COMMIT;

END Renew_Kls_Upak_2;
/

