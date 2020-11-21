# Profile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$HOME/Videos/cross-tools/bin"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"

# Other Paths and Options
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export SUDO_ASKPASS="$HOME/.config/i3/script/dmenupass"
export RANGER_LOAD_DEFAULT_RC=FALSE
export QT_QPA_PLATFORMTHEME="qt5ct"
