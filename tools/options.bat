@echo off

set STARTDIR=%CD%

set ICUBUILDDIR=%STARTDIR%\icu
set ICUINSTALLDIR=%STARTDIR%\icu-static

set SSLBUILDDIR=%STARTDIR%\openssl-1.0.2d
set SSLINSTALLDIR=%STARTDIR%\openssl-static

set QTVER=5.5.0
set QTDIR=%STARTDIR%\qtbase-opensource-src-%QTVER%
set QTINSTALLDIR=C:\Qt\%QTVER%-static
set QTBUILDDIR=%QTDIR%\build

set PLATFORM=win32-msvc2015

set PATH=%PATH%;%STARTDIR%\qt-everywhere-opensource-src-%QTVER%\gnuwin32\bin
