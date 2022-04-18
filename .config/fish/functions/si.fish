function si
    if test -f minimal.vim
        bi --clean -S minimal.vim $argv
    else if test -f minimal.lua
        bi --clean -S minimal.lua $argv
    end
end
