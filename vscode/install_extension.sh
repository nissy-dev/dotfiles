#!/usr/bin/env bash

# -u: Fail on when existing unset variables
# -e -o pipefail: Fail on when happening command errors
set -ueo pipefail

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# install extention
cat $SCRIPT_DIR/extensions | while read line
do
  code --install-extension $line
done

code --list-extensions > $SCRIPT_DIR/extensions
