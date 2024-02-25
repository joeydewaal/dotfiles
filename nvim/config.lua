local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>r", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>w", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>j", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>k", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>l", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<leader>a", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>s", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>d", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>f", function() harpoon:list():select(8) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

    vim.keymap.set("x", "<" ,function()
        vim.cmd("normal! <")
        vim.cmd("normal! gv")
end)

vim.keymap.set("x", ">" ,function()
    vim.cmd("normal! >")
    vim.cmd("normal! gv")
end)

require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "toml" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

require("nvim-autopairs").setup {
    fast_wrap = {
      -- map = '<M-e>',
      -- chars = { '{', '[', '(', '"', "'" },
      -- pattern = [=[[%'%"%>%]%)%}%,]]=],
      -- end_key = '$',
      -- before_key = 'h',
      -- after_key = 'l',
      -- cursor_pos_before = true,
      -- keys = 'qwertyuiopzxcvbnmasdfghjkl',
      -- manual_position = true,
      -- highlight = 'Search',
      -- highlight_grey='Comment'
    },
}

require("ibl").setup({
    scope = {
        show_start = false,
        highlight = {
            'GruvboxRed',
        }
    },
})


require('telescope').setup{
    defaults = {
            file_ignore_patterns = {
            "node_modules", "*.lock"
        }
    }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})


require('neoscroll').setup({
    mappings = {'<C-u>', '<C-d>',
                'zt', 'zz', 'zb'},
    stop_eof = false,
    respect_scrolloff = false,
})


local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    -- REQUIRED by nvim-cmp. get rid of it once we can
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-Tab>'] = cmp.mapping.complete(),
    -- ["<Tab>"] = cmp.mapping.select_next_item(),
    -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'path' },
  }),
  experimental = {
    ghost_text = true, -- completion inline
  },
    formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
          ellipsis_char = '...',
          show_labelDetails = true,
          before = function (entry, vim_item)
            return vim_item
          end
        })
      }

})




-- Enable completing paths in :
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  })
})
-- Setup lspconfig.
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>vsplit | lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'N', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<f3>", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
  buf_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
  buf_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>', opts)
  -- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.nvim-tree-api.tree.close()<CR>', opts)
    -- None of this semantics tokens business.
  -- https://www.reddit.com/r/neovim/comments/143efmd/is_it_possible_to_disable_treesitter_completely/
  client.server_capabilities.semanticTokensProvider = nil

  -- Get signatures (and _only_ signatures) when in argument lists.
  require "lsp_signature".on_attach({
    doc_lines = 0,
    handler_opts = {
      border = "none"
    },
  })
end


local opts = {
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
          cargo = {
              allFeatures = true,
          },
          completion = {
              postfix = {
                  enable = false,
              },
          },
      },
    },
  },
}
require("rust-tools").setup(opts)
require('crates').setup()

local lspconfig = require('lspconfig')

-- React
require('nvim-ts-autotag').setup()
lspconfig.tsserver.setup{
    on_attach = on_attach
}

lspconfig.pyright.setup{}

lspconfig.clangd.setup{
  on_attach = on_attach,
  cmd = {
    "/usr/bin/clangd",
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
  init_option = { fallbackFlags = {  "-std=c++2a"  } }
}

  local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', '<leader>e', api.tree.close, opts('Help'))
  end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require'nvim-web-devicons'.setup {}

require("nvim-tree").setup({
    on_attach = my_on_attach,
    hijack_cursor = false,
    renderer = {
        indent_markers = {
            enable = true
        },
        icons = {
          webdev_colors = true,
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
          },
        }
    },
})
