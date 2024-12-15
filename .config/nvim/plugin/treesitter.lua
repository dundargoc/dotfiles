require('nvim-treesitter.configs').setup({
    auto_install = true,
    highlight = {
        enable = true,
        disable = { 'python', 'make' },
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
        "query",
        "vim",
        "vimdoc",
        "yaml",
    },
})
