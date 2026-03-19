require("gruvbox").setup({
    contrast = "hard", -- can be "hard", "soft" or empty string
    background = "dark"
})
vim.cmd("colorscheme gruvbox")

vim.opt.termguicolors = true

-- From a goated reddit post, make sure treesitter highlighting takes priority over lsp semantic tokens.
vim.highlight.priorities.semantic_tokens = 95

require("ibl").setup({
    indent = {
        char = "│",
        smart_indent_cap = true,
    },
    scope = {
        enabled = true,
        show_end = false,
        show_start = false,
        highlight = {
            'Tag'
        }
    },
})

vim.cmd [[ au BufEnter * setlocal cursorline ]]
vim.cmd [[ au BufLeave * setlocal nocursorline ]]

require("nvim-treesitter").setup({
    install = {
        "lua",
        "python",
        "javascript",
        "rust",
        "typescript",
        "svelte",
        "toml",
        "html",
        "css"
    },
})


vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local ft = vim.bo[args.buf].filetype

        if ft == "TelescopePrompt" then
            return
        end

        pcall(vim.treesitter.start, args.buf)
    end,
})

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = 'E',
            [vim.diagnostic.severity.WARN] = 'W',
            [vim.diagnostic.severity.HINT] = 'H',
            [vim.diagnostic.severity.INFO] = 'I',
        },
    },
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require 'nvim-web-devicons'.setup {}


-- default settings
-- require("lsp-endhints").setup {
-- 	icons = {
-- 		type = "",
-- 		parameter = "",
-- 		offspec = "", -- hint kind not defined in official LSP spec
-- 		unknown = "", -- hint kind is nil
-- 	},
-- 	label = {
-- 		truncateAtChars = 20,
-- 		padding = 1,
-- 		marginLeft = 0,
-- 		sameKindSeparator = ", ",
-- 	},
-- 	extmark = {
-- 		priority = 50,
-- 	},
-- 	autoEnableHints = true,
-- }
-- require("lsp-endhints").enable()


