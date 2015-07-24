@echo off

set QTVER=5.5
set QTDIR=%CD%\qtbase-%QTVER%
set BUILDDIR=%QTDIR%\build
set PLATFORM=win32-msvc2012
set OPENSSL=C:\OpenSSL-Win32
set ICU=%CD%\icu-55.1-vs2012

IF exist %QTDIR% (
    cd %QTDIR%
    git pull
) ELSE ( 
    git clone -b %QTVER% https://github.com/qtproject/qtbase.git %QTDIR%
    cd %QTDIR%
)

xcopy /e /c /i /k /y %QTDIR%\%PLATFORM% mkspecs\

IF exist %BUILDDIR% (
    echo Cleaning old build dir
    rd /s /q %BUILDDIR%
)

md %BUILDDIR%
cd %BUILDDIR%
%QTDIR%\configure.bat -prefix C:\Qt\%QTVER%-static -platform %PLATFORM% -opensource -release ^
-opengl dynamic -mp -static -qt-libpng -qt-libjpeg -qt-zlib -qt-pcre ^
-no-angle -no-accessibility -nomake examples ^
-openssl -I %OPENSSL%\include -L %OPENSSL%\lib ^
-icu -I %ICU%\include -L %ICU%\lib

echo Configuration complete
echo Will install to C:\Qt\%QTVER%-static
echo Type nmake to build
echo Type nmake install to install

