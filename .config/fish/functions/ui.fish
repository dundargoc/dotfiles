function ui
    if test -f minimal.vim
        bi --clean -u minimal.vim $argv
    else if test -f minimal.lua
        bi --clean -u minimal.lua $argv
    end
end
