local use_clangd = true

if use_clangd then
    require('lspconfig')['clangd'].setup {
        on_attach = require('lsp').on_attach,
        cmd = { 'clangd', '--background-index=0' },
    }
else
    require('lspconfig')['ccls'].setup {
        on_attach = require('lsp').on_attach,
    }
end
