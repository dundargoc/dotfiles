function tidy
    reset
    set repo_path (git rev-parse --show-toplevel)

    if [ $repo_path = $HOME/programs/uncrustify ]
        for i in $argv
            clang-tidy "$i" -extra-arg=-std=c++11
        end
    else if [ $repo_path = $HOME/programs/neovim ]
        for i in $argv
            clang-tidy "$i" -extra-arg=-std=c99
        end
    else if [ $repo_path = $HOME/programs/vim ]
        for i in $argv
            clang-tidy "$i" -extra-arg=-std=c89
        end
    else
        for i in $argv
            clang-tidy "$i"
        end
    end
end
