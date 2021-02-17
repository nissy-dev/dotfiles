##################################
# PATHの追加やツールのセットアップ
##################################

## Linuxbrew
if [ "$(uname)" != 'Darwin' ]; then
  . ~/linuxbrew_init.sh
fi

## 各言語の設定
if command -v asdf 1>/dev/null 2>&1; then
  # asdfで管理 (自分のPC用)
  . $(brew --prefix asdf)/asdf.sh
  . $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
else
  # asdfがなければ各ツールを自分で管理 (共有の計算サーバーなどの場合)
  ## pyenv (python)
  export PYENV_ROOT=$HOME/.pyenv
  if [ -d "$PYENV_ROOT" ]; then
    export PATH=$PYENV_ROOT/bin:$PATH
    if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi
  fi
  ## nvm (nodejs)
  export NVM_DIR=$HOME/.nvm
  if [ -s "$NVM_DIR/nvm.sh" ]; then
    . $NVM_DIR/nvm.sh
  fi
fi

## android studio
if [ "$(uname)" = 'Darwin' ]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk # for mac
else
  export ANDROID_HOME=$HOME/Android/Sdk # for linux
fi
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# starship
if command -v starship 1>/dev/null 2>&1; then
  eval "$(starship init bash)"
fi

##################################
# エイリアス
##################################

alias virc='vi ~/.bashrc'
alias uprc='source ~/.bashrc'

##################################
# docker 関連のエイリアス
##################################
alias d='docker'
alias dc='docker-compose'
alias dimg='docker images'
alias dimg-clean='docker system prune'
alias dcnt='docker ps -a'
alias dcnt-clean='docker rm $(docker ps -aq)'
alias drun='docker run --rm -it'

##################################
# git 関連のエイリアス
##################################

# forkしたリポジトリのupstreamに、fork元のリポジトリを登録する
alias fork-init='npx git-upstream --set'

# fork元の変更を自分のリポジトリに取り込む
alias fork-update='git fetch upstream && git merge upstream/master'

# マージ済みのブランチをローカルから削除
alias br-clean='git branch --merged | grep -vE "^\*|master$|develop$|main$" | xargs -I % git branch -d %'

# pecoの設定
alias g='cd $(ghq root)/$(ghq list | peco)'
