function testnuke
    set repo_path (git rev-parse --show-toplevel)
    if [ $repo_path != "$HOME/programs/dundar-organization/neovim" -a $repo_path != "$HOME/programs/notdundargoc/neovim" ]
        echo "Attempting dangerous command outsite of intended area. Abort"
        return 1
    end

    for branch in (git branch | grep -P 'tmp\.(\w|\d){10}')
        gbdd (string trim $branch)
    end
end
