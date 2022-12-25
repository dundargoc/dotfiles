require('lspconfig').tsserver.setup({
    on_attach = require('lsp').on_attach,
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
    },
})
