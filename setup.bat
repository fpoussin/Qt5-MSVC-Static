@echo off
setlocal

call options.bat

IF exist %ICUINSTALLDIR% (
    echo ICU already built
) ELSE (
    echo Configuring ICU sources...
    IF exist %ICUBUILDDIR% (
        cd %ICUBUILDDIR%
        rd build /s /q
        md build
        cd build
        bash %STARTDIR%/setup_icu.sh
        echo Building ICU...
        make
        make install
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

xcopy /f /e /c /i /k /y %STARTDIR%\%PLATFORM% %QTDIR%\mkspecs\%PLATFORM%

IF exist %QTBUILDDIR% (
    echo Cleaning old build dir
    rd /s /q %QTBUILDDIR%
)

md %QTBUILDDIR%
cd %QTBUILDDIR%
%QTDIR%\configure.bat -prefix %QTINSTALLDIR% -platform %PLATFORM% -opensource -release ^
-opengl dynamic -mp -static -qt-libpng -qt-libjpeg -qt-zlib -qt-pcre ^
-no-angle -no-accessibility -nomake examples ^
-openssl -I %OPENSSLDIR%\include -L %OPENSSLDIR%\lib ^
-icu -I %ICUINSTALLDIR%\include -L %ICUINSTALLDIR%\lib

echo Configuration complete
echo Will install to %QTINSTALLDIR%
echo call build.bat to build and install

endlocal

