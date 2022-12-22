require('nvim-treesitter.configs').setup {
    auto_install = true,
    ignore_install = { 'phpdoc', 'c', 'lua', 'help', 'vim' },
    highlight = {
        enable = true,
        disable = { 'markdown' },
    },
}
