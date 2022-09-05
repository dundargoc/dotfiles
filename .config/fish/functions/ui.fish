function ui
    set PROG $HOME/programs
    if test -f $PROG/minimal.vim
        bi --clean -u $PROG/minimal.vim $argv
    else if test -f $PROG/minimal.lua
        bi --clean -u $PROG/minimal.lua $argv
    end
end
