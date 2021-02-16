##################################
# PATHの追加やツールのセットアップ
##################################

## nodejs
export PATH=$HOME/.nodebrew/current/bin:$PATH

## android studio
# export ANDROID_HOME=$HOME/Android/Sdk # for linux
export ANDROID_HOME=$HOME/Library/Android/sdk # for mac
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

## python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

## rust
export PATH=$HOME/.cargo/bin:$PATH

## go
export GOPATH=$HOME/.go

# starship
if command -v starship 1>/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

##################################
# docker 関連のエイリアス
##################################
alias doc='docker'
alias dri='docker system prune'
alias drc='docker rm $(docker ps -aq)'
alias drun='docker run --rm -it'

##################################
# git 関連のエイリアス
##################################

# forkしたリポジトリのupstreamに、fork元のリポジトリを登録する
alias guset='npx git-upstream --set'

# fork元の変更を、自分のリポジトリに取り込む
alias ff='git fetch upstream && git merge upstream/master'

# マージ済みのブランチをローカルから削除
alias gclean='git branch --merged | grep -vE "^\*|master$|develop$|main$" | xargs -I % git branch -d %'

# pecoの設定
alias g='cd $(ghq root)/$(ghq list | peco)'
