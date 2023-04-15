function bi
    build
    buildinstall
    $PROG/neovim/bin/bin/nvim $argv
    gclc --quiet
end
