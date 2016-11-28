#!/bin/sh

set -e

pkgs=$*

#if ! test -d aur-mirror
#then
#  #git clone --depth 1 git://pkgbuild.com/aur-mirror.git
#  git clone --depth 1 https://github.com/felixonmars/aur3-mirror.git aur-mirror
#fi

for pkg in $pkgs
do
  mkdir -p aur-mirror
  git clone https://github.com/aur-archive/$pkg.git aur-mirror/${pkg}
  if test -f "aur-mirror/$pkg/PKGBUILD"
  then
    git clone ssh://aur@aur.archlinux.org/$pkg.git
    cp aur-mirror/$pkg/* $pkg
    pushd $pkg
    mksrcinfo
    git add * .SRCINFO
    git commit -a -m "Initial import"
    git push
    popd
  else
    echo "$pkg does not exist"
  fi
done
