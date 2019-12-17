  SELECT
   dog.long_num    AS nkon,
   plat.NAIM       AS pok,
   IIF(prod.kod='11518','Мазут М-100 tз не более 30С',PADR(PROD.naim_pr,40)) AS n_np,
   STAN.NAIM       AS stan,
   KVIT.DATE_KVIT  AS datg,
   KVIT.VES        AS kolg,
   STR(KVIT.NUM_CIST,8)  AS nomvag,
   PADL(ALLT(STR(KVIT.NUM_KVIT)),6,'0') AS conosam,
   EXPED.NAME0     AS typvag,
   "КТУ"           AS npz,
   nfpowner.NAME0  AS pos,
   NAPR.NAPR       AS napr,
   KVIT.DATE_KVIT  AS ddoc,
   "2"             AS vtr,
   KVIT.EXPED     AS typvag_id,
   TEX_PD.KOD_PREDPR AS kod_predpr,
   PLATTAR.NAIM_K    AS trans,
   PADR(KVIT.GTD,23) AS nomdec,
   ' '		   AS t_gtd,
   STR(KVIT.PRV,1) AS prv,
   polu.NAIM       AS polu,
   kvit.n_mar      AS n_mar,
   PROD.KOD_10     AS korp_kod,
   000 AS tara_kod,
   SPACE(1)        AS opl_tran,
   SPACE(10)	   AS tnved,
   SPACE(24)       AS s_gr,  
   IIF(LEN(ALLT(STR(kvit.kst)))>4,
          PADL(ALLT(STR(KVIT.KST)),6,'0'),
          ALLT(STR(kvit.kst))) as kod_stan,
   kvit.wes as gruz_pod,
   0 as KOL_BRUT,
   STAN.RAST,
   IIF(kvit.kod_otgr=5,'ЭКС','   ') as exp,
   kvit.id as KVIT_ID,
   kvit.GD_TRACK,
   kvit.PL,
   kvit.XPL,
   kvit.TIP,
   kvit.VZLIV,
   kvit.KODPASP,
   CTOD('  /  /  ') as PEREHOD,
   SPACE(24) as ST_PER,
   CTOD('  /  /  ') as DPOL,
   SPACE(24) as ST_ZAGR,
   CTOD('  /  /  ') as DT_ZAGR,
   SPACE(24) as ST_ROSS,
   CTOD('  /  /  ') as DT_ROSS,
   0000000000.00 as SUM_RUB,
   0000000000.00 as NDS_RUB,
   0000000000.00 as SUM_DOL,
   0000000000.00 as NDS_DOL,
   0000000000.00 as ZD_TARIF,
   SPACE(5) as ZD_VAL_TAR,
   00000 as ZD_USL_ZA,
  SPACE(3) as ZD_EI_USL,
   0000000000.00 as ZD_ST_USL,
   SPACE(5) as ZD_VAL_ST,
   0000000000.00 as ZD_NDS,
   0000000000.00 as VZ_TARIF,
   SPACE(5) as VZ_VAL_TAR,
   00000 as VZ_USL_ZA,
  SPACE(3) as VZ_EI_USL,
   0000000000.00 as VZ_ST_USL,
   SPACE(5) as VZ_VAL_ST,
   0000000000.00 as VZ_NDS,
   0000000000.00 as EX_TARIF,
   SPACE(5) as EX_VAL_TAR,
   00000 as EX_USL_ZA,
  SPACE(3) as EX_EI_USL,
   0000000000.00 as EX_ST_USL,
   SPACE(5) as EX_VAL_ST,
   0000000000.00 as EX_NDS
FROM PROD,predpr polu,STAN,predpr plat,'U:\LUK\GD_KVIT\DBF\nfpowner',NAPR,EXPED,KVIT,tex_pd,dog, predpr plattar,types
  WHERE
    (PROD.KOD = KVIT.KOD_NPR) AND
    (polu.KOD = KVIT.KOD_POLUCH) AND
    (STAN.KOD = KVIT.KST) AND
    (KVIT.n_DOG = DOG.Num_dog) AND
    (plat.KOD = KVIT.KOD_PLAT) AND
    (nfpowner.KOD = KVIT.NFP_OWNER) AND
    (tex_pd.kod_tex_pd = KVIT.plat_tarif) AND
    (tex_pd.kod_grotpr = KVIT.kod_grotp) AND
    (NAPR.KOD = KVIT.KOD_NAPR) AND
    (EXPED.KOD = KVIT.EXPED) AND
    (kvit.date_kvit>=:BEGIN_DATE) AND (kvit.date_kvit<=:END_DATE) AND
    (kvit.kod_napr<>0) and 
    (tex_pd.kod_predpr = plattar.kod) AND
    (kvit.kod_otgr=5) AND 
    (KVIT.TIPV=types.nom) AND
    (KVIT.exped=3 OR types.vlad=2 OR types.vlad=33 OR types.vlad=3)  AND
    (kvit.kod_npr<>'90000')
  ORDER BY datg



  SELECT
   dog.long_num    AS nkon,
   dog.plat_num    AS rkon,
   plat.NAIM       AS pok,
   IIF(prod.kod='11518','Мазут М-100 tз не более 30С',PADR(PROD.naim_pr,40)) AS n_np,
   STAN.NAIM       AS stan,
   KVIT.DATE_KVIT  AS datg,
   KVIT.VES       AS kolg,
   STR(KVIT.NUM_CIST,8)  AS nomvag,
   PADL(ALLT(STR(KVIT.NUM_KVIT)),6,'0') AS conosam,
   EXPED.NAME0     AS typvag,
   "УНП"           AS npz,
   nfpowner.NAME0  AS pos,
   NAPR.NAPR       AS napr,
   KVIT.DATE_KVIT  AS ddoc,
   "2"             AS vtr,
   KVIT.EXPED     AS typvag_id,
   TEX_PD.KOD_PREDPR AS kod_predpr,
   PLATTAR.NAIM_K    AS trans,
   PADR(KVIT.GTD,23) AS nomdec,
   ' '		   AS t_gtd,
   STR(KVIT.PRV,1) AS prv,
   polu.NAIM       AS polu,
   kvit.n_mar      AS n_mar,
   PROD.KOD_10     AS korp_kod,
   000 AS tara_kod,
   SPACE(1)        AS opl_tran,
   SPACE(18) as prich,
   SPACE(10)	   AS tnved,
   SPACE(24)       AS s_gr,  
   SPACE(24)       AS s_vl,  
   IIF(LEN(ALLT(STR(kvit.kst)))>4,
          PADL(ALLT(STR(KVIT.KST)),6,'0'),
          ALLT(STR(kvit.kst))) as kod_stan,
   kvit.wes as gruz_pod,
   0 as KOL_BRUT,
   0 as con_id,
   kvit.id as KVIT_ID,
   IIF(prod.kod_ksss=131,12954,prod.kod_ksss)  as KSSS
  FROM PROD,predpr polu,STAN,predpr plat,'U:\LUK\GD_KVIT\DBF\nfpowner',NAPR,EXPED,KVIT,tex_pd,dog, predpr plattar
  WHERE 
    (PROD.KOD = KVIT.KOD_NPR) AND
    (polu.KOD = KVIT.KOD_POLUCH) AND
    (STAN.KOD = KVIT.KST) AND
    (KVIT.n_DOG = DOG.Num_dog) AND
    (plat.KOD = KVIT.KOD_PLAT) AND
    (nfpowner.KOD = KVIT.NFP_OWNER) AND
    (tex_pd.kod_tex_pd = KVIT.plat_tarif) AND
    (tex_pd.kod_grotpr = KVIT.kod_grotp) AND
    (NAPR.KOD = KVIT.KOD_NAPR) AND
    (EXPED.KOD = KVIT.EXPED) AND
    (kvit.date_kvit>=:BEGIN_DATE) AND (kvit.date_kvit<=:END_DATE) AND
    (kvit.kod_napr<>0) and (kvit.kod_otgr=5) AND
    (tex_pd.kod_predpr = plattar.kod) AND
    (kvit.kod_npr<>'90000')
  ORDER BY datg




  SELECT
   '0411565'    AS nkon,
   dog.num_dog,
   plat.NAIM       AS pok,
   IIF(prod.kod='11518','Мазут М-100 tз не более 30С',PADR(PROD.naim_pr,40)) AS n_np,
   STAN.NAIM       AS stan,
   KVIT.DATE_OTGR  AS datg,
   KVIT.VES       AS kolg,
   STR(KVIT.NUM_CIST,8)  AS nomvag,
   IIF(KVIT.NUM_KVIT=99999,'',PADL(ALLT(STR(KVIT.NUM_KVIT)),6,'0'))  AS conosam,
   EXPED.NAME0     AS typvag,
   "КТУ"           AS npz,
   ''  AS pos,
   ''       AS napr,
   KVIT.DATE_KVIT  AS ddoc,
   "2"             AS vtr,
   MONTH.EXPED     AS typvag_id,
   TEX_PD.KOD_PREDPR AS kod_predpr,
   PLATTAR.NAIM_K    AS trans,
   PADR(KVIT.GTD,23) AS nomdec,
   ' '		   AS t_gtd,
   STR(KVIT.PRV,1) AS prv,
   polu.NAIM       AS polu,
   kvit.n_mar      AS n_mar,
   PROD.KOD_10     AS korp_kod,
   000 AS tara_kod,
   SPACE(1)        AS opl_tran,
   SPACE(18) as prich,
   SPACE(10)	   AS tnved,
   SPACE(24)       AS s_gr,  
   SPACE(24)       AS s_vl,  
   IIF(LEN(ALLT(STR(kvit.kst)))>4,
          PADL(ALLT(STR(KVIT.KST)),6,'0'),
          ALLT(STR(kvit.kst))) as kod_stan,
   kvit.wes as gruz_pod,
   0 as KOL_BRUT,
   0 as CON_ID,
   kvit.id as KVIT_ID,
   kvit.GD_TRACK,
   kvit.PL,
   kvit.XPL,
   kvit.TIP,
   kvit.VZLIV,
   kvit.KODPASP
  FROM PROD,predpr polu,STAN,predpr plat, kvit, tex_pd,types, month LEFT JOIN exped ON month.exped=exped.kod,dog, predpr plattar
  WHERE
    (ALLT(kvit.nom_zd)=ALLT(month.nom_zd)) AND
    (PROD.KOD = KVIT.KOD_NPR) AND
    (KVIT.TIPV=types.nom) AND
    (polu.KOD = KVIT.KOD_POLUCH) AND
    (STAN.KOD = KVIT.KST) AND
    (plat.KOD = KVIT.KOD_PLAT) AND
    (tex_pd.kod_tex_pd = KVIT.plat_tarif) AND
    (tex_pd.kod_grotpr = KVIT.kod_grotp) AND
    (kvit.date_otgr>=:BEGIN_DATE) AND 
    (kvit.date_otgr<=:END_DATE) AND 
    (KVIT.n_DOG = DOG.Num_dog) AND
    (kvit.kod_otgr=5) AND
    (tex_pd.kod_predpr = plattar.kod) AND
    (kvit.kod_napr=6)
  ORDER BY date_otgr