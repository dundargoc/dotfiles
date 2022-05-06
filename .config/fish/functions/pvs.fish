function pvs
    reset
    set -x NEOVIM_DIR $HOME/programs/neovim
    set -x NEOVIM_COMMIT (git -C $HOME/programs/neovim rev-parse HEAD)
    rm -rf $HOME/programs/neovim/pvs-studio

    if ! test -d $HOME/programs/doc
        git -C $HOME/programs clone git@github.com:neovim/doc.git
    end

    $HOME/programs/doc/ci/pvs-report.sh
end
