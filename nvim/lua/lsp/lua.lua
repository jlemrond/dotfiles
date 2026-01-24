-- NOTE: Add New LSPs to `init.lua`

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

print 'Lua LSP Loaded'
