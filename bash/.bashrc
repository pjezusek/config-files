export TERM=xterm-256color

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# set prompt
#export PS1="\[\e[32m\]\u\[\e[m\]@\[\e[35m\]\h\[\e[m\] \[\e[34;40m\]\w\[\e[m\]\\$ "
export PS1="\[\e[34;40m\]\w\[\e[m\]\\$ "
# run neofetch
neofetch

# run tmux
if [[ $TERM == "xterm-termite" ]]; then
  tmux a -t base || tmux new -s base
fi
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# set fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add pyenv to PATH for scripting.
export PATH="$PATH:$HOME/.pyenv/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Initialize bookmarks
source ~/.local/bin/bashmarks.sh
