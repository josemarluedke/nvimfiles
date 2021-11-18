local util = require('lspconfig').util

local stylua = {
  formatCommand = 'stylua -s --quote-style AutoPreferSingle --indent-type Spaces --indent-width 2 -',
  formatStdin = true,
}

local eslint = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintStdin = true,
  lintFormats = { '%f:%l:%c: %m' },
  lintIgnoreExitCode = true,
  formatCommand = 'eslint_d --stdin --fix-to-stdout --stdin-filename=${INPUT}',
  formatStdin = true,
}

local prettier = {
  formatCommand = string.format('prettier --stdin --stdin-filepath ${INPUT} --tab-width %s', TabSize),
  formatStdin = true,
}

local languages = {
  lua = { stylua },
  javascript = { eslint },
  javascriptreact = { eslint },
  typescript = { eslint },
  typescriptreact = { eslint },
  html = { prettier },
  css = { prettier },
  scss = { prettier },
  json = { prettier },
  yaml = { prettier },
  handlebars = { prettier },
  graphql = { prettier },
}

return {
  init_options = { documentFormatting = true, codeAction = true },
  root_dir = util.root_pattern('package.json', '.git/', '.zshrc'),
  filetypes = vim.tbl_keys(languages),
  settings = { languages = languages },
}
