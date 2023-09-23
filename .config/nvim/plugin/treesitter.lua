require('nvim-treesitter.configs').setup({
    auto_install = true,
    highlight = {
        enable = true,
        disable = { 'cmake' },
    },
    ensure_installed = {
        "bash",
        "c",
        "javascript",
        "lua",
        "markdown",
        "python",
        "query",
        "vim",
        "vimdoc",
        "yaml",
    },
})
