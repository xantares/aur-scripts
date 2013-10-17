#!/bin/sh

set -e

#rm -rf mingw-w64-toolchain*

#_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

#mkdir -p mingw-w64-toolchain/usr/lib/gcc
#mkdir -p mingw-w64-toolchain/usr/bin
#mkdir -p mingw-w64-toolchain/usr/share
#cp -r /usr/share/mingw mingw-w64-toolchain/usr/share
#for _arch in "$_architectures"
#do
#  mkdir -p mingw-w64-toolchain/usr
#  cp -r /usr/lib/gcc/$_arch mingw-w64-toolchain/usr/lib/gcc
#  cp -r /usr/bin/$_arch-* mingw-w64-toolchain/usr/bin
#  cp -r /usr/$_arch mingw-w64-toolchain/usr/
#done

#tar czf mingw-w64-toolchain.tar.gz mingw-w64-toolchain/*


rm -rf mingw-w64-toolchain*
mkdir mingw-w64-toolchain
for pkgname in mingw-w64-headers mingw-w64-crt mingw-w64-winpthreads mingw-w64-gcc mingw-w64-lapack mingw-w64-cmake mingw-w64-libxml2 mingw-w64-libgnurx mingw-w64-intel-tbb mingw-w64-dlfcn mingw-w64-gettext mingw-w64-termcap mingw-w64-libiconv mingw-w64-zlib
do
  echo "-- $pkgname"
  files=`pacman -Ql $pkgname | cut -d " " -f 2`
  for file in $files
  do
    if ! test -d "$file"
    then
      cp --parents $file mingw-w64-toolchain
    fi
  done
done

tar czf mingw-w64-toolchain.tar.gz mingw-w64-toolchain/*

