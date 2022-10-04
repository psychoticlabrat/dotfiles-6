-- If packer's not installed, install it.
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute(
    '!git clone https://github.com/wbthomason/packer.nvim ' .. install_path
  )
end
local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- package manager
  use "nvim-lua/plenary.nvim" -- utils
  -- use 'Shatur/neovim-ayu' -- colorscheme
  use 'NLKNguyen/papercolor-theme' -- colorscheme
  use 'folke/tokyonight.nvim'
  use 'hoob3rt/lualine.nvim' -- statusline
  -- tmux integration
  use 'christoomey/vim-tmux-navigator'
  use 'sjl/vitality.vim'
  -- tpope
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  use { 'glepnir/lspsaga.nvim', branch = 'main', }


  use 'nvim-treesitter/nvim-treesitter'
  -- Markdown
  use 'lukas-reineke/headlines.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-frecency.nvim',
    requires = {
      { 'kkharji/sqlite.lua' }
    }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'cormacrelf/dark-notify'

  -- Code Blocks advanced editing
  -- can be used for writing out code in markdown
  use 'AckslD/nvim-FeMaco.lua'

  use 'lukas-reineke/indent-blankline.nvim'

  -- Gutter git information
  use 'lewis6991/gitsigns.nvim'

  -- use 'MunifTanjim/prettier.nvim'
  -- use 'jose-elias-alvarez/null-ls.nvim'

  use 'dinhhuy258/git.nvim'

end)
