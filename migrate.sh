#!/bin/sh

set -e

pkgs=$*

for pkg in $pkgs
do
  git clone ssh://aur@aur4.archlinux.org/$pkg.git
  yaourt -G $pkg --noconfirm --aur-url https://aur.archlinux.org
  pushd $pkg
  git add *
  mksrcinfo
  git add .SRCINFO
  git commit -a -m "Initial import"||echo "nop"
  git push
  popd
done
