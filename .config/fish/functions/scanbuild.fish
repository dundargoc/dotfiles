function scanbuild
    set neovim_path "$HOME/programs/neovim"
    set CLANG (which clang)

    rm -rf $neovim_path/build
    scan-build --use-analyzer=$CLANG --exclude "$neovim_path/src/cjson/" --exclude "$neovim_path/src/xdiff/" make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$neovim_path"
end
