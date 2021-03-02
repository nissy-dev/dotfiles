#!/usr/bin/env bash

# -u: Fail on when exsisting unset variables
# -e -o pipefail: Fail on when happening command errors
set -ueo pipefail

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

if [ -d ~/.config ]; then
  mkdir -p ~/.config
fi

ln -sfnv $SCRIPT_DIR/.vim ~/.vim
# ln -sfnv $SCRIPT_DIR/.bashrc ~/.bashrc
# ln -sfnv $SCRIPT_DIR/.bash_profile ~/.bash_profile
ln -sfnv $SCRIPT_DIR/.gitconfig ~/.gitconfig
ln -sfnv $SCRIPT_DIR/.gitignore_global ~/.gitignore_global
ln -sfnv $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sfnv $SCRIPT_DIR/.zshrc ~/.zshrc
ln -sfnv $SCRIPT_DIR/starship.toml ~/.config/starship.toml

if [ "$(uname)" = 'Darwin' ]; then
  # for mac
  if [ -d ~/Library/Application\ Support/Code/User ]; then
    ln -sfnv $SCRIPT_DIR/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
    ln -sfnv $SCRIPT_DIR/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
    rm -rf ~/Library/Application\ Support/Code/User/snippets
    ln -sfnv $SCRIPT_DIR/vscode/snippets ~/Library/Application\ Support/Code/User/snippets
  fi
else
  # for linux
  ln -sfnv $SCRIPT_DIR/brew/linuxbrew_init.sh ~/linuxbrew_init.sh
  if [ -d ~/.config/Code/User ]; then
    ln -sfnv $SCRIPT_DIR/vscode/settings.json ~/.config/Code/User/settings.json
    ln -sfnv $SCRIPT_DIR/vscode/keybindings.json ~/.config/Code/User/keybindings.json
    rm -rf ~/.config/Code/User/snippets
    ln -sfnv $SCRIPT_DIR/vscode/snippets ~/.config/Code/User/snippets
  fi
fi
