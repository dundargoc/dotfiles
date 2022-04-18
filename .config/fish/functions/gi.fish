function gi
    if test -f minimal.vim
        build
        buildinstall
        cgdb -ex=run --args neovim/bin/nvim -S minimal.vim
    else if test -f minimal.lua
        build
        buildinstall
        cgdb -ex=run --args neovim/bin/nvim -S minimal.vim
    end
end
