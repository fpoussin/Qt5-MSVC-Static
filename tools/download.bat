@echo off
setlocal

call tools\options.bat

set CURLOPTS=-L -C - -O

cd %SRCDIR%

echo Downloading %QTURL%
curl %CURLOPTS% %QTURL%

echo Downloading %QTEXTRAURL%
curl %CURLOPTS% %QTEXTRAURL%

echo Downloading %ICUURL%
curl %CURLOPTS% %ICUURL%

echo Downloading %SSLURL%
curl %CURLOPTS% %SSLURL%

cd ..

endlocal
