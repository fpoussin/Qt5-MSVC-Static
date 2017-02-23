@echo off
setlocal

call tools\options.bat

IF NOT "%1"=="" (

    IF "%1"=="download" (
        call tools\download.bat
    )
    IF "%1"=="setup" (
        call tools\setup_qt.bat
    )
    IF "%1"=="build" (
        call tools\build_qt.bat
    )
    IF "%1"=="icu" (
        call tools\build_icu.bat
    )
    IF "%1"=="openssl" (
        call tools\build_openssl.bat
    )
    IF "%1"=="deps" (
        call tools\build_icu.bat
        call tools\build_openssl.bat
    )
    IF "%1"=="extra" (
        set EXTNAME=%2
        call tools\build_qt_extras.bat
    )

) ELSE (
    echo Available commands:
    echo download: Download and extracts required sources
    echo deps : Build all dependencies for Qt ^(ICU, OpenSSL^)
    echo icu : Build icu ^(Optional^)
    echo openssl : Build OpenSSL
    echo setup : Setup Qt
    echo build : build Qt
    echo extra [name]: Download and build qt extension ^(you need to specify the name^)
)

endlocal
