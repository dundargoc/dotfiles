require('nvim-treesitter.configs').setup({
    auto_install = true,
    highlight = {
        enable = true,
        disable = { 'python' },
    },
    ensure_installed = {
        "bash",
        "c",
        "fish",
        "javascript",
        "lua",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "query",
        "vim",
        "vimdoc",
        "yaml",
    },
})
