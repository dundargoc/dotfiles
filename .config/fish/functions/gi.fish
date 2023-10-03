function gi
    set nvim_path $HOME/programs/neovim/bin/bin/nvim
    set pipe_path $HOME/.cache/nvim/debug-server.pipe
    if test -f minimal.vim
        build
        buildinstall
        cgdb -ex=run --args $nvim_path -S minimal.vim
    else if test -f minimal.lua
        build
        buildinstall
        cgdb -ex=run --args $nvim_path -S minimal.lua
    else
        rm -f $pipe_path
        build
        buildinstall
        lldb -- $nvim_path $argv --headless --listen $pipe_path
    end
end
