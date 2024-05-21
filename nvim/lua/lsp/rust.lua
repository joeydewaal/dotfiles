local on_attach = require("lsp.utils").on_attach


vim.g.rustfmt_emit_files = 1
vim.g.rustfmt_fail_silently = 0


local opts = {
    tools = {
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    allFeatures = true,
                },
                completion = {
                    postfix = {
                        enable = false,
                    },
                },
            },
        },
    },
}
require("rust-tools").setup(opts)
require('crates').setup()
