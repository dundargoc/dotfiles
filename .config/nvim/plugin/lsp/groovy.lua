require('lspconfig').groovyls.setup({
    on_attach = require('lsp').on_attach,
    cmd = {
        'java',
        '-jar',
        os.getenv('HOME')
            .. '/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar',
    },
})
