require('least.plugins')
require('least.base')
require('least.highlights')
require('least.maps')

local has = function(x)
  return vim.fn.has(x) == 1
end


local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('least.macos')
end

if is_win then
  require('least.windows')
end

-- pcall(vim.cmd, 'colorscheme  papercolor')
-- pcall(vim.cmd, 'set background=dark')
