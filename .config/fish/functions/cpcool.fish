function cpcool
  set coolpath $HOME/programs/nvim-cool
  set pluginpath $HOME/.config/nvim/

  cp $coolpath/lua/cool.lua $pluginpath/lua/cool.lua
  cp $coolpath/plugin/cool.vim $pluginpath/plugin/cool.vim
end
