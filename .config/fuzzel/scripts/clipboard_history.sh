#!/bin/bash

# Notify if empty clipboard
if [ -z "$(cliphist list)" ]; then
	fuzzel -d --prompt-only "Clipboard Empty"
	exit
fi

item=$(cliphist list | fuzzel -d --placeholder "ALT+0 to Clear | ALT+1 to Delete" --with-nth 2)
exit_code=$?

# Do nothing if no selection
[ -z "$item" ] && exit

# ALT+0 to Clear History
if [ "$exit_code" -eq 19 ]; then
	confirm=$(echo -e "No\nYes" | fuzzel -d --placeholder "Delete All History?" --lines 2)
	[[ $confirm == "Yes" ]] && cliphist wipe
# ALT+1 to Delete Selected
elif [ "$exit_code" -eq 10 ]; then
	echo "$item" | cliphist delete
else  # Copy Selected
	echo "$item" | cliphist decode
fi
