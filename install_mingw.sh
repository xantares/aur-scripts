#!/bin/sh

set -e

#remove: yaourt -Rscnd mingw-w64

#yaourt -Sya mingw-w64-binutils --noconfirm
#yaourt -S mingw-w64-crt --noconfirm

function install_conflict {
  cat > /tmp/conflict.sh << EOF
#!/usr/bin/expect -f
set timeout -1
spawn yaourt -S $1
expect "Edit PKGBUILD ?"
sleep 1
send "n"
expect "Continue building $1"
sleep 1
send "Y"
expect "Continue installing $1"
sleep 1
send "Y"
expect " are in conflict. Remove "
sleep 1
send "y\r"
expect "Proceed with installation"
sleep 1
send "Y\r"
#expect "overwrite"
#sleep 1
#send "y\r"
expect eof
EOF

cat > /tmp/conflict.sh << EOF
#!/usr/bin/expect -f
spawn pacman -U $1
expect " are in conflict. Remove "
sleep 1
send "y\r"
expect "Proceed with installation"
sleep 1
send "Y\r"
expect eof
EOF

chmod a+rx /tmp/conflict.sh
/tmp/conflict.sh
}


#install_conflict mingw-w64-winpthreads
#install_conflict mingw-w64-gcc

pushd /tmp

rm -rf mingw-w64-winpthreads
yaourt -G mingw-w64-winpthreads 
pushd mingw-w64-winpthreads
#makepkg --asroot
#install_conflict mingw-w64-winpthreads-3.0.0-2-any.pkg.tar.xz
popd

rm -rf mingw-w64-gcc
yaourt -G mingw-w64-gcc 
pushd mingw-w64-gcc
makepkg --asroot
install_conflict mingw-w64-gcc-4.8.2-2-any.pkg.tar.xz
popd


yaourt -S mingw-w64-lapack --noconfirm
yaourt -S mingw-w64-libgnurx --noconfirm
yaourt -S mingw-w64-cmake --noconfirm
yaourt -S mingw-w64-libxml2 --noconfirm
yaourt -S mingw-w64-intel-tbb --noconfirm
yaourt -S mingw-w64-muparser --noconfirm



