*
* Отладочный
*

PUBLIC gTovPrDbf, gTovPrArh, gExportDbf, gExportGui, gNstOut, gPathTemp, m.cntraskred, fiopr, date_pr0, time_pr0, gFlagRaskr,;
	gPathDoPrg, gSvOper, gInRe_Msk

STORE 'C:\TMP\' TO gExportDbf, gExportGui, gFlagRaskr, gFlagRaskr, gSvOper, gTovPrDbf, gTovPrArh, gInRe_Msk
*gTovPrDbf = 'F:\TOV_PR\DBF\'
*gTovPrArh = 'F:\TOV_PR\ARHIV\'
STORE 'C:\TEMP\' TO gNstOut, gTMFlags
STORE 'C:\TMP\A\' TO gPathTemp
gPathDoPrg = 'F:\DBA\MGRSR\DOPRG.VFP\'
gSvOper='f:\svivoz\dbf\'

m.cntraskred=0
fiopr=ANSITOOEM('Ким Евгений')
date_pr0=date()
time_pr0=time()

CLOSE DATA
SET SAFETY OFF
