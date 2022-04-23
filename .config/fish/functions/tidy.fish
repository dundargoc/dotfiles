function tidy
    reset
    set repo_path (git rev-parse --show-toplevel)

    if [ $repo_path = $HOME/programs/uncrustify ]
        for i in $argv
            clang-tidy "$i" -extra-arg=-std=c++11
        end
    else
        for i in $argv
            clang-tidy "$i"
        end
    end
end
