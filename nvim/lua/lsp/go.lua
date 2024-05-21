local lspconfig = require('lspconfig')
local on_attach = require("lsp.utils").on_attach

lspconfig.gopls.setup {
    on_attach = on_attach,
    cmd = { "gopls" },
    settings = {
        completeUnimplemented = true,
    }
}
