#!/bin/sh

set -e

# sudo visudo
# Defaults timestamp_timeout=-1

# clean to avoid overwrite
rm -f /tmp/yaourt-tmp-${USER}/psp-*.xz $PWD/yaourt-tmp-${USER}/psp-*.xz

# remove all
yaourt -Rscnd psp --noconfirm || echo "already clean"

# update
yaourt -Syu --noconfirm

yaourt -S psp-binutils --noconfirm
yaourt -S psp-gcc-base --noconfirm
yaourt -S psp-sdk-base --noconfirm
yaourt -S psp-newlib --noconfirm
sudo pacman -Rdd --noconfirm psp-gcc-base
yaourt -S psp-gcc --noconfirm
sudo pacman -Rdd --noconfirm psp-sdk-base
yaourt -S psp-sdk --noconfirm

yaourt -S psp-oslib --noconfirm
yaourt -S psp-libmikmod --noconfirm
yaourt -S psp-bzip2 --noconfirm
yaourt -S psp-freetype2 --noconfirm
#yaourt -S psp-gdb --noconfirm
yaourt -S psp-libbulletml --noconfirm
yaourt -S psp-libmad --noconfirm
yaourt -S psp-sdl_gfx --noconfirm
yaourt -S psp-sdl_ttf --noconfirm
yaourt -S psp-sdl_mixer --noconfirm
yaourt -S psp-pthreads-emb --noconfirm
yaourt -S psp-sdl_image --noconfirm
yaourt -S psp-libogg --noconfirm
yaourt -S psp-libvorbis --noconfirm
yaourt -S psp-libtremor --noconfirm
yaourt -S --noconfirm psp-zziplib
yaourt -S --noconfirm psp-opengl
yaourt -S --noconfirm psp-openal

# cleanup
rm -rf /tmp/yaourt-tmp-${USER}/psp-* $PWD/yaourt-tmp-${USER}/psp-*

