#!/bin/sh

set -e

#remove all: yaourt -Rscnd mingw-w64

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
/tmp/conflict.sh
}

yaourt -Syu --noconfirm
yaourt -S mingw-w64-gcc --noconfirm
yaourt -S mingw-w64-dlfcn  --noconfirm
yaourt -S mingw-w64-muparser --noconfirm
yaourt -S mingw-w64-libsvm --noconfirm
yaourt -S mingw-w64-fann --noconfirm
yaourt -S mingw-w64-libgnurx --noconfirm
yaourt -S mingw-w64-intel-tbb --noconfirm
yaourt -S mingw-w64-mixmod --noconfirm
yaourt -S mingw-w64-libxml2 --noconfirm
yaourt -S mingw-w64-lapack --noconfirm
yaourt -S mingw-w64-fftw --noconfirm
yaourt -S mingw-w64-agrum --noconfirm
yaourt -S mingw-w64-python-bin --noconfirm
yaourt -S mingw-w64-python2-bin --noconfirm
yaourt -S mingw-w64-python26-bin --noconfirm
yaourt -S mingw-w64-boost --noconfirm
#yaourt -S mingw-w64-qt4 --noconfirm
yaourt -G mingw-w64-qt4 --noconfirm && cd mingw-w64-qt4 && makepkg --asroot && pacman -U mingw-w64-qt4-*-any.pkg.tar.xz && rm -r src 
yaourt -S mingw-w64-qscintilla --noconfirm
yaourt -S mingw-w64-qwt5 --noconfirm
yaourt -S mingw-w64-iistaskpanel --noconfirm

