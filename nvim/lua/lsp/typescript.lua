local lspconfig = require('lspconfig')
local on_attach = require("lsp.utils").on_attach

lspconfig.tsserver.setup {
    on_attach = on_attach
}
