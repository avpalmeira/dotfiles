# Tools that MUST be initialized at the very end of shell startup,
# after oh-my-zsh and all plugins have registered their hooks.
# This file is sourced as the last line of ~/.zshrc.

# Set up zoxide (requires its hooks to be registered last)
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
