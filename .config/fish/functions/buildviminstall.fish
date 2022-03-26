function buildviminstall
    set -x CC clang
    set vim_path "$HOME/programs/vim"

    $vim_path/configure --prefix=$vim_path
    make -C $vim_path -j
    make -C $vim_path install
end
