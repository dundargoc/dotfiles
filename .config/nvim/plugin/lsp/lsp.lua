local servers = { 'yamlls', 'clangd', 'vimls', 'cmake', 'bashls', 'jsonls', 'tsserver', 'pyright' }
for _, server in ipairs(servers) do
    require('lspconfig')[server].setup {
        on_attach = require('lsp').on_attach,
    }
end
