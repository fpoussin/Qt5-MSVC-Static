@echo off
setlocal

set SSLRELEASE=1.0.x
IF NOT v%SSLVER:1.1.v=%==v%SSLVER%l set SSLRELEASE=1.1.x

echo Configuring OpenSSL %SSLRELEASE%...
IF exist %SSLINSTALLDIR% (
    echo OpenSSL already installed!
    echo Delete or rename %SSLINSTALLDIR% if you want to rebuild it.
) ELSE (
    IF exist %SSLBUILDDIR% (

        cd %SSLBUILDDIR%

        IF "%SSLRELEASE%" == "1.1.x" (

            rd build /s /q
            md build
            cd build

            start /W /BELOWNORMAL "Configuring OpenSSL..." perl ..\Configure VC-WIN32 no-asm enable-static-engine no-shared --prefix=%SSLINSTALLDIR%

            echo Building OpenSSL...
            start /W /BELOWNORMAL "Building OpenSSL..." nmake clean all
            IF %errorlevel% NEQ 0 exit /b %errorlevel%

            echo Installing OpenSSL...
            start /W /BELOWNORMAL "Installing OpenSSL..." nmake install
            IF %errorlevel% NEQ 0 exit /b %errorlevel%

        ) ELSE (

            start /W /BELOWNORMAL "Configuring OpenSSL..." perl Configure VC-WIN32 no-asm enable-static-engine --prefix=%SSLINSTALLDIR%
            start /W /BELOWNORMAL "Configuring OpenSSL - 2..." ms\do_nt ^&^& exit

            echo Building OpenSSL...
            start /W /BELOWNORMAL "Building OpenSSL..." nmake -f ms\nt.mak clean all
            IF %errorlevel% NEQ 0 exit /b %errorlevel%

            echo Installing OpenSSL...
            start /W /BELOWNORMAL "Installing OpenSSL..." nmake -f ms\nt.mak install
            IF %errorlevel% NEQ 0 exit /b %errorlevel%

        )

    ) ELSE (

        echo Could not find OpenSSL sources in %SSLBUILDDIR%
        exit /b 1
    )
)

endlocal
