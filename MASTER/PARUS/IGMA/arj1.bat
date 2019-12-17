rem Копирование 
echo off
arj.exe a -y mail\igma.arj mail\*.*
del mail\*.dbf 
del mail\*.ftp
pause