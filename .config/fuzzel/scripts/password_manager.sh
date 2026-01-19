#!/bin/bash

item=$(rbw list | fuzzel -d --placeholder "ALT+0 to Sync | ALT+1 for Username")
exit_code=$?

# Do nothing if no selection
[ -z "$item" ] && exit

# ALT+0 for Sync
if [ "$exit_code" -eq 19 ]; then
	rbw sync && ~/.config/fuzzel/scripts/password_manager.sh
# ALT+1 for Username
elif [ "$exit_code" -eq 10 ]; then
	rbw search "$item" --fields user | wl-copy
else  # Copy Pasword
	pass=$(rbw get "$item")
	echo $pass | wl-copy
	cliphist delete-query $pass
fi
