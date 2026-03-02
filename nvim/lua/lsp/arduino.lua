local mason_path = require('lsp.mason_util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("arduino_language_server", {
    capabilities = capabilities,
    cmd = { mason_path("arduino_language_server") },
})

vim.lsp.enable({ "arduino_language_server" })
