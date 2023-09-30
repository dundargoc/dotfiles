function cppcheck
    set repo_path (git rev-parse --show-toplevel)
    reset

    if test (uname) = Darwin
        set cores (sysctl -n hw.logicalcpu)
    else
        set cores (nproc)
    end

    if [ $repo_path = $HOME/programs/uncrustify ]
        set flags --std=c++11
    else if [ $repo_path = $HOME/programs/neovim ]
        set flags --std=c99
    else if [ $repo_path = $HOME/programs/vim ]
        set flags --std=c99
    end

    command cppcheck --project=compile_commands.json --enable=all --disable=unusedFunction --suppress=missingIncludeSystem --suppress=missingInclude --quiet -j$cores $flags $argv
end
