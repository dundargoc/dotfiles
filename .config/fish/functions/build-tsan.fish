function build-tsan
    set neovim_path "$HOME/programs/neovim"

    set -x CC clang
    set -x TSAN_OPTIONS "log_path=$HOME/.logs/tsan"

    make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$neovim_path" CMAKE_EXTRA_FLAGS="-DCLANG_TSAN=ON"
    make -C "$neovim_path" install
end
