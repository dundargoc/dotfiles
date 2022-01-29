function build-vim
    cd "$HOME/programs/vim" >/dev/null
    touch src/**/*
    if type -q compiledb
        compiledb make -j
    else
        bear -- make -j
    end
end
