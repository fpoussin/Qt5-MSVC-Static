@echo off
setlocal

set EXTPATH=%SRCDIR%\%EXTNAME%-opensource-src-%QTVER%
set QMAKE=%QTINSTALLDIR%\bin\qmake.exe

IF NOT "%EXTNAME%"=="" (
    
    echo PATH: %EXTPATH%
    echo QMAKE: %QMAKE%
    
    cd %EXTPATH% ||  exit /b %errorlevel%

    echo Configuring %EXTNAME%...
    start /W "Configuring %EXTNAME%" %QMAKE%
    IF %errorlevel% NEQ 0 exit /b %errorlevel%

    echo Building %EXTNAME%...
    start /W /BELOWNORMAL "Building %EXTNAME%..." jom clean all
    IF %errorlevel% NEQ 0 exit /b %errorlevel%

    echo Installing %EXTNAME%...
    start /W /BELOWNORMAL "Installing %EXTNAME%..." jom install
    IF %errorlevel% NEQ 0 exit /b %errorlevel%

    echo %EXTNAME% installed
) ELSE (
    echo Missing extension name!
)

endlocal
