@echo off
setlocal

call tools\options.bat

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
        start /W /BELOWNORMAL "Configuring ICU..." bash %STARTDIR%/tools/setup_icu.sh
        
        echo Building ICU...
        start /W /BELOWNORMAL "Building ICU..." make
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