# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Start SSH agent
eval "$(ssh-agent -s)" &>/dev/null

# Enable Fuzzy Finder
if [ -f ~/.fzf.zsh ]; then
  export FZF_DEFAULT_COMMAND='rg --files --follow'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  source ~/.fzf.zsh
fi

# Set up thefuck
eval $(thefuck --alias)

# Set up NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Set up chruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# Set up rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# Set up pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Enable completion for pipx:
eval "$(register-python-argcomplete pipx)"

# Set up rust
export RUST_DIR="$HOME/.cargo"
export PATH="$RUST_DIR/bin:$PATH"

# Define java and android vars
export JAVA_HOME=$HOME/java/jdk8
export ANDROID_HOME=$HOME/android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

# Set path for android
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Set path for flutter
# export PATH=$PATH:$HOME/snap/flutter/common/flutter/bin

#####################################
## DYNAMIC LINKS FOR BREW PACKAGES ##
#####################################

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/bin:${PATH}"

# Enable Python builds to use the Homebrew-provided installations of zlib and libsodium
export SODIUM_INSTALL=system
export LIBSODIUM_MAKE_ARGS=-j8
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

HOMEBREW_PREFIX="$(brew --prefix)"

# Configure dynamic loader (non statically linked libraries) to look for brew installed objects
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOMEBREW_PREFIX/lib
export LIBRARY_PATH=$LIBRARY_PATH:$HOMEBREW_PREFIX/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:$HOMEBREW_PREFIX/include

# Tell pycurl to use openssl instead of MacOS's default LibreSSL
export PYCURL_SSL_LIBRARY=openssl

# Use poetry bin folder
export PATH="$HOME/.poetry/bin:$PATH"

# Define necessary compiler flag so that packages builds and statically links against brew installed libraries
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/zlib/lib -L$HOMEBREW_PREFIX/opt/openssl@3/lib -L$HOMEBREW_PREFIX/opt/curl/lib"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/zlib/include -I$HOMEBREW_PREFIX/opt/openssl@3/include -I$HOMEBREW_PREFIX/opt/curl/include"
