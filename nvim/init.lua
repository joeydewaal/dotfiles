vim.opt.number = true
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Tab and indentation settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 12

vim.opt.breakindent = true
vim.opt.smartindent = true

-- Leader key
vim.g.mapleader = " "

-- Show horizontal cursorline
vim.opt.cursorline = true
vim.opt.smartcase = true
-- vim.opt.gdefault = true

vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.signcolumn = "yes:1"

vim.opt.undodir = vim.fn.expand("~/.config/nvim/.undo")
vim.opt.undofile = true

vim.opt.relativenumber = true
vim.opt.lazyredraw = true


vim.pack.add({
    "https://github.com/christoomey/vim-tmux-navigator",
    "https://github.com/ellisonleao/gruvbox.nvim",
    -- "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/f-person/git-blame.nvim",
    "https://github.com/nvim-mini/mini.pairs",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim", -- required by telescope
    "https://github.com/mrcjkb/rustaceanvim",
    "https://github.com/saecki/crates.nvim",
    "https://github.com/nvim-tree/nvim-tree.lua",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

require 'moving'
require 'theme'
require 'misc'
require 'keymaps'
require 'lsp'
require 'completions'

-- require('lualine').setup( { theme = 'gruvbox' })

-- require('neoscroll').setup({
--     mappings = { '<C-u>', '<C-d>',
--         'zt', 'zz', 'zb' },
--     stop_eof = false,
--     respect_scrolloff = false,
-- })


