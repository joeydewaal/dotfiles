---
-- require('nvim-treesitter.configs').setup {
--   ensure_installed = { "lua", "rust", "toml" },
--   auto_install = true,
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting=false,
--   },
--   ident = { enable = true },
--   rainbow = {
--     enable = true,
--     extended_mode = true,
--     max_file_lines = nil,
--   }
-- }


require("nvim-autopairs").setup {}
require("auto-save").setup {}
require("ibl").setup({
    scope = {
        show_start = false
    }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

require('neoscroll').setup({
    stop_eof = false,
    respect_scrolloff = false,
})

local t    = {}
t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '125' } }
t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '125' } }
t['zt']    = { 'zt', { '125' } }
t['zz']    = { 'zz', { '125' } }
t['zb']    = { 'zb', { '125' } }
require('neoscroll.config').set_mappings(t)

-- lspconfig.clangd.setup{
--   on_attach = on_attach,
--   cmd = {
--     "/usr/bin/clangd-15",
--     "--background-index",
--     "--pch-storage=memory",
--     "--clang-tidy=0",
--     "--suggest-missing-includes",
--     "--all-scopes-completion",
--     "--pretty",
--     "--inlay-hints",
--     "--log=verbose",
--     "--header-insertion=never",
--     "-j=4",
--     "--header-insertion-decorators",
--     "--function-arg-placeholders",
--     "--completion-style=detailed"
--   },
--   init_option = { fallbackFlags = {  "-std=c++2a"  } }
-- }

-----
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "N", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'rust_analyzer', 'lua_ls', 'pyright', 'clangd' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },

        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' },
        { name = 'vsnip' },
        { name = 'calc' },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
})

require("rust-tools").setup(
    {
        tools = {
            inlay_hints = {
                only_current_line = false,
                show_parameter_hints = true,
                parameter_hints_prefix = "",
                other_hints_prefix = "",
                highlight = "Comment",
            },
        },
        server = {
            -- standalone file support
            -- setting it to false may improve startup time
            standalone = true,
        },
    },
    {
        settings = {
            ['rust-analyzer'] = {
                diagnostics = {
                    enable = true,
                }
            }
        }
    })
