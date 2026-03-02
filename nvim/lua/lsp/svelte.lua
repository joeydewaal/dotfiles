local mason_path = require('lsp.mason_util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()


vim.lsp.config("svelte", {
    capabilities = capabilities,
    cmd = { mason_path("svelte") },
})

vim.lsp.enable({ "svelte" })
