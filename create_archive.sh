#!/bin/sh

set -e

arch=x86_64

rm -rf mingw-w64-$arch*
mkdir mingw-w64-$arch
for pkgname in mingw-w64-binutils mingw-w64-headers mingw-w64-crt mingw-w64-winpthreads mingw-w64-gcc mingw-w64-lapack mingw-w64-cmake mingw-w64-libxml2 mingw-w64-libgnurx mingw-w64-dlfcn mingw-w64-gettext mingw-w64-termcap mingw-w64-libiconv mingw-w64-zlib mingw-w64-muparser mingw-w64-libsvm mingw-w64-fftw
do
  echo "-- $pkgname"
  files=`pacman -Ql $pkgname | cut -d " " -f 2`
  for file in $files
  do
    if ! test -d "$file"
    then
      cp --parents $file mingw-w64-$arch
    fi
  done
done

# only static
rm mingw-w64-$arch/usr/*-w64-mingw32/bin/*.dll
rm mingw-w64-$arch/usr/*-w64-mingw32/lib/*.dll.a

echo "-- archive..."
tar czf mingw-w64-$arch.tar.gz mingw-w64-$arch/*

