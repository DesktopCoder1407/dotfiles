#!/bin/bash

display_entries() {
    echo -e "\0message\x1f<b>Alt+c:</b> Copy Password | <b>Alt+u:</b> Copy Username | <b>Alt+m:</b> Menu | <b>Alt+s:</b> Sync\n"
    echo -e "\0prompt\x1fName\n"
    rbw list
}

if [[ "$@" != "" ]]
then
    rbw get "$1" | wl-copy
    exit 0
fi

display_entries
