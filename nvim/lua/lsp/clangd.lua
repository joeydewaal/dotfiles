local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
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
