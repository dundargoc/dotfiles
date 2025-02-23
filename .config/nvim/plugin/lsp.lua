local lspconfig = require('lspconfig')

lspconfig.rust_analyzer.setup {
    settings = { ['rust-analyzer'] = { check = { command = 'clippy' } } },
}
lspconfig.clangd.setup {}
lspconfig.bashls.setup {
    settings = {
        bashIde = {
            shellcheckArguments = "-e SC2086"
        }
    }
}
lspconfig.jsonls.setup {}
lspconfig.pyright.setup {}
lspconfig.yamlls.setup {}
lspconfig.ts_ls.setup {}
lspconfig.zls.setup {}

vim.lsp.config('luals', {
    cmd_env = { HOME = '' },
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
    },
    -- Note this is ignored if the project has a .luarc.json
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                disable = { 'undefined-global' },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    -- TODO: might want to make this smarter by adding this for
                    -- non-neovim repos.
                    -- vim.env.VIMRUNTIME,
                    '${3rd}/busted/library',
                    '${3rd}/luv/library',
                },
            },
            completion = { callSnippet = 'Replace', showWord = 'Disable' },
        },
    },
})
vim.lsp.enable('luals')

-- Global mappings.
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        local opts = { buffer = ev.buf }
        if vim.version.lt(vim.version(), '0.11') then
            vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
        end
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>x', function()
            vim.lsp.buf.format { async = true }
        end, opts)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
    end,
})
