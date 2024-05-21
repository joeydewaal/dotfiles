set number
set ruler
set encoding=utf-8
set wrap
set mouse -=a
set belloff=all
set noshowmode
set splitbelow
set splitright
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=12

set breakindent
set smartindent
let mapleader = " "

set cursorline

set incsearch
set ignorecase
set smartcase
set gdefault


call plug#begin()
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

Plug'christoomey/vim-tmux-navigator'

Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'itchyny/lightline.vim'

Plug 'ThePrimeagen/harpoon' , { 'branch' : 'harpoon2' }

" Inline github info
Plug 'f-person/git-blame.nvim'

Plug 'windwp/nvim-autopairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'saecki/crates.nvim', { 'tag': 'stable' }

" React
Plug 'windwp/nvim-ts-autotag'

" Zig
Plug 'ziglang/zig.vim'

" Inlay hints
Plug 'MysticalDevil/inlay-hints.nvim'

Plug 'onsails/lspkind.nvim'

Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'williamboman/mason.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'karb94/neoscroll.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()

let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'component': {
    \ 'filename': '%f'
    \    }
\}


set nobackup
set nowritebackup
set updatetime=50
set signcolumn=no

"switch buffers CTRL hjkl
nnoremap <silent> <C-h> <Cmd>NvimTmuxNavigateLeft<CR>
nnoremap <silent> <C-j> <Cmd>NvimTmuxNavigateDown<CR>
nnoremap <silent> <C-k> <Cmd>NvimTmuxNavigateUp<CR>
nnoremap <silent> <C-l> <Cmd>NvimTmuxNavigateRight<CR>


imap <C-v> <Nop>
imap <C-s> <Nop>

nnoremap <silent> n nzz
nnoremap <silent> N Nzz

nnoremap <silent> <leader>i <Cmd>GitBlameToggle<CR>
nnoremap <silent> <leader>e <Cmd>NvimTreeToggle<CR>


function! HeaderToggle()
let file_path = expand("%")
let file_name = expand("%<")
let extension = split(file_path, '\.')[-1]
let err_msg = "There is no file "

if extension == "cpp"
    let next_file = join([file_name, ".hpp"], "")

    if filereadable(next_file)
    :e %<.hpp
    else
        echo join([err_msg, next_file], "")
    endif
elseif extension == "hpp"
    let next_file = join([file_name, ".cpp"], "")

    if filereadable(next_file)
        :e %<.cpp
    else
        echo join([err_msg, next_file], "")
    endifinit
else
    echo ""
endif
endfunction

au Filetype cpp nmap T :call HeaderToggle()<CR>
au Filetype c nmap T :call HeaderToggle()<CR>


nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

"window resize:
nnoremap <M-h> <C-W>5<
nnoremap <M-l> <C-W>5>
nnoremap <M-j> <C-W>5-
nnoremap <M-k> <C-W>5+

nnoremap <esc> :noh<return><esc>

:lua require('init_deps')

let g:tmux_navigator_no_wrap = 1

set splitbelow

set undodir=~/.config/nvim/.undo
set undofile

set relativenumber

set ttyfast
set lazyredraw

" Delete niet in registers opslaan
nnoremap d "_d
xnoremap d "_d
xnoremap p "_dP
