local status, lspzero = pcall(require, "lsp-zero")
if (not status) then return end


lspzero.preset('recommended')
lspzero.configure('sumneko_lua', {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'hs', 'on_attach' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
})


lspzero.setup()
