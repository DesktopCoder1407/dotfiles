#!/bin/bash

if [[ "$@" != "" ]]
then
    rbw get $1 | wl-copy
    exit 0
fi

display_entry_names() {
    echo -en "\0message\x1f<b>Alt+c:</b> Copy Password | <b>Alt+u:</b> Copy Username | <b>Alt+m:</b> Menu | <b>Alt+s:</b> Sync\n"
    echo -en "\0prompt\x1fName\n"
    rbw list
}


#process_args

display_entry_names
