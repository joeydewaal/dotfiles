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

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
" Plug 'Pocco81/auto-save.nvim'

Plug 'windwp/nvim-autopairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'simrat39/rust-tools.nvim'
Plug 'lewis6991/impatient.nvim'


Plug 'rust-lang/rust.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'karb94/neoscroll.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-tree/nvim-web-devicons'

set background=dark
call plug#end()

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

"switch buffers CTRL hjkl
nmap <silent> K :wincmd k<CR>
nmap <silent> J :wincmd j<CR>
nmap <silent> H :wincmd h<CR>
nmap <silent> L :wincmd l<CR>

nnoremap <C-w>f :MaximizerToggle<CR>
vnoremap <C-w>f :MaximizerToggle<CR>gv
inoremap <C-w>f :MaximizerToggle<CR>
imap <C-v> <Nop>
imap <C-s> <Nop>


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

nmap T :call HeaderToggle()<CR>
nmap <c-j> 4j
nmap <c-k> 4k
vmap <c-j> 4j
vmap <c-k> 4k

nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

"window resize:
nnoremap <M-h> <C-W>5<
nnoremap <M-l> <C-W>5>
nnoremap <M-j> <C-W>5-
nnoremap <M-k> <C-W>5+

"jump down / up
" nnoremap <C-h> b
" nnoremap <C-l> e
" vnoremap <C-h> b
" vnoremap <C-l> e

"stop highlighting until next search
nnoremap <esc> :noh<return><esc>

let g:gruvbox_contrast_dark = 'hard'
set background=dark
"if has('termguicolors')
    "set termguicolors
"endif

"colorscheme gruvbox-material
colorscheme gruvbox
:luafile ~/.config/nvim/config.lua
highlight CursorLine ctermbg=0
