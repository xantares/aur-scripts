#!/bin/sh

set -e

# sudo visudo
# Defaults timestamp_timeout=-1

# remove all
aurman -Rscnd psp || echo "already clean"

# update
aurman -S --noconfirm --noedit psp-binutils
aurman -S --noconfirm --noedit psp-gcc-base
aurman -S --noconfirm --noedit psp-sdk-base
aurman -S --noconfirm --noedit psp-newlib
aurman -S --noconfirm --noedit psp-gcc
aurman -S --noconfirm --noedit psp-sdk

aurman -S --noconfirm --noedit psp-oslib
aurman -S --noconfirm --noedit psp-libmikmod
aurman -S --noconfirm --noedit psp-bzip2
aurman -S --noconfirm --noedit psp-freetype2
#aurman -S --noconfirm --noedit psp-gdb
aurman -S --noconfirm --noedit psp-libbulletml
aurman -S --noconfirm --noedit psp-libmad
aurman -S --noconfirm --noedit psp-sdl_gfx
aurman -S --noconfirm --noedit psp-sdl_ttf
aurman -S --noconfirm --noedit psp-sdl_mixer
aurman -S --noconfirm --noedit psp-pthreads-emb
aurman -S --noconfirm --noedit psp-sdl_image
aurman -S --noconfirm --noedit psp-libogg
aurman -S --noconfirm --noedit psp-libvorbis
aurman -S --noconfirm --noedit psp-libtremor
aurman -S --noconfirm --noedit psp-zziplib
aurman -S --noconfirm --noedit psp-opengl
aurman -S --noconfirm --noedit psp-openal

# cleanup
rm -rf ${HOME}/.cache/aurman/psp-*
