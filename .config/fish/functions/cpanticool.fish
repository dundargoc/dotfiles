function cpanticool
    set coolpath $HOME/programs/nvim-cool
    set pluginpath $HOME/.config/nvim/

    cp $pluginpath/lua/cool.lua $coolpath/lua/cool.lua
    cp $pluginpath/plugin/cool.vim $coolpath/plugin/cool.vim
end
