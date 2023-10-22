require('nvim-treesitter.configs').setup({
    auto_install = true,
    highlight = {
        enable = true,
        disable = { 'cmake', 'python' },
    },
    ensure_installed = {
        "bash",
        "c",
        "javascript",
        "lua",
        "markdown",
        "nix",
        "python",
        "query",
        "vim",
        "vimdoc",
        "yaml",
    },
})
