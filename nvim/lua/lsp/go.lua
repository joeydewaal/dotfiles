vim.lsp.config("gopls", {
    cmd = { "gopls" },
    settings = {
        completeUnimplemented = true,
    }
})
vim.lsp.enable({ "gopls" })
