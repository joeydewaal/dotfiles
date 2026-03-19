-- Disable insert mode mappings
vim.keymap.set("i", "<C-v>", "<Nop>")
vim.keymap.set("i", "<C-s>", "<Nop>")


-- Center screen on search navigation
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })


-- Telescope keymaps
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set("n", "<leader>G", "<Cmd>Telescope resume<CR>", { silent = true })
vim.keymap.set('n', '<leader>s', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>r', builtin.lsp_references, {})
vim.keymap.set("n", "<leader>G", "<Cmd>Telescope resume<CR>", { silent = true })


-- Lsp keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', function()
            vim.cmd('vsplit')
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set('n', '<shift><C-]>', function()
            vim.cmd('vsplit')
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set('n', '<f3>', vim.lsp.buf.format, opts)
    end,
})

-- Nvim tree keymaps
vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { silent = true })

-- Map Ctrl-C to Escape in all modes
vim.keymap.set("n", "<C-c>", "<Esc>", { remap = true })
vim.keymap.set("i", "<C-c>", "<Esc>", { remap = true })
vim.keymap.set("v", "<C-c>", "<Esc>", { remap = true })
vim.keymap.set("o", "<C-c>", "<Esc>", { remap = true })

-- Window resize with Alt keys
vim.keymap.set("n", "<M-h>", "<C-W>5<")
vim.keymap.set("n", "<M-l>", "<C-W>5>")
vim.keymap.set("n", "<M-j>", "<C-W>5-")
vim.keymap.set("n", "<M-k>", "<C-W>5+")

-- Clear search highlight on Escape
vim.keymap.set("n", "<Esc>", ":noh<CR><Esc>")


-- Moving codeblocks
vim.keymap.set("x", "<", function()
    vim.cmd("normal! <")
    vim.cmd("normal! gv")
end)

vim.keymap.set("x", ">", function()
    vim.cmd("normal! >")
    vim.cmd("normal! gv")
end)

