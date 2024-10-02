local base = require 'plugins.configs.lspconfig'
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require 'lspconfig'

lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
  cmd = { 'typescript-language-server', '--stdio' },
  capabilities = capabilities,
}

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'nvim' },
      },
      workspace = {
        library = unpack(vim.api.nvim_get_runtime_file('', true)),
        checkThirdParty = false,
      },
    },
  },
}
