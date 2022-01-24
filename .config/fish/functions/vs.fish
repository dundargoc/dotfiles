function vs
    set filename $argv[-1]
    set tmpfile (mktemp)
    vi $argv[1..-2] --startuptime $tmpfile $filename
    vi $tmpfile
    rm -f $tmpfile
end
