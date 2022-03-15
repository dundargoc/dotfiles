local servers = { 'yamlls', 'vimls', 'clangd', 'cmake', 'bashls', 'jsonls', 'eslint', 'tsserver', 'pyright', 'gopls' }
for _, server in ipairs(servers) do
    require('lspconfig')[server].setup {
        on_attach = require('lsp').on_attach,
    }
end
