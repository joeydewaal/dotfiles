vim.g.rustfmt_emit_files = 1
vim.g.rustfmt_fail_silently = 0


vim.g.rustaceanvim = {
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

require("crates").setup {
    lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
    },
}
