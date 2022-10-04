# For a full list of active aliases, run `alias`.

# Terminal
alias c="clear"
alias reload="exec zsh"
alias lsize="du -skh * | sort -h"
alias chbash='chsh -s $(which bash)'

# Navigation
alias h="cd"
alias b="cd .."
alias p="cd -"

# Most used paths
export DEV_PATH="$HOME/dev/source"
export LOCAL="$HOME/.local"

# Frequent folders shortcuts
alias dot="cd $HOME/dotfiles"
alias dotl="cd $HOME/.local/dotfiles"
alias dev="cd $DEV_PATH"
alias loc="cd $LOCAL"

# Edit config files
alias cfz="vim ~/.zshrc"
alias cfzl="vim $LOCAL/zshrc.local"
alias cfg="vim ~/.gitconfig"
alias cfgl="vim $LOCAL/gitconfig.local"
alias cfa="vim ~/.shell/aliases.sh"
alias cfal="vim $LOCAL/aliases.local.sh"
alias cfv="vim ~/.vimrc"
alias cfvl="vim $LOCAL/vimrc.local"

# Dev shortcuts
alias depcheck="madge --image graph.svg ./"
alias ports="lsof -i -P | grep -v 'sdm' | grep -i 'listen'"

