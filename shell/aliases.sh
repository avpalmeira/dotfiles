# For a full list of active aliases, run `alias`.

# Terminal
alias c="clear"
alias reload="source $HOME/.zshrc"
alias lsize="du -skh *"
alias chbash='chsh -s $(which bash)'

# Navigation
alias h="cd"
alias b="cd .."
alias p="cd -"

# Better replacements
command -v bat &> /dev/null && alias cat=bat
command -v eza &> /dev/null && alias ls="eza --icons --grid --group-directories-first"
command -v eza &> /dev/null && alias la="eza -la"

# Most used paths
LOCAL="$HOME/.local"

# Frequent folders shortcuts
alias dot="cd $HOME/dotfiles"
alias dotl="cd $HOME/.local/dotfiles"
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
alias cfk="vim ~/.config/kitty/kitty.conf"
alias cft="vim ~/.shell/tools.sh"
alias cftl="vim $LOCAL/tools.local.sh"
alias cfh="vim ~/.config/herdr/config.toml"

# Dev shortcuts
alias depcheck="madge --image graph.svg ./"
alias ports="lsof -nP -iTCP -sTCP:LISTEN"

# Docker
alias dstopall='docker stop $(docker ps -a -q)'
