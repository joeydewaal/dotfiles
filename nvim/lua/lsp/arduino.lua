local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("arduino_language_server", {
    capabilities = capabilities
})

vim.lsp.enable({ "arduino_language_server" })
