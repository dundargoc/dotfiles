function buildviminstall
    set -x CC clang
    set vim_path "$HOME/programs/vim"

    make -C $vim_path distclean
    $vim_path/configure --prefix=$vim_path && make -C $vim_path -j && make -C $vim_path install
end
