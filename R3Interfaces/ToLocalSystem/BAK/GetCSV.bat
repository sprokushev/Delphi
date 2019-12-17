SET IN_DIR=U:\IMPEX\R3\IN\
SET SOFT_DIR=U:\MASTER\XX101\R3Interfaces\ToLocalSystem
SET TEMP_DIR=C:\TEMP

rem Забрать файлы с FTP-сервера MSKPSS 
C:
cd %TEMP_DIR%
echo mget SH015*.csv > %SOFT_DIR%\mskpss_get.txt
echo mget SH022*.csv >> %SOFT_DIR%\mskpss_get.txt
copy /b %SOFT_DIR%\mskpss_beg.txt+%SOFT_DIR%\mskpss_cur.txt+%SOFT_DIR%\mskpss_get.txt+%SOFT_DIR%\mskpss_end.txt %SOFT_DIR%\mskpss.txt
ftp -v -i -s:%SOFT_DIR%\mskpss.txt

rem Проверить получение файла, удалить на FTP-сервере и перенести его в каталог IN_DIR
for %%I IN (%TEMP_DIR%\SH015*.csv) DO CALL %SOFT_DIR%\GetCSV0.bat %%~nI%%~xI
for %%I IN (%TEMP_DIR%\SH022*.csv) DO CALL %SOFT_DIR%\GetCSV0.bat %%~nI%%~xI

u:
cd %SOFT_DIR%
