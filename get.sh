#!/bin/sh

pkgs=$*

for pkg in $pkgs
do
  git clone ssh://aur@aur4.archlinux.org/$pkg.git
  #yaourt -G $pkg --noconfirm
done
