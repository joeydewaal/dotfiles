vim.g._is_darkmode = true

function ThemeToggle()
    if vim.g._is_darkmode == true then
        os.execute('~/.config/alacritty/lightmode.sh')
        vim.cmd('colorscheme catppuccin-latte')
    else
        os.execute('~/.config/alacritty/darkmode.sh')
        vim.cmd('set background=dark')
        vim.cmd('colorscheme gruvbox')
    end
    vim.g._is_darkmode = not vim.g._is_darkmode
end

vim.keymap.set('n', "<F5>", ThemeToggle)
