function ck
    set path (git rev-parse --show-toplevel)
    set build_path "$path/build"
    ccmake $build_path
end
