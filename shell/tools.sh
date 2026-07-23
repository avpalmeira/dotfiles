# vim:ft=zsh
# Tools that MUST be initialized at the very end of shell startup, after
# everything else has registered its hooks and widgets.
# This file is sourced as the last line of ~/.zshrc.

# Load starship: shell prompt
command -v starship &> /dev/null && eval "$(starship init zsh)"

# Set up fzf: fuzzy finder
command -v fzf &> /dev/null && eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}' --preview-window=right:50%"
command -v fd >/dev/null && export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Set up zoxide: folder navigator
eval "$(zoxide init zsh)"
export _ZO_DOCTOR=0
command -v z &> /dev/null && alias cd=z

# Source a zsh plugin from wherever it happens to be installed
_load_zsh_plugin() {
  local name="$1" dir
  for dir in \
    /opt/homebrew/share \
    /home/linuxbrew/.linuxbrew/share \
    /usr/share/zsh/plugins \
    /usr/share
  do
    if [ -r "$dir/$name/$name.zsh" ]; then
      . "$dir/$name/$name.zsh"
      return 0
    fi
  done
  return 1
}

_load_zsh_plugin zsh-autosuggestions
_load_zsh_plugin zsh-syntax-highlighting   # keep last
