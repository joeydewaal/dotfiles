local lspconfig = require('lspconfig')
local on_attach = require("lsp.utils").on_attach

vim.g.zig_fmt_autosave = 0

require("lspconfig").zls.setup({
    on_attach = on_attach,
    settings = {
        zls = {
            enable_inlay_hints = true,
            inlay_hints_show_builtin = true,
            inlay_hints_exclude_single_argument = true,
            inlay_hints_hide_redundant_param_names = false,
            inlay_hints_hide_redundant_param_names_last_token = false,
        },
    }
})
