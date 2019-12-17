*:*******************************************************************
*:
*:		Process : admpsp.prg
*:		Descript : ‘ормирование справочника паспортов(сертификатов)
*:			дл€ передачи
*:		Status  : PRIVATE
*:		Call    : !admrask.prg
*:      Is ready for VFP?  - READY
*:
*:*******************************************************************
*** ¬ерси€ передачи "так как есть", т.е. всего содержимого

WAIT [Process...] + CHR(13);
	+ [‘ормирование справочника паспортов(NEW) дл€ передачи...] WINDOW NOWAIT
USE (gTovPrDbf + 'zagsert') ALIAS zagsert IN 0
SELECT zagsert
COPY TO (gNstOut + 'zagsert.dbf') TYPE Fox2X
USE (gTovPrDbf + 'qualsert') ALIAS qualsert IN 0
SELECT qualsert
COPY TO (gNstOut + 'qualsert.dbf') TYPE Fox2X
USE (gTovPrDbf + 'ntablpok') ALIAS ntablpok IN 0
SELECT ntablpok
COPY TO (gNstOut + 'ntablpok.dbf') TYPE Fox2X
USE (gTovPrDbf + 'nkodifik') ALIAS nkodifik IN 0
SELECT nkodifik
COPY TO (gNstOut + 'nkodifik.dbf') TYPE Fox2X
USE IN zagsert
USE IN qualsert
USE IN ntablpok
USE IN nkodifik
WAIT [‘ормирование справочника паспортов(NEW) завершено.] WINDOW TIMEOUT(1)
RETURN