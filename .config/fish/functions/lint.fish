function lint
    set repo_path (git rev-parse --show-toplevel)
    reset

    if [ $repo_path = $HOME/work/confighub_spa2 ]
        sed 's/python/python3.6/' -i $HOME/work/confighub_spa2/tox.ini
        tox -e pylint -q
        git restore $HOME/work/confighub_spa2/tox.ini
    end

    if [ $repo_path = $HOME/programs/neovim ]
        make -C $repo_path lint
    end

    if [ $repo_path = $HOME/programs/uncrustify ]
        cbuild
        ctest --test-dir $repo_path/build -j(nproc)
    end
end
