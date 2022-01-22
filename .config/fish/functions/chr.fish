function chr
    reset
    find . -name "*.sh" -exec shellcheck -x -W 0 -e SC2086 $argv {} \;
end
