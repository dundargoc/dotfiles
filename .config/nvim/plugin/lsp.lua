local api = vim.api
local buf_set_keymap = api.nvim_buf_set_keymap

on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

function lsp_sumneko_lua()
    local data_path = os.getenv 'XDG_DATA_HOME'

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
        on_attach = on_attach,
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
                    },
                    disable = { 'lowercase-global' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = api.nvim_get_runtime_file('', true),
                    maxPreload = 1000,
                    preloadFileSize = 350,
                    checkThirdParty = false,
                },
                completion = { callSnippet = 'Replace', showWord = 'Disable' },
            },
        },
    }
end

function lsp_init()
    local servers = { 'tsserver', 'yamlls', 'pyright', 'clangd', 'vimls', 'cmake', 'bashls', 'jsonls' }
    for _, server in ipairs(servers) do
        require('lspconfig')[server].setup {
            on_attach = on_attach,
        }
    end
end

lsp_sumneko_lua()
lsp_init()
