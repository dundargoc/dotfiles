function bi
    build
    VIMRUNTIME=$NVIM/runtime $NVIM/build/bin/nvim --luamod-dev $argv
end
