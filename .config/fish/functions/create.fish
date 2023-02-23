function create
    set current_branch (git rev-parse --abbrev-ref HEAD)
    set default_branch (gh-default-branch)
    set repo_path (git rev-parse --show-toplevel)

    if [ $repo_path = $HOME/programs/dundar-org/neovim ]
        echo "Currently on neodundar. Abort."
        return
    end

    if [ $repo_path = $HOME/programs/dundar-org/nvim-treesitter ]
        echo "Currently on neodundar. Abort."
        return
    end

    if [ $current_branch != $default_branch ]
        gps
        gh pr create --fill --draft
    else
        echo "Current branch is master. Abort."
    end
end
