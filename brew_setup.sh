#!/usr/bin/env bash

# -u: Fail on when exsisting unset variables
# -e -o pipefail: Fail on when happening command errors
set -ueo pipefail

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# Install homebrew
echo 'Install homebrew.'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Install packages.'
if [ "$(uname)" = 'Darwin' ]; then
  brew bundle --file $SCRIPT_DIR/brewfiles/Brewfile.mac
else
  . $SCRIPT_DIR/linuxbrew_init.sh
  brew bundle --file $SCRIPT_DIR/brewfiles/Brewfile.linux
fi
