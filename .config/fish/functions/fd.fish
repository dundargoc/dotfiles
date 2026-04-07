function fd
    if command -q fd
        command fd --hidden $argv
    else
        find * -iname "*$argv*"
    end
end
