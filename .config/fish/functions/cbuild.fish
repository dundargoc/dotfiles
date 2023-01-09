function cbuild
    set -x CC clang
    set path (git rev-parse --show-toplevel)
    set build_path "$path/build"

    cmake -S $path -B $build_path -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -G Ninja -DCMAKE_INSTALL_PREFIX=$path
    cmake --build $build_path

    command cp $build_path/compile_commands.json $path
end
