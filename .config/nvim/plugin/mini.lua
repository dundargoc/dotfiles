require('mini.comment').setup()
require('mini.operators').setup({
    evaluate = { prefix = '', },
    exchange = { prefix = '', },
    multiply = { prefix = '', },
    replace = { prefix = '', },
    sort = { prefix = 'gs', },
})
require('mini.splitjoin').setup()
require('mini.files').setup({ content = { prefix = function() end } })
vim.keymap.set({ 'n', 'x' }, '<leader>n', function() MiniFiles.open() end)
