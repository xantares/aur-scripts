#!/bin/sh

set -e

if test "$#" -lt 1
then
  pkgs=`cat package_list.txt`
else
  pkgs=$*
fi

for pkg in $pkgs
do
  git clone ssh://aur@aur4.archlinux.org/$pkg.git
  yaourt -G $pkg --noconfirm
  pushd $pkg
  git add *
  mksrcinfo
  git add .SRCINFO
  git commit -a -m "Initial import"||echo "nop"
  git push
  popd
done
