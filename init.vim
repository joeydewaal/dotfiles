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
let mapleader = " "
set cursorline

set incsearch
set ignorecase
set smartcase
set gdefault

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Plug 'Pocco81/auto-save.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'

" Plug 'lewis6991/impatient.nvim'
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'saecki/crates.nvim', { 'tag': 'stable' }

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
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'karb94/neoscroll.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'lukas-reineke/indent-blankline.nvim'

set background=dark
call plug#end()

let g:lightline = {'colorscheme': 'seoul256' }

set nobackup
set nowritebackup
set updatetime=300
set signcolumn=no " yes

"switch buffers CTRL hjkl
nmap <silent> K :wincmd k<CR>
nmap <silent> J :wincmd j<CR>
nmap <silent> H :wincmd h<CR>
nmap <silent> L :wincmd l<CR>

imap <C-v> <Nop>
imap <C-s> <Nop>

nnoremap <silent> n nzz
nnoremap <silent> N Nzz


function! HeaderToggle() " bang for overwrite when saving vimrc
let file_path = expand("%")
let file_name = expand("%<")
let extension = split(file_path, '\.')[-1] " '\.' is how you really split on dot
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
    endif
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

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" highlight CursorLine ctermbg=0
:luafile ~/.config/nvim/config.lua

" let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

set splitright
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
nmap <C-j> <Nop>
