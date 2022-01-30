function gres
    if count $argv >/dev/null
        git restore $argv
    else
        git restore :/
    end
end
