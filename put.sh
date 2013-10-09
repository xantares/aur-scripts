#!/bin/sh

if test "$#" -lt 1
then
  pkgs=`cat package_list.txt`
else
  pkgs=$*
fi

for pkg in $pkgs
do
  pushd $pkg
  rm -f *.src.tar.gz
  makepkg --source --force
  aurploader --auto --keep-cookiejar
  popd
done