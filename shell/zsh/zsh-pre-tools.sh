# Set up X-server if on WSL2
# !must be at the top of .zshrc
if [ -f /proc/version ] && grep -qi Microsoft /proc/version; then
  # Set DISPLAY variable to the IP automatically assigned to WSL2
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
  # Automatically start D-Bus to allow communication with GUI applications (WSL2)
  sudo /etc/init.d/dbus start &> /dev/null
fi
# To grant passwordless access for dbus run the following command:
# sudo visudo -f /etc/sudoers.d/dbus
# And save this line when the editor opens:
# <your_username> ALL = (root) NOPASSWD: /etc/init.d/dbus

# Set up Homebrew if on Linux or WSL2
if [ -f /proc/version ] && grep -Eqi "(Linux|Microsoft)" /proc/version; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

