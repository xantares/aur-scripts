#!/bin/sh

set -e

rm -rf mingw-w64-toolchain*
mkdir mingw-w64-toolchain
for pkgname in mingw-w64-binutils mingw-w64-headers mingw-w64-crt mingw-w64-winpthreads mingw-w64-gcc mingw-w64-lapack mingw-w64-cmake mingw-w64-libxml2 mingw-w64-libgnurx mingw-w64-dlfcn mingw-w64-gettext mingw-w64-termcap mingw-w64-win-iconv mingw-w64-zlib
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

echo "-- archive..."
tar czf mingw-w64-toolchain.tar.gz mingw-w64-toolchain/*

