local M = {}

local _if = function(bool, a, b)
  if bool then
    return a
  else
    return b
  end
end

local format_disabled_var = function()
  return string.format('format_disabled_%s', vim.bo.filetype)
end
local format_options_var = function()
  return string.format('format_options_%s', vim.bo.filetype)
end

local format_options_prettier = {
  tabWidth = 2,
  singleQuote = true,
  trailingComma = 'all',
  configPrecedence = 'prefer-file'
}

vim.g.format_options_typescript = format_options_prettier
vim.g.format_options_javascript = format_options_prettier
vim.g.format_options_typescriptreact = format_options_prettier
vim.g.format_options_javascriptreact = format_options_prettier
vim.g.format_options_json = format_options_prettier
vim.g.format_options_css = format_options_prettier
vim.g.format_options_scss = format_options_prettier
vim.g.format_options_html = format_options_prettier
vim.g.format_options_yaml = format_options_prettier
vim.g.format_options_markdown = format_options_prettier

M.formatToggle = function(value)
  local var = format_disabled_var()
  vim.g[var] = _if(value ~= nil, value, not vim.g[var])
end
vim.cmd [[command! FormatDisable lua require'lsp.efm.formatting'.formatToggle(true)]]
vim.cmd [[command! FormatEnable lua require'lsp.efm.formatting'.formatToggle(false)]]
vim.cmd [[command! FormatToggle lua require'lsp.efm.formatting'.formatToggle()]]

M.format = function()
  if not vim.g[format_disabled_var()] then
    vim.lsp.buf.formatting(vim.g[format_options_var()] or {})
  end
end

return M
