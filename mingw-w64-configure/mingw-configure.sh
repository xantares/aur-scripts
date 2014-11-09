#!/bin/sh
mingw_c_flags="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
export CFLAGS="$mingw_c_flags -mms-bitfields"
export CXXFLAGS="$mingw_c_flags"
../configure --host=@TRIPLE@ --build="$CHOST" --prefix=/usr/@TRIPLE@ --enable-shared --enable-static "$@"

