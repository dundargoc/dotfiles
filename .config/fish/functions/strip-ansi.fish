# Quick function to strip ansi color-codes
function strip-ansi
    sed 's/\x1b\[[0-9;]*m//g' -i $argv
end
