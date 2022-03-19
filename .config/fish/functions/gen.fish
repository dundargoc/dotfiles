function gen
    pushd $PROG/neovim >/dev/null

    $PROG/neovim/scripts/gen_vimdoc.py
    rm -f $PROG/neovim/runtime/doc/*.mpack
    popd >/dev/null
end
