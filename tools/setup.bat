@echo off
setlocal

call tools\options.bat

IF exist %ICUINSTALLDIR% (
    echo ICU already built
) ELSE (
    echo Configuring ICU...
    IF exist %ICUBUILDDIR% (
        cd %ICUBUILDDIR%
        rd build /s /q
        md build
        cd build
        start /W /BELOWNORMAL bash %STARTDIR%/tools/setup_icu.sh
        echo Building ICU...
        start /W /BELOWNORMAL make
	IF %errorlevel% NEQ 0 exit /b %errorlevel%
	echo Installing ICU...
        start /W /BELOWNORMAL make install
	IF %errorlevel% NEQ 0 exit /b %errorlevel%
        cd %STARTDIR%
    ) ELSE (
        echo Could not find ICU sources in %ICUBUILDDIR%
        exit /b 1
    )
)

IF exist %QTDIR% (
    cd %QTDIR%
) ELSE ( 
    echo Could not find Qt sources in %QTDIR%
    exit /b 1
)

echo Copying updated mkspecs
xcopy /c /k /y %STARTDIR%\tools\msvc-desktop.conf %QTDIR%\mkspecs\common\msvc-desktop.conf

IF exist %QTBUILDDIR% (
    echo Cleaning old Qt build dir
    rd /s /q %QTBUILDDIR%
)

md %QTBUILDDIR%
cd %QTBUILDDIR%

echo Configuring Qt...
start /W /BELOWNORMAL %QTDIR%\configure.exe -prefix %QTINSTALLDIR% -platform %PLATFORM% -opensource -release -confirm-license -opengl dynamic -mp -static -qt-libpng -qt-libjpeg -qt-zlib -qt-pcre -no-angle -no-accessibility -nomake examples -openssl -I %OPENSSLDIR%\include -L %OPENSSLDIR%\lib -icu -I %ICUINSTALLDIR%\include -L %ICUINSTALLDIR%\lib
IF %errorlevel% NEQ 0 exit /b %errorlevel%

echo Configuration complete
echo Will install to %QTINSTALLDIR%
echo call build.bat to build and install

endlocal

