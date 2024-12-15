require('nvim-treesitter.configs').setup({
    auto_install = true,
    -- NOTE: python indenting seems wack if I only enable TS highlighing. It
    -- might get fixed if I also use the TS indentation alongside it.
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
