#!/usr/bin/env sh
set -e

cd ~/.vim

sudo apt install --yes myrepos git vim vim-gtk3 exuberant-ctags build-essential cmake python3-dev
mr -j 5 update

cd ~/.vim/pack/plugins/start/YouCompleteMe
git submodule update -j 5 --init --recursive
python3 install.py
cd -
