#!/usr/bin/env sh
# Checkout and install vim from source into homedir on Ubuntu.
# Installs vim with support for gtk3, python, etc.
# Installs vim so that the YouCompleteMe plugin will work.
set -e

cd ~/.vim

sudo apt-get -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
                        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
                        libcairo2-dev libx11-dev libxpm-dev libxt-dev \
                        python-dev python3-dev ruby-dev lua5.1 lua5.1-dev \
                        libperl-dev git myrepos
sudo apt-get -y remove vim vim-runtime gvim vim-tiny vim-common \
                       vim-gui-common vim-nox

mr update

mkdir src
cd src
git clone https://github.com/vim/vim.git
cd vim

git checkout `git tag | ag '^v' | tail -n 1`

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk3 --enable-cscope --prefix=$HOME
make
make install

# This gets uninstalled by the apt-get remove command above, add it back.
sudo apt-get install -y ubuntu-minimal

# FIXME: nodejs and npm need to be installed and configured.
cd ../../pack/plugins/start/YouCompleteMe/
sudo apt-get -y install build-essential cmake python-dev python3-dev golang-go
git submodule update --init --recursive
./install.py --clang-completer --tern-completer --gocode-completer