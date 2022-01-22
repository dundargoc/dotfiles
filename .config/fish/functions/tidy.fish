function tidy
    reset
    for i in $argv
        clang-tidy --config-file "$HOME/.clang-tidy" "$i"
    end
end
