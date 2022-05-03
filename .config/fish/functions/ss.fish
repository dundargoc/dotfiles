function ss
    set repo_path (git rev-parse --show-toplevel)
    reset

    if [ $repo_path = $HOME/programs/neovim ]
        gh repo sync dundargoc/neovim --source neovim/neovim
    end

    if [ $repo_path = $HOME/programs/vim ]
        gh repo sync dundargoc/vim --source vim/vim
    end

    if [ $repo_path = $HOME/programs/uncrustify ]
        gh repo sync dundargoc/uncrustify --source uncrustify/uncrustify
    end

    git -C $repo_path fetch --tags
    git -C $repo_path pull --rebase --all
end
