function make
    if test -f Makefile
        command make -s -j $argv
    else
        command make -s -j -C (git rev-parse --show-toplevel) $argv
    end
end
