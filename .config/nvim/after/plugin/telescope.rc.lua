local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local keymap = vim.keymap

keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap.set('n','<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap.set('n','<leader>fb', '<cmd>Telescope buffers<cr>')
keymap.set('n','<leader>fh', '<cmd>Telescope help_tags<cr>')

telescope.load_extension "file_browser"
telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    }
  }
}
