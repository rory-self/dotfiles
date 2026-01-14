setopt extended_glob

## Start up ##
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

## oh-my-zsh ##
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
DEFAULT_USER="Rory"
plugins=(git)

source $ZSH/oh-my-zsh.sh

## Aliases ##
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias c='pygmentize -g'
alias vim='nvim'
alias vpn='~/scripts/vpn.sh'
alias icat="kitten icat"

## Local Configurations ##
if [ -f ~/.config/zsh/local_config ]; then
  source ~/.config/zsh/local_config
else
  print "No local zsh configuration found."
fi
