local servers = { 'yamlls', 'vimls', 'cmake', 'bashls', 'jsonls', 'tsserver', 'pyright', 'gopls' }
for _, server in ipairs(servers) do
    require('lspconfig')[server].setup {
        on_attach = require('lsp').on_attach,
    }
end
