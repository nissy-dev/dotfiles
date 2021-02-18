# Initialize linuxbrew

if [ -d ~/.linuxbrew ]; then
  eval $(~/.linuxbrew/bin/brew shellenv)
elif [ -d /home/linuxbrew/.linuxbrew ]; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
else
  eval $($(brew --prefix)/bin/brew shellenv)
fi
