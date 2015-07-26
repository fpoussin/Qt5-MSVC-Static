@echo off

set STARTDIR=%CD%
set QTVER=5.5.0
set QTDIR=%STARTDIR%\qtbase-opensource-src-%QTVER%
set QTINSTALLDIR=C:\Qt\%QTVER%-static
set QTBUILDDIR=%QTDIR%\build
set PLATFORM=win32-msvc2015
set OPENSSLDIR=C:\OpenSSL-Win32
set ICUBUILDDIR=%STARTDIR%\icu
set ICUINSTALLDIR=%STARTDIR%\icu-static
set PATH=%PATH%;%STARTDIR%\qt-everywhere-opensource-src-%QTVER%\gnuwin32\bin
