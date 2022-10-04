local status, lspsaga = pcall(require, "lspsaga")
if (not status) then return end

lspsaga.init_lsp_saga()

local keymap = vim.keymap.set

keymap("n", "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
keymap("n", "<leader>gr", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Code action
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
