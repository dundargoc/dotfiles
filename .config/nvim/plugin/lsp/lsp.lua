local servers = { 'vimls', 'clangd', 'bashls', 'jsonls', 'pyright', 'tsserver', 'cmake' }
for _, server in ipairs(servers) do
    require('lspconfig')[server].setup({
        on_attach = require('lsp').on_attach,
    })
end
