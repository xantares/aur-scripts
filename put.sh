#!/bin/sh

set -e

if test "$#" -lt 2
then
  echo "usage: $0 pkgname \"git commit comment\""
  exit
else
  pkg="$1"
  comment="$2"
fi

pushd $pkg
rm -f *.src.tar.gz

# push to aur3
mkaurball -f
aurploader --auto --keep-cookiejar

# push to aur4
mksrcinfo
git commit -a -m "$comment"
git push

