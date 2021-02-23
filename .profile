# Profile file. Runs on login. Environmental variables are set here.

# Use zsh profile
[[ -f ~/.config/zsh/.zprofile ]] && source ~/.config/zsh/.zprofile

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[[ -f ~/.less_termcap ]] && . ~/.less_termcap
