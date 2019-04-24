switch $USER
case cqy
    function cqy_get_Prompt
        set_color 58B5F1
        echo -n 'a'
        set_color 6BBDF3
        echo -n 'n'
        set_color 7EC5F4
        echo -n 'o'
        set_color 90CEF6
        echo -n 'n'
        set_color A2D6F7
        echo -n 'I'
        set_color B5DEF9
        echo -n 'M'
        set_color C7E6FA
        echo -n 'O'
        set_color DAEEFC
        echo -n 'u'
        set_color EDF7FD
        echo -n 's'
    end
case root
    function cqy_get_Prompt
        set_color red
        echo -n '[root]'
    end

case '*'
    function cqy_get_Prompt
        echo -n $User
    end
end

function fish_prompt
    cqy_get_Prompt
    set_color white --bold
    echo -n ' '(basename (prompt_pwd))' '
    set_color normal

    set -q RANGER_LEVEL
    and echo -n "[ranger] "

    set -q SSH_TTY
    and echo -n "(ssh) "
end

