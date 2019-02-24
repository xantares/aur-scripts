#!/bin/sh

set -e

if test "$#" -lt 2
then
  echo "usage: $0 pkgname pkgver"
  exit
fi

pkgname=$1
pkgver=$2

if ! test -d ${pkgname}
then
  echo "${pkgname} do not exist"
  exit
fi

# update pkgver
oldver=`cat ${pkgname}/PKGBUILD|grep 'pkgver=' |sed "s|pkgver=\(.*\)|\\1|g"`
echo "-- Updating ${pkgname}-${oldver} => ${pkgver}"
sed -i "s|pkgver=${oldver}|pkgver=${pkgver}|g" ${pkgname}/PKGBUILD

# update checksum
pushd ${pkgname}
makepkg -g > /tmp/checksum
popd
checksum_type=`cat /tmp/checksum | grep 'sums='| sed "s|\(.*\)sums=.*|\\1|g"`
checksum=`cat /tmp/checksum`
sed -i "s|${checksum_type}sums=(.*)|${checksum}|g" ${pkgname}/PKGBUILD

# show diff
pushd ${pkgname}
git diff
popd
echo "-- If ok: ./put.sh ${pkgname} ${pkgver}"
