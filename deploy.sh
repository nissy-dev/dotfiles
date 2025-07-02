#!/usr/bin/env bash

# -u: Fail on when existing unset variables
# -e -o pipefail: Fail on when happening command errors
set -ueo pipefail

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
mkdir -p ~/.config

ln -sfnv $SCRIPT_DIR/.vim ~/.vim
ln -sfnv $SCRIPT_DIR/.gitconfig ~/.gitconfig
ln -sfnv $SCRIPT_DIR/.gitignore_global ~/.gitignore_global
ln -sfnv $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sfnv $SCRIPT_DIR/.zshrc ~/.zshrc

if [ "$(uname)" = 'Darwin' ]; then
  # for mac
  if [ -d ~/Library/Application\ Support/Code/User ]; then
    touch ~/Library/Application\ Support/Code/User/settings.json
    ln -sfnv $SCRIPT_DIR/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
    touch ~/Library/Application\ Support/Code/User/keybindings.json
    ln -sfnv $SCRIPT_DIR/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
  fi
else
  # for linux
  ln -sfnv $SCRIPT_DIR/brew/linuxbrew_init.sh ~/linuxbrew_init.sh
  if [ -d ~/.config/Code/User ]; then
    touch $SCRIPT_DIR/vscode/settings.json
    ln -sfnv $SCRIPT_DIR/vscode/settings.json ~/.config/Code/User/settings.json
    touch $SCRIPT_DIR/vscode/keybindings.json
    ln -sfnv $SCRIPT_DIR/vscode/keybindings.json ~/.config/Code/User/keybindings.json
  fi
fi
