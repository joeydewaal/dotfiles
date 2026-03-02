require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site',
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}
require('nvim-treesitter').install({ 'rust', 'lua', 'toml' })
