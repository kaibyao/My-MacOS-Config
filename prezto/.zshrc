#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export SUBLIME=subl
export EDITOR="$SUBLIME --wait"
alias ll="ls -lh"
alias la="ls -A"

setopt MENU_COMPLETE
setopt GLOB_COMPLETE

. ~/.nvm/nvm.sh  # This loads nvm
nvm use default
eval "$(grunt --completion=zsh)"
