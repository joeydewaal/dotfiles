vim.keymap.set("x", "<", function()
    vim.cmd("normal! <")
    vim.cmd("normal! gv")
end)

vim.keymap.set("x", ">", function()
    vim.cmd("normal! >")
    vim.cmd("normal! gv")
end)
