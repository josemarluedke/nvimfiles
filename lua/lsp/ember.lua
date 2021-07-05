local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

local server_name = 'ember'
local bin_name = 'ember-language-server'

configs[server_name] = {
  default_config = {
    cmd = {bin_name, '--stdio'},
    filetypes = {'handlebars', 'typescript', 'javascript'},
    root_dir = util.root_pattern('ember-cli-build.js', '.git')
  },
  docs = {
    description = [[
https://github.com/sveltejs/language-tools/tree/master/packages/language-server
`ember-language-server` can be installed via `npm`:

```sh
npm install -g @lifeart/ember-language-server
```
]],
    default_config = {root_dir = [[root_pattern("ember-cli-build.js", ".git")]]}
  }
}

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
