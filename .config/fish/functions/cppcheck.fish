function cppcheck
    set repo_path (git rev-parse --show-toplevel)
    reset

    if [ $repo_path = $HOME/programs/uncrustify ]
        set flags --std=c++11
    else if [ $repo_path = $HOME/programs/neovim ]
        set flags --std=c99
    else if [ $repo_path = $HOME/programs/vim ]
        set flags --std=c99
    end

    command cppcheck --project=compile_commands.json --enable=all --disable=unusedFunction --quiet -j(nproc) $flags $argv
end
