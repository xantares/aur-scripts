#!/bin/sh

set -e

# sudo visudo
# Defaults timestamp_timeout=-1

function install_conflict {

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
sudo /tmp/conflict.sh
}

gpg --recv D605848ED7E69871 D9C4D26D0E604491 0223A078DBFF4B66 BB5869F064EA74AB # gettext, openssl, dbus, readline
gpg --recv C1A60EACE707FDA5 9766E084FB0F43D8 38EE757D69184620 9D5EAAF69013B842 # freetype2, pcre, xz, gnutls
gpg --recv BBE43771487328A9 # gcc

# remove all
yaourt -Rscnd mingw-w64 --noconfirm || echo "already clean"

# clean tmp to avoid overwrite
rm -f /tmp/yaourt-tmp-${USER}/mingw-w64-*.xz

# update
yaourt -Syu --noconfirm

yaourt -S mingw-w64-binutils --noconfirm
yaourt -S mingw-w64-headers-bootstrap --noconfirm
yaourt -S mingw-w64-headers --noconfirm
yaourt -S mingw-w64-gcc-base --noconfirm
yaourt -S mingw-w64-crt --noconfirm
yaourt -S mingw-w64-winpthreads --noconfirm || install_conflict /tmp/yaourt-tmp-${USER}/mingw-w64-winpthreads*.xz
yaourt -S mingw-w64-gcc --noconfirm || install_conflict /tmp/yaourt-tmp-${USER}/mingw-w64-gcc-*.xz

yaourt -S mingw-w64-exprtk-git --noconfirm
yaourt -S mingw-w64-dlfcn  --noconfirm
yaourt -S mingw-w64-libsvm --noconfirm
yaourt -S mingw-w64-libgnurx --noconfirm
yaourt -S mingw-w64-muparser --noconfirm
yaourt -S mingw-w64-lpsolve --noconfirm
yaourt -S mingw-w64-fann --noconfirm
yaourt -S mingw-w64-intel-tbb --noconfirm
yaourt -S mingw-w64-libmixmod --noconfirm
yaourt -S mingw-w64-nlopt --noconfirm
yaourt -S mingw-w64-libxml2 --noconfirm
yaourt -S mingw-w64-lapack --noconfirm
yaourt -S mingw-w64-arpackpp --noconfirm
yaourt -S mingw-w64-hmat-oss --noconfirm
yaourt -S mingw-w64-fftw --noconfirm
yaourt -S mingw-w64-python-bin --noconfirm
yaourt -S mingw-w64-python2-bin --noconfirm
yaourt -S mingw-w64-python35-bin --noconfirm
yaourt -S mingw-w64-boost --noconfirm --tmp $PWD
yaourt -S mingw-w64-agrum --noconfirm

yaourt -S mingw-w64-libzip --noconfirm
yaourt -S mingw-w64-qt4 --noconfirm --tmp $PWD
yaourt -S mingw-w64-qscintilla-qt4 --noconfirm
yaourt -S mingw-w64-qwt-qt4 --noconfirm
yaourt -S mingw-w64-iistaskpanel --noconfirm


yaourt -S mingw-w64-freetype2-bootstrap --noconfirm
yaourt -S mingw-w64-cairo-bootstrap --noconfirm
yaourt -S mingw-w64-freetype2 --noconfirm || install_conflict /tmp/yaourt-tmp-${USER}/mingw-w64-freetype2*.xz
yaourt -S mingw-w64-cairo --noconfirm --tmp $PWD || install_conflict $PWD/yaourt-tmp-${USER}/mingw-w64-cairo*.xz
#yaourt -S mingw-w64-qt5-base --noconfirm --tmp $PWD
yaourt -S mingw-w64-qt5-base-static --noconfirm --tmp $PWD
yaourt -S mingw-w64-qt5-xmlpatterns --noconfirm --tmp $PWD
yaourt -S mingw-w64-qt5-declarative --noconfirm --tmp $PWD
yaourt -S mingw-w64-qt5-tools --noconfirm --tmp $PWD
yaourt -S mingw-w64-qwt --noconfirm

yaourt -S mingw-w64-paraview --noconfirm --tmp $PWD
