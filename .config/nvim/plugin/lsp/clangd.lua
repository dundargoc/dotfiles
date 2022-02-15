require('lspconfig')['clangd'].setup {
    on_attach = require('lsp').on_attach,
    cmd = { 'clangd', '--background-index=0' },
}
