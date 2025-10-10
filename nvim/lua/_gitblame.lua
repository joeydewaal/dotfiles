vim.g.gitblame_date_format = '%r'
vim.g.gitblame_delay = 1
vim.g.gitblame_highlight_group = "StatusLineNC"
vim.g.gitblame_virtual_text_column = 85

require('gitblame').setup {
    enabled = false,
}
