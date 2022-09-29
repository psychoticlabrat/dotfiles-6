local status, lspzero = pcall(require, "lsp-zero")
if (not status) then return end

lspzero.preset('recommended')
-- lspzero.set_preferences({
--   suggest_lsp_servers = true,
--   setup_servers_on_start = true,
--   set_lsp_keymaps = true,
--   configure_diagnostics = true,
--   cmp_capabilities = true,
--   manage_nvim_cmp = true,
--   call_servers = 'mason',
--   sign_icons = {
--     error = '✘',
--     warn = '▲',
--     hint = '⚑',
--     info = ''
--   }
-- })
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
-- local cmp = require('cmp')
-- lspzero.setup_nvim_cmp({
--   mapping = cmp.mapping.preset.insert({
--     ['<C-e>'] = cmp.mapping.abort()
--   })
-- })
lspzero.setup()
