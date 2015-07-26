@echo off
setlocal

call tools\options.bat

cd %QTBUILDDIR%
start /W /BELOWNORMAL nmake
IF %errorlevel% NEQ 0 exit /b %errorlevel%
start /W /BELOWNORMAL nmake install

endlocal
