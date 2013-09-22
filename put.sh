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
  makepkg --source --force
  aurploader --auto --keep-cookiejar
  popd
done