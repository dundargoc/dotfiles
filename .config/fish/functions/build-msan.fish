function build-msan
    set neovim_path "$HOME/programs/neovim"

    set -x CC clang
    set -x MSAN_OPTIONS "log_path=$HOME/.logs/msan"

    rm -rf "$neovim_path"/build
    make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$neovim_path" CMAKE_EXTRA_FLAGS="-DCLANG_MSAN=ON"
    make -C "$neovim_path" install
end
