local lspconfig = require('lspconfig')

lspconfig.vimls.setup {}
lspconfig.clangd.setup {}
lspconfig.bashls.setup {}
lspconfig.jsonls.setup {}
lspconfig.pyright.setup {}
lspconfig.cmake.setup {}

lspconfig.lua_ls.setup({
    root_dir = require('lspconfig').util.root_pattern({ '.git', 'init.vim' }),
    cmd_env = { HOME = '' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                disable = { 'lowercase-global', 'assign-type-mismatch', 'missing-parameter' },
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                    "${3rd}/busted/library",
                    "${3rd}/luv/library"
                },
                checkThirdParty = false,
            },
            completion = { callSnippet = 'Replace', showWord = 'Disable' },
        },
    },
})

lspconfig.groovyls.setup({
    cmd = {
        'java',
        '-jar',
        os.getenv('HOME')
        .. '/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar',
    },
})

lspconfig.yamlls.setup({
    settings = {
        yaml = {
            -- This should be fixed in yaml-language-server version >1.12.0
            keyOrdering = false,
        },
    },
})

-- Global mappings.
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
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
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
