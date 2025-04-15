function db
    reset
    set root (git rev-parse --show-toplevel)
    $root/gradlew build $argv
end
