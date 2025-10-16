local function mason_path(path)
    return vim.fn.stdpath("data") .. "/mason/bin/" .. path
end

return mason_path
