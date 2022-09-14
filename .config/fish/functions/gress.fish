function gress --wraps "git restore --staged"
    if count $argv >/dev/null
        git restore --staged $argv
    else
        git restore --staged :/
    end
end
