function bi
    build
    VIMRUNTIME="$NVIM/runtime" $NVIM/build/bin/nvim -c "set runtimepath^=$NVIM/build/runtime" --luamod-dev $argv
end
