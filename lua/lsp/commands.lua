local format_timeout = 3000
local format_filetypes = '*'

local M = {}

M.Format = function()
  vim.lsp.buf.format({
    timeout_ms = format_timeout,
    -- check user config to see if we can format on save
    -- filter = function(client)
    --   return LSP.can_client_format(client.name)
    -- end,
  })
end

M.Init = function()
  local augroup_name = 'LspFormat'
  local group = vim.api.nvim_create_augroup(augroup_name, {
    clear = true,
  })

  vim.api.nvim_create_autocmd({'BufWritePre'}, {
    pattern =  {format_filetypes},
    callback = M.Format,
    group = group,
    nested = true,
  })

  vim.cmd([[ command! Format execute "lua require('lsp.commands').Format()" ]])
end

return M
