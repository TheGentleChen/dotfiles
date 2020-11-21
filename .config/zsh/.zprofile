# Profile file. Runs on login. Environmental variables are set here.

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"

# Other Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export SUDO_ASKPASS="$HOME/.config/i3/script/dmenupass"
