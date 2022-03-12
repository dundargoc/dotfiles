function cleanbuild
    set neovim_path "$HOME/programs/neovim"

    reset
    make -C "$neovim_path" distclean
    make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$neovim_path"

    command cp $HOME/programs/neovim/build/compile_commands.json $HOME/programs/neovim/
end
