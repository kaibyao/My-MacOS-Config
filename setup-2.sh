#!/usr/bin/env zsh

echo "Enter your laptop password:"
sudo -v

echo "What is your full name?"
read fullname
echo "What is your GitHub email?"
read email

# fonts
echo "Installing dev-friendly fonts..."
brew install svn
brew tap homebrew/cask-fonts
brew install --cask font-iosevka
brew install --cask font-roboto-mono

# prezto
echo "Setting up prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# install other homebrew utils, taken from https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/
echo "Installing other key utils via homebrew..."
brew install coreutils binutils diffutils gawk gnutls gpg gzip screen watch wget bash emacs gpatch less m4 make nano file-formula git openssh perl python rsync svn unzip automake autoconf openssl libyaml readline libxslt libtool unixodbc
brew install vim --override-system-vi

# iTerm
echo "Installing iTerm... (use this instead of terminal.app)"
wget -O ~/Downloads/iTerm.zip https://iterm2.com/downloads/stable/latest
unzip ~/Downloads/iTerm.zip
sudo mv iTerm.app /Applications/
rm -f ~/Downloads/iTerm.zip

cp -f ./iterm/com.googlecode.iterm2.plist ~/Library/Preferences/
open ./iterm/monokai-soda.itermcolors

# git
echo "Updating to the latest git..."
brew install --cask p4v
cat ./git/.gitconfig >| ~/.gitconfig
echo "[user]
	name = $fullname
	email = $email" >> ~/.gitconfig

# vscode
echo "Installing VS Code + dev-friendly extensions..."
wget -O ~/Downloads/vscode.zip "https://vscode-update.azurewebsites.net/latest/darwin/stable"
unzip ~/Downloads/vscode.zip
mv Visual\ Studio\ Code.app /Applications/
rm -f ~/Downloads/vscode.zip

for ext in ./vscode/vscode-extensions/*;
do /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension $ext;
done

# better tools
brew install starship exa bat fzf tldr

# FireFox
wget -O ~/Downloads/firefox.dmg "https://download.mozilla.org/?product=firefox-latest-ssl&os=osx&lang=en-US"
hdiutil attach ~/Downloads/firefox.dmg
cp -r /Volumes/Firefox/Firefox.app /Applications/
hdiutil detach /Volumes/Firefox
rm -f ~/Downloads/firefox.dmg

# Chrome
wget -O ~/Downloads/chrome.dmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
hdiutil attach ~/Downloads/chrome.dmg
cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/
hdiutil detach /Volumes/Google\ Chrome
rm -f ~/Downloads/chrome.dmg

# asdf, node, yarn
echo "Follow latest instructions to get asdf, fnm, node, etc."

# echo "Installing asdf, node, and yarn"
# git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.1

# asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
# bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# asdf install nodejs 9.4.0
# asdf global nodejs 9.4.0
# npm config set scripts-prepend-node-path true
# brew install yarn --without-node

# yarn global add eslint