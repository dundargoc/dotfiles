function buildnvim
    set neovim_path "$HOME/.neovim"
    set install_path "$HOME/.bin/neovim"

    if test ! -d $neovim_path
        git clone --depth=1 https://github.com/neovim/neovim.git $neovim_path
    end
    git -C "$neovim_path" pull

    if type -q clang
        set -x CC clang
    end
    make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$install_path" CMAKE_BUILD_TYPE=RelWithDebInfo
    rm -rf "$install_path"
    make -C "$neovim_path" install
end
