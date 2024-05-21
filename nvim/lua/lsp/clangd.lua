local lspconfig = require('lspconfig')
local on_attach = require("lsp.utils").on_attach

lspconfig.clangd.setup {
    on_attach = on_attach,
    cmd = {
        "/usr/bin/clangd",
        "--background-index",
        "--pch-storage=memory",
        "--clang-tidy=0",
        "--suggest-missing-includes",
        "--all-scopes-completion",
        "--pretty",
        "--inlay-hints",
        "--log=verbose",
        "--header-insertion=never",
        "-j=4",
        "--header-insertion-decorators",
        "--function-arg-placeholders",
        "--completion-style=detailed"
    },
    init_option = { fallbackFlags = { "-std=c++2a" } }
}
