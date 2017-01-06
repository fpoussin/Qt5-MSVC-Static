@echo off
setlocal

IF exist %ICUINSTALLDIR% (
    echo Found ICU
) ELSE (
    echo Could not find ICU in %ICUINSTALLDIR%
    echo use "run.bat build-deps" to install it
    exit /b 1
)

IF exist %SSLINSTALLDIR% (
    echo Found OpenSSL
) ELSE (
    echo Could not find OpenSSL in %SSLINSTALLDIR%
    echo use "run.bat build-deps" to install it
    exit /b 1
)

IF exist %QTDIR% (
    cd %QTDIR%
) ELSE ( 
    echo Could not find Qt sources in %QTDIR%
    exit /b 1
)

IF NOT exist %QTDIR%\mkspecs\common\msvc-desktop.conf.bkp (
    echo Copying updated mkspecs for static build
    copy /B %QTDIR%\mkspecs\common\msvc-desktop.conf %QTDIR%\mkspecs\common\msvc-desktop.conf.bkp
    copy /B /Y %STARTDIR%\tools\msvc-desktop.conf %QTDIR%\mkspecs\common\msvc-desktop.conf
)

IF exist %QTBUILDDIR% (
    echo Cleaning old Qt build dir
    rd /s /q %QTBUILDDIR%
)

md %QTBUILDDIR%
cd %QTBUILDDIR%  ||  exit /b %errorlevel%

echo Configuring Qt...
start /W /BELOWNORMAL "Configuring Qt..." %QTDIR%\configure.bat -prefix %QTINSTALLDIR% -platform %PLATFORM% -opensource -release -confirm-license -opengl dynamic -mp -static -no-shared -ltcg -qt-libpng -qt-libjpeg -qt-zlib -qt-pcre -angle -nomake examples -openssl-linked -I %SSLINSTALLDIR%\include -L %SSLINSTALLDIR%\lib -I %ICUINSTALLDIR%\include -L %ICUINSTALLDIR%\lib ^&^& exit
IF %errorlevel% NEQ 0 exit /b %errorlevel%

echo Configuration complete
echo Will install to %QTINSTALLDIR%

endlocal

