local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("pyright", {
    capabilities = capabilities
})

vim.lsp.enable({ "pyright" })
