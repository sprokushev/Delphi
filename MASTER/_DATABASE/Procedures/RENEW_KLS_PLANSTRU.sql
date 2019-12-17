--
-- RENEW_KLS_PLANSTRU  (Procedure) 
--
CREATE OR REPLACE PROCEDURE MASTER.Renew_Kls_Planstru (DATE_BEG DATE:=TRUNC(SYSDATE,'MONTH') ,DATE_END DATE:=SYSDATE, param1 VARCHAR2:='', param2 VARCHAR2:='', param3 VARCHAR2:='') IS
BEGIN

 ---UPDATE load_buffer.gr_real SET kod_otgr=NULL WHERE kod_otgr=0;

 INSERT INTO KLS_PLANSTRU
    (ID,BEGIN_DATE,END_DATE,
	 NAME,LEVEL_POS,INPUT_DATE,KOD_SGR,KOD_SPG,KOD_RZD,KOD_PRZ,KOD_GRP,KOD_PGR,PARENT_ID,VIEW_LEVEL)
	(SELECT DISTINCT 99999,TO_DATE('01.01.1990','dd.mm.yyyy'),TRUNC(ADD_MONTHS(SYSDATE,12),'y')-1,
	 '������',0,TO_DATE('01.01.1990','dd.mm.yyyy'),0,0,0,0,0,0,99999,-1 FROM load_buffer.gr_real
      WHERE NOT EXISTS (SELECT * FROM KLS_PLANSTRU E WHERE E.ID=99999));

  UPDATE KLS_PLANSTRU a SET
    (BEGIN_DATE,END_DATE,NAME,LEVEL_POS,INPUT_DATE,KOD_SGR,
     KOD_SPG,KOD_RZD,KOD_PRZ,KOD_GRP,KOD_PGR,PARENT_ID,NAZN_OTG_ID,VIEW_LEVEL,
	 REGION_ID, ORG_KIND_ID, TIP_REAL_ID,
	 SPF_GROUP_ORDER, SPF_GROUP_NAME, SPF_ORDER, SPF_NAME, LUKOIL_ID,POS_PREDPR_ID)=
	(SELECT b.BEGIN_DATE,b.END_DATE,b.NAIM,b.KOD_POS,SYSDATE,b.KOD_SGR,
     b.KOD_SPG,b.KOD_RZD,b.KOD_PRZ,b.KOD_GRP,b.KOD_PGR,99999,b.KOD_OTGR,b.VIEW_POS,
	 DECODE(REGION,0,NULL,REGION), DECODE(TIP_OB,0,NULL,TIP_OB), DECODE(TIP_REAL,0,NULL,TIP_REAL),
	 SPF_TITORD, SPF_TITLE, SPF_ORDER, SPF_NAME, LUKOIL_ID,KOD_PLAT
	 FROM load_buffer.gr_real b
     WHERE a.ID=b.ID)
  WHERE EXISTS (SELECT * FROM load_buffer.gr_real c WHERE a.ID=c.ID);

  INSERT INTO KLS_PLANSTRU
    (ID,NAME,LEVEL_POS,INPUT_DATE,BEGIN_DATE,END_DATE,KOD_SGR,
     KOD_SPG,KOD_RZD,KOD_PRZ,KOD_GRP,KOD_PGR,PARENT_ID,NAZN_OTG_ID,VIEW_LEVEL,
	 REGION_ID, ORG_KIND_ID, TIP_REAL_ID,
	 SPF_GROUP_ORDER, SPF_GROUP_NAME, SPF_ORDER, SPF_NAME, LUKOIL_ID,POS_PREDPR_ID)
	(SELECT c.ID,c.NAIM,c.KOD_POS,SYSDATE,c.BEGIN_DATE,c.END_DATE,c.KOD_SGR,
     c.KOD_SPG,c.KOD_RZD,c.KOD_PRZ,c.KOD_GRP,c.KOD_PGR,99999,c.KOD_OTGR,c.VIEW_POS,
	 DECODE(REGION,0,NULL,REGION), DECODE(TIP_OB,0,NULL,TIP_OB), DECODE(TIP_REAL,0,NULL,TIP_REAL),
	 SPF_TITORD, SPF_TITLE, SPF_ORDER, SPF_NAME, LUKOIL_ID,KOD_PLAT
	 FROM load_buffer.gr_real c
     WHERE NOT EXISTS (SELECT b.ID FROM KLS_PLANSTRU b WHERE b.ID=c.ID));

  UPDATE KLS_PLANSTRU a
    SET parent_id=(SELECT ID FROM KLS_PLANSTRU b WHERE
	  b.level_pos=a.level_pos-1 AND
	  b.KOD_SGR=NVL(DECODE(a.level_pos,2,a.kod_sgr,3,a.kod_sgr,4,a.kod_sgr,5,a.kod_sgr,6,a.kod_sgr),0) AND
	  b.KOD_SPG=NVL(DECODE(a.level_pos,3,a.KOD_SPG,4,a.KOD_SPG,5,a.KOD_SPG,6,a.KOD_SPG),0) AND
	  b.KOD_RZD=NVL(DECODE(a.level_pos,4,a.KOD_RZD,5,a.KOD_RZD,6,a.KOD_RZD),0) AND
	  b.KOD_PRZ=NVL(DECODE(a.level_pos,5,a.KOD_PRZ,6,a.KOD_PRZ),0) AND
	  b.KOD_GRP=NVL(DECODE(a.level_pos,6,a.KOD_GRP),0)) WHERE a.level_pos>1;
  COMMIT;

  UPDATE KLS_PLANSTRU a
    SET for_mos_id=(SELECT C.ID FROM load_buffer.gr_real b, load_buffer.gr_real c 
	               WHERE b.id=a.id 
				     AND b.KOD_SGR1=c.KOD_SGR
                     AND b.KOD_SPG1=c.KOD_SPG
					 AND b.KOD_RZD1=c.KOD_RZD
					 AND b.KOD_PRZ1=c.KOD_PRZ
					 AND b.KOD_GRP1=c.KOD_GRP
					 AND b.KOD_PGR1=c.KOD_PGR);
  COMMIT;
END Renew_Kls_Planstru;

/
