function gi2
    set nvim_path $HOME/programs/neovim/bin/bin/nvim
    set pipe_path $HOME/.cache/nvim/debug-server.pipe
    $nvim_path --remote-ui --server $pipe_path
end
