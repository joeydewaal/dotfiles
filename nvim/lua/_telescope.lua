require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules", "*.lock", "target",
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-F"
        }
    }
}
