if [ -d ~/.linuxbrew ]; then
  eval $(~/.linuxbrew/bin/brew shellenv)
else
  eval $($(brew --prefix)/bin/brew shellenv)
fi
