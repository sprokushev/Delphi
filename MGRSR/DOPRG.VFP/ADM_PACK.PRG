*:*****************************************************************************
*:
*:		Process : ADM_PACK.PRG
*:		Descript: ������� REESTR_D.DBF
*:		Status  : PRIVATE
*:		Call	: !admrask.prg
*:      Is ready for VFP?  - READY
*:
*:*****************************************************************************
PRIVATE m.time
WAIT [Process...] + CHR(13);
	+[����������� ������ �� ��������.] WINDOW NOWAIT
SELECT 0
USE (gTovPrDbf + 'reestr_d')
m.time = TIME(1)
SET FILTER TO (tran_ras AND arh OR error # 0) AND !DELETED();
   AND((date_otgr <= DATE()-20 AND SUBSTR(m.time,1,5) < '19:00');
   OR date_otgr <= DATE()-6)

GO TOP

DO WHILE !EOF()
   IF LOCK()
      DELETE
   ENDIF
   UNLOCK
   SKIP
ENDDO

USE IN reestr_d
WAIT [����������� ������ �� �������� ���������.] WINDOW TIMEOUT(1)