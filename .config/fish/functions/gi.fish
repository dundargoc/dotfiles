function gi
    set PROG $HOME/programs
    if test -f $PROG/minimal.vim
        build
        buildinstall
        cgdb -ex=run --args $PROG/neovim/bin/nvim -S minimal.vim
    else if test -f $PROG/minimal.lua
        build
        buildinstall
        cgdb -ex=run --args $PROG/neovim/bin/nvim -S minimal.lua
    end
end
