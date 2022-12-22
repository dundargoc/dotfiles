require('lspconfig').sumneko_lua.setup {
    on_attach = require('lsp').on_attach,
    root_dir = require('lspconfig').util.root_pattern { '.git', 'init.vim' },
    cmd_env= {HOME = ''},
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    -- neovim
                    'vim',
                    'capabilities',
                    -- busted
                    'after_each',
                    'before_each',
                    'context',
                    'describe',
                    'it',
                    'setup',
                    'teardown',
                    'pending',
                    'copcall',
                },
                disable = { 'lowercase-global' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
                maxPreload = 1000,
                preloadFileSize = 500,
                checkThirdParty = false,
            },
            completion = { callSnippet = 'Replace', showWord = 'Disable' },
        },
    },
}
