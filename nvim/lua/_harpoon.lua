local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()


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

-- vim.keymap.set("n", "<leader>a", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>s", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>d", function() harpoon:list():select(7) end)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
