rem Удалить файл на FTP-сервер MSKPSS
echo delete %1 > %SOFT_DIR%\mskpss_del.txt
copy /b %SOFT_DIR%\mskpss_beg.txt+%SOFT_DIR%\mskpss_cur.txt+%SOFT_DIR%\mskpss_del.txt+%SOFT_DIR%\mskpss_end.txt %SOFT_DIR%\mskpss.txt
ftp -v -i -s:%SOFT_DIR%\mskpss.txt

rem Переносим файл в каталог IN_DIR
move /Y %TEMP_DIR%\%1 %IN_DIR%
