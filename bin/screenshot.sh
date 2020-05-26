#!/bin/bash

print_file="$HOME/Pictures/screenshots/$(date +%Y%m%d-%H%M%S).png"
print_xclip="xclip -t image/png -selection c"
maim_cmd="maim"

selection=${2:-`echo -e "screen\nwindow\nselect" | dmenu`}
[[ -z "$selection" ]] && exit

output=${1:-`echo -e "file\nclip" | dmenu`}
[[ -z "$output" ]] && exit

case ${output} in
    file) case ${selection} in
        screen) $maim_cmd -qud 1 $print_file;;
        window) $maim_cmd -ui $(xdotool getactivewindow) $print_file;;
        select) $maim_cmd -us $print_file;;
        esac;;
    clip) case ${selection} in
        screen) $maim_cmd -qud 1 | $print_xclip;;
        window) $maim_cmd -ui $(xdotool getactivewindow) | $print_xclip;;
        select) $maim_cmd -us | $print_xclip;;
        esac;;
esac

notify-send \
    "Screenshot Captured" \
    "of ${selection} to ${output}"

