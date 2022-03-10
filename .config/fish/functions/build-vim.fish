function build-vim
    set -x CC clang
    set vim_path "$HOME/programs/vim"
    touch $vim_path/src/**/*
    if type -q compiledb
        compiledb -o $vim_path/compile_commands.json make -C $vim_path -j
    else
        bear --output $vim_path/compile_commands.json -- make -C $vim_path -j
    end
end
