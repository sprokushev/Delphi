SELECT /*+ RULE ORDERED */ 
  FA.RN NRN 
  , AG.AGNABBR SAGENT 
  , FA.VALID_DOCNUMB AS dog 
  , PT.GSMPAYMENTS_MNEMO SPAY_TYPE 
  , (SELECT crn 
     FROM acatalog c 
     WHERE c.signs = 1 
     CONNECT BY PRIOR crn = rn 
     START WITH c.rn = FA.CRN 
     ) AS crn 
FROM PARUS.FACEACC FA 
  , PARUS.AZSGSMPAYMENTSTYPES PT 
  , PARUS.AGNLIST AG 
WHERE FA.PLAN_OPEN_DATE > '01-jan-2003' 
  AND FA.AGENT = AG.RN(+) 
  AND FA.PAY_TYPE = PT.RN (+)

SELECT f.sagent,f.svalid_docnumb AS dog,f.NCRN,f.spay_type,
gp.sgraphpoint,gp.nnomen,gp.snomen,gp.NNOMMODIF, gp.SNOMMODIF,
gp.NACTM_QUANT,gp.DBEGIN_DATE,(SELECT crn FROM acatalog c
WHERE c.signs=1
CONNECT BY PRIOR crn=rn 
START WITH c.rn=f.NCRN) AS crn
FROM V_FCACOPERPLANS gp, v_faceacc f
WHERE f.nrn=gp.NPRN 
AND gp.NINEXP_SIGN = 1 
--AND f.dplan_open_date >'01-jan-2003'


CREATE OR REPLACE FORCE VIEW MASTER.V_PARUS_PRICE_COND
(SAGENT, BASE_NUMB, DOG_NUMBER, DOG_ID, SFACEACC, 
 SSUBDIV, STARIF, SPAY_TYPE, SNOMEN, SNOMMODIF, 
 PROD_ID_NPR, NPRICE, DBEGIN, SACC_AGENT, SJUR_PERS, 
 SACCDOC, SSHIPVIEW, DEND)
AS 
SELECT c.sagent,trim(sdoc_pref)||trim(sdoc_numb),KLS_DOG.DOG_NUMBER, AB.DOG_ID,
s.sfaceacc,s.ssubdiv,s.starif,rsc.spaytype as spay_type,rs.snomen,rs.snommodif,P.PROD,rsc.nprice,rs.dpricedate,
c.sexecutive as sacc_agent,c.sjur_pers,c.sdoc_type as saccdoc,rsc.ssheepview as sshipview,
NVL(rs.denddate,TO_DATE('31.12.2099','dd.mm.yyyy')) AS dend
FROM parus.v_contracts@oracle.world c,
parus.v_stages@oracle.world s,
parus.v_rlpricespecs@oracle.world rs,
parus.v_rlpricescond@oracle.world rsc,
KLS_DOG_PARUS AB, KLS_DOG,KLS_PROD_NOMENKLATOR P
WHERE c.nrn=s.NPRN AND s.ntarif=rs.ntarif and (rs.nrn=rsc.nprn and s.npay_type=rsc.npaytype)
AND c.ddoc_date>TO_DATE('20.03.2002','dd.mm.yyyy') AND s.nstatus=1 AND c.sdoc_pref LIKE '—Õœ%'
AND (rs.denddate>TO_DATE('31.12.2002','dd.mm.yyyy') OR rs.denddate IS NULL/* OR rs.denddate||' '=' '*/)
AND trim(c.sdoc_pref)||trim(c.sdoc_numb)=AB.BASE_NUMB
AND AB.DOG_ID=KLS_DOG.ID
--AND LTRIM(RTRIM(UPPER(rs.snomen)))<>'∆/ƒ “¿–»‘'
--AND LTRIM(RTRIM(UPPER(rs.snomen)))<>'∆/ƒ “¿–»‘_œ'
--AND LTRIM(RTRIM(UPPER(rs.snomen)))<>'«¿ “–¿Õ—œŒ–“»–Œ¬ ”'
--AND LTRIM(RTRIM(UPPER(rs.snomen)))<>'—“–¿’Œ¬ ¿_√–'
AND LTRIM(RTRIM(UPPER(rs.snomen)))=P.MODIF
AND LTRIM(RTRIM(UPPER(rs.snommodif)))=P.MOD_MODIF;


CREATE OR REPLACE FORCE VIEW MASTER.V_PARUS_PRICE
(SAGENT, NAGENT, ACCNUMB, DOG_NUMBER, DOG_ID, 
 SFACEACC, NFACEACC, SSUBDIV, NSUBDIV, STARIF, 
 NTARIF, SPAY_TYPE, NPAY_TYPE, SNOMEN, NNOMEN, 
 SNOMMODIF, NNOMMODIF, PROD_ID_NPR, NPRICE, SACC_AGENT, 
 NEXECUTIVE, SJUR_PERS, NJUR_PERS, SACCDOC, ACCDOC, 
 ACCDATE, SSHIPVIEW, NSHIP_TYPE, DBEGIN, DEND, 
 NFA_CURRENCY, SFA_CURRENCY)
AS 
SELECT c.sagent,c.nagent,
trim(sdoc_pref)||trim(sdoc_numb) as accnumb,
KLS_DOG.DOG_NUMBER, AB.DOG_ID,
s.sfaceacc,s.nfaceacc,
s.ssubdiv,s.nsubdiv,
s.starif,s.ntarif,
s.spay_type,s.npay_type,
rp.snomen,rp.nnomen,
rs.snommodif,rs.nnommodif,
P.PROD,
rs.nprice,
c.sexecutive as sacc_agent,c.nexecutive,
c.sjur_pers,c.njur_pers,
c.sdoc_type as saccdoc, c.ndoc_type as accdoc, c.ddoc_date as accdate,
s.sship_type as sshipview,s.nship_type,
rs.dpricedate,NVL(rs.denddate,TO_DATE('31.12.2099','dd.mm.yyyy')) AS dend,
s.nfa_currency, s.sfa_currency
FROM parus.v_contracts@oracle.world c,
parus.v_stages@oracle.world s,
parus.v_RLPRICES@oracle.world rp,
parus.v_rlpricespecs@oracle.world rs,
KLS_DOG_PARUS AB, KLS_DOG,KLS_PROD_NOMENKLATOR P
WHERE c.nrn=s.NPRN AND s.ntarif=rs.ntarif
and RP.nRN = RS.npRN
AND c.ddoc_date>TO_DATE('20.03.2002','dd.mm.yyyy') AND s.nstatus=1 AND c.sdoc_pref LIKE '—Õœ%'
AND (rs.denddate>TO_DATE('31.12.2002','dd.mm.yyyy') OR rs.denddate IS NULL/* OR rs.denddate||' '=' '*/)
AND trim(c.sdoc_pref)||trim(c.sdoc_numb)=AB.BASE_NUMB
AND AB.DOG_ID=KLS_DOG.ID
AND LTRIM(RTRIM(UPPER(rs.snomen)))=P.MODIF
AND LTRIM(RTRIM(UPPER(rs.snommodif)))=P.MOD_MODIF;


select (p.CODE||' '||n.MODIF_CODE) as party,ic.PRICE
from inorders i,inorderspecs ic,
incomdoc p,nommodif n
where i.RN=ic.PRN
and i.PARTY=p.RN
and ic.NOMMODIF=n.RN
and i.INDOCDATE>'01-apr-03'
and i.INDOCTYPE in (138152460,138216525)
group by p.CODE, n.MODIF_CODE, ic.PRICE
order by p.CODE, n.MODIF_CODE