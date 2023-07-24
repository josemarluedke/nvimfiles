local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  execute('packadd packer.nvim')
end

-- Autocompile
vim.cmd('autocmd BufWritePost init.lua PackerCompile')

return require('packer').startup(function(use)
  -- Package Manager
  use('wbthomason/packer.nvim')

  -- LSP
  use({
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
    'ray-x/lsp_signature.nvim',
  })
  use({
    'williamboman/mason-lspconfig.nvim',
     run = ":MasonUpdate",
    config = function()
      require('lsp')
    end,
  })
  use({
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = function()
      require('plugins.lspsaga')
    end,
  })

  -- Autocomplete
  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.nvim-cmp').init()
    end,
    requires = {
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-path' },
      { 'onsails/lspkind-nvim' },
      { 'ray-x/lsp_signature.nvim' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-cmdline' },
    },
    -- event = 'InsertEnter'
  })

  -- Navigation
  use({
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('plugins.nvim-tree')
    end,
  })

  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('plugins.telescope')
    end,
  })

  -- Convenience
  -- use 'folke/which-key.nvim'
  use('tpope/vim-abolish')
  use('AndrewRadev/splitjoin.vim')
  use({
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function()
      require('plugins.autopairs')
    end,
  })
  use({
    'terrortylor/nvim-comment',
    config = function()
      require('plugins.nvim-comment')
    end,
  })
  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('plugins.colorizer')
    end,
  })
  use({
    'akinsho/nvim-toggleterm.lua',
    config = function()
      require('plugins.nvim-toggleterm')
    end,
  })
  use({
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },

    config = function()
      require('gitsigns').setup()
    end,
  })
  use({
    'plasticboy/vim-markdown',
    config = function()
      require('plugins.vim-markdown')
    end,
  })
  use('nelstrom/vim-visual-star-search')
  use('RRethy/vim-illuminate')

  -- TreeSitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end,
  })
  use('JoosepAlviste/nvim-ts-context-commentstring')
  use('windwp/nvim-ts-autotag')

  -- Theming, color
  use('kyazdani42/nvim-web-devicons')
  use({
    'glepnir/galaxyline.nvim',
    config = function()
      require('plugins.galaxyline')
    end,
  })
  use('romgrk/barbar.nvim')
  use('theniceboy/nvim-deus')
  use('haishanh/night-owl.vim')
  use('sainnhe/edge')
  use('sainnhe/sonokai')
  use('projekt0n/github-nvim-theme')
  use({ 'rose-pine/neovim', as = 'rose-pine' })
end)
