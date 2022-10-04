local status, gs = pcall(require, "gitsigns")
if (not status) then return end
local keymap = vim.keymap.set

gs.setup()
