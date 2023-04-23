require('lspconfig').yamlls.setup({
    on_attach = require('lsp').on_attach,
    settings = {
        yaml = {
            -- This should be fixed in yaml-language-server version >1.12.0
            keyOrdering = false,
        },
    },
})
