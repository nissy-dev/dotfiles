#!/usr/bin/env bash

# -u: Fail on when existing unset variables
# -e -o pipefail: Fail on when happening command errors
set -ueo pipefail

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
mkdir -p ~/.config

ln -sfnv $SCRIPT_DIR/.gitconfig ~/.gitconfig
ln -sfnv $SCRIPT_DIR/.gitignore_global ~/.gitignore_global
ln -sfnv $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sfnv $SCRIPT_DIR/.zshrc ~/.zshrc
ln -sfnv $SCRIPT_DIR/starship.toml ~/.config/starship.toml

if [ -d ~/Library/Application\ Support/Code/User ]; then
  touch ~/Library/Application\ Support/Code/User/settings.json
  ln -sfnv $SCRIPT_DIR/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
  touch ~/Library/Application\ Support/Code/User/keybindings.json
  ln -sfnv $SCRIPT_DIR/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
fi
