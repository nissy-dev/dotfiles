#!/usr/bin/env bash

# -u: Fail on when existing unset variables
# -e -o pipefail: Fail on when happening command errors
set -ueo pipefail

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# for nodejs
bash -c "$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring"

cat $SCRIPT_DIR/.tool-versions | while read line
do
  array=(`echo $line`)
  asdf plugin add ${array[0]}
  if [ "$(uname -m)" = 'arm64' ] && \
     ([ "${array[0]}" = 'nodejs' ] || [ "${array[0]}" = 'python' ]); then
    # FIXME: M1かつNode.js or Pythonのインストールの時 (workaround)
    arch -x86_64 asdf install ${array[0]} ${array[1]}
  else
    asdf install ${array[0]} ${array[1]}
  fi
  asdf global ${array[0]} ${array[1]}
done

# use the latest pkg manager
if command -v npm 1>/dev/null 2>&1; then
  npm install -g npm@latest
fi

if command -v pip 1>/dev/null 2>&1; then
  python -m pip install --upgrade pip
fi