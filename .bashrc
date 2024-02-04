# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup extended bash completion
[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'
alias ll='ls -lA --color=auto'
alias grep='grep --color=auto'

PS1='\e[1;33m\w\e[0m\$ '

# History, remove all but the last identical command and commands that start with a space
export HISTCONTROL="erasedups:ignorespace"

group-info() {
    pacman -Sg $1 | xargs echo | sed "s;\b$1 \b;;g" | xargs pacman -Si
}

group-size() {
    local size=$(group-info $1 | grep "Installed Size" | grep -o "[0-9]\+\.\?[0-9]* .*" | sed "s; ;;g")
    local sizearray=()
    local sizearray+=($(echo $size | sed "s;B;;g" | xargs numfmt --from=iec-i))

    local sum=0
    for i in ${sizearray[@]}; do
        let sum+=$i
    done

    echo "Group \"$1\" contains ${#sizearray[@]} packages."
    echo "The total size of the group is $(numfmt --to=iec $sum)"
}
