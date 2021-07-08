local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path
  })
  execute 'packadd packer.nvim'
end

-- Autocompile
vim.cmd 'autocmd BufWritePost init.lua PackerCompile'

return require('packer').startup(function(use)
  -- Package Manager
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use {
    'glepnir/lspsaga.nvim',
    config = function()
      require('plugins.lspsaga')
    end
  }
  -- Autocomplete
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require('plugins.nvim-compe')
    end
  }

  --  use 'SirVer/ultisnips'
  -- Navigation
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('plugins.nvim-tree')
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function()
      require('plugins.telescope')
    end
  }

  -- Convenience
  -- use 'folke/which-key.nvim'
  use 'tpope/vim-abolish'
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.autopairs')
    end
  }
  use {
    'terrortylor/nvim-comment',
    config = function()
      require('plugins.nvim-comment')
    end
  }

  use 'AndrewRadev/splitjoin.vim'

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('plugins.colorizer')
    end
  }
  -- use {'kkoomen/vim-doge', run = ':call doge#install()'}
  --
  -- maybe
  use {
    'akinsho/nvim-toggleterm.lua',
    config = function()
      require('plugins.nvim-toggleterm')
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},

    config = function()
      require('gitsigns').setup()
    end
  }

  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'windwp/nvim-ts-autotag'

  -- Theming
  use 'kyazdani42/nvim-web-devicons'
  use {
    'glepnir/galaxyline.nvim',
    config = function()
      require('plugins.galaxyline')
    end
  }
  use 'romgrk/barbar.nvim'
  -- use 'glepnir/dashboard-nvim'
  use 'theniceboy/nvim-deus'
  use 'haishanh/night-owl.vim'
  use 'sainnhe/edge'
  use 'sainnhe/sonokai'
end)
