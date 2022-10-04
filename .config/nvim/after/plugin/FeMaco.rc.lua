-- https://github.com/AckslD/nvim-FeMaco.lua
local status, femaco = pcall(require, "femaco")
if (not status) then return end

femaco.setup()

local keymap = vim.keymap.set

keymap('n', '<leader>ef', '<cmd>FeMaco<CR>')
