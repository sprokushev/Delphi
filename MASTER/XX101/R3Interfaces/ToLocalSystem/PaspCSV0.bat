rem Удалить файл на FTP-сервер MSKPSS
echo delete %1 > %SOFT_DIR%\pasp_del.txt
copy /b %SOFT_DIR%\mskpasp_beg.txt+%SOFT_DIR%\mskpss_cur.txt+%SOFT_DIR%\pasp_del.txt+%SOFT_DIR%\mskpss_end.txt %SOFT_DIR%\paspdel.txt
ftp -v -i -s:%SOFT_DIR%\paspdel.txt

rem Переносим файл в каталог LOG_DIR
move /Y %TEMP_DIR%\%1 %LOG_DIR%
