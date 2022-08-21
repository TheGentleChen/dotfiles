# Profile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Default programs:
export EDITOR="nvim"
export TERM="alacritty"
export BROWSER="google-chrome-stable"
export PAGER="less"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export SUDO_ASKPASS="$HOME/.config/i3/script/dmenupass.sh"

# Other Paths and Options
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state
export RANGER_LOAD_DEFAULT_RC=FALSE
export QT_AUTO_SCREEN_SCALE_FACTOR=2
export QT_QPA_PLATFORMTHEME="qt5ct"
export FZF_DEFAULT_OPTS='--bind=ctrl-i:up,ctrl-k:down,ctrl-j:backward-char,ctrl-l:forward-char'
export TERM_ITALICS=true

# ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
export GLFW_IM_MODULE=ibus

# wine
export DEEPIN_WINE_SCALE=2.00

# wayland
# export QT_QPA_PLATFORM=wayland
# export MOZ_ENABLE_WAYLAND=1
# [ "$(tty)" = "/dev/tty1" ] && exec wayfire
