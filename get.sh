#!/bin/sh

pkgs=$*

for pkg in $pkgs
do
  git clone ssh://aur@aur.archlinux.org/$pkg.git
done
