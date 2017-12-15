@echo off
setlocal

call tools\options.bat

cd %SRCDIR% ||  exit /b %errorlevel%

echo Downloading %QTURL%
curl %CURLOPTS% %QTURL% 
7z %ZOPTS% qtbase-everywhere-src-%QTVER%.zip || exit /b %errorlevel%

echo Downloading %SSLURL%
curl %CURLOPTS% %SSLURL%
7z %ZOPTS% openssl-%SSLVER%.tar.gz ||  exit /b %errorlevel%
7z %ZOPTS% openssl-%SSLVER%.tar ||  exit /b %errorlevel%

cd ..

endlocal
