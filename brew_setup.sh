# install homebrew
echo 'Install homebrew.'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Install packages.'
if [ "$(uname)" = 'Darwin' ]; then
  brew bundle --file $(pwd)/brewfiles/Brewfile.mac
else
  . ./linuxbrew_init.sh
  brew bundle --file $(pwd)/brewfiles/Brewfile.linux
fi
