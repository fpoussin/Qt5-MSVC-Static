
git clone https://github.com/qtproject/qtbase.git
cd qtbase

cp -r ..\win32-msvc2012-static mkspecs\

mkdir build
cd build
..\configure.exe -prefix C:\Qt\5.5.0-static -platform win32-msvc2012-static -opensource -release -opengl desktop -mp -static -nomake examples -qt-libpng -qt-libjpeg -qt-zlib -qt-pcre -openssl -no-angle -no-accessibility -I C:\OpenSSL-Win32\include -L C:\OpenSSL-Win32\lib
