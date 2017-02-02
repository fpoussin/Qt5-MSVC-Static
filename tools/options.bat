@echo off

set STARTDIR=%CD%
set SRCDIR=%CD%\sources
set BUILDDIR=%CD%\build

set QTVER=5.8.0
set QTDIR=%SRCDIR%\qtbase-opensource-src-%QTVER%
set QTINSTALLDIR=C:\Qt\%QTVER%-static
set QTBUILDDIR=%QTDIR%\build

set ICUBUILDDIR=%SRCDIR%\icu-58.2
set ICUINSTALLDIR=%QTINSTALLDIR%\icu

set SSLBUILDDIR=%SRCDIR%\openssl-1.0.2j
set SSLINSTALLDIR=%QTINSTALLDIR%\openssl

set PLATFORM=win32-msvc2015

set PATH=%STARTDIR%\tools\gnuwin32\bin;%STARTDIR%\tools\jom;%PATH%
set UNIXPATH=C:\msys64\usr\bin;%PATH%
