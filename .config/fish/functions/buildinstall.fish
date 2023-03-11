function buildinstall
    set neovim_path "$HOME/programs/neovim"
    set -x CC clang

    make -C "$neovim_path" CMAKE_BUILD_TYPE=RelWithDebInfo
    cmake --install "$neovim_path"/build --prefix "$neovim_path"/bin
    reset
end
