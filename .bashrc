# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment Variables
export HISTCONTROL="erasedups:ignorespace"
export EDITOR="vim"

# Hooks
[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion

# Shell Prompt Customization
BYELLOW='\[\033[01;33m\]'
PS_CLEAR='\[\033[0m\]'
export PS1="${BYELLOW}\u:\w${PS_CLEAR}$ "

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lhA'
alias grep='grep --color=auto'
alias gs='git status -sb'

# Shell Options
shopt -s checkwinsize  # Let bash know when the terminal has been resized.

# User Functions
download_music() {
	yt-dlp -x --audio-format mp3 --audio-quality 320k $1
}

print_colors() {
	BG=(40 41 42 43 44 45 46 47)
	BGB=(40 41 42 43 44 45 46 47)
	for i in ${!BG[@]}
	do
		echo -en "\033[${BG[i]}m  Color0$i  \033[0m"
	done
	echo
	for i in ${!BGB[@]}
	do
		color_number=$(printf "%02d" $((i+8)))
		echo -en "\033[${BG[i]}m  Color$color_number  \033[0m"
	done
	echo
}
