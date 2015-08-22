@echo off
setlocal

call tools\options.bat

set EXTPATH=%STARTDIR%\%EXTNAME%-opensource-src-%QTVER%
set QMAKE=%QTINSTALLDIR%\bin\qmake.exe

IF NOT "%EXTNAME%"=="" (
    
    echo PATH: %EXTPATH%
    echo QMAKE: %QMAKE%
    
    cd %EXTPATH% ||  exit /b %errorlevel%

    echo Configuring %EXTNAME%...
    start /W "Configuring %EXTNAME%" %QMAKE%
    IF %errorlevel% NEQ 0 exit /b %errorlevel%

    echo Building %EXTNAME%...
    start /W /BELOWNORMAL "Building Qt..." nmake clean all
    IF %errorlevel% NEQ 0 exit /b %errorlevel%

    echo Installing %EXTNAME%...
    start /W /BELOWNORMAL "Installing Qt..." nmake install
    IF %errorlevel% NEQ 0 exit /b %errorlevel%

    echo %EXTNAME% installed
) ELSE (
    echo Missing extension name!
)

endlocal
