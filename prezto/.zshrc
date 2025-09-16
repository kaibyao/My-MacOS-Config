# zsh-completions
if type brew &>/dev/null; then
  FPATH=/opt/homebrew/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# starship
eval "$(starship init zsh)"

# Easier commands
alias ls="exa"
alias ll="ls -lah"
alias la="ls -A"

alias gcom="git checkout main"
alias gpm="git checkout main && git pull && git checkout -"
alias grm="git rebase -i main"
alias gpf="git push --force"

# Claude Code
alias claude="/~/.claude/local/claude"
alias claude-frontend="claude --mcp-config ~/.claude-frontend.json"
alias claude-prd="claude --mcp-config ~/.claude-prd.json"
alias claude-pr="claude --mcp-config ~/.claude-pr.json"
