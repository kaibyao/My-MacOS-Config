#!/usr/bin/env bash

echo "Enter your laptop password:"
sudo -v

echo "Agreeing to xcode licenses + developer tools setup"
sudo xcodebuild -license
xcode-select --install

setupdir=$(pwd)

# install homebrew
echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# zsh setup
echo "Setting up zsh"
brew install zsh zsh-completions
# add the following line into the very end of the file(/etc/shells)
echo "/opt/homebrew/bin/zsh" | sudo tee -a /etc/shells
# change default shell
sudo dscl . -create /Users/$USER UserShell /opt/homebrew/bin/zsh
# copy zsh configs
cp prezto/.zshrc ~/
cp prezto/.zpreztorc ~/
