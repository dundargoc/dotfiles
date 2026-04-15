require('nvim-treesitter').install {
    "bash",
    "fish",
    "git_config",
    "git_rebase",
    "gitcommit",
    "javascript",
    "json",
    "kitty",
    "nix",
    "python",
    "requirements",
    "starlark",
    "toml",
    "yaml",
    "zsh",
}

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(function() vim.treesitter.start() end)
        -- vim.treesitter.start()
    end,
})

-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = { '*' },
--     callback = function() vim.treesitter.start() end,
-- })
