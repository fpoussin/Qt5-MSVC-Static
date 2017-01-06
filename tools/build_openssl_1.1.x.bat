@echo off
setlocal

echo Configuring OpenSSL...
IF exist %SSLINSTALLDIR% (
    echo OpenSSL already installed!
    echo Delete or rename %SSLINSTALLDIR% if you want to rebuild it.
) ELSE (
    IF exist %SSLBUILDDIR% (

        cd %SSLBUILDDIR%
        rd build /s /q
        md build
        cd build

        start /W /BELOWNORMAL "Configuring OpenSSL..." perl ..\Configure VC-WIN32 no-asm enable-static-engine no-shared --prefix=%SSLINSTALLDIR%

        echo Building OpenSSL...
        start /W /BELOWNORMAL "Building OpenSSL..." jom clean all
        IF %errorlevel% NEQ 0 exit /b %errorlevel%

        echo Installing OpenSSL...
        start /W /BELOWNORMAL "Installing OpenSSL..." jom install
        IF %errorlevel% NEQ 0 exit /b %errorlevel%

    ) ELSE (

        echo Could not find OpenSSL sources in %SSLBUILDDIR%
        exit /b 1
    )
)

endlocal
