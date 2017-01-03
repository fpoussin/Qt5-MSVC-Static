@echo off
setlocal

cd %QTBUILDDIR% ||  exit /b %errorlevel%

echo Building Qt...
start /W /BELOWNORMAL "Building Qt..." nmake
IF %errorlevel% NEQ 0 exit /b %errorlevel%

echo Installing Qt...
start /W /BELOWNORMAL "Installing Qt..." nmake install
IF %errorlevel% NEQ 0 exit /b %errorlevel%

echo Qt sucessfully installed

endlocal
