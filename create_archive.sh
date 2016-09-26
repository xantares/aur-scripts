#!/bin/sh

set -e

arch=`uname -m`

rm -rf mingw-w64-$arch*
mkdir mingw-w64-$arch
for pkgname in mingw-w64-binutils mingw-w64-headers mingw-w64-crt mingw-w64-winpthreads mingw-w64-gcc mingw-w64-exprtk-git mingw-w64-xz mingw-w64-blas mingw-w64-lapack mingw-w64-cmake mingw-w64-libiconv mingw-w64-libxml2 mingw-w64-libgnurx mingw-w64-dlfcn mingw-w64-zlib mingw-w64-muparser mingw-w64-intel-tbb mingw-w64-boost mingw-w64-python-bin mingw-w64-python2-bin mingw-w64-python34-bin mingw-w64-python33-bin mingw-w64-fftw mingw-w64-libmixmod mingw-w64-agrum mingw-w64-fann mingw-w64-libsvm mingw-w64-cblas mingw-w64-hmat-oss mingw-w64-nlopt mingw-w64-arpack mingw-w64-arpack++ mingw-w64-libzip mingw-w64-libpng mingw-w64-dbus mingw-w64-libjpeg-turbo mingw-w64-libtiff mingw-w64-openssl mingw-w64-expat mingw-w64-sqlite mingw-w64-qt4 mingw-w64-qscintilla-qt4 mingw-w64-qwt mingw-w64-iistaskpanel
do
  echo "-- $pkgname"
  files=`pacman -Ql $pkgname | cut -d " " -f 2`
  for file in $files
  do
    if ! test -d "$file"
    then
      cp --parents $file mingw-w64-$arch || echo "ignore $file"
    fi
  done
done

echo "-- archive..."
tar czf mingw-w64-$arch.tar.gz mingw-w64-$arch/*

