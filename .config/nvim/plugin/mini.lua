require('mini.operators').setup({
    evaluate = { prefix = '', },
    exchange = { prefix = '', },
    multiply = { prefix = '', },
    replace = { prefix = '', },
    sort = { prefix = 'gs', },
})

require('mini.splitjoin').setup()

require('mini.files').setup({
    content = { prefix = function() end },

    -- Close explorer after opening file with `l`
    mappings = {
        go_in = 'L',
        go_in_plus = 'l',
    }
})
vim.keymap.set({ 'n', 'x' }, '<leader>n', function() MiniFiles.open() end)
