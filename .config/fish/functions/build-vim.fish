function build-vim
    cd "$HOME/programs/vim" >/dev/null
    touch src/**/*
    compiledb make -j
end
