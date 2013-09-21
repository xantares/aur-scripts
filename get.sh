#!/bin/sh

pkgs=`cat package_list.txt`
for pkg in $pkgs
do
  yaourt -G $pkg
done