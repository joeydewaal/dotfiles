local cmp = require('cmp')
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
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'path' },
    }),
    experimental = {
        ghost_text = true,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            show_labelDetails = true,
            before = function(entry, vim_item)
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
