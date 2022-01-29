function build-vim
    set vim_path "$HOME/programs/vim"
    touch $vim_path/src/**/*
    if type -q compiledb
        compiledb make -C $vim_path -j
    else
        bear --output $vim_path/compile_commands.json -- make -C $vim_path -j
    end
end
