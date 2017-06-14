@echo off
setlocal

call tools\options.bat

cd %SRCDIR% ||  exit /b %errorlevel%

echo Downloading %QTURL%
curl %CURLOPTS% %QTURL% 
7z %ZOPTS% qtbase-opensource-src-%QTVER%.zip || exit /b %errorlevel%

echo Downloading %ICUURL%
curl %CURLOPTS% %ICUURL%
7z %ZOPTS% icu4c-%ICUVER_UNDERSCORE%-src.zip || exit /b %errorlevel%
rd /S /Q icu-%ICUVER%
ren icu icu-%ICUVER% ||  exit /b %errorlevel%

echo Downloading %SSLURL%
curl %CURLOPTS% %SSLURL%
7z %ZOPTS% openssl-%SSLVER%.tar.gz ||  exit /b %errorlevel%
7z %ZOPTS% openssl-%SSLVER%.tar ||  exit /b %errorlevel%

cd ..

endlocal
