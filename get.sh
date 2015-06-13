#!/bin/sh

if test "$#" -lt 1
then
  pkgs=`cat package_list.txt`
else 
  pkgs=$1
fi

for pkg in $pkgs
do
  git clone ssh://aur@aur4.archlinux.org/$pkg.git
  #yaourt -G $pkg --noconfirm
done
