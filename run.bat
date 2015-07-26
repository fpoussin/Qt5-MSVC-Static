@echo off
setlocal

IF NOT "%1"=="" (

    IF "%1"=="setup-qt" (
        call tools\setup_qt.bat
    )
    IF "%1"=="build-qt" (
        call tools\build_qt.bat
    )
    IF "%1"=="build-deps" (
        call tools\build_icu.bat
        call tools\build_openssl.bat
    )

) ELSE (
    echo Available commands:
    echo build-deps : Build all dependencies for Qt
    echo setup-qt : build ICU and Setup Qt
    echo build-qt : build Qt
)

endlocal