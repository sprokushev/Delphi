SET PASP_DIR=V:\PASPort_csv
SET LOG_DIR=V:\PASPort_csv\LOG
SET ARC_DIR=V:\PASPort_csv\ARC
SET SOFT_DIR=U:\MASTER\XX101\R3Interfaces\ToLocalSystem
SET TEMP_DIR=C:\TEMP

rem ���������� ����� �� FTP-������ MSKPSS 
v:
cd %PASP_DIR%
copy /b %SOFT_DIR%\mskpasp_beg.txt+%SOFT_DIR%\mskpss_cur.txt+%SOFT_DIR%\pasp_put.txt+%SOFT_DIR%\mskpss_end.txt %SOFT_DIR%\paspput.txt
ftp -v -i -s:%SOFT_DIR%\paspput.txt

rem ���������� ����� � �������� �����
move /Y %PASP_DIR%\*.csv %ARC_DIR%

rem �������� ���� � FTP-������� MSKPSS 
C:
cd %TEMP_DIR%
copy /b %SOFT_DIR%\mskpasp_beg.txt+%SOFT_DIR%\mskpss_cur.txt+%SOFT_DIR%\pasp_get.txt+%SOFT_DIR%\mskpss_end.txt %SOFT_DIR%\paspget.txt
ftp -v -i -s:%SOFT_DIR%\paspget.txt


rem ��������� ��������� �����, ������� �� FTP-������� � ��������� ��� � ������� LOG_DIR
for %%I IN (%TEMP_DIR%\SH013*.err) DO CALL %SOFT_DIR%\PaspCSV0.bat %%~nI%%~xI

u:
cd %SOFT_DIR%
