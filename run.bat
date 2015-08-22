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
    IF "%1"=="build-extra" (
        set EXTNAME=%2
        call tools\build_qt_extras.bat
    )

) ELSE (
    echo Available commands:
    echo build-deps : Build all dependencies for Qt ^(ICU, OpenSSL^)
    echo setup-qt : Setup Qt
    echo build-qt : build Qt
    echo build-extra [name]: build qt extension (you need to specify the name)
)

endlocal