# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Case-sensitive completion.
CASE_SENSITIVE="false"

# Hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Plugins
plugins=(
    command-not-found
    systemd
    vi-mode
    zsh-completions
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-interactive-cd
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Aliases
# Shortcuts
alias c="clear"
alias s="neofetch | lolcat"
alias r="ranger"
alias v="nvim"
alias vim="nvim"
alias mkdir="mkdir -pv"
alias sudo="sudo -E"
alias pac="sudo pacman"
alias gi="lazygit"
alias make="bear -- make"
alias pc="proxychains4"
alias ydv="youtube-dl --add-metadata"
alias yda="youtube-dl --add-metadata -x"
alias logout="sudo systemctl restart lightdm.service"
alias getport="ss -plat"
alias proxyon="export http_proxy=http://127.0.0.1:12333 https_proxy=$http_proxy"
alias proxyoff="unset http_proxy https_proxy"
alias ssh="env TERM=xterm-256color ssh"

# Human-readable commands
alias du="du -h"
alias df="df -h"

# Confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Add colors
alias ls='exa -l --color=always --group-directories-first' # my preferred listing
alias ll='exa -al --color=always --group-directories-first' # my preferred listing
alias cat='bat'
alias diff="diff --color=auto"
alias grep="grep --color=auto"

# fzf advanced
alias pskill="(date; ps -ef) |
  fzf --bind='ctrl-r:reload(date; ps -ef)' \
      --header=$'Press CTRL-R to reload\n\n' --header-lines=2 \
      --preview='echo {}' --preview-window=down,3,wrap \
      --layout=reverse --height=80% | awk '{print $2}' | xargs kill -9"

# key for completion
bindkey '^ ' autosuggest-accept

# Use vim keys in tab complete menu:
bindkey -M vicmd 's' vi-swap-case
bindkey -M vicmd '^h' vi-beginning-of-line
bindkey -M vicmd '^l' vi-end-of-line

source $HOME/.config/zsh/key-bindings.zsh
source $HOME/.config/zsh/completion.zsh

colorscript -e elfman
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
