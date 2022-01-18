function soft-to-hard
    if [ -L $argv ]
        set temp (readlink "$argv")
        rm -rf "$argv"
        cp -rf "$temp" "$argv"
    end
end
