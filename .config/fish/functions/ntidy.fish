function ntidy
    build
    reset
    for i in $HOME/programs/neovim/src/nvim/**/*.c
        clang-tidy --checks="-*,google-readability-casting" --fix $i
    end
end
