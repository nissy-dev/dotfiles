##################################
# PATHの追加やツールのセットアップ
##################################

## Homebrew
if [ "$(uname)" = 'Darwin' ]; then
  if [ -f /opt/homebrew/bin/brew ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
  fi
else
  if [ -f ~/linuxbrew_init.sh ]; then
    . ~/linuxbrew_init.sh
  fi
fi

## 各言語の設定
if type "mise" >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

## android studio
if [ "$(uname)" = 'Darwin' ]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk # for mac
else
  export ANDROID_HOME=$HOME/Android/Sdk # for linux
fi

if [ -d "$ANDROID_HOME" ]; then
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
fi

## google cloud sdk
if [ -f ~/google-cloud-sdk/path.zsh.inc ]; then
  . ~/google-cloud-sdk/path.zsh.inc
fi

if [ -f ~/google-cloud-sdk/completion.zsh.inc ]; then
  . ~/google-cloud-sdk/completion.zsh.inc
fi

## direenv
if type "direnv" >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

## fzf
if [ -f ~/.fzf.zsh ]; then
  . ~/.fzf.zsh
fi

## coreutils
if [ "$(uname)" = 'Darwin' ]; then
  export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
  export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
fi


##################################
# シェル全般の設定
##################################

HISTFILE=~/.zsh_history      # ヒストリファイルを指定
HISTSIZE=10000               # ヒストリに保存するコマンド数
SAVEHIST=10000               # ヒストリファイルに保存するコマンド数
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを共有する
setopt append_history        # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録

##################################
# エイリアス
##################################

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias ll='ls -alhF'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias df='df -h'
alias grep='grep --color'
alias virc='vi ~/.zshrc'
alias uprc='source ~/.zshrc'

##################################
# docker 関連のエイリアス
##################################

alias d='docker'
alias dc='docker compose'
alias dimg='docker images'
alias dimg-clean='docker system prune'
alias dcnt='docker ps -a'
alias dcnt-clean='docker rm $(docker ps -aq)'
alias drun='docker run --rm -it'
alias kb='kubectl'

##################################
# git 関連のエイリアス
##################################

# マージ済みのブランチをローカルから削除
alias br-clean='git branch --merged | grep -vE "^\*|master$|develop$|main$" | xargs -I % git branch -d %'


##################################
# fzf の便利関数
##################################

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
git-ck() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# run npm script (requires jq)
npmr() {
  local script
  script=$(cat package.json | jq -r '.scripts | keys[] ' | sort | fzf) && npm run $(echo "$script")
}

# ghq + fzf
alias g='cd $(ghq root)/$(ghq list | fzf)'

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# fd - cd to selected directory
fcd() {
  local dir
  dir=$(/usr/bin/find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# port指定でプロセスを落とす
kill-by-port() {
  lsof -P | grep $1 | awk '{print $2}' | xargs kill -9
}

##################################
# 独自設定の読み込み
##################################

if [ -f ~/.zshrc.custom ]; then
  source ~/.zshrc.custom
fi
