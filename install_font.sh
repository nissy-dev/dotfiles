#!/usr/bin/env bash

# -u: Fail on when existing unset variables
# -e -o pipefail: Fail on when happening command errors
set -ueo pipefail

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# HakcGen: https://github.com/yuru7/HackGen
echo "Install HackGenNerd Fonts."

version=2.2.3
pkg=HackGenNerd_v${version}

curl -LO https://github.com/yuru7/HackGen/releases/download/v${version}/${pkg}.zip
unzip ${pkg}.zip

if [ "$(uname)" = 'Darwin' ]; then
  cp ${pkg}/*.ttf ~/Library/Fonts/
else
  mkdir -p ~/.fonts
  cp ${pkg}/*.ttf ~/.fonts/
fi

# フォントの更新
fc-cache -fv

# 不要なファイルの削除
rm -rf ${pkg}*
