#!/bin/sh

if test "$#" -lt 1
then
  pkgs=`cat package_list.txt`
else 
  pkgs=$1
fi

for pkg in $pkgs
do
  yaourt -G $pkg
done
