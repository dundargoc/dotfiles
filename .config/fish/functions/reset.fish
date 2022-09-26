function reset
    if set -q TMUX
        clear
        tmux clearhist
    else
        tput reset
    end
end
