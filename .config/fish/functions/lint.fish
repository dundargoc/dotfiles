function lint
    set repo_path (git rev-parse --show-toplevel)
    reset

    if [ $repo_path = $HOME/programs/neovim ]
        make -C $repo_path lint
    end

    if [ $repo_path = $HOME/programs/uncrustify ]
        cbuild
        ctest --test-dir $repo_path/build -j(nproc)
    end
end
