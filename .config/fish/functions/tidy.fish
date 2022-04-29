function tidy
    reset
    set repo_path (git rev-parse --show-toplevel)

    if [ $repo_path = $HOME/programs/uncrustify ]
        set extra "-extra-arg=-std=c++11"
    else if [ $repo_path = $HOME/programs/neovim ]
        set extra "-extra-arg=-std=c99"
    else if [ $repo_path = $HOME/programs/vim ]
        set extra "-extra-arg=-std=c89"
    end

    for i in $argv
        clang-tidy "$i" "$extra"
    end
end
