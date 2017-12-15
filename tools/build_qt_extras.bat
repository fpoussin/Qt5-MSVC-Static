@echo off
setlocal EnableDelayedExpansion

set EXTPATH=%SRCDIR%\%EXTNAME%-everywhere-src-%QTVER%
set QMAKE=%QTINSTALLDIR%\bin\qmake.exe

IF NOT "%EXTNAME%"=="" (
    
    echo PATH: %EXTPATH%
    echo QMAKE: %QMAKE%
    
    set URL=http://download.qt.io/%QTRELEASE%_releases/qt/%QTVER:~0,-2%/%QTVER%/submodules/%EXTNAME%-everywhere-src-%QTVER%.zip
    
    cd %SRCDIR%
    echo Downloading !URL!
    curl %CURLOPTS% !URL!
    7z %ZOPTS% %EXTNAME%-everywhere-src-%QTVER%.zip || exit /b %errorlevel%
    cd ..
    
    cd %EXTPATH% ||  exit /b %errorlevel%

    echo Configuring %EXTNAME%...
    start /W "Configuring %EXTNAME%" %QMAKE% || exit /b %errorlevel%
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
