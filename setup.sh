#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

ln -s ${THIS_DIR}/.bashrc ~/.bashrc
ln -s ${THIS_DIR}/.bash_profile ~/.bash_profile
ln -s ${THIS_DIR}/.czrc ~/.czrc
ln -s ${THIS_DIR}/.gitconfig ~/.gitconfig
ln -s ${THIS_DIR}/.vimrc ~/.vimrc
ln -s ${THIS_DIR}/.vim ~/.vim
ln -s ${THIS_DIR}/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ${THIS_DIR}/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
