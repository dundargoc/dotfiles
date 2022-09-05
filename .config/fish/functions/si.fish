function si
    set PROG $HOME/programs
    if test -f $PROG/minimal.vim
        bi --clean -S $PROG/minimal.vim $argv
    else if test -f $PROG/minimal.lua
        bi --clean -S $PROG/minimal.lua $argv
    end
end
