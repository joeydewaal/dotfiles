local mason_path = require('lsp.mason_util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()


vim.lsp.config("svelte", {
    capabilities = capabilities,
    cmd = { mason_path("svelteserver"), "--stdio" },
    root_markers = { 'package.json', 'svelte.config.js', 'svelte.config.ts', '.git' },
})

vim.lsp.enable({ "svelte" })
