# **Qt5-MSVC-Static**

Set of tools to build Qt5 static libs on Windows.

**Dependencies**

 - MSVC 2015 with WDK 8.1 (Community works fine)
 - Qt 5.5.0+ sources (untested with previous versions, might work from 5.4.0)
 - Python 2.7 (https://www.python.org/downloads/windows/)
 - Perl (http://strawberryperl.com/)
 - Ruby (http://rubyinstaller.org/downloads/)
 - MSYS Git (https://msysgit.github.io)
 - OpenSSL 1.0.2d
 - ICU 55.1

Make sure *Python*, *Perl* and *Git (MSYS)* are all in the *PATH*.

You can check the official documentation here: 
http://doc.qt.io/qt-5/windows-requirements.html
http://doc.qt.io/qt-5/windows-building.html

**Usage**

First we need to download and extract the dependencies and Qt.
Qt: 
 - http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtbase-opensource-src-5.5.0.zip
 - http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qt5-opensource-src-5.5.0.zip
 - https://www.openssl.org/source/openssl-1.0.2d.tar.gz
 - http://download.icu-project.org/files/icu4c/55.1/icu4c-55_1-src.zip

Extract these in the repo, check the folder names are correct in *tools/options.bat*

Open a VS command prompt in the repo's root.  
The link for the prompt is "*VS2015 x86 Native Tools Command Prompt.lnk*"

You will need to run *run.bat* from the VS command prompt.

Run these commands in the following order to build Qt:
 - run.bat build-deps
 - run.bat setup-qt
 - run.bat build-qt

**Configuration**

Only release libs are enabled by default. 
You can add the debug libs or use the official sdk libs for debugging.

By default I only enabled a rather restricted set of modules.
Here is the config output:

    QMAKESPEC...................win32-msvc2015 (commandline)
    Architecture................i386, features: sse sse2
    Host Architecture...........i386, features: sse sse2
    Maketool....................nmake
    Debug.......................no
    Force debug info............no
    C++11 support...............auto
    Link Time Code Generation...no
    Accessibility support.......no
    RTTI support................yes
    SSE2 support................yes
    SSE3 support................yes
    SSSE3 support...............yes
    SSE4.1 support..............yes
    SSE4.2 support..............yes
    AVX support.................yes
    AVX2 support................yes
    NEON support................no
    OpenGL support..............yes
    Large File support..........yes
    NIS support.................no
    Iconv support...............no
    Evdev support...............no
    Mtdev support...............no
    Inotify support.............no
    eventfd(7) support..........no
    Glib support................no
    CUPS support................no
    OpenVG support..............no
    SSL support.................yes
    OpenSSL support.............yes
    libproxy support............no
    Qt D-Bus support............no
    Qt Widgets module support...yes
    Qt GUI module support.......yes
    QML debugging...............yes
    DirectWrite support.........no
    Use system proxies..........no
    
    QPA Backends:
        GDI.....................yes
        Direct2D................no
    
    Third Party Libraries:
        ZLIB support............qt
        GIF support.............yes
        JPEG support............yes
        PNG support.............yes
        FreeType support........yes
        Fontconfig support......no
        HarfBuzz support........qt
        PCRE support............qt
        ICU support.............yes
        ANGLE...................no
        Dynamic OpenGL..........yes
    
    Styles:
        Windows.................yes
        Windows XP..............yes
        Windows Vista...........yes
        Fusion..................yes
        Windows CE..............no
        Windows Mobile..........no
    
    Sql Drivers:
        ODBC....................no
        MySQL...................no
        OCI.....................no
        PostgreSQL..............no
        TDS.....................no
        DB2.....................no
        SQLite..................yes (qt)
        SQLite2.................no
        InterBase...............no

You can check the official configuration guide here:
http://doc.qt.io/qt-5/configure-options.html
