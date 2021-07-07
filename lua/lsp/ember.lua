local config = require'lspinstall/util'.extract_config('ember')
config.default_config.cmd[1] = './node_modules/.bin/ember-language-server'

require'lspinstall/servers'.ash = vim.tbl_extend('error', config, {
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install @lifeart/ember-language-server@latest
  ]]
})

local lspconfig = require 'lspconfig'
lspconfig.ember.setup {
  cmd = {
    DATA_PATH .. '/lspinstall/ember/node_modules/.bin/ember-language-server',
    '--stdio'
  },
  on_attach = require'lsp'.common_on_attach
}
