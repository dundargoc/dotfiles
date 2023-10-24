function make
    if test -f Makefile
        command make -s $argv
    else
        command make -s -C (git rev-parse --show-toplevel) $argv
    end
end
