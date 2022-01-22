function build
    set neovim_path "$HOME/programs/neovim"

    make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$neovim_path"

    command cp $HOME/programs/neovim/build/compile_commands.json $HOME/programs/neovim/
end
