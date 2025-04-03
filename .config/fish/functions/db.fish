function db
    set root (git rev-parse --show-toplevel)
    $root/gradlew build $argv
end
