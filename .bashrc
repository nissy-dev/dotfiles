# environment variable
## nodejs
export PATH=$HOME/.nodebrew/current/bin:$PATH

## postgres
export PGDATA=/usr/local/var/postgres

## android studio
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=/Users/nishikawadaiki/Library/Android/sdk:$PATH
export PATH=/Users/nishikawadaiki/Library/Android/sdk/platform-tools:$PATH
export ANDROID_HOME=/Users/nishikawadaiki/Library/Android/sdk

## python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## rust
export PATH=$HOME/.cargo/bin:$PATH

## go
export GOPATH=$HOME/.go

# history 
HISTSIZE=5000
HISTFILESIZE=2000

# git setting
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
     source /usr/local/etc/bash_completion.d/git-prompt.sh
     GIT_PS1_SHOWDIRTYSTATE=true
     export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
else
     export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[31m\]$\[\033[00m\]\$ '
fi

# alias
alias gs='git status'
alias gm='git checkout master' 
alias gu='npx git-upstream --set'
alias gf='git fetch upstream && git merge upstream/master'
alias g='cd $(ghq root)/$(ghq list | peco)'
alias doc='docker'
alias k='kubectl'
alias dri='docker system prune'
alias dra='docker rm $(docker ps -aq)'
