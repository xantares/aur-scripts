#!/bin/sh


while true
do
  file=`find /usr/lib/python3.7/site-packages/* -name "*.py"| head -n 1`
  echo "${file}"
  pkg=`pacman -Qo ${file}|sed "s|.*owned by \(.*\) .*|\\1|g"`
  echo "Updating ${pkg}"
  aurman -S --noconfirm --noedit ${pkg}
done
