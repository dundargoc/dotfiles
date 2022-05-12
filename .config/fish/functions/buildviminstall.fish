function buildviminstall
    set -x CC clang
    set vim_path "$HOME/programs/vim"

    pushd $vim_path >/dev/null
    make distclean
    $vim_path/configure --prefix=$vim_path && make -C $vim_path -j && make -C $vim_path install
    popd >/dev/null
end
