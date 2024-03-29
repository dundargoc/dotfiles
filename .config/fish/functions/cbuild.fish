function cbuild
    if type -q clang
        set -x CC clang
    end
    set path (git rev-parse --show-toplevel)
    set build_path "$path/build"

    cmake -S $path -B $build_path -G Ninja -D CMAKE_EXPORT_COMPILE_COMMANDS=ON -D CMAKE_INSTALL_PREFIX=$path/bin $argv
    cmake --build $build_path

    command cp $build_path/compile_commands.json $path
end
