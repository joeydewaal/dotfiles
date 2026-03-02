local mason_path = require('lsp.mason_util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("gopls", {
    capabilities = capabilities,
    filetypes = { "go" },
    cmd = { mason_path("gopls") },
    settings = {
        completeUnimplemented = true,
    }
})
vim.lsp.enable({ "gopls" })
