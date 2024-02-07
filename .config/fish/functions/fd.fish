function fd
    if command -q fd
        command fd --hidden --no-ignore $argv
    else
        find * -iname "*$argv*"
    end
end
