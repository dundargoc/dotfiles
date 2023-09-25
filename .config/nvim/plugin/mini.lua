require('mini.comment').setup()
require('mini.operators').setup({
    evaluate = { prefix = '', },
    exchange = { prefix = '', },
    multiply = { prefix = '', },
    replace = { prefix = '', },
    sort = { prefix = 'gs', },
})
require('mini.splitjoin').setup()
