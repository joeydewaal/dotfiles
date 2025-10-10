local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.arduino_language_server.setup { capabilities = capabilities }
