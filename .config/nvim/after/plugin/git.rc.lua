local status,  git= pcall(require, "git")
if (not status) then return end
local keymap = vim.keymap.set

git.setup({
  keymaps = {
    blame = "<leader>gb",
    quit_blame = "q",
    blame_commit = "<CR>",
    browse = "<leader>go",
    diff = "<leader>gd",
  }
})
