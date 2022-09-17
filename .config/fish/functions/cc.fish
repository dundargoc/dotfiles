function cc
    set repo_path (git rev-parse --show-toplevel)
    ccmake $repo_path/build $argv
end
