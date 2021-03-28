#!/usr/bin/env bash

# -u: Fail on when existing unset variables
# -e -o pipefail: Fail on when happening command errors
set -ueo pipefail

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

cat $SCRIPT_DIR/.tool-versions | while read line
do
  array=(`echo $line`)

  asdf plugin add ${array[0]}

  # for nodejs
  if [ "${array[0]}" = 'nodejs' ]; then
    bash -c "$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring"
  fi

  if [ "$(uname -m)" = 'arm64' ] && \
     ([ "${array[0]}" = 'nodejs' ] || [ "${array[0]}" = 'python' ]); then
    # FIXME: M1かつNode.js or Pythonのインストールの時 (workaround)
    arch -x86_64 asdf install ${array[0]} ${array[1]}
  else
    asdf install ${array[0]} ${array[1]}
  fi

  asdf global ${array[0]} ${array[1]}
done
