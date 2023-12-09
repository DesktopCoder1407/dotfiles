# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup extended bash completion
[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'
alias ll='ls -lA --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

PS1='\e[1;33m\w\e[0m\$ '

# History, remove all but the last identical command and commands that start with a space
export HISTCONTROL="erasedups:ignorespace"
