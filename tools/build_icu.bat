@echo off
setlocal

IF exist %ICUINSTALLDIR% (
    echo ICU already installed!
    echo Delete or rename %ICUINSTALLDIR% if you want to rebuild it.
) ELSE (

    IF exist %ICUBUILDDIR% (

        cd %ICUBUILDDIR%
        rd build /s /q
        md build
        cd build

        echo Configuring ICU...
        copy /Y %STARTDIR%\tools\config.guess ..\source\config.guess
        copy /Y ..\source\config\mh-msys-msvc ..\source\config\mh-unknown
        start /W /BELOWNORMAL "Configuring ICU..." bash %STARTDIR%/tools/setup_icu.sh

        echo Building ICU...
        start /W /BELOWNORMAL "Building ICU..." make -j4
        IF %errorlevel% NEQ 0 exit /b %errorlevel%

        echo Installing ICU...
        start /W /BELOWNORMAL "Installing ICU..." make install
        IF %errorlevel% NEQ 0 exit /b %errorlevel%
        
    ) ELSE (

        echo Could not find ICU sources in %ICUBUILDDIR%
        exit /b 1
    )
)

endlocal
