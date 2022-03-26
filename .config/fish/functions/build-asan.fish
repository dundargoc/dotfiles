function build-asan
    set neovim_path "$HOME/programs/neovim"

    set -x CC clang

    # Change to detect_leaks=1 to detect memory leaks (slower).
    set -x ASAN_OPTIONS "detect_leaks=0:log_path=$HOME/.logs/asan"

    # Show backtraces in the logs.
    set -x UBSAN_OPTIONS print_stacktrace=1

    make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$neovim_path" CMAKE_EXTRA_FLAGS="-DCLANG_ASAN_UBSAN=ON"
    make -C "$neovim_path" install
end
