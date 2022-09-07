function cppcheck
    set repo_path (git rev-parse --show-toplevel)
    reset

    if [ $repo_path = $HOME/programs/uncrustify ]
        command cppcheck --project=compile_commands.json --enable=all --quiet -j(nproc) --std=c++11 $argv
    else if [ $repo_path = $HOME/programs/neovim ]
        command cppcheck --project=compile_commands.json --enable=all --quiet -j(nproc) --std=c99 $argv
    else if [ $repo_path = $HOME/programs/vim ]
        command cppcheck --project=compile_commands.json --enable=all --quiet -j(nproc) --std=c99 $argv
    else
        command cppcheck --project=compile_commands.json --enable=all --quiet -j(nproc) $argv
    end
end
