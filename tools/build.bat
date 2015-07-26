@echo off
setlocal

call tools\options.bat

cd %QTBUILDDIR%
start /W /BELOWNORMAL nmake && start /W /BELOWNORMAL nmake install

endlocal
