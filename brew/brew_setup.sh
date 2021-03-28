#!/usr/bin/env bash

# -u: Fail on when existing unset variables
# -e -o pipefail: Fail on when happening command errors
set -ueo pipefail

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# Install homebrew
if command -v brew 1>/dev/null 2>&1; then
  echo 'You have already installed homebrew.'
else
  echo 'Install homebrew.'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo 'Install packages.'
if [ "$(uname)" = 'Darwin' ]; then
  eval $(/opt/homebrew/bin/brew shellenv)
  brew bundle --file $SCRIPT_DIR/Brewfile.mac -v
else
  . $SCRIPT_DIR/linuxbrew_init.sh
  brew bundle --file $SCRIPT_DIR/Brewfile.linux -v
fi
