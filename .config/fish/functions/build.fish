function build
    set neovim_path "$HOME/programs/neovim"

    if type -q clang
        set -x CC clang
    end
    make -j -C "$neovim_path" CMAKE_INSTALL_PREFIX="$neovim_path"/bin

    command cp $HOME/programs/neovim/build/compile_commands.json $HOME/programs/neovim/
end
