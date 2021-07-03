vim.cmd('luafile ~/.config/nvim/settings.lua')
require('plugins')

require('vim-settings')
require('colors')
require('key-map')

-- LSP
require('lsp')
require('lsp.css')
require('lsp.js-ts')
require('lsp.json')
require('lsp.lua')
require('lsp.vim')
require('lsp.efm')

-- Plugin configs

require('plugins.compe')
