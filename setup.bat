@echo off
setlocal

set BUILDDIR="build"
set QTVER="5.5"
set OPENSSL="C:\OpenSSL-Win32"

git clone -b %QTVER% https://github.com/qtproject/qtbase.git qtbase-%QTVER%
cd qtbase-%QTVER%

xcopy /e /c /i /k /y ..\win32-msvc2012-static mkspecs\

echo "Cleaning old build dir"
rd /s /q %BUILDDIR%

md %BUILDDIR%
cd %BUILDDIR%
..\configure.exe -prefix C:\Qt\%QTVER%-static -platform win32-msvc2012-static -opensource -release -opengl desktop -mp -static -nomake examples -qt-libpng -qt-libjpeg -qt-zlib -qt-pcre -openssl -no-angle -no-accessibility -I %OPENSSL%\include -L %OPENSSL%\lib

echo "Configuration complete"
echo "Will install to C:\Qt\%QTVER%-static"
echo "Type nmake to build"
echo "Type nmake install to install"

endlocal
