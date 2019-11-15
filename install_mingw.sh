#!/bin/sh

set -e

# sudo visudo
# Defaults timestamp_timeout=-1

# remove all
sudo pacman -Rscnd mingw-w64 || echo "already clean"

# update
sudo pacman -Syu

aurman -S --noconfirm --noedit --pgp_fetch mingw-w64-binutils
aurman -S --noconfirm --noedit --pgp_fetch mingw-w64-headers
aurman -S --noconfirm --noedit mingw-w64-headers-bootstrap
aurman -S --noconfirm --noedit --pgp_fetch mingw-w64-gcc-base
aurman -S --noconfirm --noedit mingw-w64-crt
aurman -S --noconfirm --noedit mingw-w64-winpthreads
aurman -S --noconfirm --noedit mingw-w64-gcc

# cleanup
rm -rf ${HOME}/.cache/aurman/mingw-w64-*
