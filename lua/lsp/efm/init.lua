require 'lsp.efm.handlers'
require 'lsp.efm.formatting'
local lspconfig = require 'lspconfig'

local on_attach = function(client)
  if client.config.flags then client.config.flags.allow_incremental_sync = true end
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[augroup Format]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd BufWritePost <buffer> lua require'lsp.efm.formatting'.format()]]
    vim.cmd [[augroup END]]
  end
end

-- Language specific efm configs
local lua = require('lsp.efm.lua')
local tsserver = require('lsp.efm.tsserver')
local css = require('lsp.efm.css')

local prettier = {
  formatCommand = string.format(
      'prettier --stdin --stdin-filepath ${INPUT} --tab-width %s', TabSize),
  formatStdin = true
}

lspconfig.efm.setup {
  init_options = {documentFormatting = true},
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern('package.json', '.git/', '.zshrc'),
  filetypes = {
    'lua', 'javascriptreact', 'javascript', 'typescript', 'typescriptreact',
    'html', 'css', 'scss', 'json', 'yaml', 'markdown', 'vue', 'handlebars',
    'graphql'
  },
  settings = {
    rootMarkers = {'package.json', '.git/'},
    languages = {
      lua = lua,
      javascript = tsserver,
      javascriptreact = tsserver,
      typescript = tsserver,
      typescriptreact = tsserver,
      html = {prettier},
      css = css,
      scss = css,
      json = {prettier},
      yaml = {prettier},
      handlebars = {prettier},
      graphql = {prettier}
    }
  }
}

