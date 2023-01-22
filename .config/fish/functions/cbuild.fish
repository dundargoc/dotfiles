function cbuild
    set -x CC clang
    set path (git rev-parse --show-toplevel)
    set build_path "$path/build"

    cmake -S $path -B $build_path -G Ninja -D CMAKE_EXPORT_COMPILE_COMMANDS=ON -D CMAKE_INSTALL_PREFIX=$path
    cmake --build $build_path

    command cp $build_path/compile_commands.json $path
end
