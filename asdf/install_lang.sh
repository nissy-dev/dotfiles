#!/usr/bin/env bash

# -u: Fail on when existing unset variables
# -e -o pipefail: Fail on when happening command errors
set -ueo pipefail

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

cat $SCRIPT_DIR/versions | while read line
do
  array=(`echo $line`)

  asdf plugin add ${array[0]}
  asdf install ${array[0]} ${array[1]}
  asdf global ${array[0]} ${array[1]}
done
