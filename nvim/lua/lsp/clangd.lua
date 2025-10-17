vim.lsp.config("clangd", {
    filetypes = { "c", "cpp", "objc", "objcpp" },
    cmd = {
        "/usr/bin/clangd",
        "--background-index",
        "--pch-storage=memory",
        "--clang-tidy",
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
})

vim.lsp.enable({ "clangd" })
