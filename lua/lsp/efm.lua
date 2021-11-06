local util = require('lspconfig').util

local lua_format = {
  formatCommand = 'lua-format -i --no-keep-simple-function-one-line --double-quote-to-single-quote --column-limit=' ..
      Lua.formatLineLength .. ' --no-use-tab --indent-width ' .. TabSize,
  formatStdin = true
}

local eslint = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintStdin = true,
  lintFormats = {'%f:%l:%c: %m'},
  lintIgnoreExitCode = true,
  formatCommand = 'eslint_d --stdin --fix-to-stdout --stdin-filename=${INPUT}',
  formatStdin = true
}

local prettier = {
  formatCommand = string.format(
      'prettier --stdin --stdin-filepath ${INPUT} --tab-width %s', TabSize),
  formatStdin = true
}

local languages = {
  lua = {lua_format},
  javascript = {eslint},
  javascriptreact = {eslint},
  typescript = {eslint},
  typescriptreact = {eslint},
  html = {prettier},
  css = {prettier},
  scss = {prettier},
  json = {prettier},
  yaml = {prettier},
  handlebars = {prettier},
  graphql = {prettier}
}

return {
  init_options = {documentFormatting = true, codeAction = true},
  root_dir = util.root_pattern {'.git/', '.'},
  filetypes = vim.tbl_keys(languages),
  settings = {languages = languages}
}
