require("nvim-autopairs").setup {}
require("indent_blankline").setup
{
    show_current_context = true,
    show_current_context_start = false,
}

-- require('impatient')


local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Move to previous/next
map('n', '<leader>l', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>h', '<Cmd>BufferNext<CR>', opts)
map('n', '<leader>p', '<Cmd>BufferPin<CR>', opts)
-- map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Magic buffer-picking mode
-- map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


require('neoscroll').setup(
{
     stop_eof = false,
     respect_scrolloff = false,
})

local t = {}
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '125'}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '125'}}
--t['<C-y>'] = {'scroll', {'-1', 'true', '25'}}
--t['<C-e>'] = {'scroll', { '1', 'true', '25'}}
t['zt']    = {'zt', {'125'}}
t['zz']    = {'zz', {'125'}}
t['zb']    = {'zb', {'125'}}
require('neoscroll.config').set_mappings(t)


local cmp = require('cmp')
cmp.setup(
{
    snippet =
    {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert(
    {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = {
         -- { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help'},
    { name = 'nvim_lua' },
    { name = 'buffer'  },
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
      -- documentation = cmp.config.disable,
  },
  -- formatting = {
  --     fields = {'menu', 'abbr', 'kind'},
  --     format = function(entry, item)
  --         local menu_icon ={
  --             nvim_lsp = 'λ',
  --             vsnip = '⋗',
  --             buffer = 'Ω',
  --             path = '🖫',
  --         }
  --         item.menu = menu_icon[entry.source.name]
  --         return item
  --     end,
  -- },
})


-- vim.diagnostic.config({
--     update_in_insert = true,
-- })


local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

require('rust-tools').setup{
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  server = {
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
        diagnostics = {
            enable = true,
            -- experimental = {
            --     enable = true
            -- }
        }
      },
    },
  },
}


 require('lspconfig').clangd.setup{
  on_attach = on_attach,
  cmd = {
    "/usr/bin/clangd-15",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy=0",
    "--suggest-missing-includes",
    "--all-scopes-completion",
    "--pretty",
    "--inlay-hints",
    "--log=verbose",
    "--header-insertion=never",
    "-j=4",
    "--header-insertion-decorators",
    "--function-arg-placeholders",
    "--completion-style=detailed"
  },
  -- root_dir = utils.root_pattern("compile_commands.json", "compile_flags.txt", ".git")
  init_option = { fallbackFlags = {  "-std=c++2a"  } }
}

-- -- Treesitter Plugin Setup
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
