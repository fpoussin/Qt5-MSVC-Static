@echo off

set STARTDIR=%CD%
set SRCDIR=%CD%\sources
set BUILDDIR=%CD%\build

set PLATFORM=win32-msvc2015
set QTVER=5.8.0
set ICUVER=58.2
set SSLVER=1.0.2j

set QTINSTALLDIR=C:\Qt\%QTVER%-static

set QTURL=http://download.qt.io/official_releases/qt/%QTVER:~0,3%/%QTVER%/submodules/qtbase-opensource-src-%QTVER%.7z
set QTEXTRAURL=http://download.qt.io/official_releases/qt/%QTVER:~0,3%/%QTVER%/submodules/qtwinextras-opensource-src-%QTVER%.7z
set QTDIR=%SRCDIR%\qtbase-opensource-src-%QTVER%
set QTBUILDDIR=%QTDIR%\build

call set ICUVER_UNDERSCORE=%%ICUVER:.=_%%
set ICUURL=http://download.icu-project.org/files/icu4c/%ICUVER%/icu4c-%ICUVER_UNDERSCORE%-src.zip
set ICUBUILDDIR=%SRCDIR%\icu-%ICUVER%
set ICUINSTALLDIR=%QTINSTALLDIR%\icu

set SSLURL=https://www.openssl.org/source/openssl-%SSLVER%.tar.gz
set SSLBUILDDIR=%SRCDIR%\openssl-%SSLVER%
set SSLINSTALLDIR=%QTINSTALLDIR%\openssl

set PATH=%STARTDIR%\tools\gnuwin32\bin;%STARTDIR%\tools\jom;%PATH%
set UNIXPATH=C:\msys64\usr\bin;%PATH%

set CURLOPTS=-L -C - -O
set ZOPTS=x -aos -y
