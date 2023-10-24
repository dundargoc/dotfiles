function buildvim
    set -x CC clang
    set vim_path "$HOME/programs/vim"
    if type -q compiledb
        compiledb -o $vim_path/compile_commands.json make -C $vim_path -j
    else if type -q bear
        bear --append --output $vim_path/compile_commands.json -- make -C $vim_path -j
    else
        make -C $vim_path -j
    end
end
