#!/bin/bash

export CPP=""
export CC="cl"
export CXX="cl"
export LD="link"
export CFLAGS="-MP -Gy -GL -MT -O1 -DU_CHARSET_IS_UTF8"
export CXXFLAGS=$CFLAGS
export CPPFLAGS=$CFLAGS
export LDFLAGS="-NOLOGO -DYNAMICBASE -NXCOMPAT -OPT:ICF -OPT:REF -LTCG"
export MAKE="nmake"
export PATH=$UNIXPATH

ICU_UNIX=$(echo $ICUINSTALLDIR | sed 's|\\|/|g')

echo "CPP=$CPP CC=$CC CXX=$CXX CPPFLAGS=$CPPFLAGS CFLAGS=$CFLAGS CXXFLAGS=$CXXFLAGS LDFLAGS=$LDFLAGS MAKE=$MAKE"
echo "Install path: $ICU_UNIX"

bash ../source/configure -prefix=$ICU_UNIX --enable-static --disable-shared
