function builddiff
    set current (git branch --show-current)
    set NVIM $HOME/programs/neovim
    set BUILD $NVIM/build
    set BEFORE $HOME/programs/before
    set AFTER $HOME/programs/after

    rm -rf $BEFORE $AFTER $BUILD

    gis
    build
    mv $BUILD $BEFORE

    gis $current
    build
    cp -r $BUILD $AFTER

    reset
    diff -r -y --suppress-common-lines $BEFORE $AFTER
end
