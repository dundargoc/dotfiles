function d
    reset
    set root (git rev-parse --show-toplevel)
    $root/gradlew $argv
end
