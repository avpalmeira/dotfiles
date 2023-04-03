# set path for ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# define java and android vars
export JAVA_HOME=$HOME/java/jdk8
export ANDROID_HOME=$HOME/android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

# set path for android
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# set path for flutter
# export PATH=$PATH:$HOME/snap/flutter/common/flutter/bin

# enable Python builds to use the Homebrew-provided installations of zlib and libsodium
export SODIUM_INSTALL=system
export LIBSODIUM_MAKE_ARGS=-j8
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1
