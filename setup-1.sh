#!/usr/bin/env bash

echo "Installing apps...\n"

sudo -v

setupdir=$(pwd)

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# zsh setup
brew install zsh zsh-completions
# add the following line into the very end of the file(/etc/shells)
echo "/usr/local/bin/zsh" | sudo tee --append /etc/shells
# change default shell
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
# copy zsh configs
cp prezto/.zshrc ~/
cp prezto/.zpreztorc ~/
