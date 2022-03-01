local data_path = vim.fn.stdpath 'data'

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
    cmd = {
        'lua-language-server',
        '--logpath=' .. data_path .. '/log',
        '--metapath=' .. data_path .. '/meta',
    },
    on_attach = require('lsp').on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
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
                preloadFileSize = 350,
                checkThirdParty = false,
            },
            completion = { callSnippet = 'Replace', showWord = 'Disable' },
        },
    },
}
