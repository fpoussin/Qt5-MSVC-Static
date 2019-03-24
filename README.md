# **Qt5-MSVC-Static**

Set of tools to build Qt5 static libs on Windows.

## Dependencies

 - MSVC 2013-2017 with WDK 8.1/10+ (Community edition works fine)
 - Qt 5.8.0+ sources (Works with previous version with minor edits)
 - Python 2.7 (https://www.python.org/downloads/windows/) (for Qt)
 - Perl (http://strawberryperl.com/) (for OpenSSL)
 - OpenSSL 1.0.x

Make sure *Python*, *Perl* are all in the *PATH* or add them to *PATH* in options.bat  

**NTFS** case sensitivity needs to be turned **OFF** in the parent folder before cloning.  
You can check with this command:  
```
fsutil file queryCaseSensitiveInfo .
```
If you need to disable it:
```
fsutil file setCaseSensitiveInfo . disable
```

You can check the official documentation here:  
http://doc.qt.io/qt-5/windows-requirements.html  
http://doc.qt.io/qt-5/windows-building.html  

## Usage

First, we need to check the folder names are correct in *tools/options.bat*  

Open a VS command prompt in the repo's root.  
The links for the prompts are "*VS2017_Win32/64*"

You will need to run *qt.bat* from the VS command prompt.

Run these commands in the following order to build Qt:
 - qt download
 - qt openssl
 - qt setup
 - qt build

## Additional Qt modules

Those can be downloaded and installed by the script.  
If you want to install extra Qt modules like qtscript or webkit:
- Run this command: *qt extra [module-name]*
- You need to run it once per module

You obviously have to do that after installing Qt.
Modules can be found here: http://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/

## Configuration

Only release libs are enabled by default. 
You can add the debug libs or use the official sdk libs for debugging.
You can add extra build options for Qt by editing the *EXTRABUILDOPTIONS* var in options.bat


You can check the official configuration guide here:
http://doc.qt.io/qt-5/configure-options.html
