local mason_path = require('lsp.mason_util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("html", {
    capabilities = capabilities,
    cmd = { mason_path("html") },
})

vim.lsp.enable({ "html" })
