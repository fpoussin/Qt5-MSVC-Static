@echo off
setlocal

call options.bat

cd %QTBUILDDIR%
nmake && nmake install

endlocal
