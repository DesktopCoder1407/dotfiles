# Hyprland Scripts -- Launch First Option
# by DesktopCoder1407

for cmd in "$@"; do
	[[ ! $(command -v "$cmd") ]] && continue
	eval "$cmd" && exit
done
