rem Копирование 
echo off
del ukhta\*.*
arj x -y mail\in\igmaout.arj
rename ukhta\trcust.* transinvcust.* 
rename ukhta\trcusts.* transinvcustspecs.* 
rename ukhta\trcustn.* transinvcustnumbs.*
copy ukhta\*.* *.* /y
pause