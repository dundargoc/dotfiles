function format
    set repo_path (git rev-parse --show-toplevel)
    if [ $repo_path = $HOME ]
        fish_indent --write $XDG_CONFIG_HOME/fish/**/*.fish
        stylua $HOME/.config/nvim
    else if [ $repo_path = $HOME/programs/stalker.nvim ]
        stylua $repo_path
    else if [ $repo_path = $HOME/programs/uncrustify ]
        cmake --build $HOME/programs/uncrustify/build --target format-sources
    end
end
