@echo off
setlocal

IF NOT "%1"=="" (
    IF "%1"=="setup" (
        call tools\setup.bat
    )
    IF "%1"=="build" (
        call tools\build.bat
    )

) ELSE (
    echo Available commands:
    echo setup : build ICU and Setup Qt
    echo build : build Qt
)

endlocal