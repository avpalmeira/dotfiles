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
command -v eza &> /dev/null && alias la="eza -a --icons --grid --group-directories-first"
command -v eza &> /dev/null && alias l="eza -l --group-directories-first"
command -v eza &> /dev/null && alias lh="eza -lh --group-directories-first"
command -v eza &> /dev/null && alias lt="eza -lT -L"

# Most used paths
LOCAL="$HOME/.local"
CONFIG="$HOME/.config"

# Frequent folders shortcuts
alias dot="cd $HOME/dotfiles"
alias dotl="cd $HOME/.local/dotfiles"
alias loc="cd $LOCAL"
alias conf="cd $CONFIG"

# Edit config files
alias cfz="vim ~/.zshrc"
alias cfzl="vim $LOCAL/zshrc.local"
alias cfg="vim ~/.gitconfig"
alias cfgl="vim $LOCAL/gitconfig.local"
alias cfa="vim ~/.shell/aliases.sh"
alias cfal="vim $LOCAL/aliases.local.sh"
alias cfv="vim ~/.vimrc"
alias cfvl="vim $LOCAL/vimrc.local"
alias cfk="vim $CONFIG/kitty/kitty.conf"
alias cfka="vim $CONFIG/karabiner/karabiner.json"
alias cft="vim ~/.shell/tools.sh"
alias cftl="vim $LOCAL/tools.local.sh"
alias cfh="vim $CONFIG/herdr/config.toml"

# Git -- everything else goes through the aliases in gitconfig (g st, g ac, ...)
alias g="git"
alias gst="git status"
alias gsta="git stash push"
alias gstl="git stash list"
alias gstp="git stash pop"
alias gstc="git stash clear"
alias gsts="git stash show --patch"

# Dev shortcuts
alias depcheck="madge --image graph.svg ./"
alias ports="lsof -nP -iTCP -sTCP:LISTEN"

# Docker
alias dstopall='docker stop $(docker ps -a -q)'
