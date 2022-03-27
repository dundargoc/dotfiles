function ss
    # Sync Neovim
    gh repo sync dundargoc/neovim --source neovim/neovim
    git -C $HOME/programs/neovim fetch --tags
    git -C $HOME/programs/neovim pull --rebase --all

    # Sync Vim
    gh repo sync dundargoc/vim --source vim/vim
    git -C $HOME/programs/vim fetch --tags
    git -C $HOME/programs/vim pull --rebase --all
end
