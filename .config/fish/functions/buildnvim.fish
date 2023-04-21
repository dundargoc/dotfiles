function buildnvim
    set neovim_path "$HOME/programs/neovim"
    set install_path "$HOME/.bin/neovim"

    git -C "$neovim_path" pull

    if type -q clang
        set -x CC clang
    end
    make -C "$neovim_path" distclean
    make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$install_path" CMAKE_BUILD_TYPE=RelWithDebInfo
    rm -rf "$install_path"
    make -C "$neovim_path" install
end
