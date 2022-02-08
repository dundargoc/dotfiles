function lint
    set repo_path (git rev-parse --show-toplevel)
    if [ $repo_path = $HOME/programs/confighub_spa2 ]
        reset
        tox -e pylint
    end

    if [ $repo_path = $HOME/programs/neovim ]
        reset
        make -C $repo_path lint
    end
end
