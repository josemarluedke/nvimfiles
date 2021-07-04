vim.cmd('luafile ~/.config/nvim/settings.lua')
require('plugins')

require('vim-settings')
require('colors')
require('key-map')
require('auto')

-- LSP
require('lsp')
require('lsp.css')
require('lsp.js-ts')
require('lsp.go')
require('lsp.json')
require('lsp.lua')
require('lsp.vim')
require('lsp.efm')

-- Plugin configs

require('plugins.nvim-compe')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lspsaga')
require('plugins.comment')
require('plugins.galaxyline')