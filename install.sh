#!/usr/bin/env sh
# Checkout and install vim from source into homedir on Ubuntu.
# Installs vim with support for gtk3, python, etc.
# Installs vim so that the YouCompleteMe plugin will work.
set -e

cd ~/.vim

sudo apt-get -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
                        libgtk-3-dev libatk1.0-dev libbonoboui2-dev \
                        libcairo2-dev libx11-dev libxpm-dev libxt-dev \
                        python-dev python3-dev ruby-dev lua5.1 lua5.1-dev \
                        libperl-dev git myrepos python3-venv
sudo apt-get -y remove vim vim-runtime gvim vim-tiny vim-common \
                       vim-gui-common vim-nox

mr update

mkdir src
cd src
git clone https://github.com/vim/vim.git
cd vim

git checkout `git tag | ag '^v' | tail -n 1`

./configure --prefix=/usr/local \
            --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk3 \
            --enable-cscope
make
sudo make install

# This gets uninstalled by the apt-get remove command above, add it back.
sudo apt-get install -y ubuntu-minimal

# FIXME: nodejs and npm need to be installed and configured.
cd ../../pack/plugins/start/YouCompleteMe/
sudo apt-get -y install build-essential cmake python-dev python3-dev
git submodule update --init --recursive
./install.py

cd ~/.vim
./install_gvim_desktop_file.sh
