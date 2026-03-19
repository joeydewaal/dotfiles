vim.lsp.config('lua_ls', {
    root_markers = { 'init.lua' },
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        }
    }
})

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

vim.lsp.enable({
    'lua_ls',
    'rust_analyzer',
    'ts_ls',
    'ty', -- python
    'clangd',
    'svelte',
    'racket_langserver'
})
