#!/usr/bin/env zsh

echo "What is your full name?"
read fullname
echo "What is your GitHub email?"
read email

sudo -v

# fonts
brew tap caskroom/fonts
brew cask install font-iosevka
brew cask install font-roboto-mono

# prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# install other homebrew utils, taken from https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/
brew install coreutils binutils diffutils gawk gnutls gpg gzip screen watch wget bash emacs gpatch less m4 make nano file-formula git openssh perl python rsync svn unzip automake autoconf openssl libyaml readline libxslt libtool unixodbc
brew install vim --override-system-vi

# iTerm
wget -O ~/Downloads/iTerm.zip https://iterm2.com/downloads/stable/latest
unzip ~/Downloads/iTerm.zip
sudo mv iTerm.app /Applications/
rm -f ~/Downloads/iTerm.zip

cp -f ./iterm/com.googlecode.iterm2.plist ~/Library/Preferences/

# I think the preferences copied over actually contain the color scheme
# open ./iterm/monokai-soda.itermcolors

# git
brew cask install p4merge
cat ./git/.gitconfig >| ~/.gitconfig
echo "[user]
	name = $fullname
	email = $email" >> ~/.gitconfig

# vscode
wget -O ~/Downloads/vscode.zip "https://vscode-update.azurewebsites.net/latest/darwin/stable"
unzip ~/Downloads/vscode.zip
mv Visual\ Studio\ Code.app /Applications/
rm -f ~/Downloads/vscode.zip

for ext in ./vscode/vscode-extensions/*;
do /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension $ext;
done

mkdir -p ~/Library/Application\ Support/Code/User/
cp -f ./vscode/settings.json ~/Library/Application\ Support/Code/User/
cp -f ./vscode/keybindings.json ~/Library/Application\ Support/Code/User/

# asdf, node, yarn
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.1

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install nodejs 9.3.0
asdf global nodejs 9.3.0
brew install yarn --without-node

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
