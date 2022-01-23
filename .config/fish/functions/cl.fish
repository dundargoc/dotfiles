function cl
    if count $argv >/dev/null
        clang-format -i $argv
    else
        clang-format -i **/*.{c,h}
    end
end
