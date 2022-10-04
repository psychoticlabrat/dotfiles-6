local status, tree = pcall(require, "nvim-tree")
if (not status) then return end
local keymap = vim.keymap.set

tree.setup({
  hijack_netrw = true, sort_by = "case_sensitive",
  actions = {
    open_file = {
      quit_on_open = true -- closes the vim-tree window after openinga file.  
    }
  },
  view = {
    mappings = {
      list = {
        key = "u", action = "dir_up"
      }
    }
  }
})

keymap("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>")
keymap("n", "<leader>tff", "<cmd>NvimTreeFindFileToggle<CR>")
