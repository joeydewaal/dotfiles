-- Basic settings
vim.opt.number = true
vim.opt.ruler = true
vim.opt.encoding = "utf-8"
vim.opt.wrap = true
vim.opt.belloff = "all"
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

-- Visual settings
vim.opt.cursorline = true

-- Search settings
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 50
vim.opt.signcolumn = "no"

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && npx --yes yarn install' })

Plug('christoomey/vim-tmux-navigator')

Plug('morhetz/gruvbox')
Plug('projekt0n/github-nvim-theme')
Plug('catppuccin/nvim', { as = 'catppuccin' })

Plug('itchyny/lightline.vim')

Plug('ThePrimeagen/harpoon', { branch = 'harpoon2' })

--  Github info
Plug('f-person/git-blame.nvim')
Plug('sindrets/diffview.nvim')

Plug('chrisgrieser/nvim-lsp-endhints')

Plug('windwp/nvim-autopairs')
Plug('ntpeters/vim-better-whitespace')
Plug('tpope/vim-commentary')

--  Rust
Plug('rust-lang/rust.vim')
Plug('simrat39/rust-tools.nvim')
Plug('mrcjkb/rustaceanvim')
Plug('saecki/crates.nvim', { tag = 'v0.6.0' })

--  React
Plug('windwp/nvim-ts-autotag')

--  Zig
Plug('ziglang/zig.vim')

--  Inlay hints
Plug('MysticalDevil/inlay-hints.nvim')

Plug('onsails/lspkind.nvim')

Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
-- Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')

Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')

Plug('mason-org/mason.nvim')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('karb94/neoscroll.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.8' })
Plug('lukas-reineke/indent-blankline.nvim')
vim.call('plug#end')


-- Tmux navigation
vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })

-- Disable insert mode mappings
vim.keymap.set("i", "<C-v>", "<Nop>")
vim.keymap.set("i", "<C-s>", "<Nop>")

-- Center screen on search navigation
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })

-- Plugin-specific keymaps
vim.keymap.set("n", "<leader>i", "<Cmd>GitBlameToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>G", "<Cmd>Telescope resume<CR>", { silent = true })

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

-- Delete to black hole register (don't save in registers)
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("x", "d", '"_d')
vim.keymap.set("x", "p", '"_dP')

-- Additional settings
vim.opt.undodir = vim.fn.expand("~/.config/nvim/.undo")
vim.opt.undofile = true
vim.opt.relativenumber = true
vim.opt.ttyfast = true
vim.opt.lazyredraw = true

-- Global variables
vim.g.tmux_navigator_no_wrap = 1
vim.g.lightline = {
    colorscheme = 'seoul256', component = { filename = '%f' }
}


-- Load dependencies
require('init_deps')
