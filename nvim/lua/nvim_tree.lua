local function my_on_attach(bufnr)
local api = require "nvim-tree.api"
local function opts(desc)
  return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end
api.config.mappings.default_on_attach(bufnr)

vim.keymap.set('n', '<leader>e', api.tree.close, opts('Help'))
end

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
