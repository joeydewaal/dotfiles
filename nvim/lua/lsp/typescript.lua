local mason_path = require('lsp.mason_util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    cmd = { mason_path("typescript-language-server"), "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
})

vim.lsp.enable({ "ts_ls" })
