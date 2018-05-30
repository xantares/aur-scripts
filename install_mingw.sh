#!/bin/sh

set -e

# sudo visudo
# Defaults timestamp_timeout=-1

# remove all
yaourt -Rscnd mingw-w64 || echo "already clean"

# update
yaourt -Syu

aurman -S --noconfirm --noedit --pgp_fetch mingw-w64-binutils
aurman -S --noconfirm --noedit --pgp_fetch mingw-w64-headers
aurman -S --noconfirm --noedit mingw-w64-headers-bootstrap
aurman -S --noconfirm --noedit --pgp_fetch mingw-w64-gcc-base
aurman -S --noconfirm --noedit mingw-w64-crt
aurman -S --noconfirm --noedit mingw-w64-winpthreads
aurman -S --noconfirm --noedit mingw-w64-gcc

aurman -S --noconfirm --noedit mingw-w64-dlfcn
aurman -S --noconfirm --noedit mingw-w64-libsvm
aurman -S --noconfirm --noedit mingw-w64-libgnurx
aurman -S --noconfirm --noedit mingw-w64-muparser
aurman -S --noconfirm --noedit mingw-w64-lpsolve
aurman -S --noconfirm --noedit mingw-w64-fann
aurman -S --noconfirm --noedit mingw-w64-intel-tbb
aurman -S --noconfirm --noedit mingw-w64-libmixmod
aurman -S --noconfirm --noedit mingw-w64-nlopt
aurman -S --noconfirm --noedit --pgp_fetch mingw-w64-libxml2
aurman -S --noconfirm --noedit mingw-w64-lapack
aurman -S --noconfirm --noedit mingw-w64-arpackpp
aurman -S --noconfirm --noedit mingw-w64-hmat-oss
aurman -S --noconfirm --noedit mingw-w64-fftw
aurman -S --noconfirm --noedit mingw-w64-python-bin
aurman -S --noconfirm --noedit mingw-w64-python2-bin
aurman -S --noconfirm --noedit mingw-w64-python35-bin
aurman -S --noconfirm --noedit mingw-w64-boost
aurman -S --noconfirm --noedit mingw-w64-agrum

aurman -S --noconfirm --noedit mingw-w64-libzip
aurman -S --noconfirm --noedit --pgp_fetch mingw-w64-qt4
aurman -S --noconfirm --noedit mingw-w64-qscintilla-qt4
aurman -S --noconfirm --noedit mingw-w64-qwt-qt4
aurman -S --noconfirm --noedit mingw-w64-iistaskpanel

aurman -S --noconfirm --noedit --pgp_fetch mingw-w64-freetype2-bootstrap
aurman -S --noconfirm --noedit mingw-w64-cairo-bootstrap
aurman -S --noconfirm --noedit mingw-w64-harfbuzz
aurman -S --noconfirm --noedit mingw-w64-freetype2
aurman -S --noconfirm --noedit mingw-w64-rust-bin
aurman -S --noconfirm --noedit mingw-w64-lzo mingw-w64-librsvg mingw-w64-poppler
aurman -S --noconfirm --noedit mingw-w64-cairo

aurman -S --noconfirm --noedit mingw-w64-qwt
aurman -S --noconfirm --noedit --pgp_fetch mingw-w64-paraview

# cleanup
rm -rf ${HOME}/.cache/aurman/mingw-w64-*
