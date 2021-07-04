require'lspconfig'.gopls.setup {
  cmd = {DATA_PATH .. '/lspinstall/go/gopls'},
  settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}},
  root_dir = require'lspconfig'.util.root_pattern('.git', 'go.mod'),
  init_options = {usePlaceholders = true, completeUnimported = true},
  on_attach = require'lsp'.common_on_attach
}

require('utils').define_augroups({
  _go_format = {
    {'BufWritePre', '*.go', 'lua vim.lsp.buf.formatting_sync(nil,1000)'}
  },
  _go = {
    -- Go generally requires Tabs instead of spaces.
    {'FileType', 'go', 'setlocal tabstop=' .. TabSize},
    {'FileType', 'go', 'setlocal shiftwidth=' .. TabSize},
    {'FileType', 'go', 'setlocal softtabstop=' .. TabSize},
    {'FileType', 'go', 'setlocal noexpandtab'}
  }
})

-- Enhanced Go syntax highlighting
vim.g.go_highlight_array_whitespace_error = 1
vim.g.go_highlight_chan_whitespace_error = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_space_tab_error = 1
vim.g.go_highlight_trailing_whitespace_error = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_build_constraints = 1
-- vim.g.go_highlight_generate_tags = 1
vim.g.go_highlight_string_spellcheck = 2
vim.g.go_highlight_format_strings = 1
vim.g.go_highlight_variable_declarations = 1
vim.g.go_highlight_variable_assignments = 1
vim.g.go_highlight_function_calls = 1