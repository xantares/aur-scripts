#!/bin/sh

set -e

#remove: yaourt -Rscnd mingw-w64

yaourt -Sya mingw-w64-binutils --noconfirm
yaourt -S mingw-w64-crt --noconfirm

yaourt -S mingw-w64-winpthreads
yaourt -S mingw-w64-gcc









yaourt -S mingw-w64-lapack --noconfirm
yaourt -S mingw-w64-libgnurx --noconfirm
yaourt -S mingw-w64-cmake --noconfirm
yaourt -S mingw-w64-libxml2 --noconfirm
yaourt -S mingw-w64-intel-tbb --noconfirm
yaourt -S mingw-w64-muparser --noconfirm



