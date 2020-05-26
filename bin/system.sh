#!/bin/bash

action=${1:-`echo -e "lock\nsuspend\nShutdown\nReboot" | dmenu`}
[[ -z "$action" ]] && exit

case ${action} in
    lock) ~/.dotfiles/bin/lock.sh;;
    suspend) systemctl suspend;;
    Shutdown) systemctl poweroff;;
    Reboot) systemctl reboot;;
esac

