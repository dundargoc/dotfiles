function tidy
    reset
    for i in $argv
        clang-tidy "$i"
    end
end
