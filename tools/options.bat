@echo off


set MSVCVER=2017
set QTVER=5.13.0
set SSLVER=1.1.1c
set PREFIX=C:\Qt
set EXTRABUILDOPTIONS=-qt-sqlite
set PATH=C:\Python\;C:\Python27\;C:\Strawberry\perl\bin;%PATH%


REM DO NOT EDIT BELOW THIS LINE

set STARTDIR=%CD%
set SRCDIR=%CD%\sources
set BUILDDIR=%CD%\build
set PLATFORM=win32-msvc%MSVCVER%
set QTINSTALLDIR=%PREFIX%\%QTVER%\msvc%MSVCVER%-%VSCMD_ARG_TGT_ARCH%-static

set QTRELEASE=official
for %%A in (alpha beta rc) DO (echo.%QTVER% | find /I "%%A">Nul && set QTRELEASE=development)

set QTURL=http://download.qt.io/%QTRELEASE%_releases/qt/%QTVER:~0,-2%/%QTVER%/submodules/qtbase-everywhere-src-%QTVER%.zip
set QTDIR=%SRCDIR%\qtbase-everywhere-src-%QTVER%
set QTBUILDDIR=%QTDIR%\build

set SSLURL=https://www.openssl.org/source/openssl-%SSLVER%.tar.gz
set SSLBUILDDIR=%SRCDIR%\openssl-%SSLVER%
set SSLINSTALLDIR=%QTINSTALLDIR%\openssl-%SSLVER%

set CURLOPTS=-L -C - -O
set ZOPTS=x -aos -y
set PATH=%STARTDIR%\tools\gnuwin32\bin;%STARTDIR%\tools\jom;%STARTDIR%\tools\nasm;%PATH%
