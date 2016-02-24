# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Sublime Text
export SUBLIME=subl
export EDITOR="$SUBLIME --wait"

# VS Code
function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }

# Easier commands
alias ll="ls -lah"
alias la="ls -A"

setopt MENU_COMPLETE
setopt GLOB_COMPLETE

# Javascript/Node/NVM/NPM
. ~/.nvm/nvm.sh

nvm use default
eval "$(grunt --completion=zsh)"

# Maven
export JAVA_HOME=$(/usr/libexec/java_home)
