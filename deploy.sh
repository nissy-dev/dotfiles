#!/usr/bin/env bash

# -u: Fail on when exsisting unset variables
# -e -o pipefail: Fail on when happening command errors
set -ue -o pipefail

DOTFILES_DIR=$(cd $(dirname $0); pwd)

if [ -d ~/.config ]; then
  mkdir -p ~/.config
fi

ln -sfnv ${DOTFILES_DIR}/.vim ~/.vim
# ln -sfnv ${DOTFILES_DIR}/.bashrc ~/.bashrc
# ln -sfnv ${DOTFILES_DIR}/.bash_profile ~/.bash_profile
ln -sfnv ${DOTFILES_DIR}/.gitconfig ~/.gitconfig
ln -sfnv ${DOTFILES_DIR}/.gitignore_global ~/.gitignore_global
ln -sfnv ${DOTFILES_DIR}/.vimrc ~/.vimrc
ln -sfnv ${DOTFILES_DIR}/.zshrc ~/.zshrc
ln -sfnv ${DOTFILES_DIR}/starship.toml ~/.config/starship.toml

if [ "$(uname)" = 'Darwin' ]; then
  # For Mac
  ln -sfnv ${DOTFILES_DIR}/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
  ln -sfnv ${DOTFILES_DIR}/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
fi
