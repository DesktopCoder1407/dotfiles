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

# Simple self-made scripts.
package_size() {
    for i in "$@"; do
        local human_size=$(pacman -Si $i | grep "Installed Size" | grep -o "[0-9]\+\.\?[0-9]* .*" | sed "s; ;;g")
        echo $i is $(numfmt --from=iec-i --to=iec ${human_size:0:-1})B
    done
}

package-group-info() {
    pacman -Sg $1 | xargs echo | sed "s;\b$1 \b;;g" | xargs pacman -Si
}

package-group-size() {
    local size=$(package-group-info $1 | grep "Installed Size" | grep -o "[0-9]\+\.\?[0-9]* .*" | sed "s; ;;g")
    local sizearray+=($(echo $size | sed "s;B;;g" | xargs numfmt --from=iec-i))

    local sum=0
    for i in ${sizearray[@]}; do
        let sum+=$i
    done

    echo "Group \"$1\" contains ${#sizearray[@]} packages and is $(numfmt --to=iec $sum)B"
}

aurman() {
    # Input is the git-clone URL of the package.
    pkg_name=$(echo $1 | sed "s;https\?://aur\.archlinux\.org/\(.*\)\.git;\1;;")

    cd ~/builds
    git clone $1
    cd $pkg_name

    less PKGBUILD
    sleep .1

    makepkg -sc #makepkg -src

    echo "To install, run pacman -U '*.tar.zst'"
}

# Cool system specs start page
echo -e "\n"
neofetch
