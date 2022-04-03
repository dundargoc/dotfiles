function cpcool
  set coolpath $HOME/programs/nvim-cool
  set pluginpath $HOME/.config/nvim/

  cp $coolpath/lua/cool.lua $pluginpath/lua/cool.lua
  cp $coolpath/plugin/cool.vim $pluginpath/plugin/cool.vim
  sed '/nvim-cool/d' -i $XDG_CONFIG_HOME/nvim/plugin/packer.lua
end
