#!/bin/sh

if test "$#" -lt 1
then
  pkgs=`cat package_list.txt`
else
  pkgs=$*
fi

for pkg in $pkgs
do
  echo "-- $pkg"
  rm -rf $pkg/src
  rm -rf $pkg/pkg
  rm -f $pkg/*.xz
done
