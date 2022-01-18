require('nvim-treesitter.configs').setup {
    ensure_installed = 'maintained',
    highlight = {
        disable = { 'vim' },
        enable = true,
    },
}
