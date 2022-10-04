vim.cmd('autocmd!')
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.fileencoding = 'utf-8'
vim.wo.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.mouse ="a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.swapfile = false

vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- smart indent
vim.opt.wrap = true--no wrap lines
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append {'**'} -- finding files - search down into the subfolders 
vim.opt.wildignore:append { '*/node_modules/*'}
vim.opt.wildignorecase = true

-- Undercurl... not working iterm? 
vim.cmd([[let &t_Cs = "\e[4:3"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])


vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append {
  'r' }

vim.opt.clipboard = unnamed
vim.opt.cmdheight = 2
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true
