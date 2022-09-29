local keymap = vim.keymap
-- This prevents x from yanking into the paste buffer so you don't end up copying single letters'
keymap.set('n', 'x', '"_x') 


--Set Leader key
vim.g.mapleader = " "

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select All
keymap.set('n', '<C-s>', 'gg<S-v>G')


-- New tab
keymap.set('n', 'te', ':tabedit<CR>', {silent=true})
-- split window
keymap.set('n', 'ss', ':split<CR><C-w>w', {silent =true})
keymap.set('n', 'sv', ':vsplit<CR><C-w>',{silent = true})
--move window
--
keymap.set('n', '<Tab>', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '4<C-w><')
keymap.set('n', '<C-w><right>', '4<C-w>>')
keymap.set('n', '<C-w><up>', '4<C-w>+')
keymap.set('n', '<C-w><down>', '4<C-w>-')

keymap.set('i', '<C-a>', '<Home>')
-- keymap.set('i', '<C-e>', '<End>')

-- Leader bindings
keymap.set('n', '<leader>w', ':w<CR>')
-- this will toggle the search highlight
keymap.set(
  'n',
  '<leader>l',
  [[ (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n" <BAR> redraw<CR>]],
  { silent= true, expr = true}
)
