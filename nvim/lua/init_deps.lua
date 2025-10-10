vim.lsp.config['lua_ls'] = require("lsp/lua_ls")

vim.lsp.enable({ 'lua_ls' })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            -- The completeopt isn't configurable enough to be usefull, so I'm sticking wih cmp.
            -- vim.opt.completeopt = { 'menu', 'menuone', 'fuzzy', 'noselect' }
            -- vim.lsp.completion.enable(true, client.id, ev.buf, {
            --     autotrigger = true,
            -- })
            client.server_capabilities.semanticTokensProvider = nil
        end

        local function buf_set_keymap(mode, map, cmd)
            vim.keymap.set(
                mode, map, cmd, {
                    noremap = true,
                    silent = true,
                    buffer = ev.buf
                })
        end
        buf_set_keymap('n', 'gd', vim.lsp.buf.definition)
        buf_set_keymap('n', 'gD', function()
            vim.cmd('vsplit')
            vim.lsp.buf.definition()
        end)
        buf_set_keymap('n', 'N', vim.lsp.buf.hover)
        buf_set_keymap('n', 'gi', vim.lsp.buf.implementation)
        buf_set_keymap('n', '<C-n>', vim.lsp.buf.signature_help)
        buf_set_keymap('n', '<space>D', vim.lsp.buf.type_definition)
        buf_set_keymap('n', '<space>rn', vim.lsp.buf.rename)
        buf_set_keymap('n', '<space>ca', vim.lsp.buf.code_action)
        buf_set_keymap('n', 'gr', vim.lsp.buf.references)
        buf_set_keymap('n', '[d', vim.diagnostic.goto_prev)
        buf_set_keymap('n', ']d', vim.diagnostic.goto_next)
        buf_set_keymap("n", "<f3>", vim.lsp.buf.format)
        buf_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>')
    end,
})

vim.opt.signcolumn = "yes:1"

local signs = {
    Error = "E",
    Warn = "W",
    Hint = "H",
    Info = "I"
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl
    })
end

-- Diagnostics
-- vim.diagnostic.config({
--     virtual_lines = {
--         severity = {
--             min = vim.diagnostic.severity.INFO
--         },
--         -- Only show virtual line diagnostics for the current cursor line
--         -- current_line = true,
--     },
-- })

-- looks
require "colorscheme"
require "theme_switcher"
require "_treesitter"


-- moving / doing things
require "_harpoon"
require "_move_semantics"
require "_gitblame"
require "_autopairs"
require "_ibl"
require "_telescope"
require "_neoscroll"


require "_cmp"
require "_icons"
require "_ts_autotag"
require "nvim_tree"

-- lsp
require "lsp/rust"
require "lsp/go"
require "lsp/typescript"
require "lsp/zig"
require "lsp/python"
require "lsp/clangd"
require "lsp/html"
require "lsp/svelte"
require "lsp/arduino"
