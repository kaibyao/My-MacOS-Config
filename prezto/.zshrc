# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Sublime Text
export SUBLIME=subl
export EDITOR="$SUBLIME --wait"

# Easier commands
alias ll="ls -lah"
alias la="ls -A"

setopt MENU_COMPLETE
setopt GLOB_COMPLETE

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# Javascript/Node/NVM/NPM
. ~/.nvm/nvm.sh

nvm use default
eval "$(grunt --completion=zsh)"

# Maven
# export JAVA_HOME=$(/usr/libexec/java_home)

# Path
# export PATH="$HOME/.yarn/bin:$PATH"
