local mason_path = require('lsp.mason_util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("pyright", {
    capabilities = capabilities,
    cmd = { mason_path("pyright-langserver"), "--stdio" },
    filetypes = { 'python' },
})

vim.lsp.enable({ "pyright" })
