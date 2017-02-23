@echo off

set STARTDIR=%CD%
set SRCDIR=%CD%\sources
set BUILDDIR=%CD%\build

set QTVER=5.8.0
set QTURL=http://download.qt.io/official_releases/qt/%QTVER:~0,3%/%QTVER%/submodules/qtbase-opensource-src-%QTVER%.zip
set QTEXTRAURL=http://download.qt.io/official_releases/qt/%QTVER:~0,3%/%QTVER%/submodules/qtwinextras-opensource-src-%QTVER%.zip
set QTDIR=%SRCDIR%\qtbase-opensource-src-%QTVER%
set QTINSTALLDIR=C:\Qt\%QTVER%-static
set QTBUILDDIR=%QTDIR%\build

set ICUURL=http://download.icu-project.org/files/icu4c/58.2/icu4c-58_2-src.zip
set ICUBUILDDIR=%SRCDIR%\icu-58.2
set ICUINSTALLDIR=%QTINSTALLDIR%\icu

set SSLURL=https://www.openssl.org/source/openssl-1.0.2j.tar.gz
set SSLBUILDDIR=%SRCDIR%\openssl-1.0.2j
set SSLINSTALLDIR=%QTINSTALLDIR%\openssl

set PLATFORM=win32-msvc2015

set PATH=%STARTDIR%\tools\gnuwin32\bin;%STARTDIR%\tools\jom;%PATH%
set UNIXPATH=C:\msys64\usr\bin;%PATH%
