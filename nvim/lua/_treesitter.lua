require("nvim-treesitter").setup()

local ensure_installed = { "rust", "lua", "toml", "svelte", "html", "css", "javascript", "typescript" }
local installed = require("nvim-treesitter").get_installed()
local installed_set = {}
for _, lang in ipairs(installed) do
    installed_set[lang] = true
end
local missing = {}
for _, lang in ipairs(ensure_installed) do
    if not installed_set[lang] then
        table.insert(missing, lang)
    end
end
if #missing > 0 then
    require("nvim-treesitter").install(missing)
end

-- Enable treesitter highlighting and indentation for all filetypes with a parser
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
