function check
    set repo_path (git rev-parse --show-toplevel)

    if [ $repo_path = $HOME ]
        echo "Current repo is \$HOME. Abort."
    else
        gh pr checkout -R neovim/neovim $argv
    end
end
