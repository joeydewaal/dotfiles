local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("html", {
    capabilities = capabilities
})

vim.lsp.enable({ "html" })
