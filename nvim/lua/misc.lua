vim.g.gitblame_date_format = '%r'
vim.g.gitblame_delay = 1
vim.g.gitblame_highlight_group = "StatusLineNC"
vim.g.gitblame_virtual_text_column = 85

require('gitblame').setup({ enabled = false })

vim.keymap.set("n", "<leader>i", "<Cmd>GitBlameToggle<CR>", { silent = true })


require("mini.pairs").setup()

require('telescope').setup {
    defaults = {
        previewer = true,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        file_ignore_patterns = {
            "node_modules", "*.lock", "target",
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-F"
        }
    }
}

require("crates").setup {
    lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
    },
}
