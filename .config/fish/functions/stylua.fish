function stylua
    if count $argv >/dev/null
        command stylua --search-parent-directories $argv
    else
        command stylua --search-parent-directories .
    end
end
