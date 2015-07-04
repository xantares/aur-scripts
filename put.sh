#!/bin/sh

set -e

if test "$#" -lt 2
then
  echo "usage: $0 pkgname1 [pkgname2] \"git commit comment\""
  exit
fi

# all args except last
pkgs=${@:1:$#-1}

# comment is the last arg
for comment; do true; done

for pkg in $pkgs
do
  pushd $pkg
  rm -f *.src.tar.gz

  # push to aur3
  mkaurball -f
  aurploader --auto --keep-cookiejar

  # push to aur4
  mksrcinfo
  git commit -a -m "$comment"
  git push

  popd
done

