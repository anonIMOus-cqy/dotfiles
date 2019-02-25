# == Startup ==
#set fish_greeting ""

# Start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

tput smkx

test -s "$HOME/.config/fish/shortcuts.fish"
and source "$HOME/.config/fish/shortcuts.fish"

# Fish Vi-Mode
fish_vi_key_bindings ^ /dev/null


# == Alias ==
# cd
#alias ...='cd ../..'
#alias ....='cd ../../..'

# c/c++
alias gcc99="gcc -std=c99 -Wall"
alias g++14="g++ -std=c++14 -Wall"

# VIM
alias v='vim'

# Ranger
alias ra='ranger'

# Reload config.fish
alias so='source ~/.config/fish/config.fish'

# Full system upgrade
alias pSyyu='command yay --nouseask --noconfirm -Syyu'

# xclip
alias xclip='xclip -selection c'

# latexmk
#alias latexmks='grep -l \'\\documentclass\' *tex | xargs latexmk -f -pvc'
